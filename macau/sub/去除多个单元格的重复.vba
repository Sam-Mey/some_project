Sub 去除重复()

    Dim ws As Worksheet
    Dim 单元格 As Range
    Dim 值 As Variant
    Dim 合并后字符串 As String
    Dim 唯一集合 As collection
    
    ' 设置工作表
    Set ws = ThisWorkbook.Sheets("Sheet1") ' 将"Sheet1"替换为实际的工作表名称
    
    ' 初始化集合
    Set 唯一集合 = New collection
    
    ' 合并所有值为一个字符串
    For Each 单元格 In ws.Range("C12, E12, G12")
        值 = 单元格.value
        If Not IsError(值) Then
            If Not IsEmpty(值) Then
                合并后字符串 = 合并后字符串 & 值 & ","
            End If
        End If
    Next 单元格
    
    ' 将合并后字符串分割为数组
    Dim 值数组 As Variant
    值数组 = Split(Left(合并后字符串, Len(合并后字符串) - 1), ",")
    
    ' 将唯一值添加到集合
    On Error Resume Next
    For Each 值 In 值数组
        唯一集合.Add 值, CStr(值)
    Next 值
    On Error GoTo 0
    
    ' 将唯一值重新合并为字符串
    合并后字符串 = Join(CollectionToArray(唯一集合), ", ")
    
    ' 将唯一值写入O12单元格
    ws.Range("O12").value = 合并后字符串
End Sub

Function CollectionToArray(集合 As collection) As Variant()
    Dim 数组() As Variant
    Dim i As Long
    
    ReDim 数组(1 To 集合.count)
    For i = 1 To 集合.count
        数组(i) = 集合(i)
    Next i
    CollectionToArray = 数组
End Function