' 22 偏移法

Sub 生肖计算()

    Dim ws As Worksheet
    Set ws = ThisWorkbook.Sheets("Sheet3") ' 将 "Sheet1" 替换为你实际使用的工作表名

    Dim LastRow As Long
    LastRow = ws.Cells(ws.Rows.count, "U").End(xlUp).Row

    Dim UValue As Integer
    Dim Result As String
    Dim i As Long

    For i = 2 To LastRow ' 从第2行开始循环
        If Not IsEmpty(ws.Cells(i, "U")) Then ' 如果U列不为空
            UValue = ws.Cells(i, "U").Value
            Result = ""

            ' 判断条件并生成Result
            If (UValue - 8) <= 22 Then
                Result = Result & CStr((UValue - 8) + 22) & ","
            Else
                Result = Result & CStr((UValue - 8) - 22) & ","
            End If

            If (UValue - 7) <= 22 Then
                Result = Result & CStr((UValue - 7) + 22) & ","
            Else
                Result = Result & CStr((UValue - 7) - 22) & ","
            End If

            If (UValue - 6) <= 22 Then
                Result = Result & CStr((UValue - 6) + 22) & ","
            Else
                Result = Result & CStr((UValue - 6) - 22) & ","
            End If

            If (UValue - 1) <= 22 Then
                Result = Result & CStr((UValue - 1) + 22) & ","
            Else
                Result = Result & CStr((UValue - 1) - 22) & ","
            End If

            If (UValue + 0) <= 22 Then
                Result = Result & CStr((UValue + 0) + 22) & ","
            Else
                Result = Result & CStr((UValue + 0) - 22) & ","
            End If

            If (UValue + 1) <= 22 Then
                Result = Result & CStr((UValue + 1) + 22) & ","
            Else
                Result = Result & CStr((UValue + 1) - 22) & ","
            End If

            If (UValue + 6) <= 22 Then
                Result = Result & CStr((UValue + 6) + 22) & ","
            Else
                Result = Result & CStr((UValue + 6) - 22) & ","
            End If

            If (UValue + 7) <= 22 Then
                Result = Result & CStr((UValue + 7) + 22) & ","
            Else
                Result = Result & CStr((UValue + 7) - 22) & ","
            End If

            If (UValue + 8) <= 22 Then
                Result = Result & CStr((UValue + 8) + 22) & ","
            Else
                Result = Result & CStr((UValue + 8) - 22) & ","
            End If

            If Len(Result) > 0 Then
                Result = Left(Result, Len(Result) - 1)
            End If

            ' 根据生成的Result匹配动物
            Dim Animals() As String
            Animals = Split(Result, ",") ' 将Result按逗号拆分成动物列表

            Dim Animal As String
            Dim FinalResult As String
            Dim j As Integer

            For j = LBound(Animals) To UBound(Animals)
                Animal = GetAnimal(CInt(Animals(j))) ' 获取对应的动物
                If InStr(FinalResult, Animal) = 0 Then ' 检查动物是否已经在FinalResult中
                    FinalResult = FinalResult & Animal & "," ' 如果不在则添加
                End If
            Next j

            If Len(FinalResult) > 0 Then
                FinalResult = Left(FinalResult, Len(FinalResult) - 1) ' 去掉最后的逗号
            End If

            ws.Cells(i, "W").Value = FinalResult ' 将最终结果写入对应的W列
        End If
    Next i
End Sub

Function GetAnimal(Number As Integer) As String
    ' 根据数字获取对应的动物名称
    Select Case Number
        Case 4, 16, 28, 40: GetAnimal = "鼠"
        Case 3, 15, 27, 39: GetAnimal = "牛"
        Case 2, 14, 26, 38: GetAnimal = "虎"
        Case 1, 13, 25, 37, 49: GetAnimal = "兔"
        Case 12, 24, 36, 48: GetAnimal = "龙"
        Case 11, 23, 35, 47: GetAnimal = "蛇"
        Case 10, 22, 34, 46: GetAnimal = "马"
        Case 9, 21, 33, 45: GetAnimal = "羊"
        Case 8, 20, 32, 44: GetAnimal = "猴"
        Case 7, 19, 31, 43: GetAnimal = "鸡"
        Case 6, 18, 30, 42: GetAnimal = "狗"
        Case 5, 17, 29, 41: GetAnimal = "猪"
    End Select
End Function
