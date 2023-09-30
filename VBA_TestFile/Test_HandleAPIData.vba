
Sub TestAPIData()
        '|====================|
        '|                    |
        '| 这里拼接 API 接口   |
        '|                    |
        '| ===================|

        ' 以下是处理 API 数据逻辑 
        '        
        ' 提取 opencode
        Dim startPos As Long
        Dim endPos As Long
        startPos = InStr(responseText, """openCode"":""") + Len("""openCode"":""")
        endPos = InStr(startPos, responseText, """")
        Dim opencode As String
        opencode = Mid(responseText, startPos, endPos - startPos)

        ' 分割 opencode
        Dim opencodeArray() As String
        opencodeArray = Split(opencode, ",")

        ' 获取 Worksheet
        Dim ws As Worksheet
        Set ws = ThisWorkbook.Sheets("Sheet2") ' 将 "Sheet1" 替换为你的工作表名称

        ' 获取最后一行
        Dim lastRow As Long
        lastRow = ws.Cells(ws.Rows.count, "B").End(xlUp).row + 1

        ' 将 opencode 填入指定单元格
        Dim columnsToFill As String
        columnsToFill = "B,D,F,H,J,L,N"

        Dim colArray() As String
        colArray = Split(columnsToFill, ",")

        Dim i As Integer
        Dim alreadyExists As Boolean
        alreadyExists = False
        
        ' 检查是否已存在相同数据
        For i = 0 To UBound(colArray)
            If i <= UBound(opencodeArray) Then
                If ws.Cells(lastRow - 1, colArray(i)).Value = opencodeArray(i) Then
                    alreadyExists = True
                    Exit For
                End If
            End If
        Next i

        ' 如果不存在相同数据，则写入
        If Not alreadyExists Then
            For i = 0 To UBound(colArray)
                If i <= UBound(opencodeArray) Then
                    ws.Cells(lastRow, colArray(i)).Value = opencodeArray(i)
                End If
            Next i
        End If

    Else
        MsgBox "获取数据失败。"
    End If

End Sub

