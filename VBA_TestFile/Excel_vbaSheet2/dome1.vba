' 代码片段B
Private Sub CommandButton17_Click()

    Dim w0 As Long
    Dim w1 As Long
    Dim w2 As Long
    Dim w3 As Long
    Dim w4 As Long
    Dim w5 As Long
    Dim w6 As Long
    Dim w7 As Long
    Dim w8 As Long
    Dim w9 As Long

    Dim currentRowB As Long ' 修改点1：变量名改成 currentRowB
    Dim currentRowAD As Long
    
    Dim rngB As Range ' 修改点2：变量名改成 rngB
    Dim cellB As Range ' 修改点3：变量名改成 cellB
    
    ' 初始化变量
    w0 = 4567890
    w1 = 5678901
    w2 = 6789012
    w3 = 7890123
    w4 = 8901234
    w5 = 9012345
    w6 = 1234560
    w7 = 1234567
    w8 = 2345678
    w9 = 3456789
    
    ' 设置检查的范围为B列的所有单元格
    Set rngB = Range("B2:B" & Range("B" & Rows.count).End(xlUp).row) ' 检查的范围改成B列
    
    ' 从B3开始，每逢特定行数执行循环
    For Each cellB In rngB ' For Each 循环的范围改成 rngB
        Dim rowNum As Long
        rowNum = cellB.row
        
        
        If (rowNum Mod 12 = 8 Or rowNum Mod 12 = 8) And (cellB.Column = 2 Or cellB.Column = 12) Then ' 定位到指定单元格
        
            currentRowB = rowNum ' 变量名改成 currentRowB
            currentRowAD = currentRowB + 1 ' 对应的AD列单元格的行数改成 currentRowB + 1
            
            ' 提取B列对应单元格的数字，加上 1，取结果的最后一位数，并将结果写入AD列指定单元格
            Range("AD" & currentRowAD).value = Right(cellB.value + 1, 1) ' 将 cellB.Value 用于提取 B 列的数据
            
            ' 根据提取的数字选择对应的变量值写入AD列指定单元格
            Select Case Range("AD" & currentRowAD).value
                Case 0: Range("AD" & currentRowAD).value = w0
                Case 1: Range("AD" & currentRowAD).value = w1
                Case 2: Range("AD" & currentRowAD).value = w2
                Case 3: Range("AD" & currentRowAD).value = w3
                Case 4: Range("AD" & currentRowAD).value = w4
                Case 5: Range("AD" & currentRowAD).value = w5
                Case 6: Range("AD" & currentRowAD).value = w6
                Case 7: Range("AD" & currentRowAD).value = w7
                Case 8: Range("AD" & currentRowAD).value = w8
                Case 9: Range("AD" & currentRowAD).value = w9
            End Select
        End If
    Next cellB ' For Each 循环的范围改成 rngB

End Sub
