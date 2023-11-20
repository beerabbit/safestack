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
#define debug errs() << "Debug point" << "\n";
using namespace llvm;
using namespace std;
namespace {
    //전역변수들
    vector<int> table_arr;
    vector<string> table_name;
    //
    struct Safestacktest : public ModulePass {
        static char ID;
        Safestacktest() : ModulePass(ID) {}
        bool runOnModule(Module &M) override {
            LLVMContext &Context = M.getContext();
            const char *assemblyCode = "ldr r0 , =0x20010000; ldr r1, =0x20010004; str r1, [r0]";
            InlineAsm *inlineAsm = InlineAsm::get(FunctionType::get(Type::getVoidTy(Context), false),
                                    assemblyCode, "", true, false);
            Function *mainFunc = M.getFunction("main");
            if (mainFunc) {
                BasicBlock &entryBlock = mainFunc->getEntryBlock();
                Instruction* firstInstruction = entryBlock.getFirstNonPHIOrDbgOrLifetime();
                IRBuilder<> Builder(Context);
                Builder.SetInsertPoint(firstInstruction);
                Builder.CreateCall(inlineAsm, {});
            }
            InsertPushForShadowStack(M);
            return false;
        }
        
        void InsertPushForShadowStack(Module &M){
            LLVMContext &Mcontext = M.getContext();
            int cnt = 0;
            for(Function &F: M){
                for(BasicBlock &BB : F){
                    for(Instruction &I : BB){
                        CallInst *callInstr = dyn_cast<CallInst>(&I);
                        if(callInstr){
                            Function *calledFunc = callInstr->getCalledFunction();
                            string Tname = F.getName().str();
                            
                            if (calledFunc && !calledFunc->isIntrinsic() && !calledFunc->isDeclaration() ){           
                                errs() << calledFunc->getName().str() << "\n";
                                IRBuilder<> builder(callInstr);
                                table_arr.push_back(cnt*4);
                                table_name.push_back(Tname + to_string(cnt));
                                InlineAsm *asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(Mcontext), false),
                                Tname +"_" + to_string(cnt*4)  +"_FORPUSH:;\
                                push {r0-r2, lr};\
                                movw lr, "+ to_string(cnt*4*3) +";\
                                movt lr, 0x080C;\
                                ldr r1, =0x20010000;\
                                ldr r2, [r1];\
                                str lr, [r2];\
                                add r2, r2, #4;\
                                str r2, [r1];\
                                pop {r0 -r2, lr};\
                                "
                                ,
                                "", true,false);
                                builder.CreateCall(asmCode);
                                cnt++;
                                builder.SetInsertPoint(callInstr->getNextNode());
                                asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(Mcontext), false),
                                "push {r0-r2, lr};\
                                ldr r0, =0x20010000;\
                                ldr r1, [r0];\
                                sub r1, r1, #4;\
                                ldr r2, [r1];\
                                ldr r2, [r2];\ 
                                str r1, [r0];\
                                mov lr, pc;\
                                sub lr, lr, #21;\
                                cmp lr, r2;\
                                BEQ "+Tname +"_" + to_string(cnt*4)  + "_SAFE;\
                                bx lr;" + Tname + "_" + to_string(cnt*4)+"_SAFE:;\
                                pop {r0-r2, lr};\
                                "
                                , "", true,false);
                                builder.CreateCall(asmCode);
                            }
                            
                        }
                    }
                }
            }
        }

        
    };
}

char Safestacktest::ID = 0;
static RegisterPass<Safestacktest> X("Safestacktest", "Split basic blocks based on a specific instruction", false, false);
