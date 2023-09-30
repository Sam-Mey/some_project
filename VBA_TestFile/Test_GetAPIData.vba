' 使用 WinHttpReq 对象

Sub SetProxyTestGetData()
    Dim WinHttpReq As Object
    
    ' 创建 WinHTTP 对象
    Set WinHttpReq = CreateObject("WinHttp.WinHttpRequest.5.1")
    
    ' 设置代理
    WinHttpReq.SetProxy 2, "127.0.0.1:7890" ' 这里替换为你的代理地址和端口
    
    ' 设置 URL
    Dim url As String
    url = "" ' 这里替换为你的 URL 地址
    
    ' 发送 GET 请求
    WinHttpReq.Open "GET", url, False
    WinHttpReq.setRequestHeader "Content-Type", "application/json"
    WinHttpReq.send
    
    ' 检查响应状态
    If WinHttpReq.Status = 200 Then
        ' 获取响应文本
        Dim responseText As String
        responseText = WinHttpReq.responseText
        
        ' 在这里处理获取到的数据
        Debug.Print responseText
    Else
        MsgBox "获取数据失败。"
    End If
    
    ' 释放对象
    Set WinHttpReq = Nothing
End Sub

