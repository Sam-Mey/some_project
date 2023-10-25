Function GetAnimalName(number As Integer) As String
    Select Case number
        Case 1, 13, 25, 37, 49
            GetAnimalName = "兔"
        Case 2, 14, 26, 38
            GetAnimalName = "虎"
        Case 3, 15, 27, 39
            GetAnimalName = "牛"
        Case 4, 16, 28, 40
            GetAnimalName = "鼠"
        Case 5, 17, 29, 41
            GetAnimalName = "猪"
        Case 6, 18, 30, 42
            GetAnimalName = "狗"
        Case 7, 19, 31, 43
            GetAnimalName = "鸡"
        Case 8, 20, 32, 44
            GetAnimalName = "猴"
        Case 9, 21, 33, 45
            GetAnimalName = "羊"
        Case 10, 22, 34, 46
            GetAnimalName = "马"
        Case 11, 23, 35, 47
            GetAnimalName = "蛇"
        Case 12, 24, 36, 48
            GetAnimalName = "龙"
        Case Else
            GetAnimalName = "无效的数字"
    End Select
End Function


' 代码片段H
Private Sub CommandButton17_Click()

    Dim currentRowH As Long ' 变量名改成 currentRowH
    Dim currentRowAD As Long
    
    Dim rngH As Range ' 变量名改成 rngH
    Dim cellH As Range ' 变量名改成 cellH
    


    
    ' 设置检查的范围为D列的所有单元格
    Set rngH = Range("H2:H" & Range("H" & Rows.Count).End(xlUp).Row) ' 检查的范围改成 H 列
    
    ' 从 H2 开始，每逢特定行数执行循环
    For Each cellH In rngH ' For Each 循环的范围改成 rngH
        Dim rowNum As Long
        rowNum = cellH.Row
        
        
        If (rowNum Mod 12 = 11 Or rowNum Mod 12 = 5) And (cellH.Column = 8 Or cellH.Column = 18) Then ' 定位到指定单元格
        
            currentRowH = rowNum ' 变量名改成 currentRowH
            currentRowAD = currentRowH + 1 ' 对应的 AD 列单元格的行数改成 currentRowH + 1
            
            Dim extractedValue As Long
            extractedValue = cellH.Value + 1
            ' 提取 H 列对应单元格的数字，加上 1，如果大于等于50 将提取到的 H 列对应单元格的数字加上 1减去12；否则直接提取到的B列对应单元格的数字加上 1；并将结果写入AD列指定单元格
            If extractedValue > = 50 Then
                extractedValue = extractedValue - 12
            End If

            Range("AD" & currentRowAD).Value = extractedValue ' 将 cellH.Value 用于提取 H 列的数据
            
            ' 根据提取的数字选择对应的变量值写入AD列指定单元格
            Select Case Range("AD" & currentRowAD).Value
                Case 1, 13, 25, 37, 49 
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value)
                Case 2, 14, 26, 38 
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value) 
                Case 3, 15, 27, 39 
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value) 
                Case 4, 16, 28, 40
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value) 
                Case 5, 17, 29, 41 
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value) 
                Case 6, 18, 30, 42 
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value) 
                Case 7, 19, 31, 43 
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value) 
                Case 8, 20, 32, 44 
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value)
                Case 9, 21, 33, 45 
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value) 
                Case 10, 22, 34, 46 
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value) 
                Case 11, 23, 35, 47
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value) 
                Case 12, 24, 36, 48 
                    Range("AD" & currentRowAD).Value = GetAnimalName(Range("AD" & currentRowAD).Value) 
                Case Else
                    ' 处理其他情况
            End Select
        End If
    Next cellH ' For Each 循环的范围改成 rngH

End Sub
