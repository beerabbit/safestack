// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// REQUIRES: aarch64-registered-target
// RUN: %clang_cc1 -triple aarch64-none-linux-gnu -target-feature +sve2p1 -S -O1 -Werror -emit-llvm -o - %s | FileCheck %s
// RUN: %clang_cc1 -triple aarch64-none-linux-gnu -target-feature +sve2p1 -S -O1 -Werror -emit-llvm -o - -x c++ %s | FileCheck %s -check-prefix=CPP-CHECK

#include <arm_sve.h>

// CHECK-LABEL: @test_svptrue_c8(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call target("aarch64.svcount") @llvm.aarch64.sve.ptrue.c8()
// CHECK-NEXT:    ret target("aarch64.svcount") [[TMP0]]
//
// CPP-CHECK-LABEL: @_Z15test_svptrue_c8v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call target("aarch64.svcount") @llvm.aarch64.sve.ptrue.c8()
// CPP-CHECK-NEXT:    ret target("aarch64.svcount") [[TMP0]]
//
svcount_t test_svptrue_c8(void) {
  return svptrue_c8();
}

// CHECK-LABEL: @test_svptrue_c16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call target("aarch64.svcount") @llvm.aarch64.sve.ptrue.c16()
// CHECK-NEXT:    ret target("aarch64.svcount") [[TMP0]]
//
// CPP-CHECK-LABEL: @_Z16test_svptrue_c16v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call target("aarch64.svcount") @llvm.aarch64.sve.ptrue.c16()
// CPP-CHECK-NEXT:    ret target("aarch64.svcount") [[TMP0]]
//
svcount_t test_svptrue_c16(void) {
  return svptrue_c16();
}

// CHECK-LABEL: @test_svptrue_c32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call target("aarch64.svcount") @llvm.aarch64.sve.ptrue.c32()
// CHECK-NEXT:    ret target("aarch64.svcount") [[TMP0]]
//
// CPP-CHECK-LABEL: @_Z16test_svptrue_c32v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call target("aarch64.svcount") @llvm.aarch64.sve.ptrue.c32()
// CPP-CHECK-NEXT:    ret target("aarch64.svcount") [[TMP0]]
//
svcount_t test_svptrue_c32(void) {
  return svptrue_c32();
}

// CHECK-LABEL: @test_svptrue_c64(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call target("aarch64.svcount") @llvm.aarch64.sve.ptrue.c64()
// CHECK-NEXT:    ret target("aarch64.svcount") [[TMP0]]
//
// CPP-CHECK-LABEL: @_Z16test_svptrue_c64v(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call target("aarch64.svcount") @llvm.aarch64.sve.ptrue.c64()
// CPP-CHECK-NEXT:    ret target("aarch64.svcount") [[TMP0]]
//
svcount_t test_svptrue_c64(void) {
  return svptrue_c64();
}
