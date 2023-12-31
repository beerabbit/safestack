; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --mtriple=loongarch64 --mattr=+lsx < %s | FileCheck %s

declare <4 x i32> @llvm.loongarch.lsx.vfclass.s(<4 x float>)

define <4 x i32> @lsx_vfclass_s(<4 x float> %va) nounwind {
; CHECK-LABEL: lsx_vfclass_s:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vfclass.s $vr0, $vr0
; CHECK-NEXT:    ret
entry:
  %res = call <4 x i32> @llvm.loongarch.lsx.vfclass.s(<4 x float> %va)
  ret <4 x i32> %res
}

declare <2 x i64> @llvm.loongarch.lsx.vfclass.d(<2 x double>)

define <2 x i64> @lsx_vfclass_d(<2 x double> %va) nounwind {
; CHECK-LABEL: lsx_vfclass_d:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vfclass.d $vr0, $vr0
; CHECK-NEXT:    ret
entry:
  %res = call <2 x i64> @llvm.loongarch.lsx.vfclass.d(<2 x double> %va)
  ret <2 x i64> %res
}
