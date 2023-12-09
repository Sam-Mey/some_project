Sub 写入数据()
    Dim FilePath As Variant
    Dim FileContent As String
    Dim stream As Object
    Dim Lines() As String
    Dim i As Integer
    Dim Period As String
    Dim Numbers() As String
    Dim RowOffset As Integer
    
    ' 打开文件对话框，选择要打开的文件
    FilePath = Application.GetOpenFilename(FileFilter:="Text Files (*.txt), *.txt")
    
    ' 检查用户是否选择了文件
    If FilePath <> False Then
        ' 创建Stream对象
        Set stream = CreateObject("ADODB.Stream")
        
        ' 设置Stream对象
        stream.Charset = "utf-8"
        stream.Open
        stream.LoadFromFile FilePath
        
        ' 读取文件内容
        FileContent = stream.ReadText(-1)
        
        ' 关闭Stream对象
        stream.Close
        
        ' 将文件内容按行分割
        Lines = Split(FileContent, vbCrLf)
        
        ' 循环处理每一期的数据
        For i = LBound(Lines) To UBound(Lines)
            Debug.Print "Processing Line: " & Lines(i)  ' 添加调试
            If InStr(Lines(i), "第") > 0 Then
                Period = Split(Split(Lines(i), "：")(0), "第")(1)  ' 注意“中英文”下的标点符号
                Numbers = Split(Split(Lines(i), "：")(1), ",")     ' 注意“中英文”下的标点符号
                
                ' 将期数写入对应的单元格
                Range("A2").Offset(RowOffset, 0).Value = "第" & Period
                Range("B2").Offset(RowOffset, 0).Value = Numbers(0)
                Range("D2").Offset(RowOffset, 0).Value = Numbers(1)
                Range("F2").Offset(RowOffset, 0).Value = Numbers(2)
                Range("H2").Offset(RowOffset, 0).Value = Numbers(3)
                Range("J2").Offset(RowOffset, 0).Value = Numbers(4)
                Range("L2").Offset(RowOffset, 0).Value = Numbers(5)
                Range("N2").Offset(RowOffset, 0).Value = Numbers(6)
                
                RowOffset = RowOffset + 1
            End If
        Next i
    End If
End Sub
