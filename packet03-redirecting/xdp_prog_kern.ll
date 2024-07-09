; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { ptr, ptr, ptr, ptr, ptr }
%struct.anon.0 = type { ptr, ptr, ptr, ptr, ptr }
%struct.anon.5 = type { ptr, ptr, ptr, ptr, ptr }
%struct.icmphdr_common = type { i8, i8, i16 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.datarec = type { i64, i64 }
%struct.bpf_fib_lookup = type { i8, i8, i16, i16, %union.anon.1, i32, %union.anon.2, %union.anon.3, %union.anon.4, i16, i16, [6 x i8], [6 x i8] }
%union.anon.1 = type { i16 }
%union.anon.2 = type { i32 }
%union.anon.3 = type { [4 x i32] }
%union.anon.4 = type { [4 x i32] }

@xdp_icmp_echo_func.____fmt = internal constant [15 x i8] c"echo_reply: %d\00", align 1, !dbg !0
@redirect_params = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !258
@tx_port = dso_local global %struct.anon.0 zeroinitializer, section ".maps", align 8, !dbg !240
@xdp_router_func.____fmt = internal constant [10 x i8] c"rc is %d\0A\00", align 1, !dbg !80
@xdp_router_func.____fmt.1 = internal constant [25 x i8] c"fib_params.dmac[%d]: %d\0A\00", align 1, !dbg !200
@xdp_router_func.____fmt.2 = internal constant [2 x i8] c"\0A\00", align 1, !dbg !205
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !210
@xdp_stats_map = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !213
@llvm.compiler.used = appending global [9 x ptr] [ptr @_license, ptr @redirect_params, ptr @tx_port, ptr @xdp_icmp_echo_func, ptr @xdp_pass_func, ptr @xdp_redirect_func, ptr @xdp_redirect_map_func, ptr @xdp_router_func, ptr @xdp_stats_map], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_icmp_echo_func(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !2 {
  %2 = alloca i32, align 4, !DIAssignID !340
  %3 = alloca %struct.icmphdr_common, align 4, !DIAssignID !341
  %4 = alloca [4 x i32], align 4, !DIAssignID !342
  call void @llvm.dbg.value(metadata ptr %0, metadata !307, metadata !DIExpression()), !dbg !343
  %5 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !344
  %6 = load i32, ptr %5, align 4, !dbg !344, !tbaa !345
  %7 = zext i32 %6 to i64, !dbg !350
  %8 = inttoptr i64 %7 to ptr, !dbg !351
  call void @llvm.dbg.value(metadata ptr %8, metadata !308, metadata !DIExpression()), !dbg !343
  %9 = load i32, ptr %0, align 4, !dbg !352, !tbaa !353
  %10 = zext i32 %9 to i64, !dbg !354
  %11 = inttoptr i64 %10 to ptr, !dbg !355
  call void @llvm.dbg.value(metadata ptr %11, metadata !309, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata i32 2, metadata !329, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata ptr %11, metadata !310, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata ptr undef, metadata !356, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.value(metadata ptr %8, metadata !363, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.value(metadata ptr undef, metadata !364, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.value(metadata ptr undef, metadata !367, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata ptr %8, metadata !377, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata ptr undef, metadata !378, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata ptr null, metadata !379, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata ptr %11, metadata !380, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i32 14, metadata !381, metadata !DIExpression()), !dbg !390
  %12 = getelementptr i8, ptr %11, i64 14, !dbg !392
  %13 = icmp ugt ptr %12, %8, !dbg !394
  br i1 %13, label %118, label %14, !dbg !395

14:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr %12, metadata !310, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata ptr %11, metadata !315, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata ptr %12, metadata !382, metadata !DIExpression()), !dbg !390
  %15 = getelementptr inbounds %struct.ethhdr, ptr %11, i64 0, i32 2, !dbg !396
  call void @llvm.dbg.value(metadata i16 poison, metadata !388, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i32 0, metadata !389, metadata !DIExpression()), !dbg !390
  %16 = load i16, ptr %15, align 1, !dbg !390, !tbaa !397
  call void @llvm.dbg.value(metadata i16 %16, metadata !388, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i16 %16, metadata !399, metadata !DIExpression()), !dbg !404
  %17 = icmp eq i16 %16, 129, !dbg !410
  %18 = icmp eq i16 %16, -22392, !dbg !411
  %19 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %17)
  %20 = or i1 %18, %19, !dbg !411
  %21 = getelementptr i8, ptr %11, i64 18
  %22 = icmp ule ptr %21, %8
  %23 = and i1 %22, %20, !dbg !412
  br i1 %23, label %24, label %37, !dbg !412

24:                                               ; preds = %14
  call void @llvm.dbg.value(metadata i16 poison, metadata !388, metadata !DIExpression()), !dbg !390
  %25 = getelementptr i8, ptr %11, i64 16, !dbg !413
  call void @llvm.dbg.value(metadata ptr %21, metadata !382, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i32 1, metadata !389, metadata !DIExpression()), !dbg !390
  %26 = load i16, ptr %25, align 1, !dbg !390, !tbaa !397
  call void @llvm.dbg.value(metadata i16 %26, metadata !388, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i16 %26, metadata !399, metadata !DIExpression()), !dbg !404
  %27 = icmp eq i16 %26, 129, !dbg !410
  %28 = icmp eq i16 %26, -22392, !dbg !411
  %29 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %27)
  %30 = or i1 %28, %29, !dbg !411
  %31 = getelementptr i8, ptr %11, i64 22
  %32 = icmp ule ptr %31, %8
  %33 = and i1 %32, %30, !dbg !412
  br i1 %33, label %34, label %37, !dbg !412

34:                                               ; preds = %24
  call void @llvm.dbg.value(metadata i16 poison, metadata !388, metadata !DIExpression()), !dbg !390
  %35 = getelementptr i8, ptr %11, i64 20, !dbg !413
  call void @llvm.dbg.value(metadata ptr %31, metadata !382, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i32 2, metadata !389, metadata !DIExpression()), !dbg !390
  %36 = load i16, ptr %35, align 1, !dbg !390, !tbaa !397
  call void @llvm.dbg.value(metadata i16 %36, metadata !388, metadata !DIExpression()), !dbg !390
  br label %37

37:                                               ; preds = %14, %24, %34
  %38 = phi ptr [ %12, %14 ], [ %21, %24 ], [ %31, %34 ], !dbg !390
  %39 = phi i16 [ %16, %14 ], [ %26, %24 ], [ %36, %34 ], !dbg !390
  call void @llvm.dbg.value(metadata ptr %38, metadata !310, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata ptr %11, metadata !315, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata i16 %39, metadata !316, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !343
  switch i16 %39, label %118 [
    i16 8, label %40
    i16 -8826, label %56
  ], !dbg !414

40:                                               ; preds = %37
  call void @llvm.dbg.value(metadata ptr undef, metadata !415, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata ptr %8, metadata !421, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata ptr undef, metadata !422, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata ptr %38, metadata !423, metadata !DIExpression()), !dbg !425
  %41 = getelementptr inbounds %struct.iphdr, ptr %38, i64 1, !dbg !429
  %42 = icmp ugt ptr %41, %8, !dbg !431
  br i1 %42, label %118, label %43, !dbg !432

43:                                               ; preds = %40
  %44 = load i8, ptr %38, align 4, !dbg !433
  %45 = shl i8 %44, 2, !dbg !434
  %46 = and i8 %45, 60, !dbg !434
  call void @llvm.dbg.value(metadata i8 %46, metadata !424, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !425
  %47 = icmp ult i8 %46, 20, !dbg !435
  br i1 %47, label %118, label %48, !dbg !437

48:                                               ; preds = %43
  %49 = zext i8 %46 to i64
  call void @llvm.dbg.value(metadata i64 %49, metadata !424, metadata !DIExpression()), !dbg !425
  %50 = getelementptr i8, ptr %38, i64 %49, !dbg !438
  %51 = icmp ugt ptr %50, %8, !dbg !440
  br i1 %51, label %118, label %52, !dbg !441

52:                                               ; preds = %48
  call void @llvm.dbg.value(metadata ptr %50, metadata !310, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata ptr %38, metadata !319, metadata !DIExpression()), !dbg !343
  %53 = getelementptr inbounds %struct.iphdr, ptr %38, i64 0, i32 6, !dbg !442
  %54 = load i8, ptr %53, align 1, !dbg !442, !tbaa !443
  call void @llvm.dbg.value(metadata i8 %54, metadata !317, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !343
  %55 = icmp eq i8 %54, 1, !dbg !445
  br i1 %55, label %63, label %118, !dbg !447

56:                                               ; preds = %37
  call void @llvm.dbg.value(metadata ptr undef, metadata !448, metadata !DIExpression()), !dbg !457
  call void @llvm.dbg.value(metadata ptr %8, metadata !454, metadata !DIExpression()), !dbg !457
  call void @llvm.dbg.value(metadata ptr undef, metadata !455, metadata !DIExpression()), !dbg !457
  call void @llvm.dbg.value(metadata ptr %38, metadata !456, metadata !DIExpression()), !dbg !457
  %57 = getelementptr inbounds %struct.ipv6hdr, ptr %38, i64 1, !dbg !461
  %58 = icmp ugt ptr %57, %8, !dbg !463
  br i1 %58, label %118, label %59, !dbg !464

59:                                               ; preds = %56
  call void @llvm.dbg.value(metadata ptr %57, metadata !310, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata ptr %38, metadata !320, metadata !DIExpression()), !dbg !343
  %60 = getelementptr inbounds %struct.ipv6hdr, ptr %38, i64 0, i32 3, !dbg !465
  %61 = load i8, ptr %60, align 2, !dbg !465, !tbaa !466
  call void @llvm.dbg.value(metadata i8 %61, metadata !317, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !343
  %62 = icmp eq i8 %61, 58, !dbg !469
  br i1 %62, label %63, label %118, !dbg !471

63:                                               ; preds = %59, %52
  %64 = phi i1 [ true, %52 ], [ false, %59 ]
  %65 = phi i1 [ false, %52 ], [ true, %59 ]
  %66 = phi ptr [ %50, %52 ], [ %57, %59 ], !dbg !472
  call void @llvm.dbg.value(metadata ptr %38, metadata !320, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata ptr %38, metadata !319, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata ptr %66, metadata !310, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata ptr undef, metadata !473, metadata !DIExpression()), !dbg !482
  call void @llvm.dbg.value(metadata ptr %8, metadata !479, metadata !DIExpression()), !dbg !482
  call void @llvm.dbg.value(metadata ptr undef, metadata !480, metadata !DIExpression()), !dbg !482
  call void @llvm.dbg.value(metadata ptr %66, metadata !481, metadata !DIExpression()), !dbg !482
  %67 = getelementptr inbounds %struct.icmphdr_common, ptr %66, i64 1, !dbg !484
  %68 = icmp ugt ptr %67, %8, !dbg !486
  br i1 %68, label %118, label %69, !dbg !487

69:                                               ; preds = %63
  call void @llvm.dbg.value(metadata ptr %67, metadata !310, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata ptr %66, metadata !322, metadata !DIExpression()), !dbg !343
  %70 = load i8, ptr %66, align 2, !dbg !488, !tbaa !489
  call void @llvm.dbg.value(metadata i8 %70, metadata !318, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !343
  %71 = icmp eq i8 %70, 8
  %72 = select i1 %64, i1 %71, i1 false, !dbg !491
  br i1 %72, label %73, label %78, !dbg !491

73:                                               ; preds = %69
  call void @llvm.dbg.value(metadata ptr %38, metadata !493, metadata !DIExpression()), !dbg !499
  %74 = getelementptr inbounds %struct.iphdr, ptr %38, i64 0, i32 8, !dbg !502
  %75 = load i32, ptr %74, align 4, !dbg !502, !tbaa !503
  call void @llvm.dbg.value(metadata i32 %75, metadata !498, metadata !DIExpression()), !dbg !499
  %76 = getelementptr inbounds %struct.iphdr, ptr %38, i64 0, i32 9, !dbg !504
  %77 = load i32, ptr %76, align 4, !dbg !504, !tbaa !505
  store i32 %77, ptr %74, align 4, !dbg !506, !tbaa !503
  store i32 %75, ptr %76, align 4, !dbg !507, !tbaa !505
  call void @llvm.dbg.value(metadata i16 0, metadata !321, metadata !DIExpression()), !dbg !343
  br label %84, !dbg !508

78:                                               ; preds = %69
  call void @llvm.dbg.value(metadata i8 %70, metadata !318, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !343
  %79 = icmp eq i8 %70, -128
  %80 = select i1 %65, i1 %79, i1 false, !dbg !509
  br i1 %80, label %81, label %118, !dbg !509

81:                                               ; preds = %78
  call void @llvm.dbg.assign(metadata i1 undef, metadata !511, metadata !DIExpression(), metadata !342, metadata ptr %4, metadata !DIExpression()), !dbg !517
  call void @llvm.dbg.value(metadata ptr %38, metadata !516, metadata !DIExpression()), !dbg !517
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4), !dbg !520
  %82 = getelementptr inbounds %struct.ipv6hdr, ptr %38, i64 0, i32 5, !dbg !521
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(16) %4, ptr noundef nonnull align 4 dereferenceable(16) %82, i64 16, i1 false), !dbg !521, !tbaa.struct !522, !DIAssignID !524
  call void @llvm.dbg.assign(metadata i1 undef, metadata !511, metadata !DIExpression(), metadata !524, metadata ptr %4, metadata !DIExpression()), !dbg !517
  %83 = getelementptr inbounds %struct.ipv6hdr, ptr %38, i64 0, i32 6, !dbg !525
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(16) %82, ptr noundef nonnull align 4 dereferenceable(16) %83, i64 16, i1 false), !dbg !525, !tbaa.struct !522
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(16) %83, ptr noundef nonnull align 4 dereferenceable(16) %4, i64 16, i1 false), !dbg !526, !tbaa.struct !522
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4), !dbg !527
  call void @llvm.dbg.value(metadata i16 129, metadata !321, metadata !DIExpression()), !dbg !343
  br label %84

84:                                               ; preds = %81, %73
  %85 = phi i32 [ 0, %73 ], [ 129, %81 ], !dbg !528
  call void @llvm.dbg.value(metadata i32 %85, metadata !321, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.assign(metadata i1 undef, metadata !529, metadata !DIExpression(), metadata !341, metadata ptr %3, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.value(metadata ptr %66, metadata !534, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.value(metadata i32 %85, metadata !535, metadata !DIExpression()), !dbg !537
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #8, !dbg !539
  %86 = load i32, ptr %66, align 2, !dbg !540
  store i32 %86, ptr %3, align 4, !dbg !540, !DIAssignID !541
  call void @llvm.dbg.assign(metadata i1 undef, metadata !529, metadata !DIExpression(), metadata !541, metadata ptr %3, metadata !DIExpression()), !dbg !537
  %87 = trunc i32 %85 to i8, !dbg !542
  store i8 %87, ptr %66, align 2, !dbg !543, !tbaa !489
  call void @llvm.dbg.value(metadata i32 0, metadata !536, metadata !DIExpression()), !dbg !537
  %88 = call i64 inttoptr (i64 28 to ptr)(ptr noundef nonnull %3, i32 noundef 4, ptr noundef nonnull %66, i32 noundef 4, i32 noundef 0) #8, !dbg !544
  %89 = trunc i64 %88 to i16, !dbg !544
  call void @llvm.dbg.value(metadata i64 %88, metadata !536, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !537
  %90 = getelementptr inbounds %struct.icmphdr_common, ptr %3, i64 0, i32 2, !dbg !545
  %91 = load i16, ptr %90, align 2, !dbg !545, !tbaa !546
  %92 = sub i16 %91, %89, !dbg !547
  %93 = getelementptr inbounds %struct.icmphdr_common, ptr %66, i64 0, i32 2, !dbg !548
  store i16 %92, ptr %93, align 2, !dbg !549, !tbaa !546
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #8, !dbg !550
  call void @llvm.dbg.value(metadata ptr %11, metadata !551, metadata !DIExpression()), !dbg !558
  call void @llvm.dbg.value(metadata i64 0, metadata !557, metadata !DIExpression()), !dbg !558
  %94 = load i8, ptr %11, align 1, !dbg !560, !tbaa !523
  call void @llvm.dbg.value(metadata i8 %94, metadata !556, metadata !DIExpression()), !dbg !558
  %95 = getelementptr inbounds %struct.ethhdr, ptr %11, i64 0, i32 1, i64 0, !dbg !564
  %96 = load i8, ptr %95, align 1, !dbg !564, !tbaa !523
  store i8 %96, ptr %11, align 1, !dbg !565, !tbaa !523
  store i8 %94, ptr %95, align 1, !dbg !566, !tbaa !523
  call void @llvm.dbg.value(metadata i64 1, metadata !557, metadata !DIExpression()), !dbg !558
  %97 = getelementptr inbounds [6 x i8], ptr %11, i64 0, i64 1, !dbg !560
  %98 = load i8, ptr %97, align 1, !dbg !560, !tbaa !523
  call void @llvm.dbg.value(metadata i8 %98, metadata !556, metadata !DIExpression()), !dbg !558
  %99 = getelementptr inbounds %struct.ethhdr, ptr %11, i64 0, i32 1, i64 1, !dbg !564
  %100 = load i8, ptr %99, align 1, !dbg !564, !tbaa !523
  store i8 %100, ptr %97, align 1, !dbg !565, !tbaa !523
  store i8 %98, ptr %99, align 1, !dbg !566, !tbaa !523
  call void @llvm.dbg.value(metadata i64 2, metadata !557, metadata !DIExpression()), !dbg !558
  %101 = getelementptr inbounds [6 x i8], ptr %11, i64 0, i64 2, !dbg !560
  %102 = load i8, ptr %101, align 1, !dbg !560, !tbaa !523
  call void @llvm.dbg.value(metadata i8 %102, metadata !556, metadata !DIExpression()), !dbg !558
  %103 = getelementptr inbounds %struct.ethhdr, ptr %11, i64 0, i32 1, i64 2, !dbg !564
  %104 = load i8, ptr %103, align 1, !dbg !564, !tbaa !523
  store i8 %104, ptr %101, align 1, !dbg !565, !tbaa !523
  store i8 %102, ptr %103, align 1, !dbg !566, !tbaa !523
  call void @llvm.dbg.value(metadata i64 3, metadata !557, metadata !DIExpression()), !dbg !558
  %105 = getelementptr inbounds [6 x i8], ptr %11, i64 0, i64 3, !dbg !560
  %106 = load i8, ptr %105, align 1, !dbg !560, !tbaa !523
  call void @llvm.dbg.value(metadata i8 %106, metadata !556, metadata !DIExpression()), !dbg !558
  %107 = getelementptr inbounds %struct.ethhdr, ptr %11, i64 0, i32 1, i64 3, !dbg !564
  %108 = load i8, ptr %107, align 1, !dbg !564, !tbaa !523
  store i8 %108, ptr %105, align 1, !dbg !565, !tbaa !523
  store i8 %106, ptr %107, align 1, !dbg !566, !tbaa !523
  call void @llvm.dbg.value(metadata i64 4, metadata !557, metadata !DIExpression()), !dbg !558
  %109 = getelementptr inbounds [6 x i8], ptr %11, i64 0, i64 4, !dbg !560
  %110 = load i8, ptr %109, align 1, !dbg !560, !tbaa !523
  call void @llvm.dbg.value(metadata i8 %110, metadata !556, metadata !DIExpression()), !dbg !558
  %111 = getelementptr inbounds %struct.ethhdr, ptr %11, i64 0, i32 1, i64 4, !dbg !564
  %112 = load i8, ptr %111, align 1, !dbg !564, !tbaa !523
  store i8 %112, ptr %109, align 1, !dbg !565, !tbaa !523
  store i8 %110, ptr %111, align 1, !dbg !566, !tbaa !523
  call void @llvm.dbg.value(metadata i64 5, metadata !557, metadata !DIExpression()), !dbg !558
  %113 = getelementptr inbounds [6 x i8], ptr %11, i64 0, i64 5, !dbg !560
  %114 = load i8, ptr %113, align 1, !dbg !560, !tbaa !523
  call void @llvm.dbg.value(metadata i8 %114, metadata !556, metadata !DIExpression()), !dbg !558
  %115 = getelementptr inbounds %struct.ethhdr, ptr %11, i64 0, i32 1, i64 5, !dbg !564
  %116 = load i8, ptr %115, align 1, !dbg !564, !tbaa !523
  store i8 %116, ptr %113, align 1, !dbg !565, !tbaa !523
  store i8 %114, ptr %115, align 1, !dbg !566, !tbaa !523
  call void @llvm.dbg.value(metadata i64 6, metadata !557, metadata !DIExpression()), !dbg !558
  %117 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_icmp_echo_func.____fmt, i32 noundef 15, i32 noundef %85) #8, !dbg !567
  call void @llvm.dbg.value(metadata i32 3, metadata !329, metadata !DIExpression()), !dbg !343
  br label %118, !dbg !569

118:                                              ; preds = %37, %63, %56, %48, %43, %40, %1, %78, %59, %52, %84
  %119 = phi i32 [ 2, %52 ], [ 3, %84 ], [ 2, %78 ], [ 2, %59 ], [ 2, %1 ], [ 2, %40 ], [ 2, %43 ], [ 2, %48 ], [ 2, %56 ], [ 2, %63 ], [ 2, %37 ], !dbg !343
  call void @llvm.dbg.value(metadata i32 %119, metadata !329, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.label(metadata !330), !dbg !570
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !571
  call void @llvm.dbg.assign(metadata i1 undef, metadata !577, metadata !DIExpression(), metadata !340, metadata ptr %2, metadata !DIExpression()), !dbg !571
  call void @llvm.dbg.value(metadata ptr %0, metadata !576, metadata !DIExpression()), !dbg !571
  store i32 %119, ptr %2, align 4, !tbaa !580, !DIAssignID !581
  call void @llvm.dbg.assign(metadata i32 %119, metadata !577, metadata !DIExpression(), metadata !581, metadata ptr %2, metadata !DIExpression()), !dbg !571
  %120 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #8, !dbg !582
  call void @llvm.dbg.value(metadata ptr %120, metadata !578, metadata !DIExpression()), !dbg !571
  %121 = icmp eq ptr %120, null, !dbg !583
  br i1 %121, label %133, label %122, !dbg !585

122:                                              ; preds = %118
  %123 = load i64, ptr %120, align 8, !dbg !586, !tbaa !587
  %124 = add i64 %123, 1, !dbg !586
  store i64 %124, ptr %120, align 8, !dbg !586, !tbaa !587
  %125 = load i32, ptr %5, align 4, !dbg !590, !tbaa !345
  %126 = load i32, ptr %0, align 4, !dbg !591, !tbaa !353
  %127 = sub i32 %125, %126, !dbg !592
  %128 = zext i32 %127 to i64, !dbg !593
  %129 = getelementptr inbounds %struct.datarec, ptr %120, i64 0, i32 1, !dbg !594
  %130 = load i64, ptr %129, align 8, !dbg !595, !tbaa !596
  %131 = add i64 %130, %128, !dbg !595
  store i64 %131, ptr %129, align 8, !dbg !595, !tbaa !596
  %132 = load i32, ptr %2, align 4, !dbg !597, !tbaa !580
  br label %133, !dbg !598

133:                                              ; preds = %118, %122
  %134 = phi i32 [ %132, %122 ], [ 0, %118 ], !dbg !571
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !599
  ret i32 %134, !dbg !600
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_func(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !601 {
  %2 = alloca i32, align 4, !DIAssignID !614
  call void @llvm.dbg.value(metadata ptr %0, metadata !603, metadata !DIExpression()), !dbg !615
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !616
  %4 = load i32, ptr %3, align 4, !dbg !616, !tbaa !345
  %5 = zext i32 %4 to i64, !dbg !617
  %6 = inttoptr i64 %5 to ptr, !dbg !618
  call void @llvm.dbg.value(metadata ptr %6, metadata !604, metadata !DIExpression()), !dbg !615
  %7 = load i32, ptr %0, align 4, !dbg !619, !tbaa !353
  %8 = zext i32 %7 to i64, !dbg !620
  %9 = inttoptr i64 %8 to ptr, !dbg !621
  call void @llvm.dbg.value(metadata ptr %9, metadata !605, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 2, metadata !609, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 4, metadata !611, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i32 0, metadata !612, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata ptr %9, metadata !606, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata ptr undef, metadata !356, metadata !DIExpression()), !dbg !622
  call void @llvm.dbg.value(metadata ptr %6, metadata !363, metadata !DIExpression()), !dbg !622
  call void @llvm.dbg.value(metadata ptr undef, metadata !364, metadata !DIExpression()), !dbg !622
  call void @llvm.dbg.value(metadata ptr undef, metadata !367, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata ptr %6, metadata !377, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata ptr undef, metadata !378, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata ptr null, metadata !379, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata ptr %9, metadata !380, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i32 14, metadata !381, metadata !DIExpression()), !dbg !624
  %10 = getelementptr i8, ptr %9, i64 14, !dbg !626
  %11 = icmp ugt ptr %10, %6, !dbg !627
  br i1 %11, label %36, label %12, !dbg !628

12:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr %10, metadata !606, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata ptr %9, metadata !607, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata ptr %10, metadata !382, metadata !DIExpression()), !dbg !624
  %13 = getelementptr inbounds %struct.ethhdr, ptr %9, i64 0, i32 2, !dbg !629
  call void @llvm.dbg.value(metadata i16 poison, metadata !388, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i32 0, metadata !389, metadata !DIExpression()), !dbg !624
  %14 = load i16, ptr %13, align 1, !dbg !624, !tbaa !397
  call void @llvm.dbg.value(metadata i16 %14, metadata !388, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i16 %14, metadata !399, metadata !DIExpression()), !dbg !630
  %15 = icmp eq i16 %14, 129, !dbg !632
  %16 = icmp eq i16 %14, -22392, !dbg !633
  %17 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %15)
  %18 = or i1 %16, %17, !dbg !633
  %19 = getelementptr i8, ptr %9, i64 18
  %20 = icmp ule ptr %19, %6
  %21 = and i1 %20, %18, !dbg !634
  br i1 %21, label %22, label %27, !dbg !634

22:                                               ; preds = %12
  call void @llvm.dbg.value(metadata i16 poison, metadata !388, metadata !DIExpression()), !dbg !624
  %23 = getelementptr i8, ptr %9, i64 16, !dbg !635
  call void @llvm.dbg.value(metadata ptr %19, metadata !382, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i32 1, metadata !389, metadata !DIExpression()), !dbg !624
  %24 = load i16, ptr %23, align 1, !dbg !624, !tbaa !397
  call void @llvm.dbg.value(metadata i16 %24, metadata !388, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i16 %24, metadata !399, metadata !DIExpression()), !dbg !630
  %25 = icmp eq i16 %24, 129, !dbg !632
  %26 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %25)
  br label %27, !dbg !634

27:                                               ; preds = %22, %12
  call void @llvm.dbg.value(metadata ptr poison, metadata !606, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata ptr %9, metadata !607, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i16 poison, metadata !608, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !615
  call void @llvm.dbg.value(metadata i32 0, metadata !612, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i64 0, metadata !612, metadata !DIExpression()), !dbg !615
  store i8 -2, ptr %9, align 1, !dbg !636, !tbaa !523
  call void @llvm.dbg.value(metadata i64 1, metadata !612, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i64 1, metadata !612, metadata !DIExpression()), !dbg !615
  %28 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 1, !dbg !639
  store i8 -93, ptr %28, align 1, !dbg !636, !tbaa !523
  call void @llvm.dbg.value(metadata i64 2, metadata !612, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i64 2, metadata !612, metadata !DIExpression()), !dbg !615
  %29 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 2, !dbg !639
  store i8 106, ptr %29, align 1, !dbg !636, !tbaa !523
  call void @llvm.dbg.value(metadata i64 3, metadata !612, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i64 3, metadata !612, metadata !DIExpression()), !dbg !615
  %30 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 3, !dbg !639
  store i8 34, ptr %30, align 1, !dbg !636, !tbaa !523
  call void @llvm.dbg.value(metadata i64 4, metadata !612, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i64 4, metadata !612, metadata !DIExpression()), !dbg !615
  %31 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 4, !dbg !639
  store i8 -89, ptr %31, align 1, !dbg !636, !tbaa !523
  call void @llvm.dbg.value(metadata i64 5, metadata !612, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.value(metadata i64 5, metadata !612, metadata !DIExpression()), !dbg !615
  %32 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 5, !dbg !639
  store i8 90, ptr %32, align 1, !dbg !636, !tbaa !523
  call void @llvm.dbg.value(metadata i64 6, metadata !612, metadata !DIExpression()), !dbg !615
  %33 = tail call i64 inttoptr (i64 23 to ptr)(i32 noundef 4, i64 noundef 0) #8, !dbg !640
  %34 = trunc i64 %33 to i32, !dbg !640
  call void @llvm.dbg.value(metadata i32 %34, metadata !609, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.label(metadata !613), !dbg !641
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !642
  call void @llvm.dbg.assign(metadata i1 undef, metadata !577, metadata !DIExpression(), metadata !614, metadata ptr %2, metadata !DIExpression()), !dbg !642
  call void @llvm.dbg.value(metadata ptr %0, metadata !576, metadata !DIExpression()), !dbg !642
  store i32 %34, ptr %2, align 4, !tbaa !580, !DIAssignID !644
  call void @llvm.dbg.assign(metadata i32 %34, metadata !577, metadata !DIExpression(), metadata !644, metadata ptr %2, metadata !DIExpression()), !dbg !642
  %35 = icmp ugt i32 %34, 4, !dbg !645
  br i1 %35, label %51, label %37, !dbg !647

36:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i32 2, metadata !609, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.label(metadata !613), !dbg !641
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !642
  call void @llvm.dbg.assign(metadata i1 undef, metadata !577, metadata !DIExpression(), metadata !614, metadata ptr %2, metadata !DIExpression()), !dbg !642
  call void @llvm.dbg.value(metadata ptr %0, metadata !576, metadata !DIExpression()), !dbg !642
  store i32 2, ptr %2, align 4, !tbaa !580, !DIAssignID !644
  call void @llvm.dbg.assign(metadata i32 2, metadata !577, metadata !DIExpression(), metadata !644, metadata ptr %2, metadata !DIExpression()), !dbg !642
  br label %37, !dbg !647

37:                                               ; preds = %36, %27
  %38 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #8, !dbg !648
  call void @llvm.dbg.value(metadata ptr %38, metadata !578, metadata !DIExpression()), !dbg !642
  %39 = icmp eq ptr %38, null, !dbg !649
  br i1 %39, label %51, label %40, !dbg !650

40:                                               ; preds = %37
  %41 = load i64, ptr %38, align 8, !dbg !651, !tbaa !587
  %42 = add i64 %41, 1, !dbg !651
  store i64 %42, ptr %38, align 8, !dbg !651, !tbaa !587
  %43 = load i32, ptr %3, align 4, !dbg !652, !tbaa !345
  %44 = load i32, ptr %0, align 4, !dbg !653, !tbaa !353
  %45 = sub i32 %43, %44, !dbg !654
  %46 = zext i32 %45 to i64, !dbg !655
  %47 = getelementptr inbounds %struct.datarec, ptr %38, i64 0, i32 1, !dbg !656
  %48 = load i64, ptr %47, align 8, !dbg !657, !tbaa !596
  %49 = add i64 %48, %46, !dbg !657
  store i64 %49, ptr %47, align 8, !dbg !657, !tbaa !596
  %50 = load i32, ptr %2, align 4, !dbg !658, !tbaa !580
  br label %51, !dbg !659

51:                                               ; preds = %27, %37, %40
  %52 = phi i32 [ 0, %27 ], [ %50, %40 ], [ 0, %37 ], !dbg !642
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !660
  ret i32 %52, !dbg !661
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_map_func(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !662 {
  %2 = alloca i32, align 4, !DIAssignID !674
  call void @llvm.dbg.value(metadata ptr %0, metadata !664, metadata !DIExpression()), !dbg !675
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !676
  %4 = load i32, ptr %3, align 4, !dbg !676, !tbaa !345
  %5 = zext i32 %4 to i64, !dbg !677
  %6 = inttoptr i64 %5 to ptr, !dbg !678
  call void @llvm.dbg.value(metadata ptr %6, metadata !665, metadata !DIExpression()), !dbg !675
  %7 = load i32, ptr %0, align 4, !dbg !679, !tbaa !353
  %8 = zext i32 %7 to i64, !dbg !680
  %9 = inttoptr i64 %8 to ptr, !dbg !681
  call void @llvm.dbg.value(metadata ptr %9, metadata !666, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.value(metadata i32 2, metadata !670, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.value(metadata ptr %9, metadata !667, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.value(metadata ptr undef, metadata !356, metadata !DIExpression()), !dbg !682
  call void @llvm.dbg.value(metadata ptr %6, metadata !363, metadata !DIExpression()), !dbg !682
  call void @llvm.dbg.value(metadata ptr undef, metadata !364, metadata !DIExpression()), !dbg !682
  call void @llvm.dbg.value(metadata ptr undef, metadata !367, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.value(metadata ptr %6, metadata !377, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.value(metadata ptr undef, metadata !378, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.value(metadata ptr null, metadata !379, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.value(metadata ptr %9, metadata !380, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.value(metadata i32 14, metadata !381, metadata !DIExpression()), !dbg !684
  %10 = getelementptr i8, ptr %9, i64 14, !dbg !686
  %11 = icmp ugt ptr %10, %6, !dbg !687
  br i1 %11, label %31, label %12, !dbg !688

12:                                               ; preds = %1
  call void @llvm.dbg.value(metadata ptr %10, metadata !667, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.value(metadata ptr %9, metadata !668, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.value(metadata ptr %10, metadata !382, metadata !DIExpression()), !dbg !684
  %13 = getelementptr inbounds %struct.ethhdr, ptr %9, i64 0, i32 2, !dbg !689
  call void @llvm.dbg.value(metadata i16 poison, metadata !388, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.value(metadata i32 0, metadata !389, metadata !DIExpression()), !dbg !684
  %14 = load i16, ptr %13, align 1, !dbg !684, !tbaa !397
  call void @llvm.dbg.value(metadata i16 %14, metadata !388, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.value(metadata i16 %14, metadata !399, metadata !DIExpression()), !dbg !690
  %15 = icmp eq i16 %14, 129, !dbg !692
  %16 = icmp eq i16 %14, -22392, !dbg !693
  %17 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %15)
  %18 = or i1 %16, %17, !dbg !693
  %19 = getelementptr i8, ptr %9, i64 18
  %20 = icmp ule ptr %19, %6
  %21 = and i1 %20, %18, !dbg !694
  br i1 %21, label %22, label %27, !dbg !694

22:                                               ; preds = %12
  call void @llvm.dbg.value(metadata i16 poison, metadata !388, metadata !DIExpression()), !dbg !684
  %23 = getelementptr i8, ptr %9, i64 16, !dbg !695
  call void @llvm.dbg.value(metadata ptr %19, metadata !382, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.value(metadata i32 1, metadata !389, metadata !DIExpression()), !dbg !684
  %24 = load i16, ptr %23, align 1, !dbg !684, !tbaa !397
  call void @llvm.dbg.value(metadata i16 %24, metadata !388, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.value(metadata i16 %24, metadata !399, metadata !DIExpression()), !dbg !690
  %25 = icmp eq i16 %24, 129, !dbg !692
  %26 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %25)
  br label %27, !dbg !694

27:                                               ; preds = %22, %12
  call void @llvm.dbg.value(metadata ptr poison, metadata !667, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.value(metadata ptr %9, metadata !668, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.value(metadata i16 poison, metadata !669, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !675
  %28 = getelementptr inbounds %struct.ethhdr, ptr %9, i64 0, i32 1, !dbg !696
  %29 = tail call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @redirect_params, ptr noundef nonnull %28) #8, !dbg !697
  call void @llvm.dbg.value(metadata ptr %29, metadata !671, metadata !DIExpression()), !dbg !675
  %30 = icmp eq ptr %29, null, !dbg !698
  br i1 %30, label %31, label %32, !dbg !700

31:                                               ; preds = %27, %1
  call void @llvm.dbg.value(metadata i32 2, metadata !670, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.label(metadata !673), !dbg !701
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !702
  call void @llvm.dbg.assign(metadata i1 undef, metadata !577, metadata !DIExpression(), metadata !674, metadata ptr %2, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata ptr %0, metadata !576, metadata !DIExpression()), !dbg !702
  store i32 2, ptr %2, align 4, !tbaa !580, !DIAssignID !704
  call void @llvm.dbg.assign(metadata i32 2, metadata !577, metadata !DIExpression(), metadata !704, metadata ptr %2, metadata !DIExpression()), !dbg !702
  br label %36, !dbg !705

32:                                               ; preds = %27
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(6) %9, ptr noundef nonnull align 1 dereferenceable(6) %29, i64 6, i1 false), !dbg !706
  %33 = tail call i64 inttoptr (i64 51 to ptr)(ptr noundef nonnull @tx_port, i64 noundef 0, i64 noundef 0) #8, !dbg !707
  %34 = trunc i64 %33 to i32, !dbg !707
  call void @llvm.dbg.value(metadata i32 %34, metadata !670, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.label(metadata !673), !dbg !701
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !702
  call void @llvm.dbg.assign(metadata i1 undef, metadata !577, metadata !DIExpression(), metadata !674, metadata ptr %2, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata ptr %0, metadata !576, metadata !DIExpression()), !dbg !702
  store i32 %34, ptr %2, align 4, !tbaa !580, !DIAssignID !704
  call void @llvm.dbg.assign(metadata i32 %34, metadata !577, metadata !DIExpression(), metadata !704, metadata ptr %2, metadata !DIExpression()), !dbg !702
  %35 = icmp ugt i32 %34, 4, !dbg !708
  br i1 %35, label %50, label %36, !dbg !705

36:                                               ; preds = %31, %32
  %37 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #8, !dbg !709
  call void @llvm.dbg.value(metadata ptr %37, metadata !578, metadata !DIExpression()), !dbg !702
  %38 = icmp eq ptr %37, null, !dbg !710
  br i1 %38, label %50, label %39, !dbg !711

39:                                               ; preds = %36
  %40 = load i64, ptr %37, align 8, !dbg !712, !tbaa !587
  %41 = add i64 %40, 1, !dbg !712
  store i64 %41, ptr %37, align 8, !dbg !712, !tbaa !587
  %42 = load i32, ptr %3, align 4, !dbg !713, !tbaa !345
  %43 = load i32, ptr %0, align 4, !dbg !714, !tbaa !353
  %44 = sub i32 %42, %43, !dbg !715
  %45 = zext i32 %44 to i64, !dbg !716
  %46 = getelementptr inbounds %struct.datarec, ptr %37, i64 0, i32 1, !dbg !717
  %47 = load i64, ptr %46, align 8, !dbg !718, !tbaa !596
  %48 = add i64 %47, %45, !dbg !718
  store i64 %48, ptr %46, align 8, !dbg !718, !tbaa !596
  %49 = load i32, ptr %2, align 4, !dbg !719, !tbaa !580
  br label %50, !dbg !720

50:                                               ; preds = %32, %36, %39
  %51 = phi i32 [ 0, %32 ], [ %49, %39 ], [ 0, %36 ], !dbg !702
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !721
  ret i32 %51, !dbg !722
}

; Function Attrs: nounwind
define dso_local i32 @xdp_router_func(ptr noundef %0) #0 section "xdp" !dbg !82 {
  %2 = alloca i32, align 4, !DIAssignID !723
  %3 = alloca %struct.bpf_fib_lookup, align 4, !DIAssignID !724
  call void @llvm.dbg.assign(metadata i1 undef, metadata !87, metadata !DIExpression(), metadata !724, metadata ptr %3, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata ptr %0, metadata !84, metadata !DIExpression()), !dbg !725
  %4 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !726
  %5 = load i32, ptr %4, align 4, !dbg !726, !tbaa !345
  %6 = zext i32 %5 to i64, !dbg !727
  %7 = inttoptr i64 %6 to ptr, !dbg !728
  call void @llvm.dbg.value(metadata ptr %7, metadata !85, metadata !DIExpression()), !dbg !725
  %8 = load i32, ptr %0, align 4, !dbg !729, !tbaa !353
  %9 = zext i32 %8 to i64, !dbg !730
  %10 = inttoptr i64 %9 to ptr, !dbg !731
  call void @llvm.dbg.value(metadata ptr %10, metadata !86, metadata !DIExpression()), !dbg !725
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %3) #8, !dbg !732
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(64) %3, i8 0, i64 64, i1 false), !dbg !733, !DIAssignID !734
  call void @llvm.dbg.assign(metadata i8 0, metadata !87, metadata !DIExpression(), metadata !734, metadata ptr %3, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata ptr %10, metadata !129, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i32 2, metadata !193, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i64 14, metadata !188, metadata !DIExpression()), !dbg !725
  %11 = getelementptr i8, ptr %10, i64 14, !dbg !735
  %12 = icmp ugt ptr %11, %7, !dbg !737
  br i1 %12, label %91, label %13, !dbg !738

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.ethhdr, ptr %10, i64 0, i32 2, !dbg !739
  %15 = load i16, ptr %14, align 1, !dbg !739, !tbaa !740
  call void @llvm.dbg.value(metadata i16 %15, metadata !187, metadata !DIExpression()), !dbg !725
  %16 = icmp eq i16 %15, 8, !dbg !742
  br i1 %16, label %17, label %31, !dbg !744

17:                                               ; preds = %13
  call void @llvm.dbg.value(metadata ptr %11, metadata !170, metadata !DIExpression()), !dbg !725
  %18 = getelementptr i8, ptr %10, i64 34, !dbg !745
  %19 = icmp ugt ptr %18, %7, !dbg !748
  br i1 %19, label %91, label %20, !dbg !749

20:                                               ; preds = %17
  %21 = getelementptr i8, ptr %10, i64 22, !dbg !750
  %22 = load i8, ptr %21, align 4, !dbg !750, !tbaa !752
  %23 = icmp ult i8 %22, 2, !dbg !753
  br i1 %23, label %91, label %24, !dbg !754

24:                                               ; preds = %20
  store i8 2, ptr %3, align 4, !dbg !755, !tbaa !756, !DIAssignID !758
  call void @llvm.dbg.assign(metadata i8 2, metadata !87, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8), metadata !758, metadata ptr %3, metadata !DIExpression()), !dbg !725
  %25 = getelementptr i8, ptr %10, i64 26, !dbg !759
  %26 = load i32, ptr %25, align 4, !dbg !759, !tbaa !503
  %27 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %3, i64 0, i32 7, !dbg !760
  store i32 %26, ptr %27, align 4, !dbg !761, !tbaa !523, !DIAssignID !762
  call void @llvm.dbg.assign(metadata i32 %26, metadata !87, metadata !DIExpression(DW_OP_LLVM_fragment, 128, 32), metadata !762, metadata ptr %27, metadata !DIExpression()), !dbg !725
  %28 = getelementptr i8, ptr %10, i64 30, !dbg !763
  %29 = load i32, ptr %28, align 4, !dbg !763, !tbaa !505
  %30 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %3, i64 0, i32 8, !dbg !764
  store i32 %29, ptr %30, align 4, !dbg !765, !tbaa !523, !DIAssignID !766
  call void @llvm.dbg.assign(metadata i32 %29, metadata !87, metadata !DIExpression(DW_OP_LLVM_fragment, 256, 32), metadata !766, metadata ptr %30, metadata !DIExpression()), !dbg !725
  br label %40, !dbg !767

31:                                               ; preds = %13
  %32 = icmp eq i16 %15, -8826, !dbg !768
  br i1 %32, label %33, label %91, !dbg !770

33:                                               ; preds = %31
  call void @llvm.dbg.value(metadata ptr %11, metadata !138, metadata !DIExpression()), !dbg !725
  %34 = getelementptr i8, ptr %10, i64 54, !dbg !771
  %35 = icmp ugt ptr %34, %7, !dbg !774
  br i1 %35, label %91, label %36, !dbg !775

36:                                               ; preds = %33
  %37 = getelementptr i8, ptr %10, i64 21, !dbg !776
  %38 = load i8, ptr %37, align 1, !dbg !776, !tbaa !778
  %39 = icmp ult i8 %38, 2, !dbg !779
  br i1 %39, label %91, label %40, !dbg !780

40:                                               ; preds = %36, %24
  call void @llvm.dbg.value(metadata ptr %11, metadata !138, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata ptr %11, metadata !170, metadata !DIExpression()), !dbg !725
  %41 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 3, !dbg !781
  %42 = load i32, ptr %41, align 4, !dbg !781, !tbaa !782
  %43 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %3, i64 0, i32 5, !dbg !783
  store i32 %42, ptr %43, align 4, !dbg !784, !tbaa !785, !DIAssignID !786
  call void @llvm.dbg.assign(metadata i32 %42, metadata !87, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32), metadata !786, metadata ptr %43, metadata !DIExpression()), !dbg !725
  %44 = call i64 inttoptr (i64 69 to ptr)(ptr noundef nonnull %0, ptr noundef nonnull %3, i32 noundef 64, i32 noundef 0) #8, !dbg !787
  %45 = trunc i64 %44 to i32, !dbg !787
  call void @llvm.dbg.value(metadata i32 %45, metadata !191, metadata !DIExpression()), !dbg !725
  %46 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_router_func.____fmt, i32 noundef 10, i32 noundef %45) #8, !dbg !788
  switch i32 %45, label %91 [
    i32 0, label %47
    i32 1, label %90
    i32 2, label %90
    i32 3, label %90
  ], !dbg !790

47:                                               ; preds = %40
  br i1 %16, label %48, label %52, !dbg !791

48:                                               ; preds = %47
  call void @llvm.dbg.value(metadata ptr %11, metadata !793, metadata !DIExpression()), !dbg !798
  %49 = getelementptr i8, ptr %10, i64 22, !dbg !801
  %50 = load i8, ptr %49, align 4, !dbg !802, !tbaa !752
  %51 = add i8 %50, -1, !dbg !802
  store i8 %51, ptr %49, align 4, !dbg !802, !tbaa !752
  br label %58, !dbg !803

52:                                               ; preds = %47
  %53 = icmp eq i16 %15, -8826, !dbg !804
  br i1 %53, label %54, label %58, !dbg !806

54:                                               ; preds = %52
  %55 = getelementptr i8, ptr %10, i64 21, !dbg !807
  %56 = load i8, ptr %55, align 1, !dbg !808, !tbaa !778
  %57 = add i8 %56, -1, !dbg !808
  store i8 %57, ptr %55, align 1, !dbg !808, !tbaa !778
  br label %58, !dbg !809

58:                                               ; preds = %52, %54, %48
  %59 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %3, i64 0, i32 12, !dbg !810
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(6) %10, ptr noundef nonnull align 2 dereferenceable(6) %59, i64 6, i1 false), !dbg !810
  %60 = getelementptr inbounds %struct.ethhdr, ptr %10, i64 0, i32 1, !dbg !811
  %61 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %3, i64 0, i32 11, !dbg !811
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(6) %60, ptr noundef nonnull align 4 dereferenceable(6) %61, i64 6, i1 false), !dbg !811
  call void @llvm.dbg.value(metadata i32 0, metadata !192, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i64 0, metadata !192, metadata !DIExpression()), !dbg !725
  %62 = load i8, ptr %59, align 2, !dbg !812, !tbaa !523
  %63 = zext i8 %62 to i32, !dbg !812
  %64 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_router_func.____fmt.1, i32 noundef 25, i32 noundef 0, i32 noundef %63) #8, !dbg !812
  call void @llvm.dbg.value(metadata i64 1, metadata !192, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i64 1, metadata !192, metadata !DIExpression()), !dbg !725
  %65 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %3, i64 0, i32 12, i64 1, !dbg !812
  %66 = load i8, ptr %65, align 1, !dbg !812, !tbaa !523
  %67 = zext i8 %66 to i32, !dbg !812
  %68 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_router_func.____fmt.1, i32 noundef 25, i32 noundef 1, i32 noundef %67) #8, !dbg !812
  call void @llvm.dbg.value(metadata i64 2, metadata !192, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i64 2, metadata !192, metadata !DIExpression()), !dbg !725
  %69 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %3, i64 0, i32 12, i64 2, !dbg !812
  %70 = load i8, ptr %69, align 4, !dbg !812, !tbaa !523
  %71 = zext i8 %70 to i32, !dbg !812
  %72 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_router_func.____fmt.1, i32 noundef 25, i32 noundef 2, i32 noundef %71) #8, !dbg !812
  call void @llvm.dbg.value(metadata i64 3, metadata !192, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i64 3, metadata !192, metadata !DIExpression()), !dbg !725
  %73 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %3, i64 0, i32 12, i64 3, !dbg !812
  %74 = load i8, ptr %73, align 1, !dbg !812, !tbaa !523
  %75 = zext i8 %74 to i32, !dbg !812
  %76 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_router_func.____fmt.1, i32 noundef 25, i32 noundef 3, i32 noundef %75) #8, !dbg !812
  call void @llvm.dbg.value(metadata i64 4, metadata !192, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i64 4, metadata !192, metadata !DIExpression()), !dbg !725
  %77 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %3, i64 0, i32 12, i64 4, !dbg !812
  %78 = load i8, ptr %77, align 2, !dbg !812, !tbaa !523
  %79 = zext i8 %78 to i32, !dbg !812
  %80 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_router_func.____fmt.1, i32 noundef 25, i32 noundef 4, i32 noundef %79) #8, !dbg !812
  call void @llvm.dbg.value(metadata i64 5, metadata !192, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i64 5, metadata !192, metadata !DIExpression()), !dbg !725
  %81 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %3, i64 0, i32 12, i64 5, !dbg !812
  %82 = load i8, ptr %81, align 1, !dbg !812, !tbaa !523
  %83 = zext i8 %82 to i32, !dbg !812
  %84 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_router_func.____fmt.1, i32 noundef 25, i32 noundef 5, i32 noundef %83) #8, !dbg !812
  call void @llvm.dbg.value(metadata i64 6, metadata !192, metadata !DIExpression()), !dbg !725
  %85 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_router_func.____fmt.2, i32 noundef 2) #8, !dbg !817
  %86 = load i32, ptr %43, align 4, !dbg !819, !tbaa !785
  %87 = call i64 inttoptr (i64 23 to ptr)(i32 noundef %86, i64 noundef 0) #8, !dbg !820
  %88 = trunc i64 %87 to i32, !dbg !820
  call void @llvm.dbg.value(metadata i32 %88, metadata !193, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.label(metadata !194), !dbg !821
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !822
  call void @llvm.dbg.assign(metadata i1 undef, metadata !577, metadata !DIExpression(), metadata !723, metadata ptr %2, metadata !DIExpression()), !dbg !822
  call void @llvm.dbg.value(metadata ptr %0, metadata !576, metadata !DIExpression()), !dbg !822
  store i32 %88, ptr %2, align 4, !tbaa !580, !DIAssignID !824
  call void @llvm.dbg.assign(metadata i32 %88, metadata !577, metadata !DIExpression(), metadata !824, metadata ptr %2, metadata !DIExpression()), !dbg !822
  %89 = icmp ugt i32 %88, 4, !dbg !825
  br i1 %89, label %107, label %93, !dbg !826

90:                                               ; preds = %40, %40, %40
  call void @llvm.dbg.value(metadata i32 1, metadata !193, metadata !DIExpression()), !dbg !725
  br label %91, !dbg !827

91:                                               ; preds = %20, %40, %90, %36, %31, %1, %17, %33
  %92 = phi i32 [ 1, %33 ], [ 1, %17 ], [ 1, %1 ], [ 2, %31 ], [ 2, %36 ], [ 1, %90 ], [ 2, %40 ], [ 2, %20 ]
  call void @llvm.dbg.value(metadata i32 %92, metadata !193, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.label(metadata !194), !dbg !821
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !822
  call void @llvm.dbg.assign(metadata i1 undef, metadata !577, metadata !DIExpression(), metadata !723, metadata ptr %2, metadata !DIExpression()), !dbg !822
  call void @llvm.dbg.value(metadata ptr %0, metadata !576, metadata !DIExpression()), !dbg !822
  store i32 %92, ptr %2, align 4, !tbaa !580, !DIAssignID !824
  call void @llvm.dbg.assign(metadata i32 %92, metadata !577, metadata !DIExpression(), metadata !824, metadata ptr %2, metadata !DIExpression()), !dbg !822
  br label %93, !dbg !826

93:                                               ; preds = %91, %58
  %94 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #8, !dbg !828
  call void @llvm.dbg.value(metadata ptr %94, metadata !578, metadata !DIExpression()), !dbg !822
  %95 = icmp eq ptr %94, null, !dbg !829
  br i1 %95, label %107, label %96, !dbg !830

96:                                               ; preds = %93
  %97 = load i64, ptr %94, align 8, !dbg !831, !tbaa !587
  %98 = add i64 %97, 1, !dbg !831
  store i64 %98, ptr %94, align 8, !dbg !831, !tbaa !587
  %99 = load i32, ptr %4, align 4, !dbg !832, !tbaa !345
  %100 = load i32, ptr %0, align 4, !dbg !833, !tbaa !353
  %101 = sub i32 %99, %100, !dbg !834
  %102 = zext i32 %101 to i64, !dbg !835
  %103 = getelementptr inbounds %struct.datarec, ptr %94, i64 0, i32 1, !dbg !836
  %104 = load i64, ptr %103, align 8, !dbg !837, !tbaa !596
  %105 = add i64 %104, %102, !dbg !837
  store i64 %105, ptr %103, align 8, !dbg !837, !tbaa !596
  %106 = load i32, ptr %2, align 4, !dbg !838, !tbaa !580
  br label %107, !dbg !839

107:                                              ; preds = %58, %93, %96
  %108 = phi i32 [ 0, %58 ], [ %106, %96 ], [ 0, %93 ], !dbg !822
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !840
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %3) #8, !dbg !841
  ret i32 %108, !dbg !842
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @xdp_pass_func(ptr nocapture readnone %0) #5 section "xdp" !dbg !843 {
  call void @llvm.dbg.value(metadata ptr poison, metadata !845, metadata !DIExpression()), !dbg !846
  ret i32 2, !dbg !847
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.assign(metadata, metadata, metadata, metadata, metadata, metadata) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #6

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #7

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { nounwind memory(none) }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!20}
!llvm.module.flags = !{!334, !335, !336, !337, !338}
!llvm.ident = !{!339}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 141, type: !331, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "xdp_icmp_echo_func", scope: !3, file: !3, line: 82, type: !4, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !306)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet03-redirecting", checksumkind: CSK_MD5, checksum: "8e6369c6de007f9049be8727ea14f52d")
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
!20 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !71, globals: !79, splitDebugInlining: false, nameTableKind: None)
!21 = !{!22, !29, !60}
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
!60 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !9, line: 6196, baseType: !14, size: 32, elements: !61)
!61 = !{!62, !63, !64, !65, !66, !67, !68, !69, !70}
!62 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_SUCCESS", value: 0)
!63 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_BLACKHOLE", value: 1)
!64 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNREACHABLE", value: 2)
!65 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_PROHIBIT", value: 3)
!66 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NOT_FWDED", value: 4)
!67 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FWD_DISABLED", value: 5)
!68 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNSUPP_LWT", value: 6)
!69 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NO_NEIGH", value: 7)
!70 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FRAG_NEEDED", value: 8)
!71 = !{!72, !73, !74, !76}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!73 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !75)
!75 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !78, line: 27, baseType: !12)
!78 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!79 = !{!0, !80, !200, !205, !210, !213, !240, !258, !268, !277, !283, !288, !295, !300}
!80 = !DIGlobalVariableExpression(var: !81, expr: !DIExpression())
!81 = distinct !DIGlobalVariable(name: "____fmt", scope: !82, file: !3, line: 279, type: !195, isLocal: true, isDefinition: true)
!82 = distinct !DISubprogram(name: "xdp_router_func", scope: !3, file: !3, line: 223, type: !4, scopeLine: 224, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !83)
!83 = !{!84, !85, !86, !87, !129, !138, !170, !187, !188, !191, !192, !193, !194}
!84 = !DILocalVariable(name: "ctx", arg: 1, scope: !82, file: !3, line: 223, type: !7)
!85 = !DILocalVariable(name: "data_end", scope: !82, file: !3, line: 225, type: !72)
!86 = !DILocalVariable(name: "data", scope: !82, file: !3, line: 226, type: !72)
!87 = !DILocalVariable(name: "fib_params", scope: !82, file: !3, line: 227, type: !88)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_fib_lookup", file: !9, line: 6208, size: 512, elements: !89)
!89 = !{!90, !93, !94, !96, !97, !102, !103, !109, !117, !122, !123, !124, !128}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !88, file: !9, line: 6212, baseType: !91, size: 8)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !92)
!92 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "l4_protocol", scope: !88, file: !9, line: 6215, baseType: !91, size: 8, offset: 8)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !88, file: !9, line: 6216, baseType: !95, size: 16, offset: 16)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !78, line: 25, baseType: !74)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !88, file: !9, line: 6217, baseType: !95, size: 16, offset: 32)
!97 = !DIDerivedType(tag: DW_TAG_member, scope: !88, file: !9, line: 6219, baseType: !98, size: 16, offset: 48)
!98 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !88, file: !9, line: 6219, size: 16, elements: !99)
!99 = !{!100, !101}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !98, file: !9, line: 6221, baseType: !74, size: 16)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "mtu_result", scope: !98, file: !9, line: 6224, baseType: !74, size: 16)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !88, file: !9, line: 6229, baseType: !12, size: 32, offset: 64)
!103 = !DIDerivedType(tag: DW_TAG_member, scope: !88, file: !9, line: 6231, baseType: !104, size: 32, offset: 96)
!104 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !88, file: !9, line: 6231, size: 32, elements: !105)
!105 = !{!106, !107, !108}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !104, file: !9, line: 6233, baseType: !91, size: 8)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "flowinfo", scope: !104, file: !9, line: 6234, baseType: !77, size: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "rt_metric", scope: !104, file: !9, line: 6237, baseType: !12, size: 32)
!109 = !DIDerivedType(tag: DW_TAG_member, scope: !88, file: !9, line: 6240, baseType: !110, size: 128, offset: 128)
!110 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !88, file: !9, line: 6240, size: 128, elements: !111)
!111 = !{!112, !113}
!112 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !110, file: !9, line: 6241, baseType: !77, size: 32)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !110, file: !9, line: 6242, baseType: !114, size: 128)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 128, elements: !115)
!115 = !{!116}
!116 = !DISubrange(count: 4)
!117 = !DIDerivedType(tag: DW_TAG_member, scope: !88, file: !9, line: 6249, baseType: !118, size: 128, offset: 256)
!118 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !88, file: !9, line: 6249, size: 128, elements: !119)
!119 = !{!120, !121}
!120 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !118, file: !9, line: 6250, baseType: !77, size: 32)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !118, file: !9, line: 6251, baseType: !114, size: 128)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_proto", scope: !88, file: !9, line: 6255, baseType: !95, size: 16, offset: 384)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !88, file: !9, line: 6256, baseType: !95, size: 16, offset: 400)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "smac", scope: !88, file: !9, line: 6257, baseType: !125, size: 48, offset: 416)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !91, size: 48, elements: !126)
!126 = !{!127}
!127 = !DISubrange(count: 6)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "dmac", scope: !88, file: !9, line: 6258, baseType: !125, size: 48, offset: 464)
!129 = !DILocalVariable(name: "eth", scope: !82, file: !3, line: 228, type: !130)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !132, line: 169, size: 112, elements: !133)
!132 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "d4a01a1da3b79d23c796a4d8db749b8f")
!133 = !{!134, !136, !137}
!134 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !131, file: !132, line: 170, baseType: !135, size: 48)
!135 = !DICompositeType(tag: DW_TAG_array_type, baseType: !92, size: 48, elements: !126)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !131, file: !132, line: 171, baseType: !135, size: 48, offset: 48)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !131, file: !132, line: 172, baseType: !95, size: 16, offset: 96)
!138 = !DILocalVariable(name: "ip6h", scope: !82, file: !3, line: 229, type: !139)
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!140 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !141, line: 117, size: 320, elements: !142)
!141 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4a65c85349cc7a670732aecc94eade8f")
!142 = !{!143, !144, !145, !149, !150, !151, !152, !169}
!143 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !140, file: !141, line: 119, baseType: !91, size: 4, flags: DIFlagBitField, extraData: i64 0)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !140, file: !141, line: 120, baseType: !91, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !140, file: !141, line: 127, baseType: !146, size: 24, offset: 8)
!146 = !DICompositeType(tag: DW_TAG_array_type, baseType: !91, size: 24, elements: !147)
!147 = !{!148}
!148 = !DISubrange(count: 3)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !140, file: !141, line: 129, baseType: !95, size: 16, offset: 32)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !140, file: !141, line: 130, baseType: !91, size: 8, offset: 48)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !140, file: !141, line: 131, baseType: !91, size: 8, offset: 56)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !140, file: !141, line: 133, baseType: !153, size: 128, offset: 64)
!153 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !154, line: 33, size: 128, elements: !155)
!154 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!155 = !{!156}
!156 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !153, file: !154, line: 40, baseType: !157, size: 128)
!157 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !153, file: !154, line: 34, size: 128, elements: !158)
!158 = !{!159, !163, !167}
!159 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !157, file: !154, line: 35, baseType: !160, size: 128)
!160 = !DICompositeType(tag: DW_TAG_array_type, baseType: !91, size: 128, elements: !161)
!161 = !{!162}
!162 = !DISubrange(count: 16)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !157, file: !154, line: 37, baseType: !164, size: 128)
!164 = !DICompositeType(tag: DW_TAG_array_type, baseType: !95, size: 128, elements: !165)
!165 = !{!166}
!166 = !DISubrange(count: 8)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !157, file: !154, line: 38, baseType: !168, size: 128)
!168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !77, size: 128, elements: !115)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !140, file: !141, line: 134, baseType: !153, size: 128, offset: 192)
!170 = !DILocalVariable(name: "iph", scope: !82, file: !3, line: 230, type: !171)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64)
!172 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !173, line: 86, size: 160, elements: !174)
!173 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "91bb7f0ed6560290b754374efff83769")
!174 = !{!175, !176, !177, !178, !179, !180, !181, !182, !183, !185, !186}
!175 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !172, file: !173, line: 88, baseType: !91, size: 4, flags: DIFlagBitField, extraData: i64 0)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !172, file: !173, line: 89, baseType: !91, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !172, file: !173, line: 96, baseType: !91, size: 8, offset: 8)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !172, file: !173, line: 97, baseType: !95, size: 16, offset: 16)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !172, file: !173, line: 98, baseType: !95, size: 16, offset: 32)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !172, file: !173, line: 99, baseType: !95, size: 16, offset: 48)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !172, file: !173, line: 100, baseType: !91, size: 8, offset: 64)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !172, file: !173, line: 101, baseType: !91, size: 8, offset: 72)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !172, file: !173, line: 102, baseType: !184, size: 16, offset: 80)
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !78, line: 31, baseType: !74)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !172, file: !173, line: 103, baseType: !77, size: 32, offset: 96)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !172, file: !173, line: 104, baseType: !77, size: 32, offset: 128)
!187 = !DILocalVariable(name: "h_proto", scope: !82, file: !3, line: 231, type: !74)
!188 = !DILocalVariable(name: "nh_off", scope: !82, file: !3, line: 232, type: !189)
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !13, line: 31, baseType: !190)
!190 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!191 = !DILocalVariable(name: "rc", scope: !82, file: !3, line: 233, type: !6)
!192 = !DILocalVariable(name: "i", scope: !82, file: !3, line: 233, type: !6)
!193 = !DILocalVariable(name: "action", scope: !82, file: !3, line: 234, type: !6)
!194 = !DILabel(scope: !82, name: "out", file: !3, line: 311)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !196, size: 80, elements: !198)
!196 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !197)
!197 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!198 = !{!199}
!199 = !DISubrange(count: 10)
!200 = !DIGlobalVariableExpression(var: !201, expr: !DIExpression())
!201 = distinct !DIGlobalVariable(name: "____fmt", scope: !82, file: !3, line: 292, type: !202, isLocal: true, isDefinition: true)
!202 = !DICompositeType(tag: DW_TAG_array_type, baseType: !196, size: 200, elements: !203)
!203 = !{!204}
!204 = !DISubrange(count: 25)
!205 = !DIGlobalVariableExpression(var: !206, expr: !DIExpression())
!206 = distinct !DIGlobalVariable(name: "____fmt", scope: !82, file: !3, line: 294, type: !207, isLocal: true, isDefinition: true)
!207 = !DICompositeType(tag: DW_TAG_array_type, baseType: !196, size: 16, elements: !208)
!208 = !{!209}
!209 = !DISubrange(count: 2)
!210 = !DIGlobalVariableExpression(var: !211, expr: !DIExpression())
!211 = distinct !DIGlobalVariable(name: "_license", scope: !20, file: !3, line: 321, type: !212, isLocal: false, isDefinition: true)
!212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !197, size: 32, elements: !115)
!213 = !DIGlobalVariableExpression(var: !214, expr: !DIExpression())
!214 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !20, file: !215, line: 22, type: !216, isLocal: false, isDefinition: true)
!215 = !DIFile(filename: "./../common/xdp_stats_kern.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet03-redirecting", checksumkind: CSK_MD5, checksum: "c978ba00f7b9781ed1e135fd8557e600")
!216 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !215, line: 16, size: 320, elements: !217)
!217 = !{!218, !221, !223, !230, !235}
!218 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !216, file: !215, line: 17, baseType: !219, size: 64)
!219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !220, size: 64)
!220 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 192, elements: !126)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !216, file: !215, line: 18, baseType: !222, size: 64, offset: 64)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!223 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !216, file: !215, line: 19, baseType: !224, size: 64, offset: 128)
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 64)
!225 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !226, line: 10, size: 128, elements: !227)
!226 = !DIFile(filename: "./../common/xdp_stats_kern_user.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet03-redirecting", checksumkind: CSK_MD5, checksum: "96c2435685fa7da2d24f219444d8659d")
!227 = !{!228, !229}
!228 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !225, file: !226, line: 11, baseType: !189, size: 64)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !225, file: !226, line: 12, baseType: !189, size: 64, offset: 64)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !216, file: !215, line: 20, baseType: !231, size: 64, offset: 192)
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!232 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 160, elements: !233)
!233 = !{!234}
!234 = !DISubrange(count: 5)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "pinning", scope: !216, file: !215, line: 21, baseType: !236, size: 64, offset: 256)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !237, size: 64)
!237 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !238)
!238 = !{!239}
!239 = !DISubrange(count: 1)
!240 = !DIGlobalVariableExpression(var: !241, expr: !DIExpression())
!241 = distinct !DIGlobalVariable(name: "tx_port", scope: !20, file: !3, line: 24, type: !242, isLocal: false, isDefinition: true)
!242 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 18, size: 320, elements: !243)
!243 = !{!244, !249, !251, !252, !257}
!244 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !242, file: !3, line: 19, baseType: !245, size: 64)
!245 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !246, size: 64)
!246 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 448, elements: !247)
!247 = !{!248}
!248 = !DISubrange(count: 14)
!249 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !242, file: !3, line: 20, baseType: !250, size: 64, offset: 64)
!250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !242, file: !3, line: 21, baseType: !250, size: 64, offset: 128)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !242, file: !3, line: 22, baseType: !253, size: 64, offset: 192)
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64)
!254 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 8192, elements: !255)
!255 = !{!256}
!256 = !DISubrange(count: 256)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "pinning", scope: !242, file: !3, line: 23, baseType: !236, size: 64, offset: 256)
!258 = !DIGlobalVariableExpression(var: !259, expr: !DIExpression())
!259 = distinct !DIGlobalVariable(name: "redirect_params", scope: !20, file: !3, line: 33, type: !260, isLocal: false, isDefinition: true)
!260 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 27, size: 320, elements: !261)
!261 = !{!262, !263, !265, !266, !267}
!262 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !260, file: !3, line: 28, baseType: !236, size: 64)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !260, file: !3, line: 29, baseType: !264, size: 64, offset: 64)
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !260, file: !3, line: 30, baseType: !264, size: 64, offset: 128)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !260, file: !3, line: 31, baseType: !236, size: 64, offset: 192)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "pinning", scope: !260, file: !3, line: 32, baseType: !236, size: 64, offset: 256)
!268 = !DIGlobalVariableExpression(var: !269, expr: !DIExpression())
!269 = distinct !DIGlobalVariable(name: "bpf_csum_diff", scope: !20, file: !270, line: 794, type: !271, isLocal: true, isDefinition: true)
!270 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet03-redirecting", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !272, size: 64)
!272 = !DISubroutineType(types: !273)
!273 = !{!274, !76, !12, !76, !12, !276}
!274 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s64", file: !13, line: 30, baseType: !275)
!275 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!276 = !DIDerivedType(tag: DW_TAG_typedef, name: "__wsum", file: !78, line: 32, baseType: !12)
!277 = !DIGlobalVariableExpression(var: !278, expr: !DIExpression())
!278 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !20, file: !270, line: 177, type: !279, isLocal: true, isDefinition: true)
!279 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64)
!280 = !DISubroutineType(types: !281)
!281 = !{!73, !282, !12, null}
!282 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64)
!283 = !DIGlobalVariableExpression(var: !284, expr: !DIExpression())
!284 = distinct !DIGlobalVariable(name: "bpf_redirect", scope: !20, file: !270, line: 619, type: !285, isLocal: true, isDefinition: true)
!285 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !286, size: 64)
!286 = !DISubroutineType(types: !287)
!287 = !{!73, !12, !189}
!288 = !DIGlobalVariableExpression(var: !289, expr: !DIExpression())
!289 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !20, file: !270, line: 56, type: !290, isLocal: true, isDefinition: true)
!290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !291, size: 64)
!291 = !DISubroutineType(types: !292)
!292 = !{!72, !72, !293}
!293 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !294, size: 64)
!294 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!295 = !DIGlobalVariableExpression(var: !296, expr: !DIExpression())
!296 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !20, file: !270, line: 1323, type: !297, isLocal: true, isDefinition: true)
!297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !298, size: 64)
!298 = !DISubroutineType(types: !299)
!299 = !{!73, !72, !189, !189}
!300 = !DIGlobalVariableExpression(var: !301, expr: !DIExpression())
!301 = distinct !DIGlobalVariable(name: "bpf_fib_lookup", scope: !20, file: !270, line: 1856, type: !302, isLocal: true, isDefinition: true)
!302 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !303, size: 64)
!303 = !DISubroutineType(types: !304)
!304 = !{!73, !72, !305, !6, !12}
!305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!306 = !{!307, !308, !309, !310, !315, !316, !317, !318, !319, !320, !321, !322, !329, !330}
!307 = !DILocalVariable(name: "ctx", arg: 1, scope: !2, file: !3, line: 82, type: !7)
!308 = !DILocalVariable(name: "data_end", scope: !2, file: !3, line: 84, type: !72)
!309 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 85, type: !72)
!310 = !DILocalVariable(name: "nh", scope: !2, file: !3, line: 86, type: !311)
!311 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !312, line: 33, size: 64, elements: !313)
!312 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/home/nishanth/workspace/ebpf_workspace/xdp-tutorial/packet03-redirecting", checksumkind: CSK_MD5, checksum: "172efdd203783aed49c0ce78645261a8")
!313 = !{!314}
!314 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !311, file: !312, line: 34, baseType: !72, size: 64)
!315 = !DILocalVariable(name: "eth", scope: !2, file: !3, line: 87, type: !130)
!316 = !DILocalVariable(name: "eth_type", scope: !2, file: !3, line: 88, type: !6)
!317 = !DILocalVariable(name: "ip_type", scope: !2, file: !3, line: 89, type: !6)
!318 = !DILocalVariable(name: "icmp_type", scope: !2, file: !3, line: 90, type: !6)
!319 = !DILocalVariable(name: "iphdr", scope: !2, file: !3, line: 91, type: !171)
!320 = !DILocalVariable(name: "ipv6hdr", scope: !2, file: !3, line: 92, type: !139)
!321 = !DILocalVariable(name: "echo_reply", scope: !2, file: !3, line: 93, type: !74)
!322 = !DILocalVariable(name: "icmphdr", scope: !2, file: !3, line: 94, type: !323)
!323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !324, size: 64)
!324 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr_common", file: !312, line: 51, size: 32, elements: !325)
!325 = !{!326, !327, !328}
!326 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !324, file: !312, line: 52, baseType: !91, size: 8)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !324, file: !312, line: 53, baseType: !91, size: 8, offset: 8)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "cksum", scope: !324, file: !312, line: 54, baseType: !184, size: 16, offset: 16)
!329 = !DILocalVariable(name: "action", scope: !2, file: !3, line: 95, type: !12)
!330 = !DILabel(scope: !2, name: "out", file: !3, line: 145)
!331 = !DICompositeType(tag: DW_TAG_array_type, baseType: !196, size: 120, elements: !332)
!332 = !{!333}
!333 = !DISubrange(count: 15)
!334 = !{i32 7, !"Dwarf Version", i32 5}
!335 = !{i32 2, !"Debug Info Version", i32 3}
!336 = !{i32 1, !"wchar_size", i32 4}
!337 = !{i32 7, !"frame-pointer", i32 2}
!338 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!339 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 41447f6fdfe4d67bbd130bc6035e66f3fa1ebeff)"}
!340 = distinct !DIAssignID()
!341 = distinct !DIAssignID()
!342 = distinct !DIAssignID()
!343 = !DILocation(line: 0, scope: !2)
!344 = !DILocation(line: 84, column: 38, scope: !2)
!345 = !{!346, !347, i64 4}
!346 = !{!"xdp_md", !347, i64 0, !347, i64 4, !347, i64 8, !347, i64 12, !347, i64 16, !347, i64 20}
!347 = !{!"int", !348, i64 0}
!348 = !{!"omnipotent char", !349, i64 0}
!349 = !{!"Simple C/C++ TBAA"}
!350 = !DILocation(line: 84, column: 27, scope: !2)
!351 = !DILocation(line: 84, column: 19, scope: !2)
!352 = !DILocation(line: 85, column: 34, scope: !2)
!353 = !{!346, !347, i64 0}
!354 = !DILocation(line: 85, column: 23, scope: !2)
!355 = !DILocation(line: 85, column: 15, scope: !2)
!356 = !DILocalVariable(name: "nh", arg: 1, scope: !357, file: !312, line: 124, type: !360)
!357 = distinct !DISubprogram(name: "parse_ethhdr", scope: !312, file: !312, line: 124, type: !358, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !362)
!358 = !DISubroutineType(types: !359)
!359 = !{!6, !360, !72, !361}
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !311, size: 64)
!361 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!362 = !{!356, !363, !364}
!363 = !DILocalVariable(name: "data_end", arg: 2, scope: !357, file: !312, line: 125, type: !72)
!364 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !357, file: !312, line: 126, type: !361)
!365 = !DILocation(line: 0, scope: !357, inlinedAt: !366)
!366 = distinct !DILocation(line: 101, column: 13, scope: !2)
!367 = !DILocalVariable(name: "nh", arg: 1, scope: !368, file: !312, line: 79, type: !360)
!368 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !312, file: !312, line: 79, type: !369, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !376)
!369 = !DISubroutineType(types: !370)
!370 = !{!6, !360, !72, !361, !371}
!371 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !372, size: 64)
!372 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !312, line: 64, size: 32, elements: !373)
!373 = !{!374}
!374 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !372, file: !312, line: 65, baseType: !375, size: 32)
!375 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, size: 32, elements: !208)
!376 = !{!367, !377, !378, !379, !380, !381, !382, !388, !389}
!377 = !DILocalVariable(name: "data_end", arg: 2, scope: !368, file: !312, line: 80, type: !72)
!378 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !368, file: !312, line: 81, type: !361)
!379 = !DILocalVariable(name: "vlans", arg: 4, scope: !368, file: !312, line: 82, type: !371)
!380 = !DILocalVariable(name: "eth", scope: !368, file: !312, line: 84, type: !130)
!381 = !DILocalVariable(name: "hdrsize", scope: !368, file: !312, line: 85, type: !6)
!382 = !DILocalVariable(name: "vlh", scope: !368, file: !312, line: 86, type: !383)
!383 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !384, size: 64)
!384 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !312, line: 42, size: 32, elements: !385)
!385 = !{!386, !387}
!386 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !384, file: !312, line: 43, baseType: !95, size: 16)
!387 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !384, file: !312, line: 44, baseType: !95, size: 16, offset: 16)
!388 = !DILocalVariable(name: "h_proto", scope: !368, file: !312, line: 87, type: !74)
!389 = !DILocalVariable(name: "i", scope: !368, file: !312, line: 88, type: !6)
!390 = !DILocation(line: 0, scope: !368, inlinedAt: !391)
!391 = distinct !DILocation(line: 129, column: 9, scope: !357, inlinedAt: !366)
!392 = !DILocation(line: 93, column: 14, scope: !393, inlinedAt: !391)
!393 = distinct !DILexicalBlock(scope: !368, file: !312, line: 93, column: 6)
!394 = !DILocation(line: 93, column: 24, scope: !393, inlinedAt: !391)
!395 = !DILocation(line: 93, column: 6, scope: !368, inlinedAt: !391)
!396 = !DILocation(line: 99, column: 17, scope: !368, inlinedAt: !391)
!397 = !{!398, !398, i64 0}
!398 = !{!"short", !348, i64 0}
!399 = !DILocalVariable(name: "h_proto", arg: 1, scope: !400, file: !312, line: 68, type: !74)
!400 = distinct !DISubprogram(name: "proto_is_vlan", scope: !312, file: !312, line: 68, type: !401, scopeLine: 69, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !403)
!401 = !DISubroutineType(types: !402)
!402 = !{!6, !74}
!403 = !{!399}
!404 = !DILocation(line: 0, scope: !400, inlinedAt: !405)
!405 = distinct !DILocation(line: 106, column: 8, scope: !406, inlinedAt: !391)
!406 = distinct !DILexicalBlock(scope: !407, file: !312, line: 106, column: 7)
!407 = distinct !DILexicalBlock(scope: !408, file: !312, line: 105, column: 39)
!408 = distinct !DILexicalBlock(scope: !409, file: !312, line: 105, column: 2)
!409 = distinct !DILexicalBlock(scope: !368, file: !312, line: 105, column: 2)
!410 = !DILocation(line: 70, column: 20, scope: !400, inlinedAt: !405)
!411 = !DILocation(line: 70, column: 46, scope: !400, inlinedAt: !405)
!412 = !DILocation(line: 106, column: 7, scope: !407, inlinedAt: !391)
!413 = !DILocation(line: 112, column: 18, scope: !407, inlinedAt: !391)
!414 = !DILocation(line: 102, column: 6, scope: !2)
!415 = !DILocalVariable(name: "nh", arg: 1, scope: !416, file: !312, line: 151, type: !360)
!416 = distinct !DISubprogram(name: "parse_iphdr", scope: !312, file: !312, line: 151, type: !417, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !420)
!417 = !DISubroutineType(types: !418)
!418 = !{!6, !360, !72, !419}
!419 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64)
!420 = !{!415, !421, !422, !423, !424}
!421 = !DILocalVariable(name: "data_end", arg: 2, scope: !416, file: !312, line: 152, type: !72)
!422 = !DILocalVariable(name: "iphdr", arg: 3, scope: !416, file: !312, line: 153, type: !419)
!423 = !DILocalVariable(name: "iph", scope: !416, file: !312, line: 155, type: !171)
!424 = !DILocalVariable(name: "hdrsize", scope: !416, file: !312, line: 156, type: !6)
!425 = !DILocation(line: 0, scope: !416, inlinedAt: !426)
!426 = distinct !DILocation(line: 103, column: 13, scope: !427)
!427 = distinct !DILexicalBlock(scope: !428, file: !3, line: 102, column: 39)
!428 = distinct !DILexicalBlock(scope: !2, file: !3, line: 102, column: 6)
!429 = !DILocation(line: 158, column: 10, scope: !430, inlinedAt: !426)
!430 = distinct !DILexicalBlock(scope: !416, file: !312, line: 158, column: 6)
!431 = !DILocation(line: 158, column: 14, scope: !430, inlinedAt: !426)
!432 = !DILocation(line: 158, column: 6, scope: !416, inlinedAt: !426)
!433 = !DILocation(line: 161, column: 17, scope: !416, inlinedAt: !426)
!434 = !DILocation(line: 161, column: 21, scope: !416, inlinedAt: !426)
!435 = !DILocation(line: 163, column: 13, scope: !436, inlinedAt: !426)
!436 = distinct !DILexicalBlock(scope: !416, file: !312, line: 163, column: 5)
!437 = !DILocation(line: 163, column: 5, scope: !416, inlinedAt: !426)
!438 = !DILocation(line: 167, column: 14, scope: !439, inlinedAt: !426)
!439 = distinct !DILexicalBlock(scope: !416, file: !312, line: 167, column: 6)
!440 = !DILocation(line: 167, column: 24, scope: !439, inlinedAt: !426)
!441 = !DILocation(line: 167, column: 6, scope: !416, inlinedAt: !426)
!442 = !DILocation(line: 173, column: 14, scope: !416, inlinedAt: !426)
!443 = !{!444, !348, i64 9}
!444 = !{!"iphdr", !348, i64 0, !348, i64 0, !348, i64 1, !398, i64 2, !398, i64 4, !398, i64 6, !348, i64 8, !348, i64 9, !398, i64 10, !347, i64 12, !347, i64 16}
!445 = !DILocation(line: 104, column: 15, scope: !446)
!446 = distinct !DILexicalBlock(scope: !427, file: !3, line: 104, column: 7)
!447 = !DILocation(line: 104, column: 7, scope: !427)
!448 = !DILocalVariable(name: "nh", arg: 1, scope: !449, file: !312, line: 132, type: !360)
!449 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !312, file: !312, line: 132, type: !450, scopeLine: 135, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !453)
!450 = !DISubroutineType(types: !451)
!451 = !{!6, !360, !72, !452}
!452 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!453 = !{!448, !454, !455, !456}
!454 = !DILocalVariable(name: "data_end", arg: 2, scope: !449, file: !312, line: 133, type: !72)
!455 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !449, file: !312, line: 134, type: !452)
!456 = !DILocalVariable(name: "ip6h", scope: !449, file: !312, line: 136, type: !139)
!457 = !DILocation(line: 0, scope: !449, inlinedAt: !458)
!458 = distinct !DILocation(line: 107, column: 13, scope: !459)
!459 = distinct !DILexicalBlock(scope: !460, file: !3, line: 106, column: 48)
!460 = distinct !DILexicalBlock(scope: !428, file: !3, line: 106, column: 13)
!461 = !DILocation(line: 142, column: 11, scope: !462, inlinedAt: !458)
!462 = distinct !DILexicalBlock(scope: !449, file: !312, line: 142, column: 6)
!463 = !DILocation(line: 142, column: 15, scope: !462, inlinedAt: !458)
!464 = !DILocation(line: 142, column: 6, scope: !449, inlinedAt: !458)
!465 = !DILocation(line: 148, column: 15, scope: !449, inlinedAt: !458)
!466 = !{!467, !348, i64 6}
!467 = !{!"ipv6hdr", !348, i64 0, !348, i64 0, !348, i64 1, !398, i64 4, !348, i64 6, !348, i64 7, !468, i64 8, !468, i64 24}
!468 = !{!"in6_addr", !348, i64 0}
!469 = !DILocation(line: 108, column: 15, scope: !470)
!470 = distinct !DILexicalBlock(scope: !459, file: !3, line: 108, column: 7)
!471 = !DILocation(line: 108, column: 7, scope: !459)
!472 = !DILocation(line: 98, column: 9, scope: !2)
!473 = !DILocalVariable(name: "nh", arg: 1, scope: !474, file: !312, line: 206, type: !360)
!474 = distinct !DISubprogram(name: "parse_icmphdr_common", scope: !312, file: !312, line: 206, type: !475, scopeLine: 209, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !478)
!475 = !DISubroutineType(types: !476)
!476 = !{!6, !360, !72, !477}
!477 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !323, size: 64)
!478 = !{!473, !479, !480, !481}
!479 = !DILocalVariable(name: "data_end", arg: 2, scope: !474, file: !312, line: 207, type: !72)
!480 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !474, file: !312, line: 208, type: !477)
!481 = !DILocalVariable(name: "h", scope: !474, file: !312, line: 210, type: !323)
!482 = !DILocation(line: 0, scope: !474, inlinedAt: !483)
!483 = distinct !DILocation(line: 120, column: 14, scope: !2)
!484 = !DILocation(line: 212, column: 8, scope: !485, inlinedAt: !483)
!485 = distinct !DILexicalBlock(scope: !474, file: !312, line: 212, column: 6)
!486 = !DILocation(line: 212, column: 12, scope: !485, inlinedAt: !483)
!487 = !DILocation(line: 212, column: 6, scope: !474, inlinedAt: !483)
!488 = !DILocation(line: 218, column: 12, scope: !474, inlinedAt: !483)
!489 = !{!490, !348, i64 0}
!490 = !{!"icmphdr_common", !348, i64 0, !348, i64 1, !398, i64 2}
!491 = !DILocation(line: 121, column: 38, scope: !492)
!492 = distinct !DILexicalBlock(scope: !2, file: !3, line: 121, column: 6)
!493 = !DILocalVariable(name: "iphdr", arg: 1, scope: !494, file: !3, line: 58, type: !171)
!494 = distinct !DISubprogram(name: "swap_src_dst_ipv4", scope: !3, file: !3, line: 58, type: !495, scopeLine: 59, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !497)
!495 = !DISubroutineType(types: !496)
!496 = !{null, !171}
!497 = !{!493, !498}
!498 = !DILocalVariable(name: "ipaddr", scope: !494, file: !3, line: 61, type: !77)
!499 = !DILocation(line: 0, scope: !494, inlinedAt: !500)
!500 = distinct !DILocation(line: 123, column: 3, scope: !501)
!501 = distinct !DILexicalBlock(scope: !492, file: !3, line: 121, column: 65)
!502 = !DILocation(line: 62, column: 18, scope: !494, inlinedAt: !500)
!503 = !{!444, !347, i64 12}
!504 = !DILocation(line: 63, column: 24, scope: !494, inlinedAt: !500)
!505 = !{!444, !347, i64 16}
!506 = !DILocation(line: 63, column: 15, scope: !494, inlinedAt: !500)
!507 = !DILocation(line: 64, column: 15, scope: !494, inlinedAt: !500)
!508 = !DILocation(line: 125, column: 2, scope: !501)
!509 = !DILocation(line: 126, column: 6, scope: !510)
!510 = distinct !DILexicalBlock(scope: !492, file: !3, line: 125, column: 13)
!511 = !DILocalVariable(name: "ipaddr", scope: !512, file: !3, line: 52, type: !153)
!512 = distinct !DISubprogram(name: "swap_src_dst_ipv6", scope: !3, file: !3, line: 49, type: !513, scopeLine: 50, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !515)
!513 = !DISubroutineType(types: !514)
!514 = !{null, !139}
!515 = !{!516, !511}
!516 = !DILocalVariable(name: "ipv6", arg: 1, scope: !512, file: !3, line: 49, type: !139)
!517 = !DILocation(line: 0, scope: !512, inlinedAt: !518)
!518 = distinct !DILocation(line: 128, column: 3, scope: !519)
!519 = distinct !DILexicalBlock(scope: !510, file: !3, line: 126, column: 43)
!520 = !DILocation(line: 52, column: 2, scope: !512, inlinedAt: !518)
!521 = !DILocation(line: 53, column: 17, scope: !512, inlinedAt: !518)
!522 = !{i64 0, i64 16, !523, i64 0, i64 16, !523, i64 0, i64 16, !523}
!523 = !{!348, !348, i64 0}
!524 = distinct !DIAssignID()
!525 = !DILocation(line: 54, column: 22, scope: !512, inlinedAt: !518)
!526 = !DILocation(line: 55, column: 16, scope: !512, inlinedAt: !518)
!527 = !DILocation(line: 56, column: 1, scope: !512, inlinedAt: !518)
!528 = !DILocation(line: 0, scope: !492)
!529 = !DILocalVariable(name: "icmph", scope: !530, file: !3, line: 70, type: !324)
!530 = distinct !DISubprogram(name: "set_type_and_checksum", scope: !3, file: !3, line: 67, type: !531, scopeLine: 68, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !533)
!531 = !DISubroutineType(types: !532)
!532 = !{null, !323, !6}
!533 = !{!534, !535, !529, !536}
!534 = !DILocalVariable(name: "icmphdr", arg: 1, scope: !530, file: !3, line: 67, type: !323)
!535 = !DILocalVariable(name: "echo_reply", arg: 2, scope: !530, file: !3, line: 67, type: !6)
!536 = !DILocalVariable(name: "value", scope: !530, file: !3, line: 75, type: !6)
!537 = !DILocation(line: 0, scope: !530, inlinedAt: !538)
!538 = distinct !DILocation(line: 133, column: 2, scope: !2)
!539 = !DILocation(line: 70, column: 2, scope: !530, inlinedAt: !538)
!540 = !DILocation(line: 71, column: 2, scope: !530, inlinedAt: !538)
!541 = distinct !DIAssignID()
!542 = !DILocation(line: 74, column: 18, scope: !530, inlinedAt: !538)
!543 = !DILocation(line: 74, column: 16, scope: !530, inlinedAt: !538)
!544 = !DILocation(line: 76, column: 10, scope: !530, inlinedAt: !538)
!545 = !DILocation(line: 77, column: 25, scope: !530, inlinedAt: !538)
!546 = !{!490, !398, i64 2}
!547 = !DILocation(line: 77, column: 31, scope: !530, inlinedAt: !538)
!548 = !DILocation(line: 77, column: 11, scope: !530, inlinedAt: !538)
!549 = !DILocation(line: 77, column: 17, scope: !530, inlinedAt: !538)
!550 = !DILocation(line: 78, column: 1, scope: !530, inlinedAt: !538)
!551 = !DILocalVariable(name: "eth", arg: 1, scope: !552, file: !3, line: 35, type: !130)
!552 = distinct !DISubprogram(name: "swap_src_dst_mac", scope: !3, file: !3, line: 35, type: !553, scopeLine: 36, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !555)
!553 = !DISubroutineType(types: !554)
!554 = !{null, !130}
!555 = !{!551, !556, !557}
!556 = !DILocalVariable(name: "temp", scope: !552, file: !3, line: 40, type: !92)
!557 = !DILocalVariable(name: "i", scope: !552, file: !3, line: 41, type: !6)
!558 = !DILocation(line: 0, scope: !552, inlinedAt: !559)
!559 = distinct !DILocation(line: 136, column: 2, scope: !2)
!560 = !DILocation(line: 43, column: 10, scope: !561, inlinedAt: !559)
!561 = distinct !DILexicalBlock(scope: !562, file: !3, line: 42, column: 33)
!562 = distinct !DILexicalBlock(scope: !563, file: !3, line: 42, column: 2)
!563 = distinct !DILexicalBlock(scope: !552, file: !3, line: 42, column: 2)
!564 = !DILocation(line: 44, column: 20, scope: !561, inlinedAt: !559)
!565 = !DILocation(line: 44, column: 18, scope: !561, inlinedAt: !559)
!566 = !DILocation(line: 45, column: 20, scope: !561, inlinedAt: !559)
!567 = !DILocation(line: 141, column: 2, scope: !568)
!568 = distinct !DILexicalBlock(scope: !2, file: !3, line: 141, column: 2)
!569 = !DILocation(line: 143, column: 2, scope: !2)
!570 = !DILocation(line: 145, column: 1, scope: !2)
!571 = !DILocation(line: 0, scope: !572, inlinedAt: !579)
!572 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !215, file: !215, line: 25, type: !573, scopeLine: 26, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !575)
!573 = !DISubroutineType(types: !574)
!574 = !{!12, !7, !12}
!575 = !{!576, !577, !578}
!576 = !DILocalVariable(name: "ctx", arg: 1, scope: !572, file: !215, line: 25, type: !7)
!577 = !DILocalVariable(name: "action", arg: 2, scope: !572, file: !215, line: 25, type: !12)
!578 = !DILocalVariable(name: "rec", scope: !572, file: !215, line: 31, type: !224)
!579 = distinct !DILocation(line: 146, column: 9, scope: !2)
!580 = !{!347, !347, i64 0}
!581 = distinct !DIAssignID()
!582 = !DILocation(line: 31, column: 24, scope: !572, inlinedAt: !579)
!583 = !DILocation(line: 32, column: 7, scope: !584, inlinedAt: !579)
!584 = distinct !DILexicalBlock(scope: !572, file: !215, line: 32, column: 6)
!585 = !DILocation(line: 32, column: 6, scope: !572, inlinedAt: !579)
!586 = !DILocation(line: 39, column: 17, scope: !572, inlinedAt: !579)
!587 = !{!588, !589, i64 0}
!588 = !{!"datarec", !589, i64 0, !589, i64 8}
!589 = !{!"long long", !348, i64 0}
!590 = !DILocation(line: 40, column: 25, scope: !572, inlinedAt: !579)
!591 = !DILocation(line: 40, column: 41, scope: !572, inlinedAt: !579)
!592 = !DILocation(line: 40, column: 34, scope: !572, inlinedAt: !579)
!593 = !DILocation(line: 40, column: 19, scope: !572, inlinedAt: !579)
!594 = !DILocation(line: 40, column: 7, scope: !572, inlinedAt: !579)
!595 = !DILocation(line: 40, column: 16, scope: !572, inlinedAt: !579)
!596 = !{!588, !589, i64 8}
!597 = !DILocation(line: 42, column: 9, scope: !572, inlinedAt: !579)
!598 = !DILocation(line: 42, column: 2, scope: !572, inlinedAt: !579)
!599 = !DILocation(line: 43, column: 1, scope: !572, inlinedAt: !579)
!600 = !DILocation(line: 146, column: 2, scope: !2)
!601 = distinct !DISubprogram(name: "xdp_redirect_func", scope: !3, file: !3, line: 151, type: !4, scopeLine: 152, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !602)
!602 = !{!603, !604, !605, !606, !607, !608, !609, !610, !611, !612, !613}
!603 = !DILocalVariable(name: "ctx", arg: 1, scope: !601, file: !3, line: 151, type: !7)
!604 = !DILocalVariable(name: "data_end", scope: !601, file: !3, line: 153, type: !72)
!605 = !DILocalVariable(name: "data", scope: !601, file: !3, line: 154, type: !72)
!606 = !DILocalVariable(name: "nh", scope: !601, file: !3, line: 155, type: !311)
!607 = !DILocalVariable(name: "eth", scope: !601, file: !3, line: 156, type: !130)
!608 = !DILocalVariable(name: "eth_type", scope: !601, file: !3, line: 157, type: !6)
!609 = !DILocalVariable(name: "action", scope: !601, file: !3, line: 158, type: !6)
!610 = !DILocalVariable(name: "dst", scope: !601, file: !3, line: 159, type: !135)
!611 = !DILocalVariable(name: "ifindex", scope: !601, file: !3, line: 160, type: !14)
!612 = !DILocalVariable(name: "i", scope: !601, file: !3, line: 161, type: !6)
!613 = !DILabel(scope: !601, name: "out", file: !3, line: 177)
!614 = distinct !DIAssignID()
!615 = !DILocation(line: 0, scope: !601)
!616 = !DILocation(line: 153, column: 38, scope: !601)
!617 = !DILocation(line: 153, column: 27, scope: !601)
!618 = !DILocation(line: 153, column: 19, scope: !601)
!619 = !DILocation(line: 154, column: 34, scope: !601)
!620 = !DILocation(line: 154, column: 23, scope: !601)
!621 = !DILocation(line: 154, column: 15, scope: !601)
!622 = !DILocation(line: 0, scope: !357, inlinedAt: !623)
!623 = distinct !DILocation(line: 167, column: 13, scope: !601)
!624 = !DILocation(line: 0, scope: !368, inlinedAt: !625)
!625 = distinct !DILocation(line: 129, column: 9, scope: !357, inlinedAt: !623)
!626 = !DILocation(line: 93, column: 14, scope: !393, inlinedAt: !625)
!627 = !DILocation(line: 93, column: 24, scope: !393, inlinedAt: !625)
!628 = !DILocation(line: 93, column: 6, scope: !368, inlinedAt: !625)
!629 = !DILocation(line: 99, column: 17, scope: !368, inlinedAt: !625)
!630 = !DILocation(line: 0, scope: !400, inlinedAt: !631)
!631 = distinct !DILocation(line: 106, column: 8, scope: !406, inlinedAt: !625)
!632 = !DILocation(line: 70, column: 20, scope: !400, inlinedAt: !631)
!633 = !DILocation(line: 70, column: 46, scope: !400, inlinedAt: !631)
!634 = !DILocation(line: 106, column: 7, scope: !407, inlinedAt: !625)
!635 = !DILocation(line: 112, column: 18, scope: !407, inlinedAt: !625)
!636 = !DILocation(line: 174, column: 18, scope: !637)
!637 = distinct !DILexicalBlock(scope: !638, file: !3, line: 173, column: 2)
!638 = distinct !DILexicalBlock(scope: !601, file: !3, line: 173, column: 2)
!639 = !DILocation(line: 174, column: 3, scope: !637)
!640 = !DILocation(line: 176, column: 11, scope: !601)
!641 = !DILocation(line: 177, column: 1, scope: !601)
!642 = !DILocation(line: 0, scope: !572, inlinedAt: !643)
!643 = distinct !DILocation(line: 178, column: 9, scope: !601)
!644 = distinct !DIAssignID()
!645 = !DILocation(line: 27, column: 13, scope: !646, inlinedAt: !643)
!646 = distinct !DILexicalBlock(scope: !572, file: !215, line: 27, column: 6)
!647 = !DILocation(line: 27, column: 6, scope: !572, inlinedAt: !643)
!648 = !DILocation(line: 31, column: 24, scope: !572, inlinedAt: !643)
!649 = !DILocation(line: 32, column: 7, scope: !584, inlinedAt: !643)
!650 = !DILocation(line: 32, column: 6, scope: !572, inlinedAt: !643)
!651 = !DILocation(line: 39, column: 17, scope: !572, inlinedAt: !643)
!652 = !DILocation(line: 40, column: 25, scope: !572, inlinedAt: !643)
!653 = !DILocation(line: 40, column: 41, scope: !572, inlinedAt: !643)
!654 = !DILocation(line: 40, column: 34, scope: !572, inlinedAt: !643)
!655 = !DILocation(line: 40, column: 19, scope: !572, inlinedAt: !643)
!656 = !DILocation(line: 40, column: 7, scope: !572, inlinedAt: !643)
!657 = !DILocation(line: 40, column: 16, scope: !572, inlinedAt: !643)
!658 = !DILocation(line: 42, column: 9, scope: !572, inlinedAt: !643)
!659 = !DILocation(line: 42, column: 2, scope: !572, inlinedAt: !643)
!660 = !DILocation(line: 43, column: 1, scope: !572, inlinedAt: !643)
!661 = !DILocation(line: 178, column: 2, scope: !601)
!662 = distinct !DISubprogram(name: "xdp_redirect_map_func", scope: !3, file: !3, line: 183, type: !4, scopeLine: 184, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !663)
!663 = !{!664, !665, !666, !667, !668, !669, !670, !671, !673}
!664 = !DILocalVariable(name: "ctx", arg: 1, scope: !662, file: !3, line: 183, type: !7)
!665 = !DILocalVariable(name: "data_end", scope: !662, file: !3, line: 185, type: !72)
!666 = !DILocalVariable(name: "data", scope: !662, file: !3, line: 186, type: !72)
!667 = !DILocalVariable(name: "nh", scope: !662, file: !3, line: 187, type: !311)
!668 = !DILocalVariable(name: "eth", scope: !662, file: !3, line: 188, type: !130)
!669 = !DILocalVariable(name: "eth_type", scope: !662, file: !3, line: 189, type: !6)
!670 = !DILocalVariable(name: "action", scope: !662, file: !3, line: 190, type: !6)
!671 = !DILocalVariable(name: "dst", scope: !662, file: !3, line: 191, type: !672)
!672 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!673 = !DILabel(scope: !662, name: "out", file: !3, line: 210)
!674 = distinct !DIAssignID()
!675 = !DILocation(line: 0, scope: !662)
!676 = !DILocation(line: 185, column: 38, scope: !662)
!677 = !DILocation(line: 185, column: 27, scope: !662)
!678 = !DILocation(line: 185, column: 19, scope: !662)
!679 = !DILocation(line: 186, column: 34, scope: !662)
!680 = !DILocation(line: 186, column: 23, scope: !662)
!681 = !DILocation(line: 186, column: 15, scope: !662)
!682 = !DILocation(line: 0, scope: !357, inlinedAt: !683)
!683 = distinct !DILocation(line: 197, column: 13, scope: !662)
!684 = !DILocation(line: 0, scope: !368, inlinedAt: !685)
!685 = distinct !DILocation(line: 129, column: 9, scope: !357, inlinedAt: !683)
!686 = !DILocation(line: 93, column: 14, scope: !393, inlinedAt: !685)
!687 = !DILocation(line: 93, column: 24, scope: !393, inlinedAt: !685)
!688 = !DILocation(line: 93, column: 6, scope: !368, inlinedAt: !685)
!689 = !DILocation(line: 99, column: 17, scope: !368, inlinedAt: !685)
!690 = !DILocation(line: 0, scope: !400, inlinedAt: !691)
!691 = distinct !DILocation(line: 106, column: 8, scope: !406, inlinedAt: !685)
!692 = !DILocation(line: 70, column: 20, scope: !400, inlinedAt: !691)
!693 = !DILocation(line: 70, column: 46, scope: !400, inlinedAt: !691)
!694 = !DILocation(line: 106, column: 7, scope: !407, inlinedAt: !685)
!695 = !DILocation(line: 112, column: 18, scope: !407, inlinedAt: !685)
!696 = !DILocation(line: 202, column: 51, scope: !662)
!697 = !DILocation(line: 202, column: 8, scope: !662)
!698 = !DILocation(line: 203, column: 7, scope: !699)
!699 = distinct !DILexicalBlock(scope: !662, file: !3, line: 203, column: 6)
!700 = !DILocation(line: 203, column: 6, scope: !662)
!701 = !DILocation(line: 210, column: 1, scope: !662)
!702 = !DILocation(line: 0, scope: !572, inlinedAt: !703)
!703 = distinct !DILocation(line: 211, column: 9, scope: !662)
!704 = distinct !DIAssignID()
!705 = !DILocation(line: 27, column: 6, scope: !572, inlinedAt: !703)
!706 = !DILocation(line: 207, column: 2, scope: !662)
!707 = !DILocation(line: 208, column: 11, scope: !662)
!708 = !DILocation(line: 27, column: 13, scope: !646, inlinedAt: !703)
!709 = !DILocation(line: 31, column: 24, scope: !572, inlinedAt: !703)
!710 = !DILocation(line: 32, column: 7, scope: !584, inlinedAt: !703)
!711 = !DILocation(line: 32, column: 6, scope: !572, inlinedAt: !703)
!712 = !DILocation(line: 39, column: 17, scope: !572, inlinedAt: !703)
!713 = !DILocation(line: 40, column: 25, scope: !572, inlinedAt: !703)
!714 = !DILocation(line: 40, column: 41, scope: !572, inlinedAt: !703)
!715 = !DILocation(line: 40, column: 34, scope: !572, inlinedAt: !703)
!716 = !DILocation(line: 40, column: 19, scope: !572, inlinedAt: !703)
!717 = !DILocation(line: 40, column: 7, scope: !572, inlinedAt: !703)
!718 = !DILocation(line: 40, column: 16, scope: !572, inlinedAt: !703)
!719 = !DILocation(line: 42, column: 9, scope: !572, inlinedAt: !703)
!720 = !DILocation(line: 42, column: 2, scope: !572, inlinedAt: !703)
!721 = !DILocation(line: 43, column: 1, scope: !572, inlinedAt: !703)
!722 = !DILocation(line: 211, column: 2, scope: !662)
!723 = distinct !DIAssignID()
!724 = distinct !DIAssignID()
!725 = !DILocation(line: 0, scope: !82)
!726 = !DILocation(line: 225, column: 38, scope: !82)
!727 = !DILocation(line: 225, column: 27, scope: !82)
!728 = !DILocation(line: 225, column: 19, scope: !82)
!729 = !DILocation(line: 226, column: 34, scope: !82)
!730 = !DILocation(line: 226, column: 23, scope: !82)
!731 = !DILocation(line: 226, column: 15, scope: !82)
!732 = !DILocation(line: 227, column: 2, scope: !82)
!733 = !DILocation(line: 227, column: 24, scope: !82)
!734 = distinct !DIAssignID()
!735 = !DILocation(line: 237, column: 11, scope: !736)
!736 = distinct !DILexicalBlock(scope: !82, file: !3, line: 237, column: 6)
!737 = !DILocation(line: 237, column: 20, scope: !736)
!738 = !DILocation(line: 237, column: 6, scope: !82)
!739 = !DILocation(line: 242, column: 17, scope: !82)
!740 = !{!741, !398, i64 12}
!741 = !{!"ethhdr", !348, i64 0, !348, i64 6, !398, i64 12}
!742 = !DILocation(line: 243, column: 14, scope: !743)
!743 = distinct !DILexicalBlock(scope: !82, file: !3, line: 243, column: 6)
!744 = !DILocation(line: 243, column: 6, scope: !82)
!745 = !DILocation(line: 246, column: 11, scope: !746)
!746 = distinct !DILexicalBlock(scope: !747, file: !3, line: 246, column: 7)
!747 = distinct !DILexicalBlock(scope: !743, file: !3, line: 243, column: 38)
!748 = !DILocation(line: 246, column: 15, scope: !746)
!749 = !DILocation(line: 246, column: 7, scope: !747)
!750 = !DILocation(line: 251, column: 12, scope: !751)
!751 = distinct !DILexicalBlock(scope: !747, file: !3, line: 251, column: 7)
!752 = !{!444, !348, i64 8}
!753 = !DILocation(line: 251, column: 16, scope: !751)
!754 = !DILocation(line: 251, column: 7, scope: !747)
!755 = !DILocation(line: 254, column: 21, scope: !747)
!756 = !{!757, !348, i64 0}
!757 = !{!"bpf_fib_lookup", !348, i64 0, !348, i64 1, !398, i64 2, !398, i64 4, !348, i64 6, !347, i64 8, !348, i64 12, !348, i64 16, !348, i64 32, !398, i64 48, !398, i64 50, !348, i64 52, !348, i64 58}
!758 = distinct !DIAssignID()
!759 = !DILocation(line: 255, column: 30, scope: !747)
!760 = !DILocation(line: 255, column: 14, scope: !747)
!761 = !DILocation(line: 255, column: 23, scope: !747)
!762 = distinct !DIAssignID()
!763 = !DILocation(line: 256, column: 30, scope: !747)
!764 = !DILocation(line: 256, column: 14, scope: !747)
!765 = !DILocation(line: 256, column: 23, scope: !747)
!766 = distinct !DIAssignID()
!767 = !DILocation(line: 257, column: 2, scope: !747)
!768 = !DILocation(line: 257, column: 21, scope: !769)
!769 = distinct !DILexicalBlock(scope: !743, file: !3, line: 257, column: 13)
!770 = !DILocation(line: 257, column: 13, scope: !743)
!771 = !DILocation(line: 263, column: 12, scope: !772)
!772 = distinct !DILexicalBlock(scope: !773, file: !3, line: 263, column: 7)
!773 = distinct !DILexicalBlock(scope: !769, file: !3, line: 257, column: 47)
!774 = !DILocation(line: 263, column: 16, scope: !772)
!775 = !DILocation(line: 263, column: 7, scope: !773)
!776 = !DILocation(line: 268, column: 13, scope: !777)
!777 = distinct !DILexicalBlock(scope: !773, file: !3, line: 268, column: 7)
!778 = !{!467, !348, i64 7}
!779 = !DILocation(line: 268, column: 23, scope: !777)
!780 = !DILocation(line: 268, column: 7, scope: !773)
!781 = !DILocation(line: 276, column: 28, scope: !82)
!782 = !{!346, !347, i64 12}
!783 = !DILocation(line: 276, column: 13, scope: !82)
!784 = !DILocation(line: 276, column: 21, scope: !82)
!785 = !{!757, !347, i64 8}
!786 = distinct !DIAssignID()
!787 = !DILocation(line: 278, column: 7, scope: !82)
!788 = !DILocation(line: 279, column: 2, scope: !789)
!789 = distinct !DILexicalBlock(scope: !82, file: !3, line: 279, column: 2)
!790 = !DILocation(line: 280, column: 2, scope: !82)
!791 = !DILocation(line: 282, column: 7, scope: !792)
!792 = distinct !DILexicalBlock(scope: !82, file: !3, line: 280, column: 14)
!793 = !DILocalVariable(name: "iph", arg: 1, scope: !794, file: !3, line: 215, type: !171)
!794 = distinct !DISubprogram(name: "ip_decrease_ttl", scope: !3, file: !3, line: 215, type: !795, scopeLine: 216, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !797)
!795 = !DISubroutineType(types: !796)
!796 = !{!6, !171}
!797 = !{!793}
!798 = !DILocation(line: 0, scope: !794, inlinedAt: !799)
!799 = distinct !DILocation(line: 283, column: 4, scope: !800)
!800 = distinct !DILexicalBlock(scope: !792, file: !3, line: 282, column: 7)
!801 = !DILocation(line: 218, column: 16, scope: !794, inlinedAt: !799)
!802 = !DILocation(line: 218, column: 9, scope: !794, inlinedAt: !799)
!803 = !DILocation(line: 283, column: 4, scope: !800)
!804 = !DILocation(line: 284, column: 20, scope: !805)
!805 = distinct !DILexicalBlock(scope: !800, file: !3, line: 284, column: 12)
!806 = !DILocation(line: 284, column: 12, scope: !800)
!807 = !DILocation(line: 285, column: 10, scope: !805)
!808 = !DILocation(line: 285, column: 19, scope: !805)
!809 = !DILocation(line: 285, column: 4, scope: !805)
!810 = !DILocation(line: 289, column: 3, scope: !792)
!811 = !DILocation(line: 290, column: 3, scope: !792)
!812 = !DILocation(line: 292, column: 4, scope: !813)
!813 = distinct !DILexicalBlock(scope: !814, file: !3, line: 292, column: 4)
!814 = distinct !DILexicalBlock(scope: !815, file: !3, line: 291, column: 33)
!815 = distinct !DILexicalBlock(scope: !816, file: !3, line: 291, column: 3)
!816 = distinct !DILexicalBlock(scope: !792, file: !3, line: 291, column: 3)
!817 = !DILocation(line: 294, column: 3, scope: !818)
!818 = distinct !DILexicalBlock(scope: !792, file: !3, line: 294, column: 3)
!819 = !DILocation(line: 295, column: 36, scope: !792)
!820 = !DILocation(line: 295, column: 12, scope: !792)
!821 = !DILocation(line: 311, column: 1, scope: !82)
!822 = !DILocation(line: 0, scope: !572, inlinedAt: !823)
!823 = distinct !DILocation(line: 312, column: 9, scope: !82)
!824 = distinct !DIAssignID()
!825 = !DILocation(line: 27, column: 13, scope: !646, inlinedAt: !823)
!826 = !DILocation(line: 27, column: 6, scope: !572, inlinedAt: !823)
!827 = !DILocation(line: 301, column: 3, scope: !792)
!828 = !DILocation(line: 31, column: 24, scope: !572, inlinedAt: !823)
!829 = !DILocation(line: 32, column: 7, scope: !584, inlinedAt: !823)
!830 = !DILocation(line: 32, column: 6, scope: !572, inlinedAt: !823)
!831 = !DILocation(line: 39, column: 17, scope: !572, inlinedAt: !823)
!832 = !DILocation(line: 40, column: 25, scope: !572, inlinedAt: !823)
!833 = !DILocation(line: 40, column: 41, scope: !572, inlinedAt: !823)
!834 = !DILocation(line: 40, column: 34, scope: !572, inlinedAt: !823)
!835 = !DILocation(line: 40, column: 19, scope: !572, inlinedAt: !823)
!836 = !DILocation(line: 40, column: 7, scope: !572, inlinedAt: !823)
!837 = !DILocation(line: 40, column: 16, scope: !572, inlinedAt: !823)
!838 = !DILocation(line: 42, column: 9, scope: !572, inlinedAt: !823)
!839 = !DILocation(line: 42, column: 2, scope: !572, inlinedAt: !823)
!840 = !DILocation(line: 43, column: 1, scope: !572, inlinedAt: !823)
!841 = !DILocation(line: 313, column: 1, scope: !82)
!842 = !DILocation(line: 312, column: 2, scope: !82)
!843 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 316, type: !4, scopeLine: 317, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !844)
!844 = !{!845}
!845 = !DILocalVariable(name: "ctx", arg: 1, scope: !843, file: !3, line: 316, type: !7)
!846 = !DILocation(line: 0, scope: !843)
!847 = !DILocation(line: 318, column: 2, scope: !843)
