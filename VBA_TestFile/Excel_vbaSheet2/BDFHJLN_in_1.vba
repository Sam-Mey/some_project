'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================
'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================
'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================
'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================
'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================
'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================

'########################################################################################################################################################################################################################
'########################################################################################################################################################################################################################
'########################################################################################################################################################################################################################
'#####                                                                                                                                                                                                              #####
'#####                                                                                                                                                                                                              #####
'#####                                                                                                                                                                                                              #####
'
                    '=================================================================================平特一肖（预测方法）===========================================================================|
                    '|                                                                                                                                                                               |
                    '|                                                                                                                                                                               |
                    '|                                  '******************************************平特一肖+1规律（规律说明）***************************************                                 |
                    '|                                  '***********************************************************************************************************                                 |
                    '|                                  '**                                                                                                       **                                 |
                    '|                                  '**                             2023年开奖记录，取（正4，正3，正2）本肖+1                                 **                                 |
                    '|                                  '**                                                                                                       **                                 |
                    '|                                  '**                                                                                                       **                                 |
                    '|                                  '**                                                                                                       **                                 |
                    '|                                  '**                             154期35-47-01-【25】-08-32-T03  25+01=虎                                  **                                 |
                    '|                                  '**                             155期38-36-【42】-40-23-21-T07  42+01=鸡                                  **                                 |
                    '|                                  '**                             156期04-【22】-37-01-25-46-T43  22+01=蛇                                  **                                 |
                    '|                                  '**                             157期48-03-33-【49】-35-46-T44  49+01=虎                                  **                                 |
                    '|                                  '**                             158期29-38-【49】-48-18-10-T04  49+01=虎                                  **                                 |
                    '|                                  '**                             159期31-【08】-01-20-38-45-T14  08+01=羊                                  **                                 |
                    '|                                  '**                             160期22-45-01-【03】-24-17-T42  03+01=鼠                                  **                                 |
                    '|                                  '**                             161期平特鼠肖再次爆中吗                                                   **                                 |
                    '|                                  '**                                                                                                       **                                 |
                    '|                                  '**                                                                                                       **                                 |
                    '|                                  '**                                                                                                       **                                 |
                    '|                                  '***********************************************************************************************************                                 |
                    '|                                  '***********************************************************************************************************                                 |
                    '=================================================================================平特一肖（预测方法）===========================================================================|

'*********************************************平特一肖+1规律（计算）*************************************************
'********************************************************************************************************************
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
Function GetAnimalName(number As Integer) As String
    Select Case number
        Case 1, 13, 25, 37, 49
            GetAnimalName = "兔"
        Case 2, 14, 26, 38
            GetAnimalName = "虎"
        Case 3, 15, 27, 39
            GetAnimalName = "牛"
        Case 4, 16, 28, 40
            GetAnimalName = "鼠"
        Case 5, 17, 29, 41
            GetAnimalName = "猪"
        Case 6, 18, 30, 42
            GetAnimalName = "狗"
        Case 7, 19, 31, 43
            GetAnimalName = "鸡"
        Case 8, 20, 32, 44
            GetAnimalName = "猴"
        Case 9, 21, 33, 45
            GetAnimalName = "羊"
        Case 10, 22, 34, 46
            GetAnimalName = "马"
        Case 11, 23, 35, 47
            GetAnimalName = "蛇"
        Case 12, 24, 36, 48
            GetAnimalName = "龙"
        Case Else
            GetAnimalName = "无效的数字"
    End Select
End Function

Private Sub CommandButton17_Click()
    Dim currentRow As Long
    Dim rng As Range
    Dim cell As Range

    ' 遍历每一列
    For Each col In Array("B", "D", "F", "H", "J", "L", "N")
        Set rng = Range(col & "2:" & col & Range(col & Rows.count).End(xlUp).row)

        ' 遍历列中的每一个单元格
        For Each cell In rng
            Dim rowNum As Long
            rowNum = cell.row

            Select Case col
                Case "B"
                    If (rowNum Mod 12 = 8 Or rowNum Mod 12 = 8) And (cell.Column = 2 Or cell.Column = 12) Then
                        currentRow = rowNum
                    End If
                Case "D"
                    If (rowNum Mod 12 = 9 Or rowNum Mod 12 = 7) And (cell.Column = 4 Or cell.Column = 14) Then
                        currentRow = rowNum
                    End If
                Case "F"
                    If (rowNum Mod 12 = 10 Or rowNum Mod 12 = 6) And (cell.Column = 6 Or cell.Column = 16) Then
                        currentRow = rowNum
                    End If
                Case "H"
                    If (rowNum Mod 12 = 11 Or rowNum Mod 12 = 5) And (cell.Column = 8 Or cell.Column = 18) Then
                        currentRow = rowNum
                    End If
                Case "J"
                    If (rowNum Mod 12 = 0 Or rowNum Mod 12 = 4) And (cell.Column = 10 Or cell.Column = 20) Then
                        currentRow = rowNum
                    End If
                Case "L"
                    If (rowNum Mod 12 = 1 Or rowNum Mod 12 = 3) And (cell.Column = 12 Or cell.Column = 22) Then
                        currentRow = rowNum
                    End If
                Case "N"
                    If (rowNum Mod 12 = 2 Or rowNum Mod 12 = 2) And (cell.Column = 14 Or cell.Column = 24) Then
                        currentRow = rowNum
                    End If
            End Select

            If currentRow > 0 Then ' 添加这个条件以保证currentRow有效
                Dim extractedValue As Long
                extractedValue = cell.value + 1

                ' 处理提取值超过50的情况
                If extractedValue >= 50 Then
                    extractedValue = extractedValue - 12
                End If

                ' 将提取值写入AD列对应单元格
                Range("AD" & currentRow + 1).value = extractedValue

                ' 根据提取的数字选择对应的变量值写入AD列指定单元格
                Range("AD" & currentRow + 1).value = GetAnimalName(Range("AD" & currentRow + 1).value)

                ' 重置 currentRow 以便下一次迭代
                currentRow = 0
            End If
        Next cell ' For Each 循环的范围改成 rng
    Next col
End Sub
' _________________清空_____________________
'|                                         |
Private Sub CommandButton28_Click()
     Range("AD3:AD366").ClearContents
End Sub
' |________________________________________|

'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'********************************************************************************************************************
'********************************************************************************************************************



'*********************************************平特一肖+2规律（查看方法）*********************************************
'********************************************************************************************************************
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
Private Sub CommandButton18_Click()

    Dim rngB As Range
    Dim rngD As Range
    Dim rngF As Range
    Dim rngH As Range
    Dim rngJ As Range
    Dim rngL As Range
    Dim rngN As Range
    
    Dim cellB As Range
    Dim cellD As Range
    Dim cellF As Range
    Dim cellH As Range
    Dim cellJ As Range
    Dim cellL As Range
    Dim cellN As Range
    Dim rowNum As Integer
    
    ' 设置要填充红色的单元格范围，分别为B列、D列、F列、H列、J列、L列、N列
    Set rngB = Range("B2:B366")
    Set rngD = Range("D2:D366")
    Set rngF = Range("F2:F366")
    Set rngH = Range("H2:H366")
    Set rngJ = Range("J2:I366")
    Set rngL = Range("L2:L366")
    Set rngN = Range("N2:N366")
    
    
    ' 遍历B列中的每个非空单元格
    For Each cellB In rngB
        If Not IsEmpty(cellB) Then
            ' 获取单元格所在行的行号
            rowNum = cellB.row

            ' 检查行号是否在指定的行号列表中，并且列号为4或14
            If (rowNum Mod 12 = 8 Or rowNum Mod 12 = 8) And (cellB.Column = 2 Or cellB.Column = 12) Then
                ' 填充自定义
                cellB.Interior.Color = RGB(255, 128, 0)
            End If
        End If
    Next cellB
    

    ' 遍历D列中的每个非空单元格
    For Each cellD In rngD
        If Not IsEmpty(cellD) Then
            ' 获取单元格所在行的行号
            rowNum = cellD.row

            ' 检查行号是否在指定的行号列表中，并且列号为4或14
            If (rowNum Mod 12 = 9 Or rowNum Mod 12 = 7) And (cellD.Column = 4 Or cellD.Column = 14) Then
                ' 填充自定义
                cellD.Interior.Color = RGB(255, 128, 0)
            End If
        End If
    Next cellD


    ' 遍历F列中的每个非空单元格
    For Each cellF In rngF
        If Not IsEmpty(cellF) Then
            ' 获取单元格所在行的行号
            rowNum = cellF.row

            ' 检查行号是否在指定的行号列表中，并且列号为6或16
            If (rowNum Mod 12 = 10 Or rowNum Mod 12 = 6) And (cellF.Column = 6 Or cellF.Column = 16) Then
                ' 填充自定义
                cellF.Interior.Color = RGB(255, 128, 0)
            End If
        End If
    Next cellF

    ' 遍历H列中的每个非空单元格
    For Each cellH In rngH
        If Not IsEmpty(cellH) Then
            ' 获取单元格所在行的行号
            rowNum = cellH.row

            ' 检查行号是否在指定的行号列表中，并且列号为8或18
            If (rowNum Mod 12 = 11 Or rowNum Mod 12 = 5) And (cellH.Column = 8 Or cellH.Column = 18) Then
                ' 填充自定义
                cellH.Interior.Color = RGB(255, 128, 0)
            End If
        End If
    Next cellH

        ' 遍历J列中的每个非空单元格
    For Each cellJ In rngJ
        If Not IsEmpty(cellJ) Then
            ' 获取单元格所在行的行号
            rowNum = cellJ.row

            ' 检查行号是否在指定的行号列表中，并且列号为10或20
            If (rowNum Mod 12 = 0 Or rowNum Mod 12 = 4) And (cellJ.Column = 10 Or cellJ.Column = 20) Then
                ' 填充自定义
                cellJ.Interior.Color = RGB(255, 128, 0)
            End If
        End If
    Next cellJ

            ' 遍历L列中的每个非空单元格
    For Each cellL In rngL
        If Not IsEmpty(cellL) Then
            ' 获取单元格所在行的行号
            rowNum = cellL.row

            ' 检查行号是否在指定的行号列表中，并且列号为12或22
            If (rowNum Mod 12 = 1 Or rowNum Mod 12 = 3) And (cellL.Column = 12 Or cellL.Column = 22) Then
                ' 填充自定义
                cellL.Interior.Color = RGB(255, 128, 0)
            End If
        End If
    Next cellL

        ' 遍历I列中的每个非空单元格
    For Each cellN In rngN
        If Not IsEmpty(cellN) Then
            ' 获取单元格所在行的行号
            rowNum = cellN.row

            ' 检查行号是否在指定的行号列表中，并且列号为14或24
            If (rowNum Mod 12 = 2 Or rowNum Mod 12 = 2) And (cellN.Column = 14 Or cellN.Column = 24) Then
                ' 填充自定义
                cellN.Interior.Color = RGB(255, 128, 0)
            End If
        End If
    Next cellN
    
 '===========================================当查看方法时，将隐藏下列单元格，可通过手动恢复显示============================
    ' 显示C列
    Range("C:C").EntireColumn.Hidden = True
    
    ' 显示E列
    Range("E:E").EntireColumn.Hidden = True
    
    ' 显示G列
    Range("G:G").EntireColumn.Hidden = True
    
    ' 显示I列
    Range("I:I").EntireColumn.Hidden = True
    
    ' 显示K列
    Range("K:K").EntireColumn.Hidden = True
    
    ' 显示M列
    Range("M:M").EntireColumn.Hidden = True
    
    ' 显示O列
    Range("O:O").EntireColumn.Hidden = True
    
    ' 显示P:AC列
    Range("P:AC").EntireColumn.Hidden = True
    
'    ' 显示T:Z列
'    Range("Z:AA").EntireColumn.Hidden = True
End Sub
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'********************************************************************************************************************
'********************************************************************************************************************


'*********************************************平特一肖+2规律（取消查看）*********************************************
'********************************************************************************************************************
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
Private Sub CommandButton19_Click()

    Dim rngB As Range
    Dim rngD As Range
    Dim rngF As Range
    Dim rngH As Range
    Dim rngJ As Range
    Dim rngL As Range
    Dim rngN As Range
    
    Dim cellB As Range
    Dim cellD As Range
    Dim cellF As Range
    Dim cellH As Range
    Dim cellJ As Range
    Dim cellL As Range
    Dim cellN As Range
    Dim rowNum As Integer
    
    ' 设置要填充红色的单元格范围，分别为B列、D列、F列、H列、J列、L列、N列
    Set rngB = Range("B2:B366")
    Set rngD = Range("D2:D366")
    Set rngF = Range("F2:F366")
    Set rngH = Range("H2:H366")
    Set rngJ = Range("J2:I366")
    Set rngL = Range("L2:L366")
    Set rngN = Range("N2:N366")
    
    
    ' 遍历B列中的每个非空单元格
    For Each cellB In rngB
        If Not IsEmpty(cellB) Then
            ' 获取单元格所在行的行号
            rowNum = cellB.row

            ' 检查行号是否在指定的行号列表中，并且列号为4或14
            If (rowNum Mod 12 = 8 Or rowNum Mod 12 = 8) And (cellB.Column = 2 Or cellB.Column = 12) Then
                ' 填充自定义
                cellB.Interior.Color = RGB(0, 0, 0)
            End If
        End If
    Next cellB
    

    ' 遍历D列中的每个非空单元格
    For Each cellD In rngD
        If Not IsEmpty(cellD) Then
            ' 获取单元格所在行的行号
            rowNum = cellD.row

            ' 检查行号是否在指定的行号列表中，并且列号为4或14
            If (rowNum Mod 12 = 9 Or rowNum Mod 12 = 7) And (cellD.Column = 4 Or cellD.Column = 14) Then
                ' 填充自定义
                cellD.Interior.Color = RGB(0, 0, 0)
            End If
        End If
    Next cellD


    ' 遍历F列中的每个非空单元格
    For Each cellF In rngF
        If Not IsEmpty(cellF) Then
            ' 获取单元格所在行的行号
            rowNum = cellF.row

            ' 检查行号是否在指定的行号列表中，并且列号为6或16
            If (rowNum Mod 12 = 10 Or rowNum Mod 12 = 6) And (cellF.Column = 6 Or cellF.Column = 16) Then
                ' 填充自定义
                cellF.Interior.Color = RGB(0, 0, 0)
            End If
        End If
    Next cellF

    ' 遍历H列中的每个非空单元格
    For Each cellH In rngH
        If Not IsEmpty(cellH) Then
            ' 获取单元格所在行的行号
            rowNum = cellH.row

            ' 检查行号是否在指定的行号列表中，并且列号为8或18
            If (rowNum Mod 12 = 11 Or rowNum Mod 12 = 5) And (cellH.Column = 8 Or cellH.Column = 18) Then
                ' 填充自定义
                cellH.Interior.Color = RGB(0, 0, 0)
            End If
        End If
    Next cellH

        ' 遍历I列中的每个非空单元格
    For Each cellJ In rngJ
        If Not IsEmpty(cellJ) Then
            ' 获取单元格所在行的行号
            rowNum = cellJ.row

            ' 检查行号是否在指定的行号列表中，并且列号为10或20
            If (rowNum Mod 12 = 0 Or rowNum Mod 12 = 4) And (cellJ.Column = 10 Or cellJ.Column = 20) Then
                ' 填充自定义
                cellJ.Interior.Color = RGB(0, 0, 0)
            End If
        End If
    Next cellJ

            ' 遍历L列中的每个非空单元格
    For Each cellL In rngL
        If Not IsEmpty(cellL) Then
            ' 获取单元格所在行的行号
            rowNum = cellL.row

            ' 检查行号是否在指定的行号列表中，并且列号为12或22
            If (rowNum Mod 12 = 1 Or rowNum Mod 12 = 3) And (cellL.Column = 12 Or cellL.Column = 22) Then
                ' 填充自定义
                cellL.Interior.Color = RGB(0, 0, 0)
            End If
        End If
    Next cellL

        ' 遍历I列中的每个非空单元格
    For Each cellN In rngN
        If Not IsEmpty(cellN) Then
            ' 获取单元格所在行的行号
            rowNum = cellN.row

            ' 检查行号是否在指定的行号列表中，并且列号为14或24
            If (rowNum Mod 12 = 2 Or rowNum Mod 12 = 2) And (cellN.Column = 14 Or cellN.Column = 24) Then
                ' 填充自定义
                cellN.Interior.Color = RGB(0, 0, 0)
            End If
        End If
    Next cellN
    
 '==============================================当取消查看时，将恢复显示下列二单元格，可通过手动隐藏=====================================
    ' 显示C列
    Range("C:C").EntireColumn.Hidden = fales
    
    ' 显示E列
    Range("E:E").EntireColumn.Hidden = fales
    
    ' 显示G列
    Range("G:G").EntireColumn.Hidden = fales
    
    ' 显示I列
    Range("I:I").EntireColumn.Hidden = fales
    
    ' 显示K列
    Range("K:K").EntireColumn.Hidden = fales
    
    ' 显示M列
    Range("M:M").EntireColumn.Hidden = fales
    
    ' 显示O列
    Range("O:O").EntireColumn.Hidden = fales
    
    ' 显示P:AC列
    Range("P:AC").EntireColumn.Hidden = fales
    
'    ' 显示T:Z列
'    Range("Z:AA").EntireColumn.Hidden = fales
End Sub

'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'**                                                                                                                **
'********************************************************************************************************************
'********************************************************************************************************************
'#####                                                                                                                                                                                                              #####
'#####                                                                                                                                                                                                              #####
'#####                                                                                                                                                                                                              #####
'########################################################################################################################################################################################################################
'########################################################################################################################################################################################################################
'########################################################################################################################################################################################################################

'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================
'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================
'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================
'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================
'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================
'========================================================================================================|平特预测区|平特预测区|平特预测区|================================================================================================================