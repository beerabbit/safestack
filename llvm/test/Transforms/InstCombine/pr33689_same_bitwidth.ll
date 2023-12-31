; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -passes=instcombine %s -o - | FileCheck %s

; All the "useless" instructions should be removed and we shouldn't crash.

target datalayout = "p:16:16"

%i64_t = type i64

@a = external global i16
@b = external global ptr

define void @f(i1 %cond) {
; CHECK-LABEL: @f(
; CHECK-NEXT:  bb0:
; CHECK-NEXT:    [[T1:%.*]] = alloca i64, align 8
; CHECK-NEXT:    br i1 [[COND:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    unreachable
; CHECK:       bb2:
; CHECK-NEXT:    [[T9:%.*]] = load ptr, ptr @b, align 2
; CHECK-NEXT:    store i16 0, ptr [[T9]], align 2
; CHECK-NEXT:    [[T10:%.*]] = load i32, ptr [[T1]], align 4
; CHECK-NEXT:    [[T11:%.*]] = add i32 [[T10]], -1
; CHECK-NEXT:    store i32 [[T11]], ptr [[T1]], align 4
; CHECK-NEXT:    ret void
;
bb0:
  %t1 = alloca %i64_t
  %useless4 = getelementptr inbounds i16, ptr %t1, i16 undef
  br i1 %cond, label %bb1, label %bb2

bb1:                                              ; preds = %bb0
  %useless6 = insertvalue [1 x ptr] undef, ptr %t1, 0
  %useless7 = insertvalue [1 x ptr] %useless6, ptr null, 0
  %t8 = ptrtoint ptr %t1 to i16
  store i16 %t8, ptr @a
  unreachable

bb2:                                              ; preds = %bb0
  %t9 = load ptr, ptr @b
  store i16 0, ptr %t9
  %t10 = load i32, ptr %t1
  %t11 = sub i32 %t10, 1
  store i32 %t11, ptr %t1
  ret void
}
