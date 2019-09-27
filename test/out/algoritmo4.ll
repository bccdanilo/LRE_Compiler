; ModuleID = 'algoritmo4.txt'
source_filename = "algoritmo4.txt"

define i16 @main() {
entry:
  call void @init()
  br label %while_cond

while_cond:                                       ; preds = %while_body, %entry
  %cmpi = icmp sgt i16 1, 0
  br i1 %cmpi, label %while_body, label %while_end

while_body:                                       ; preds = %while_cond
  call void @analogWrite(i8 8, i16 0)
  call void @analogWrite(i8 9, i16 0)
  call void @analogWrite(i8 7, i16 0)
  %conv = sext i16 1000 to i32
  call void @delay(i32 %conv)
  call void @analogWrite(i8 8, i16 255)
  call void @analogWrite(i8 9, i16 255)
  call void @analogWrite(i8 7, i16 255)
  %conv1 = sext i16 1000 to i32
  call void @delay(i32 %conv1)
  br label %while_cond

while_end:                                        ; preds = %while_cond
  ret i16 0
}

declare i16 @analogRead(i8)

declare void @analogWrite(i8, i16)

declare void @delay(i32)

declare void @delayMicroseconds(i32)

declare void @init()

declare void @print(i8, i8*)
