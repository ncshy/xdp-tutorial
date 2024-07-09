; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.3 = type { ptr, ptr, ptr, ptr, ptr }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.datarec = type { i64, i64 }

@xdp_port_rewrite_func.____fmt = internal constant [19 x i8] c"Parsing ipv6 hdr \0A\00", align 1, !dbg !0
@xdp_port_rewrite_func.____fmt.1 = internal constant [18 x i8] c"Parsing TCP hdr \0A\00", align 1, !dbg !86
@xdp_vlan_swap_func.____fmt = internal constant [18 x i8] c"Parsing Eth hdr \0A\00", align 1, !dbg !93
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !106
@xdp_stats_map = dso_local global %struct.anon.3 zeroinitializer, section ".maps", align 8, !dbg !111
@parse_ethhdr.____fmt = internal constant [18 x i8] c"Parsing vlan hdr\0A\00", align 1, !dbg !140
@parse_ethhdr.____fmt.2 = internal constant [18 x i8] c"l3_proto is %04x\0A\00", align 1, !dbg !159
@vlan_tag_pop.____fmt = internal constant [27 x i8] c"Obtain VLAN id and proto \0A\00", align 1, !dbg !168
@vlan_tag_pop.____fmt.3 = internal constant [10 x i8] c"VLID: %d\0A\00", align 1, !dbg !186
@vlan_tag_push.____fmt = internal constant [10 x i8] c"VLID: %d\0A\00", align 1, !dbg !196
@parse_ip4hdr.____fmt = internal constant [16 x i8] c"ip hdr size %d\0A\00", align 1, !dbg !213
@llvm.compiler.used = appending global [5 x ptr] [ptr @_license, ptr @xdp_parser_func, ptr @xdp_port_rewrite_func, ptr @xdp_stats_map, ptr @xdp_vlan_swap_func], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_port_rewrite_func(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !2 {
  call void @llvm.dbg.value(metadata ptr %0, metadata !253, metadata !DIExpression()), !dbg !324
  %2 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !325
  %3 = load i32, ptr %2, align 4, !dbg !325, !tbaa !326
  %4 = zext i32 %3 to i64, !dbg !331
  %5 = inttoptr i64 %4 to ptr, !dbg !332
  call void @llvm.dbg.value(metadata ptr %5, metadata !254, metadata !DIExpression()), !dbg !324
  %6 = load i32, ptr %0, align 4, !dbg !333, !tbaa !334
  %7 = zext i32 %6 to i64, !dbg !335
  %8 = inttoptr i64 %7 to ptr, !dbg !336
  call void @llvm.dbg.value(metadata ptr %8, metadata !255, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata ptr %8, metadata !256, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata ptr undef, metadata !148, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata ptr %5, metadata !149, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata ptr undef, metadata !150, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata ptr %8, metadata !151, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i32 14, metadata !152, metadata !DIExpression()), !dbg !337
  %9 = getelementptr i8, ptr %8, i64 14, !dbg !339
  %10 = icmp ugt ptr %9, %5, !dbg !341
  br i1 %10, label %49, label %11, !dbg !342

11:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr %9, metadata !256, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata ptr %8, metadata !258, metadata !DIExpression()), !dbg !324
  %12 = getelementptr inbounds %struct.ethhdr, ptr %8, i64 0, i32 2, !dbg !343
  %13 = load i16, ptr %12, align 1, !dbg !343, !tbaa !344
  call void @llvm.dbg.value(metadata i16 %13, metadata !153, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !337
  call void @llvm.dbg.value(metadata i16 poison, metadata !347, metadata !DIExpression()), !dbg !352
  %14 = icmp eq i16 %13, 129, !dbg !354
  %15 = icmp eq i16 %13, -22392, !dbg !355
  %16 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %14)
  %17 = or i1 %15, %16, !dbg !355
  call void @llvm.dbg.value(metadata i1 %17, metadata !154, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !337
  br i1 %17, label %18, label %25, !dbg !356

18:                                               ; preds = %11
  %19 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @parse_ethhdr.____fmt, i32 noundef 18) #6, !dbg !357
  call void @llvm.dbg.value(metadata ptr %9, metadata !155, metadata !DIExpression()), !dbg !359
  call void @llvm.dbg.value(metadata i32 4, metadata !158, metadata !DIExpression()), !dbg !359
  %20 = getelementptr i8, ptr %8, i64 18, !dbg !360
  %21 = icmp ugt ptr %20, %5, !dbg !362
  br i1 %21, label %49, label %22, !dbg !363

22:                                               ; preds = %18
  call void @llvm.dbg.value(metadata ptr %20, metadata !256, metadata !DIExpression()), !dbg !324
  %23 = getelementptr i8, ptr %8, i64 16, !dbg !364
  %24 = load i16, ptr %23, align 2, !dbg !364, !tbaa !365
  call void @llvm.dbg.value(metadata i16 %24, metadata !153, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !337
  br label %25

25:                                               ; preds = %11, %22
  %26 = phi ptr [ %20, %22 ], [ %9, %11 ], !dbg !337
  %27 = phi i16 [ %24, %22 ], [ %13, %11 ]
  call void @llvm.dbg.value(metadata ptr %26, metadata !256, metadata !DIExpression()), !dbg !324
  %28 = zext i16 %27 to i32, !dbg !367
  call void @llvm.dbg.value(metadata i32 %28, metadata !153, metadata !DIExpression()), !dbg !337
  %29 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @parse_ethhdr.____fmt.2, i32 noundef 18, i32 noundef %28) #6, !dbg !368
  call void @llvm.dbg.value(metadata i32 %28, metadata !257, metadata !DIExpression()), !dbg !324
  %30 = icmp eq i16 %27, -8826, !dbg !370
  br i1 %30, label %31, label %49, !dbg !371

31:                                               ; preds = %25
  %32 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_port_rewrite_func.____fmt, i32 noundef 19) #6, !dbg !372
  call void @llvm.dbg.value(metadata ptr undef, metadata !374, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.value(metadata ptr %5, metadata !380, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.value(metadata ptr undef, metadata !381, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.value(metadata ptr %26, metadata !382, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.value(metadata i32 40, metadata !383, metadata !DIExpression()), !dbg !384
  %33 = getelementptr i8, ptr %26, i64 40, !dbg !386
  %34 = icmp ugt ptr %33, %5, !dbg !388
  br i1 %34, label %49, label %35, !dbg !389

35:                                               ; preds = %31
  call void @llvm.dbg.value(metadata ptr %33, metadata !256, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata ptr %26, metadata !259, metadata !DIExpression()), !dbg !390
  %36 = getelementptr inbounds %struct.ipv6hdr, ptr %26, i64 0, i32 3, !dbg !391
  %37 = load i8, ptr %36, align 2, !dbg !391, !tbaa !392
  call void @llvm.dbg.value(metadata i8 %37, metadata !257, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !324
  %38 = icmp eq i8 %37, 6, !dbg !395
  br i1 %38, label %39, label %49, !dbg !396

39:                                               ; preds = %35
  %40 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_port_rewrite_func.____fmt.1, i32 noundef 18) #6, !dbg !397
  call void @llvm.dbg.value(metadata ptr undef, metadata !399, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata ptr %5, metadata !405, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata ptr undef, metadata !406, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata ptr %33, metadata !407, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.value(metadata i32 20, metadata !408, metadata !DIExpression()), !dbg !409
  %41 = getelementptr i8, ptr %26, i64 60, !dbg !411
  %42 = icmp ugt ptr %41, %5, !dbg !413
  br i1 %42, label %49, label %43, !dbg !414

43:                                               ; preds = %39
  %44 = getelementptr i8, ptr %26, i64 42, !dbg !415
  %45 = load i16, ptr %44, align 2, !dbg !415, !tbaa !416
  %46 = tail call i16 @llvm.bswap.i16(i16 %45), !dbg !415
  %47 = add i16 %46, -1, !dbg !415
  %48 = tail call i16 @llvm.bswap.i16(i16 %47), !dbg !415
  store i16 %48, ptr %44, align 2, !dbg !418, !tbaa !416
  call void @llvm.dbg.value(metadata ptr %41, metadata !256, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata ptr poison, metadata !291, metadata !DIExpression()), !dbg !419
  call void @llvm.dbg.value(metadata i32 0, metadata !257, metadata !DIExpression()), !dbg !324
  br label %49

49:                                               ; preds = %31, %18, %1, %39, %35, %43, %25
  %50 = phi i32 [ 2, %25 ], [ 2, %43 ], [ 2, %35 ], [ -1, %39 ], [ -1, %1 ], [ -1, %18 ], [ -1, %31 ], !dbg !324
  ret i32 %50, !dbg !420
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind
define dso_local i32 @xdp_vlan_swap_func(ptr noundef %0) #0 section "xdp" !dbg !95 {
  %2 = alloca %struct.ethhdr, align 1, !DIAssignID !421
  call void @llvm.dbg.value(metadata ptr %0, metadata !97, metadata !DIExpression()), !dbg !422
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !423
  %4 = load i32, ptr %3, align 4, !dbg !423, !tbaa !326
  %5 = zext i32 %4 to i64, !dbg !424
  %6 = inttoptr i64 %5 to ptr, !dbg !425
  call void @llvm.dbg.value(metadata ptr %6, metadata !98, metadata !DIExpression()), !dbg !422
  %7 = load i32, ptr %0, align 4, !dbg !426, !tbaa !334
  %8 = zext i32 %7 to i64, !dbg !427
  %9 = inttoptr i64 %8 to ptr, !dbg !428
  call void @llvm.dbg.value(metadata ptr %9, metadata !99, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.value(metadata ptr %9, metadata !100, metadata !DIExpression()), !dbg !422
  %10 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_vlan_swap_func.____fmt, i32 noundef 18) #6, !dbg !429
  call void @llvm.dbg.value(metadata ptr undef, metadata !148, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.value(metadata ptr %6, metadata !149, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.value(metadata ptr undef, metadata !150, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.value(metadata ptr %9, metadata !151, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.value(metadata i32 14, metadata !152, metadata !DIExpression()), !dbg !431
  %11 = getelementptr i8, ptr %9, i64 14, !dbg !433
  %12 = icmp ugt ptr %11, %6, !dbg !434
  br i1 %12, label %84, label %13, !dbg !435

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr %11, metadata !100, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.value(metadata ptr %9, metadata !105, metadata !DIExpression()), !dbg !422
  %14 = getelementptr inbounds %struct.ethhdr, ptr %9, i64 0, i32 2, !dbg !436
  %15 = load i16, ptr %14, align 1, !dbg !436, !tbaa !344
  call void @llvm.dbg.value(metadata i16 %15, metadata !153, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !431
  call void @llvm.dbg.value(metadata i16 poison, metadata !347, metadata !DIExpression()), !dbg !437
  %16 = icmp eq i16 %15, 129, !dbg !439
  %17 = icmp eq i16 %15, -22392, !dbg !440
  %18 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %16)
  %19 = or i1 %17, %18, !dbg !440
  call void @llvm.dbg.value(metadata i1 %19, metadata !154, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !431
  br i1 %19, label %20, label %27, !dbg !441

20:                                               ; preds = %13
  %21 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @parse_ethhdr.____fmt, i32 noundef 18) #6, !dbg !442
  call void @llvm.dbg.value(metadata ptr %11, metadata !155, metadata !DIExpression()), !dbg !443
  call void @llvm.dbg.value(metadata i32 4, metadata !158, metadata !DIExpression()), !dbg !443
  %22 = getelementptr i8, ptr %9, i64 18, !dbg !444
  %23 = icmp ugt ptr %22, %6, !dbg !445
  br i1 %23, label %84, label %24, !dbg !446

24:                                               ; preds = %20
  call void @llvm.dbg.value(metadata ptr %22, metadata !100, metadata !DIExpression()), !dbg !422
  %25 = getelementptr i8, ptr %9, i64 16, !dbg !447
  %26 = load i16, ptr %25, align 2, !dbg !447, !tbaa !365
  call void @llvm.dbg.value(metadata i16 %26, metadata !153, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !431
  br label %27

27:                                               ; preds = %13, %24
  %28 = phi i16 [ %26, %24 ], [ %15, %13 ]
  %29 = zext i16 %28 to i32, !dbg !448
  call void @llvm.dbg.value(metadata i32 %29, metadata !153, metadata !DIExpression()), !dbg !431
  %30 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @parse_ethhdr.____fmt.2, i32 noundef 18, i32 noundef %29) #6, !dbg !449
  call void @llvm.dbg.value(metadata ptr %9, metadata !105, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.value(metadata i32 %29, metadata !104, metadata !DIExpression()), !dbg !422
  %31 = load i16, ptr %14, align 1, !dbg !450, !tbaa !344
  call void @llvm.dbg.value(metadata i16 poison, metadata !347, metadata !DIExpression()), !dbg !452
  %32 = icmp eq i16 %31, 129, !dbg !454
  %33 = icmp eq i16 %31, -22392, !dbg !455
  %34 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %32)
  %35 = or i1 %33, %34, !dbg !455
  %36 = load i32, ptr %3, align 4, !dbg !456, !tbaa !326
  %37 = zext i32 %36 to i64, !dbg !456
  %38 = inttoptr i64 %37 to ptr, !dbg !456
  br i1 %35, label %39, label %65, !dbg !457

39:                                               ; preds = %27
  call void @llvm.dbg.assign(metadata i1 undef, metadata !178, metadata !DIExpression(), metadata !421, metadata ptr %2, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata ptr %0, metadata !174, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata ptr %9, metadata !175, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata ptr %38, metadata !176, metadata !DIExpression()), !dbg !458
  call void @llvm.lifetime.start.p0(i64 14, ptr nonnull %2), !dbg !460
  call void @llvm.dbg.value(metadata ptr %9, metadata !181, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata i32 -1, metadata !182, metadata !DIExpression()), !dbg !458
  %40 = icmp ugt ptr %11, %38, !dbg !461
  %41 = getelementptr inbounds i8, ptr %9, i64 18
  %42 = icmp ugt ptr %41, %38
  %43 = select i1 %40, i1 true, i1 %42, !dbg !463
  call void @llvm.dbg.value(metadata ptr %11, metadata !179, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.value(metadata ptr %11, metadata !181, metadata !DIExpression()), !dbg !458
  br i1 %43, label %64, label %44, !dbg !463

44:                                               ; preds = %39
  %45 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @vlan_tag_pop.____fmt, i32 noundef 27) #6, !dbg !464
  %46 = load i16, ptr %11, align 2, !dbg !466, !tbaa !467
  call void @llvm.dbg.value(metadata i16 poison, metadata !182, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 4095, DW_OP_and, DW_OP_stack_value)), !dbg !458
  %47 = getelementptr inbounds i8, ptr %9, i64 16, !dbg !468
  %48 = load i16, ptr %47, align 2, !dbg !468, !tbaa !365
  call void @llvm.dbg.value(metadata i16 %48, metadata !180, metadata !DIExpression()), !dbg !458
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(14) %2, ptr noundef nonnull align 1 dereferenceable(14) %9, i64 14, i1 false), !dbg !469, !DIAssignID !470
  call void @llvm.dbg.assign(metadata i1 undef, metadata !178, metadata !DIExpression(), metadata !470, metadata ptr %2, metadata !DIExpression()), !dbg !458
  %49 = tail call i64 inttoptr (i64 44 to ptr)(ptr noundef nonnull %0, i32 noundef 4) #6, !dbg !471
  %50 = load i32, ptr %0, align 4, !dbg !472, !tbaa !334
  %51 = zext i32 %50 to i64, !dbg !473
  %52 = inttoptr i64 %51 to ptr, !dbg !474
  call void @llvm.dbg.value(metadata ptr %52, metadata !177, metadata !DIExpression()), !dbg !458
  %53 = load i32, ptr %3, align 4, !dbg !475, !tbaa !326
  %54 = zext i32 %53 to i64, !dbg !476
  %55 = inttoptr i64 %54 to ptr, !dbg !477
  call void @llvm.dbg.value(metadata ptr %55, metadata !176, metadata !DIExpression()), !dbg !458
  %56 = getelementptr i8, ptr %52, i64 14, !dbg !478
  %57 = icmp ugt ptr %56, %55, !dbg !480
  br i1 %57, label %64, label %58, !dbg !481

58:                                               ; preds = %44
  call void @llvm.dbg.value(metadata i16 poison, metadata !182, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 4095, DW_OP_and, DW_OP_stack_value)), !dbg !458
  %59 = and i16 %46, -241, !dbg !482
  %60 = tail call i16 @llvm.bswap.i16(i16 %59), !dbg !482
  %61 = zext i16 %60 to i32, !dbg !482
  call void @llvm.dbg.value(metadata i32 %61, metadata !182, metadata !DIExpression()), !dbg !458
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(14) %52, ptr noundef nonnull align 1 dereferenceable(14) %2, i64 12, i1 false), !dbg !483
  call void @llvm.dbg.value(metadata ptr %52, metadata !175, metadata !DIExpression()), !dbg !458
  %62 = getelementptr inbounds %struct.ethhdr, ptr %52, i64 0, i32 2, !dbg !484
  store i16 %48, ptr %62, align 1, !dbg !485, !tbaa !344
  %63 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @vlan_tag_pop.____fmt.3, i32 noundef 10, i32 noundef %61) #6, !dbg !486
  br label %64, !dbg !488

64:                                               ; preds = %39, %44, %58
  call void @llvm.lifetime.end.p0(i64 14, ptr nonnull %2), !dbg !489
  br label %84, !dbg !490

65:                                               ; preds = %27
  call void @llvm.dbg.assign(metadata i1 undef, metadata !207, metadata !DIExpression(), metadata !491, metadata ptr undef, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata ptr %0, metadata !202, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata ptr %9, metadata !203, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata i32 2, metadata !204, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata ptr %38, metadata !205, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata ptr %9, metadata !211, metadata !DIExpression()), !dbg !492
  %66 = icmp ugt ptr %11, %38, !dbg !494
  br i1 %66, label %84, label %67, !dbg !496

67:                                               ; preds = %65
  call void @llvm.dbg.value(metadata i16 %31, metadata !210, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata i16 512, metadata !208, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 16)), !dbg !492
  %68 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @vlan_tag_push.____fmt, i32 noundef 10, i32 noundef 2) #6, !dbg !497
  call void @llvm.dbg.value(metadata i16 %31, metadata !208, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 16)), !dbg !492
  call void @llvm.dbg.assign(metadata i1 undef, metadata !207, metadata !DIExpression(), metadata !499, metadata ptr undef, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata i32 -4, metadata !212, metadata !DIExpression()), !dbg !492
  %69 = tail call i64 inttoptr (i64 44 to ptr)(ptr noundef nonnull %0, i32 noundef -4) #6, !dbg !500
  %70 = load i32, ptr %0, align 4, !dbg !501, !tbaa !334
  %71 = zext i32 %70 to i64, !dbg !502
  %72 = inttoptr i64 %71 to ptr, !dbg !503
  call void @llvm.dbg.value(metadata ptr %72, metadata !206, metadata !DIExpression()), !dbg !492
  %73 = load i32, ptr %3, align 4, !dbg !504, !tbaa !326
  %74 = zext i32 %73 to i64, !dbg !505
  %75 = inttoptr i64 %74 to ptr, !dbg !506
  call void @llvm.dbg.value(metadata ptr %75, metadata !205, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata ptr %72, metadata !211, metadata !DIExpression()), !dbg !492
  %76 = getelementptr inbounds i8, ptr %72, i64 14, !dbg !507
  %77 = icmp ugt ptr %76, %75, !dbg !509
  br i1 %77, label %84, label %78, !dbg !510

78:                                               ; preds = %67
  call void @llvm.dbg.value(metadata ptr %72, metadata !203, metadata !DIExpression()), !dbg !492
  %79 = getelementptr inbounds %struct.ethhdr, ptr %72, i64 0, i32 2, !dbg !511
  store i16 129, ptr %79, align 1, !dbg !512, !tbaa !344
  call void @llvm.dbg.value(metadata ptr %76, metadata !209, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata ptr %76, metadata !211, metadata !DIExpression()), !dbg !492
  %80 = getelementptr inbounds i8, ptr %72, i64 18, !dbg !513
  %81 = icmp ugt ptr %80, %75, !dbg !515
  br i1 %81, label %84, label %82, !dbg !516

82:                                               ; preds = %78
  store i16 512, ptr %76, align 2, !dbg !517
  %83 = getelementptr inbounds i8, ptr %72, i64 16, !dbg !517
  store i16 %31, ptr %83, align 2, !dbg !517
  br label %84, !dbg !518

84:                                               ; preds = %20, %1, %82, %78, %67, %65, %64
  ret i32 2, !dbg !519
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: nounwind
define dso_local i32 @xdp_parser_func(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !520 {
  %2 = alloca i32, align 4, !DIAssignID !601
  call void @llvm.dbg.value(metadata ptr %0, metadata !522, metadata !DIExpression()), !dbg !602
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !603
  %4 = load i32, ptr %3, align 4, !dbg !603, !tbaa !326
  %5 = zext i32 %4 to i64, !dbg !604
  %6 = inttoptr i64 %5 to ptr, !dbg !605
  call void @llvm.dbg.value(metadata ptr %6, metadata !523, metadata !DIExpression()), !dbg !602
  %7 = load i32, ptr %0, align 4, !dbg !606, !tbaa !334
  %8 = zext i32 %7 to i64, !dbg !607
  %9 = inttoptr i64 %8 to ptr, !dbg !608
  call void @llvm.dbg.value(metadata ptr %9, metadata !524, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata i32 2, metadata !525, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata ptr %9, metadata !526, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata ptr undef, metadata !148, metadata !DIExpression()), !dbg !609
  call void @llvm.dbg.value(metadata ptr %6, metadata !149, metadata !DIExpression()), !dbg !609
  call void @llvm.dbg.value(metadata ptr undef, metadata !150, metadata !DIExpression()), !dbg !609
  call void @llvm.dbg.value(metadata ptr %9, metadata !151, metadata !DIExpression()), !dbg !609
  call void @llvm.dbg.value(metadata i32 14, metadata !152, metadata !DIExpression()), !dbg !609
  %10 = getelementptr i8, ptr %9, i64 14, !dbg !611
  %11 = icmp ugt ptr %10, %6, !dbg !612
  br i1 %11, label %70, label %12, !dbg !613

12:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr %10, metadata !526, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata ptr %9, metadata !528, metadata !DIExpression()), !dbg !602
  %13 = getelementptr inbounds %struct.ethhdr, ptr %9, i64 0, i32 2, !dbg !614
  %14 = load i16, ptr %13, align 1, !dbg !614, !tbaa !344
  call void @llvm.dbg.value(metadata i16 %14, metadata !153, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !609
  call void @llvm.dbg.value(metadata i16 poison, metadata !347, metadata !DIExpression()), !dbg !615
  %15 = icmp eq i16 %14, 129, !dbg !617
  %16 = icmp eq i16 %14, -22392, !dbg !618
  %17 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %15)
  %18 = or i1 %16, %17, !dbg !618
  call void @llvm.dbg.value(metadata i1 %18, metadata !154, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !609
  br i1 %18, label %19, label %26, !dbg !619

19:                                               ; preds = %12
  %20 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @parse_ethhdr.____fmt, i32 noundef 18) #6, !dbg !620
  call void @llvm.dbg.value(metadata ptr %10, metadata !155, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i32 4, metadata !158, metadata !DIExpression()), !dbg !621
  %21 = getelementptr i8, ptr %9, i64 18, !dbg !622
  %22 = icmp ugt ptr %21, %6, !dbg !623
  br i1 %22, label %70, label %23, !dbg !624

23:                                               ; preds = %19
  call void @llvm.dbg.value(metadata ptr %21, metadata !526, metadata !DIExpression()), !dbg !602
  %24 = getelementptr i8, ptr %9, i64 16, !dbg !625
  %25 = load i16, ptr %24, align 2, !dbg !625, !tbaa !365
  call void @llvm.dbg.value(metadata i16 %25, metadata !153, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !609
  br label %26

26:                                               ; preds = %12, %23
  %27 = phi ptr [ %21, %23 ], [ %10, %12 ], !dbg !609
  %28 = phi i16 [ %25, %23 ], [ %14, %12 ]
  call void @llvm.dbg.value(metadata ptr %27, metadata !526, metadata !DIExpression()), !dbg !602
  %29 = zext i16 %28 to i32, !dbg !626
  call void @llvm.dbg.value(metadata i32 %29, metadata !153, metadata !DIExpression()), !dbg !609
  %30 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @parse_ethhdr.____fmt.2, i32 noundef 18, i32 noundef %29) #6, !dbg !627
  call void @llvm.dbg.value(metadata i32 %29, metadata !527, metadata !DIExpression()), !dbg !602
  switch i16 %28, label %70 [
    i16 -8826, label %31
    i16 8, label %46
  ], !dbg !628

31:                                               ; preds = %26
  call void @llvm.dbg.value(metadata ptr undef, metadata !374, metadata !DIExpression()), !dbg !629
  call void @llvm.dbg.value(metadata ptr %6, metadata !380, metadata !DIExpression()), !dbg !629
  call void @llvm.dbg.value(metadata ptr undef, metadata !381, metadata !DIExpression()), !dbg !629
  call void @llvm.dbg.value(metadata ptr %27, metadata !382, metadata !DIExpression()), !dbg !629
  call void @llvm.dbg.value(metadata i32 40, metadata !383, metadata !DIExpression()), !dbg !629
  %32 = getelementptr i8, ptr %27, i64 40, !dbg !631
  %33 = icmp ugt ptr %32, %6, !dbg !632
  br i1 %33, label %70, label %34, !dbg !633

34:                                               ; preds = %31
  call void @llvm.dbg.value(metadata ptr %32, metadata !526, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata ptr %27, metadata !529, metadata !DIExpression()), !dbg !634
  %35 = getelementptr inbounds %struct.ipv6hdr, ptr %27, i64 0, i32 3, !dbg !635
  %36 = load i8, ptr %35, align 2, !dbg !635, !tbaa !392
  call void @llvm.dbg.value(metadata i8 %36, metadata !527, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !602
  %37 = icmp ne i8 %36, 58, !dbg !636
  %38 = getelementptr i8, ptr %27, i64 48
  %39 = icmp ugt ptr %38, %6
  %40 = or i1 %39, %37, !dbg !638
  call void @llvm.dbg.value(metadata ptr undef, metadata !639, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata ptr %6, metadata !645, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata ptr undef, metadata !646, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata ptr %32, metadata !647, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata i32 8, metadata !648, metadata !DIExpression()), !dbg !649
  br i1 %40, label %70, label %41, !dbg !638

41:                                               ; preds = %34
  call void @llvm.dbg.value(metadata ptr %32, metadata !532, metadata !DIExpression()), !dbg !634
  %42 = getelementptr i8, ptr %27, i64 46, !dbg !651
  %43 = load i16, ptr %42, align 2, !dbg !651, !tbaa !652
  call void @llvm.dbg.value(metadata i16 %43, metadata !527, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !602
  %44 = icmp eq i16 %43, 128, !dbg !653
  br i1 %44, label %45, label %70, !dbg !655

45:                                               ; preds = %41
  call void @llvm.dbg.value(metadata i32 1, metadata !525, metadata !DIExpression()), !dbg !602
  br label %70, !dbg !656

46:                                               ; preds = %26
  call void @llvm.dbg.value(metadata ptr undef, metadata !237, metadata !DIExpression()), !dbg !657
  call void @llvm.dbg.value(metadata ptr %6, metadata !238, metadata !DIExpression()), !dbg !657
  call void @llvm.dbg.value(metadata ptr undef, metadata !239, metadata !DIExpression()), !dbg !657
  call void @llvm.dbg.value(metadata ptr %27, metadata !240, metadata !DIExpression()), !dbg !657
  %47 = getelementptr i8, ptr %27, i64 20, !dbg !659
  %48 = icmp ugt ptr %47, %6, !dbg !661
  br i1 %48, label %70, label %49, !dbg !662

49:                                               ; preds = %46
  %50 = load i8, ptr %27, align 4, !dbg !663
  %51 = shl i8 %50, 2, !dbg !664
  %52 = and i8 %51, 60, !dbg !664
  %53 = zext i8 %52 to i32, !dbg !664
  call void @llvm.dbg.value(metadata i32 %53, metadata !241, metadata !DIExpression()), !dbg !657
  %54 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @parse_ip4hdr.____fmt, i32 noundef 16, i32 noundef %53) #6, !dbg !665
  %55 = zext i8 %52 to i64
  %56 = getelementptr i8, ptr %27, i64 %55, !dbg !667
  %57 = icmp ugt ptr %56, %6, !dbg !669
  br i1 %57, label %70, label %58, !dbg !670

58:                                               ; preds = %49
  call void @llvm.dbg.value(metadata ptr %56, metadata !526, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata ptr %27, metadata !574, metadata !DIExpression()), !dbg !671
  %59 = getelementptr inbounds %struct.iphdr, ptr %27, i64 0, i32 6, !dbg !672
  %60 = load i8, ptr %59, align 1, !dbg !672, !tbaa !673
  call void @llvm.dbg.value(metadata i8 %60, metadata !527, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !602
  %61 = icmp ne i8 %60, 1, !dbg !675
  %62 = getelementptr i8, ptr %56, i64 8
  %63 = icmp ugt ptr %62, %6
  %64 = or i1 %63, %61, !dbg !677
  call void @llvm.dbg.value(metadata ptr undef, metadata !678, metadata !DIExpression()), !dbg !688
  call void @llvm.dbg.value(metadata ptr %6, metadata !684, metadata !DIExpression()), !dbg !688
  call void @llvm.dbg.value(metadata ptr undef, metadata !685, metadata !DIExpression()), !dbg !688
  call void @llvm.dbg.value(metadata ptr %56, metadata !686, metadata !DIExpression()), !dbg !688
  call void @llvm.dbg.value(metadata i32 8, metadata !687, metadata !DIExpression()), !dbg !688
  br i1 %64, label %70, label %65, !dbg !677

65:                                               ; preds = %58
  call void @llvm.dbg.value(metadata ptr %56, metadata !577, metadata !DIExpression()), !dbg !671
  %66 = getelementptr inbounds i8, ptr %56, i64 6, !dbg !690
  %67 = load i16, ptr %66, align 2, !dbg !690, !tbaa !652
  call void @llvm.dbg.value(metadata i16 %67, metadata !527, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !602
  %68 = icmp eq i16 %67, 8, !dbg !691
  br i1 %68, label %69, label %70, !dbg !693

69:                                               ; preds = %65
  call void @llvm.dbg.value(metadata i32 1, metadata !525, metadata !DIExpression()), !dbg !602
  br label %70, !dbg !694

70:                                               ; preds = %49, %46, %31, %19, %1, %69, %58, %65, %45, %34, %41, %26
  %71 = phi i32 [ 2, %26 ], [ 1, %45 ], [ 2, %34 ], [ 2, %41 ], [ 1, %69 ], [ 2, %58 ], [ 2, %65 ], [ 2, %1 ], [ 2, %19 ], [ 2, %31 ], [ 2, %46 ], [ 2, %49 ], !dbg !695
  call void @llvm.dbg.value(metadata i32 %71, metadata !525, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.label(metadata !600), !dbg !696
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !697
  call void @llvm.dbg.assign(metadata i1 undef, metadata !703, metadata !DIExpression(), metadata !601, metadata ptr %2, metadata !DIExpression()), !dbg !697
  call void @llvm.dbg.value(metadata ptr %0, metadata !702, metadata !DIExpression()), !dbg !697
  store i32 %71, ptr %2, align 4, !tbaa !706, !DIAssignID !707
  call void @llvm.dbg.assign(metadata i32 %71, metadata !703, metadata !DIExpression(), metadata !707, metadata ptr %2, metadata !DIExpression()), !dbg !697
  %72 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #6, !dbg !708
  call void @llvm.dbg.value(metadata ptr %72, metadata !704, metadata !DIExpression()), !dbg !697
  %73 = icmp eq ptr %72, null, !dbg !709
  br i1 %73, label %85, label %74, !dbg !711

74:                                               ; preds = %70
  %75 = load i64, ptr %72, align 8, !dbg !712, !tbaa !713
  %76 = add i64 %75, 1, !dbg !712
  store i64 %76, ptr %72, align 8, !dbg !712, !tbaa !713
  %77 = load i32, ptr %3, align 4, !dbg !716, !tbaa !326
  %78 = load i32, ptr %0, align 4, !dbg !717, !tbaa !334
  %79 = sub i32 %77, %78, !dbg !718
  %80 = zext i32 %79 to i64, !dbg !719
  %81 = getelementptr inbounds %struct.datarec, ptr %72, i64 0, i32 1, !dbg !720
  %82 = load i64, ptr %81, align 8, !dbg !721, !tbaa !722
  %83 = add i64 %82, %80, !dbg !721
  store i64 %83, ptr %81, align 8, !dbg !721, !tbaa !722
  %84 = load i32, ptr %2, align 4, !dbg !723, !tbaa !706
  br label %85, !dbg !724

85:                                               ; preds = %70, %74
  %86 = phi i32 [ %84, %74 ], [ 0, %70 ], !dbg !697
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !725
  ret i32 %86, !dbg !726
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.assign(metadata, metadata, metadata, metadata, metadata, metadata) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #5

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind memory(none) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!20}
!llvm.module.flags = !{!318, !319, !320, !321, !322}
!llvm.ident = !{!323}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 293, type: !315, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "xdp_port_rewrite_func", scope: !3, file: !3, line: 270, type: !4, scopeLine: 271, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !252)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet02-rewriting", checksumkind: CSK_MD5, checksum: "88d1b4c77faa8ce5d01c9d0013756d37")
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
!20 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !60, globals: !85, splitDebugInlining: false, nameTableKind: None)
!21 = !{!22, !53}
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !23, line: 28, baseType: !14, size: 32, elements: !24)
!23 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "9a7f04155c254fef1b7ada5eb82c984c")
!24 = !{!25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52}
!25 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!26 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!27 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!28 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!29 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!30 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!31 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!32 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!33 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!34 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!35 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!36 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!37 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!38 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!39 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!40 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!41 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!42 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!43 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!44 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!45 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!46 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!47 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!48 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!49 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!50 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!51 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!52 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!53 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !9, line: 5584, baseType: !14, size: 32, elements: !54)
!54 = !{!55, !56, !57, !58, !59}
!55 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!56 = !DIEnumerator(name: "XDP_DROP", value: 1)
!57 = !DIEnumerator(name: "XDP_PASS", value: 2)
!58 = !DIEnumerator(name: "XDP_TX", value: 3)
!59 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!60 = !{!61, !62, !63, !65, !68, !6, !75}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!62 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !64)
!64 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !67)
!67 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !3, line: 28, size: 32, elements: !70)
!70 = !{!71, !74}
!71 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !69, file: !3, line: 29, baseType: !72, size: 16)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !73, line: 25, baseType: !63)
!73 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!74 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !69, file: !3, line: 30, baseType: !72, size: 16, offset: 16)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !77, line: 169, size: 112, elements: !78)
!77 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "d4a01a1da3b79d23c796a4d8db749b8f")
!78 = !{!79, !83, !84}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !76, file: !77, line: 170, baseType: !80, size: 48)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !67, size: 48, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 6)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !76, file: !77, line: 171, baseType: !80, size: 48, offset: 48)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !76, file: !77, line: 172, baseType: !72, size: 16, offset: 96)
!85 = !{!0, !86, !93, !106, !111, !140, !159, !161, !168, !186, !191, !196, !213, !245}
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 298, type: !88, isLocal: true, isDefinition: true)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 144, elements: !91)
!89 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !90)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !{!92}
!92 = !DISubrange(count: 18)
!93 = !DIGlobalVariableExpression(var: !94, expr: !DIExpression())
!94 = distinct !DIGlobalVariable(name: "____fmt", scope: !95, file: !3, line: 324, type: !88, isLocal: true, isDefinition: true)
!95 = distinct !DISubprogram(name: "xdp_vlan_swap_func", scope: !3, file: !3, line: 313, type: !4, scopeLine: 314, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !96)
!96 = !{!97, !98, !99, !100, !104, !105}
!97 = !DILocalVariable(name: "ctx", arg: 1, scope: !95, file: !3, line: 313, type: !7)
!98 = !DILocalVariable(name: "data_end", scope: !95, file: !3, line: 315, type: !61)
!99 = !DILocalVariable(name: "data", scope: !95, file: !3, line: 316, type: !61)
!100 = !DILocalVariable(name: "nh", scope: !95, file: !3, line: 319, type: !101)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !3, line: 24, size: 64, elements: !102)
!102 = !{!103}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !101, file: !3, line: 25, baseType: !61, size: 64)
!104 = !DILocalVariable(name: "nh_type", scope: !95, file: !3, line: 320, type: !6)
!105 = !DILocalVariable(name: "eth", scope: !95, file: !3, line: 323, type: !75)
!106 = !DIGlobalVariableExpression(var: !107, expr: !DIExpression())
!107 = distinct !DIGlobalVariable(name: "_license", scope: !20, file: !3, line: 400, type: !108, isLocal: false, isDefinition: true)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 32, elements: !109)
!109 = !{!110}
!110 = !DISubrange(count: 4)
!111 = !DIGlobalVariableExpression(var: !112, expr: !DIExpression())
!112 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !20, file: !113, line: 22, type: !114, isLocal: false, isDefinition: true)
!113 = !DIFile(filename: "./../common/xdp_stats_kern.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet02-rewriting", checksumkind: CSK_MD5, checksum: "c978ba00f7b9781ed1e135fd8557e600")
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !113, line: 16, size: 320, elements: !115)
!115 = !{!116, !119, !121, !130, !135}
!116 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !114, file: !113, line: 17, baseType: !117, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !118, size: 64)
!118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 192, elements: !81)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !114, file: !113, line: 18, baseType: !120, size: 64, offset: 64)
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !114, file: !113, line: 19, baseType: !122, size: 64, offset: 128)
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!123 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !124, line: 10, size: 128, elements: !125)
!124 = !DIFile(filename: "./../common/xdp_stats_kern_user.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet02-rewriting", checksumkind: CSK_MD5, checksum: "96c2435685fa7da2d24f219444d8659d")
!125 = !{!126, !129}
!126 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !123, file: !124, line: 11, baseType: !127, size: 64)
!127 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !13, line: 31, baseType: !128)
!128 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !123, file: !124, line: 12, baseType: !127, size: 64, offset: 64)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !114, file: !113, line: 20, baseType: !131, size: 64, offset: 192)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 160, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 5)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "pinning", scope: !114, file: !113, line: 21, baseType: !136, size: 64, offset: 256)
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 1)
!140 = !DIGlobalVariableExpression(var: !141, expr: !DIExpression())
!141 = distinct !DIGlobalVariable(name: "____fmt", scope: !142, file: !3, line: 253, type: !88, isLocal: true, isDefinition: true)
!142 = distinct !DISubprogram(name: "parse_ethhdr", scope: !3, file: !3, line: 230, type: !143, scopeLine: 233, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !147)
!143 = !DISubroutineType(types: !144)
!144 = !{!6, !145, !61, !146}
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!147 = !{!148, !149, !150, !151, !152, !153, !154, !155, !158}
!148 = !DILocalVariable(name: "nh", arg: 1, scope: !142, file: !3, line: 230, type: !145)
!149 = !DILocalVariable(name: "data_end", arg: 2, scope: !142, file: !3, line: 231, type: !61)
!150 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !142, file: !3, line: 232, type: !146)
!151 = !DILocalVariable(name: "eth", scope: !142, file: !3, line: 234, type: !75)
!152 = !DILocalVariable(name: "hdrsize", scope: !142, file: !3, line: 235, type: !6)
!153 = !DILocalVariable(name: "l3_proto", scope: !142, file: !3, line: 236, type: !6)
!154 = !DILocalVariable(name: "vlan", scope: !142, file: !3, line: 250, type: !6)
!155 = !DILocalVariable(name: "vhdr", scope: !156, file: !3, line: 254, type: !68)
!156 = distinct !DILexicalBlock(scope: !157, file: !3, line: 252, column: 12)
!157 = distinct !DILexicalBlock(scope: !142, file: !3, line: 252, column: 6)
!158 = !DILocalVariable(name: "hdrsize", scope: !156, file: !3, line: 255, type: !6)
!159 = !DIGlobalVariableExpression(var: !160, expr: !DIExpression())
!160 = distinct !DIGlobalVariable(name: "____fmt", scope: !142, file: !3, line: 263, type: !88, isLocal: true, isDefinition: true)
!161 = !DIGlobalVariableExpression(var: !162, expr: !DIExpression())
!162 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !20, file: !163, line: 177, type: !164, isLocal: true, isDefinition: true)
!163 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet02-rewriting", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DISubroutineType(types: !166)
!166 = !{!62, !167, !12, null}
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!168 = !DIGlobalVariableExpression(var: !169, expr: !DIExpression())
!169 = distinct !DIGlobalVariable(name: "____fmt", scope: !170, file: !3, line: 68, type: !183, isLocal: true, isDefinition: true)
!170 = distinct !DISubprogram(name: "vlan_tag_pop", scope: !3, file: !3, line: 45, type: !171, scopeLine: 46, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !173)
!171 = !DISubroutineType(types: !172)
!172 = !{!6, !7, !75}
!173 = !{!174, !175, !176, !177, !178, !179, !180, !181, !182}
!174 = !DILocalVariable(name: "ctx", arg: 1, scope: !170, file: !3, line: 45, type: !7)
!175 = !DILocalVariable(name: "eth", arg: 2, scope: !170, file: !3, line: 45, type: !75)
!176 = !DILocalVariable(name: "data_end", scope: !170, file: !3, line: 48, type: !61)
!177 = !DILocalVariable(name: "data", scope: !170, file: !3, line: 49, type: !61)
!178 = !DILocalVariable(name: "eth_cpy", scope: !170, file: !3, line: 50, type: !76)
!179 = !DILocalVariable(name: "vlh", scope: !170, file: !3, line: 51, type: !68)
!180 = !DILocalVariable(name: "h_proto", scope: !170, file: !3, line: 52, type: !72)
!181 = !DILocalVariable(name: "curr", scope: !170, file: !3, line: 53, type: !65)
!182 = !DILocalVariable(name: "vlid", scope: !170, file: !3, line: 57, type: !6)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 216, elements: !184)
!184 = !{!185}
!185 = !DISubrange(count: 27)
!186 = !DIGlobalVariableExpression(var: !187, expr: !DIExpression())
!187 = distinct !DIGlobalVariable(name: "____fmt", scope: !170, file: !3, line: 88, type: !188, isLocal: true, isDefinition: true)
!188 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 80, elements: !189)
!189 = !{!190}
!190 = !DISubrange(count: 10)
!191 = !DIGlobalVariableExpression(var: !192, expr: !DIExpression())
!192 = distinct !DIGlobalVariable(name: "bpf_xdp_adjust_head", scope: !20, file: !163, line: 1134, type: !193, isLocal: true, isDefinition: true)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !194, size: 64)
!194 = !DISubroutineType(types: !195)
!195 = !{!62, !7, !6}
!196 = !DIGlobalVariableExpression(var: !197, expr: !DIExpression())
!197 = distinct !DIGlobalVariable(name: "____fmt", scope: !198, file: !3, line: 116, type: !188, isLocal: true, isDefinition: true)
!198 = distinct !DISubprogram(name: "vlan_tag_push", scope: !3, file: !3, line: 95, type: !199, scopeLine: 97, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !201)
!199 = !DISubroutineType(types: !200)
!200 = !{!6, !7, !75, !6}
!201 = !{!202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212}
!202 = !DILocalVariable(name: "ctx", arg: 1, scope: !198, file: !3, line: 95, type: !7)
!203 = !DILocalVariable(name: "eth", arg: 2, scope: !198, file: !3, line: 96, type: !75)
!204 = !DILocalVariable(name: "vlid", arg: 3, scope: !198, file: !3, line: 96, type: !6)
!205 = !DILocalVariable(name: "data_end", scope: !198, file: !3, line: 98, type: !61)
!206 = !DILocalVariable(name: "data", scope: !198, file: !3, line: 99, type: !61)
!207 = !DILocalVariable(name: "ether_copy", scope: !198, file: !3, line: 100, type: !76)
!208 = !DILocalVariable(name: "vlh", scope: !198, file: !3, line: 101, type: !69)
!209 = !DILocalVariable(name: "vlhdr", scope: !198, file: !3, line: 102, type: !68)
!210 = !DILocalVariable(name: "h_proto", scope: !198, file: !3, line: 103, type: !72)
!211 = !DILocalVariable(name: "curr", scope: !198, file: !3, line: 104, type: !65)
!212 = !DILocalVariable(name: "vlh_space", scope: !198, file: !3, line: 105, type: !6)
!213 = !DIGlobalVariableExpression(var: !214, expr: !DIExpression())
!214 = distinct !DIGlobalVariable(name: "____fmt", scope: !215, file: !3, line: 172, type: !242, isLocal: true, isDefinition: true)
!215 = distinct !DISubprogram(name: "parse_ip4hdr", scope: !3, file: !3, line: 163, type: !216, scopeLine: 166, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !236)
!216 = !DISubroutineType(types: !217)
!217 = !{!6, !145, !61, !218}
!218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !219, size: 64)
!219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !220, size: 64)
!220 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !221, line: 86, size: 160, elements: !222)
!221 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "91bb7f0ed6560290b754374efff83769")
!222 = !{!223, !224, !225, !226, !227, !228, !229, !230, !231, !233, !235}
!223 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !220, file: !221, line: 88, baseType: !66, size: 4, flags: DIFlagBitField, extraData: i64 0)
!224 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !220, file: !221, line: 89, baseType: !66, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !220, file: !221, line: 96, baseType: !66, size: 8, offset: 8)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !220, file: !221, line: 97, baseType: !72, size: 16, offset: 16)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !220, file: !221, line: 98, baseType: !72, size: 16, offset: 32)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !220, file: !221, line: 99, baseType: !72, size: 16, offset: 48)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !220, file: !221, line: 100, baseType: !66, size: 8, offset: 64)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !220, file: !221, line: 101, baseType: !66, size: 8, offset: 72)
!231 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !220, file: !221, line: 102, baseType: !232, size: 16, offset: 80)
!232 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !73, line: 31, baseType: !63)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !220, file: !221, line: 103, baseType: !234, size: 32, offset: 96)
!234 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !73, line: 27, baseType: !12)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !220, file: !221, line: 104, baseType: !234, size: 32, offset: 128)
!236 = !{!237, !238, !239, !240, !241}
!237 = !DILocalVariable(name: "nh", arg: 1, scope: !215, file: !3, line: 163, type: !145)
!238 = !DILocalVariable(name: "data_end", arg: 2, scope: !215, file: !3, line: 164, type: !61)
!239 = !DILocalVariable(name: "ip4hdr", arg: 3, scope: !215, file: !3, line: 165, type: !218)
!240 = !DILocalVariable(name: "ip4", scope: !215, file: !3, line: 168, type: !219)
!241 = !DILocalVariable(name: "hdrsize", scope: !215, file: !3, line: 171, type: !6)
!242 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 128, elements: !243)
!243 = !{!244}
!244 = !DISubrange(count: 16)
!245 = !DIGlobalVariableExpression(var: !246, expr: !DIExpression())
!246 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !20, file: !163, line: 56, type: !247, isLocal: true, isDefinition: true)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !248, size: 64)
!248 = !DISubroutineType(types: !249)
!249 = !{!61, !61, !250}
!250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !251, size: 64)
!251 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!252 = !{!253, !254, !255, !256, !257, !258, !259, !291}
!253 = !DILocalVariable(name: "ctx", arg: 1, scope: !2, file: !3, line: 270, type: !7)
!254 = !DILocalVariable(name: "data_end", scope: !2, file: !3, line: 272, type: !61)
!255 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 273, type: !61)
!256 = !DILocalVariable(name: "nh", scope: !2, file: !3, line: 277, type: !101)
!257 = !DILocalVariable(name: "nh_type", scope: !2, file: !3, line: 278, type: !6)
!258 = !DILocalVariable(name: "eth", scope: !2, file: !3, line: 281, type: !75)
!259 = !DILocalVariable(name: "ip6", scope: !260, file: !3, line: 291, type: !262)
!260 = distinct !DILexicalBlock(scope: !261, file: !3, line: 290, column: 40)
!261 = distinct !DILexicalBlock(scope: !2, file: !3, line: 290, column: 6)
!262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !263, size: 64)
!263 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !264, line: 117, size: 320, elements: !265)
!264 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4a65c85349cc7a670732aecc94eade8f")
!265 = !{!266, !267, !268, !272, !273, !274, !275, !290}
!266 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !263, file: !264, line: 119, baseType: !66, size: 4, flags: DIFlagBitField, extraData: i64 0)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !263, file: !264, line: 120, baseType: !66, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !263, file: !264, line: 127, baseType: !269, size: 24, offset: 8)
!269 = !DICompositeType(tag: DW_TAG_array_type, baseType: !66, size: 24, elements: !270)
!270 = !{!271}
!271 = !DISubrange(count: 3)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !263, file: !264, line: 129, baseType: !72, size: 16, offset: 32)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !263, file: !264, line: 130, baseType: !66, size: 8, offset: 48)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !263, file: !264, line: 131, baseType: !66, size: 8, offset: 56)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !263, file: !264, line: 133, baseType: !276, size: 128, offset: 64)
!276 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !277, line: 33, size: 128, elements: !278)
!277 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!278 = !{!279}
!279 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !276, file: !277, line: 40, baseType: !280, size: 128)
!280 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !276, file: !277, line: 34, size: 128, elements: !281)
!281 = !{!282, !284, !288}
!282 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !280, file: !277, line: 35, baseType: !283, size: 128)
!283 = !DICompositeType(tag: DW_TAG_array_type, baseType: !66, size: 128, elements: !243)
!284 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !280, file: !277, line: 37, baseType: !285, size: 128)
!285 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 128, elements: !286)
!286 = !{!287}
!287 = !DISubrange(count: 8)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !280, file: !277, line: 38, baseType: !289, size: 128)
!289 = !DICompositeType(tag: DW_TAG_array_type, baseType: !234, size: 128, elements: !109)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !263, file: !264, line: 134, baseType: !276, size: 128, offset: 192)
!291 = !DILocalVariable(name: "tcph", scope: !292, file: !3, line: 299, type: !294)
!292 = distinct !DILexicalBlock(scope: !293, file: !3, line: 297, column: 31)
!293 = distinct !DILexicalBlock(scope: !260, file: !3, line: 297, column: 7)
!294 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !295, size: 64)
!295 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !296, line: 25, size: 160, elements: !297)
!296 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "8d74bf2133e7b3dab885994b9916aa13")
!297 = !{!298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !313, !314}
!298 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !295, file: !296, line: 26, baseType: !72, size: 16)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !295, file: !296, line: 27, baseType: !72, size: 16, offset: 16)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !295, file: !296, line: 28, baseType: !234, size: 32, offset: 32)
!301 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !295, file: !296, line: 29, baseType: !234, size: 32, offset: 64)
!302 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !295, file: !296, line: 31, baseType: !63, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!303 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !295, file: !296, line: 32, baseType: !63, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!304 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !295, file: !296, line: 33, baseType: !63, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !295, file: !296, line: 34, baseType: !63, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !295, file: !296, line: 35, baseType: !63, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !295, file: !296, line: 36, baseType: !63, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !295, file: !296, line: 37, baseType: !63, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !295, file: !296, line: 38, baseType: !63, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !295, file: !296, line: 39, baseType: !63, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!311 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !295, file: !296, line: 40, baseType: !63, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!312 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !295, file: !296, line: 55, baseType: !72, size: 16, offset: 112)
!313 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !295, file: !296, line: 56, baseType: !232, size: 16, offset: 128)
!314 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !295, file: !296, line: 57, baseType: !72, size: 16, offset: 144)
!315 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 152, elements: !316)
!316 = !{!317}
!317 = !DISubrange(count: 19)
!318 = !{i32 7, !"Dwarf Version", i32 5}
!319 = !{i32 2, !"Debug Info Version", i32 3}
!320 = !{i32 1, !"wchar_size", i32 4}
!321 = !{i32 7, !"frame-pointer", i32 2}
!322 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!323 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)"}
!324 = !DILocation(line: 0, scope: !2)
!325 = !DILocation(line: 272, column: 38, scope: !2)
!326 = !{!327, !328, i64 4}
!327 = !{!"xdp_md", !328, i64 0, !328, i64 4, !328, i64 8, !328, i64 12, !328, i64 16, !328, i64 20}
!328 = !{!"int", !329, i64 0}
!329 = !{!"omnipotent char", !330, i64 0}
!330 = !{!"Simple C/C++ TBAA"}
!331 = !DILocation(line: 272, column: 27, scope: !2)
!332 = !DILocation(line: 272, column: 19, scope: !2)
!333 = !DILocation(line: 273, column: 34, scope: !2)
!334 = !{!327, !328, i64 0}
!335 = !DILocation(line: 273, column: 23, scope: !2)
!336 = !DILocation(line: 273, column: 15, scope: !2)
!337 = !DILocation(line: 0, scope: !142, inlinedAt: !338)
!338 = distinct !DILocation(line: 287, column: 12, scope: !2)
!339 = !DILocation(line: 241, column: 14, scope: !340, inlinedAt: !338)
!340 = distinct !DILexicalBlock(scope: !142, file: !3, line: 241, column: 6)
!341 = !DILocation(line: 241, column: 24, scope: !340, inlinedAt: !338)
!342 = !DILocation(line: 241, column: 6, scope: !142, inlinedAt: !338)
!343 = !DILocation(line: 247, column: 18, scope: !142, inlinedAt: !338)
!344 = !{!345, !346, i64 12}
!345 = !{!"ethhdr", !329, i64 0, !329, i64 6, !346, i64 12}
!346 = !{!"short", !329, i64 0}
!347 = !DILocalVariable(name: "proto", arg: 1, scope: !348, file: !3, line: 34, type: !63)
!348 = distinct !DISubprogram(name: "isvlan", scope: !3, file: !3, line: 34, type: !349, scopeLine: 35, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !351)
!349 = !DISubroutineType(types: !350)
!350 = !{!6, !63}
!351 = !{!347}
!352 = !DILocation(line: 0, scope: !348, inlinedAt: !353)
!353 = distinct !DILocation(line: 250, column: 13, scope: !142, inlinedAt: !338)
!354 = !DILocation(line: 36, column: 18, scope: !348, inlinedAt: !353)
!355 = !DILocation(line: 36, column: 33, scope: !348, inlinedAt: !353)
!356 = !DILocation(line: 252, column: 6, scope: !142, inlinedAt: !338)
!357 = !DILocation(line: 253, column: 3, scope: !358, inlinedAt: !338)
!358 = distinct !DILexicalBlock(scope: !156, file: !3, line: 253, column: 3)
!359 = !DILocation(line: 0, scope: !156, inlinedAt: !338)
!360 = !DILocation(line: 257, column: 15, scope: !361, inlinedAt: !338)
!361 = distinct !DILexicalBlock(scope: !156, file: !3, line: 257, column: 7)
!362 = !DILocation(line: 257, column: 25, scope: !361, inlinedAt: !338)
!363 = !DILocation(line: 257, column: 7, scope: !156, inlinedAt: !338)
!364 = !DILocation(line: 261, column: 20, scope: !156, inlinedAt: !338)
!365 = !{!366, !346, i64 2}
!366 = !{!"vlan_hdr", !346, i64 0, !346, i64 2}
!367 = !DILocation(line: 247, column: 11, scope: !142, inlinedAt: !338)
!368 = !DILocation(line: 263, column: 2, scope: !369, inlinedAt: !338)
!369 = distinct !DILexicalBlock(scope: !142, file: !3, line: 263, column: 2)
!370 = !DILocation(line: 290, column: 14, scope: !261)
!371 = !DILocation(line: 290, column: 6, scope: !2)
!372 = !DILocation(line: 293, column: 3, scope: !373)
!373 = distinct !DILexicalBlock(scope: !260, file: !3, line: 293, column: 3)
!374 = !DILocalVariable(name: "nh", arg: 1, scope: !375, file: !3, line: 184, type: !145)
!375 = distinct !DISubprogram(name: "parse_ipv6hdr", scope: !3, file: !3, line: 184, type: !376, scopeLine: 187, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !379)
!376 = !DISubroutineType(types: !377)
!377 = !{!6, !145, !61, !378}
!378 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !262, size: 64)
!379 = !{!374, !380, !381, !382, !383}
!380 = !DILocalVariable(name: "data_end", arg: 2, scope: !375, file: !3, line: 185, type: !61)
!381 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !375, file: !3, line: 186, type: !378)
!382 = !DILocalVariable(name: "ip6", scope: !375, file: !3, line: 188, type: !262)
!383 = !DILocalVariable(name: "hdrsize", scope: !375, file: !3, line: 189, type: !6)
!384 = !DILocation(line: 0, scope: !375, inlinedAt: !385)
!385 = distinct !DILocation(line: 294, column: 13, scope: !260)
!386 = !DILocation(line: 191, column: 14, scope: !387, inlinedAt: !385)
!387 = distinct !DILexicalBlock(scope: !375, file: !3, line: 191, column: 6)
!388 = !DILocation(line: 191, column: 24, scope: !387, inlinedAt: !385)
!389 = !DILocation(line: 191, column: 6, scope: !375, inlinedAt: !385)
!390 = !DILocation(line: 0, scope: !260)
!391 = !DILocation(line: 197, column: 14, scope: !375, inlinedAt: !385)
!392 = !{!393, !329, i64 6}
!393 = !{!"ipv6hdr", !329, i64 0, !329, i64 0, !329, i64 1, !346, i64 4, !329, i64 6, !329, i64 7, !394, i64 8, !394, i64 24}
!394 = !{!"in6_addr", !329, i64 0}
!395 = !DILocation(line: 297, column: 15, scope: !293)
!396 = !DILocation(line: 297, column: 7, scope: !260)
!397 = !DILocation(line: 298, column: 4, scope: !398)
!398 = distinct !DILexicalBlock(scope: !292, file: !3, line: 298, column: 4)
!399 = !DILocalVariable(name: "nh", arg: 1, scope: !400, file: !3, line: 146, type: !145)
!400 = distinct !DISubprogram(name: "parse_tcphdr", scope: !3, file: !3, line: 146, type: !401, scopeLine: 149, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !404)
!401 = !DISubroutineType(types: !402)
!402 = !{!6, !145, !61, !403}
!403 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !294, size: 64)
!404 = !{!399, !405, !406, !407, !408}
!405 = !DILocalVariable(name: "data_end", arg: 2, scope: !400, file: !3, line: 147, type: !61)
!406 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !400, file: !3, line: 148, type: !403)
!407 = !DILocalVariable(name: "tcph", scope: !400, file: !3, line: 150, type: !294)
!408 = !DILocalVariable(name: "hdrsize", scope: !400, file: !3, line: 151, type: !6)
!409 = !DILocation(line: 0, scope: !400, inlinedAt: !410)
!410 = distinct !DILocation(line: 300, column: 14, scope: !292)
!411 = !DILocation(line: 153, column: 14, scope: !412, inlinedAt: !410)
!412 = distinct !DILexicalBlock(scope: !400, file: !3, line: 153, column: 6)
!413 = !DILocation(line: 153, column: 24, scope: !412, inlinedAt: !410)
!414 = !DILocation(line: 153, column: 6, scope: !400, inlinedAt: !410)
!415 = !DILocation(line: 156, column: 15, scope: !400, inlinedAt: !410)
!416 = !{!417, !346, i64 2}
!417 = !{!"tcphdr", !346, i64 0, !346, i64 2, !328, i64 4, !328, i64 8, !346, i64 12, !346, i64 12, !346, i64 13, !346, i64 13, !346, i64 13, !346, i64 13, !346, i64 13, !346, i64 13, !346, i64 13, !346, i64 13, !346, i64 14, !346, i64 16, !346, i64 18}
!418 = !DILocation(line: 156, column: 13, scope: !400, inlinedAt: !410)
!419 = !DILocation(line: 0, scope: !292)
!420 = !DILocation(line: 307, column: 1, scope: !2)
!421 = distinct !DIAssignID()
!422 = !DILocation(line: 0, scope: !95)
!423 = !DILocation(line: 315, column: 38, scope: !95)
!424 = !DILocation(line: 315, column: 27, scope: !95)
!425 = !DILocation(line: 315, column: 19, scope: !95)
!426 = !DILocation(line: 316, column: 34, scope: !95)
!427 = !DILocation(line: 316, column: 23, scope: !95)
!428 = !DILocation(line: 316, column: 15, scope: !95)
!429 = !DILocation(line: 324, column: 2, scope: !430)
!430 = distinct !DILexicalBlock(scope: !95, file: !3, line: 324, column: 2)
!431 = !DILocation(line: 0, scope: !142, inlinedAt: !432)
!432 = distinct !DILocation(line: 325, column: 12, scope: !95)
!433 = !DILocation(line: 241, column: 14, scope: !340, inlinedAt: !432)
!434 = !DILocation(line: 241, column: 24, scope: !340, inlinedAt: !432)
!435 = !DILocation(line: 241, column: 6, scope: !142, inlinedAt: !432)
!436 = !DILocation(line: 247, column: 18, scope: !142, inlinedAt: !432)
!437 = !DILocation(line: 0, scope: !348, inlinedAt: !438)
!438 = distinct !DILocation(line: 250, column: 13, scope: !142, inlinedAt: !432)
!439 = !DILocation(line: 36, column: 18, scope: !348, inlinedAt: !438)
!440 = !DILocation(line: 36, column: 33, scope: !348, inlinedAt: !438)
!441 = !DILocation(line: 252, column: 6, scope: !142, inlinedAt: !432)
!442 = !DILocation(line: 253, column: 3, scope: !358, inlinedAt: !432)
!443 = !DILocation(line: 0, scope: !156, inlinedAt: !432)
!444 = !DILocation(line: 257, column: 15, scope: !361, inlinedAt: !432)
!445 = !DILocation(line: 257, column: 25, scope: !361, inlinedAt: !432)
!446 = !DILocation(line: 257, column: 7, scope: !156, inlinedAt: !432)
!447 = !DILocation(line: 261, column: 20, scope: !156, inlinedAt: !432)
!448 = !DILocation(line: 247, column: 11, scope: !142, inlinedAt: !432)
!449 = !DILocation(line: 263, column: 2, scope: !369, inlinedAt: !432)
!450 = !DILocation(line: 330, column: 13, scope: !451)
!451 = distinct !DILexicalBlock(scope: !95, file: !3, line: 330, column: 6)
!452 = !DILocation(line: 0, scope: !348, inlinedAt: !453)
!453 = distinct !DILocation(line: 330, column: 6, scope: !451)
!454 = !DILocation(line: 36, column: 18, scope: !348, inlinedAt: !453)
!455 = !DILocation(line: 36, column: 33, scope: !348, inlinedAt: !453)
!456 = !DILocation(line: 0, scope: !451)
!457 = !DILocation(line: 330, column: 6, scope: !95)
!458 = !DILocation(line: 0, scope: !170, inlinedAt: !459)
!459 = distinct !DILocation(line: 331, column: 3, scope: !451)
!460 = !DILocation(line: 50, column: 2, scope: !170, inlinedAt: !459)
!461 = !DILocation(line: 60, column: 26, scope: !462, inlinedAt: !459)
!462 = distinct !DILexicalBlock(scope: !170, file: !3, line: 60, column: 6)
!463 = !DILocation(line: 60, column: 6, scope: !170, inlinedAt: !459)
!464 = !DILocation(line: 68, column: 2, scope: !465, inlinedAt: !459)
!465 = distinct !DILexicalBlock(scope: !170, file: !3, line: 68, column: 2)
!466 = !DILocation(line: 69, column: 9, scope: !170, inlinedAt: !459)
!467 = !{!366, !346, i64 0}
!468 = !DILocation(line: 70, column: 17, scope: !170, inlinedAt: !459)
!469 = !DILocation(line: 72, column: 2, scope: !170, inlinedAt: !459)
!470 = distinct !DIAssignID()
!471 = !DILocation(line: 74, column: 2, scope: !170, inlinedAt: !459)
!472 = !DILocation(line: 78, column: 27, scope: !170, inlinedAt: !459)
!473 = !DILocation(line: 78, column: 16, scope: !170, inlinedAt: !459)
!474 = !DILocation(line: 78, column: 9, scope: !170, inlinedAt: !459)
!475 = !DILocation(line: 79, column: 32, scope: !170, inlinedAt: !459)
!476 = !DILocation(line: 79, column: 21, scope: !170, inlinedAt: !459)
!477 = !DILocation(line: 79, column: 13, scope: !170, inlinedAt: !459)
!478 = !DILocation(line: 81, column: 11, scope: !479, inlinedAt: !459)
!479 = distinct !DILexicalBlock(scope: !170, file: !3, line: 81, column: 6)
!480 = !DILocation(line: 81, column: 29, scope: !479, inlinedAt: !459)
!481 = !DILocation(line: 81, column: 6, scope: !170, inlinedAt: !459)
!482 = !DILocation(line: 69, column: 36, scope: !170, inlinedAt: !459)
!483 = !DILocation(line: 83, column: 2, scope: !170, inlinedAt: !459)
!484 = !DILocation(line: 86, column: 7, scope: !170, inlinedAt: !459)
!485 = !DILocation(line: 86, column: 15, scope: !170, inlinedAt: !459)
!486 = !DILocation(line: 88, column: 2, scope: !487, inlinedAt: !459)
!487 = distinct !DILexicalBlock(scope: !170, file: !3, line: 88, column: 2)
!488 = !DILocation(line: 89, column: 2, scope: !170, inlinedAt: !459)
!489 = !DILocation(line: 90, column: 1, scope: !170, inlinedAt: !459)
!490 = !DILocation(line: 331, column: 3, scope: !451)
!491 = distinct !DIAssignID()
!492 = !DILocation(line: 0, scope: !198, inlinedAt: !493)
!493 = distinct !DILocation(line: 333, column: 3, scope: !451)
!494 = !DILocation(line: 108, column: 26, scope: !495, inlinedAt: !493)
!495 = distinct !DILexicalBlock(scope: !198, file: !3, line: 108, column: 6)
!496 = !DILocation(line: 108, column: 6, scope: !198, inlinedAt: !493)
!497 = !DILocation(line: 116, column: 2, scope: !498, inlinedAt: !493)
!498 = distinct !DILexicalBlock(scope: !198, file: !3, line: 116, column: 2)
!499 = distinct !DIAssignID()
!500 = !DILocation(line: 123, column: 2, scope: !198, inlinedAt: !493)
!501 = !DILocation(line: 125, column: 27, scope: !198, inlinedAt: !493)
!502 = !DILocation(line: 125, column: 16, scope: !198, inlinedAt: !493)
!503 = !DILocation(line: 125, column: 9, scope: !198, inlinedAt: !493)
!504 = !DILocation(line: 126, column: 32, scope: !198, inlinedAt: !493)
!505 = !DILocation(line: 126, column: 21, scope: !198, inlinedAt: !493)
!506 = !DILocation(line: 126, column: 13, scope: !198, inlinedAt: !493)
!507 = !DILocation(line: 129, column: 11, scope: !508, inlinedAt: !493)
!508 = distinct !DILexicalBlock(scope: !198, file: !3, line: 129, column: 6)
!509 = !DILocation(line: 129, column: 26, scope: !508, inlinedAt: !493)
!510 = !DILocation(line: 129, column: 6, scope: !198, inlinedAt: !493)
!511 = !DILocation(line: 134, column: 7, scope: !198, inlinedAt: !493)
!512 = !DILocation(line: 134, column: 15, scope: !198, inlinedAt: !493)
!513 = !DILocation(line: 138, column: 11, scope: !514, inlinedAt: !493)
!514 = distinct !DILexicalBlock(scope: !198, file: !3, line: 138, column: 6)
!515 = !DILocation(line: 138, column: 28, scope: !514, inlinedAt: !493)
!516 = !DILocation(line: 138, column: 6, scope: !198, inlinedAt: !493)
!517 = !DILocation(line: 141, column: 2, scope: !198, inlinedAt: !493)
!518 = !DILocation(line: 143, column: 2, scope: !198, inlinedAt: !493)
!519 = !DILocation(line: 336, column: 1, scope: !95)
!520 = distinct !DISubprogram(name: "xdp_parser_func", scope: !3, file: !3, line: 342, type: !4, scopeLine: 343, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !521)
!521 = !{!522, !523, !524, !525, !526, !527, !528, !529, !532, !574, !577, !600}
!522 = !DILocalVariable(name: "ctx", arg: 1, scope: !520, file: !3, line: 342, type: !7)
!523 = !DILocalVariable(name: "data_end", scope: !520, file: !3, line: 344, type: !61)
!524 = !DILocalVariable(name: "data", scope: !520, file: !3, line: 345, type: !61)
!525 = !DILocalVariable(name: "action", scope: !520, file: !3, line: 351, type: !12)
!526 = !DILocalVariable(name: "nh", scope: !520, file: !3, line: 354, type: !101)
!527 = !DILocalVariable(name: "nh_type", scope: !520, file: !3, line: 355, type: !6)
!528 = !DILocalVariable(name: "eth", scope: !520, file: !3, line: 358, type: !75)
!529 = !DILocalVariable(name: "ip6h", scope: !530, file: !3, line: 367, type: !262)
!530 = distinct !DILexicalBlock(scope: !531, file: !3, line: 366, column: 40)
!531 = distinct !DILexicalBlock(scope: !520, file: !3, line: 366, column: 6)
!532 = !DILocalVariable(name: "icmp6h", scope: !530, file: !3, line: 368, type: !533)
!533 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !534, size: 64)
!534 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !535, line: 8, size: 64, elements: !536)
!535 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "0310ca5584e6f44f6eea6cf040ee84b9")
!536 = !{!537, !538, !539, !540}
!537 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !534, file: !535, line: 10, baseType: !66, size: 8)
!538 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !534, file: !535, line: 11, baseType: !66, size: 8, offset: 8)
!539 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !534, file: !535, line: 12, baseType: !232, size: 16, offset: 16)
!540 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !534, file: !535, line: 63, baseType: !541, size: 32, offset: 32)
!541 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !534, file: !535, line: 15, size: 32, elements: !542)
!542 = !{!543, !545, !549, !551, !556, !564}
!543 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !541, file: !535, line: 16, baseType: !544, size: 32)
!544 = !DICompositeType(tag: DW_TAG_array_type, baseType: !234, size: 32, elements: !138)
!545 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !541, file: !535, line: 17, baseType: !546, size: 32)
!546 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 32, elements: !547)
!547 = !{!548}
!548 = !DISubrange(count: 2)
!549 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !541, file: !535, line: 18, baseType: !550, size: 32)
!550 = !DICompositeType(tag: DW_TAG_array_type, baseType: !66, size: 32, elements: !109)
!551 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !541, file: !535, line: 23, baseType: !552, size: 32)
!552 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !535, line: 20, size: 32, elements: !553)
!553 = !{!554, !555}
!554 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !552, file: !535, line: 21, baseType: !72, size: 16)
!555 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !552, file: !535, line: 22, baseType: !72, size: 16, offset: 16)
!556 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !541, file: !535, line: 40, baseType: !557, size: 32)
!557 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !535, line: 25, size: 32, elements: !558)
!558 = !{!559, !560, !561, !562, !563}
!559 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !557, file: !535, line: 27, baseType: !12, size: 5, flags: DIFlagBitField, extraData: i64 0)
!560 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !557, file: !535, line: 28, baseType: !12, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!561 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !557, file: !535, line: 29, baseType: !12, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!562 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !557, file: !535, line: 30, baseType: !12, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!563 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !557, file: !535, line: 31, baseType: !12, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!564 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !541, file: !535, line: 61, baseType: !565, size: 32)
!565 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !535, line: 42, size: 32, elements: !566)
!566 = !{!567, !568, !569, !570, !571, !572, !573}
!567 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !565, file: !535, line: 43, baseType: !66, size: 8)
!568 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !565, file: !535, line: 45, baseType: !66, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!569 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !565, file: !535, line: 46, baseType: !66, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!570 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !565, file: !535, line: 47, baseType: !66, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!571 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !565, file: !535, line: 48, baseType: !66, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!572 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !565, file: !535, line: 49, baseType: !66, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!573 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !565, file: !535, line: 60, baseType: !72, size: 16, offset: 16)
!574 = !DILocalVariable(name: "iph", scope: !575, file: !3, line: 382, type: !219)
!575 = distinct !DILexicalBlock(scope: !576, file: !3, line: 381, column: 45)
!576 = distinct !DILexicalBlock(scope: !531, file: !3, line: 381, column: 13)
!577 = !DILocalVariable(name: "icmph", scope: !575, file: !3, line: 383, type: !578)
!578 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !579, size: 64)
!579 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !580, line: 89, size: 64, elements: !581)
!580 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!581 = !{!582, !583, !584, !585}
!582 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !579, file: !580, line: 90, baseType: !66, size: 8)
!583 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !579, file: !580, line: 91, baseType: !66, size: 8, offset: 8)
!584 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !579, file: !580, line: 92, baseType: !232, size: 16, offset: 16)
!585 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !579, file: !580, line: 104, baseType: !586, size: 32, offset: 32)
!586 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !579, file: !580, line: 93, size: 32, elements: !587)
!587 = !{!588, !593, !594, !599}
!588 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !586, file: !580, line: 97, baseType: !589, size: 32)
!589 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !586, file: !580, line: 94, size: 32, elements: !590)
!590 = !{!591, !592}
!591 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !589, file: !580, line: 95, baseType: !72, size: 16)
!592 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !589, file: !580, line: 96, baseType: !72, size: 16, offset: 16)
!593 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !586, file: !580, line: 98, baseType: !234, size: 32)
!594 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !586, file: !580, line: 102, baseType: !595, size: 32)
!595 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !586, file: !580, line: 99, size: 32, elements: !596)
!596 = !{!597, !598}
!597 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !595, file: !580, line: 100, baseType: !72, size: 16)
!598 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !595, file: !580, line: 101, baseType: !72, size: 16, offset: 16)
!599 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !586, file: !580, line: 103, baseType: !550, size: 32)
!600 = !DILabel(scope: !520, name: "out", file: !3, line: 396)
!601 = distinct !DIAssignID()
!602 = !DILocation(line: 0, scope: !520)
!603 = !DILocation(line: 344, column: 38, scope: !520)
!604 = !DILocation(line: 344, column: 27, scope: !520)
!605 = !DILocation(line: 344, column: 19, scope: !520)
!606 = !DILocation(line: 345, column: 34, scope: !520)
!607 = !DILocation(line: 345, column: 23, scope: !520)
!608 = !DILocation(line: 345, column: 15, scope: !520)
!609 = !DILocation(line: 0, scope: !142, inlinedAt: !610)
!610 = distinct !DILocation(line: 364, column: 12, scope: !520)
!611 = !DILocation(line: 241, column: 14, scope: !340, inlinedAt: !610)
!612 = !DILocation(line: 241, column: 24, scope: !340, inlinedAt: !610)
!613 = !DILocation(line: 241, column: 6, scope: !142, inlinedAt: !610)
!614 = !DILocation(line: 247, column: 18, scope: !142, inlinedAt: !610)
!615 = !DILocation(line: 0, scope: !348, inlinedAt: !616)
!616 = distinct !DILocation(line: 250, column: 13, scope: !142, inlinedAt: !610)
!617 = !DILocation(line: 36, column: 18, scope: !348, inlinedAt: !616)
!618 = !DILocation(line: 36, column: 33, scope: !348, inlinedAt: !616)
!619 = !DILocation(line: 252, column: 6, scope: !142, inlinedAt: !610)
!620 = !DILocation(line: 253, column: 3, scope: !358, inlinedAt: !610)
!621 = !DILocation(line: 0, scope: !156, inlinedAt: !610)
!622 = !DILocation(line: 257, column: 15, scope: !361, inlinedAt: !610)
!623 = !DILocation(line: 257, column: 25, scope: !361, inlinedAt: !610)
!624 = !DILocation(line: 257, column: 7, scope: !156, inlinedAt: !610)
!625 = !DILocation(line: 261, column: 20, scope: !156, inlinedAt: !610)
!626 = !DILocation(line: 247, column: 11, scope: !142, inlinedAt: !610)
!627 = !DILocation(line: 263, column: 2, scope: !369, inlinedAt: !610)
!628 = !DILocation(line: 366, column: 6, scope: !520)
!629 = !DILocation(line: 0, scope: !375, inlinedAt: !630)
!630 = distinct !DILocation(line: 370, column: 13, scope: !530)
!631 = !DILocation(line: 191, column: 14, scope: !387, inlinedAt: !630)
!632 = !DILocation(line: 191, column: 24, scope: !387, inlinedAt: !630)
!633 = !DILocation(line: 191, column: 6, scope: !375, inlinedAt: !630)
!634 = !DILocation(line: 0, scope: !530)
!635 = !DILocation(line: 197, column: 14, scope: !375, inlinedAt: !630)
!636 = !DILocation(line: 371, column: 15, scope: !637)
!637 = distinct !DILexicalBlock(scope: !530, file: !3, line: 371, column: 7)
!638 = !DILocation(line: 371, column: 7, scope: !530)
!639 = !DILocalVariable(name: "nh", arg: 1, scope: !640, file: !3, line: 215, type: !145)
!640 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !3, file: !3, line: 215, type: !641, scopeLine: 218, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !644)
!641 = !DISubroutineType(types: !642)
!642 = !{!6, !145, !61, !643}
!643 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !533, size: 64)
!644 = !{!639, !645, !646, !647, !648}
!645 = !DILocalVariable(name: "data_end", arg: 2, scope: !640, file: !3, line: 216, type: !61)
!646 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !640, file: !3, line: 217, type: !643)
!647 = !DILocalVariable(name: "icmp6", scope: !640, file: !3, line: 219, type: !533)
!648 = !DILocalVariable(name: "hdrsize", scope: !640, file: !3, line: 220, type: !6)
!649 = !DILocation(line: 0, scope: !640, inlinedAt: !650)
!650 = distinct !DILocation(line: 374, column: 13, scope: !530)
!651 = !DILocation(line: 227, column: 16, scope: !640, inlinedAt: !650)
!652 = !{!329, !329, i64 0}
!653 = !DILocation(line: 375, column: 15, scope: !654)
!654 = distinct !DILexicalBlock(scope: !530, file: !3, line: 375, column: 7)
!655 = !DILocation(line: 375, column: 7, scope: !530)
!656 = !DILocation(line: 381, column: 2, scope: !531)
!657 = !DILocation(line: 0, scope: !215, inlinedAt: !658)
!658 = distinct !DILocation(line: 385, column: 13, scope: !575)
!659 = !DILocation(line: 169, column: 14, scope: !660, inlinedAt: !658)
!660 = distinct !DILexicalBlock(scope: !215, file: !3, line: 169, column: 6)
!661 = !DILocation(line: 169, column: 29, scope: !660, inlinedAt: !658)
!662 = !DILocation(line: 169, column: 6, scope: !215, inlinedAt: !658)
!663 = !DILocation(line: 171, column: 22, scope: !215, inlinedAt: !658)
!664 = !DILocation(line: 171, column: 26, scope: !215, inlinedAt: !658)
!665 = !DILocation(line: 172, column: 2, scope: !666, inlinedAt: !658)
!666 = distinct !DILexicalBlock(scope: !215, file: !3, line: 172, column: 2)
!667 = !DILocation(line: 174, column: 14, scope: !668, inlinedAt: !658)
!668 = distinct !DILexicalBlock(scope: !215, file: !3, line: 174, column: 6)
!669 = !DILocation(line: 174, column: 24, scope: !668, inlinedAt: !658)
!670 = !DILocation(line: 174, column: 6, scope: !215, inlinedAt: !658)
!671 = !DILocation(line: 0, scope: !575)
!672 = !DILocation(line: 180, column: 14, scope: !215, inlinedAt: !658)
!673 = !{!674, !329, i64 9}
!674 = !{!"iphdr", !329, i64 0, !329, i64 0, !329, i64 1, !346, i64 2, !346, i64 4, !346, i64 6, !329, i64 8, !329, i64 9, !346, i64 10, !328, i64 12, !328, i64 16}
!675 = !DILocation(line: 386, column: 15, scope: !676)
!676 = distinct !DILexicalBlock(scope: !575, file: !3, line: 386, column: 7)
!677 = !DILocation(line: 386, column: 7, scope: !575)
!678 = !DILocalVariable(name: "nh", arg: 1, scope: !679, file: !3, line: 200, type: !145)
!679 = distinct !DISubprogram(name: "parse_icmphdr", scope: !3, file: !3, line: 200, type: !680, scopeLine: 203, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !683)
!680 = !DISubroutineType(types: !681)
!681 = !{!6, !145, !61, !682}
!682 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !578, size: 64)
!683 = !{!678, !684, !685, !686, !687}
!684 = !DILocalVariable(name: "data_end", arg: 2, scope: !679, file: !3, line: 201, type: !61)
!685 = !DILocalVariable(name: "icmp4hdr", arg: 3, scope: !679, file: !3, line: 202, type: !682)
!686 = !DILocalVariable(name: "icmp4", scope: !679, file: !3, line: 204, type: !578)
!687 = !DILocalVariable(name: "hdrsize", scope: !679, file: !3, line: 205, type: !6)
!688 = !DILocation(line: 0, scope: !679, inlinedAt: !689)
!689 = distinct !DILocation(line: 389, column: 13, scope: !575)
!690 = !DILocation(line: 212, column: 24, scope: !679, inlinedAt: !689)
!691 = !DILocation(line: 390, column: 15, scope: !692)
!692 = distinct !DILexicalBlock(scope: !575, file: !3, line: 390, column: 7)
!693 = !DILocation(line: 390, column: 7, scope: !575)
!694 = !DILocation(line: 395, column: 2, scope: !576)
!695 = !DILocation(line: 351, column: 8, scope: !520)
!696 = !DILocation(line: 396, column: 2, scope: !520)
!697 = !DILocation(line: 0, scope: !698, inlinedAt: !705)
!698 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !113, file: !113, line: 25, type: !699, scopeLine: 26, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !701)
!699 = !DISubroutineType(types: !700)
!700 = !{!12, !7, !12}
!701 = !{!702, !703, !704}
!702 = !DILocalVariable(name: "ctx", arg: 1, scope: !698, file: !113, line: 25, type: !7)
!703 = !DILocalVariable(name: "action", arg: 2, scope: !698, file: !113, line: 25, type: !12)
!704 = !DILocalVariable(name: "rec", scope: !698, file: !113, line: 31, type: !122)
!705 = distinct !DILocation(line: 397, column: 9, scope: !520)
!706 = !{!328, !328, i64 0}
!707 = distinct !DIAssignID()
!708 = !DILocation(line: 31, column: 24, scope: !698, inlinedAt: !705)
!709 = !DILocation(line: 32, column: 7, scope: !710, inlinedAt: !705)
!710 = distinct !DILexicalBlock(scope: !698, file: !113, line: 32, column: 6)
!711 = !DILocation(line: 32, column: 6, scope: !698, inlinedAt: !705)
!712 = !DILocation(line: 39, column: 17, scope: !698, inlinedAt: !705)
!713 = !{!714, !715, i64 0}
!714 = !{!"datarec", !715, i64 0, !715, i64 8}
!715 = !{!"long long", !329, i64 0}
!716 = !DILocation(line: 40, column: 25, scope: !698, inlinedAt: !705)
!717 = !DILocation(line: 40, column: 41, scope: !698, inlinedAt: !705)
!718 = !DILocation(line: 40, column: 34, scope: !698, inlinedAt: !705)
!719 = !DILocation(line: 40, column: 19, scope: !698, inlinedAt: !705)
!720 = !DILocation(line: 40, column: 7, scope: !698, inlinedAt: !705)
!721 = !DILocation(line: 40, column: 16, scope: !698, inlinedAt: !705)
!722 = !{!714, !715, i64 8}
!723 = !DILocation(line: 42, column: 9, scope: !698, inlinedAt: !705)
!724 = !DILocation(line: 42, column: 2, scope: !698, inlinedAt: !705)
!725 = !DILocation(line: 43, column: 1, scope: !698, inlinedAt: !705)
!726 = !DILocation(line: 398, column: 1, scope: !520)
