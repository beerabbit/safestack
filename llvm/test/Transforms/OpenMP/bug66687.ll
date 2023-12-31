; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --check-attributes --version 3
; RUN: opt < %s -S -passes=openmp-opt | FileCheck %s

source_filename = "bug66687.ll"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define weak void @openmp_kernel() "kernel" {
; CHECK-LABEL: define weak void @openmp_kernel(
; CHECK-SAME: ) #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:    ret void
;
  ret void
}

define weak_odr void @non_openmp_kernel() {
; CHECK-LABEL: define weak_odr void @non_openmp_kernel() {
; CHECK-NEXT:    ret void
;
  ret void
}

!llvm.module.flags = !{!0, !1}
!nvvm.annotations = !{!2, !3}

!0 = !{i32 7, !"openmp", i32 51}
!1 = !{i32 7, !"openmp-device", i32 51}
!2 = !{ptr @openmp_kernel, !"kernel", i32 1}
!3 = !{ptr @non_openmp_kernel, !"kernel", i32 1}
