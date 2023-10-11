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
    map<string, string> mapForPushIndex;
    string buf;
    GlobalVariable *ret_table;
    
    //
    struct masterCFI : public ModulePass {
        static char ID;
        masterCFI() : ModulePass(ID) {}
        bool runOnModule(Module &M) override {
            LLVMContext &context = M.getContext();
            Type *voidPtrType = Type::getInt8PtrTy(context);
            Type *intType = Type::getInt32Ty(context);
            getFunctionNameinBC(M);
            makeIndexforCallInstruction(M);
            addIndexBeforeCallFunction(M);
            for(auto k : mapForPushIndex){
                errs() << k.first << " " << k.second << "\n";
            }
            return false;
        }
        
        void getFunctionNameinBC(Module &M){
            for(Function &F : M){
                if(!F.isDeclaration()){
                    errs() << F.getName() << "\n";
                }
            }
        }

        void makeIndexforCallInstruction(Module &M){
            int calleeIndex = 0;
            LLVMContext &Mcontext = M.getContext();
            for(Function &F: M){
                for(BasicBlock &BB : F){
                    for(Instruction &I : BB){
                        CallInst *callInstr = dyn_cast<CallInst>(&I);
                        if(callInstr){
                            Function *calledFunc = callInstr->getCalledFunction();
                            if (calledFunc && !calledFunc->isIntrinsic()){          
                                string calleeName = F.getName().str();
                                string callingName = calledFunc->getName().str();
                                if(mapForPushIndex.find(calleeName) != mapForPushIndex.end()){
                                    mapForPushIndex[calleeName] = callingName;
                                }
                                else{
                                    calleeName = calleeName + "_" + to_string(calleeIndex);
                                    calleeIndex++;
                                    mapForPushIndex[calleeName] = callingName;
                                }
                                
                            }
                        }
                    }
                }
            }
        }
        void addMasterBackwardFunction(){

        }
        void addMasterForwardFunction(){

        }
        void addIndexBeforeCallFunction(Module &M){
            LLVMContext &Mcontext = M.getContext();
            for(Function &F: M){
                for(BasicBlock &BB : F){
                    for(Instruction &I : BB){
                        CallInst *callInstr = dyn_cast<CallInst>(&I);
                        if(callInstr){
                            Function *calledFunc = callInstr->getCalledFunction();
                            if (calledFunc && !calledFunc->isIntrinsic()){           
                                IRBuilder<> builder(callInstr);
                                InlineAsm *asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(Mcontext), false), "mov lr, 0", "", true,false);
                                builder.CreateCall(asmCode);
                                InlineAsm *asmCode1 = InlineAsm::get(FunctionType::get(Type::getVoidTy(Mcontext), false), "push {lr}", "", true,false);
                                builder.CreateCall(asmCode1);
                            }
                        }
                    }
                }
            }
        }

        void addLabelForTableReturn(){

        }
        /*void saveFunctionAddress(Module &M){
            LLVMContext &context = M.getContext();
            GlobalVariable *function_return = new GlobalVariable(M, Type::getInt32Ty(context), false, GlobalValue::ExternalLinkage, ConstantInt::get(Type::getInt32Ty(context), 1), "function_return");
            for(Function &F : M){
                for(BasicBlock &BB : F){
                    if(&F.getEntryBlock() == &BB){
                        Instruction *First = BB.getFirstNonPHIOrDbgOrLifetime();
                        IRBuilder<> builder(First);
                        BasicBlock *EntryBB = &BB;
                        Value *BBAddress = BlockAddress::get(EntryBB->getgetNextNode);
                        builder.CreateStore(BBAddress, function_return);
                        errs() << *BBAddress << "\n";
                    }
                }
            }
        }
         void getReturnAddressFromLabel(Module &M){
            LLVMContext &Context = M.getContext();
            Type *Int32Ty = Type::getInt32Ty(Context);
            for(Function &F : M){
                for(BasicBlock &BB : F){
                    for(Instruction &I : BB){
                        CallInst *callInstr = dyn_cast<CallInst>(&I);
                        if(callInstr){
                            Function *calledFunc = callInstr->getCalledFunction();
                            if (calledFunc && !calledFunc->isIntrinsic()){           
                                IRBuilder<> Builder(&I);
                                BasicBlock *NextBB = BB.getNextNode();
                                Value *FunctionReturnPtr = BlockAddress::get(NextBB->getParent(),NextBB);
                                Value *RetTablePtr = Builder.CreateGEP(ArrayType::get(Int32Ty, 30), ret_table, {ConstantInt::get(Int32Ty, 0), ConstantInt::get(Int32Ty, 0)}, "");
                                Builder.CreateStore(FunctionReturnPtr, ret_table);
                                //RETURNADDRESS 를 저장하기 위해서 어떤식으로 되는지 보려고 전역변수에 잠깐 테스트함
                            }
                        }
                    }
                }
            }
        }

        void makeLabelForSplitFunction(Module &M){
            int call_count = 0;
            for (Function &F : M) {
                LLVMContext &Fcontext = F.getContext();
                if(F.empty()){
                    continue;                    
                }
                else{
                    BasicBlock &entryBlock = F.getEntryBlock();
                    Instruction &firstInstr = entryBlock.front();
                    IRBuilder<> builder(&firstInstr);
                    string label_name = F.getName().str();
                    InlineAsm *asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(Fcontext), false), "label_" + label_name + "_Entry" + ":", "", true,false);
                    builder.CreateCall(asmCode, {});
                }
                for(BasicBlock &BB : F){
                    for(Instruction &I : BB){
                        CallInst *callInstr = dyn_cast<CallInst>(&I);
                        if(callInstr){
                            Function *calledFunc = callInstr->getCalledFunction();
                            
                            if (calledFunc && !calledFunc->isIntrinsic()) {
                                IRBuilder<> builder(callInstr);
                                StringRef name = calledFunc->getName();
                                // Insert the label
                                string label_name = F.getName().str();
                                InlineAsm *asmCode = InlineAsm::get(FunctionType::get(Type::getVoidTy(Fcontext), false), "label_" + label_name + to_string(call_count) + "_RETURN:", "", true,false);
                                CallInst::Create(asmCode, "", callInstr->getNextNode());
                                call_count++;
                            }
                        }
                    }
                }
            }
        }
            
        void splitFunctionForReturnAddress(Module &M){
            for(Function &F : M){
                for(BasicBlock &BBs : F){
                    BasicBlock* BB = &BBs;
                    for(BasicBlock::iterator I = BB->begin(), E = BB->end(); I != E; ++I){
                        string instruction_asm;
                        llvm::raw_string_ostream(instruction_asm) << *I;
                        if (instruction_asm == buf){
                            errs() << "SAME" << "\n";
                        }
                        else
                        {
                            if((instruction_asm.find("asm") != std::string::npos) ){
                                int start = instruction_asm.find("\"");
                                string sub_buf = instruction_asm.substr(start+1,instruction_asm.length());
                                start = sub_buf.find("\"");
                                string sub_buf1 = sub_buf.substr(0,start);
                                if(sub_buf1.find("RETURN") != std::string::npos){ //RETN Label 찾기
                                    buf = instruction_asm;
                                    BasicBlock *entry_bb = BB;
                                    BasicBlock *splitted = entry_bb->splitBasicBlock(&*I, sub_buf);
                                    I->removeFromParent();

                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }*/
    };
}

char masterCFI::ID = 0;
static RegisterPass<masterCFI> X("masterCFI", "Split basic blocks based on a specific instruction", false, false);
