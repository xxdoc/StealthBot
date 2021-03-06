Attribute VB_Name = "modChatQueue"

Option Explicit

Public Sub ChatQueue_Initialize()
    If (BotVars.ChatDelay > 0) Then
        With frmChat.ChatQueueTimer
            .Interval = IIf(BotVars.ChatDelay <= 500, BotVars.ChatDelay, 500)
                
            .Enabled = True
        End With
    End If
    
End Sub

Public Function ChatQueueTimerProc()
    
    Dim CurrentUser  As clsUserObj
    Dim I            As Integer 
    Dim j            As Integer 
    Dim lastTimer    As Long    
    
    If (g_Channel Is Nothing) Then
        Exit Function
    End If

    If (g_Channel.IsSilent) Then
        Exit Function
    End If
    
    For I = 1 To g_Channel.Users.Count
        If (I > g_Channel.Users.Count) Then
            Exit For
        End If
    
        Set CurrentUser = g_Channel.Users(I)
    
        If (CurrentUser.Queue.Count > 0) Then
            If ((GetTickCount() - CurrentUser.Queue(1).EventTick) >= BotVars.ChatDelay) Then
                CurrentUser.DisplayQueue
            End If
        End If
    Next I
    
    Set CurrentUser = Nothing
End Function
