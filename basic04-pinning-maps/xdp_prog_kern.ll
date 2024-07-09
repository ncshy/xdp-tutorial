; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { ptr, ptr, ptr, ptr }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.datarec = type { i64, i64 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@xdp_stats_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !18
@llvm.compiler.used = appending global [5 x ptr] [ptr @_license, ptr @xdp_abort_func, ptr @xdp_drop_func, ptr @xdp_pass_func, ptr @xdp_stats_map], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_pass_func(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !64 {
  %2 = alloca i32, align 4, !DIAssignID !79
  call void @llvm.dbg.value(metadata ptr %0, metadata !77, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.value(metadata i32 2, metadata !78, metadata !DIExpression()), !dbg !80
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !81
  call void @llvm.dbg.assign(metadata i1 undef, metadata !87, metadata !DIExpression(), metadata !79, metadata ptr %2, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.value(metadata ptr %0, metadata !86, metadata !DIExpression()), !dbg !81
  store i32 2, ptr %2, align 4, !tbaa !93, !DIAssignID !97
  call void @llvm.dbg.assign(metadata i32 2, metadata !87, metadata !DIExpression(), metadata !97, metadata ptr %2, metadata !DIExpression()), !dbg !81
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !98
  %4 = load i32, ptr %3, align 4, !dbg !98, !tbaa !99
  call void @llvm.dbg.value(metadata i32 %4, metadata !88, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !81
  %5 = load i32, ptr %0, align 4, !dbg !101, !tbaa !102
  call void @llvm.dbg.value(metadata i32 %5, metadata !89, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !81
  %6 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #4, !dbg !103
  call void @llvm.dbg.value(metadata ptr %6, metadata !90, metadata !DIExpression()), !dbg !81
  %7 = icmp eq ptr %6, null, !dbg !104
  br i1 %7, label %18, label %8, !dbg !106

8:                                                ; preds = %1
  %9 = zext i32 %5 to i64, !dbg !107
  call void @llvm.dbg.value(metadata i64 %9, metadata !89, metadata !DIExpression()), !dbg !81
  %10 = zext i32 %4 to i64, !dbg !108
  call void @llvm.dbg.value(metadata i64 %10, metadata !88, metadata !DIExpression()), !dbg !81
  %11 = sub nsw i64 %10, %9, !dbg !109
  call void @llvm.dbg.value(metadata i64 %11, metadata !91, metadata !DIExpression()), !dbg !81
  %12 = load i64, ptr %6, align 8, !dbg !110, !tbaa !111
  %13 = add i64 %12, 1, !dbg !110
  store i64 %13, ptr %6, align 8, !dbg !110, !tbaa !111
  %14 = getelementptr inbounds %struct.datarec, ptr %6, i64 0, i32 1, !dbg !114
  %15 = load i64, ptr %14, align 8, !dbg !115, !tbaa !116
  %16 = add i64 %11, %15, !dbg !115
  store i64 %16, ptr %14, align 8, !dbg !115, !tbaa !116
  %17 = load i32, ptr %2, align 4, !dbg !117, !tbaa !93
  br label %18

18:                                               ; preds = %1, %8
  %19 = phi i32 [ %17, %8 ], [ 0, %1 ], !dbg !81
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !118
  ret i32 %19, !dbg !119
}

; Function Attrs: nounwind
define dso_local i32 @xdp_drop_func(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !120 {
  %2 = alloca i32, align 4, !DIAssignID !124
  call void @llvm.dbg.value(metadata ptr %0, metadata !122, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i32 1, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !126
  call void @llvm.dbg.assign(metadata i1 undef, metadata !87, metadata !DIExpression(), metadata !124, metadata ptr %2, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.value(metadata ptr %0, metadata !86, metadata !DIExpression()), !dbg !126
  store i32 1, ptr %2, align 4, !tbaa !93, !DIAssignID !128
  call void @llvm.dbg.assign(metadata i32 1, metadata !87, metadata !DIExpression(), metadata !128, metadata ptr %2, metadata !DIExpression()), !dbg !126
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !129
  %4 = load i32, ptr %3, align 4, !dbg !129, !tbaa !99
  call void @llvm.dbg.value(metadata i32 %4, metadata !88, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !126
  %5 = load i32, ptr %0, align 4, !dbg !130, !tbaa !102
  call void @llvm.dbg.value(metadata i32 %5, metadata !89, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !126
  %6 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #4, !dbg !131
  call void @llvm.dbg.value(metadata ptr %6, metadata !90, metadata !DIExpression()), !dbg !126
  %7 = icmp eq ptr %6, null, !dbg !132
  br i1 %7, label %18, label %8, !dbg !133

8:                                                ; preds = %1
  %9 = zext i32 %5 to i64, !dbg !134
  call void @llvm.dbg.value(metadata i64 %9, metadata !89, metadata !DIExpression()), !dbg !126
  %10 = zext i32 %4 to i64, !dbg !135
  call void @llvm.dbg.value(metadata i64 %10, metadata !88, metadata !DIExpression()), !dbg !126
  %11 = sub nsw i64 %10, %9, !dbg !136
  call void @llvm.dbg.value(metadata i64 %11, metadata !91, metadata !DIExpression()), !dbg !126
  %12 = load i64, ptr %6, align 8, !dbg !137, !tbaa !111
  %13 = add i64 %12, 1, !dbg !137
  store i64 %13, ptr %6, align 8, !dbg !137, !tbaa !111
  %14 = getelementptr inbounds %struct.datarec, ptr %6, i64 0, i32 1, !dbg !138
  %15 = load i64, ptr %14, align 8, !dbg !139, !tbaa !116
  %16 = add i64 %11, %15, !dbg !139
  store i64 %16, ptr %14, align 8, !dbg !139, !tbaa !116
  %17 = load i32, ptr %2, align 4, !dbg !140, !tbaa !93
  br label %18

18:                                               ; preds = %1, %8
  %19 = phi i32 [ %17, %8 ], [ 0, %1 ], !dbg !126
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !141
  ret i32 %19, !dbg !142
}

; Function Attrs: nounwind
define dso_local i32 @xdp_abort_func(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !143 {
  %2 = alloca i32, align 4, !DIAssignID !147
  call void @llvm.dbg.value(metadata ptr %0, metadata !145, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i32 0, metadata !146, metadata !DIExpression()), !dbg !148
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !149
  call void @llvm.dbg.assign(metadata i1 undef, metadata !87, metadata !DIExpression(), metadata !147, metadata ptr %2, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.value(metadata ptr %0, metadata !86, metadata !DIExpression()), !dbg !149
  store i32 0, ptr %2, align 4, !tbaa !93, !DIAssignID !151
  call void @llvm.dbg.assign(metadata i32 0, metadata !87, metadata !DIExpression(), metadata !151, metadata ptr %2, metadata !DIExpression()), !dbg !149
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !152
  %4 = load i32, ptr %3, align 4, !dbg !152, !tbaa !99
  call void @llvm.dbg.value(metadata i32 %4, metadata !88, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !149
  %5 = load i32, ptr %0, align 4, !dbg !153, !tbaa !102
  call void @llvm.dbg.value(metadata i32 %5, metadata !89, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !149
  %6 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #4, !dbg !154
  call void @llvm.dbg.value(metadata ptr %6, metadata !90, metadata !DIExpression()), !dbg !149
  %7 = icmp eq ptr %6, null, !dbg !155
  br i1 %7, label %18, label %8, !dbg !156

8:                                                ; preds = %1
  %9 = zext i32 %5 to i64, !dbg !157
  call void @llvm.dbg.value(metadata i64 %9, metadata !89, metadata !DIExpression()), !dbg !149
  %10 = zext i32 %4 to i64, !dbg !158
  call void @llvm.dbg.value(metadata i64 %10, metadata !88, metadata !DIExpression()), !dbg !149
  %11 = sub nsw i64 %10, %9, !dbg !159
  call void @llvm.dbg.value(metadata i64 %11, metadata !91, metadata !DIExpression()), !dbg !149
  %12 = load i64, ptr %6, align 8, !dbg !160, !tbaa !111
  %13 = add i64 %12, 1, !dbg !160
  store i64 %13, ptr %6, align 8, !dbg !160, !tbaa !111
  %14 = getelementptr inbounds %struct.datarec, ptr %6, i64 0, i32 1, !dbg !161
  %15 = load i64, ptr %14, align 8, !dbg !162, !tbaa !116
  %16 = add i64 %11, %15, !dbg !162
  store i64 %16, ptr %14, align 8, !dbg !162, !tbaa !116
  %17 = load i32, ptr %2, align 4, !dbg !163, !tbaa !93
  br label %18

18:                                               ; preds = %1, %8
  %19 = phi i32 [ %17, %8 ], [ 0, %1 ], !dbg !149
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !164
  ret i32 %19, !dbg !165
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.assign(metadata, metadata, metadata, metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!58, !59, !60, !61, !62}
!llvm.ident = !{!63}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 76, type: !54, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !14, globals: !17, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/basic04-pinning-maps", checksumkind: CSK_MD5, checksum: "642806f2779e310b82bd5871c5934b64")
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
!14 = !{!15, !16}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!17 = !{!0, !18, !46}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !3, line: 16, type: !20, isLocal: false, isDefinition: true)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 11, size: 256, elements: !21)
!21 = !{!22, !28, !32, !41}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !20, file: !3, line: 12, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 192, elements: !26)
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !{!27}
!27 = !DISubrange(count: 6)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !20, file: !3, line: 13, baseType: !29, size: 64, offset: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !31, line: 27, baseType: !7)
!31 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!32 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !20, file: !3, line: 14, baseType: !33, size: 64, offset: 128)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !35, line: 8, size: 128, elements: !36)
!35 = !DIFile(filename: "./common_kern_user.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/basic04-pinning-maps", checksumkind: CSK_MD5, checksum: "af04273c734158c41bba4bd0b2216829")
!36 = !{!37, !40}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !34, file: !35, line: 9, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !31, line: 31, baseType: !39)
!39 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !34, file: !35, line: 10, baseType: !38, size: 64, offset: 64)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !20, file: !3, line: 15, baseType: !42, size: 64, offset: 192)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 160, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 5)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !48, line: 56, type: !49, isLocal: true, isDefinition: true)
!48 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/basic04-pinning-maps", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DISubroutineType(types: !51)
!51 = !{!15, !15, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 32, elements: !56)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !{!57}
!57 = !DISubrange(count: 4)
!58 = !{i32 7, !"Dwarf Version", i32 5}
!59 = !{i32 2, !"Debug Info Version", i32 3}
!60 = !{i32 1, !"wchar_size", i32 4}
!61 = !{i32 7, !"frame-pointer", i32 2}
!62 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!63 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)"}
!64 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 53, type: !65, scopeLine: 54, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !76)
!65 = !DISubroutineType(types: !66)
!66 = !{!25, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5595, size: 192, elements: !69)
!69 = !{!70, !71, !72, !73, !74, !75}
!70 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !68, file: !6, line: 5596, baseType: !30, size: 32)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !68, file: !6, line: 5597, baseType: !30, size: 32, offset: 32)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !68, file: !6, line: 5598, baseType: !30, size: 32, offset: 64)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !68, file: !6, line: 5600, baseType: !30, size: 32, offset: 96)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !68, file: !6, line: 5601, baseType: !30, size: 32, offset: 128)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !68, file: !6, line: 5603, baseType: !30, size: 32, offset: 160)
!76 = !{!77, !78}
!77 = !DILocalVariable(name: "ctx", arg: 1, scope: !64, file: !3, line: 53, type: !67)
!78 = !DILocalVariable(name: "action", scope: !64, file: !3, line: 55, type: !30)
!79 = distinct !DIAssignID()
!80 = !DILocation(line: 0, scope: !64)
!81 = !DILocation(line: 0, scope: !82, inlinedAt: !92)
!82 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !3, file: !3, line: 26, type: !83, scopeLine: 27, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !85)
!83 = !DISubroutineType(types: !84)
!84 = !{!30, !67, !30}
!85 = !{!86, !87, !88, !89, !90, !91}
!86 = !DILocalVariable(name: "ctx", arg: 1, scope: !82, file: !3, line: 26, type: !67)
!87 = !DILocalVariable(name: "action", arg: 2, scope: !82, file: !3, line: 26, type: !30)
!88 = !DILocalVariable(name: "data_end", scope: !82, file: !3, line: 28, type: !15)
!89 = !DILocalVariable(name: "data", scope: !82, file: !3, line: 29, type: !15)
!90 = !DILocalVariable(name: "rec", scope: !82, file: !3, line: 35, type: !33)
!91 = !DILocalVariable(name: "bytes", scope: !82, file: !3, line: 40, type: !38)
!92 = distinct !DILocation(line: 57, column: 9, scope: !64)
!93 = !{!94, !94, i64 0}
!94 = !{!"int", !95, i64 0}
!95 = !{!"omnipotent char", !96, i64 0}
!96 = !{!"Simple C/C++ TBAA"}
!97 = distinct !DIAssignID()
!98 = !DILocation(line: 28, column: 38, scope: !82, inlinedAt: !92)
!99 = !{!100, !94, i64 4}
!100 = !{!"xdp_md", !94, i64 0, !94, i64 4, !94, i64 8, !94, i64 12, !94, i64 16, !94, i64 20}
!101 = !DILocation(line: 29, column: 38, scope: !82, inlinedAt: !92)
!102 = !{!100, !94, i64 0}
!103 = !DILocation(line: 35, column: 24, scope: !82, inlinedAt: !92)
!104 = !DILocation(line: 36, column: 7, scope: !105, inlinedAt: !92)
!105 = distinct !DILexicalBlock(scope: !82, file: !3, line: 36, column: 6)
!106 = !DILocation(line: 36, column: 6, scope: !82, inlinedAt: !92)
!107 = !DILocation(line: 29, column: 27, scope: !82, inlinedAt: !92)
!108 = !DILocation(line: 28, column: 27, scope: !82, inlinedAt: !92)
!109 = !DILocation(line: 40, column: 25, scope: !82, inlinedAt: !92)
!110 = !DILocation(line: 46, column: 17, scope: !82, inlinedAt: !92)
!111 = !{!112, !113, i64 0}
!112 = !{!"datarec", !113, i64 0, !113, i64 8}
!113 = !{!"long long", !95, i64 0}
!114 = !DILocation(line: 47, column: 7, scope: !82, inlinedAt: !92)
!115 = !DILocation(line: 47, column: 16, scope: !82, inlinedAt: !92)
!116 = !{!112, !113, i64 8}
!117 = !DILocation(line: 49, column: 9, scope: !82, inlinedAt: !92)
!118 = !DILocation(line: 50, column: 1, scope: !82, inlinedAt: !92)
!119 = !DILocation(line: 57, column: 2, scope: !64)
!120 = distinct !DISubprogram(name: "xdp_drop_func", scope: !3, file: !3, line: 61, type: !65, scopeLine: 62, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !121)
!121 = !{!122, !123}
!122 = !DILocalVariable(name: "ctx", arg: 1, scope: !120, file: !3, line: 61, type: !67)
!123 = !DILocalVariable(name: "action", scope: !120, file: !3, line: 63, type: !30)
!124 = distinct !DIAssignID()
!125 = !DILocation(line: 0, scope: !120)
!126 = !DILocation(line: 0, scope: !82, inlinedAt: !127)
!127 = distinct !DILocation(line: 65, column: 9, scope: !120)
!128 = distinct !DIAssignID()
!129 = !DILocation(line: 28, column: 38, scope: !82, inlinedAt: !127)
!130 = !DILocation(line: 29, column: 38, scope: !82, inlinedAt: !127)
!131 = !DILocation(line: 35, column: 24, scope: !82, inlinedAt: !127)
!132 = !DILocation(line: 36, column: 7, scope: !105, inlinedAt: !127)
!133 = !DILocation(line: 36, column: 6, scope: !82, inlinedAt: !127)
!134 = !DILocation(line: 29, column: 27, scope: !82, inlinedAt: !127)
!135 = !DILocation(line: 28, column: 27, scope: !82, inlinedAt: !127)
!136 = !DILocation(line: 40, column: 25, scope: !82, inlinedAt: !127)
!137 = !DILocation(line: 46, column: 17, scope: !82, inlinedAt: !127)
!138 = !DILocation(line: 47, column: 7, scope: !82, inlinedAt: !127)
!139 = !DILocation(line: 47, column: 16, scope: !82, inlinedAt: !127)
!140 = !DILocation(line: 49, column: 9, scope: !82, inlinedAt: !127)
!141 = !DILocation(line: 50, column: 1, scope: !82, inlinedAt: !127)
!142 = !DILocation(line: 65, column: 2, scope: !120)
!143 = distinct !DISubprogram(name: "xdp_abort_func", scope: !3, file: !3, line: 69, type: !65, scopeLine: 70, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !144)
!144 = !{!145, !146}
!145 = !DILocalVariable(name: "ctx", arg: 1, scope: !143, file: !3, line: 69, type: !67)
!146 = !DILocalVariable(name: "action", scope: !143, file: !3, line: 71, type: !30)
!147 = distinct !DIAssignID()
!148 = !DILocation(line: 0, scope: !143)
!149 = !DILocation(line: 0, scope: !82, inlinedAt: !150)
!150 = distinct !DILocation(line: 73, column: 9, scope: !143)
!151 = distinct !DIAssignID()
!152 = !DILocation(line: 28, column: 38, scope: !82, inlinedAt: !150)
!153 = !DILocation(line: 29, column: 38, scope: !82, inlinedAt: !150)
!154 = !DILocation(line: 35, column: 24, scope: !82, inlinedAt: !150)
!155 = !DILocation(line: 36, column: 7, scope: !105, inlinedAt: !150)
!156 = !DILocation(line: 36, column: 6, scope: !82, inlinedAt: !150)
!157 = !DILocation(line: 29, column: 27, scope: !82, inlinedAt: !150)
!158 = !DILocation(line: 28, column: 27, scope: !82, inlinedAt: !150)
!159 = !DILocation(line: 40, column: 25, scope: !82, inlinedAt: !150)
!160 = !DILocation(line: 46, column: 17, scope: !82, inlinedAt: !150)
!161 = !DILocation(line: 47, column: 7, scope: !82, inlinedAt: !150)
!162 = !DILocation(line: 47, column: 16, scope: !82, inlinedAt: !150)
!163 = !DILocation(line: 49, column: 9, scope: !82, inlinedAt: !150)
!164 = !DILocation(line: 50, column: 1, scope: !82, inlinedAt: !150)
!165 = !DILocation(line: 73, column: 2, scope: !143)
