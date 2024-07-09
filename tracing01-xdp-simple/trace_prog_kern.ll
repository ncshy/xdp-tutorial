; ModuleID = 'trace_prog_kern.c'
source_filename = "trace_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { ptr, ptr, ptr, ptr }
%struct.xdp_exception_ctx = type { i64, i32, i32, i32 }

@xdp_stats_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !15
@llvm.compiler.used = appending global [3 x ptr] [ptr @_license, ptr @trace_xdp_exception, ptr @xdp_stats_map], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @trace_xdp_exception(ptr nocapture noundef readonly %0) #0 section "tracepoint/xdp/xdp_exception" !dbg !63 {
  %2 = alloca i32, align 4, !DIAssignID !82
  call void @llvm.dbg.assign(metadata i1 undef, metadata !76, metadata !DIExpression(), metadata !82, metadata ptr %2, metadata !DIExpression()), !dbg !83
  %3 = alloca i64, align 8, !DIAssignID !84
  call void @llvm.dbg.assign(metadata i1 undef, metadata !79, metadata !DIExpression(), metadata !84, metadata ptr %3, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata ptr %0, metadata !75, metadata !DIExpression()), !dbg !83
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #4, !dbg !86
  %4 = getelementptr inbounds %struct.xdp_exception_ctx, ptr %0, i64 0, i32 3, !dbg !87
  %5 = load i32, ptr %4, align 8, !dbg !87, !tbaa !88
  store i32 %5, ptr %2, align 4, !dbg !94, !tbaa !95, !DIAssignID !96
  call void @llvm.dbg.assign(metadata i32 %5, metadata !76, metadata !DIExpression(), metadata !96, metadata ptr %2, metadata !DIExpression()), !dbg !83
  %6 = getelementptr inbounds %struct.xdp_exception_ctx, ptr %0, i64 0, i32 2, !dbg !97
  %7 = load i32, ptr %6, align 4, !dbg !97, !tbaa !99
  %8 = icmp eq i32 %7, 0, !dbg !100
  br i1 %8, label %9, label %19, !dbg !101

9:                                                ; preds = %1
  %10 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #4, !dbg !102
  call void @llvm.dbg.value(metadata ptr %10, metadata !77, metadata !DIExpression()), !dbg !83
  %11 = icmp eq ptr %10, null, !dbg !103
  br i1 %11, label %12, label %16, !dbg !104

12:                                               ; preds = %9
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #4, !dbg !105
  store i64 1, ptr %3, align 8, !dbg !106, !tbaa !107, !DIAssignID !108
  call void @llvm.dbg.assign(metadata i64 1, metadata !79, metadata !DIExpression(), metadata !108, metadata ptr %3, metadata !DIExpression()), !dbg !85
  %13 = call i64 inttoptr (i64 2 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2, ptr noundef nonnull %3, i64 noundef 0) #4, !dbg !109
  %14 = icmp ne i64 %13, 0, !dbg !109
  %15 = zext i1 %14 to i32, !dbg !109
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #4, !dbg !110
  br label %19

16:                                               ; preds = %9
  %17 = load i32, ptr %10, align 4, !dbg !111, !tbaa !95
  %18 = add i32 %17, 1, !dbg !111
  store i32 %18, ptr %10, align 4, !dbg !111, !tbaa !95
  br label %19, !dbg !112

19:                                               ; preds = %1, %16, %12
  %20 = phi i32 [ 0, %16 ], [ %15, %12 ], [ 0, %1 ], !dbg !83
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #4, !dbg !113
  ret i32 %20, !dbg !113
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.assign(metadata, metadata, metadata, metadata, metadata, metadata) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!57, !58, !59, !60, !61}
!llvm.ident = !{!62}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !3, line: 10, type: !39, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "trace_prog_kern.c", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/tracing01-xdp-simple", checksumkind: CSK_MD5, checksum: "eb96e6caec23dcd216f655dba2142de1")
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
!14 = !{!15, !0, !21, !30}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 44, type: !17, isLocal: false, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 32, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 4)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !23, line: 56, type: !24, isLocal: true, isDefinition: true)
!23 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/tracing01-xdp-simple", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{!27, !27, !28}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !23, line: 78, type: !32, isLocal: true, isDefinition: true)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !27, !28, !28, !36}
!35 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !37, line: 31, baseType: !38)
!37 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!38 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!39 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 5, size: 256, elements: !40)
!40 = !{!41, !47, !50, !52}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !39, file: !3, line: 6, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 160, elements: !45)
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !{!46}
!46 = !DISubrange(count: 5)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !39, file: !3, line: 7, baseType: !48, size: 64, offset: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !37, line: 26, baseType: !44)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !39, file: !3, line: 8, baseType: !51, size: 64, offset: 128)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !39, file: !3, line: 9, baseType: !53, size: 64, offset: 192)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 320, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 10)
!57 = !{i32 7, !"Dwarf Version", i32 5}
!58 = !{i32 2, !"Debug Info Version", i32 3}
!59 = !{i32 1, !"wchar_size", i32 4}
!60 = !{i32 7, !"frame-pointer", i32 2}
!61 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!62 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)"}
!63 = distinct !DISubprogram(name: "trace_xdp_exception", scope: !3, file: !3, line: 20, type: !64, scopeLine: 21, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !74)
!64 = !DISubroutineType(types: !65)
!65 = !{!44, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_exception_ctx", file: !3, line: 12, size: 192, elements: !68)
!68 = !{!69, !70, !71, !73}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "__pad", scope: !67, file: !3, line: 13, baseType: !36, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "prog_id", scope: !67, file: !3, line: 14, baseType: !49, size: 32, offset: 64)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "act", scope: !67, file: !3, line: 15, baseType: !72, size: 32, offset: 96)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !37, line: 27, baseType: !7)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !67, file: !3, line: 16, baseType: !49, size: 32, offset: 128)
!74 = !{!75, !76, !77, !79}
!75 = !DILocalVariable(name: "ctx", arg: 1, scope: !63, file: !3, line: 20, type: !66)
!76 = !DILocalVariable(name: "key", scope: !63, file: !3, line: 22, type: !49)
!77 = !DILocalVariable(name: "valp", scope: !63, file: !3, line: 23, type: !78)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!79 = !DILocalVariable(name: "one", scope: !80, file: !3, line: 36, type: !36)
!80 = distinct !DILexicalBlock(scope: !81, file: !3, line: 35, column: 13)
!81 = distinct !DILexicalBlock(scope: !63, file: !3, line: 35, column: 6)
!82 = distinct !DIAssignID()
!83 = !DILocation(line: 0, scope: !63)
!84 = distinct !DIAssignID()
!85 = !DILocation(line: 0, scope: !80)
!86 = !DILocation(line: 22, column: 2, scope: !63)
!87 = !DILocation(line: 22, column: 19, scope: !63)
!88 = !{!89, !93, i64 16}
!89 = !{!"xdp_exception_ctx", !90, i64 0, !93, i64 8, !93, i64 12, !93, i64 16}
!90 = !{!"long long", !91, i64 0}
!91 = !{!"omnipotent char", !92, i64 0}
!92 = !{!"Simple C/C++ TBAA"}
!93 = !{!"int", !91, i64 0}
!94 = !DILocation(line: 22, column: 8, scope: !63)
!95 = !{!93, !93, i64 0}
!96 = distinct !DIAssignID()
!97 = !DILocation(line: 26, column: 11, scope: !98)
!98 = distinct !DILexicalBlock(scope: !63, file: !3, line: 26, column: 6)
!99 = !{!89, !93, i64 12}
!100 = !DILocation(line: 26, column: 15, scope: !98)
!101 = !DILocation(line: 26, column: 6, scope: !63)
!102 = !DILocation(line: 30, column: 9, scope: !63)
!103 = !DILocation(line: 35, column: 7, scope: !81)
!104 = !DILocation(line: 35, column: 6, scope: !63)
!105 = !DILocation(line: 36, column: 3, scope: !80)
!106 = !DILocation(line: 36, column: 9, scope: !80)
!107 = !{!90, !90, i64 0}
!108 = distinct !DIAssignID()
!109 = !DILocation(line: 37, column: 10, scope: !80)
!110 = !DILocation(line: 38, column: 2, scope: !81)
!111 = !DILocation(line: 40, column: 9, scope: !63)
!112 = !DILocation(line: 41, column: 2, scope: !63)
!113 = !DILocation(line: 42, column: 1, scope: !63)
