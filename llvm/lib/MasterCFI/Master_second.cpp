#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/InlineAsm.h"
#include <string>
#include <vector>
#include <map>
#define debug errs() << "Debug point" << fordebug++ << "\n"
using namespace llvm;
using namespace std;
namespace {
    //전역변수들
    
    //
    struct Master_secondCFI : public ModulePass {
        static char ID;
        Master_secondCFI() : ModulePass(ID) {}
        bool runOnModule(Module &M) override {
            LLVMContext &context = M.getContext();
            addPushBeforeInsertFunctionTable(M);
            return false;
        }
        void addPushBeforeInsertFunctionTable(Module &M){
            LLVMContext &Mcontext = M.getContext();
            for(Function &F: M){
                int cnt = 0;
                Instruction *Buf;     
                for(BasicBlock &BB : F){
                    if(F.getName() != "MasterForward" && F.getName() != "MasterBackward")
                    if(BB.getTerminator()){
                        if (isa<ReturnInst>(BB.getTerminator())) {
                            IRBuilder<> builder(BB.getTerminator());
                            InlineAsm *asmCode_bl = InlineAsm::get(FunctionType::get(Type::getVoidTy(Mcontext), false), "bl MasterBackward", "", true,false);
                            builder.CreateCall(asmCode_bl);
                        }
                    }
                    
                    for(Instruction &I : BB){
                        CallInst *callInstr = dyn_cast<CallInst>(&I);
                        if(callInstr){
                            Function *calledFunc = callInstr->getCalledFunction();
                            Instruction *Next = I.getNextNode();      
                            errs() << *Next << "\n";
                            if (calledFunc && !calledFunc->isIntrinsic() && !calledFunc->isDeclaration() && Buf != Next ){
                                Buf = Next;
                                IRBuilder<> builder(Next);
                                Function *masterFunction = M.getFunction("MasterForward");     
                                builder.CreateCall(masterFunction);
                            }
                        }
                    }
                }
            }
        }
    };
}

char Master_secondCFI::ID = 0;
static RegisterPass<Master_secondCFI> X("Master_secondCFI", "Split basic blocks based on a specific instruction", false, false);
