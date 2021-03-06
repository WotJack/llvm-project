; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O0 -mtriple=mipsel-linux-gnu -global-isel \
; RUN:     -verify-machineinstrs %s -o -| FileCheck %s
; RUN: llc -O0 -mtriple=mipsel-linux-gnu -mattr=+fp64,+mips32r2 -global-isel \
; RUN:     -verify-machineinstrs %s -o -| FileCheck %s

declare float @llvm.fabs.f32(float)
define float @fabs_f32(float %a) {
; CHECK-LABEL: fabs_f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    abs.s $f0, $f12
; CHECK-NEXT:    jr $ra
; CHECK-NEXT:    nop
entry:
  %0 = call float @llvm.fabs.f32(float %a)
  ret float %0
}

declare double @llvm.fabs.f64(double)
define double @fabs_f64(double %a) {
; CHECK-LABEL: fabs_f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    abs.d $f0, $f12
; CHECK-NEXT:    jr $ra
; CHECK-NEXT:    nop
entry:
  %0 = call double @llvm.fabs.f64(double %a)
  ret double %0
}
