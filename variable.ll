; ModuleID = 'variable.c'
source_filename = "variable.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"Hello\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"Hii\0A\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"Hiii\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  call void @klee_make_symbolic(ptr noundef %1, i64 noundef 4, ptr noundef @.str)
  %2 = load i32, ptr %1, align 4
  %3 = icmp slt i32 %2, 40
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %8

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %8

8:                                                ; preds = %7, %5
  ret i32 0
}

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 16.0.6 (23ubuntu4)"}
