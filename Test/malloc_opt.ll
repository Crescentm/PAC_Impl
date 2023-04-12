; ModuleID = 'malloc_opt.bc'
source_filename = "malloc.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.Foo = type { i32, i32 (...)*, i8 }
%struct.Bar = type { %struct.Foo*, i32, i8 }

@.str = private unnamed_addr constant [15 x i8] c"Hello, world!\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @func1() #0 !dbg !36 {
  %1 = alloca i32, align 4
  %2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0)), !dbg !40
  %3 = load i32, i32* %1, align 4, !dbg !41
  ret i32 %3, !dbg !41
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !42 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x i8], align 1
  %3 = alloca %struct.Foo, align 8
  %4 = bitcast %struct.Foo* %3 to i8**
  call void @setMetadata(i8** %4, i32 1, i32 24)
  %5 = alloca %struct.Bar*, align 8
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [10 x i8]* %2, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata %struct.Foo* %3, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata %struct.Bar** %5, metadata !50, metadata !DIExpression()), !dbg !53
  %6 = call i8* @malloc(i64 noundef 16), !dbg !54
  %7 = bitcast i8* %6 to %struct.Bar*, !dbg !55
  store %struct.Bar* %7, %struct.Bar** %5, align 8, !dbg !56
  %8 = bitcast %struct.Bar** %5 to i8**, !dbg !57
  call void @setMetadataObj(i8** %8, i32 1, i32 16), !dbg !57
  %9 = bitcast %struct.Bar** %5 to i8**, !dbg !57
  call void @addPAC(i8** %9), !dbg !57
  %10 = bitcast %struct.Bar** %5 to i8**, !dbg !57
  call void @authPAC(i8** %10, i32 0), !dbg !57
  %11 = load %struct.Bar*, %struct.Bar** %5, align 8, !dbg !57
  %12 = getelementptr inbounds %struct.Bar, %struct.Bar* %11, i32 0, i32 0, !dbg !58
  store volatile %struct.Foo* %3, %struct.Foo** %12, align 8, !dbg !59
  %13 = bitcast %struct.Foo** %12 to i8**, !dbg !60
  call void @addPAC(i8** %13), !dbg !60
  %14 = bitcast %struct.Bar** %5 to i8**, !dbg !60
  call void @authPAC(i8** %14, i32 0), !dbg !60
  %15 = load %struct.Bar*, %struct.Bar** %5, align 8, !dbg !60
  %16 = getelementptr inbounds %struct.Bar, %struct.Bar* %15, i32 0, i32 0, !dbg !61
  %17 = bitcast %struct.Foo** %16 to i8**, !dbg !61
  call void @authPAC(i8** %17, i32 0), !dbg !61
  %18 = load volatile %struct.Foo*, %struct.Foo** %16, align 8, !dbg !61
  %19 = getelementptr inbounds %struct.Foo, %struct.Foo* %18, i32 0, i32 1, !dbg !62
  store volatile i32 (...)* bitcast (i32 ()* @func1 to i32 (...)*), i32 (...)** %19, align 8, !dbg !63
  %20 = bitcast i32 (...)* bitcast (i32 ()* @func1 to i32 (...)*) to i8**, !dbg !64
  call void @setMetadata(i8** %20, i32 1, i32 8), !dbg !64
  %21 = bitcast i32 (...)** %19 to i8**, !dbg !64
  call void @addPAC(i8** %21), !dbg !64
  %22 = getelementptr inbounds [10 x i8], [10 x i8]* %2, i64 0, i64 3, !dbg !64
  store i8 65, i8* %22, align 1, !dbg !65
  %23 = bitcast %struct.Bar** %5 to i8**, !dbg !66
  call void @authPAC(i8** %23, i32 0), !dbg !66
  %24 = load %struct.Bar*, %struct.Bar** %5, align 8, !dbg !66
  %25 = getelementptr inbounds %struct.Bar, %struct.Bar* %24, i32 0, i32 0, !dbg !67
  %26 = bitcast %struct.Foo** %25 to i8**, !dbg !67
  call void @authPAC(i8** %26, i32 0), !dbg !67
  %27 = load volatile %struct.Foo*, %struct.Foo** %25, align 8, !dbg !67
  %28 = getelementptr inbounds %struct.Foo, %struct.Foo* %27, i32 0, i32 1, !dbg !68
  %29 = bitcast i32 (...)** %28 to i8**, !dbg !68
  call void @authPAC(i8** %29, i32 0), !dbg !68
  %30 = load volatile i32 (...)*, i32 (...)** %28, align 8, !dbg !68
  %31 = bitcast i32 (...)* %30 to i32 ()*, !dbg !66
  %32 = call i32 %31(), !dbg !66
  %33 = bitcast i32 (...)** %28 to i8**, !dbg !69
  call void @addPAC(i8** %33), !dbg !69
  %34 = bitcast %struct.Foo** %25 to i8**, !dbg !69
  call void @addPAC(i8** %34), !dbg !69
  %35 = bitcast %struct.Bar** %5 to i8**, !dbg !69
  call void @addPAC(i8** %35), !dbg !69
  %36 = call i32 @func1(), !dbg !69
  %37 = bitcast %struct.Bar** %5 to i8**, !dbg !70
  call void @authPAC(i8** %37, i32 0), !dbg !70
  %38 = load %struct.Bar*, %struct.Bar** %5, align 8, !dbg !70
  %39 = bitcast %struct.Bar* %38 to i8*, !dbg !70
  %40 = bitcast %struct.Bar** %5 to i8**, !dbg !71
  call void @removeMetadata(i8** %40), !dbg !71
  call void @free(i8* noundef %39), !dbg !71
  %41 = bitcast %struct.Foo* %3 to i8**, !dbg !72
  call void @removeMetadataStack(i8** %41), !dbg !72
  ret i32 0, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i8* @malloc(i64 noundef) #1

declare void @free(i8* noundef) #1

declare void @addPAC(i8**)

declare void @setMetadata(i8**, i32, i32)

declare void @setMetadataObj(i8**, i32, i32)

declare void @authPAC(i8**, i32)

declare void @removeMetadata(i8**)

declare void @removeMetadataStack(i8**)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8.5a" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8.5a" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34}
!llvm.ident = !{!35}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Debian clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "malloc.c", directory: "/home/parallels/PAC_Impl/Test", checksumkind: CSK_MD5, checksum: "3dc0f4732b7d222393244dd798bca6e9")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "Bar", file: !1, line: 13, baseType: !5)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 9, size: 128, elements: !6)
!6 = !{!7, !22, !23}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "foo", scope: !5, file: !1, line: 10, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !10)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "Foo", file: !1, line: 7, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 3, size: 192, elements: !12)
!12 = !{!13, !15, !20}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "dummy1", scope: !11, file: !1, line: 4, baseType: !14, size: 32)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "coolFunct", scope: !11, file: !1, line: 5, baseType: !16, size: 64, offset: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DISubroutineType(types: !18)
!18 = !{!19, null}
!19 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !14)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "dummy2", scope: !11, file: !1, line: 6, baseType: !21, size: 8, offset: 128)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "dummy1", scope: !5, file: !1, line: 11, baseType: !14, size: 32, offset: 64)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "dumm2", scope: !5, file: !1, line: 12, baseType: !21, size: 8, offset: 96)
!24 = !{i32 7, !"Dwarf Version", i32 5}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{i32 1, !"branch-target-enforcement", i32 0}
!28 = !{i32 1, !"sign-return-address", i32 0}
!29 = !{i32 1, !"sign-return-address-all", i32 0}
!30 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!31 = !{i32 7, !"PIC Level", i32 2}
!32 = !{i32 7, !"PIE Level", i32 2}
!33 = !{i32 7, !"uwtable", i32 1}
!34 = !{i32 7, !"frame-pointer", i32 1}
!35 = !{!"Debian clang version 14.0.6"}
!36 = distinct !DISubprogram(name: "func1", scope: !1, file: !1, line: 15, type: !37, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !39)
!37 = !DISubroutineType(types: !38)
!38 = !{!14}
!39 = !{}
!40 = !DILocation(line: 15, column: 15, scope: !36)
!41 = !DILocation(line: 15, column: 42, scope: !36)
!42 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 17, type: !37, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !39)
!43 = !DILocalVariable(name: "doo", scope: !42, file: !1, line: 18, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 80, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 10)
!47 = !DILocation(line: 18, column: 8, scope: !42)
!48 = !DILocalVariable(name: "foo", scope: !42, file: !1, line: 19, type: !10)
!49 = !DILocation(line: 19, column: 7, scope: !42)
!50 = !DILocalVariable(name: "bar", scope: !42, file: !1, line: 20, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !4)
!53 = !DILocation(line: 20, column: 17, scope: !42)
!54 = !DILocation(line: 22, column: 16, scope: !42)
!55 = !DILocation(line: 22, column: 9, scope: !42)
!56 = !DILocation(line: 22, column: 7, scope: !42)
!57 = !DILocation(line: 24, column: 3, scope: !42)
!58 = !DILocation(line: 24, column: 8, scope: !42)
!59 = !DILocation(line: 24, column: 12, scope: !42)
!60 = !DILocation(line: 25, column: 3, scope: !42)
!61 = !DILocation(line: 25, column: 8, scope: !42)
!62 = !DILocation(line: 25, column: 13, scope: !42)
!63 = !DILocation(line: 25, column: 23, scope: !42)
!64 = !DILocation(line: 27, column: 3, scope: !42)
!65 = !DILocation(line: 27, column: 10, scope: !42)
!66 = !DILocation(line: 29, column: 3, scope: !42)
!67 = !DILocation(line: 29, column: 8, scope: !42)
!68 = !DILocation(line: 29, column: 13, scope: !42)
!69 = !DILocation(line: 30, column: 3, scope: !42)
!70 = !DILocation(line: 32, column: 8, scope: !42)
!71 = !DILocation(line: 32, column: 3, scope: !42)
!72 = !DILocation(line: 33, column: 3, scope: !42)
