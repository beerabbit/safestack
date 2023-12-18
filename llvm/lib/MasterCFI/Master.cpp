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
    vector<int> table_arr;
    vector<string> table_name;
    //
    struct masterCFI : public ModulePass {
        static char ID;
        masterCFI() : ModulePass(ID) {}
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
            addMasterForwardFunction(M);
            addMasterBackwardFunction(M);
            getFunctionNameinBC(M);
            addPushBeforeInsertFunctionTable(M);
            
            for(int i=0; i<table_arr.size(); i++){
                    errs() << "[" << table_name[i] << ", ";
                    errs() << table_arr[i] << "],";
            }
            
            return false;
        }
        
        void getFunctionNameinBC(Module &M){
            string fncname = "[";
            errs() << "[";
            for(Function &F : M){
                if(!F.isDeclaration()){
                    string buf = F.getName().str();
                    if((buf != "MasterForward") && (buf != "MasterBackward") && (buf != "__io_putchar") && (buf != "HAL_TIM_PeriodElapsedCallback")){
                        fncname = fncname + "\"" + F.getName().str() + "\",";
                        errs() << "\""<< F.getName() << "\",";
                    }
                }
            }
            fncname.pop_back();
            fncname = fncname + "]";
            fncname = "fnc = " +fncname;
            system(("echo \'" + fncname + "\' > /home/creaker00/safestack/test/fncname.py").c_str());
            errs() << "]\n";

            
        }

        void addMasterForwardFunction(Module &M){
        /*
        Push {r0}
	    Index = *RAS
	    (int *)RAS--
	    IF IT[3,Index] == LR
            RETNADDR = IT[0, Index]
            Pop {R0}
            JUMP RETNADDR
        */
            LLVMContext &Context = M.getContext();
            FunctionType *FuncType = FunctionType::get(Type::getVoidTy(Context), {}, false);
            Function *MasterFunc = Function::Create(FuncType, GlobalValue::ExternalLinkage, "MasterForward", M);
            BasicBlock *EntryBlock = BasicBlock::Create(Context, "MasterForward_",MasterFunc);
            IRBuilder<> Builder(EntryBlock);
            LLVMContext &FContext = MasterFunc->getContext();
            InlineAsm *asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(FContext), false),
            "PUSH {r0 - r3};\
            ldr r0, [sp, #16];\
            ldr r1, [r0];\
            cmp r1, lr;\
            BNE fail;\
            ldr r1, =0x20010000;\
            ldr r2, [r1];\
            str r0, [r2];\
            add r2, r2, #4;\
            str r2, [r1];\
            pop {r0 -r3, lr};\
            add lr, lr, 4;\
            ldr lr, [lr];\
            BX LR;\
            fail:",
             "", true,false);
            Builder.CreateCall(asmCode);
            Builder.CreateRetVoid();
        }

        void addMasterBackwardFunction(Module &M){
            
        /*
    	Push {R0 - R3}
	    INDEX = [SP-16]
	    IF IT[0, INDEX] == LR
		    RETNADDR = IT[0,INDEX] //R12 register
		    Push Index_A in RAS
		    (int *)RAS++
	        Pop {R0 - R3, lr}
		    JUMP RETNADDR
        */
            LLVMContext &Context = M.getContext();
            FunctionType *FuncType = FunctionType::get(Type::getVoidTy(Context), {}, false);
            Function *MasterFunc = Function::Create(FuncType, GlobalValue::ExternalLinkage, "MasterBackward", M);
            BasicBlock *EntryBlock = BasicBlock::Create(Context, "MasterBackward_",MasterFunc);
            IRBuilder<> Builder(EntryBlock);
            InlineAsm *asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(Context), false),
            "ldr r1, =0x20010000;\
            ldr r2, [r1];\
            sub r2, r2, 4;\
            ldr r3, [r2];\
            add r3, r3, #8;\
            ldr r3, [r3];\
            cmp r3, lr;\
            BNE fail_back;\
            ldr r3, [r2];\
            ldr lr, [r3];\
            str r2, [r1];\
            bx lr;\
            fail_back:",
             "", true,false);
            Builder.CreateCall(asmCode);
            Builder.CreateRetVoid();
        }

        void addPushBeforeInsertFunctionTable(Module &M){
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
                                InlineAsm *asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(Mcontext), false), Tname +"_" + to_string(cnt*4)  +"_FORPUSH:;movw lr, "+ to_string(cnt*4*3) +";movt lr, 0x080C;push {lr}", "", true,false);
                                builder.CreateCall(asmCode);
                                cnt++;
                            }
                        }
                    }
                }
            }
        }


    };
}

char masterCFI::ID = 0;
static RegisterPass<masterCFI> X("masterCFI", "Split basic blocks based on a specific instruction", false, false);
