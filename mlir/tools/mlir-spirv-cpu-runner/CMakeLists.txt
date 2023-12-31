set(LLVM_LINK_COMPONENTS
  Linker
)

if (MLIR_ENABLE_SPIRV_CPU_RUNNER)
  message(STATUS "Building SPIR-V CPU runner")

  add_mlir_tool(mlir-spirv-cpu-runner
    mlir-spirv-cpu-runner.cpp
  )

  llvm_update_compile_flags(mlir-spirv-cpu-runner)

  get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)

  target_link_libraries(mlir-spirv-cpu-runner PRIVATE
    ${conversion_libs}
    MLIRAnalysis
    MLIRArithDialect
    MLIRBuiltinToLLVMIRTranslation
    MLIRExecutionEngine
    MLIRFuncDialect
    MLIRGPUDialect
    MLIRIR
    MLIRJitRunner
    MLIRLLVMDialect
    MLIRLLVMToLLVMIRTranslation
    MLIRMemRefDialect
    MLIRParser
    MLIRSPIRVDialect
    MLIRTargetLLVMIRExport
    MLIRTransforms
    MLIRTranslateLib
    MLIRSupport
  )
endif()
