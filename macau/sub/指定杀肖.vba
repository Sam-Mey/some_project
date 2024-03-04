'指定杀肖
Private Sub CommandButton3_Click()
    Dim i As Integer
    Dim checkBoxes() As Variant
    Dim columns() As Variant
    Dim ws As Worksheet
    Dim rng As Range
    
    ' 获取当前工作表
    Set ws = ThisWorkbook.Sheets("Sheet1") ' 将 "Sheet1" 替换为你实际的工作表名称
    
    ' 将复选框和对应的列号放入数组中
    checkBoxes = Array(CheckBox1, CheckBox2, CheckBox3, CheckBox4, CheckBox5, CheckBox6, CheckBox7, CheckBox8, CheckBox9, CheckBox10, CheckBox11, CheckBox12)
    columns = Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L") ' 列的字母
    
    For i = LBound(checkBoxes) To UBound(checkBoxes)
        If checkBoxes(i).value = True Then
            Set rng = ws.columns(columns(i))
            rng.UnMerge ' 取消合并单元格
            rng.Rows("13:18").ClearContents ' 清空指定行范围的内容，起始单元格默认 "13:18"
        End If
    Next i
End Sub