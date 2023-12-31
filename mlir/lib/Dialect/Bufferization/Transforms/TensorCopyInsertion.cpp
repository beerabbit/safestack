//===- TensorCopyInsertion.cpp - Resolve Bufferization Conflicts w/ Copies ===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/Bufferization/Transforms/Passes.h"

#include "mlir/Dialect/Bufferization/IR/BufferizableOpInterface.h"
#include "mlir/Dialect/Bufferization/IR/Bufferization.h"
#include "mlir/Dialect/Bufferization/Transforms/Bufferize.h"
#include "mlir/Dialect/Bufferization/Transforms/OneShotAnalysis.h"
#include "mlir/Dialect/Bufferization/Transforms/OneShotModuleBufferize.h"
#include "mlir/Dialect/Bufferization/Transforms/Transforms.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"

namespace mlir {
namespace bufferization {
#define GEN_PASS_DEF_TENSORCOPYINSERTION
#include "mlir/Dialect/Bufferization/Transforms/Passes.h.inc"
} // namespace bufferization
} // namespace mlir

using namespace mlir;
using namespace mlir::bufferization;

/// Resolve all operands that are also used inside of repetitive regions of the
/// same op. Such cases are not fully supported by One-Shot Bufferize.
///
/// E.g.:
/// %r = scf.for ... iter_args(%t = %tensor) -> tensor<?xf32> {
///   "some_use"(%tensor)
///   ...
/// }
///
/// Is converted to:
/// %tensor_copy = bufferization.alloc_tensor copy(%tensor)
/// %r = scf.for ... iter_args(%t = %tensor) -> tensor<?xf32> {
///   "some_use"(%tensor_copy)
///   ...
/// }
static void
resolveUsesInRepetitiveRegions(Operation *op,
                               const BufferizationOptions &options) {
  IRRewriter rewriter(op->getContext());
  AnalysisState state(options);

  // Look for repetitive ops (loops).
  op->walk([&](BufferizableOpInterface bufferizableOp) {
    // Skip filtered ops.
    if (!options.isOpAllowed(bufferizableOp.getOperation()))
      return WalkResult::advance();

    // Find all operands that are also used inside of a repetitive region of
    // this op.
    for (OpOperand &opOperand : bufferizableOp->getOpOperands()) {
      Value operand = opOperand.get();
      // Skip non-tensor operands.
      if (!isa<TensorType>(operand.getType()))
        continue;
      // Skip operands that do not bufferize to memory writes.
      if (!bufferizableOp.bufferizesToMemoryWrite(opOperand, state))
        continue;

      // Gather all uses inside repetitive regions.
      SmallVector<OpOperand *> usesInsideRegion;
      for (OpOperand &use : operand.getUses()) {
        Operation *owner = use.getOwner();
        if (!bufferizableOp->isProperAncestor(owner))
          continue;
        for (Region &r : bufferizableOp->getRegions()) {
          if (r.findAncestorOpInRegion(*owner) &&
              bufferizableOp.isRepetitiveRegion(r.getRegionNumber())) {
            usesInsideRegion.push_back(&use);
            break;
          }
        }
      }
      // Nothing to do if the operand is not used inside a repetitive region.
      if (usesInsideRegion.empty())
        continue;

      // Insert a tensor copy and replace all uses inside of repetitive regions.
      rewriter.setInsertionPoint(bufferizableOp);
      auto tensorCopy = rewriter.create<AllocTensorOp>(
          bufferizableOp->getLoc(), cast<TensorType>(operand.getType()),
          /*dynamicSizes=*/ValueRange(),
          /*copy=*/operand, /*memory_space=*/IntegerAttr());
      for (OpOperand *use : usesInsideRegion)
        use->set(tensorCopy);
    }

    return WalkResult::advance();
  });
}

LogicalResult mlir::bufferization::insertTensorCopies(
    Operation *op, const OneShotBufferizationOptions &options,
    BufferizationStatistics *statistics) {
  // Preprocessing: Resolve currently unsupported bufferization cases.
  resolveUsesInRepetitiveRegions(op, options);

  OneShotAnalysisState state(op, options);
  // Run normal One-Shot Bufferize analysis or One-Shot Module Bufferize
  // analysis depending on whether function boundary bufferization is enabled or
  // not.
  if (options.bufferizeFunctionBoundaries) {
    if (failed(analyzeModuleOp(cast<ModuleOp>(op), state, statistics)))
      return failure();
  } else {
    if (failed(analyzeOp(op, state, statistics)))
      return failure();
  }

  if (options.testAnalysisOnly)
    return success();

  return insertTensorCopies(op, state);
}

LogicalResult
mlir::bufferization::insertTensorCopies(Operation *op,
                                        const AnalysisState &state) {
  IRRewriter rewriter(op->getContext());

  WalkResult result = op->walk([&](Operation *op) {
    auto bufferizableOp = state.getOptions().dynCastBufferizableOp(op);
    if (!bufferizableOp)
      return WalkResult::skip();

    // Find inplacability conflicts and resolve them. (Typically with explicit
    // tensor copies in the form of AllocTensorOps.)
    rewriter.setInsertionPoint(op);
    if (failed(bufferizableOp.resolveConflicts(rewriter, state)))
      return WalkResult::interrupt();

    return WalkResult::advance();
  });

  return failure(result.wasInterrupted());
}
