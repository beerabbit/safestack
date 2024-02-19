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
#define debug errs() << "Debug point"  << "\n"
using namespace llvm;
using namespace std;
namespace {
    //전역변수들
    vector<int> table_arr;
    vector<string> table_name;
    GlobalVariable *pxCurrentTCB;
    //
    struct masterCFI_freertos : public ModulePass {
        static char ID;
        masterCFI_freertos() : ModulePass(ID) {}
        bool runOnModule(Module &M) override {
            LLVMContext &Context = M.getContext();
            pxCurrentTCB = M.getNamedGlobal("pxCurrentTCB");

            /*const char *assemblyCode = 
            "ldr r0 , =0x20010000;\
            ldr r1, =0x20010004;\
            str r1, [r0]";
            InlineAsm *inlineAsm = InlineAsm::get(FunctionType::get(Type::getVoidTy(Context), false),
                                    assemblyCode, "", true, false);
            Function *mainFunc = M.getFunction("main");
            if (mainFunc) {
                BasicBlock &entryBlock = mainFunc->getEntryBlock();
                Instruction* firstInstruction = entryBlock.getFirstNonPHIOrDbgOrLifetime();
                IRBuilder<> Builder(Context);
                Builder.SetInsertPoint(firstInstruction);
                Builder.CreateCall(inlineAsm, {});
            }*/
            addMasterForwardFunction(M);
            addMasterBackwardFunction(M);
            getFunctionNameinBC(M);
            addPushBeforeInsertFunctionTable(M);
            
            return false;
        }
        void getFunctionNameinBC(Module &M){
            string fncname = "[";
            errs() << "[";
            for(Function &F : M){
                if(!F.isDeclaration()){
                    string buf = F.getName().str();
                    if( (buf != "Error_Handler") &&(buf != "MasterForward") && (buf != "MasterBackward") && (buf != "__io_putchar") && (buf != "HAL_TIM_PeriodElapsedCallback") && (buf != "forward") && (buf != "backward") && (buf != "SystemClock_Config") && (buf != "MX_I2C1_Init") && (buf != "MX_I2S3_Init") && (buf != "MX_SPI1_Init") && (buf != "MX_USART2_UART_Init") && (buf != "MX_GPIO_Init") ){ // && (buf != "StartTask01")&& (buf != "StartTask02")
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
            LLVMContext &Context = M.getContext();
            FunctionType *FuncType = FunctionType::get(Type::getVoidTy(Context), {}, false);
            Function *MasterFunc = Function::Create(FuncType, GlobalValue::ExternalLinkage, "MasterForward", M);
            BasicBlock *EntryBlock = BasicBlock::Create(Context, "MasterForward_",MasterFunc);
            IRBuilder<> Builder(EntryBlock);
            LLVMContext &FContext = EntryBlock->getContext();

            InlineAsm *asmCode_failcheck = InlineAsm::get(FunctionType::get(Type::getVoidTy(FContext), false),
            "POP {r7, lr};\
            PUSH {r0 - r3};\
            ldr r0, [sp, #16];\
            ldr r1, [r0];\
            push {r0};\
            cmp r1, lr;\
            BNE fail;",
            "", true,false);
            Builder.CreateCall(asmCode_failcheck);
            
            Function *getidxfunc = M.getFunction("getidx");
            if (!getidxfunc) {
                FunctionType *funcType = FunctionType::get(Type::getInt32Ty(M.getContext()), {}, false);
                getidxfunc = Function::Create(funcType, Function::ExternalLinkage, "getidx", &M);
            }
            Function *forwardfunc = M.getFunction("forward");
            if (!forwardfunc) {
                Type *uint32Type = Type::getInt32Ty(M.getContext());
                FunctionType *funcType = FunctionType::get(Type::getVoidTy(M.getContext()), {uint32Type, uint32Type}, false);
                forwardfunc = Function::Create(funcType, Function::ExternalLinkage, "forward", &M);
            }
            CallInst *getidxfunc_inst = Builder.CreateCall(getidxfunc);
            InlineAsm *getAsm = InlineAsm::get(FunctionType::get(Type::getInt32Ty(FContext), false), "pop {r2}; mov $0, r2", "=r", true);
            CallInst *r1Value = Builder.CreateCall(getAsm);
            std::vector<Value*> args;
            args.push_back(r1Value);
            args.push_back(getidxfunc_inst);
            Builder.CreateCall(forwardfunc, args);
            InlineAsm *asmCode_TCB = InlineAsm::get(FunctionType::get(Type::getVoidTy(FContext), false),         
            "pop {r0 -r3, lr};\
            add lr, lr, 4;\
            ldr lr, [lr];\
            cpsie if;\
            BX LR;\
            fail:",
             "", true,false);
            Builder.CreateCall(asmCode_TCB);
            Builder.CreateRetVoid();

        }
        void addMasterBackwardFunction(Module &M){
            
            LLVMContext &Context = M.getContext();
            FunctionType *FuncType = FunctionType::get(Type::getVoidTy(Context), {}, false);
            Function *MasterFunc = Function::Create(FuncType, GlobalValue::ExternalLinkage, "MasterBackward", M);
            BasicBlock *EntryBlock = BasicBlock::Create(Context, "MasterBackward_",MasterFunc);
            IRBuilder<> Builder(EntryBlock);
            InlineAsm *asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(Context), false),"cpsid if; POP {r7, lr}; push {r0}; push {lr}; ","", true,false);
            Builder.CreateCall(asmCode);
            Function *getidxfunc = M.getFunction("getidx");
            if (!getidxfunc) {
                FunctionType *funcType = FunctionType::get(Type::getInt32Ty(M.getContext()), {}, false);
                getidxfunc = Function::Create(funcType, Function::ExternalLinkage, "getidx", &M);
            }
            Function *backwardfunc = M.getFunction("backward");
            if (!backwardfunc) {
                Type *uint32Type = Type::getInt32Ty(Context);
                FunctionType *funcType = FunctionType::get(Type::getInt32Ty(Context), {uint32Type, uint32Type}, false);
                backwardfunc = Function::Create(funcType, Function::ExternalLinkage, "backward", &M);
            }
            CallInst *getidxfunc_inst = Builder.CreateCall(getidxfunc);
            asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(Context), false),"pop {r2}; ","", true,false);
            Builder.CreateCall(asmCode);
            InlineAsm *getAsm = InlineAsm::get(FunctionType::get(Type::getInt32Ty(Context), false), "mov $0, r2", "=r", true);
            CallInst *lrValue = Builder.CreateCall(getAsm);
            std::vector<Value*> args;
            args.push_back(lrValue);
            args.push_back(getidxfunc_inst);
            Builder.CreateCall(backwardfunc, args);
            asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(Context), false),
            "mov lr, r0;\
            pop {r0};\
            cpsie if;\
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
                            string buf = F.getName().str();
                            if ((buf == "a") || (buf == "b") || (buf == "c") ||  (buf == "StartTask01")|| (buf == "StartTask02") ){
                            if (calledFunc && !calledFunc->isIntrinsic() && !calledFunc->isDeclaration() ){           
                                IRBuilder<> builder(callInstr);
                                table_arr.push_back(cnt*4);
                                table_name.push_back(buf + to_string(cnt));
                                InlineAsm *asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(Mcontext), false), buf +"_" + to_string(cnt*4)  +"_FORPUSH:; cpsid if;movw lr, "+ to_string(cnt*4*3) +";movt lr, 0x080C;push {lr}", "", true,false);
                                builder.CreateCall(asmCode);
                                cnt++;
                            }
                            }
                            //걍 call 할 때 지정하는것만으로
                        }
                    }
                }
            }
        }


    };
}

char masterCFI_freertos::ID = 0;
static RegisterPass<masterCFI_freertos> X("masterCFI_freertos", "Split basic blocks based on a specific instruction", false, false);


/*            "ldr r1, =0x20010004;\
            loop:;\
                cmp r1, #0x20010030;\
                beq no_fnd;\
                ldr r2, [r1];\
                cmp r2, r0;\
                beq found;\
                add r1, r1, #4;\
            found:;\

            no_fnd:;\
                ldr r1, =0x20010000;\
                ldr r1, [r1];
                add r1, r1, #1;
                mul r2, r1, #4;
                add r2, r2, #0x20010004;
                str r2, [r0];
                mul r3, r1, #400;
                #r3 -> CFIS initial 여따가 retnaddr 저장*/