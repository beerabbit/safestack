; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --mtriple=loongarch64 --mattr=+lsx < %s | FileCheck %s

declare <16 x i8> @llvm.loongarch.lsx.vssub.b(<16 x i8>, <16 x i8>)

define <16 x i8> @lsx_vssub_b(<16 x i8> %va, <16 x i8> %vb) nounwind {
; CHECK-LABEL: lsx_vssub_b:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vssub.b $vr0, $vr0, $vr1
; CHECK-NEXT:    ret
entry:
  %res = call <16 x i8> @llvm.loongarch.lsx.vssub.b(<16 x i8> %va, <16 x i8> %vb)
  ret <16 x i8> %res
}

declare <8 x i16> @llvm.loongarch.lsx.vssub.h(<8 x i16>, <8 x i16>)

define <8 x i16> @lsx_vssub_h(<8 x i16> %va, <8 x i16> %vb) nounwind {
; CHECK-LABEL: lsx_vssub_h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vssub.h $vr0, $vr0, $vr1
; CHECK-NEXT:    ret
entry:
  %res = call <8 x i16> @llvm.loongarch.lsx.vssub.h(<8 x i16> %va, <8 x i16> %vb)
  ret <8 x i16> %res
}

declare <4 x i32> @llvm.loongarch.lsx.vssub.w(<4 x i32>, <4 x i32>)

define <4 x i32> @lsx_vssub_w(<4 x i32> %va, <4 x i32> %vb) nounwind {
; CHECK-LABEL: lsx_vssub_w:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vssub.w $vr0, $vr0, $vr1
; CHECK-NEXT:    ret
entry:
  %res = call <4 x i32> @llvm.loongarch.lsx.vssub.w(<4 x i32> %va, <4 x i32> %vb)
  ret <4 x i32> %res
}

declare <2 x i64> @llvm.loongarch.lsx.vssub.d(<2 x i64>, <2 x i64>)

define <2 x i64> @lsx_vssub_d(<2 x i64> %va, <2 x i64> %vb) nounwind {
; CHECK-LABEL: lsx_vssub_d:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vssub.d $vr0, $vr0, $vr1
; CHECK-NEXT:    ret
entry:
  %res = call <2 x i64> @llvm.loongarch.lsx.vssub.d(<2 x i64> %va, <2 x i64> %vb)
  ret <2 x i64> %res
}

declare <16 x i8> @llvm.loongarch.lsx.vssub.bu(<16 x i8>, <16 x i8>)

define <16 x i8> @lsx_vssub_bu(<16 x i8> %va, <16 x i8> %vb) nounwind {
; CHECK-LABEL: lsx_vssub_bu:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vssub.bu $vr0, $vr0, $vr1
; CHECK-NEXT:    ret
entry:
  %res = call <16 x i8> @llvm.loongarch.lsx.vssub.bu(<16 x i8> %va, <16 x i8> %vb)
  ret <16 x i8> %res
}

declare <8 x i16> @llvm.loongarch.lsx.vssub.hu(<8 x i16>, <8 x i16>)

define <8 x i16> @lsx_vssub_hu(<8 x i16> %va, <8 x i16> %vb) nounwind {
; CHECK-LABEL: lsx_vssub_hu:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vssub.hu $vr0, $vr0, $vr1
; CHECK-NEXT:    ret
entry:
  %res = call <8 x i16> @llvm.loongarch.lsx.vssub.hu(<8 x i16> %va, <8 x i16> %vb)
  ret <8 x i16> %res
}

declare <4 x i32> @llvm.loongarch.lsx.vssub.wu(<4 x i32>, <4 x i32>)

define <4 x i32> @lsx_vssub_wu(<4 x i32> %va, <4 x i32> %vb) nounwind {
; CHECK-LABEL: lsx_vssub_wu:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vssub.wu $vr0, $vr0, $vr1
; CHECK-NEXT:    ret
entry:
  %res = call <4 x i32> @llvm.loongarch.lsx.vssub.wu(<4 x i32> %va, <4 x i32> %vb)
  ret <4 x i32> %res
}

declare <2 x i64> @llvm.loongarch.lsx.vssub.du(<2 x i64>, <2 x i64>)

define <2 x i64> @lsx_vssub_du(<2 x i64> %va, <2 x i64> %vb) nounwind {
; CHECK-LABEL: lsx_vssub_du:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vssub.du $vr0, $vr0, $vr1
; CHECK-NEXT:    ret
entry:
  %res = call <2 x i64> @llvm.loongarch.lsx.vssub.du(<2 x i64> %va, <2 x i64> %vb)
  ret <2 x i64> %res
}
