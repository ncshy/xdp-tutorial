; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@llvm.compiler.used = appending global [2 x ptr] [ptr @_license, ptr @xdp_drop_func], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @xdp_drop_func(ptr nocapture readnone %0) #0 section "xdp" !dbg !25 {
  call void @llvm.dbg.value(metadata ptr poison, metadata !41, metadata !DIExpression()), !dbg !42
  ret i32 0, !dbg !43
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 11, type: !15, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/tracing01-xdp-simple", checksumkind: CSK_MD5, checksum: "5fc69fdc1699438e153bfe250e8ef2a3")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 5584, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "689c3da77ac6e6dfcbd771fd6706f660")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !{!0}
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 32, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 4)
!19 = !{i32 7, !"Dwarf Version", i32 5}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!24 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)"}
!25 = distinct !DISubprogram(name: "xdp_drop_func", scope: !3, file: !3, line: 6, type: !26, scopeLine: 7, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !40)
!26 = !DISubroutineType(types: !27)
!27 = !{!28, !29}
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5595, size: 192, elements: !31)
!31 = !{!32, !35, !36, !37, !38, !39}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !30, file: !6, line: 5596, baseType: !33, size: 32)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !34, line: 27, baseType: !7)
!34 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!35 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !30, file: !6, line: 5597, baseType: !33, size: 32, offset: 32)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !30, file: !6, line: 5598, baseType: !33, size: 32, offset: 64)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !30, file: !6, line: 5600, baseType: !33, size: 32, offset: 96)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !30, file: !6, line: 5601, baseType: !33, size: 32, offset: 128)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !30, file: !6, line: 5603, baseType: !33, size: 32, offset: 160)
!40 = !{!41}
!41 = !DILocalVariable(name: "ctx", arg: 1, scope: !25, file: !3, line: 6, type: !29)
!42 = !DILocation(line: 0, scope: !25)
!43 = !DILocation(line: 8, column: 2, scope: !25)
