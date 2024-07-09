; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { ptr, ptr, ptr, ptr, ptr }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.datarec = type { i64, i64 }

@xdp_parser_func.____fmt = internal constant [17 x i8] c"Parsing eth hdr\0A\00", align 1, !dbg !0
@xdp_parser_func.____fmt.1 = internal constant [18 x i8] c"Parsing ipv6 hdr\0A\00", align 1, !dbg !66
@xdp_parser_func.____fmt.2 = internal constant [24 x i8] c"ipv6 nxthdr type is %d\0A\00", align 1, !dbg !73
@xdp_parser_func.____fmt.3 = internal constant [20 x i8] c"Parsing icmpv6 hdr\0A\00", align 1, !dbg !78
@xdp_parser_func.____fmt.4 = internal constant [24 x i8] c"icmp6 seq number is %d\0A\00", align 1, !dbg !83
@xdp_parser_func.____fmt.5 = internal constant [18 x i8] c"Parsing ipv4 hdr\0A\00", align 1, !dbg !85
@xdp_parser_func.____fmt.6 = internal constant [26 x i8] c"ipv4 protocol type is %d\0A\00", align 1, !dbg !87
@xdp_parser_func.____fmt.7 = internal constant [18 x i8] c"Parsing icmp hdr\0A\00", align 1, !dbg !92
@xdp_parser_func.____fmt.8 = internal constant [23 x i8] c"icmp seq number is %d\0A\00", align 1, !dbg !94
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !99
@xdp_stats_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !104
@parse_ethhdr.____fmt = internal constant [18 x i8] c"Parsing vlan hdr\0A\00", align 1, !dbg !142
@parse_ethhdr.____fmt.9 = internal constant [18 x i8] c"l3_proto is %04x\0A\00", align 1, !dbg !180
@parse_ip4hdr.____fmt = internal constant [16 x i8] c"ip hdr size %d\0A\00", align 1, !dbg !182
@llvm.compiler.used = appending global [3 x ptr] [ptr @_license, ptr @xdp_parser_func, ptr @xdp_stats_map], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_parser_func(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !2 {
  %2 = alloca i32, align 4, !DIAssignID !336
  call void @llvm.dbg.value(metadata ptr %0, metadata !223, metadata !DIExpression()), !dbg !337
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !338
  %4 = load i32, ptr %3, align 4, !dbg !338, !tbaa !339
  %5 = zext i32 %4 to i64, !dbg !344
  %6 = inttoptr i64 %5 to ptr, !dbg !345
  call void @llvm.dbg.value(metadata ptr %6, metadata !224, metadata !DIExpression()), !dbg !337
  %7 = load i32, ptr %0, align 4, !dbg !346, !tbaa !347
  %8 = zext i32 %7 to i64, !dbg !348
  %9 = inttoptr i64 %8 to ptr, !dbg !349
  call void @llvm.dbg.value(metadata ptr %9, metadata !225, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i32 2, metadata !323, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata ptr %9, metadata !324, metadata !DIExpression()), !dbg !337
  %10 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_parser_func.____fmt, i32 noundef 17) #5, !dbg !350
  call void @llvm.dbg.value(metadata ptr undef, metadata !164, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.value(metadata ptr %6, metadata !165, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.value(metadata ptr undef, metadata !166, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.value(metadata ptr %9, metadata !167, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.value(metadata i32 14, metadata !168, metadata !DIExpression()), !dbg !352
  %11 = getelementptr i8, ptr %9, i64 14, !dbg !354
  %12 = icmp ugt ptr %11, %6, !dbg !356
  br i1 %12, label %103, label %13, !dbg !357

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr %11, metadata !324, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata ptr %9, metadata !226, metadata !DIExpression()), !dbg !337
  %14 = getelementptr inbounds %struct.ethhdr, ptr %9, i64 0, i32 2, !dbg !358
  %15 = load i16, ptr %14, align 1, !dbg !358, !tbaa !359
  call void @llvm.dbg.value(metadata i16 %15, metadata !169, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !352
  call void @llvm.dbg.value(metadata i16 poison, metadata !362, metadata !DIExpression()), !dbg !367
  %16 = icmp eq i16 %15, 129, !dbg !369
  %17 = icmp eq i16 %15, -22392, !dbg !370
  %18 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %16)
  %19 = or i1 %17, %18, !dbg !370
  call void @llvm.dbg.value(metadata i1 %19, metadata !170, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !352
  br i1 %19, label %20, label %27, !dbg !371

20:                                               ; preds = %13
  %21 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @parse_ethhdr.____fmt, i32 noundef 18) #5, !dbg !372
  call void @llvm.dbg.value(metadata ptr %11, metadata !171, metadata !DIExpression()), !dbg !374
  call void @llvm.dbg.value(metadata i32 4, metadata !179, metadata !DIExpression()), !dbg !374
  %22 = getelementptr i8, ptr %9, i64 18, !dbg !375
  %23 = icmp ugt ptr %22, %6, !dbg !377
  br i1 %23, label %103, label %24, !dbg !378

24:                                               ; preds = %20
  call void @llvm.dbg.value(metadata ptr %22, metadata !324, metadata !DIExpression()), !dbg !337
  %25 = getelementptr i8, ptr %9, i64 16, !dbg !379
  %26 = load i16, ptr %25, align 2, !dbg !379, !tbaa !380
  call void @llvm.dbg.value(metadata i16 %26, metadata !169, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !352
  br label %27

27:                                               ; preds = %13, %24
  %28 = phi ptr [ %22, %24 ], [ %11, %13 ], !dbg !352
  %29 = phi i16 [ %26, %24 ], [ %15, %13 ]
  call void @llvm.dbg.value(metadata ptr %28, metadata !324, metadata !DIExpression()), !dbg !337
  %30 = zext i16 %29 to i32, !dbg !382
  call void @llvm.dbg.value(metadata i32 %30, metadata !169, metadata !DIExpression()), !dbg !352
  %31 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @parse_ethhdr.____fmt.9, i32 noundef 18, i32 noundef %30) #5, !dbg !383
  call void @llvm.dbg.value(metadata i32 %30, metadata !325, metadata !DIExpression()), !dbg !337
  switch i16 %29, label %86 [
    i16 -8826, label %32
    i16 8, label %54
  ], !dbg !385

32:                                               ; preds = %27
  %33 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_parser_func.____fmt.1, i32 noundef 18) #5, !dbg !387
  call void @llvm.dbg.value(metadata ptr undef, metadata !391, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr %6, metadata !397, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr undef, metadata !398, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata ptr %28, metadata !399, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 40, metadata !400, metadata !DIExpression()), !dbg !401
  %34 = getelementptr i8, ptr %28, i64 40, !dbg !403
  %35 = icmp ugt ptr %34, %6, !dbg !405
  br i1 %35, label %103, label %36, !dbg !406

36:                                               ; preds = %32
  call void @llvm.dbg.value(metadata ptr %34, metadata !324, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata ptr %28, metadata !227, metadata !DIExpression()), !dbg !337
  %37 = getelementptr inbounds %struct.ipv6hdr, ptr %28, i64 0, i32 3, !dbg !407
  %38 = load i8, ptr %37, align 2, !dbg !407, !tbaa !408
  %39 = zext i8 %38 to i32, !dbg !411
  call void @llvm.dbg.value(metadata i32 %39, metadata !325, metadata !DIExpression()), !dbg !337
  %40 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_parser_func.____fmt.2, i32 noundef 24, i32 noundef %39) #5, !dbg !412
  %41 = icmp eq i8 %38, 58, !dbg !414
  br i1 %41, label %42, label %86, !dbg !416

42:                                               ; preds = %36
  %43 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_parser_func.____fmt.3, i32 noundef 20) #5, !dbg !417
  call void @llvm.dbg.value(metadata ptr undef, metadata !419, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.value(metadata ptr %6, metadata !425, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.value(metadata ptr undef, metadata !426, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.value(metadata ptr %34, metadata !427, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.value(metadata i32 8, metadata !428, metadata !DIExpression()), !dbg !429
  %44 = getelementptr i8, ptr %28, i64 48, !dbg !431
  %45 = icmp ugt ptr %44, %6, !dbg !433
  br i1 %45, label %103, label %46, !dbg !434

46:                                               ; preds = %42
  call void @llvm.dbg.value(metadata ptr %34, metadata !257, metadata !DIExpression()), !dbg !337
  %47 = getelementptr i8, ptr %28, i64 46, !dbg !435
  %48 = load i16, ptr %47, align 2, !dbg !435, !tbaa !436
  call void @llvm.dbg.value(metadata i16 %48, metadata !325, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !337
  %49 = tail call i16 @llvm.bswap.i16(i16 %48), !dbg !437
  %50 = zext i16 %49 to i32, !dbg !437
  %51 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_parser_func.____fmt.4, i32 noundef 24, i32 noundef %50) #5, !dbg !437
  %52 = and i16 %48, 256, !dbg !439
  %53 = icmp eq i16 %52, 0, !dbg !439
  br i1 %53, label %85, label %86, !dbg !441

54:                                               ; preds = %27
  %55 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_parser_func.____fmt.5, i32 noundef 18) #5, !dbg !442
  call void @llvm.dbg.value(metadata ptr undef, metadata !207, metadata !DIExpression()), !dbg !445
  call void @llvm.dbg.value(metadata ptr %6, metadata !208, metadata !DIExpression()), !dbg !445
  call void @llvm.dbg.value(metadata ptr undef, metadata !209, metadata !DIExpression()), !dbg !445
  call void @llvm.dbg.value(metadata ptr %28, metadata !210, metadata !DIExpression()), !dbg !445
  %56 = getelementptr i8, ptr %28, i64 20, !dbg !447
  %57 = icmp ugt ptr %56, %6, !dbg !449
  br i1 %57, label %103, label %58, !dbg !450

58:                                               ; preds = %54
  %59 = load i8, ptr %28, align 4, !dbg !451
  %60 = shl i8 %59, 2, !dbg !452
  %61 = and i8 %60, 60, !dbg !452
  %62 = zext i8 %61 to i32, !dbg !452
  call void @llvm.dbg.value(metadata i32 %62, metadata !211, metadata !DIExpression()), !dbg !445
  %63 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @parse_ip4hdr.____fmt, i32 noundef 16, i32 noundef %62) #5, !dbg !453
  %64 = zext i8 %61 to i64
  %65 = getelementptr i8, ptr %28, i64 %64, !dbg !455
  %66 = icmp ugt ptr %65, %6, !dbg !457
  br i1 %66, label %103, label %67, !dbg !458

67:                                               ; preds = %58
  call void @llvm.dbg.value(metadata ptr %65, metadata !324, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata ptr %28, metadata !299, metadata !DIExpression()), !dbg !337
  %68 = getelementptr inbounds %struct.iphdr, ptr %28, i64 0, i32 6, !dbg !459
  %69 = load i8, ptr %68, align 1, !dbg !459, !tbaa !460
  %70 = zext i8 %69 to i32, !dbg !462
  call void @llvm.dbg.value(metadata i32 %70, metadata !325, metadata !DIExpression()), !dbg !337
  %71 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_parser_func.____fmt.6, i32 noundef 26, i32 noundef %70) #5, !dbg !463
  %72 = icmp eq i8 %69, 1, !dbg !465
  br i1 %72, label %73, label %86, !dbg !467

73:                                               ; preds = %67
  %74 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_parser_func.____fmt.7, i32 noundef 18) #5, !dbg !468
  call void @llvm.dbg.value(metadata ptr undef, metadata !470, metadata !DIExpression()), !dbg !480
  call void @llvm.dbg.value(metadata ptr %6, metadata !476, metadata !DIExpression()), !dbg !480
  call void @llvm.dbg.value(metadata ptr undef, metadata !477, metadata !DIExpression()), !dbg !480
  call void @llvm.dbg.value(metadata ptr %65, metadata !478, metadata !DIExpression()), !dbg !480
  call void @llvm.dbg.value(metadata i32 8, metadata !479, metadata !DIExpression()), !dbg !480
  %75 = getelementptr i8, ptr %65, i64 8, !dbg !482
  %76 = icmp ugt ptr %75, %6, !dbg !484
  br i1 %76, label %103, label %77, !dbg !485

77:                                               ; preds = %73
  call void @llvm.dbg.value(metadata ptr %65, metadata !300, metadata !DIExpression()), !dbg !337
  %78 = getelementptr inbounds i8, ptr %65, i64 6, !dbg !486
  %79 = load i16, ptr %78, align 2, !dbg !486, !tbaa !436
  call void @llvm.dbg.value(metadata i16 %79, metadata !325, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !337
  %80 = tail call i16 @llvm.bswap.i16(i16 %79), !dbg !487
  %81 = zext i16 %80 to i32, !dbg !487
  %82 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_parser_func.____fmt.8, i32 noundef 23, i32 noundef %81) #5, !dbg !487
  %83 = and i16 %79, 256, !dbg !489
  %84 = icmp eq i16 %83, 0, !dbg !489
  br i1 %84, label %85, label %86, !dbg !491

85:                                               ; preds = %77, %46
  call void @llvm.dbg.value(metadata i32 1, metadata !323, metadata !DIExpression()), !dbg !337
  br label %86, !dbg !492

86:                                               ; preds = %27, %77, %67, %46, %36, %85
  %87 = phi i32 [ 2, %27 ], [ 2, %36 ], [ 2, %46 ], [ 1, %85 ], [ 2, %67 ], [ 2, %77 ], !dbg !337
  call void @llvm.dbg.value(metadata i32 %87, metadata !323, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.label(metadata !326), !dbg !493
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !494
  call void @llvm.dbg.assign(metadata i1 undef, metadata !500, metadata !DIExpression(), metadata !336, metadata ptr %2, metadata !DIExpression()), !dbg !494
  call void @llvm.dbg.value(metadata ptr %0, metadata !499, metadata !DIExpression()), !dbg !494
  store i32 %87, ptr %2, align 4, !tbaa !503, !DIAssignID !504
  call void @llvm.dbg.assign(metadata i32 %87, metadata !500, metadata !DIExpression(), metadata !504, metadata ptr %2, metadata !DIExpression()), !dbg !494
  %88 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #5, !dbg !505
  call void @llvm.dbg.value(metadata ptr %88, metadata !501, metadata !DIExpression()), !dbg !494
  %89 = icmp eq ptr %88, null, !dbg !506
  br i1 %89, label %101, label %90, !dbg !508

90:                                               ; preds = %86
  %91 = load i64, ptr %88, align 8, !dbg !509, !tbaa !510
  %92 = add i64 %91, 1, !dbg !509
  store i64 %92, ptr %88, align 8, !dbg !509, !tbaa !510
  %93 = load i32, ptr %3, align 4, !dbg !513, !tbaa !339
  %94 = load i32, ptr %0, align 4, !dbg !514, !tbaa !347
  %95 = sub i32 %93, %94, !dbg !515
  %96 = zext i32 %95 to i64, !dbg !516
  %97 = getelementptr inbounds %struct.datarec, ptr %88, i64 0, i32 1, !dbg !517
  %98 = load i64, ptr %97, align 8, !dbg !518, !tbaa !519
  %99 = add i64 %98, %96, !dbg !518
  store i64 %99, ptr %97, align 8, !dbg !518, !tbaa !519
  %100 = load i32, ptr %2, align 4, !dbg !520, !tbaa !503
  br label %101, !dbg !521

101:                                              ; preds = %86, %90
  %102 = phi i32 [ %100, %90 ], [ 0, %86 ], !dbg !494
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !522
  br label %103, !dbg !523

103:                                              ; preds = %73, %58, %54, %42, %32, %20, %1, %101
  %104 = phi i32 [ %102, %101 ], [ -1, %1 ], [ -1, %20 ], [ -1, %32 ], [ -1, %42 ], [ -1, %54 ], [ -1, %58 ], [ -1, %73 ], !dbg !337
  ret i32 %104, !dbg !524
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.assign(metadata, metadata, metadata, metadata, metadata, metadata) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #4

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind memory(none) }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!20}
!llvm.module.flags = !{!330, !331, !332, !333, !334}
!llvm.ident = !{!335}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 177, type: !327, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "xdp_parser_func", scope: !3, file: !3, line: 149, type: !4, scopeLine: 150, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !222)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet01-parsing", checksumkind: CSK_MD5, checksum: "e657510c7df0dd560c797364508bbb23")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !9, line: 5595, size: 192, elements: !10)
!9 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "689c3da77ac6e6dfcbd771fd6706f660")
!10 = !{!11, !15, !16, !17, !18, !19}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !9, line: 5596, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !8, file: !9, line: 5597, baseType: !12, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !8, file: !9, line: 5598, baseType: !12, size: 32, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !8, file: !9, line: 5600, baseType: !12, size: 32, offset: 96)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !8, file: !9, line: 5601, baseType: !12, size: 32, offset: 128)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !8, file: !9, line: 5603, baseType: !12, size: 32, offset: 160)
!20 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !60, globals: !65, splitDebugInlining: false, nameTableKind: None)
!21 = !{!22, !29}
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !9, line: 5584, baseType: !14, size: 32, elements: !23)
!23 = !{!24, !25, !26, !27, !28}
!24 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!25 = !DIEnumerator(name: "XDP_DROP", value: 1)
!26 = !DIEnumerator(name: "XDP_PASS", value: 2)
!27 = !DIEnumerator(name: "XDP_TX", value: 3)
!28 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!29 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !30, line: 28, baseType: !14, size: 32, elements: !31)
!30 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "9a7f04155c254fef1b7ada5eb82c984c")
!31 = !{!32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59}
!32 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!33 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!34 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!35 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!36 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!37 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!38 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!39 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!40 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!41 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!42 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!43 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!44 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!45 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!46 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!47 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!48 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!49 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!50 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!51 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!52 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!53 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!54 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!55 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!56 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!57 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!58 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!59 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!60 = !{!61, !62, !63}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!62 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !64)
!64 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!65 = !{!0, !66, !73, !78, !83, !85, !87, !92, !94, !99, !104, !135, !142, !180, !182, !215}
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 185, type: !68, isLocal: true, isDefinition: true)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 144, elements: !71)
!69 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !70)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !{!72}
!72 = !DISubrange(count: 18)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 190, type: !75, isLocal: true, isDefinition: true)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 192, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 24)
!78 = !DIGlobalVariableExpression(var: !79, expr: !DIExpression())
!79 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 194, type: !80, isLocal: true, isDefinition: true)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 160, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 20)
!83 = !DIGlobalVariableExpression(var: !84, expr: !DIExpression())
!84 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 198, type: !75, isLocal: true, isDefinition: true)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 202, type: !68, isLocal: true, isDefinition: true)
!87 = !DIGlobalVariableExpression(var: !88, expr: !DIExpression())
!88 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 207, type: !89, isLocal: true, isDefinition: true)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 208, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 26)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 210, type: !68, isLocal: true, isDefinition: true)
!94 = !DIGlobalVariableExpression(var: !95, expr: !DIExpression())
!95 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 214, type: !96, isLocal: true, isDefinition: true)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 184, elements: !97)
!97 = !{!98}
!98 = !DISubrange(count: 23)
!99 = !DIGlobalVariableExpression(var: !100, expr: !DIExpression())
!100 = distinct !DIGlobalVariable(name: "_license", scope: !20, file: !3, line: 225, type: !101, isLocal: false, isDefinition: true)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 32, elements: !102)
!102 = !{!103}
!103 = !DISubrange(count: 4)
!104 = !DIGlobalVariableExpression(var: !105, expr: !DIExpression())
!105 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !20, file: !106, line: 22, type: !107, isLocal: false, isDefinition: true)
!106 = !DIFile(filename: "./../common/xdp_stats_kern.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet01-parsing", checksumkind: CSK_MD5, checksum: "c978ba00f7b9781ed1e135fd8557e600")
!107 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !106, line: 16, size: 320, elements: !108)
!108 = !{!109, !114, !116, !125, !130}
!109 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !107, file: !106, line: 17, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 192, elements: !112)
!112 = !{!113}
!113 = !DISubrange(count: 6)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !107, file: !106, line: 18, baseType: !115, size: 64, offset: 64)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !107, file: !106, line: 19, baseType: !117, size: 64, offset: 128)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !118, size: 64)
!118 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !119, line: 10, size: 128, elements: !120)
!119 = !DIFile(filename: "./../common/xdp_stats_kern_user.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet01-parsing", checksumkind: CSK_MD5, checksum: "96c2435685fa7da2d24f219444d8659d")
!120 = !{!121, !124}
!121 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !118, file: !119, line: 11, baseType: !122, size: 64)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !13, line: 31, baseType: !123)
!123 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !118, file: !119, line: 12, baseType: !122, size: 64, offset: 64)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !107, file: !106, line: 20, baseType: !126, size: 64, offset: 192)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 160, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 5)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "pinning", scope: !107, file: !106, line: 21, baseType: !131, size: 64, offset: 256)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 1)
!135 = !DIGlobalVariableExpression(var: !136, expr: !DIExpression())
!136 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !20, file: !137, line: 177, type: !138, isLocal: true, isDefinition: true)
!137 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet01-parsing", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DISubroutineType(types: !140)
!140 = !{!62, !141, !12, null}
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!142 = !DIGlobalVariableExpression(var: !143, expr: !DIExpression())
!143 = distinct !DIGlobalVariable(name: "____fmt", scope: !144, file: !3, line: 66, type: !68, isLocal: true, isDefinition: true)
!144 = distinct !DISubprogram(name: "parse_ethhdr", scope: !3, file: !3, line: 43, type: !145, scopeLine: 46, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !163)
!145 = !DISubroutineType(types: !146)
!146 = !{!6, !147, !61, !151}
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !148, size: 64)
!148 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !3, line: 19, size: 64, elements: !149)
!149 = !{!150}
!150 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !148, file: !3, line: 20, baseType: !61, size: 64)
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !154, line: 169, size: 112, elements: !155)
!154 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "d4a01a1da3b79d23c796a4d8db749b8f")
!155 = !{!156, !159, !160}
!156 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !153, file: !154, line: 170, baseType: !157, size: 48)
!157 = !DICompositeType(tag: DW_TAG_array_type, baseType: !158, size: 48, elements: !112)
!158 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !153, file: !154, line: 171, baseType: !157, size: 48, offset: 48)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !153, file: !154, line: 172, baseType: !161, size: 16, offset: 96)
!161 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !162, line: 25, baseType: !63)
!162 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!163 = !{!164, !165, !166, !167, !168, !169, !170, !171, !179}
!164 = !DILocalVariable(name: "nh", arg: 1, scope: !144, file: !3, line: 43, type: !147)
!165 = !DILocalVariable(name: "data_end", arg: 2, scope: !144, file: !3, line: 44, type: !61)
!166 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !144, file: !3, line: 45, type: !151)
!167 = !DILocalVariable(name: "eth", scope: !144, file: !3, line: 47, type: !152)
!168 = !DILocalVariable(name: "hdrsize", scope: !144, file: !3, line: 48, type: !6)
!169 = !DILocalVariable(name: "l3_proto", scope: !144, file: !3, line: 49, type: !6)
!170 = !DILocalVariable(name: "vlan", scope: !144, file: !3, line: 63, type: !6)
!171 = !DILocalVariable(name: "vhdr", scope: !172, file: !3, line: 67, type: !174)
!172 = distinct !DILexicalBlock(scope: !173, file: !3, line: 65, column: 12)
!173 = distinct !DILexicalBlock(scope: !144, file: !3, line: 65, column: 6)
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64)
!175 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !3, line: 23, size: 32, elements: !176)
!176 = !{!177, !178}
!177 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !175, file: !3, line: 24, baseType: !161, size: 16)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !175, file: !3, line: 25, baseType: !161, size: 16, offset: 16)
!179 = !DILocalVariable(name: "hdrsize", scope: !172, file: !3, line: 68, type: !6)
!180 = !DIGlobalVariableExpression(var: !181, expr: !DIExpression())
!181 = distinct !DIGlobalVariable(name: "____fmt", scope: !144, file: !3, line: 76, type: !68, isLocal: true, isDefinition: true)
!182 = !DIGlobalVariableExpression(var: !183, expr: !DIExpression())
!183 = distinct !DIGlobalVariable(name: "____fmt", scope: !184, file: !3, line: 89, type: !212, isLocal: true, isDefinition: true)
!184 = distinct !DISubprogram(name: "parse_ip4hdr", scope: !3, file: !3, line: 80, type: !185, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !206)
!185 = !DISubroutineType(types: !186)
!186 = !{!6, !147, !61, !187}
!187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !189, size: 64)
!189 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !190, line: 86, size: 160, elements: !191)
!190 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "91bb7f0ed6560290b754374efff83769")
!191 = !{!192, !194, !195, !196, !197, !198, !199, !200, !201, !203, !205}
!192 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !189, file: !190, line: 88, baseType: !193, size: 4, flags: DIFlagBitField, extraData: i64 0)
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !158)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !189, file: !190, line: 89, baseType: !193, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !189, file: !190, line: 96, baseType: !193, size: 8, offset: 8)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !189, file: !190, line: 97, baseType: !161, size: 16, offset: 16)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !189, file: !190, line: 98, baseType: !161, size: 16, offset: 32)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !189, file: !190, line: 99, baseType: !161, size: 16, offset: 48)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !189, file: !190, line: 100, baseType: !193, size: 8, offset: 64)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !189, file: !190, line: 101, baseType: !193, size: 8, offset: 72)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !189, file: !190, line: 102, baseType: !202, size: 16, offset: 80)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !162, line: 31, baseType: !63)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !189, file: !190, line: 103, baseType: !204, size: 32, offset: 96)
!204 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !162, line: 27, baseType: !12)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !189, file: !190, line: 104, baseType: !204, size: 32, offset: 128)
!206 = !{!207, !208, !209, !210, !211}
!207 = !DILocalVariable(name: "nh", arg: 1, scope: !184, file: !3, line: 80, type: !147)
!208 = !DILocalVariable(name: "data_end", arg: 2, scope: !184, file: !3, line: 81, type: !61)
!209 = !DILocalVariable(name: "ip4hdr", arg: 3, scope: !184, file: !3, line: 82, type: !187)
!210 = !DILocalVariable(name: "ip4", scope: !184, file: !3, line: 85, type: !188)
!211 = !DILocalVariable(name: "hdrsize", scope: !184, file: !3, line: 88, type: !6)
!212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 128, elements: !213)
!213 = !{!214}
!214 = !DISubrange(count: 16)
!215 = !DIGlobalVariableExpression(var: !216, expr: !DIExpression())
!216 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !20, file: !137, line: 56, type: !217, isLocal: true, isDefinition: true)
!217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !218, size: 64)
!218 = !DISubroutineType(types: !219)
!219 = !{!61, !61, !220}
!220 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !221, size: 64)
!221 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!222 = !{!223, !224, !225, !226, !227, !257, !299, !300, !323, !324, !325, !326}
!223 = !DILocalVariable(name: "ctx", arg: 1, scope: !2, file: !3, line: 149, type: !7)
!224 = !DILocalVariable(name: "data_end", scope: !2, file: !3, line: 151, type: !61)
!225 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 152, type: !61)
!226 = !DILocalVariable(name: "eth", scope: !2, file: !3, line: 153, type: !152)
!227 = !DILocalVariable(name: "ip6", scope: !2, file: !3, line: 154, type: !228)
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !229, size: 64)
!229 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !230, line: 117, size: 320, elements: !231)
!230 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4a65c85349cc7a670732aecc94eade8f")
!231 = !{!232, !233, !234, !238, !239, !240, !241, !256}
!232 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !229, file: !230, line: 119, baseType: !193, size: 4, flags: DIFlagBitField, extraData: i64 0)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !229, file: !230, line: 120, baseType: !193, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !229, file: !230, line: 127, baseType: !235, size: 24, offset: 8)
!235 = !DICompositeType(tag: DW_TAG_array_type, baseType: !193, size: 24, elements: !236)
!236 = !{!237}
!237 = !DISubrange(count: 3)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !229, file: !230, line: 129, baseType: !161, size: 16, offset: 32)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !229, file: !230, line: 130, baseType: !193, size: 8, offset: 48)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !229, file: !230, line: 131, baseType: !193, size: 8, offset: 56)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !229, file: !230, line: 133, baseType: !242, size: 128, offset: 64)
!242 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !243, line: 33, size: 128, elements: !244)
!243 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!244 = !{!245}
!245 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !242, file: !243, line: 40, baseType: !246, size: 128)
!246 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !242, file: !243, line: 34, size: 128, elements: !247)
!247 = !{!248, !250, !254}
!248 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !246, file: !243, line: 35, baseType: !249, size: 128)
!249 = !DICompositeType(tag: DW_TAG_array_type, baseType: !193, size: 128, elements: !213)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !246, file: !243, line: 37, baseType: !251, size: 128)
!251 = !DICompositeType(tag: DW_TAG_array_type, baseType: !161, size: 128, elements: !252)
!252 = !{!253}
!253 = !DISubrange(count: 8)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !246, file: !243, line: 38, baseType: !255, size: 128)
!255 = !DICompositeType(tag: DW_TAG_array_type, baseType: !204, size: 128, elements: !102)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !229, file: !230, line: 134, baseType: !242, size: 128, offset: 192)
!257 = !DILocalVariable(name: "icmp6", scope: !2, file: !3, line: 155, type: !258)
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !259, size: 64)
!259 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !260, line: 8, size: 64, elements: !261)
!260 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "0310ca5584e6f44f6eea6cf040ee84b9")
!261 = !{!262, !263, !264, !265}
!262 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !259, file: !260, line: 10, baseType: !193, size: 8)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !259, file: !260, line: 11, baseType: !193, size: 8, offset: 8)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !259, file: !260, line: 12, baseType: !202, size: 16, offset: 16)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !259, file: !260, line: 63, baseType: !266, size: 32, offset: 32)
!266 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !259, file: !260, line: 15, size: 32, elements: !267)
!267 = !{!268, !270, !274, !276, !281, !289}
!268 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !266, file: !260, line: 16, baseType: !269, size: 32)
!269 = !DICompositeType(tag: DW_TAG_array_type, baseType: !204, size: 32, elements: !133)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !266, file: !260, line: 17, baseType: !271, size: 32)
!271 = !DICompositeType(tag: DW_TAG_array_type, baseType: !161, size: 32, elements: !272)
!272 = !{!273}
!273 = !DISubrange(count: 2)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !266, file: !260, line: 18, baseType: !275, size: 32)
!275 = !DICompositeType(tag: DW_TAG_array_type, baseType: !193, size: 32, elements: !102)
!276 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !266, file: !260, line: 23, baseType: !277, size: 32)
!277 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !260, line: 20, size: 32, elements: !278)
!278 = !{!279, !280}
!279 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !277, file: !260, line: 21, baseType: !161, size: 16)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !277, file: !260, line: 22, baseType: !161, size: 16, offset: 16)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !266, file: !260, line: 40, baseType: !282, size: 32)
!282 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !260, line: 25, size: 32, elements: !283)
!283 = !{!284, !285, !286, !287, !288}
!284 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !282, file: !260, line: 27, baseType: !12, size: 5, flags: DIFlagBitField, extraData: i64 0)
!285 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !282, file: !260, line: 28, baseType: !12, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !282, file: !260, line: 29, baseType: !12, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !282, file: !260, line: 30, baseType: !12, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !282, file: !260, line: 31, baseType: !12, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !266, file: !260, line: 61, baseType: !290, size: 32)
!290 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !260, line: 42, size: 32, elements: !291)
!291 = !{!292, !293, !294, !295, !296, !297, !298}
!292 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !290, file: !260, line: 43, baseType: !193, size: 8)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !290, file: !260, line: 45, baseType: !193, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !290, file: !260, line: 46, baseType: !193, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !290, file: !260, line: 47, baseType: !193, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !290, file: !260, line: 48, baseType: !193, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!297 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !290, file: !260, line: 49, baseType: !193, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!298 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !290, file: !260, line: 60, baseType: !161, size: 16, offset: 16)
!299 = !DILocalVariable(name: "ip4", scope: !2, file: !3, line: 157, type: !188)
!300 = !DILocalVariable(name: "icmp4", scope: !2, file: !3, line: 158, type: !301)
!301 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !302, size: 64)
!302 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !303, line: 89, size: 64, elements: !304)
!303 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!304 = !{!305, !306, !307, !308}
!305 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !302, file: !303, line: 90, baseType: !193, size: 8)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !302, file: !303, line: 91, baseType: !193, size: 8, offset: 8)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !302, file: !303, line: 92, baseType: !202, size: 16, offset: 16)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !302, file: !303, line: 104, baseType: !309, size: 32, offset: 32)
!309 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !302, file: !303, line: 93, size: 32, elements: !310)
!310 = !{!311, !316, !317, !322}
!311 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !309, file: !303, line: 97, baseType: !312, size: 32)
!312 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !309, file: !303, line: 94, size: 32, elements: !313)
!313 = !{!314, !315}
!314 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !312, file: !303, line: 95, baseType: !161, size: 16)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !312, file: !303, line: 96, baseType: !161, size: 16, offset: 16)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !309, file: !303, line: 98, baseType: !204, size: 32)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !309, file: !303, line: 102, baseType: !318, size: 32)
!318 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !309, file: !303, line: 99, size: 32, elements: !319)
!319 = !{!320, !321}
!320 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !318, file: !303, line: 100, baseType: !161, size: 16)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !318, file: !303, line: 101, baseType: !161, size: 16, offset: 16)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !309, file: !303, line: 103, baseType: !275, size: 32)
!323 = !DILocalVariable(name: "action", scope: !2, file: !3, line: 164, type: !12)
!324 = !DILocalVariable(name: "nh", scope: !2, file: !3, line: 167, type: !148)
!325 = !DILocalVariable(name: "nh_type", scope: !2, file: !3, line: 168, type: !6)
!326 = !DILabel(scope: !2, name: "out", file: !3, line: 221)
!327 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 136, elements: !328)
!328 = !{!329}
!329 = !DISubrange(count: 17)
!330 = !{i32 7, !"Dwarf Version", i32 5}
!331 = !{i32 2, !"Debug Info Version", i32 3}
!332 = !{i32 1, !"wchar_size", i32 4}
!333 = !{i32 7, !"frame-pointer", i32 2}
!334 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!335 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)"}
!336 = distinct !DIAssignID()
!337 = !DILocation(line: 0, scope: !2)
!338 = !DILocation(line: 151, column: 38, scope: !2)
!339 = !{!340, !341, i64 4}
!340 = !{!"xdp_md", !341, i64 0, !341, i64 4, !341, i64 8, !341, i64 12, !341, i64 16, !341, i64 20}
!341 = !{!"int", !342, i64 0}
!342 = !{!"omnipotent char", !343, i64 0}
!343 = !{!"Simple C/C++ TBAA"}
!344 = !DILocation(line: 151, column: 27, scope: !2)
!345 = !DILocation(line: 151, column: 19, scope: !2)
!346 = !DILocation(line: 152, column: 34, scope: !2)
!347 = !{!340, !341, i64 0}
!348 = !DILocation(line: 152, column: 23, scope: !2)
!349 = !DILocation(line: 152, column: 15, scope: !2)
!350 = !DILocation(line: 177, column: 2, scope: !351)
!351 = distinct !DILexicalBlock(scope: !2, file: !3, line: 177, column: 2)
!352 = !DILocation(line: 0, scope: !144, inlinedAt: !353)
!353 = distinct !DILocation(line: 178, column: 12, scope: !2)
!354 = !DILocation(line: 54, column: 14, scope: !355, inlinedAt: !353)
!355 = distinct !DILexicalBlock(scope: !144, file: !3, line: 54, column: 6)
!356 = !DILocation(line: 54, column: 24, scope: !355, inlinedAt: !353)
!357 = !DILocation(line: 54, column: 6, scope: !144, inlinedAt: !353)
!358 = !DILocation(line: 60, column: 18, scope: !144, inlinedAt: !353)
!359 = !{!360, !361, i64 12}
!360 = !{!"ethhdr", !342, i64 0, !342, i64 6, !361, i64 12}
!361 = !{!"short", !342, i64 0}
!362 = !DILocalVariable(name: "proto", arg: 1, scope: !363, file: !3, line: 29, type: !63)
!363 = distinct !DISubprogram(name: "isvlan", scope: !3, file: !3, line: 29, type: !364, scopeLine: 30, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !366)
!364 = !DISubroutineType(types: !365)
!365 = !{!6, !63}
!366 = !{!362}
!367 = !DILocation(line: 0, scope: !363, inlinedAt: !368)
!368 = distinct !DILocation(line: 63, column: 13, scope: !144, inlinedAt: !353)
!369 = !DILocation(line: 31, column: 18, scope: !363, inlinedAt: !368)
!370 = !DILocation(line: 31, column: 33, scope: !363, inlinedAt: !368)
!371 = !DILocation(line: 65, column: 6, scope: !144, inlinedAt: !353)
!372 = !DILocation(line: 66, column: 3, scope: !373, inlinedAt: !353)
!373 = distinct !DILexicalBlock(scope: !172, file: !3, line: 66, column: 3)
!374 = !DILocation(line: 0, scope: !172, inlinedAt: !353)
!375 = !DILocation(line: 70, column: 15, scope: !376, inlinedAt: !353)
!376 = distinct !DILexicalBlock(scope: !172, file: !3, line: 70, column: 7)
!377 = !DILocation(line: 70, column: 25, scope: !376, inlinedAt: !353)
!378 = !DILocation(line: 70, column: 7, scope: !172, inlinedAt: !353)
!379 = !DILocation(line: 74, column: 20, scope: !172, inlinedAt: !353)
!380 = !{!381, !361, i64 2}
!381 = !{!"vlan_hdr", !361, i64 0, !361, i64 2}
!382 = !DILocation(line: 60, column: 11, scope: !144, inlinedAt: !353)
!383 = !DILocation(line: 76, column: 2, scope: !384, inlinedAt: !353)
!384 = distinct !DILexicalBlock(scope: !144, file: !3, line: 76, column: 2)
!385 = !DILocation(line: 181, column: 39, scope: !386)
!386 = distinct !DILexicalBlock(scope: !2, file: !3, line: 181, column: 6)
!387 = !DILocation(line: 185, column: 3, scope: !388)
!388 = distinct !DILexicalBlock(scope: !389, file: !3, line: 185, column: 3)
!389 = distinct !DILexicalBlock(scope: !390, file: !3, line: 184, column: 40)
!390 = distinct !DILexicalBlock(scope: !2, file: !3, line: 184, column: 6)
!391 = !DILocalVariable(name: "nh", arg: 1, scope: !392, file: !3, line: 102, type: !147)
!392 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !3, file: !3, line: 102, type: !393, scopeLine: 105, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !396)
!393 = !DISubroutineType(types: !394)
!394 = !{!6, !147, !61, !395}
!395 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !228, size: 64)
!396 = !{!391, !397, !398, !399, !400}
!397 = !DILocalVariable(name: "data_end", arg: 2, scope: !392, file: !3, line: 103, type: !61)
!398 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !392, file: !3, line: 104, type: !395)
!399 = !DILocalVariable(name: "ip6", scope: !392, file: !3, line: 106, type: !228)
!400 = !DILocalVariable(name: "hdrsize", scope: !392, file: !3, line: 107, type: !6)
!401 = !DILocation(line: 0, scope: !392, inlinedAt: !402)
!402 = distinct !DILocation(line: 187, column: 13, scope: !389)
!403 = !DILocation(line: 109, column: 14, scope: !404, inlinedAt: !402)
!404 = distinct !DILexicalBlock(scope: !392, file: !3, line: 109, column: 6)
!405 = !DILocation(line: 109, column: 24, scope: !404, inlinedAt: !402)
!406 = !DILocation(line: 109, column: 6, scope: !392, inlinedAt: !402)
!407 = !DILocation(line: 115, column: 14, scope: !392, inlinedAt: !402)
!408 = !{!409, !342, i64 6}
!409 = !{!"ipv6hdr", !342, i64 0, !342, i64 0, !342, i64 1, !361, i64 4, !342, i64 6, !342, i64 7, !410, i64 8, !410, i64 24}
!410 = !{!"in6_addr", !342, i64 0}
!411 = !DILocation(line: 115, column: 9, scope: !392, inlinedAt: !402)
!412 = !DILocation(line: 190, column: 3, scope: !413)
!413 = distinct !DILexicalBlock(scope: !389, file: !3, line: 190, column: 3)
!414 = !DILocation(line: 191, column: 15, scope: !415)
!415 = distinct !DILexicalBlock(scope: !389, file: !3, line: 191, column: 7)
!416 = !DILocation(line: 191, column: 7, scope: !389)
!417 = !DILocation(line: 194, column: 3, scope: !418)
!418 = distinct !DILexicalBlock(scope: !389, file: !3, line: 194, column: 3)
!419 = !DILocalVariable(name: "nh", arg: 1, scope: !420, file: !3, line: 133, type: !147)
!420 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !3, file: !3, line: 133, type: !421, scopeLine: 136, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !424)
!421 = !DISubroutineType(types: !422)
!422 = !{!6, !147, !61, !423}
!423 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !258, size: 64)
!424 = !{!419, !425, !426, !427, !428}
!425 = !DILocalVariable(name: "data_end", arg: 2, scope: !420, file: !3, line: 134, type: !61)
!426 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !420, file: !3, line: 135, type: !423)
!427 = !DILocalVariable(name: "icmp6", scope: !420, file: !3, line: 137, type: !258)
!428 = !DILocalVariable(name: "hdrsize", scope: !420, file: !3, line: 138, type: !6)
!429 = !DILocation(line: 0, scope: !420, inlinedAt: !430)
!430 = distinct !DILocation(line: 195, column: 13, scope: !389)
!431 = !DILocation(line: 140, column: 14, scope: !432, inlinedAt: !430)
!432 = distinct !DILexicalBlock(scope: !420, file: !3, line: 140, column: 6)
!433 = !DILocation(line: 140, column: 24, scope: !432, inlinedAt: !430)
!434 = !DILocation(line: 140, column: 6, scope: !420, inlinedAt: !430)
!435 = !DILocation(line: 145, column: 16, scope: !420, inlinedAt: !430)
!436 = !{!342, !342, i64 0}
!437 = !DILocation(line: 198, column: 3, scope: !438)
!438 = distinct !DILexicalBlock(scope: !389, file: !3, line: 198, column: 3)
!439 = !DILocation(line: 199, column: 30, scope: !440)
!440 = distinct !DILexicalBlock(scope: !389, file: !3, line: 199, column: 7)
!441 = !DILocation(line: 199, column: 7, scope: !389)
!442 = !DILocation(line: 202, column: 3, scope: !443)
!443 = distinct !DILexicalBlock(scope: !444, file: !3, line: 202, column: 3)
!444 = distinct !DILexicalBlock(scope: !390, file: !3, line: 201, column: 9)
!445 = !DILocation(line: 0, scope: !184, inlinedAt: !446)
!446 = distinct !DILocation(line: 204, column: 13, scope: !444)
!447 = !DILocation(line: 86, column: 14, scope: !448, inlinedAt: !446)
!448 = distinct !DILexicalBlock(scope: !184, file: !3, line: 86, column: 6)
!449 = !DILocation(line: 86, column: 29, scope: !448, inlinedAt: !446)
!450 = !DILocation(line: 86, column: 6, scope: !184, inlinedAt: !446)
!451 = !DILocation(line: 88, column: 22, scope: !184, inlinedAt: !446)
!452 = !DILocation(line: 88, column: 26, scope: !184, inlinedAt: !446)
!453 = !DILocation(line: 89, column: 2, scope: !454, inlinedAt: !446)
!454 = distinct !DILexicalBlock(scope: !184, file: !3, line: 89, column: 2)
!455 = !DILocation(line: 91, column: 14, scope: !456, inlinedAt: !446)
!456 = distinct !DILexicalBlock(scope: !184, file: !3, line: 91, column: 6)
!457 = !DILocation(line: 91, column: 24, scope: !456, inlinedAt: !446)
!458 = !DILocation(line: 91, column: 6, scope: !184, inlinedAt: !446)
!459 = !DILocation(line: 97, column: 14, scope: !184, inlinedAt: !446)
!460 = !{!461, !342, i64 9}
!461 = !{!"iphdr", !342, i64 0, !342, i64 0, !342, i64 1, !361, i64 2, !361, i64 4, !361, i64 6, !342, i64 8, !342, i64 9, !361, i64 10, !341, i64 12, !341, i64 16}
!462 = !DILocation(line: 97, column: 9, scope: !184, inlinedAt: !446)
!463 = !DILocation(line: 207, column: 3, scope: !464)
!464 = distinct !DILexicalBlock(scope: !444, file: !3, line: 207, column: 3)
!465 = !DILocation(line: 208, column: 15, scope: !466)
!466 = distinct !DILexicalBlock(scope: !444, file: !3, line: 208, column: 7)
!467 = !DILocation(line: 208, column: 7, scope: !444)
!468 = !DILocation(line: 210, column: 3, scope: !469)
!469 = distinct !DILexicalBlock(scope: !444, file: !3, line: 210, column: 3)
!470 = !DILocalVariable(name: "nh", arg: 1, scope: !471, file: !3, line: 118, type: !147)
!471 = distinct !DISubprogram(name: "parse_icmphdr", scope: !3, file: !3, line: 118, type: !472, scopeLine: 121, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !475)
!472 = !DISubroutineType(types: !473)
!473 = !{!6, !147, !61, !474}
!474 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !301, size: 64)
!475 = !{!470, !476, !477, !478, !479}
!476 = !DILocalVariable(name: "data_end", arg: 2, scope: !471, file: !3, line: 119, type: !61)
!477 = !DILocalVariable(name: "icmp4hdr", arg: 3, scope: !471, file: !3, line: 120, type: !474)
!478 = !DILocalVariable(name: "icmp4", scope: !471, file: !3, line: 122, type: !301)
!479 = !DILocalVariable(name: "hdrsize", scope: !471, file: !3, line: 123, type: !6)
!480 = !DILocation(line: 0, scope: !471, inlinedAt: !481)
!481 = distinct !DILocation(line: 211, column: 13, scope: !444)
!482 = !DILocation(line: 125, column: 14, scope: !483, inlinedAt: !481)
!483 = distinct !DILexicalBlock(scope: !471, file: !3, line: 125, column: 6)
!484 = !DILocation(line: 125, column: 24, scope: !483, inlinedAt: !481)
!485 = !DILocation(line: 125, column: 6, scope: !471, inlinedAt: !481)
!486 = !DILocation(line: 130, column: 24, scope: !471, inlinedAt: !481)
!487 = !DILocation(line: 214, column: 3, scope: !488)
!488 = distinct !DILexicalBlock(scope: !444, file: !3, line: 214, column: 3)
!489 = !DILocation(line: 215, column: 30, scope: !490)
!490 = distinct !DILexicalBlock(scope: !444, file: !3, line: 215, column: 7)
!491 = !DILocation(line: 215, column: 7, scope: !444)
!492 = !DILocation(line: 219, column: 2, scope: !2)
!493 = !DILocation(line: 221, column: 1, scope: !2)
!494 = !DILocation(line: 0, scope: !495, inlinedAt: !502)
!495 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !106, file: !106, line: 25, type: !496, scopeLine: 26, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !498)
!496 = !DISubroutineType(types: !497)
!497 = !{!12, !7, !12}
!498 = !{!499, !500, !501}
!499 = !DILocalVariable(name: "ctx", arg: 1, scope: !495, file: !106, line: 25, type: !7)
!500 = !DILocalVariable(name: "action", arg: 2, scope: !495, file: !106, line: 25, type: !12)
!501 = !DILocalVariable(name: "rec", scope: !495, file: !106, line: 31, type: !117)
!502 = distinct !DILocation(line: 222, column: 9, scope: !2)
!503 = !{!341, !341, i64 0}
!504 = distinct !DIAssignID()
!505 = !DILocation(line: 31, column: 24, scope: !495, inlinedAt: !502)
!506 = !DILocation(line: 32, column: 7, scope: !507, inlinedAt: !502)
!507 = distinct !DILexicalBlock(scope: !495, file: !106, line: 32, column: 6)
!508 = !DILocation(line: 32, column: 6, scope: !495, inlinedAt: !502)
!509 = !DILocation(line: 39, column: 17, scope: !495, inlinedAt: !502)
!510 = !{!511, !512, i64 0}
!511 = !{!"datarec", !512, i64 0, !512, i64 8}
!512 = !{!"long long", !342, i64 0}
!513 = !DILocation(line: 40, column: 25, scope: !495, inlinedAt: !502)
!514 = !DILocation(line: 40, column: 41, scope: !495, inlinedAt: !502)
!515 = !DILocation(line: 40, column: 34, scope: !495, inlinedAt: !502)
!516 = !DILocation(line: 40, column: 19, scope: !495, inlinedAt: !502)
!517 = !DILocation(line: 40, column: 7, scope: !495, inlinedAt: !502)
!518 = !DILocation(line: 40, column: 16, scope: !495, inlinedAt: !502)
!519 = !{!511, !512, i64 8}
!520 = !DILocation(line: 42, column: 9, scope: !495, inlinedAt: !502)
!521 = !DILocation(line: 42, column: 2, scope: !495, inlinedAt: !502)
!522 = !DILocation(line: 43, column: 1, scope: !495, inlinedAt: !502)
!523 = !DILocation(line: 222, column: 2, scope: !2)
!524 = !DILocation(line: 223, column: 1, scope: !2)
