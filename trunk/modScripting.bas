Attribute VB_Name = "modScripting"
'/* Scripting.bas
' * ~~~~~~~~~~~~~~~~
' * StealthBot VBScript support module
' * ~~~~~~~~~~~~~~~~
' * Modified by Swent 11/06/2007
' */
Option Explicit

Public Type scObj
    SCModule As Module
    ObjName  As String
    ObjType  As String
    obj      As Object
    CallCode As String
    Index    As Integer
End Type

Public VetoNextMessage As Boolean
Public boolOverride    As Boolean

Private m_srootmenu    As New clsMenuObj
Private m_arrObjs()    As scObj
Private m_objCount     As Integer
Private m_sc_control   As Object

Public Function InitMenus()

    On Error Resume Next

    Dim tmp  As clsMenuObj ' ...
    Dim Name As String     ' ...
    Dim I    As Integer    ' ...

    ' ...
    DestroyMenus
    
    ' ...
    For I = 1 To frmChat.SControl.Modules.Count
        If (I = 1) Then
            frmChat.mnuScriptingDash(0).Visible = True
        End If
    
        ' ...
        Name = _
            frmChat.SControl.Modules(I).CodeObject.Script("Name")
    
        ' ...
        If (Err.Number = 0) Then
            Set tmp = New clsMenuObj
        
            ' ...
            tmp.Name = Chr$(0) & Name & " ROOT"
            tmp.hWnd = GetSubMenu(GetMenu(frmChat.hWnd), 5)
            tmp.Caption = Name
                
            ' ...
            DynamicMenus.Add tmp, "mnu" & Name
                
            ' ...
            Set tmp = New clsMenuObj
        
            ' ...
            tmp.Name = Chr$(0) & Name & " ENABLE|DISABLE"
            tmp.Parent = DynamicMenus("mnu" & Name)
            tmp.Caption = "Enabled"
            
            If (StrComp(frmChat.SControl.Modules(I).CodeObject.GetSettingsEntry("Enabled"), _
                    "False", vbTextCompare) <> 0) Then
                    
                tmp.Checked = True
            End If
            
            ' ...
            DynamicMenus.Add tmp
            
            ' ...
            Set tmp = New clsMenuObj
        
            ' ...
            tmp.Name = Chr$(0) & Name & " VIEW_SCRIPT"
            tmp.Parent = DynamicMenus("mnu" & Name)
            tmp.Caption = "View Script"
            
            ' ...
            DynamicMenus.Add tmp
        End If
        
        Err.Clear
    Next I

End Function

Public Function DestroyMenus()

    Dim I As Integer ' ...
    
    frmChat.mnuScriptingDash(0).Visible = False
    
    For I = DynamicMenus.Count To 1 Step -1
        
        If (Left$(DynamicMenus(I).Name, 1) = Chr$(0)) Then
            DynamicMenus(I).Class_Terminate
            
            Set DynamicMenus(I) = Nothing
            
            DynamicMenus.Remove I
        End If
        
    Next I

End Function

Private Function GetFileExtension(ByVal filename As String)
        
        Dim arr() As String

        arr = Split(filename, ".")
        If UBound(arr) = 0 Then
                GetFileExtension = ""
        Else
                GetFileExtension = arr(UBound(arr))
        End If

End Function

Private Function IsValidFileExtension(ByVal ext As String) As Boolean

    Dim exts() As String  ' ...
    Dim I      As Integer ' ...

    ' ...
    ReDim exts(0 To 2)
    
    ' ...
    exts(0) = "dat"
    exts(1) = "txt"
    exts(2) = "vbs"
    
    ' ...
    For I = LBound(exts) To UBound(exts)
        If (StrComp(ext, exts(I), vbTextCompare) = 0) Then
            IsValidFileExtension = True
            
            Exit Function
        End If
    Next I
    
    IsValidFileExtension = False

End Function

Private Function CleanFileName(ByVal filename As String) As String
    
    On Error Resume Next
    
    Dim nameAllow As String  ' ...
    Dim j         As Integer ' ...
    
    ' ...
    nameAllow = "_abcdefghijklmnopqrstuvwxyz0123456789"
    
    ' ...
    'CleanFileName = Replace(filename, " ", "_")

    ' ...
    CleanFileName = _
        Left$(CleanFileName, InStr(1, CleanFileName, ".") - 1)

    ' ...
    'For j = 1 To Len(CleanFileName)
    '    If (j = 1) Then
    '        If (InStr(1, nameAllow, Mid$(CleanFileName, j, 1)) >= 28) Then
    '            Mid$(CleanFileName, j, 1) = ""
    '        End If
    '    End If
    '
    '    If (InStr(1, nameAllow, Mid$(CleanFileName, j, 1), vbTextCompare) = 0) Then
    '        Mid$(CleanFileName, j, 1) = ""
    '    End If
    'Next j
    
End Function

Public Sub InitScriptControl(ByVal SC As ScriptControl)

    On Error Resume Next
    
    ' ...
    frmChat.scTimer.Enabled = False
    frmChat.INet.Cancel
    
    ' ...
    DestroyObjs
    
    ' ...
    SC.Reset

    ' ...
    If (ReadINI("Other", "ScriptAllowUI", GetConfigFilePath()) <> "N") Then
        SC.AllowUI = True
    End If

    '// Create scripting objects
    SC.AddObject "ssc", SharedScriptSupport, True
    SC.AddObject "scTimer", frmChat.scTimer
    SC.AddObject "scINet", frmChat.INet
    SC.AddObject "BotVars", BotVars
    
    ' ...
    Set m_sc_control = SC

End Sub

Public Sub LoadScripts()

    ' ...
    On Error GoTo ERROR_HANDLER

    Dim CurrentModule As Module

    Dim strPath  As String  ' ...
    Dim filename As String  ' ...
    Dim fileExt  As String  ' ...
    Dim I        As Integer ' ...
    Dim j        As Integer ' ...
    Dim str      As String  ' ...
    Dim tmp      As String  ' ...

    ' ********************************
    '      LOAD REGULAR SCRIPTS
    ' ********************************
    
    ' ...
    strPath = App.Path & "\scripts\"
    
    ' ...
    If (Dir(strPath) <> vbNullString) Then
        ' ...
        filename = Dir(strPath)
        
        ' ...
        Do While (filename <> vbNullString)
            ' ...
            If (IsValidFileExtension(GetFileExtension(filename))) Then
                ' ...
                Set CurrentModule = _
                    m_sc_control.Modules.Add(m_sc_control.Modules.Count + 1)

                ' ...
                If (FileToModule(CurrentModule, strPath & filename)) Then
                    If (IsScriptNameValid(CurrentModule) = False) Then
                        CurrentModule.CodeObject.Script("Name") = CleanFileName(filename)
                    
                        ' ...
                        If (IsScriptNameValid(CurrentModule) = False) Then
                            frmChat.AddChat vbRed, "Scripting error: " & filename & " has been " & _
                                "disabled due to a naming issue."
                                
                            str = strPath & "\disabled\"
                            
                            MkDir str
                                
                            Kill str & filename
        
                            Name strPath & filename As str & filename
        
                            InitScriptControl m_sc_control
                            LoadScripts
                            
                            Exit Sub
                        End If
                    End If
                End If
            End If
            
            filename = Dir()
        Loop
    End If
    
    ' ********************************
    '      LOAD PLUGIN SYSTEM
    ' ********************************

    ' ...
    If (ReadINI("Override", "DisablePS", GetConfigFilePath()) <> "Y") Then
        ' ...
        strPath = GetFilePath("PluginSystem.dat")
        
        ' ...
        If (LenB(Dir$(strPath)) = 0) Then
            Call frmChat.AddChat(vbRed, "Cannot find PluginSystem.dat. It must exist in order to load plugins!")
            Call frmChat.AddChat(vbYellow, "You may download PluginSystem.dat to your StealthBot folder using the link below.")
            Call frmChat.AddChat(vbWhite, "http://www.stealthbot.net/p/Users/Swent/index.php?file=PluginSystem.dat")
        Else
            FileToModule m_sc_control.Modules(1), strPath
        End If
        
        If (m_sc_control.Modules(1).CodeObject.Script("Name") = vbNullString) Then
            m_sc_control.Modules(1).CodeObject.Script("Name") = "PluginSystem"
        End If
    End If
    
    ' ...
    'Set wrkScripts = New Collection
    
    ' ********************************
    '     SET GLOBAL SCRIPT NAMES
    ' ********************************

    'For i = 2 To m_sc_control.Modules.Count
    '    ' ...
    '    str = _
    '        m_sc_control.Modules(i).CodeObject.Script("Name")
    '
    '    ' ...
    '    tmp = _
    '        m_sc_control.Modules(i).CodeObject.GetSettingsEntry("Public")
    '
    '    ' ...
    '    If (StrComp(tmp, "False", vbTextCompare) <> 0) Then
    '        m_sc_control.Modules(1).ExecuteStatement "Set " & str & " = Scripts(" & Chr$(34) & _
    '            str & Chr$(34) & ")"
    '    End If
    'Next i
    
    'UpdateScripts
    
    ' ...
    Exit Sub

' ...
ERROR_HANDLER:

    ' object does not support property or method - function missing
    If (Err.Number = 438) Then
        Err.Clear
    
        Resume Next
    End If
    
    ' path/file errors - likely due to duplicate script handling
    If ((Err.Number = 75) Or (Err.Number = 53)) Then
        Err.Clear
    
        Resume Next
    End If

    ' ...
    frmChat.AddChat vbRed, _
        "Error (" & Err.Number & "): " & Err.description & " in LoadScripts()."

    Exit Sub

End Sub

Private Function FileToModule(ByRef ScriptModule As Module, ByVal filePath As String, Optional ByVal defaults As Boolean = True) As Boolean

    On Error GoTo ERROR_HANDLER

    Dim strLine          As String  ' ...
    Dim strContent       As String  ' ...
    Dim f                As Integer ' ...
    Dim blnCheckOperands As Boolean

    ' ...
    blnCheckOperands = True
    
    ' ...
    f = FreeFile

    ' ...
    Open filePath For Input As #f
        ' ...
        Do While (EOF(f) = False)
            ' ...
            Line Input #f, strLine
            
            ' ...
            strLine = Trim(strLine)
            
            ' ...
            If (Len(strLine) >= 1) Then
                If ((blnCheckOperands) And (Left$(strLine, 1) = "#")) Then
                    If (InStr(1, strLine, " ") <> 0) Then
                        If (Len(strLine) >= 2) Then
                            Dim strCommand As String ' ...
                        
                            strCommand = _
                                LCase$(Mid$(strLine, 2, InStr(1, strLine, " ") - 2))
    
                            If (strCommand = "include") Then
                                If (Len(strLine) >= 12) Then
                                    Dim tmp As String ' ...
                                    
                                    ' ...
                                    tmp = _
                                        LCase$(Mid$(strLine, 11, Len(strLine) - 11))
                                    
                                    ' ...
                                    If (Left$(tmp, 1) = "\") Then
                                       tmp = App.Path & "\scripts\" & tmp
                                    End If

                                    ' ...
                                    FileToModule ScriptModule, tmp, False
                                End If
                            End If
                        End If
                    End If
                Else
                    blnCheckOperands = False
                End If
            End If
            
            ' ...
            If (blnCheckOperands = False) Then
                strContent = _
                    strContent & strLine & vbCrLf
            End If
            
            ' ...
            strLine = vbNullString
        Loop
    Close #f
    
    ' ...
    ScriptModule.AddCode strContent
        
    ' ...
    If (defaults) Then
        CreateDefautModuleProcs ScriptModule, filePath
    End If
    
    FileToModule = True
    
    Exit Function
    
ERROR_HANDLER:

    FileToModule = False

End Function

Private Sub CreateDefautModuleProcs(ByRef ScriptModule As Module, ByVal ScriptPath As String)

    On Error GoTo ERROR_HANDLER

    Dim str As String  ' storage buffer for module code
    
    ' ...
    ScriptModule.ExecuteStatement _
        "Set Script = CreateObject(" & Chr$(34) & "Scripting.Dictionary" & Chr$(34) & ")"

    ' ...
    ScriptModule.Run "Data"
    
    ' ...
    ScriptModule.ExecuteStatement "Script(""Path"") = " & Chr$(34) & _
        ScriptPath & Chr$(34)
                
    ' ...
    ScriptModule.ExecuteStatement "Set DataBuffer = DataBufferEx()"

    ' GetModuleID() module-level function
    str = str & "Function GetModuleID()" & vbNewLine
    str = str & "   GetModuleID = " & Chr$(34) & ScriptModule.Name & Chr$(34) & vbNewLine
    str = str & "End Function" & vbNewLine
    
    ' GetWorkingDirectory() module-level function
    str = str & "Function GetWorkingDirectory()" & vbNewLine
    str = str & "   GetWorkingDirectory = _" & vbNewLine
    str = str & "       BotPath() & ""Scripts\"" & " & "Script(""Name"") & " & """\""" & vbNewLine
    str = str & "   MkDirEx GetWorkingDirectory" & vbNewLine
    str = str & "End Function" & vbNewLine

    ' CreateObj() module-level function
    str = str & "Function CreateObj(ObjType, ObjName)" & vbNewLine
    str = str & "   Set CreateObj = _ " & vbNewLine
    str = str & "         ICreateObj(GetModuleID(), ObjType, ObjName)" & vbNewLine
    str = str & "End Function" & vbNewLine
    
    ' CreateObjEx() module-level function
    str = str & "Function CreateObjEx(ObjType, ObjName, CallCode)" & vbNewLine
    str = str & "   Set CreateObjEx = _ " & vbNewLine
    str = str & "         ICreateObj(GetModuleID(), ObjType, ObjName, CallCode)" & vbNewLine
    str = str & "End Function" & vbNewLine

    ' DestroyObj() module-level function
    str = str & "Sub DestroyObj(ObjName)" & vbNewLine
    str = str & "   IDestroyObj GetModuleID(), ObjName" & vbNewLine
    str = str & "End Sub" & vbNewLine
    
    ' GetObjByName() module-level function
    str = str & "Function GetObjByName(ObjName)" & vbNewLine
    str = str & "   Set GetObjByName = _ " & vbNewLine
    str = str & "         IGetObjByName(GetModuleID(), ObjName)" & vbNewLine
    str = str & "End Function" & vbNewLine
    
    ' GetSettingsEntry() module-level function
    str = str & "Function GetSettingsEntry(EntryName)" & vbNewLine
    str = str & "   GetSettingsEntry = GetSettingsEntryEx(Script(""Name""), EntryName)" & vbNewLine
    str = str & "End Function" & vbNewLine
    
    ' WriteSettingsEntry() module-level function
    str = str & "Sub WriteSettingsEntry(EntryName, EntryValue)" & vbNewLine
    str = str & "   WriteSettingsEntryEx Script(""Name""), EntryName, EntryValue" & vbNewLine
    str = str & "End Sub" & vbNewLine

    ' store module-level coding
    ScriptModule.AddCode str
    
    Exit Sub
    
ERROR_HANDLER:

    ' object does not support property or method - function missing
    If (Err.Number = 438) Then
        Err.Clear
        
        Resume Next
    End If

    ' ...
    frmChat.AddChat vbRed, _
        "Error (" & Err.Number & "): " & Err.description & " in LoadScripts()."

    Exit Sub
    
End Sub

Private Function IsScriptNameValid(ByRef CurrentModule As Module) As Boolean

    On Error Resume Next

    Dim j            As Integer ' ...
    Dim str          As String  ' ...
    Dim tmp          As String  ' ...
    Dim nameDisallow As String
    Dim I            As Integer
    
    ' ...
    str = _
        CurrentModule.CodeObject.Script("Name")

    ' ...
    If (str = vbNullString) Then
        IsScriptNameValid = False
                
        Exit Function
    End If
    
    ' ...
    nameDisallow = "\/:*?<>|"""

    ' ...
    For j = 1 To Len(str)
        If (InStr(1, nameDisallow, Mid$(str, j, 1), vbTextCompare) <> 0) Then
            IsScriptNameValid = False
    
            Exit Function
        End If
    Next j

    ' ...
    For j = 1 To m_sc_control.Modules.Count
        ' ...
        If (m_sc_control.Modules(j).Name <> CurrentModule.Name) Then
            tmp = _
                m_sc_control.Modules(j).CodeObject.Script("Name")
                
            If (StrComp(str, tmp, vbTextCompare) = 0) Then
                IsScriptNameValid = False

                Exit Function
            End If
        End If
    Next j
    
    ' ...
    IsScriptNameValid = True

End Function

Public Function UpdateScripts()

    On Error Resume Next
    
    Dim wrkScripts As New Collection ' ...
    Dim I          As Integer ' ...
    Dim str        As String  ' ...
    Dim tmp        As String  ' ...
    
    ' ...
    If (m_sc_control.Modules.Count) Then
        Dim CRC32    As New clsCRC32
        Dim filePath As String

        ' ...
        frmChat.AddChat RTBColors.InformationText, "Checking for script updates..."
        
        ' ...
        For I = 1 To m_sc_control.Modules.Count
            str = _
                m_sc_control.Modules(I).CodeObject.Script("UpdateLocation")
                
            If (str <> vbNullString) Then
                ' ...
                filePath = App.Path & "\scripts\" & m_sc_control.Modules(I).Name
            
                ' ...
                URLDownloadToFile 0, str, filePath & ".tmp", 0, 0
                
                ' ...
                If (CRC32.GetFileCRC32(filePath) <> CRC32.GetFileCRC32(filePath & ".tmp")) Then
                    ' ...
                    wrkScripts.Add m_sc_control.Modules(I)
                
                    ' ...
                    Kill filePath
                    
                    ' ...
                    Name filePath & ".tmp" As filePath
                End If
                
                ' ...
                Kill filePath & ".tmp"
            End If
        Next I

        If (wrkScripts.Count) Then
            str = "Successfully updated the following scripts: "
            
            For I = 1 To wrkScripts.Count
                str = str & _
                    wrkScripts(I).CodeObject.Script("Name") & ", "
            Next I
            
            frmChat.AddChat vbGreen, Left$(str, Len(str) - 2)
            
            InitScriptControl m_sc_control
            LoadScripts
        Else
            frmChat.AddChat vbGreen, "Scripts are up to date."
        End If
        
        Set CRC32 = Nothing
    End If

End Function

Public Sub InitScripts()
    
    Static reloading As Boolean ' ...
    
    Dim I   As Integer ' ...
    Dim str As String  ' ...
    
    If (reloading = False) Then
        RunInAll "Event_FirstRun"
        
        reloading = True
    End If
    
    For I = 1 To m_sc_control.Modules.Count
        If (I > 1) Then
            str = _
                m_sc_control.Modules(I).CodeObject.GetSettingsEntry("Enabled")
        End If
    
        If (StrComp(str, "False", vbTextCompare) <> 0) Then
            InitScript m_sc_control.Modules(I)
        End If
    Next I

End Sub

Public Sub InitScript(ByVal SCModule As Module)

    On Error GoTo ERROR_HANDLER

    Dim I          As Integer ' ...
    Dim startTime  As Long
    Dim finishTime As Long

    ' ...
    startTime = GetTickCount()
    
    ' ...
    SCModule.Run "Event_Load"
    
    ' ...
    finishTime = GetTickCount()
 
    '// 03/27/2009 52 - added default Script property for the load time
    SCModule.CodeObject.Script("InitPerf") = (finishTime - startTime)

    If (g_Online) Then
        SCModule.Run "Event_LoggedOn", GetCurrentUsername, BotVars.Product
        SCModule.Run "Event_ChannelJoin", g_Channel.Name, g_Channel.flags
    
        If (g_Channel.Users.Count > 0) Then
            For I = 1 To g_Channel.Users.Count
                With g_Channel.Users(I)
                     SCModule.Run "Event_UserInChannel", .DisplayName, .flags, .Stats.ToString, .Ping, _
                        .game, False
                End With
             Next I
         End If
    End If
    
    Exit Sub
    
ERROR_HANDLER:

    ' object does not support property or method - function missing
    If (Err.Number = 438) Then
        Err.Clear
    
        Resume Next
    End If
    
    ' path not found - deletion of running scripts?
    If (Err.Number = 76) Then
        Err.Clear
    
        Resume Next
    End If

    frmChat.AddChat vbRed, "Error (#" & Err.Number & "): " & Err.description & _
        " in InitScript()."
 
    Exit Sub

End Sub

Public Sub RunInAll(ParamArray Parameters() As Variant)

    On Error GoTo ERROR_HANDLER

    Dim SC    As ScriptControl
    Dim I     As Integer ' ...
    Dim arr() As Variant ' ...
    Dim str   As String  ' ...
    
    ' ...
    Set SC = m_sc_control
    
    ' ...
    arr() = Parameters()

    ' ...
    For I = 1 To SC.Modules.Count
        If (I > 1) Then
            str = _
                SC.Modules(I).CodeObject.GetSettingsEntry("Enabled")
        End If

        If (StrComp(str, "False", vbTextCompare) <> 0) Then
            CallByNameEx SC.Modules(I), "Run", VbMethod, arr()
        End If
    Next

    Exit Sub
    
ERROR_HANDLER:

    ' object does not support property or method - function missing
    If (Err.Number = 438) Then
        Err.Clear
    
        Resume Next
    End If
    
    ' path not found - deletion of running scripts?
    If (Err.Number = 76) Then
        Err.Clear
    
        Resume Next
    End If

    frmChat.AddChat vbRed, "Error (#" & Err.Number & "): " & Err.description & _
        " in RunInAll()."
    
    Exit Sub
    
End Sub

Public Function CallByNameEx(obj As Object, ProcName As String, CallType As VbCallType, Optional vArgsArray _
    As Variant)
    
    On Error GoTo ERROR_HANDLER
    
    Dim oTLI    As TLI.TLIApplication
    Dim ProcID  As Long
    Dim numArgs As Long
    Dim I       As Long
    Dim v()     As Variant
    
    Set oTLI = New TLIApplication

    ProcID = oTLI.InvokeID(obj, ProcName)

    If (IsMissing(vArgsArray)) Then
        CallByNameEx = oTLI.InvokeHook(obj, ProcID, CallType)
    End If
    
    If (IsArray(vArgsArray)) Then
        numArgs = UBound(vArgsArray)
        
        ReDim v(numArgs)
        
        For I = 0 To numArgs
            v(I) = vArgsArray(numArgs - I)
        Next I
        
        CallByNameEx = oTLI.InvokeHookArray(obj, ProcID, CallType, v)
    End If
    
    Set oTLI = Nothing
    
    Exit Function

ERROR_HANDLER:
    ' ...
    If (frmChat.SControl.Error) Then
        Exit Function
    End If

    frmChat.AddChat vbRed, "Error (#" & Err.Number & "): " & Err.description & _
        " in CallByNameEx()."
        
    Set oTLI = Nothing
        
    Exit Function
    
End Function

Public Function Objects(objIndex As Integer) As scObj

    Objects = m_arrObjs(objIndex)

End Function

Private Function ObjCount(Optional ObjType As String, Optional ByVal SCModule As Module = Nothing) As Integer
    
    Dim I As Integer ' ...

    If (ObjType <> vbNullString) Then
        For I = 0 To m_objCount - 1
            If (SCModule Is Nothing) Then
                If (StrComp(ObjType, m_arrObjs(I).ObjType, vbTextCompare) = 0) Then
                    ObjCount = (ObjCount + 1)
                End If
            Else
                If (StrComp(SCModule.Name, m_arrObjs(I).SCModule.Name) = 0) Then
                    If (StrComp(ObjType, m_arrObjs(I).ObjType, vbTextCompare) = 0) Then
                        ObjCount = (ObjCount + 1)
                    End If
                End If
            End If
        Next I
    Else
        ObjCount = m_objCount
    End If

End Function

Public Function CreateObj(ByRef SCModule As Module, ByVal ObjType As String, ByVal ObjName As String, Optional CallCode As String, Optional ByVal Clone As Boolean) As Object

    On Error Resume Next

    Dim obj As scObj ' ...
    
    ' redefine array size & check for duplicate controls
    If (m_objCount) Then
        Dim I As Integer ' loop counter variable

        For I = 0 To m_objCount - 1
            If (m_arrObjs(I).SCModule.Name = SCModule.Name) Then
                If (StrComp(m_arrObjs(I).ObjType, ObjType, vbTextCompare) = 0) Then
                    If (StrComp(m_arrObjs(I).ObjName, ObjName, vbTextCompare) = 0) Then
                        Set CreateObj = m_arrObjs(I).obj
                    
                        Exit Function
                    End If
                End If
            End If
        Next I
        
        ReDim Preserve m_arrObjs(0 To m_objCount)
    Else
        ReDim m_arrObjs(0)
    End If

    ' store our module name & type
    obj.ObjName = ObjName
    obj.ObjType = ObjType
    obj.CallCode = CallCode

    ' store our module handle
    Set obj.SCModule = SCModule
    
    ' grab/create instance of object
    Select Case (UCase$(ObjType))
        Case "TIMER"
            If (ObjCount(ObjType) > 0) Then
                Load frmChat.tmrScript(ObjCount(ObjType))
            End If
            
            Set obj.obj = _
                    frmChat.tmrScript(ObjCount(ObjType))
                    
        Case "LONGTIMER"
            If (ObjCount(ObjType) > 0) Then
                Load frmChat.tmrScriptLong(ObjCount(ObjType))
            End If
        
            Set obj.obj = New clsSLongTimer
        
            obj.obj.tmr = _
                frmChat.tmrScriptLong(ObjCount(ObjType))
                    
            With obj.obj.tmr
                .Interval = 1000
            End With
            
        Case "WINSOCK"
            If (ObjCount(ObjType) > 0) Then
                Load frmChat.sckScript(ObjCount(ObjType))
            End If
            
            Set obj.obj = _
                    frmChat.sckScript(ObjCount(ObjType))
        
        Case "INET"
            If (ObjCount(ObjType) > 0) Then
                Load frmChat.itcScript(ObjCount(ObjType))
            End If
            
            Set obj.obj = _
                    frmChat.itcScript(ObjCount(ObjType))
        
        Case "FORM"
            Set obj.obj = New frmScript
            
            ' ...
            obj.obj.setName ObjName
            obj.obj.setSCModule SCModule
            
            ' ...
            HookWindowProc obj.obj.hWnd
            
        Case "MENU"
            If (ObjCount("Menu", SCModule) = 0) Then
                Dim tmp As New clsMenuObj ' ...
                
                tmp.Name = _
                    "mnu" & SCModule.CodeObject.Script("Name") & "Dash1"
                tmp.Parent = _
                    DynamicMenus("mnu" & SCModule.CodeObject.Script("Name"))
                tmp.Caption = "-"
                
                ' ...
                m_arrObjs(m_objCount).ObjName = tmp.Name
                m_arrObjs(m_objCount).ObjType = "Menu"
                
                ' ...
                Set m_arrObjs(m_objCount).SCModule = SCModule
                
                ' ...
                Set m_arrObjs(m_objCount).obj = tmp
                
                ' ...
                m_objCount = (m_objCount + 1)
                
                ' ...
                ReDim Preserve m_arrObjs(0 To m_objCount)
                
                ' ...
                DynamicMenus.Add tmp
            End If
        
            ' ...
            Set obj.obj = New clsMenuObj
            
            ' ...
            obj.obj.Name = ObjName
            
            ' ...
            obj.obj.Parent = _
                DynamicMenus("mnu" & SCModule.CodeObject.Script("Name"))
                
            ' ...
            DynamicMenus.Add obj.obj
    End Select

    ' store object
    m_arrObjs(m_objCount) = obj
    
    ' increment object counter
    m_objCount = (m_objCount + 1)
    
    ' create class variable for object
    SCModule.ExecuteStatement "Set " & ObjName & " = GetObjByName(" & Chr$(34) & _
        ObjName & Chr$(34) & ")"
        
    ' unfortunately creating a new form triggers the scripting events
    ' too early, so we have to call them manually here.
    If (UCase$(ObjType) = "FORM") Then
        obj.obj.Initialize
    End If

    ' return object
    Set CreateObj = obj.obj

End Function

Public Sub DestroyObjs(Optional ByVal SCModule As Object = Nothing)

    On Error GoTo ERROR_HANDLER

    Dim I As Integer ' ...
    
    ' ...
    For I = m_objCount - 1 To 0 Step -1
        If (SCModule Is Nothing) Then
            DestroyObj m_arrObjs(I).SCModule, m_arrObjs(I).ObjName
        Else
            If (SCModule.Name = m_arrObjs(I).SCModule.Name) Then
                DestroyObj m_arrObjs(I).SCModule, m_arrObjs(I).ObjName
            End If
        End If
    Next I
    
    Exit Sub
    
ERROR_HANDLER:
    
    frmChat.AddChat vbRed, _
        "Error (#" & Err.Number & "): " & Err.description & " in DestroyObjs()."
        
    Resume Next
    
End Sub

Public Sub DestroyObj(ByVal SCModule As Module, ByVal ObjName As String)

    On Error GoTo ERROR_HANDLER

    Dim I     As Integer ' ...
    Dim Index As Integer ' ...
    
    ' ...
    If (m_objCount = 0) Then
        Exit Sub
    End If
    
    ' ...
    Index = m_objCount
    
    ' ...
    For I = 0 To m_objCount - 1
        If (m_arrObjs(I).SCModule.Name = SCModule.Name) Then
            If (StrComp(m_arrObjs(I).ObjName, ObjName, vbTextCompare) = 0) Then
                Index = I
            
                Exit For
            End If
        End If
    Next I
    
    ' ...
    If (Index >= m_objCount) Then
        Exit Sub
    End If
    
    ' ...
    Select Case (UCase$(m_arrObjs(Index).ObjType))
        Case "TIMER"
            If (m_arrObjs(Index).obj.Index > 0) Then
                Unload frmChat.tmrScript(m_arrObjs(Index).obj.Index)
            Else
                frmChat.tmrScript(0).Enabled = False
            End If
            
        Case "LONGTIMER"
            If (m_arrObjs(Index).obj.Index > 0) Then
                Unload frmChat.tmrScriptLong(m_arrObjs(Index).obj.Index)
            Else
                frmChat.tmrScriptLong(0).Enabled = False
            End If
            
        Case "WINSOCK"
            If (m_arrObjs(Index).obj.Index > 0) Then
                Unload frmChat.sckScript(m_arrObjs(Index).obj.Index)
            Else
                frmChat.sckScript(0).Close
            End If
            
        Case "INET"
            If (m_arrObjs(Index).obj.Index > 0) Then
                Unload frmChat.itcScript(m_arrObjs(Index).obj.Index)
            Else
                frmChat.itcScript(0).Cancel
            End If

        Case "FORM"
            UnhookWindowProc m_arrObjs(Index).obj.hWnd
        
            m_arrObjs(Index).obj.DestroyObjs
            
            Unload m_arrObjs(Index).obj
            
        Case "MENU"
            m_arrObjs(Index).obj.Class_Terminate
    End Select

    ' ...
    Set m_arrObjs(Index).obj = Nothing
    
    ' ...
    If (Index < m_objCount - 1) Then
        For I = Index To ((m_objCount - 1) - 1)
            m_arrObjs(I) = m_arrObjs(I + 1)
        Next I
    End If
    
    ' ...
    If (m_objCount > 1) Then
        ReDim Preserve m_arrObjs(0 To m_objCount - 1)
    Else
        ReDim m_arrObjs(0)
    End If
    
    ' ...
    m_objCount = (m_objCount - 1)
    
        ' ...
    SCModule.ExecuteStatement "Set " & ObjName & " = Nothing"
    
    ' ...
    Exit Sub
    
ERROR_HANDLER:
    
    frmChat.AddChat vbRed, _
        "Error (#" & Err.Number & "): " & Err.description & " in DestroyObj()."
        
    Resume Next
    
End Sub

Public Function GetObjByName(ByRef SCModule As Module, ByVal ObjName As String) As Object

    Dim I As Integer ' ...
    
    ' ...
    For I = 0 To m_objCount - 1
        If (m_arrObjs(I).SCModule.Name = SCModule.Name) Then
            If (StrComp(m_arrObjs(I).ObjName, ObjName, vbTextCompare) = 0) Then
                Set GetObjByName = m_arrObjs(I).obj

                Exit Function
            End If
        End If
    Next I

End Function

Public Function GetScriptObjByMenuID(ByVal MenuID As Long) As scObj

    Dim I As Integer ' ...
    Dim j As Integer ' ...

    For I = 0 To ObjCount() - 1
        If (StrComp("Menu", Objects(I).ObjType, vbTextCompare) = 0) Then
            If (m_arrObjs(I).obj.ID = MenuID) Then
                GetScriptObjByMenuID = m_arrObjs(I)
                
                Exit Function
            End If
        'ElseIf (StrComp("Form", Objects(I).ObjType, vbTextCompare) = 0) Then
        '    For j = 0 To Objects(I).obj.ObjCount("Menu") - 1
        '        If (StrComp("Menu", Objects(I).obj.Objects(j).ObjectType, vbTextCompare) = 0) Then
        '            If (Objects(I).obj.Objects(j).ID = MenuID) Then
        '                GetScriptObjByMenuID = Objects(I)
        '
        '                Exit Function
        '            End If
        '        End If
        '    Next j
        End If
    Next I

End Function

Public Function GetScriptObjByIndex(ByVal ObjType As String, ByVal Index As Integer) As scObj

    Dim I As Integer ' ...

    For I = 0 To ObjCount() - 1
        If (StrComp(ObjType, Objects(I).ObjType, vbTextCompare) = 0) Then
            If (m_arrObjs(I).obj.Index = Index) Then
                GetScriptObjByIndex = m_arrObjs(I)
                
                Exit For
            End If
        End If
    Next I

End Function

Public Function Scripts() As Object

    On Error Resume Next

    Dim I   As Integer ' ...
    Dim str As String  ' ...

    Set Scripts = New Collection

    For I = 1 To frmChat.SControl.Modules.Count
        str = _
            frmChat.SControl.Modules(I).CodeObject.GetSettingsEntry("Public")
                
        If (StrComp(str, "False", vbTextCompare) <> 0) Then
            Scripts.Add frmChat.SControl.Modules(I).CodeObject, _
                frmChat.SControl.Modules(I).CodeObject.Script("Name")
        End If
    Next I

End Function

Public Sub SetVeto(ByVal B As Boolean)

    VetoNextMessage = B
    
End Sub

Public Function GetVeto() As Boolean

    GetVeto = VetoNextMessage
    
    VetoNextMessage = False
    
End Function
