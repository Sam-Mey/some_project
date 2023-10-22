Sub 删除重复动物()
    Dim rng As Range
    Dim cell As Range
    Dim animals() As String
    Dim uniqueAnimals As Collection
    Dim animal As Variant
    
    ' 设置要处理的工作表和列（假设在第1列）
    Set rng = ThisWorkbook.Sheets("Sheet3").Range("W3:W" & ThisWorkbook.Sheets("Sheet3").Cells(Rows.count, "W").End(xlUp).Row)
    
    ' 初始化一个集合来存储唯一的动物
    Set uniqueAnimals = New Collection
    
    ' 遍历每个单元格
    For Each cell In rng
        If cell.Value <> "" Then
            ' 将动物列表拆分成数组
            animals = Split(cell.Value, ",")
            
            ' 遍历数组中的每个动物
            For Each animal In animals
                ' 将动物添加到集合中（如果尚未存在）
                On Error Resume Next
                uniqueAnimals.Add animal, CStr(animal)
                On Error GoTo 0
            Next animal
            
            ' 重新组合唯一的动物并更新单元格的值
            cell.Value = Join(CollectionToArray(uniqueAnimals), ",")
            
            ' 清空集合以备下次使用
            Set uniqueAnimals = New Collection
        End If
    Next cell
End Sub

Function CollectionToArray(col As Collection) As Variant()
    Dim arr() As Variant
    Dim i As Integer
    
    ReDim arr(1 To col.count)
    
    For i = 1 To col.count
        arr(i) = col.Item(i)
    Next i
    
    CollectionToArray = arr
End Function
