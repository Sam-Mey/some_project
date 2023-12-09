' 数据处理

Sub 处理数据格式()

        ' +++++++++++++++++++++++++++++++++++++++++++
        ' +										    +
        ' +	  		拼接获取网页数据API		  	     +
        ' +										    +
        ' +++++++++++++++++++++++++++++++++++++++++++

        ' 在这里处理获取到的数据
        Debug.Print responseText

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
        expect = "第 " & Replace(Replace(expect, """", ""), ":", "") & " 期" '注意“中文字”前后的“空格”格式与“本地导入”格式保持一致

        ' 获取 Worksheet
        Dim ws As Worksheet
        Set ws = ThisWorkbook.Sheets("Sheet1") ' 将 "Sheet1" 替换为你的工作表名称

        ' 获取最后一行
        Dim lastRow As Long
        lastRow = ws.Cells(ws.Rows.count, "A").End(xlUp).Row + 1
        
    ' 检查是否存在相同的 expect
    Dim i As Long
    Dim found As Boolean
    found = False
    
    For i = lastRow To 1 Step -1
        If ws.Cells(i, 1).Value = expect Then
            found = True
            Exit For
        End If
    Next i
    
    ' 如果不存在相同的 expect，则写入结果
    If Not found Then
        ws.Cells(lastRow, 1).Value = expect
        ws.Cells(lastRow, 2).Value = Split(opencode, ",")(0)
        ws.Cells(lastRow, 4).Value = Split(opencode, ",")(1)
        ws.Cells(lastRow, 6).Value = Split(opencode, ",")(2)
        ws.Cells(lastRow, 8).Value = Split(opencode, ",")(3)
        ws.Cells(lastRow, 10).Value = Split(opencode, ",")(4)
        ws.Cells(lastRow, 12).Value = Split(opencode, ",")(5)
        ws.Cells(lastRow, 14).Value = Split(opencode, ",")(6)
    End If
    Else
        MsgBox "获取数据失败。"
    End If

    ' 释放对象
    Set WinHttpReq = Nothing
End Sub
