
Sub TestAPIData()
        '|========================|
        '|                        |
        '| 这里拼接 API 数据请求  |
        '|                        |
        '| =======================|

        ' 以下是处理 API 数据逻辑 
        '        
        ' 提取 expect 和 opencode
        Dim startPosExpect As Long
        Dim endPosExpect As Long
        Dim startPosOpenCode As Long
        Dim endPosOpenCode As Long
        
        ' 提取 expect 的起始位置和结束位置
        startPosExpect = InStr(responseText, """expect"":""") + Len("""expect"":""")
        endPosExpect = InStr(startPosExpect, responseText, """") - 1

        ' 提取 openCode 的起始位置和结束位置
        startPosOpenCode = InStr(responseText, """openCode"":""") + Len("""openCode"":""")
        endPosOpenCode = InStr(startPosOpenCode, responseText, """")

        ' 定义变量用于存储 expect 和 opencode
        Dim expect As String
        Dim opencode As String
        
        ' 获取 expect 的值
        expect = Mid(responseText, startPosExpect, endPosExpect - startPosExpect + 1)
        
        ' 获取 opencode 的值
        opencode = Mid(responseText, startPosOpenCode, endPosOpenCode - startPosOpenCode)

        ' 修改 expect 格式
        expect = "第" & Replace(Replace(expect, """", ""), ":", "") & "期"

        ' 获取 Worksheet
        Dim ws As Worksheet
        Set ws = ThisWorkbook.Sheets("Sheet1") ' 将 "Sheet1" 替换为你的工作表名称

        ' 获取最后一行
        Dim LastRow As Long
        LastRow = ws.Cells(ws.Rows.count, "A").End(xlUp).row + 1

        ' 检查是否存在相同的 expect
        Dim i As Long
        Dim found As Boolean
        found = False
    
        For i = LastRow To 1 Step -1
            If ws.Cells(i, 1).Value = expect Then
                found = True
                Exit For
            End If
        Next i

        ' 如果不存在相同的 expect，则写入结果
        If Not found Then
            ws.Cells(LastRow, 1).Value = expect                     ' 1 代表 "A" 列
            ws.Cells(LastRow, 2).Value = Split(opencode, ",")(0)    ' 2 代表 "B" 列
            ws.Cells(LastRow, 3).Value = Split(opencode, ",")(1)    ' 3 代表 "C" 列
            ws.Cells(LastRow, 4).Value = Split(opencode, ",")(2)    ' 4 代表 "D" 列
            ws.Cells(LastRow, 5).Value = Split(opencode, ",")(3)    ' 5 代表 "E" 列
            ws.Cells(LastRow, 6).Value = Split(opencode, ",")(4)    ' 6 代表 "F" 列
            ws.Cells(LastRow, 7).Value = Split(opencode, ",")(5)    ' 7 代表 "G" 列
            ws.Cells(LastRow, 8).Value = Split(opencode, ",")(6)    ' 8 代表 "H" 列
        End If

    Else
        MsgBox "获取数据失败。"
    End If

    ' 释放对象
    Set WinHttpReq = Nothing
End Sub

