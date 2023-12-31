
'####################################################################################生肖属性############################################################################################
'####################################################################################生肖属性############################################################################################
'####                                                                                                                                                                               ####
'####                                                                                                                                                                               ####
Sub 年份生肖()
    ' 初始化指定单元格
    Range("A1:L7").ClearContents
    Range("A1:L7").Interior.Color = RGB(0, 0, 255) '可修改颜色默认值
    
    ' 设置公历日期格式
    Dim gongLiDate
    gongLiDate = Format(Date, "yyyy年mm月dd日") & "，" & WeekdayName(Weekday(Date), True, vbSunday) & "，" & "猪" & " " & "年"
    Debug.Print gongLiDate ' 调试
    
    ' 设置农历年
    Dim nongLiYear As String
    ' 这里你可以添加获取农历年的代码
    
    ' 将公历日期和农历年输出到A1和A2单元格
    Range("A1").Value = gongLiDate
    ' Range("A2").Value = nongLiYear
    
    ' 声明一个数组并储存
    Dim shiErShengXiao(1 To 12) As String
    shiErShengXiao(1) = "鼠"
    shiErShengXiao(2) = "牛"
    shiErShengXiao(3) = "虎"
    shiErShengXiao(4) = "兔"
    shiErShengXiao(5) = "龙"
    shiErShengXiao(6) = "蛇"
    shiErShengXiao(7) = "马"
    shiErShengXiao(8) = "羊"
    shiErShengXiao(9) = "猴"
    shiErShengXiao(10) = "鸡"
    shiErShengXiao(11) = "狗"
    shiErShengXiao(12) = "猪"
    
    ' 定义一个偏移量变量
    Dim offsetValue As Integer
    offsetValue = 0
    
    ' 循环将数组中的元素填写到单元格中
    For i = 1 To UBound(shiErShengXiao)
        Range("A2").Offset(0, offsetValue).Value = shiErShengXiao(i)
        offsetValue = offsetValue + 1
    Next i
'End Sub
'=====================================================写入年份对应的生肖=========================================================
'*********************************************************************************************************************************
'*********************************************************************************************************************************
'*********************************************************************************************************************************
'=====================================================写入生肖对应的数字=========================================================
' Sub 生肖属性
    ' 获取A1填写值中的第16个字符
    Dim compareChar As String
    compareChar = Mid(Range("A1").Value, 16, 1)

    ' 声明一个变量用于记录是否找到相等的列
    Dim foundMatch As Boolean
    foundMatch = True

    ' 循环遍历1-12列2行
    For i = 1 To 12
        ' 检查当前填写值与比较字符是否相等
        If Range(Cells(2, i), Cells(2, i)).Value = compareChar Then
            ' 如果找到相等的列
            foundMatch = True
'            Debug.Print i ' 调试信息
            
            ' 从本列的第3行开始向左递增填写值
            Dim currentColumn As Integer
            currentColumn = i
            Dim currentRow As Integer
            currentRow = 3
            Dim currentValue As Integer
            currentValue = 1
            
            Do While currentValue <= 49
                Debug.Print currentColumn & currentRow ' 调试信息

                Cells(currentRow, currentColumn).Value = currentValue
                
'                ' 如果当前单元格是年份生肖的下一列，执行换行
                If currentColumn = i + 1 Then
                    currentRow = currentRow + 1
                End If
                
                ' 如果当前单元格是 i - 11 时，执行换行
                If currentColumn = i - 11 Then
                    currentRow = currentRow + 1
                End If

               currentValue = currentValue + 1

                ' 判断是否需要跳到下一行和下一列
                If currentValue <= 49 Then
                    If currentColumn = 1 Then
                        currentColumn = 12
                    Else
                        currentColumn = currentColumn - 1
                    End If
                End If
            Loop


            Exit For
        End If
    Next i

    ' 如果没有找到相等的列
    If Not foundMatch Then
        MsgBox "没有找到与A1中的第16个字符相等的列"
    End If
'End Sub
'$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$生肖属性（波色）$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
'$                                                                                                                                  $
'$                                                                                                                                  $
'$                                                                                                                                  $
'$                                                                                                                                  $
'3色条件格式 (生肖属性表的条件格式波色)
'Sub 填充波色()

        ' 选择A1:A2并填充橙红色
    Range("A1").Interior.Color = RGB(255, 69, 0) ' 橙红色的 RGB 值

    ' 选择B1:B12并填充紫红色
    Range("A2:L7").Interior.Color = RGB(148, 0, 211) ' 紫红色的 RGB 值

    Dim lastRow As Long
    Dim rng As Range
    Dim cell As Range

    lastRow = Range("A" & Rows.count).End(xlUp).Row '获取最后一行

    Set rng = Range("A3:L7") '设置范围

    For Each cell In rng
        If InStr(1, ",1,2,7,8,12,13,18,19,23,24,29,30,34,35,40,45,46,", "," & cell.Value & ",") > 0 Then '如果包含红色数字
            cell.Interior.Color = RGB(255, 0, 0) '填充红色
        ElseIf InStr(1, ",3,4,9,10,14,15,20,25,26,31,36,37,41,42,47,48,", "," & cell.Value & ",") > 0 Then '如果包含蓝色数字
            cell.Interior.Color = RGB(0, 0, 255) '填充蓝色
        ElseIf InStr(1, ",5,6,11,16,17,21,22,27,28,32,33,38,39,43,44,49,", "," & cell.Value & ",") > 0 Then '如果包含绿色数字
            cell.Interior.Color = RGB(0, 255, 0) '填充绿色
        End If
    Next cell
'End Sub
'$                                                                                                                                  $
'$                                                                                                                                  $
'$                                                                                                                                  $
'$                                                                                                                                  $
'$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    
End Sub
'=====================================================写入生肖对应的数字=========================================================


'####                                                                                                                                                                               ####
'####                                                                                                                                                                               ####
'####################################################################################生肖属性############################################################################################
'####################################################################################生肖属性############################################################################################