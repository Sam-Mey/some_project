' 22 偏移法（未去重）

Sub 生肖判断()

    Dim lastRow As Long
    Dim ws As Worksheet
    Dim UValue As Integer
    Dim Result As String
    Dim i As Long, j As Long
    
    ' 初始化工作表和LastRow
    Set ws = ThisWorkbook.Sheets("Sheet3") ' 将Sheet1替换为你的工作表名称
    lastRow = ws.Cells(ws.Rows.count, "U").End(xlUp).Row
    
    ' 循环处理每一行数据
    For i = 2 To lastRow ' 从第2行开始循环
        If Not IsEmpty(ws.Cells(i, "U")) Then ' 如果U列不为空
            UValue = ws.Cells(i, "U").Value
            Result = ""

            ' 判断条件并生成Result
            If (UValue - 8) <= 22 Then
                Result = Result & GetAnimal((UValue - 8) + 22) & ","
            Else
                Result = Result & GetAnimal((UValue - 8) - 22) & ","
            End If

            If (UValue - 7) <= 22 Then
                Result = Result & GetAnimal((UValue - 7) + 22) & ","
            Else
                Result = Result & GetAnimal((UValue - 7) - 22) & ","
            End If

            If (UValue - 6) <= 22 Then
                Result = Result & GetAnimal((UValue - 6) + 22) & ","
            Else
                Result = Result & GetAnimal((UValue - 6) - 22) & ","
            End If

            If (UValue - 1) <= 22 Then
                Result = Result & GetAnimal((UValue - 1) + 22) & ","
            Else
                Result = Result & GetAnimal((UValue - 1) - 22) & ","
            End If

            If (UValue + 0) <= 22 Then
                Result = Result & GetAnimal((UValue + 0) + 22) & ","
            Else
                Result = Result & GetAnimal((UValue + 0) - 22) & ","
            End If

            If (UValue + 1) <= 22 Then
                Result = Result & GetAnimal((UValue + 1) + 22) & ","
            Else
                Result = Result & GetAnimal((UValue + 1) - 22) & ","
            End If

            If (UValue + 6) <= 22 Then
                Result = Result & GetAnimal((UValue + 6) + 22) & ","
            Else
                Result = Result & GetAnimal((UValue + 6) - 22) & ","
            End If

            If (UValue + 7) <= 22 Then
                Result = Result & GetAnimal((UValue + 7) + 22) & ","
            Else
                Result = Result & GetAnimal((UValue + 7) - 22) & ","
            End If

            If (UValue + 8) <= 22 Then
                Result = Result & GetAnimal((UValue + 8) + 22) & ","
            Else
                Result = Result & GetAnimal((UValue + 8) - 22) & ","
            End If

            If Len(Result) > 0 Then
                Result = Left(Result, Len(Result) - 1)
            End If

            ' 将动物名称写入W列
'            ws.Cells(i, "W").Value = Result
            ws.Cells(i + 1, "W").Value = Result
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
