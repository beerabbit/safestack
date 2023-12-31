; RUN:  llc -amdgpu-scalarize-global-loads=false  -mtriple=amdgcn -verify-machineinstrs < %s | FileCheck -allow-deprecated-dag-overlap -check-prefix=GCN -check-prefix=GCN-NOHSA -check-prefix=SI-NOHSA -check-prefix=FUNC %s
; RUN:  llc -amdgpu-scalarize-global-loads=false  -mtriple=amdgcn--amdhsa -mcpu=kaveri -verify-machineinstrs < %s | FileCheck -allow-deprecated-dag-overlap -check-prefix=GCN -check-prefix=GCN-HSA -check-prefix=GCNX3-HSA -check-prefix=FUNC %s
; RUN:  llc -amdgpu-scalarize-global-loads=false  -mtriple=amdgcn -mcpu=tonga -mattr=-flat-for-global -verify-machineinstrs < %s | FileCheck -allow-deprecated-dag-overlap -check-prefix=GCN -check-prefix=GCN-NOHSA -check-prefix=GCNX3-NOHSA -check-prefix=FUNC %s
; RUN:  llc -amdgpu-scalarize-global-loads=false  -march=r600 -mcpu=redwood < %s | FileCheck -allow-deprecated-dag-overlap -check-prefix=EG -check-prefix=FUNC %s
; RUN:  llc -amdgpu-scalarize-global-loads=false  -mtriple=amdgcn--amdhsa -mcpu=gfx900 -verify-machineinstrs < %s | FileCheck -allow-deprecated-dag-overlap -check-prefix=GCN -check-prefix=GCN-HSA -check-prefix=FUNC %s
; RUN:  llc -amdgpu-scalarize-global-loads=false  -mtriple=amdgcn--amdhsa -mcpu=gfx908 -verify-machineinstrs < %s | FileCheck -allow-deprecated-dag-overlap -check-prefix=GCN -check-prefix=GCN-HSA -check-prefix=FUNC %s

; FUNC-LABEL: {{^}}global_load_i32:
; GCN-NOHSA: buffer_load_dword v{{[0-9]+}}
; GCN-HSA: {{flat|global}}_load_dword

; EG: VTX_READ_32 T{{[0-9]+}}.X, T{{[0-9]+}}.X, 0
define amdgpu_kernel void @global_load_i32(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
entry:
  %ld = load i32, ptr addrspace(1) %in
  store i32 %ld, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_load_v2i32:
; GCN-NOHSA: buffer_load_dwordx2
; GCN-HSA: {{flat|global}}_load_dwordx2

; EG: VTX_READ_64
define amdgpu_kernel void @global_load_v2i32(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
entry:
  %ld = load <2 x i32>, ptr addrspace(1) %in
  store <2 x i32> %ld, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_load_v3i32:
; SI-NOHSA: buffer_load_dwordx4
; GCNX3-NOHSA: buffer_load_dwordx3
; GCNX3-HSA: {{flat|global}}_load_dwordx3

; EG: VTX_READ_128
define amdgpu_kernel void @global_load_v3i32(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
entry:
  %ld = load <3 x i32>, ptr addrspace(1) %in
  store <3 x i32> %ld, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_load_v4i32:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4

; EG: VTX_READ_128
define amdgpu_kernel void @global_load_v4i32(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
entry:
  %ld = load <4 x i32>, ptr addrspace(1) %in
  store <4 x i32> %ld, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_load_v8i32:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4

; EG: VTX_READ_128
; EG: VTX_READ_128
define amdgpu_kernel void @global_load_v8i32(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
entry:
  %ld = load <8 x i32>, ptr addrspace(1) %in
  store <8 x i32> %ld, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_load_v9i32:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dword
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dword
define amdgpu_kernel void @global_load_v9i32(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
entry:
  %ld = load <9 x i32>, ptr addrspace(1) %in
  store <9 x i32> %ld, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_load_v10i32:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx2
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx2
define amdgpu_kernel void @global_load_v10i32(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
entry:
  %ld = load <10 x i32>, ptr addrspace(1) %in
  store <10 x i32> %ld, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_load_v11i32:
; SI-NOHSA: buffer_load_dwordx4
; SI-NOHSA: buffer_load_dwordx4
; SI-NOHSA: buffer_load_dwordx4
; GCNX3-NOHSA: buffer_load_dwordx4
; GCNX3-NOHSA: buffer_load_dwordx4
; GCNX3-NOHSA: buffer_load_dwordx3
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx3
define amdgpu_kernel void @global_load_v11i32(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
entry:
  %ld = load <11 x i32>, ptr addrspace(1) %in
  store <11 x i32> %ld, ptr addrspace(1) %out
  ret void
}


; FUNC-LABEL: {{^}}global_load_v12i32:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
define amdgpu_kernel void @global_load_v12i32(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
entry:
  %ld = load <12 x i32>, ptr addrspace(1) %in
  store <12 x i32> %ld, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_load_v16i32:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4

; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4

; EG: VTX_READ_128
; EG: VTX_READ_128
; EG: VTX_READ_128
; EG: VTX_READ_128
define amdgpu_kernel void @global_load_v16i32(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
entry:
  %ld = load <16 x i32>, ptr addrspace(1) %in
  store <16 x i32> %ld, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_zextload_i32_to_i64:
; GCN-NOHSA-DAG: buffer_load_dword v[[LO:[0-9]+]],
; GCN-HSA-DAG: {{flat|global}}_load_dword v[[LO:[0-9]+]],
; GCN-DAG: v_mov_b32_e32 v[[HI:[0-9]+]], 0{{$}}

; GCN-NOHSA: buffer_store_dwordx2 v[[[LO]]:[[HI]]]
; GCN-HSA: {{flat|global}}_store_dwordx2 v{{.+}}, v[[[LO]]:[[HI]]]

; EG: MEM_RAT_CACHELESS STORE_RAW T{{[0-9]+}}.XY
define amdgpu_kernel void @global_zextload_i32_to_i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load i32, ptr addrspace(1) %in
  %ext = zext i32 %ld to i64
  store i64 %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_sextload_i32_to_i64:
; GCN-NOHSA: buffer_load_dword v[[LO:[0-9]+]]
; GCN-HSA: {{flat|global}}_load_dword v[[LO:[0-9]+]]
; GCN: v_ashrrev_i32_e32 v[[HI:[0-9]+]], 31, v[[LO]]
; GCN-NOHSA: buffer_store_dwordx2 v[[[LO]]:[[HI]]]
; GCN-HSA: {{flat|global}}_store_dwordx2 v{{.+}}, v[[[LO]]:[[HI]]]


; EG: MEM_RAT
; EG: VTX_READ_32
; EG: ASHR {{[* ]*}}T{{[0-9]\.[XYZW]}}, T{{[0-9]\.[XYZW]}},  literal.
; EG: 31
define amdgpu_kernel void @global_sextload_i32_to_i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load i32, ptr addrspace(1) %in
  %ext = sext i32 %ld to i64
  store i64 %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_zextload_v1i32_to_v1i64:
; GCN-NOHSA: buffer_load_dword
; GCN-NOHSA: buffer_store_dwordx2

; GCN-HSA: {{flat|global}}_load_dword
; GCN-HSA: {{flat|global}}_store_dwordx2
define amdgpu_kernel void @global_zextload_v1i32_to_v1i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <1 x i32>, ptr addrspace(1) %in
  %ext = zext <1 x i32> %ld to <1 x i64>
  store <1 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_sextload_v1i32_to_v1i64:
; GCN-NOHSA: buffer_load_dword v[[LO:[0-9]+]]
; GCN-HSA: {{flat|global}}_load_dword v[[LO:[0-9]+]]
; GCN: v_ashrrev_i32_e32 v[[HI:[0-9]+]], 31, v[[LO]]
; GCN-NOHSA: buffer_store_dwordx2 v[[[LO]]:[[HI]]]
; GCN-HSA: {{flat|global}}_store_dwordx2 v{{.+}}, v[[[LO]]:[[HI]]]
define amdgpu_kernel void @global_sextload_v1i32_to_v1i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <1 x i32>, ptr addrspace(1) %in
  %ext = sext <1 x i32> %ld to <1 x i64>
  store <1 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_zextload_v2i32_to_v2i64:
; GCN-NOHSA: buffer_load_dwordx2
; GCN-NOHSA: buffer_store_dwordx4

; GCN-HSA: {{flat|global}}_load_dwordx2
; GCN-HSA: {{flat|global}}_store_dwordx4
define amdgpu_kernel void @global_zextload_v2i32_to_v2i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <2 x i32>, ptr addrspace(1) %in
  %ext = zext <2 x i32> %ld to <2 x i64>
  store <2 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_sextload_v2i32_to_v2i64:
; GCN-NOHSA: buffer_load_dwordx2
; GCN-HSA: {{flat|global}}_load_dwordx2

; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32

; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
define amdgpu_kernel void @global_sextload_v2i32_to_v2i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <2 x i32>, ptr addrspace(1) %in
  %ext = sext <2 x i32> %ld to <2 x i64>
  store <2 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_zextload_v4i32_to_v4i64:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4

; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_store_dwordx4
; GCN-HSA: {{flat|global}}_store_dwordx4
define amdgpu_kernel void @global_zextload_v4i32_to_v4i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <4 x i32>, ptr addrspace(1) %in
  %ext = zext <4 x i32> %ld to <4 x i64>
  store <4 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_sextload_v4i32_to_v4i64:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4

; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32

; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
define amdgpu_kernel void @global_sextload_v4i32_to_v4i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <4 x i32>, ptr addrspace(1) %in
  %ext = sext <4 x i32> %ld to <4 x i64>
  store <4 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_zextload_v8i32_to_v8i64:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4

; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4

; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
define amdgpu_kernel void @global_zextload_v8i32_to_v8i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <8 x i32>, ptr addrspace(1) %in
  %ext = zext <8 x i32> %ld to <8 x i64>
  store <8 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_sextload_v8i32_to_v8i64:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4

; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4

; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32

; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
define amdgpu_kernel void @global_sextload_v8i32_to_v8i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <8 x i32>, ptr addrspace(1) %in
  %ext = sext <8 x i32> %ld to <8 x i64>
  store <8 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_sextload_v16i32_to_v16i64:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4

; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4


; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
define amdgpu_kernel void @global_sextload_v16i32_to_v16i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <16 x i32>, ptr addrspace(1) %in
  %ext = sext <16 x i32> %ld to <16 x i64>
  store <16 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_zextload_v16i32_to_v16i64
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4

; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4

; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4

; GCN-HSA: {{flat|global}}_store_dwordx4
; GCN-HSA: {{flat|global}}_store_dwordx4
; GCN-HSA: {{flat|global}}_store_dwordx4
; GCN-HSA: {{flat|global}}_store_dwordx4
; GCN-HSA: {{flat|global}}_store_dwordx4
; GCN-HSA: {{flat|global}}_store_dwordx4
; GCN-HSA: {{flat|global}}_store_dwordx4
; GCN-HSA: {{flat|global}}_store_dwordx4
define amdgpu_kernel void @global_zextload_v16i32_to_v16i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <16 x i32>, ptr addrspace(1) %in
  %ext = zext <16 x i32> %ld to <16 x i64>
  store <16 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_sextload_v32i32_to_v32i64:

; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA-DAG: buffer_load_dwordx4

; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4

; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32
; GCN-DAG: v_ashrrev_i32

; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4

; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4

; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4

; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4
; GCN-NOHSA: buffer_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

define amdgpu_kernel void @global_sextload_v32i32_to_v32i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <32 x i32>, ptr addrspace(1) %in
  %ext = sext <32 x i32> %ld to <32 x i64>
  store <32 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_zextload_v32i32_to_v32i64:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4

; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4


; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4

; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4

; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4

; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4


; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
define amdgpu_kernel void @global_zextload_v32i32_to_v32i64(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <32 x i32>, ptr addrspace(1) %in
  %ext = zext <32 x i32> %ld to <32 x i64>
  store <32 x i64> %ext, ptr addrspace(1) %out
  ret void
}

; FUNC-LABEL: {{^}}global_load_v32i32:
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4
; GCN-NOHSA: buffer_load_dwordx4

; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4
; GCN-HSA: {{flat|global}}_load_dwordx4


; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4

; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4

; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4

; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4
; GCN-NOHSA-DAG: buffer_store_dwordx4

; GCN-NOT: accvgpr

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4

; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
; GCN-HSA-DAG: {{flat|global}}_store_dwordx4
define amdgpu_kernel void @global_load_v32i32(ptr addrspace(1) %out, ptr addrspace(1) %in) #0 {
  %ld = load <32 x i32>, ptr addrspace(1) %in
  store <32 x i32> %ld, ptr addrspace(1) %out
  ret void
}

attributes #0 = { nounwind }
