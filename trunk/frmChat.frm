VERSION 5.00
Object = "{0E59F1D2-1FBE-11D0-8FF2-00A0D10038BC}#1.0#0"; "msscript.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "MSCOMCTL.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmChat 
   BackColor       =   &H00000000&
   Caption         =   ":: StealthBot &version :: Disconnected ::"
   ClientHeight    =   7965
   ClientLeft      =   225
   ClientTop       =   870
   ClientWidth     =   11400
   ForeColor       =   &H00000000&
   Icon            =   "frmChat.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7965
   ScaleWidth      =   11400
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView lvChannel 
      Height          =   6375
      Left            =   8880
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   240
      Width           =   3705
      _ExtentX        =   6535
      _ExtentY        =   11245
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   0   'False
      HideSelection   =   -1  'True
      HideColumnHeaders=   -1  'True
      OLEDragMode     =   1
      _Version        =   393217
      SmallIcons      =   "imlIcons"
      ForeColor       =   10079232
      BackColor       =   0
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OLEDragMode     =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Width           =   4145
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Object.Width           =   1252
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   1
         SubItemIndex    =   2
         Object.Width           =   582
      EndProperty
   End
   Begin VB.Timer tmrAccountLock 
      Enabled         =   0   'False
      Interval        =   30000
      Left            =   6240
      Top             =   4560
   End
   Begin MSScriptControlCtl.ScriptControl SControl 
      Left            =   120
      Top             =   720
      _ExtentX        =   1005
      _ExtentY        =   1005
   End
   Begin MSScriptControlCtl.ScriptControl SCRestricted 
      Left            =   5880
      Top             =   3360
      _ExtentX        =   1005
      _ExtentY        =   1005
   End
   Begin VB.Timer tmrScriptLong 
      Enabled         =   0   'False
      Index           =   0
      Left            =   1200
      Top             =   120
   End
   Begin InetCtlsObjects.Inet itcScript 
      Index           =   0
      Left            =   120
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      RequestTimeout  =   7
   End
   Begin MSWinsockLib.Winsock sckScript 
      Index           =   0
      Left            =   720
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Timer ChatQueueTimer 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   5280
      Top             =   4560
   End
   Begin VB.Timer cacheTimer 
      Enabled         =   0   'False
      Interval        =   2500
      Left            =   5280
      Top             =   4080
   End
   Begin MSComctlLib.ImageList imlClan 
      Left            =   6480
      Top             =   3360
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   0
      ImageWidth      =   37
      ImageHeight     =   23
      UseMaskColor    =   0   'False
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1B32
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1DC1
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":2048
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":2302
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":25AC
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":2A8A
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4C5D
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imlIcons 
      Left            =   7080
      Top             =   3360
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   0
      ImageWidth      =   28
      ImageHeight     =   18
      UseMaskColor    =   0   'False
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   158
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":6DD7
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":7071
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":731B
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":7955
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":7BEB
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":7F99
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":834B
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":8985
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":8B27
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":8CC5
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":8F7F
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":95C5
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":9BFF
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":9DA1
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":A05B
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":A1E9
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":A37B
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":A609
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":A8DF
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":ABA5
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":AE8B
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":B159
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":B520
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":B896
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":BC1E
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":BFB7
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":C35C
            Key             =   ""
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":C70E
            Key             =   ""
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":CAD3
            Key             =   ""
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":D001
            Key             =   ""
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":D51B
            Key             =   ""
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":D78C
            Key             =   ""
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":D9F6
            Key             =   ""
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":DC07
            Key             =   ""
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":DE41
            Key             =   ""
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":E0A5
            Key             =   ""
         EndProperty
         BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":E300
            Key             =   ""
         EndProperty
         BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":E54B
            Key             =   ""
         EndProperty
         BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":E7B5
            Key             =   ""
         EndProperty
         BeginProperty ListImage40 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":E9D8
            Key             =   ""
         EndProperty
         BeginProperty ListImage41 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":EC05
            Key             =   ""
         EndProperty
         BeginProperty ListImage42 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":EE21
            Key             =   ""
         EndProperty
         BeginProperty ListImage43 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":F058
            Key             =   ""
         EndProperty
         BeginProperty ListImage44 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":F2A3
            Key             =   ""
         EndProperty
         BeginProperty ListImage45 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":F50D
            Key             =   ""
         EndProperty
         BeginProperty ListImage46 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":F710
            Key             =   ""
         EndProperty
         BeginProperty ListImage47 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":F949
            Key             =   ""
         EndProperty
         BeginProperty ListImage48 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":FB78
            Key             =   ""
         EndProperty
         BeginProperty ListImage49 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":FDD4
            Key             =   ""
         EndProperty
         BeginProperty ListImage50 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1001E
            Key             =   ""
         EndProperty
         BeginProperty ListImage51 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":10288
            Key             =   ""
         EndProperty
         BeginProperty ListImage52 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":104CB
            Key             =   ""
         EndProperty
         BeginProperty ListImage53 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1071F
            Key             =   ""
         EndProperty
         BeginProperty ListImage54 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":10961
            Key             =   ""
         EndProperty
         BeginProperty ListImage55 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":10BC9
            Key             =   ""
         EndProperty
         BeginProperty ListImage56 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":10E28
            Key             =   ""
         EndProperty
         BeginProperty ListImage57 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":11092
            Key             =   ""
         EndProperty
         BeginProperty ListImage58 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":112E0
            Key             =   ""
         EndProperty
         BeginProperty ListImage59 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1155F
            Key             =   ""
         EndProperty
         BeginProperty ListImage60 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":11794
            Key             =   ""
         EndProperty
         BeginProperty ListImage61 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":11A01
            Key             =   ""
         EndProperty
         BeginProperty ListImage62 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":11C18
            Key             =   ""
         EndProperty
         BeginProperty ListImage63 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":11E82
            Key             =   ""
         EndProperty
         BeginProperty ListImage64 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":120BC
            Key             =   ""
         EndProperty
         BeginProperty ListImage65 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":122E5
            Key             =   ""
         EndProperty
         BeginProperty ListImage66 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":12538
            Key             =   ""
         EndProperty
         BeginProperty ListImage67 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":12771
            Key             =   ""
         EndProperty
         BeginProperty ListImage68 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":129C7
            Key             =   ""
         EndProperty
         BeginProperty ListImage69 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":12C38
            Key             =   ""
         EndProperty
         BeginProperty ListImage70 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":12EA2
            Key             =   ""
         EndProperty
         BeginProperty ListImage71 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":130FA
            Key             =   ""
         EndProperty
         BeginProperty ListImage72 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1331F
            Key             =   ""
         EndProperty
         BeginProperty ListImage73 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":13572
            Key             =   ""
         EndProperty
         BeginProperty ListImage74 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":13795
            Key             =   ""
         EndProperty
         BeginProperty ListImage75 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":139FF
            Key             =   ""
         EndProperty
         BeginProperty ListImage76 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":13C3F
            Key             =   ""
         EndProperty
         BeginProperty ListImage77 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":13E84
            Key             =   ""
         EndProperty
         BeginProperty ListImage78 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":140D2
            Key             =   ""
         EndProperty
         BeginProperty ListImage79 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":14319
            Key             =   ""
         EndProperty
         BeginProperty ListImage80 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":14583
            Key             =   ""
         EndProperty
         BeginProperty ListImage81 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":147B6
            Key             =   ""
         EndProperty
         BeginProperty ListImage82 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":149FB
            Key             =   ""
         EndProperty
         BeginProperty ListImage83 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":14C37
            Key             =   ""
         EndProperty
         BeginProperty ListImage84 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":14EA3
            Key             =   ""
         EndProperty
         BeginProperty ListImage85 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1510D
            Key             =   ""
         EndProperty
         BeginProperty ListImage86 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":15354
            Key             =   ""
         EndProperty
         BeginProperty ListImage87 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1559C
            Key             =   ""
         EndProperty
         BeginProperty ListImage88 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":157C8
            Key             =   ""
         EndProperty
         BeginProperty ListImage89 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":159EF
            Key             =   ""
         EndProperty
         BeginProperty ListImage90 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":15C59
            Key             =   ""
         EndProperty
         BeginProperty ListImage91 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":15E5E
            Key             =   ""
         EndProperty
         BeginProperty ListImage92 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":16059
            Key             =   ""
         EndProperty
         BeginProperty ListImage93 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1629A
            Key             =   ""
         EndProperty
         BeginProperty ListImage94 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":164AA
            Key             =   ""
         EndProperty
         BeginProperty ListImage95 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":167BB
            Key             =   ""
         EndProperty
         BeginProperty ListImage96 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":16B01
            Key             =   ""
         EndProperty
         BeginProperty ListImage97 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":170D2
            Key             =   ""
         EndProperty
         BeginProperty ListImage98 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":176A2
            Key             =   ""
         EndProperty
         BeginProperty ListImage99 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":17C4D
            Key             =   ""
         EndProperty
         BeginProperty ListImage100 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":182E2
            Key             =   ""
         EndProperty
         BeginProperty ListImage101 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":18973
            Key             =   ""
         EndProperty
         BeginProperty ListImage102 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":19006
            Key             =   ""
         EndProperty
         BeginProperty ListImage103 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1956D
            Key             =   ""
         EndProperty
         BeginProperty ListImage104 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":19ADA
            Key             =   ""
         EndProperty
         BeginProperty ListImage105 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1A04C
            Key             =   ""
         EndProperty
         BeginProperty ListImage106 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1A5F3
            Key             =   ""
         EndProperty
         BeginProperty ListImage107 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1AB98
            Key             =   ""
         EndProperty
         BeginProperty ListImage108 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":1B145
            Key             =   ""
         EndProperty
         BeginProperty ListImage109 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":20E82
            Key             =   ""
         EndProperty
         BeginProperty ListImage110 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":26B47
            Key             =   ""
         EndProperty
         BeginProperty ListImage111 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":2C75F
            Key             =   ""
         EndProperty
         BeginProperty ListImage112 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":321F2
            Key             =   ""
         EndProperty
         BeginProperty ListImage113 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":37E23
            Key             =   ""
         EndProperty
         BeginProperty ListImage114 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":3DA41
            Key             =   ""
         EndProperty
         BeginProperty ListImage115 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":3DF1E
            Key             =   ""
         EndProperty
         BeginProperty ListImage116 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":3E4D3
            Key             =   ""
         EndProperty
         BeginProperty ListImage117 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":3EB97
            Key             =   ""
         EndProperty
         BeginProperty ListImage118 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":3F1D8
            Key             =   ""
         EndProperty
         BeginProperty ListImage119 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":3F807
            Key             =   ""
         EndProperty
         BeginProperty ListImage120 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":3FE1E
            Key             =   ""
         EndProperty
         BeginProperty ListImage121 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":40331
            Key             =   ""
         EndProperty
         BeginProperty ListImage122 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4096B
            Key             =   ""
         EndProperty
         BeginProperty ListImage123 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":40FA5
            Key             =   ""
         EndProperty
         BeginProperty ListImage124 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":415DF
            Key             =   ""
         EndProperty
         BeginProperty ListImage125 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":41C19
            Key             =   ""
         EndProperty
         BeginProperty ListImage126 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":42253
            Key             =   ""
         EndProperty
         BeginProperty ListImage127 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4288D
            Key             =   ""
         EndProperty
         BeginProperty ListImage128 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":42EC7
            Key             =   ""
         EndProperty
         BeginProperty ListImage129 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":43501
            Key             =   ""
         EndProperty
         BeginProperty ListImage130 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":43B3B
            Key             =   ""
         EndProperty
         BeginProperty ListImage131 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":44175
            Key             =   ""
         EndProperty
         BeginProperty ListImage132 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":447AF
            Key             =   ""
         EndProperty
         BeginProperty ListImage133 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":44951
            Key             =   ""
         EndProperty
         BeginProperty ListImage134 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":44F8B
            Key             =   ""
         EndProperty
         BeginProperty ListImage135 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":455C5
            Key             =   ""
         EndProperty
         BeginProperty ListImage136 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":45BFF
            Key             =   ""
         EndProperty
         BeginProperty ListImage137 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":46239
            Key             =   ""
         EndProperty
         BeginProperty ListImage138 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":46873
            Key             =   ""
         EndProperty
         BeginProperty ListImage139 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":46EAD
            Key             =   ""
         EndProperty
         BeginProperty ListImage140 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":474E7
            Key             =   ""
         EndProperty
         BeginProperty ListImage141 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":47B21
            Key             =   ""
         EndProperty
         BeginProperty ListImage142 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4815B
            Key             =   ""
         EndProperty
         BeginProperty ListImage143 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":48795
            Key             =   ""
         EndProperty
         BeginProperty ListImage144 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":48DCF
            Key             =   ""
         EndProperty
         BeginProperty ListImage145 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":49409
            Key             =   ""
         EndProperty
         BeginProperty ListImage146 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":49A43
            Key             =   ""
         EndProperty
         BeginProperty ListImage147 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":49CFD
            Key             =   ""
         EndProperty
         BeginProperty ListImage148 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":49FCF
            Key             =   ""
         EndProperty
         BeginProperty ListImage149 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4A2A1
            Key             =   ""
         EndProperty
         BeginProperty ListImage150 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4A54B
            Key             =   ""
         EndProperty
         BeginProperty ListImage151 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4A83D
            Key             =   ""
         EndProperty
         BeginProperty ListImage152 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4AB43
            Key             =   ""
         EndProperty
         BeginProperty ListImage153 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4AE49
            Key             =   ""
         EndProperty
         BeginProperty ListImage154 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4B0FB
            Key             =   ""
         EndProperty
         BeginProperty ListImage155 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4B3CD
            Key             =   ""
         EndProperty
         BeginProperty ListImage156 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4B6B7
            Key             =   ""
         EndProperty
         BeginProperty ListImage157 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4B9A1
            Key             =   ""
         EndProperty
         BeginProperty ListImage158 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmChat.frx":4BC4B
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Timer tmrScript 
      Enabled         =   0   'False
      Index           =   0
      Left            =   720
      Top             =   600
   End
   Begin VB.Timer tmrSilentChannel 
      Enabled         =   0   'False
      Index           =   1
      Interval        =   30000
      Left            =   5760
      Top             =   4560
   End
   Begin VB.Timer tmrSilentChannel 
      Enabled         =   0   'False
      Index           =   0
      Interval        =   500
      Left            =   6240
      Top             =   4080
   End
   Begin VB.ComboBox cboSend 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   600
      TabIndex        =   7
      Top             =   6600
      Width           =   7695
   End
   Begin VB.TextBox txtPost 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   8280
      TabIndex        =   9
      Top             =   6600
      Width           =   615
   End
   Begin VB.TextBox txtPre 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   0
      TabIndex        =   8
      Top             =   6600
      Width           =   615
   End
   Begin TabDlg.SSTab ListviewTabs 
      Height          =   375
      Left            =   8880
      TabIndex        =   0
      Top             =   6600
      Width           =   3705
      _ExtentX        =   6535
      _ExtentY        =   661
      _Version        =   393216
      TabOrientation  =   1
      Style           =   1
      Tab             =   1
      TabHeight       =   520
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "Channel  "
      TabPicture(0)   =   "frmChat.frx":4BED9
      Tab(0).ControlEnabled=   0   'False
      Tab(0).ControlCount=   0
      TabCaption(1)   =   "Friends  "
      TabPicture(1)   =   "frmChat.frx":4BEF5
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).ControlCount=   0
      TabCaption(2)   =   "Clan  "
      TabPicture(2)   =   "frmChat.frx":4BF11
      Tab(2).ControlEnabled=   0   'False
      Tab(2).ControlCount=   0
   End
   Begin VB.Timer tmrIdleTimer 
      Interval        =   1000
      Left            =   7200
      Top             =   4560
   End
   Begin VB.CommandButton cmdShowHide 
      Caption         =   " ^^^^"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   5.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   12360
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   6600
      Width           =   245
   End
   Begin MSWinsockLib.Winsock sckMCP 
      Left            =   5280
      Top             =   2760
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Timer scTimer 
      Enabled         =   0   'False
      Left            =   1200
      Top             =   600
   End
   Begin InetCtlsObjects.Inet INet 
      Left            =   5280
      Top             =   3360
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      RequestTimeout  =   7
   End
   Begin MSWinsockLib.Winsock sckBNLS 
      Left            =   5760
      Top             =   2760
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemotePort      =   9367
   End
   Begin MSWinsockLib.Winsock sckBNet 
      Left            =   6240
      Top             =   2760
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemotePort      =   6112
   End
   Begin VB.Timer UpTimer 
      Left            =   6720
      Top             =   4080
   End
   Begin MSComctlLib.ListView lvClanList 
      Height          =   6375
      Left            =   8880
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   240
      Width           =   3705
      _ExtentX        =   6535
      _ExtentY        =   11245
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   0   'False
      HideSelection   =   -1  'True
      HideColumnHeaders=   -1  'True
      OLEDragMode     =   1
      _Version        =   393217
      SmallIcons      =   "imlIcons"
      ForeColor       =   10079232
      BackColor       =   0
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OLEDragMode     =   1
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Width           =   4057
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   1
         SubItemIndex    =   2
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Object.Width           =   88
      EndProperty
   End
   Begin MSComctlLib.ListView lvFriendList 
      Height          =   6375
      Left            =   8880
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   240
      Width           =   3705
      _ExtentX        =   6535
      _ExtentY        =   11245
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   0   'False
      HideSelection   =   -1  'True
      HideColumnHeaders=   -1  'True
      OLEDragMode     =   1
      _Version        =   393217
      Icons           =   "imlIcons"
      SmallIcons      =   "imlIcons"
      ForeColor       =   10079232
      BackColor       =   0
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OLEDragMode     =   1
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Width           =   4057
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   1
         SubItemIndex    =   1
         Object.Width           =   88
      EndProperty
   End
   Begin RichTextLib.RichTextBox rtbWhispers 
      Height          =   1695
      Left            =   0
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   6960
      Width           =   12375
      _ExtentX        =   21828
      _ExtentY        =   2990
      _Version        =   393217
      BackColor       =   0
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      AutoVerbMenu    =   -1  'True
      TextRTF         =   $"frmChat.frx":4BF2D
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin RichTextLib.RichTextBox rtbChat 
      Height          =   6615
      Left            =   0
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   0
      Width           =   8895
      _ExtentX        =   15690
      _ExtentY        =   11668
      _Version        =   393217
      BackColor       =   0
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      AutoVerbMenu    =   -1  'True
      OLEDropMode     =   0
      TextRTF         =   $"frmChat.frx":4BFA8
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblCurrentChannel 
      Alignment       =   2  'Center
      BackColor       =   &H00CC3300&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8880
      TabIndex        =   10
      Top             =   0
      Width           =   3698
   End
   Begin VB.Menu mnuBot 
      Caption         =   "&Bot"
      Begin VB.Menu mnuConnect2 
         Caption         =   "&Connect"
      End
      Begin VB.Menu mnuDisconnect2 
         Caption         =   "&Disconnect"
      End
      Begin VB.Menu mnuSepT 
         Caption         =   "-"
      End
      Begin VB.Menu mnuUsers 
         Caption         =   "&User Database Manager..."
      End
      Begin VB.Menu mnuCommandManager 
         Caption         =   "Command &Manager..."
      End
      Begin VB.Menu mnuScriptManager 
         Caption         =   "&Script Settings Manager..."
         Visible         =   0   'False
      End
      Begin VB.Menu mnuSepTabcd 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGetNews 
         Caption         =   "Get &News and Check for Updates"
      End
      Begin VB.Menu mnuUpdateVerbytes 
         Caption         =   "Update &Version Bytes"
      End
      Begin VB.Menu mnuSepZ 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRealmSwitch 
         Caption         =   "Switch &Realm Character..."
         Visible         =   0   'False
      End
      Begin VB.Menu mnuIgnoreInvites 
         Caption         =   "&Ignore Clan Invitations"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuQCTop 
         Caption         =   "Channel &List"
         Begin VB.Menu mnuHomeChannel 
            Caption         =   "&Bot Home"
            Visible         =   0   'False
         End
         Begin VB.Menu mnuLastChannel 
            Caption         =   "&Last Channel"
            Visible         =   0   'False
         End
         Begin VB.Menu mnuQCDash 
            Caption         =   "-"
            Visible         =   0   'False
         End
         Begin VB.Menu mnuQCHeader 
            Caption         =   "- QuickChannels -"
            Enabled         =   0   'False
         End
         Begin VB.Menu mnuCustomChannels 
            Caption         =   ""
            Index           =   0
            Shortcut        =   {F1}
         End
         Begin VB.Menu mnuCustomChannels 
            Caption         =   ""
            Index           =   1
            Shortcut        =   {F2}
         End
         Begin VB.Menu mnuCustomChannels 
            Caption         =   ""
            Index           =   2
            Shortcut        =   {F3}
         End
         Begin VB.Menu mnuCustomChannels 
            Caption         =   ""
            Index           =   3
            Shortcut        =   {F4}
         End
         Begin VB.Menu mnuCustomChannels 
            Caption         =   ""
            Index           =   4
            Shortcut        =   {F5}
         End
         Begin VB.Menu mnuCustomChannels 
            Caption         =   ""
            Index           =   5
            Shortcut        =   {F6}
         End
         Begin VB.Menu mnuCustomChannels 
            Caption         =   ""
            Index           =   6
            Shortcut        =   {F7}
         End
         Begin VB.Menu mnuCustomChannels 
            Caption         =   ""
            Index           =   7
            Shortcut        =   {F8}
         End
         Begin VB.Menu mnuCustomChannels 
            Caption         =   ""
            Index           =   8
            Shortcut        =   {F9}
         End
         Begin VB.Menu mnuCustomChannelAdd 
            Caption         =   "&Add QuickChannel"
            Visible         =   0   'False
         End
         Begin VB.Menu mnuCustomChannelEdit 
            Caption         =   "&Edit QuickChannels..."
         End
         Begin VB.Menu mnuPCDash 
            Caption         =   "-"
         End
         Begin VB.Menu mnuPCHeader 
            Caption         =   "- Public Channels -"
            Enabled         =   0   'False
         End
         Begin VB.Menu mnuPublicChannels 
            Caption         =   ""
            Index           =   0
         End
      End
      Begin VB.Menu mnuSep5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditCaught 
         Caption         =   "View Caught P&hrases..."
      End
      Begin VB.Menu mnuFiles 
         Caption         =   "View &Files"
         Begin VB.Menu mnuOpenBotFolder 
            Caption         =   "Open Bot &Folder"
         End
         Begin VB.Menu mnuSepA 
            Caption         =   "-"
         End
         Begin VB.Menu mnuClearedTxt 
            Caption         =   "Current Text &Log"
         End
         Begin VB.Menu mnuWhisperCleared 
            Caption         =   "&Whisper Window Text Log"
         End
      End
      Begin VB.Menu mnuSettingsRepair 
         Caption         =   "&Tools"
         Begin VB.Menu mnuToolsMenuWarning 
            Caption         =   "- Use Carefully -"
            Enabled         =   0   'False
         End
         Begin VB.Menu mnuRepairDataFiles 
            Caption         =   "Delete &Data Files"
         End
         Begin VB.Menu mnuRepairVerbytes 
            Caption         =   "Restore Default &Version Bytes"
         End
         Begin VB.Menu mnuRepairCleanMail 
            Caption         =   "Clean Up &Mail Database"
         End
         Begin VB.Menu mnuPacketLog 
            Caption         =   "Log StealthBot &Packet Traffic"
         End
      End
      Begin VB.Menu mnuSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuSetTop 
      Caption         =   "&Settings"
      Begin VB.Menu mnuSetup 
         Caption         =   "&Bot Settings..."
         Shortcut        =   ^P
      End
      Begin VB.Menu mnuUTF8 
         Caption         =   "Use &UTF-8 in Chat"
      End
      Begin VB.Menu mnuLogging 
         Caption         =   "&Logging Settings"
         Begin VB.Menu mnuLog0 
            Caption         =   "Full Text Logging"
         End
         Begin VB.Menu mnuLog1 
            Caption         =   "Temporary Logging"
         End
         Begin VB.Menu mnuLog2 
            Caption         =   "No Logging"
         End
      End
      Begin VB.Menu mnuSep4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuProfile 
         Caption         =   "Edit &Profile..."
      End
      Begin VB.Menu mnuFilters 
         Caption         =   "&Edit Chat Filters..."
      End
      Begin VB.Menu mnuCatchPhrases 
         Caption         =   "Edit &Catch Phrases..."
      End
      Begin VB.Menu mnuSep6 
         Caption         =   "-"
      End
      Begin VB.Menu mnuReload 
         Caption         =   "&Reload Config"
      End
   End
   Begin VB.Menu mnuConnect 
      Caption         =   "&Connect"
   End
   Begin VB.Menu mnuDisconnect 
      Caption         =   "&Disconnect"
   End
   Begin VB.Menu mnuWindow 
      Caption         =   "&Window"
      Begin VB.Menu mnuToggle 
         Caption         =   "Hide &Join/Leave Messages"
         Shortcut        =   ^J
      End
      Begin VB.Menu mnuHideBans 
         Caption         =   "Hide &Ban Messages"
         Shortcut        =   ^H
      End
      Begin VB.Menu mnuLock 
         Caption         =   "Loc&k Chat Window"
         Shortcut        =   ^L
      End
      Begin VB.Menu mnuToggleFilters 
         Caption         =   "Use Chat &Filtering"
         Checked         =   -1  'True
         Shortcut        =   ^F
      End
      Begin VB.Menu mnuSep7 
         Caption         =   "-"
      End
      Begin VB.Menu mnuToggleWWUse 
         Caption         =   "Use Individual &Whisper Windows"
      End
      Begin VB.Menu mnuSP3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuToggleShowOutgoing 
         Caption         =   "Show &Outgoing Whispers in Whisper Box"
      End
      Begin VB.Menu mnuHideWhispersInrtbChat 
         Caption         =   "&Hide Whispers in Main Window"
      End
      Begin VB.Menu mnuSepC 
         Caption         =   "-"
      End
      Begin VB.Menu mnuClear 
         Caption         =   "&Clear Chat Window"
         Shortcut        =   +{DEL}
      End
      Begin VB.Menu mnuClearWW 
         Caption         =   "Cl&ear Whisper Window"
      End
      Begin VB.Menu mnuSepD 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFlash 
         Caption         =   "Fl&ash Window on Events"
      End
      Begin VB.Menu mnuDisableVoidView 
         Caption         =   "Disable &Silent Channel View"
      End
      Begin VB.Menu mnuRecordWindowPos 
         Caption         =   "&Record Current Position"
      End
   End
   Begin VB.Menu mnuTray 
      Caption         =   "systray"
      Visible         =   0   'False
      Begin VB.Menu mnuTrayCaption 
         Caption         =   ""
      End
      Begin VB.Menu mnuRestore 
         Caption         =   "&Restore"
      End
      Begin VB.Menu mnuTraySep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuTrayExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "popupmenu"
      Visible         =   0   'False
      Begin VB.Menu mnuPopWhisper 
         Caption         =   "W&hisper"
      End
      Begin VB.Menu mnuPopCopy 
         Caption         =   "&Copy Name to Clipboard"
      End
      Begin VB.Menu mnuPopAddLeft 
         Caption         =   "Add to &Left Send Box"
      End
      Begin VB.Menu mnuPopAddToFList 
         Caption         =   "Add to &Friends List"
      End
      Begin VB.Menu mnuPopInvite 
         Caption         =   "&Invite to Warcraft III Clan"
      End
      Begin VB.Menu mnuPopShitlist 
         Caption         =   "Shi&tlist"
      End
      Begin VB.Menu mnuPopSafelist 
         Caption         =   "S&afelist"
      End
      Begin VB.Menu mnuPopSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPopUserlistWhois 
         Caption         =   "&Userlist Whois"
      End
      Begin VB.Menu mnuPopWhois 
         Caption         =   "Battle.net &Whois"
      End
      Begin VB.Menu mnuPopStats 
         Caption         =   "Battle.net &Stats"
      End
      Begin VB.Menu mnuPopProfile 
         Caption         =   "Battle.net &Profile"
      End
      Begin VB.Menu mnuPopWebProfile 
         Caption         =   "W&eb Profile"
      End
      Begin VB.Menu mnuPopSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPopKick 
         Caption         =   "&Kick"
      End
      Begin VB.Menu mnuPopBan 
         Caption         =   "&Ban"
      End
      Begin VB.Menu mnuPopSquelch 
         Caption         =   "S&quelch"
      End
      Begin VB.Menu mnuPopUnsquelch 
         Caption         =   "U&nsquelch"
      End
      Begin VB.Menu mnuPopDes 
         Caption         =   "&Designate"
      End
   End
   Begin VB.Menu mnuScripting 
      Caption         =   "Sc&ripting"
      Begin VB.Menu mnuReloadScripts 
         Caption         =   "Reload Scripts"
         Shortcut        =   ^R
      End
      Begin VB.Menu mnuOpenScriptFolder 
         Caption         =   "Open Script Folder"
      End
      Begin VB.Menu mnuScriptingDash 
         Caption         =   "-"
         Index           =   0
         Visible         =   0   'False
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      NegotiatePosition=   3  'Right
      Begin VB.Menu mnuAbout 
         Caption         =   "&About..."
      End
      Begin VB.Menu mnuHelpReadme 
         Caption         =   "&Wiki"
      End
      Begin VB.Menu mnuHelpWebsite 
         Caption         =   "&Forum"
      End
      Begin VB.Menu mnuTerms 
         Caption         =   "&End-User License Agreement"
      End
      Begin VB.Menu mnuChangeLog 
         Caption         =   "&Change Log"
      End
   End
   Begin VB.Menu mnuShortcuts 
      Caption         =   "invisibleMenu"
      Visible         =   0   'False
      Begin VB.Menu mnuItalic 
         Caption         =   "Italic"
         Shortcut        =   ^I
      End
      Begin VB.Menu mnuBold 
         Caption         =   "Bold"
         Shortcut        =   ^B
      End
      Begin VB.Menu mnuUnderline 
         Caption         =   "Underline"
         Shortcut        =   ^U
      End
      Begin VB.Menu mnuListViewButton 
         Caption         =   "invisible CTRL+A Channel"
         Index           =   0
         Shortcut        =   ^A
         Visible         =   0   'False
      End
      Begin VB.Menu mnuListViewButton 
         Caption         =   "invisible CTRL+S Friends"
         Index           =   1
         Shortcut        =   ^S
         Visible         =   0   'False
      End
      Begin VB.Menu mnuListViewButton 
         Caption         =   "invisible CTRL+D Clan"
         Index           =   2
         Shortcut        =   ^D
         Visible         =   0   'False
      End
   End
   Begin VB.Menu mnuPopClanList 
      Caption         =   "clanlist popup menu"
      Visible         =   0   'False
      Begin VB.Menu mnuPopClanWhisper 
         Caption         =   "W&hisper"
      End
      Begin VB.Menu mnuPopClanCopy 
         Caption         =   "&Copy Name to Clipboard"
      End
      Begin VB.Menu mnuPopClanAddLeft 
         Caption         =   "Add to &Left Send Box"
      End
      Begin VB.Menu mnuPopClanAddToFList 
         Caption         =   "Add to &Friends List"
      End
      Begin VB.Menu mnuPopClanSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPopClanUserlistWhois 
         Caption         =   "&Userlist Whois"
      End
      Begin VB.Menu mnuPopClanWhois 
         Caption         =   "Battle.net &Whois"
      End
      Begin VB.Menu mnuPopClanStats 
         Caption         =   "Battle.net &Stats"
         Begin VB.Menu mnuPopClanStatsWAR3 
            Caption         =   "&Reign of Chaos"
         End
         Begin VB.Menu mnuPopClanStatsW3XP 
            Caption         =   "The &Frozen Throne"
         End
      End
      Begin VB.Menu mnuPopClanProfile 
         Caption         =   "&Battle.net Profile"
      End
      Begin VB.Menu mnuPopClanWebProfile 
         Caption         =   "W&eb Profile"
         Begin VB.Menu mnuPopClanWebProfileWAR3 
            Caption         =   "&Reign of Chaos"
         End
         Begin VB.Menu mnuPopClanWebProfileW3XP 
            Caption         =   "The &Frozen Throne"
         End
      End
      Begin VB.Menu mnuPopClanSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPopClanPromote 
         Caption         =   "&Promote"
      End
      Begin VB.Menu mnuPopClanDemote 
         Caption         =   "&Demote"
      End
      Begin VB.Menu mnuPopClanRemove 
         Caption         =   "Remove from Clan"
      End
      Begin VB.Menu mnuPopClanLeave 
         Caption         =   "Leave Clan"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuPopClanMakeChief 
         Caption         =   "Make Chieftain"
      End
      Begin VB.Menu mnuPopClanDisband 
         Caption         =   "Disband Clan"
      End
   End
   Begin VB.Menu mnuPopFList 
      Caption         =   "flistpopup"
      Visible         =   0   'False
      Begin VB.Menu mnuPopFLWhisper 
         Caption         =   "W&hisper"
      End
      Begin VB.Menu mnuPopFLCopy 
         Caption         =   "&Copy Name to Clipboard"
      End
      Begin VB.Menu mnuPopFLAddLeft 
         Caption         =   "Add to &Left Send Box"
      End
      Begin VB.Menu mnuPopFLInvite 
         Caption         =   "&Invite to Warcraft III Clan"
      End
      Begin VB.Menu mnuPopFLSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPopFLUserlistWhois 
         Caption         =   "&Userlist Whois"
      End
      Begin VB.Menu mnuPopFLWhois 
         Caption         =   "Battle.net &Whois"
      End
      Begin VB.Menu mnuPopFLStats 
         Caption         =   "Battle.net &Stats"
      End
      Begin VB.Menu mnuPopFLProfile 
         Caption         =   "&Battle.net Profile"
      End
      Begin VB.Menu mnuPopFLWebProfile 
         Caption         =   "W&eb Profile"
      End
      Begin VB.Menu mnuPopFLSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPopFLPromote 
         Caption         =   "&Promote"
      End
      Begin VB.Menu mnuPopFLDemote 
         Caption         =   "&Demote"
      End
      Begin VB.Menu mnuPopFLRemove 
         Caption         =   "&Remove"
      End
      Begin VB.Menu mnuPopFLSep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPopFLRefresh 
         Caption         =   "Refresh and Reorder"
      End
   End
End
Attribute VB_Name = "frmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'StealthBot 11/5/02-Present
'Source Code Version: 2.7RC2
Option Explicit

'REVISION #1337!

'Classes
Public WithEvents ClanHandler As clsClanPacketHandler
Attribute ClanHandler.VB_VarHelpID = -1
Public WithEvents FriendListHandler As clsFriendlistHandler
Attribute FriendListHandler.VB_VarHelpID = -1

'Variables
Private m_lCurItemIndex As Long
Private MultiLinePaste As Boolean
Private doAuth As Boolean
Private AUTH_CHECKED As Boolean

'Forms
Public SettingsForm As frmSettings
Public ChatNoScroll As Boolean

Private Const HKEY_LOCAL_MACHINE = &H80000002
Private Const REG_SZ = 1
Private Const WM_USER = 1024
Private Const CB_LIMITTEXT = &H141
Private Const SB_BOTTOM = 7
Private Const EM_SCROLL = &HB5

Private Type sockaddr_in
    sin_family As Integer
    sin_port As Integer
    sin_addr As String * 4
    sin_zero As String * 8
End Type

Private Const SB_INET_UNSET As String = vbNullString
Private Const SB_INET_NEWS1 As String = "SBNEWS_AUTOCONNECT"
Private Const SB_INET_NEWS  As String = "SBNEWS"
Private Const SB_INET_BNLS1 As String = "BNLSFINDER"
Private Const SB_INET_BNLS2 As String = "BNLSFINDER_DEFAULT"
Private Const SB_INET_VBYTE As String = "VERBYTE"
Private Const SB_INET_BETA  As String = "AUTHBETA"

' LET IT BEGIN
Private Sub Form_Load()
    Dim s As String
    Dim f As Integer
    Dim L As Long
    Dim FrmSplashInUse As Boolean
    Dim strBeta As String
    Dim sStr() As String
    
    ' COMPILER FLAGS
    #If (BETA = 1) Then
        CVERSION = StringFormat("StealthBot Beta v{0}.{1} - Build {2}", App.Major, App.Minor, App.REVISION)
    #Else
        CVERSION = StringFormat("StealthBot v{0}.{1}.{2}", App.Major, App.Minor, App.REVISION)
    #End If
    
    #If (COMPILE_DEBUG = 1) Then
        CVERSION = StringFormat("{0} - DEBUG", CVERSION)
    #End If
    
    #If (COMPILE_CRC = 1) Then
        Dim crc As New clsCRC32
        If (Not crc.ValidateExecutable) Then
            MsgBox GetHexProtectionMessage, vbOKOnly + vbCritical
            Call Form_Unload(0)
            Unload frmChat
            Exit Sub
        End If
        Set crc = Nothing
    #End If

    #If (COMPILE_DEBUG = 0) Then
        HookWindowProc frmChat.hWnd
    #End If
    
    SendMessage frmChat.cboSend.hWnd, CB_LIMITTEXT, 0, 0
    
    Set colWhisperWindows = New Collection
    Set colLastSeen = New Collection
    Set GErrorHandler = New clsErrorHandler
    Set BotVars = New clsBotVars
    
    sStr = SetCommandLine(Command())
    
    ' EVERYTHING ELSE
    rtbWhispers.Visible = False 'default
    rtbWhispersVisible = False

    'Set dictTimerInterval = New Dictionary
    'Set dictTimerEnabled = New Dictionary
    'Set dictTimerCount = New Dictionary
    'dictTimerInterval.CompareMode = TextCompare
    'dictTimerEnabled.CompareMode = TextCompare
    'dictTimerCount.CompareMode = TextCompare
    
    With mnuTrayCaption
        .Caption = CVERSION
        .Enabled = False
    End With
    
    mail = True
    f = FreeFile
    
    With rtbChat
        .Font.Size = 8
        .SelTabCount = 1
        .SelTabs(0) = 15 * Screen.TwipsPerPixelX
        .SelHangingIndent = .SelTabs(0)
    End With
    
    With rtbWhispers
        .Font.Size = 8
        .SelTabCount = 1
        .SelTabs(0) = 15 * Screen.TwipsPerPixelX
        .SelHangingIndent = .SelTabs(0)
    End With
        
    lvChannel.View = lvwReport
    lvChannel.Icons = imlIcons
    lvClanList.View = lvwReport
    lvClanList.Icons = imlIcons
    
    ReDim Phrases(0)
    ReDim Catch(0)
    ReDim gBans(0)
    ReDim gOutFilters(0)
    ReDim gFilters(0)
    
    Call BuildProductInfo
    
    Set Config = New clsConfig
    Config.Load GetConfigFilePath()
    
    ' SPLASH SCREEN
    If Config.ShowSplashScreen Then
        frmSplash.Show
        FrmSplashInUse = True
    End If
    
    If Config.ShowWhisperBox Then
        If Not rtbWhispersVisible Then Call cmdShowHide_Click
    Else
        If rtbWhispersVisible Then Call cmdShowHide_Click
    End If
    
    If Config.PositionHeight > 0 Then
        L = (IIf(CLng(Config.PositionHeight) < 200, 200, CLng(Config.PositionHeight)) * Screen.TwipsPerPixelY)
        
        If (rtbWhispersVisible) Then
            L = L - (rtbWhispers.Height / Screen.TwipsPerPixelY)
        End If
        
        Me.Height = L
    End If
    
    If Config.PositionWidth > 0 Then
        Me.Width = (IIf(CLng(Config.PositionWidth) < 300, 300, CLng(Config.PositionWidth)) * Screen.TwipsPerPixelX)
    End If

    'Set window position
    Me.Left = CLng(Config.PositionLeft) * Screen.TwipsPerPixelX
    Me.Top = CLng(Config.PositionTop) * Screen.TwipsPerPixelY

    'Make sure the window is on the screen
    If Config.EnforceScreenBounds Then
        If Config.MonitorCount <> GetMonitorCount Then
            If (Me.Left > (Screen.Width - Me.Width)) Then
                Me.Left = (Screen.Width - Me.Width)
            End If
    
            If (Me.Top > (Screen.Height - Me.Height)) Then
                Me.Top = (Screen.Height - Me.Height)
            End If
            
            Config.MonitorCount = GetMonitorCount
        End If
    End If
    
    'Support for recording maxmized position. - FrOzeN
    If Config.IsMaximized Then
        Me.WindowState = vbMaximized
    End If

    Set ClanHandler = New clsClanPacketHandler
    Set FriendListHandler = New clsFriendlistHandler
    Set ListToolTip = New clsCTooltip
    
    Call ReloadConfig
    
    Call Form_Resize
    
    Call GetColorLists
    Call InitListviewTabs
    Call DisableListviewTabs
    
    ListviewTabs.Tab = 0
    
    With ListToolTip
        .Style = TTStandard
        .Icon = TTNoIcon
        .DelayTime = 100
    End With
    
    Call ClearChannel

    With lvClanList
        .View = lvwReport
        .SmallIcons = imlClan
        .ColumnHeaders(1).Width = (.Width \ 4) * 3 - 150
        .ColumnHeaders(2).Width = .Width \ 4 + 200
        .ColumnHeaders(3).Width = 0
    End With
    
    frmChat.KeyPreview = True
    SetTitle "Disconnected"
    
    frmChat.UpdateTrayTooltip
    
    Me.Show
    Me.Refresh
    Me.AutoRedraw = True
    
    AddChat RTBColors.ConsoleText, "-> Welcome to " & CVERSION & ", by Stealth."
    AddChat RTBColors.ConsoleText, "-> If you enjoy StealthBot, consider supporting its development at http://donate.stealthbot.net"

    Dim x As Integer
    For x = LBound(sStr) To UBound(sStr)
        If (LenB(sStr(x)) > 0) Then
            AddChat RTBColors.InformationText, sStr(x)
        End If
    Next x
    
    On Error Resume Next
    
    VoteDuration = -1
    
    If (LenB(Dir$(GetConfigFilePath())) = 0) Then
        AddChat RTBColors.ServerInfoText, "If you're new to bots, start by choosing 'Bot Settings' " & _
            "under the 'Settings' menu above."
        AddChat RTBColors.ServerInfoText, "For more help, click the 'Step-By-Step Configuration' " & _
            "button inside Settings."
        AddChat RTBColors.ServerInfoText, "For more information and a list of commands, see the " & _
            "Readme by clicking 'Readme' under the 'Help' menu."
        AddChat RTBColors.ServerInfoText, "Please note that any usage of this program is subject to " & _
            "the terms of the End-User License Agreement available at http://eula.stealthbot.net."
    End If
    
    
    Randomize
 
    ID_TASKBARICON = (Rnd * 100)
    
    TASKBARCREATED_MSGID = RegisterWindowMessage("TaskbarCreated")
    
    cboSend.SetFocus
    
    LoadQuickChannels
    InitScriptControl SControl
    
    On Error Resume Next
    'News call and scripting events
    
    LoadScripts
    'InitMenus
    InitScripts
    
    If FrmSplashInUse Then frmSplash.SetFocus
    
    If Not MDebug("debug") Then
        mnuRecordWindowPos.Visible = False
    End If
    
    'Update the config if it's an old version
    If Config.Version < CONFIG_VERSION Then
        Call Config.Save
    End If
    
    #If COMPILE_DEBUG = 0 Then
        If Config.MinimizeOnStartup Then
            frmChat.WindowState = vbMinimized
            Call Form_Resize
        End If
    #End If
    
    If Not Config.DisableNews Then
        Call RequestINetPage(GetNewsURL(), SB_INET_NEWS1, True)
    ElseIf Config.AutoConnect Then
        Call DoConnect
    End If
    
    'Now loads scripts when the bot opens, instead of after connecting. - FrOzeN
    'RunInAll "Event_Load"
    
    'Dim I As Integer
    'Dim tmp As String
    'Dim str As String
    
    'str = "flood"
    
    'For I = 1 To Len(str)
    '   tmp = tmp & Hex(Asc(Mid(str, I, 1)))
    'Next I

'    BotVars.UseProxy = True
'    BotVars.ProxyIP = "213.210.194.139"
'    BotVars.ProxyPort = 1080
    'BotVars.ProxyIsSocks5 = True

    lvFriendList.ColumnHeaders(2).Width = imlIcons.ImageWidth
    lvClanList.ColumnHeaders(2).Width = imlClan.ImageWidth
End Sub

Public Sub cacheTimer_Timer()
    ' this code updated 7/23/05 in Chihuahua, Chihuahua, MX
    If (Caching) Then ' time to retrieve stored information and squelch or ban a channel
        Dim strArray() As String
        Dim ret As String
        Dim lPos As Long
        Dim y As String
        Dim c As Integer, n As Integer
        
        Caching = False
        
        ' Changed 08-18-09 - Hdx - Uses the new Channel cache function, Eventually to beremoved to script
        'ret = CacheChannelList(vbNullString, 0, Y)
        ret = CacheChannelList(enRetrieve, y)
        
        lPos = InStr(1, ret, ", ", vbBinaryCompare)
        
        If (lPos) Then
            strArray() = Split(ret, ", ")
        Else
            ReDim Preserve strArray(0)
            strArray(0) = ret
        End If
        
        For c = 0 To UBound(strArray)
            ' [CHANNELOP]  -  [*CHANNELOP]  -  [CHARACTER@USEast (*CHANNELOP)]
            If StrComp(UCase(strArray(c)), strArray(c), vbBinaryCompare) = 0 Then
                If Left$(strArray(c), 1) = "[" And Right$(strArray(c), 1) = "]" Then
                    strArray(c) = Mid(strArray(c), 2, Len(strArray(c)) - 2)
                End If
            End If
            
            strArray(c) = ConvertUsername(CleanUsername(strArray(c)))
            
            'AddChat vbRed, strArray(C)
            
            If Len(strArray(c)) > 1 Then
                If InStr(y, "ban") Then
                    If (g_Channel.Self.IsOperator) Then
                        Ban strArray(c), (AutoModSafelistValue - 1), 0
                    End If
                Else
                    If (GetSafelist(strArray(c)) = False) Then
                        AddQ "/squelch " & strArray(c)
                    End If
                End If
            End If
        Next c
    End If
    
    cacheTimer.Enabled = False
End Sub

Private Sub ChatQueueTimer_Timer()
    modChatQueue.ChatQueueTimerProc
End Sub

Private Sub Form_GotFocus()
    On Error GoTo ERROR_HANDLER

    If (cboSendHadFocus) Then
        cboSend.SetFocus
    End If
    
    Exit Sub
    
ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, "Error (#" & Err.Number & "): " & Err.Description & " in Form_GotFocus()."

    Exit Sub
End Sub

' asynchronous INet
Private Function RequestINetPage(ByVal URL As String, ByVal Request As String, ByVal CancelStillExecuting As Boolean) As Boolean
    On Error GoTo ERROR_HANDLER:

    Dim ret As String
    With INet
        If .StillExecuting Then
            If CancelStillExecuting Then
                .Cancel
            Else
                RequestINetPage = False
                
                Exit Function
            End If
        End If
        
        .RequestTimeout = 5
        .Tag = Request
        .Execute URL
        
        RequestINetPage = True
    End With
    
    Exit Function
    
ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, "Error (#" & Err.Number & "): " & Err.Description & " in RequestINetPage()."
    
    RequestINetPage = False
    
    Exit Function
End Function

' asynchronous INet response
Private Sub INet_StateChanged(ByVal State As Integer)
    Dim strData As String
    Dim Buffer As String
    
    Select Case State
        Case icResponseCompleted, icError
            If INet.ResponseCode >= 1000 Then
                Buffer = "INet Error #" & INet.ResponseCode & ": " & INet.ResponseInfo
            ElseIf INet.ResponseCode <> 0 Then
                Buffer = "HTTP Error " & INet.ResponseCode & " " & INet.ResponseInfo
            Else
                Do
                    strData = INet.GetChunk(1024, icString)
                    If Len(strData) = 0 Then Exit Do
                    Buffer = Buffer & strData
                Loop
                
                If LenB(Buffer) = 0 Then
                    Buffer = "Empty response"
                End If
            End If
            
            Select Case INet.Tag
                Case SB_INET_NEWS
                    Call HandleNews(Buffer, INet.ResponseCode)
                Case SB_INET_NEWS1
                    Call HandleNews(Buffer, INet.ResponseCode)
                    If Config.AutoConnect And Not g_Connected Then
                        Call DoConnect
                    End If
                Case SB_INET_VBYTE
                    Call HandleUpdateVerbyte(Buffer, INet.ResponseCode)
                Case SB_INET_BNLS1
                    Call HandleFindBNLSServerListResult(Buffer, INet.ResponseCode, True)
                Case SB_INET_BNLS2
                    Call HandleFindBNLSServerListResult(Buffer, INet.ResponseCode, False)
            End Select
            
            INet.Tag = SB_INET_UNSET
            INet.Cancel
    End Select
End Sub

Private Sub HandleUpdateVerbyte(ByVal Buffer As String, ByVal ResponseCode As Long)
    On Error Resume Next
    
    Dim ary() As String
    Dim i As Integer
    
    If INet.ResponseCode <> 0 Then
        AddChat RTBColors.ErrorMessageText, Buffer & ". Error retrieving version bytes from http://www.stealthbot.net. Please visit it for instructions."
    ElseIf Len(Buffer) <> 11 Then
        AddChat RTBColors.ErrorMessageText, "Format not understood. Error retrieving version bytes from http://www.stealthbot.net. Please visit it for instructions."
    Else
        'W2 SC D2 W3
        Dim keys(3) As String
        
        keys(0) = "W2"
        keys(1) = "SC"
        keys(2) = "D2"
        keys(3) = "W3"
        
        ary() = Split(Buffer, " ")
        
        For i = 0 To 3
            Config.SetVersionByte keys(i), CLng(Val("&H" & ary(i)))
        Next i
        Config.SetVersionByte "D2X", CLng(Val("&H" & ary(2)))
        
        Call Config.Save
        
        AddChat RTBColors.SuccessText, "Your config.ini file has been loaded with current version bytes."
    End If
End Sub


'RTB ADDCHAT SUBROUTINE - originally written by Grok[vL] - modified to support
'                         logging and timestamps and color decoding
' Updated 7/23/05 to remove many bulky calls to Len()
' Updated 9/01/05 to remove the changes made on 7/23/05 *smack forehead*
' Updated 9/25/05-10/25/05 to add HTML logging
' Updated 1/3/06 to remove HTML logging
' Updated 8/4/06 to add scrollbar locking (thanks FrOzeN)
' Updated 11/8/06 to log incoming text immediately
' Updated 4/17/07 to not flash the desktop when the scrollbar is held up
' Updated 8/07/07 with greater precision
Sub AddChat(ParamArray saElements() As Variant)
    Dim arr() As Variant
    Dim i     As Integer

    arr() = saElements
    Call DisplayRichText(frmChat.rtbChat, arr)
End Sub

Sub AddWhisper(ParamArray saElements() As Variant)
    Dim arr() As Variant
    
    arr() = saElements
    
    Call DisplayRichText(frmChat.rtbWhispers, arr)
    Exit Sub
    
    
    Dim s As String
    Dim L As Long
    Dim i As Integer
    
    If Not BotVars.LockChat Then
        'If ((BotVars.MaxBacklogSize) And (Len(rtbWhispers.text) >= BotVars.MaxBacklogSize)) Then
            If BotVars.Logging < 2 Then
                Close #1
                Open (StringFormat("{0}{1}-WHISPERS.txt", GetFolderPath("Logs"), Format(Date, "YYYY-MM-DD"))) For Append As #1
            End If
            
            With rtbWhispers
                .Visible = False
                .SelStart = 0
                .SelLength = InStr(1, .Text, vbLf, vbBinaryCompare)
                If BotVars.Logging < 2 Then Print #1, Left$(vbCrLf, -2 * CLng((i + 1) = UBound(saElements)))
                .SelText = vbNullString
                .Visible = True
            End With

            Close #1
        'End If
        
        Select Case BotVars.TSSetting
            Case 0: s = " [" & Time & "] "
            Case 1: s = " [" & Format(Time, "HH:MM:SS") & "] "
            Case 2: s = " [" & Format(Time, "HH:MM:SS") & "." & GetCurrentMS & "] "
            Case 3: s = vbNullString
        End Select
        
        With rtbWhispers
            .SelStart = Len(.Text)
            .SelLength = 0
            .SelColor = RTBColors.TimeStamps
            If .SelBold = True Then .SelBold = False
            If .SelItalic = True Then .SelItalic = False
            .SelText = s
            .SelStart = Len(.Text)
        End With
        
        For i = LBound(saElements) To UBound(saElements) Step 2
            If InStr(1, saElements(i), Chr(0), vbBinaryCompare) > 0 Then _
                KillNull saElements(i)
            
            If Len(saElements(i + 1)) > 0 Then
                With rtbWhispers
                    .SelStart = Len(.Text)
                    L = .SelStart
                    .SelLength = 0
                    .SelColor = saElements(i)
                    .SelText = saElements(i + 1) & Left$(vbCrLf, -2 * CLng((i + 1) = UBound(saElements)))
                    .SelStart = Len(.Text)
                End With
            End If
        Next i
        
        Call ColorModify(rtbWhispers, L)
    End If
End Sub


'BNLS EVENTS
Sub Event_BNetConnected()
    If (BotVars.UseProxy) Then
        AddChat RTBColors.SuccessText, "[PROXY] Connected!"
    Else
        AddChat RTBColors.SuccessText, "[BNCS] Connected!"
    End If
    
    Call SetNagelStatus(sckBNet.SocketHandle, False)
End Sub

Sub Event_BNetConnecting()
    If BotVars.UseProxy Then
        AddChat RTBColors.InformationText, "[PROXY] Connecting to the Battle.net server at " & BotVars.Server & "..."
    Else
        AddChat RTBColors.InformationText, "[BNCS] Connecting to the Battle.net server at " & BotVars.Server & "..."
    End If
End Sub

Sub Event_BNetDisconnected()
    tmrIdleTimer.Interval = 0
    UpTimer.Interval = 0
    BotVars.JoinWatch = 0
    
    AddChat RTBColors.ErrorMessageText, IIf(BotVars.UseProxy And BotVars.ProxyStatus <> psOnline, "[PROXY] ", "[BNCS] ") & "Disconnected."
    
    DoDisconnect (1)
    
    SetTitle "Disconnected"
    
    UpdateTrayTooltip
    
    g_Online = False
    
    Call ClearChannel
    
    UpdateProxyStatus psNotConnected
    'AddChat RTBColors.ErrorMessageText, "[BNCS] Attempting to reconnect, please wait..."
    'AddChat RTBColors.SuccessText, "Connection initialized."
    
    If sckBNet.State <> 0 Then sckBNet.Close
    If sckBNLS.State <> 0 Then sckBNLS.Close
    
    BNLSAuthorized = False
    
    'If Not UserCancelledConnect Then
    '    ReconnectTimerID = SetTimer(0, 0, BotVars.ReconnectDelay, _
    '        AddressOf Reconnect_TimerProc)
    'End If
End Sub

Sub Event_BNetError(ErrorNumber As Integer, Description As String)
    Dim s As String
    
    If BotVars.UseProxy And BotVars.ProxyStatus <> psOnline Then
        s = "[PROXY] "
    Else
        s = "[BNCS] "
    End If
    
    AddChat RTBColors.ErrorMessageText, s & ErrorNumber & " -- " & Description
    AddChat RTBColors.ErrorMessageText, s & "Disconnected."
    
    If (sckBNet.State <> 0) Then
        Call sckBNet.Close
    End If
    
    If (sckBNLS.State <> 0) Then
        Call sckBNLS.Close
    End If
    
    If (sckMCP.State <> 0) Then
        Call sckMCP.Close
    End If
    
    g_Connected = False
    
    UserCancelledConnect = False
    
    DoDisconnect 1, True
    
    SetTitle "Disconnected"
    
    frmChat.UpdateTrayTooltip
    
    Call ClearChannel
    lvClanList.ListItems.Clear
    lvFriendList.ListItems.Clear
    
    lblCurrentChannel.Caption = GetChannelString
    
    ' NOV 18 04 Change here should fix the attention-grabbing on errors
    'If Me.WindowState <> vbMinimized Then cboSend.SetFocus
    
    
    If DisplayError(ErrorNumber, IIf(BotVars.UseProxy And BotVars.ProxyStatus <> psOnline, 2, 1), BNET) = True Then
        AddChat RTBColors.ErrorMessageText, _
            IIf(BotVars.UseProxy And BotVars.ProxyStatus <> psOnline, "[PROXY] ", "[BNCS] ") & _
                "Attempting to reconnect in " & (BotVars.ReconnectDelay / 1000) & _
                    IIf(((BotVars.ReconnectDelay / 1000) > 1), " seconds", " second") & _
                        "..."
        
        UserCancelledConnect = False 'this should fix the beta reconnect problems
        
        'ReconnectTimerID = SetTimer(0, 0, BotVars.ReconnectDelay, _
        '    AddressOf Reconnect_TimerProc)
        
        'ExReconTicks = 0
        'ExReconMinutes = BotVars.ReconnectDelay / 1000
        'ExReconnectTimerID = SetTimer(0, ExReconnectTimerID, _
        '    1000, AddressOf ExtendedReconnect_TimerProc)
    End If
End Sub

Sub Event_BNLSAuthEvent(Success As Boolean)
    If Success = True Then
        AddChat RTBColors.SuccessText, "[BNLS] Authorized!"
    Else
        AddChat RTBColors.ErrorMessageText, "[BNLS] Authorization failed! Please download the latest version of StealthBot from http://www.stealthbot.net."
        Call DoDisconnect
    End If
End Sub

Sub Event_BNLSConnected()
    AddChat RTBColors.SuccessText, "[BNLS] Connected!"
    
    Call SetNagelStatus(sckBNLS.SocketHandle, False)
End Sub

Sub Event_BNLSConnecting()
    AddChat RTBColors.InformationText, "[BNLS] Connecting to the BNLS server at " & BotVars.BNLSServer & "..."
End Sub

Sub Event_BNLSDataError(Message As Byte)
    If Message = 0 Then
        AddChat RTBColors.ErrorMessageText, "[BNLS] Your CD-Key was rejected. It may be invalid. Try connecting again."
    ElseIf Message = 1 Then
        AddChat RTBColors.ErrorMessageText, "[BNLS] Error! Your CD-Key is bad."
    ElseIf Message = 2 Then
        AddChat RTBColors.ErrorMessageText, "[BNLS] Error! BNLS has failed CheckRevision. Please check your bot's settings and try again."
        AddChat RTBColors.ErrorMessageText, "[BNLS] Product: " & StrReverse(BotVars.Product) & "."
    ElseIf Message = 3 Then
        AddChat RTBColors.ErrorMessageText, "[BNLS] Error! Bad NLS revision."
    End If
End Sub

Private Sub Event_BNLSError(ErrorNumber As Integer, Description As String)
    If Not HandleBnlsError("[BNLS] Error " & ErrorNumber & ": " & Description) Then
        ' if we aren't using the finder display the error
        DisplayError ErrorNumber, 0, BNLS
    End If
End Sub


' this function will return whether we are going to use the finder
Public Function HandleBnlsError(ByVal ErrorMessage As String) As Boolean
    HandleBnlsError = False
    
    sckBNet.Close
    
    ' Is the BNLS server finder enabled?
    If Config.BNLSFinder Then
        Call RotateBnlsServer
    Else
        AddChat RTBColors.ErrorMessageText, ErrorMessage
        
        UserCancelledConnect = False
        DoDisconnect 1, True
    End If
    
    ' return the BotVars
    HandleBnlsError = Config.BNLSFinder
End Function

' Moves the connection to the next available BNLS server
Public Sub RotateBnlsServer()
    'Close the current BNLS connection
    sckBNLS.Close
    
    'Notify user the current BNLS server failed
    AddChat RTBColors.ErrorMessageText, "[BNLS] Connection to " & BotVars.BNLSServer & " failed."
    
    'Notify user other BNLS servers are being located
    AddChat RTBColors.InformationText, "[BNLS] Locating other BNLS servers..."
    
    Call FindBNLSServer
End Sub

Public Sub HandleFindBNLSServerListResult(ByVal strReturn As String, ByVal Result As Integer, ByVal ConfigListSource As Boolean)
    ' convert to LF
    strReturn = Replace(strReturn, vbCr, vbLf)
    strReturn = Replace(strReturn, vbLf & vbLf, vbLf)
    
    If (INet.ResponseCode <> 0) Or (Right$(strReturn, 1) <> vbLf) Then
        If ConfigListSource Then
            If Not RequestINetPage(BNLS_DEFAULT_SOURCE, SB_INET_BNLS2, True) Then
                Call HandleFindBNLSServerListResult("INet is busy", -1, False)
            End If
        Else
            AddChat RTBColors.ErrorMessageText, "[BNLS] " & strReturn & ". Unable to use BNLS server finder."
            AddChat RTBColors.ErrorMessageText, "[BNLS] An error occured while trying to locate an alternative BNLS server."
            AddChat RTBColors.ErrorMessageText, "[BNLS]   You may not be connected to the internet or may be having DNS resolution issues."
            AddChat RTBColors.ErrorMessageText, "[BNLS]   Visit http://www.stealthbot.net/ and check the Technical Support forum for more information."
            DoDisconnect
    
            ' ensure that we update our listing on following connection(s)
            BNLSFinderGotList = False
            
            ' ensure checker starts at 0 again on following connection(s)
            BNLSFinderIndex = 0
        End If
        
        Exit Sub
    Else
        ' Split the page up into an array of servers.
        BNLSFinderEntries() = Split(strReturn, vbLf)
    End If
    
    'Mark GotBNLSList as True so it's no longer downloaded for each attempt
    BNLSFinderGotList = True
    
    Call FindBNLSServerEntry
End Sub

'Locates alternative BNLS servers for the bot to use if the current one fails
Public Sub FindBNLSServer()
    'Error handler
    On Error GoTo ERROR_HANDLER
    
    BNLSFinderIndex = BNLSFinderIndex + 1
    
    'Check if the BNLS list has been downloaded
    If (BNLSFinderGotList = False) Then
        'Reset the counter
        BNLSFinderIndex = 0
        
        ' store first bnls server used so that we can avoid connecting to it again
        BNLSFinderLatest = BotVars.BNLSServer
        
        'Get the servers as a list from http://stealthbot.net/p/bnls.php
        If (LenB(Config.BNLSFinderSource) > 0) Then
            If Not RequestINetPage(Config.BNLSFinderSource, SB_INET_BNLS1, True) Then
                Call HandleFindBNLSServerListResult("INet is busy", -1, False)
            End If
        Else
            If Not RequestINetPage(BNLS_DEFAULT_SOURCE, SB_INET_BNLS2, True) Then
                Call HandleFindBNLSServerListResult("INet is busy", -1, False)
            End If
        End If
        
        Exit Sub
    End If
    
    Call FindBNLSServerEntry
    
    Exit Sub
    
ERROR_HANDLER:

    'Display the error message to the user
    If Err.Number = ERROR_FINDBNLSSERVER Then
        AddChat RTBColors.ErrorMessageText, "[BNLS] " & Err.Description
        AddChat RTBColors.ErrorMessageText, "[BNLS]   Visit http://www.stealthbot.net/ and check the Technical Support forum for more information."
        DoDisconnect
        
        ' ensure that we update our listing on following connection(s)
        BNLSFinderGotList = False
        
        ' ensure checker starts at 0 again on following connection(s)
        BNLSFinderIndex = 0
    
    Else
        Resume Next
    End If

    Exit Sub
End Sub

Sub FindBNLSServerEntry()
    If BNLSFinderIndex > UBound(BNLSFinderEntries) Then
        'All BNLS servers have been tried and failed
        Err.Raise ERROR_FINDBNLSSERVER, , "All the BNLS servers have failed."
    End If
    
    ' keep increasing counter until we find a server that is valid and isn't the same as the first one
    Do While (StrComp(BNLSFinderEntries(BNLSFinderIndex), BNLSFinderLatest, vbTextCompare) = 0) Or (LenB(BNLSFinderEntries(BNLSFinderIndex)) = 0)
        BNLSFinderIndex = BNLSFinderIndex + 1
        
        If BNLSFinderIndex > UBound(BNLSFinderEntries) Then
            'All BNLS servers have been tried and failed
            Err.Raise ERROR_FINDBNLSSERVER, , "All the BNLS servers have failed."
            Exit Do
        End If
    Loop
    
    BotVars.BNLSServer = BNLSFinderEntries(BNLSFinderIndex)
    
    ConnectBNLS
End Sub

' Updated 8/8/07 to support new prefix/suffix box feature
Sub Form_Resize()
    On Error Resume Next
    
    Dim lblHeight As Integer
    Static WasMaximized As Boolean
    Static DoMaximize As Boolean
    
    If Me.WindowState = vbMinimized Then
        If Not BotVars.NoTray Then
            #If Not COMPILE_DEBUG = 1 Then
                Me.Hide
                
                With nid
                    .cbSize = LenB(nid)
                    .hWnd = frmChat.hWnd
                    .uId = ID_TASKBARICON
                    .uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
                    .uCallBackMessage = WM_ICONNOTIFY
                    .hIcon = frmChat.Icon.handle
                    .szTip = GenerateTooltip()
                End With
                
                Shell_NotifyIcon NIM_ADD, nid
            #End If
        End If
    Else
        Shell_NotifyIcon NIM_DELETE, nid
        cboSend.SetFocus
        
        If txtPre.Visible Then
            txtPre.Height = cboSend.Height
            txtPre.Width = txtPost.Width
        End If
        
        If txtPost.Visible Then
            txtPost.Height = cboSend.Height
        End If
        
        'sizing + positioning
        
        'Added IsWindowsVista() call within an IIf() statement.
        'This shrinks the size of the entire layout by a further 80 twips.
        'This will act as a fix for Vista's screen cut off issues.
        '   - FrOzeN
        'This issue only occured under Aero, so the fix breaks the GUI for classic themes
        'on vista. This should be fixed now. ~Pyro
        With lvChannel
            'rtbChat.Width = Me.Width - .Width - IIf(g_OSVersion.IsWindowsVista, 200, 120)
        
            rtbChat.Width = Me.ScaleWidth - .Width
        
        '    .Width = (Me.Width / 4) - 120 'magic number?
        '    If .Width > (.ColumnHeaders.Item(1).Width + 700) Then
        '        .Width = .ColumnHeaders.Item(1).Width + 700
        '
        '        rtbChat.Width = Me.Width - .Width - 120
        '    Else
        '        rtbChat.Width = ((Me.Width / 4) * 3)
        '    End If
        '
        '    .ColumnHeaders.Item(1).Width = (.Width / 3) * 2.5
        End With
        
        lblCurrentChannel.Width = lvChannel.Width
        lvFriendList.Width = lvChannel.Width
        lvClanList.Width = lvChannel.Width
        cboSend.Width = rtbChat.Width
        
        With cmdShowHide
            If rtbWhispersVisible Then
                'Debug.Print "-> " & rtbWhispers.Height
                .Height = rtbWhispers.Height + 285
                .Caption = CAP_HIDE
                .ToolTipText = TIP_HIDE
            Else
                .Height = txtPre.Height - Screen.TwipsPerPixelY
                .Caption = CAP_SHOW
                .ToolTipText = TIP_SHOW
            End If
            
            .ZOrder vbBringToFront
        End With
        
        rtbWhispers.Visible = rtbWhispersVisible
        
        'height is based on rtbchat.height + cmdshowhide.height
        If rtbWhispersVisible Then
            rtbChat.Height = ((Me.ScaleHeight / Screen.TwipsPerPixelY) - (txtPre.Height / _
                Screen.TwipsPerPixelY) - (rtbWhispers.Height / Screen.TwipsPerPixelY)) * _
                    (Screen.TwipsPerPixelY)
            rtbWhispers.Move rtbChat.Left, cboSend.Top + cboSend.Height
        Else
            rtbChat.Height = ((Me.ScaleHeight / Screen.TwipsPerPixelY) - (txtPre.Height / _
                Screen.TwipsPerPixelY)) * (Screen.TwipsPerPixelY)
        End If
        
        lvChannel.Move rtbChat.Left + rtbChat.Width, lblCurrentChannel.Top + lblCurrentChannel.Height, lvChannel.Width, rtbChat.Height - lblCurrentChannel.Height
        lvFriendList.Move lvChannel.Left, lvChannel.Top, lvChannel.Width, rtbChat.Height - lblCurrentChannel.Height
        lvClanList.Move lvChannel.Left, lvChannel.Top, lvChannel.Width, rtbChat.Height - lblCurrentChannel.Height
        lblCurrentChannel.Move lvChannel.Left, rtbChat.Top
        
        If txtPre.Visible Then
            txtPre.Move rtbChat.Left, rtbChat.Top + rtbChat.Height + (Screen.TwipsPerPixelY / 3)
            cboSend.Move txtPre.Left + txtPre.Width, txtPre.Top, rtbChat.Width - txtPre.Width
        Else
            cboSend.Move rtbChat.Left, rtbChat.Top + rtbChat.Height + (Screen.TwipsPerPixelY / 3)
        End If
        
        If txtPost.Visible Then
            cboSend.Width = cboSend.Width - txtPost.Width
            txtPost.Move cboSend.Left + cboSend.Width, cboSend.Top
        End If
        
        lvChannel.Height = rtbChat.Height - lblCurrentChannel.Height
        lvFriendList.Height = lvChannel.Height
        lvClanList.Height = lvChannel.Height
        
        'Minus 80 twips from rtbWhispers.Width if using Vista to fix width issue
        'the issue is not with Vista, but with Aero.
        With rtbWhispers
            If .Visible Then
                .Move rtbChat.Left, cboSend.Top + cboSend.Height, (Me.ScaleWidth - cmdShowHide.Width - Screen.TwipsPerPixelX)
            End If
        End With
        
        ListviewTabs.Height = cboSend.Height
        ListviewTabs.Move lvChannel.Left, cboSend.Top + Screen.TwipsPerPixelY, lvChannel.Width - _
            cmdShowHide.Width - Screen.TwipsPerPixelX, cboSend.Height '+ 2 * Screen.TwipsPerPixelY
        
        If rtbWhispersVisible Then
            cmdShowHide.Move (((rtbWhispers.Left + rtbWhispers.Width) / Screen.TwipsPerPixelX) + 1) * _
                Screen.TwipsPerPixelX, lvChannel.Top + lvChannel.Height + Screen.TwipsPerPixelY
        Else
            cmdShowHide.Move ListviewTabs.Left + ListviewTabs.Width, lvChannel.Top + lvChannel.Height
        End If
        
        With lvClanList
            .ColumnHeaders(1).Width = (.Width \ 4) * 3 - 150
            .ColumnHeaders(2).Width = imlClan.ImageWidth '.Width \ 4 + 200
            .ColumnHeaders(3).Width = 0
        End With
        
        With lvFriendList
            .ColumnHeaders(1).Width = (.Width \ 4) * 3
            .ColumnHeaders(2).Width = imlIcons.ImageWidth '.Width \ 4 + 200
        End With
    End If
    
    If Me.WindowState = vbMaximized Then
        WasMaximized = True
        Call RecordWindowPosition(True)
    ElseIf Me.WindowState = vbMinimized Then
        If WasMaximized Then
            WasMaximized = False
            DoMaximize = True
        End If
    Else
        WasMaximized = False
        
        If DoMaximize Then
            DoMaximize = False
            
            Me.WindowState = vbMaximized
        End If
    End If
    
    Call rtbChat.Refresh
    
    Exit Sub
    
ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, "Error (#" & Err.Number & "): " & Err.Description & " in Form_Resize()."
End Sub

Function GenerateTooltip() As String
    GenerateTooltip = String(64, vbNullChar)
    GenerateTooltip = IIf(LenB(GetCurrentUsername) > 0, GetCurrentUsername, "offline") & " @ " & BotVars.Server & " (" & StrReverse(BotVars.Product) & ")" & Chr$(0)
End Function

Sub UpdateTrayTooltip()
    On Error Resume Next

    If Me.WindowState = vbMinimized Then
        With nid
            .cbSize = LenB(nid)
            .hWnd = frmChat.hWnd
            .uId = ID_TASKBARICON
            .uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
            .uCallBackMessage = WM_ICONNOTIFY
            .hIcon = frmChat.Icon.handle
            .szTip = GenerateTooltip()
        End With
        
        Shell_NotifyIcon NIM_MODIFY, nid
    End If
End Sub

Private Sub ClanHandler_CandidateList(ByVal Status As Byte, Users() As String)
    Dim i As Long
    
    'Valid Status codes:
    '   0x00: Successfully found candidate(s)
    '   0x01: Clan tag already taken
    '   0x08: Already in clan
    '   0x0a: Invalid clan tag specified
    
    If MDebug("debug") Then
        AddChat RTBColors.ErrorMessageText, "CandidateList received. Status code [0x" & Hex(Status) & "]."
        If UBound(Users) > -1 Then
            AddChat RTBColors.InformationText, "Potential clan members:"
            
            For i = 0 To UBound(Users)
                AddChat RTBColors.InformationText, Users(i)
            Next i
        End If
    End If
    
    RunInAll "Event_ClanCandidateList", Status, ConvertStringArray(Users)
End Sub

Private Sub ClanHandler_MemberLeaves(ByVal Member As String)
    AddChat RTBColors.InformationText, "[CLAN] " & Member & " has left the clan."
    
    Dim x   As ListItem
    Dim pos As Integer
    
    pos = g_Clan.GetUserIndexEx(Member)
    
    If (pos > 0) Then
        g_Clan.Members.Remove pos
    End If
    
    Member = ConvertUsername(Member)

    Set x = lvClanList.FindItem(Member)
    
    If (Not (x Is Nothing)) Then
        lvClanList.ListItems.Remove x.Index
        
        lvClanList.Refresh
        
        Set x = Nothing
    End If
    
    On Error Resume Next

    RunInAll "Event_ClanMemberLeaves", Member
End Sub

Private Sub ClanHandler_RemovedFromClan(ByVal Status As Byte)
    If Status = 1 Then
        If (AwaitingSelfRemoval = 0) Then
            Set g_Clan = New clsClanObj
        
            Clan.isUsed = False
        
            ListviewTabs.TabEnabled(LVW_BUTTON_CLAN) = False
            lvClanList.ListItems.Clear
            ListviewTabs.Tab = LVW_BUTTON_CHANNEL
            Call ListviewTabs_Click(LVW_BUTTON_CHANNEL)
        
            AddChat RTBColors.ErrorMessageText, "[CLAN] You have been removed from the clan, or it has been disbanded."
        
            On Error Resume Next
            RunInAll "Event_BotRemovedFromClan"
        End If
        
        On Error Resume Next
        RunInAll "Event_BotRemovedFromClan"
    End If
End Sub

Private Sub ClanHandler_MyRankChange(ByVal NewRank As Byte)
    If (g_Clan.Self.Rank < NewRank) Then
        AddChat RTBColors.SuccessText, "[CLAN] You have been promoted. Your new rank is ", _
                RTBColors.InformationText, GetRank(NewRank), RTBColors.SuccessText, "."
    ElseIf (g_Clan.Self.Rank > NewRank) Then
        AddChat RTBColors.SuccessText, "[CLAN] You have been demoted. Your new rank is ", _
                RTBColors.InformationText, GetRank(NewRank), RTBColors.SuccessText, "."
    Else
        AddChat RTBColors.SuccessText, "[CLAN] Your new rank is ", RTBColors.InformationText, _
                GetRank(NewRank), RTBColors.SuccessText, "."
    End If

    g_Clan.Self.Rank = NewRank
    
    On Error Resume Next
    
    RunInAll "Event_BotClanRankChanged", NewRank
End Sub

Private Sub ClanHandler_ClanInfo(ByVal ClanTag As String, ByVal RawClanTag As String, ByVal Rank As Byte)
    Set g_Clan = New clsClanObj
    
    With Clan
        .Name = ClanTag
        .DWName = RawClanTag
        .MyRank = Rank
        .isUsed = True
    End With
    
    With g_Clan
        .Name = ClanTag
    End With
    
    Call InitListviewTabs
    
    'If g_Clan.Self.Rank = 0 Then g_Clan.Self.Rank = 1
    On Error Resume Next
    
    ClanTag = KillNull(ClanTag)
    
    BotVars.Clan = ClanTag
    
    If AwaitingClanMembership = 1 Then
        AddChat RTBColors.SuccessText, "[CLAN] You are now a member of ", RTBColors.InformationText, "Clan " & ClanTag, RTBColors.SuccessText, "!"
        AwaitingClanMembership = 0
            
        RunInAll "Event_BotJoinedClan", ClanTag
    Else
        AddChat RTBColors.SuccessText, "[CLAN] You are a ", RTBColors.InformationText, GetRank(Rank), RTBColors.SuccessText, " in ", RTBColors.InformationText, "Clan " & ClanTag, RTBColors.SuccessText, "."
        
        RunInAll "Event_BotClanInfo", ClanTag, Rank
    End If
    
    RequestClanList
    RequestClanMOTD
    
    'frmChat.ClanHandler.RequestClanMotd 1
    
    frmChat.ListviewTabs_Click 0
End Sub

Private Sub ClanHandler_ClanInvitation(ByVal Token As String, ByVal ClanTag As String, ByVal RawClanTag As String, ByVal ClanName As String, ByVal InvitedBy As String, ByVal NewClan As Boolean)
    If Not mnuIgnoreInvites.Checked And IsW3 Then
        Clan.Token = Token
        Clan.DWName = RawClanTag
        Clan.Creator = InvitedBy
        Clan.Name = ClanName
        If NewClan Then Clan.isNew = 1
        
        With RTBColors
            AddChat .SuccessText, "[CLAN] ", .InformationText, ConvertUsername(InvitedBy), .SuccessText, " has invited you to join a clan: ", .InformationText, ClanName, .SuccessText, " [", .InformationText, ClanTag, .SuccessText, "]"
        End With
        
        frmClanInvite.Show
    End If
    
    RunInAll "Event_ClanInvitation", Token, ClanTag, RawClanTag, ClanName, InvitedBy, NewClan
End Sub

Private Sub ClanHandler_ClanMemberList(Members() As String)
    Dim ClanMember As clsClanMemberObj
    Dim i          As Long
    
    If AwaitingClanList = 1 Then
        For i = 0 To UBound(Members) Step 4
            Set ClanMember = New clsClanMemberObj
            
            With ClanMember
                .Name = Members(i)
                .Rank = Val(Members(i + 1))
                .Status = Val(Members(i + 2))
                .Location = Members(i + 3)
            End With

            g_Clan.Members.Add ClanMember
            If ((Len(Members(i)) > 0) And (UBound(Members) >= i + 1)) Then
                AddClanMember ClanMember.DisplayName, Val(Members(i + 1)), Val(Members(i + 2))
                
                On Error Resume Next
                
                RunInAll "Event_ClanMemberList", ClanMember.DisplayName, Val(Members(i + 1)), Val(Members(i + 2))
            End If
        Next i
    End If
    
    lblCurrentChannel.Caption = GetChannelString()
    
    frmChat.ListviewTabs_Click 0
End Sub

Private Sub ClanHandler_ClanMemberUpdate(ByVal Username As String, ByVal Rank As Byte, ByVal IsOnline As Byte, ByVal Location As String)
    Dim x   As ListItem
    Dim pos As Integer
    
    pos = g_Clan.GetUserIndexEx(Username)
    
    If (pos > 0) Then
        With g_Clan.Members(pos)
            .Name = Username
            .Rank = Rank
            .Status = IsOnline
            .Location = Location
        End With
    Else
        Dim ClanMember As clsClanMemberObj
        
        Set ClanMember = New clsClanMemberObj
        
        With ClanMember
            .Name = Username
            .Rank = Rank
            .Status = IsOnline
            .Location = Location
        End With
        
        g_Clan.Members.Add ClanMember
    End If
    
    Username = ConvertUsername(Username)
    
    Set x = lvClanList.FindItem(Username)

    If StrComp(Username, CurrentUsername, vbTextCompare) = 0 Then
        g_Clan.Self.Rank = IIf(Rank = 0, Rank + 1, Rank)
        AwaitingClanInfo = 1
    End If
    
    If AwaitingClanInfo = 1 Then
        AwaitingClanInfo = 0
        AddChat RTBColors.SuccessText, "[CLAN] Member update: ", RTBColors.InformationText, Username, RTBColors.SuccessText, " is now a " & GetRank(Rank) & "."
    End If
    
    If Not (x Is Nothing) Then
        lvClanList.ListItems.Remove x.Index
        Set x = Nothing
    End If
    
    AddClanMember Username, CInt(Rank), CInt(IsOnline)
    
    On Error Resume Next
    RunInAll "Event_ClanMemberUpdate", Username, Rank, IsOnline
End Sub

Private Sub ClanHandler_ClanMOTD(ByVal cookie As Long, ByVal Message As String)
    g_Clan.MOTD = Message
    
    If (cookie = 1) Then
        PassedClanMotdCheck = True
        
        'If (g_Clan.MOTD <> vbNullString) Then
        '    frmChat.AddChat vbBlue, Message
        'End If
    End If
    
    On Error Resume Next
    
    RunInAll "Event_ClanMOTD", Message
End Sub

Private Sub ClanHandler_DemoteUserReply(ByVal Success As Boolean)
    If Success Then
        AddChat RTBColors.SuccessText, "[CLAN] User demoted successfully."
    Else
        AddChat RTBColors.ErrorMessageText, "[CLAN] User demotion failed."
    End If
    
    lblCurrentChannel.Caption = GetChannelString
    
    RunInAll "Event_ClanDemoteUserReply", Success
End Sub

Private Sub ClanHandler_DisbandClanReply(ByVal Success As Boolean)
    If MDebug("debug") Then
        AddChat RTBColors.ConsoleText, "DisbandClanReply: " & Success
    End If
    RunInAll "Event_ClanDisbandReply", Success
End Sub

Private Sub ClanHandler_InviteUserReply(ByVal Status As Byte)
    '0x00: Invitation accepted
    '0x04: Invitation declined
    '0x05: Failed to invite user
    '0x09: Clan is full
    
    Select Case Status
        Case 0, 1: AddChat RTBColors.SuccessText, "[CLAN] The invitation was accepted."
        Case 4: AddChat RTBColors.ErrorMessageText, "[CLAN] The invitation was declined."
        Case 5: AddChat RTBColors.ErrorMessageText, "[CLAN] The invitation failed."
        Case 9: AddChat RTBColors.ErrorMessageText, "[CLAN] The invitation failed: Your clan is full."
        Case Else: AddChat RTBColors.ErrorMessageText, "[CLAN] Unknown invitation status: " & Status
    End Select
    RunInAll "Event_ClanInviteUserReply", Status
End Sub

Private Sub ClanHandler_PromoteUserReply(ByVal Success As Boolean)
    If Success Then
        AddChat RTBColors.SuccessText, "[CLAN] User promoted successfully."
    Else
        AddChat RTBColors.ErrorMessageText, "[CLAN] User promotion failed."
    End If
    
    lblCurrentChannel.Caption = GetChannelString
    RunInAll "Event_ClanPromoteUserReply", Success
End Sub

Private Sub ClanHandler_RemoveUserReply(ByVal Result As Byte)

'    0x00: Successfully removed user from clan
'    0x02: Too soon to remove user
'    0x03: Not enough members to remove this user
'    0x07: Not authorized to remove the user
'    0x08: User is not in your clan
    
    'Debug.Print "Removed successfully!"
    
    Select Case Result
        Case 0
            If AwaitingSelfRemoval = 1 Then
                AwaitingSelfRemoval = 0
                Clan.isUsed = False
                
                ListviewTabs.TabEnabled(LVW_BUTTON_CLAN) = False
                lvClanList.ListItems.Clear
                
                ListviewTabs.Tab = LVW_BUTTON_CHANNEL
                Call ListviewTabs_Click(LVW_BUTTON_CHANNEL)
                
                Set g_Clan = New clsClanObj
                
                AddChat RTBColors.SuccessText, "[CLAN] You have successfully left the clan."
            Else
                AddChat RTBColors.SuccessText, "[CLAN] User removed successfully."
                
                RequestClanList
            End If
            
        Case 2
            AddChat RTBColors.ErrorMessageText, "[CLAN] That user is currently on probation."
        
        Case 3
            AddChat RTBColors.ErrorMessageText, "[CLAN] There are not enough members for you to remove that user."
        
        Case 7
            AddChat RTBColors.ErrorMessageText, "[CLAN] You are not authorized to remove that user."
            
        Case 8
            AddChat RTBColors.ErrorMessageText, "[CLAN] You are not allowed to remove that user."
            
        Case Else
            AddChat RTBColors.InformationText, "[CLAN] 0x78 Response code: 0x" & Hex(Result)
            AddChat RTBColors.InformationText, "[CLAN] You failed to remove that user from the clan."
    End Select
    
    lblCurrentChannel.Caption = GetChannelString
    RunInAll "Event_ClanRemoveUserReply", Result
End Sub

Private Sub ClanHandler_UnknownClanEvent(ByVal PacketID As Byte, ByVal Data As String)
    If MDebug("debug") Then
        frmChat.AddChat RTBColors.ErrorMessageText, "[CLAN] Unknown clan event [0x" & Hex(PacketID) & "]. Data is as follows:"
        frmChat.AddChat RTBColors.ErrorMessageText, Data
    End If
End Sub

Public Function GetLogFilePath() As String

    Dim Path As String
    Dim f    As Integer
    
    f = FreeFile
    
    Path = StringFormat("{0}{1}.txt", GetFolderPath("Logs"), Format(Date, "YYYY-MM-DD"))

    If (Dir$(Path) = vbNullString) Then
        Open Path For Output As #f
        Close #1
    End If
    
    GetLogFilePath = Path

End Function

Sub Form_Unload(Cancel As Integer)
    Dim Key As String, L As Long
    
    'Me.WindowState = vbNormal
    'Me.Show

    'UserCancelledConnect = False

    'Cancel = 1
    
    'scTimer.Enabled = False
    'SControl.Reset
    
    INet.Cancel
    
    AddChat RTBColors.ErrorMessageText, "Shutting down..."
    
    If Config.FileExists Then
        If Me.WindowState <> vbMinimized Then
            Call RecordWindowPosition(CBool(Me.WindowState = vbMaximized))
        End If
        
        Call Config.Save
    End If
    
    'With frmChat.INet
    '    If .StillExecuting Then .Cancel
    'End With

    Call DoDisconnect(1)

    Shell_NotifyIcon NIM_DELETE, nid
    
    On Error Resume Next
    
    RunInAll "Event_LoggedOff"
    RunInAll "Event_Close"
    RunInAll "Event_Shutdown"
    
    DestroyObjs
    
    On Error GoTo 0
    
    If ExReconnectTimerID > 0 Then
        KillTimer 0, ExReconnectTimerID
    End If
    
'    If AttemptedNewVerbyte Then
'        AttemptedNewVerbyte = False
'        l = CLng(Val("&H" & ReadCFG("Main", Key & "VerByte")))
'        WriteINI "Main", Key & "VerByte", Hex(l - 1)
'    End If

    Call modWarden.WardenCleanup(WardenInstance)

    'Call ChatQueue_Terminate

    DisableURLDetect frmChat.rtbChat.hWnd
    UnhookWindowProc frmChat.hWnd

    'Call SharedScriptSupport.Dispose 'Explicit call the Class_Terminate sub in the ScriptSupportClass to destroy all the forms. - FrOzeN
    
    'DeconstructSettings
    'DeconstructMonitor
    DestroyAllWWs
    
    Set g_Logger = Nothing
    Set BotVars = Nothing
    Set ClanHandler = Nothing
    Set ListToolTip = Nothing
    Set GErrorHandler = Nothing
    Set FriendListHandler = Nothing
    Set colWhisperWindows = Nothing
    Set colLastSeen = Nothing
    Set SharedScriptSupport = Nothing
    Set ds = Nothing
    
    'Set dictTimerInterval = Nothing
    'Set dictTimerCount = Nothing
    'Set dictTimerEnabled = Nothing
    
    ' Updated to match current form list 2009-02-09 Andy
    Unload frmAbout
    Unload frmCatch
    Unload frmCommands
    Unload frmClanInvite
    Unload frmCustomInputBox
    Unload frmDBType
    Unload frmEMailReg
    Unload frmFilters
    Unload frmDBGameSelection
    Unload frmDBNameEntry
    Unload frmDBManager
    Unload frmManageKeys
    'Unload frmMonitor
    Unload frmProfile
    'Unload frmProfileManager
    Unload frmQuickChannel
    Unload frmRealm
    'Unload frmScriptUI
    Unload frmScript
    Unload frmSettings
    Unload frmSplash
    'Unload frmUserManager
    Unload frmWhisperWindow
    'Unload frmWriteProfile
    
    ' Added this instead of End to try and fix some system tray crashes 2009-0211-andy
    '  It was used in some capacity before since the API was already declared
    '   in modAPI...
    ' added preprocessor check; the bot was ending the VB6 IDE's process too! - ribose
    ' if it was compiled with the debugger, we don't allow minimizing to tray anyway
    #If Not COMPILE_DEBUG = 1 Then
        Call ExitProcess(0)
    #Else
        End
    #End If
End Sub


Public Sub AddFriend(ByVal Username As String, ByVal Product As String, IsOnline As Boolean)
    Dim i As Integer, OnlineIcon As Integer
    Dim f As ListItem
    Const ICOFFLINE = MONITOR_OFFLINE
    Const ICONLINE = MONITOR_ONLINE
    
    If IsOnline Then OnlineIcon = ICONLINE Else OnlineIcon = ICOFFLINE
    
    'Everybody Else
    Select Case Product
        Case Is = PRODUCT_STAR
            i = ICSTAR
        Case Is = PRODUCT_SEXP
            i = ICSEXP
        Case Is = PRODUCT_D2DV
            i = ICD2DV
        Case Is = PRODUCT_D2XP
            i = ICD2XP
        Case Is = PRODUCT_W2BN
            i = ICW2BN
        Case Is = PRODUCT_WAR3
            i = ICWAR3
        Case Is = PRODUCT_W3XP
            i = ICWAR3X
        Case Is = PRODUCT_CHAT
            i = ICCHAT
        Case Is = PRODUCT_DRTL
            i = ICDIABLO
        Case Is = PRODUCT_DSHR
            i = ICDIABLOSW
        Case Is = PRODUCT_JSTR
            i = ICJSTR
        Case Is = PRODUCT_SSHR
            i = ICSCSW
        Case Else
            i = ICUNKNOWN
    End Select
    
    Set f = lvFriendList.FindItem(Username)
    
    If (f Is Nothing) Then
        With lvFriendList.ListItems
            .Add , , Username, , i
            .Item(.Count).ListSubItems.Add , , , OnlineIcon
        End With
    Else
        f.SmallIcon = i
        f.ListSubItems.Item(1).ReportIcon = OnlineIcon
        
        Set f = Nothing
    End If
    
    lblCurrentChannel.Caption = GetChannelString()
    
    frmChat.ListviewTabs_Click 0
End Sub

Private Sub FriendListHandler_FriendAdded(ByVal Username As String, ByVal Product As String, ByVal Location As Byte, ByVal Status As Byte, ByVal Channel As String)
    AddFriend Username, Product, (Location > 0)
    lblCurrentChannel.Caption = GetChannelString
End Sub

Private Sub FriendListHandler_FriendListReceived(ByVal FriendCount As Byte)
    lvFriendList.ListItems.Clear
End Sub

Private Sub FriendListHandler_FriendListEntry(ByVal Username As String, ByVal Product As String, ByVal Channel As String, ByVal Status As Byte, ByVal Location As Byte)
    AddFriend Username, Product, (Location > 0)
    lblCurrentChannel.Caption = GetChannelString
End Sub

Private Sub FriendListHandler_FriendMoved()
    Call FriendListHandler.RequestFriendsList(PBuffer)
End Sub

Private Sub FriendListHandler_FriendRemoved(ByVal Username As String)
    Dim flItem As ListItem
    
    Set flItem = lvFriendList.FindItem(Username)
   
    If (Not (flItem Is Nothing)) Then
        lvFriendList.ListItems.Remove flItem.Index
    
        Set flItem = Nothing
    End If
    
    lblCurrentChannel.Caption = GetChannelString
End Sub

Private Sub FriendListHandler_FriendUpdate(ByVal Username As String, ByVal FLIndex As Byte)
    On Error GoTo ERROR_HANDLER

    Dim x As ListItem
    Dim i As Integer
    Const ICONLINE = MONITOR_ONLINE
    Const ICOFFLINE = MONITOR_OFFLINE
    
    Set x = lvFriendList.FindItem(Username)
    
    If Not (x Is Nothing) Then
        With g_Friends.Item(FLIndex)
            Select Case .LocationID
                Case FRL_OFFLINE
                    x.SmallIcon = ICUNKNOWN
                    
                    x.ListSubItems.Item(1).ReportIcon = ICOFFLINE
                    
                Case Else
                    If x.ListSubItems.Item(1).ReportIcon = ICOFFLINE Then
                        'Friend is now online - notify user?
                    End If
                    
                    x.ListSubItems.Item(1).ReportIcon = ICONLINE
                    
                    Select Case .Game
                        Case Is = PRODUCT_STAR: i = ICSTAR
                        Case Is = PRODUCT_SEXP: i = ICSEXP
                        Case Is = PRODUCT_D2DV: i = ICD2DV
                        Case Is = PRODUCT_D2XP: i = ICD2XP
                        Case Is = PRODUCT_W2BN: i = ICW2BN
                        Case Is = PRODUCT_WAR3: i = ICWAR3
                        Case Is = PRODUCT_W3XP: i = ICWAR3X
                        Case Is = PRODUCT_CHAT: i = ICCHAT
                        Case Is = PRODUCT_DRTL: i = ICDIABLO
                        Case Is = PRODUCT_DSHR: i = ICDIABLOSW
                        Case Is = PRODUCT_JSTR: i = ICJSTR
                        Case Is = PRODUCT_SSHR: i = ICSCSW
                        Case Else: i = ICUNKNOWN
                    End Select
                    
                    x.SmallIcon = i
            End Select
        End With
        
    End If
    
    Set x = Nothing
    
    Exit Sub
    
ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, "Error (#" & Err.Number & "): " & Err.Description & " in FriendUpdate()."
    
    Exit Sub
End Sub

Private Sub lblCurrentChannel_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    PopupMenu mnuQCTop
End Sub

Public Sub ListviewTabs_Click(PreviousTab As Integer)
    Dim CurrentTab As Integer
    
    CurrentTab = ListviewTabs.Tab
    
    Select Case CurrentTab
        Case LVW_BUTTON_CHANNEL ' = 0 = Channel button clicked
            lblCurrentChannel.ToolTipText = "Currently in " & g_Channel.SType() & _
                " channel " & g_Channel.Name & " (" & g_Channel.Users.Count & ")"
            
            lvChannel.ZOrder vbBringToFront
            
        Case LVW_BUTTON_FRIENDS ' = 1 = Friends button clicked
            lblCurrentChannel.ToolTipText = "Currently viewing " & g_Friends.Count & " friends"
        
            lvFriendList.ZOrder vbBringToFront
            
        Case LVW_BUTTON_CLAN ' = 2 = Clan button clicked
            lblCurrentChannel.ToolTipText = "Currently viewing " & _
                g_Clan.Members.Count & " members of clan " & Clan.Name
        
            lvClanList.ZOrder vbBringToFront
            
    End Select
    
    lvChannel.HideSelection = True
    lvFriendList.HideSelection = True
    lvClanList.HideSelection = True
    
    lblCurrentChannel.Caption = GetChannelString
End Sub

' This procedure relies on code in RecordcboSendSelInfo() that sets global variables
'  cboSendSelLength and cboSendSelStart
' These two properties are zeroed out as the control loses focus and inaccessible
'  (zeroed) at both access time in this method AND in the _LostFocus sub
Private Sub lvChannel_dblClick()
    Dim Value As String

    Value = GetSelectedUser
    If LenB(cboSend.Text) = 0 Then Value = Value & BotVars.AutoCompletePostfix
    Value = Value & Space$(1)

    If (Len(Value) > 0) Then
        With cboSend
            .SelStart = cboSendSelStart
            .SelLength = cboSendSelLength
            .SelText = Value
            
            cboSendSelStart = cboSendSelStart + Len(Value)
            cboSendSelLength = 0
            
            .SetFocus
        End With
    End If
End Sub

Private Sub lvChannel_KeyUp(KeyCode As Integer, Shift As Integer)
    Const S_ALT = 4
    
    If (KeyCode = 93) Then
        lvChannel_MouseUp 2, Shift, 0, 0
    ElseIf (KeyCode = KEY_ALTN And Shift = S_ALT) Then
        Dim sStart As Integer
        
        With lvChannel
            If Not (.SelectedItem Is Nothing) Then
                cboSend.SelStart = Len(cboSend.Text)
                cboSend.SelText = .SelectedItem.Text
    
                KeyCode = 0
                Shift = 0
                
                Exit Sub
            End If
        End With
    End If
End Sub

Private Sub lvFriendList_KeyUp(KeyCode As Integer, Shift As Integer)
    Const S_ALT = 4
    
    If (KeyCode = 93) Then
        lvFriendList_MouseUp 2, Shift, 0, 0
    ElseIf (KeyCode = KEY_ALTN And Shift = S_ALT) Then
        Dim sStart As Integer
        
        With lvFriendList
            If Not (.SelectedItem Is Nothing) Then
                cboSend.SelStart = Len(cboSend.Text)
                cboSend.SelText = .SelectedItem.Text
    
                KeyCode = 0
                Shift = 0
                
                Exit Sub
            End If
        End With
    End If
End Sub

Private Sub lvClanList_KeyUp(KeyCode As Integer, Shift As Integer)
    Const S_ALT = 4
    
    If (KeyCode = 93) Then
        lvClanList_MouseUp 2, Shift, 0, 0
    ElseIf (KeyCode = KEY_ALTN And Shift = S_ALT) Then
        Dim sStart As Integer
        
        With lvClanList
            If Not (.SelectedItem Is Nothing) Then
                cboSend.SelStart = Len(cboSend.Text)
                cboSend.SelText = .SelectedItem.Text
    
                KeyCode = 0
                Shift = 0
                
                Exit Sub
            End If
        End With
    End If
End Sub

Private Sub lvFriendList_dblClick()
    Dim Value As String

    Value = GetFriendsSelectedUser
    If LenB(cboSend.Text) = 0 Then Value = Value & BotVars.AutoCompletePostfix
    Value = Value & Space$(1)

    If (Len(Value) > 0) Then
        With cboSend
            .SelStart = cboSendSelStart
            .SelLength = cboSendSelLength
            .SelText = Value
            
            cboSendSelStart = cboSendSelStart + Len(Value)
            cboSendSelLength = 0
            
            .SetFocus
        End With
    End If
End Sub

Private Sub lvClanList_dblClick()
    Dim Value As String

    Value = GetClanSelectedUser
    If LenB(cboSend.Text) = 0 Then Value = Value & BotVars.AutoCompletePostfix
    Value = Value & Space$(1)

    If (Len(Value) > 0) Then
        With cboSend
            .SelStart = cboSendSelStart
            .SelLength = cboSendSelLength
            .SelText = Value
            
            cboSendSelStart = cboSendSelStart + Len(Value)
            cboSendSelLength = 0
            
            .SetFocus
        End With
    End If
End Sub

Private Sub lvChannel_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim aInx As Integer
    Dim sProd As String * 4
    Dim HasOps As Boolean
    Dim UserIsW3 As Boolean
    Dim UserHasStats As Boolean
    
    If (lvChannel.SelectedItem Is Nothing) Then
        Exit Sub
    End If

    If Button = vbRightButton Then
        If Not (lvChannel.SelectedItem Is Nothing) Then
            aInx = g_Channel.GetUserIndex(GetSelectedUser)
            
            If aInx > 0 Then
                sProd = g_Channel.Users(aInx).Game
                UserIsW3 = (sProd = PRODUCT_W3XP Or sProd = PRODUCT_WAR3)
                Select Case sProd
                    Case PRODUCT_STAR, PRODUCT_SEXP, PRODUCT_W2BN, PRODUCT_WAR3, PRODUCT_W3XP, PRODUCT_JSTR, PRODUCT_SSHR
                        UserHasStats = True
                End Select
                HasOps = g_Channel.Self.IsOperator()
                
                mnuPopInvite.Enabled = UserIsW3 And LenB(g_Channel.Users(aInx).Clan) = 0 And InStr(1, GetSelectedUser, "#") = 0 And g_Clan.Self.Rank >= 3
                
                mnuPopStats.Enabled = UserHasStats
                mnuPopWebProfile.Enabled = UserIsW3
                mnuPopKick.Enabled = HasOps
                mnuPopDes.Enabled = HasOps
                mnuPopBan.Enabled = HasOps
            End If
        End If
        
        mnuPopup.Tag = lvChannel.SelectedItem.Text 'Record which user is selected at time of right-clicking. - FrOzeN
        
        PopupMenu mnuPopup
    End If
End Sub

Private Sub lvFriendList_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim aInx As Integer
    Dim sProd As String * 4
    Dim bIsOn As Boolean
    Dim bIsMutual As Boolean
    Dim UserIsW3 As Boolean
    Dim UserHasStats As Boolean
    Dim SelfHasStats As Boolean
    
    If (lvFriendList.SelectedItem Is Nothing) Then
        Exit Sub
    End If

    If Button = vbRightButton Then
        If Not (lvFriendList.SelectedItem Is Nothing) Then
            aInx = lvFriendList.SelectedItem.Index
            
            If aInx > 0 Then
                sProd = g_Friends(aInx).Game
                bIsOn = g_Friends(aInx).IsOnline
                bIsMutual = g_Friends(aInx).IsMutual
                UserIsW3 = (sProd = PRODUCT_W3XP Or sProd = PRODUCT_WAR3)
                Select Case sProd
                    Case PRODUCT_STAR, PRODUCT_SEXP, PRODUCT_W2BN, PRODUCT_WAR3, PRODUCT_W3XP, PRODUCT_JSTR, PRODUCT_SSHR
                        UserHasStats = True
                End Select
                Select Case StrReverse(BotVars.Product)
                    Case PRODUCT_STAR, PRODUCT_SEXP, PRODUCT_W2BN, PRODUCT_WAR3, PRODUCT_W3XP, PRODUCT_JSTR, PRODUCT_SSHR
                        SelfHasStats = True
                End Select
                
                mnuPopFLWhisper.Enabled = bIsOn
                mnuPopFLInvite.Enabled = UserIsW3 And bIsMutual And g_Clan.Self.Rank >= 3

                mnuPopFLStats.Enabled = UserHasStats Or SelfHasStats
                mnuPopFLWebProfile.Enabled = UserIsW3
            End If
        End If
        
        mnuPopFList.Tag = lvFriendList.SelectedItem.Text 'Record which user is selected at time of right-clicking. - FrOzeN
        
        PopupMenu mnuPopFList
    End If
End Sub

Private Sub lvChannel_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim lvhti As LVHITTESTINFO
    Dim lItemIndex As Long
    Dim sOutBuf As String
    Dim sTemp As String
    Dim UserAccess As udtGetAccessResponse
    Dim Clan As String
   
    lvhti.pt.x = x / Screen.TwipsPerPixelX
    lvhti.pt.y = y / Screen.TwipsPerPixelY
    lItemIndex = SendMessageAny(lvChannel.hWnd, LVM_HITTEST, -1, lvhti) + 1
 
    If m_lCurItemIndex <> lItemIndex Then
        m_lCurItemIndex = lItemIndex
        
        If m_lCurItemIndex = 0 Then   ' no item under the mouse pointer
            ListToolTip.Destroy
        Else
            'UserAccess = GetCumulativeAccess(lvChannel.ListItems(m_lCurItemIndex).text, "USER")
        
            ListToolTip.Title = _
                "Information for " & lvChannel.ListItems(m_lCurItemIndex).Text
                
            'If (UserAccess.Name <> vbNullString) Then
            '    sTemp = sTemp & "["
            '
            '    If (UserAccess.Access > 0) Then
            '        sTemp = sTemp & "rank: " & UserAccess.Access
            '    End If
            '
            '    If ((UserAccess.Flags <> "%") And (UserAccess.Flags <> vbNullString)) Then
            '        If (UserAccess.Access > 0) Then
            '            sTemp = sTemp & ", "
            '        End If
            '
            '        sTemp = sTemp & "flags: " & UserAccess.Flags
            '    End If
            '
            '    sTemp = sTemp & "]" & vbCrLf
            'End If
                
            
            lItemIndex = g_Channel.GetUserIndex(lvChannel.ListItems(m_lCurItemIndex).Text)
            
            If (lItemIndex > 0) Then
                With g_Channel.Users(lItemIndex)
                    'ParseStatstring .Statstring, sOutBuf, Clan
            
                    'sTemp = sTemp & vbCrLf
                    sTemp = sTemp & "Ping at login: " & .Ping & "ms" & vbCrLf
                    sTemp = sTemp & "Flags: " & FlagDescription(.Flags, True) & vbCrLf
                    sTemp = sTemp & vbCrLf
                    sTemp = sTemp & .Stats.ToString
                
                    ListToolTip.TipText = sTemp
                    
                End With
                
                Call ListToolTip.Create(lvChannel.hWnd, CLng(x), CLng(y))
            End If
        End If
    End If
End Sub

Private Sub lvFriendList_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim lvhti As LVHITTESTINFO
    Dim lItemIndex As Long
   
    lvhti.pt.x = x / Screen.TwipsPerPixelX
    lvhti.pt.y = y / Screen.TwipsPerPixelY
    lItemIndex = SendMessageAny(lvFriendList.hWnd, LVM_HITTEST, 0, lvhti) + 1
   
    If m_lCurItemIndex <> lItemIndex Then
        m_lCurItemIndex = lItemIndex
        
        If m_lCurItemIndex = 0 Then   ' no item under the mouse pointer
            ListToolTip.Destroy
        Else
            ListToolTip.Title = "Information for " & lvFriendList.ListItems(m_lCurItemIndex).Text
            
            Dim sTemp As String
            
            If ((lItemIndex > 0) And (g_Friends.Count > 0)) Then
                lItemIndex = FriendListHandler.UsernameToFLIndex(lvFriendList.ListItems(m_lCurItemIndex).Text)
            
                With g_Friends.Item(lItemIndex)
'                    Private Const FRL_OFFLINE& = &H0
'                    Private Const FRL_NOTINCHAT& = &H1
'                    Private Const FRL_INCHAT& = &H2
'                    Private Const FRL_PUBLICGAME& = &H3
'                    Private Const FRL_PRIVATEGAME& = &H5
                    If .IsOnline Then
                        sTemp = sTemp & "Using " & ProductCodeToFullName(.Game) & " "
                    End If
                    
                    Select Case .LocationID
                        Case FRL_OFFLINE
                            sTemp = sTemp & "This person is offline."
                        Case FRL_NOTINCHAT
                            sTemp = sTemp & "in limbo. (not yet in chat)"
                        Case FRL_INCHAT
                            sTemp = sTemp & "in a Battle.net channel."
                        Case FRL_PUBLICGAME
                            sTemp = sTemp & "in a public game."
                        Case FRL_PRIVATEGAME
                            sTemp = sTemp & "in a private game."
                    End Select
                    
'                    Private Const FRS_NONE& = &H0
'                    Private Const FRS_MUTUAL& = &H1
'                    Private Const FRS_DND& = &H2
'                    Private Const FRS_AWAY& = &H4

                    If (.Status And FRS_MUTUAL) = FRS_MUTUAL Then
                        sTemp = sTemp & vbCrLf & "Mutual friend"
                        
                        Select Case (.LocationID)
                            Case FRL_INCHAT
                                sTemp = sTemp & ", in channel " & .Location & "."
                            Case FRL_PRIVATEGAME
                                sTemp = sTemp & ", in game " & .Location & "."
                            Case Else
                                sTemp = sTemp & "."
                        End Select
                    End If
                    
                    If (.LocationID = FRL_PUBLICGAME) Then
                        sTemp = sTemp & vbCrLf & "Currently in the public game '" & .Location & "'."
                    End If
                    
                    ListToolTip.TipText = sTemp
                End With
                
                Call ListToolTip.Create(lvFriendList.hWnd, CLng(x), CLng(y))
            End If
        End If
    End If
End Sub

Private Sub lvClanList_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim lvhti As LVHITTESTINFO
    Dim lItemIndex As Integer
    Dim ClanMember As clsClanMemberObj
   
    lvhti.pt.x = x / Screen.TwipsPerPixelX
    lvhti.pt.y = y / Screen.TwipsPerPixelY
    lItemIndex = SendMessageAny(lvClanList.hWnd, LVM_HITTEST, 0, lvhti) + 1
   
    If m_lCurItemIndex <> lItemIndex Then
        m_lCurItemIndex = lItemIndex
        
        If m_lCurItemIndex = 0 Then   ' no item under the mouse pointer
            ListToolTip.Destroy
        Else
            ListToolTip.Title = "Information for " & lvClanList.ListItems(m_lCurItemIndex).Text
            
            Dim sTemp As String
            
            If ((lItemIndex > 0) And (g_Clan.Members.Count > 0)) Then
                Set ClanMember = g_Clan.GetMember(lvClanList.ListItems(m_lCurItemIndex).Text)
                
                If (Not ClanMember Is Nothing) Then
                    With ClanMember
                        If (.Rank = 4) Then
                            sTemp = sTemp & "The "
                        Else
                            sTemp = sTemp & "This "
                        End If
                        
                        sTemp = sTemp & .RankName & " is currently "
                        
                        If (.IsOnline) Then
                            sTemp = sTemp & "online"
                            
                            If (LenB(.Location) > 0) Then
                                sTemp = sTemp & " in " & .Location
                            End If
                        Else
                            sTemp = sTemp & "offline"
                        End If
                        
                        sTemp = sTemp & "."
                        
                        ListToolTip.TipText = sTemp
                    End With
                    Set ClanMember = Nothing
                End If
                
                Call ListToolTip.Create(lvClanList.hWnd, CLng(x), CLng(y))
            End If
        End If
    End If
End Sub

Private Sub mnuCatchPhrases_Click()
    frmCatch.Show
End Sub

Private Sub mnuChangeLog_Click()
    ShellOpenURL "http://www.stealthbot.net/wiki/changelog", "the StealthBot Changelog"
End Sub

Private Sub mnuOpenScriptFolder_Click()
    Dim sPath As String
    sPath = GetFolderPath("Scripts")
    
    ' Does the script folder exist?
    If (LenB(Dir$(sPath, vbDirectory)) > 0) Then
        Shell StringFormat("explorer.exe {0}", sPath), vbNormalFocus
    Else
        ' Try and create it
        MkDir sPath
        
        ' Did it work?
        If (LenB(Dir$(sPath, vbDirectory)) > 0) Then
            Shell StringFormat("explorer.exe {0}", sPath), vbNormalFocus
        Else
            Call frmChat.AddChat(RTBColors.ErrorMessageText, "Your script folder does not exist, and could not be created.")
            Call frmChat.AddChat(RTBColors.ErrorMessageText, "Script folder path: " & sPath)
            Exit Sub
        End If
    End If
End Sub

Private Sub mnuPopClanAddLeft_Click()
    On Error Resume Next
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    If txtPre.Enabled Then 'fix for topic 25290 -a
        txtPre.Text = StringFormat("/w {0} ", GetClanSelectedUser)
        
        cboSend.SetFocus
        cboSend.SelStart = Len(cboSend.Text)
    End If
End Sub

Private Sub mnuPopClanAddToFList_Click()
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    If Not (lvClanList.SelectedItem Is Nothing) Then
        AddQ "/f a " & CleanUsername(GetClanSelectedUser), PRIORITY.CONSOLE_MESSAGE
    End If
End Sub

Private Sub mnuPopClanCopy_Click()
    On Error Resume Next
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    Clipboard.Clear
    
    Clipboard.SetText GetClanSelectedUser
End Sub

Private Sub mnuPopClanDemote_Click()
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If MsgBox("Are you sure you want to demote " & GetClanSelectedUser & "?", vbYesNo, "StealthBot") = vbYes Then
        
        With PBuffer
            .InsertDWord &H1
            .InsertNTString GetClanSelectedUser
            .InsertByte lvClanList.ListItems(lvClanList.SelectedItem.Index).SmallIcon - 1
            .SendPacket SID_CLANRANKCHANGE
        End With
        
        AwaitingClanInfo = 1
        
    End If
End Sub

Private Sub mnuPopClanDisband_Click()
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If MsgBox("Are you sure you want to disband this clan?", vbYesNo Or vbCritical, "StealthBot") = vbYes Then
        With PBuffer
            .InsertDWord &H1    '//cookie
            .SendPacket SID_CLANDISBAND
        End With
        
        AwaitingSelfRemoval = 1
    End If
End Sub

Private Sub mnuPopClanLeave_Click()
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If MsgBox("Are you sure you want to leave the clan?", vbYesNo, "StealthBot") = vbYes Then
        With PBuffer
            .InsertDWord &H1    '//cookie
            .InsertNTString GetCurrentUsername
            .SendPacket SID_CLANREMOVEMEMBER
        End With

        AwaitingSelfRemoval = 1
    End If
End Sub

Private Sub mnuPopClanMakeChief_Click()
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If MsgBox("Are you sure you want to make " & GetClanSelectedUser & " the new Chieftain?", vbYesNo Or vbCritical, "StealthBot") = vbYes Then
        With PBuffer
            .InsertDWord &H1    '//cookie
            .InsertNTString GetClanSelectedUser
            .SendPacket SID_CLANMAKECHIEFTAIN
        End With
        
        AwaitingClanInfo = 1
    End If
End Sub

Private Sub mnuPopClanProfile_Click()
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    RequestProfile GetClanSelectedUser
    
    frmProfile.PrepareForProfile GetClanSelectedUser, False
End Sub

Private Sub mnuPopClanPromote_Click()
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If MsgBox("Are you sure you want to promote " & GetClanSelectedUser & "?", vbYesNo, "StealthBot") = vbYes Then
        With PBuffer
            .InsertDWord &H3
            .InsertNTString GetClanSelectedUser
            .InsertByte lvClanList.ListItems(lvClanList.SelectedItem.Index).SmallIcon + 1
            .SendPacket SID_CLANRANKCHANGE
        End With
        
        AwaitingClanInfo = 1
    End If
End Sub

Private Sub mnuPopClanRemove_Click()
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    Dim L As Long
    L = TimeSinceLastRemoval

    If L < 30 Then
        AddChat RTBColors.ErrorMessageText, "You must wait " & 30 - L & " more seconds before you " & _
                "can remove another user from your clan."
    Else
        If MsgBox("Are you sure you want to remove this user from the clan?", vbExclamation + vbYesNo, _
                "StealthBot") = vbYes Then
                
            With PBuffer
                If lvClanList.SelectedItem.Index > 0 Then
                    .InsertDWord 1 'lvClanList.ListItems(lvClanList.SelectedItem.Index).SmallIcon
                    .InsertNTString GetClanSelectedUser
                    .SendPacket SID_CLANREMOVEMEMBER
                End If
                
                AwaitingClanInfo = 1
            End With
            
            LastRemoval = GetTickCount
        End If
    End If
End Sub

Private Sub mnuPopClanStatsWAR3_Click()
    Dim sProd As String
    
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    sProd = PRODUCT_WAR3
    
    If (StrComp(sProd, StrReverse$(BotVars.Product), vbBinaryCompare) = 0) Then
        sProd = vbNullString
    Else
        sProd = Space$(1) & sProd
    End If
    
    AddQ "/stats " & CleanUsername(GetClanSelectedUser) & sProd, PRIORITY.CONSOLE_MESSAGE
End Sub

Private Sub mnuPopClanStatsW3XP_Click()
    Dim sProd As String
    
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    sProd = PRODUCT_W3XP
    
    If (StrComp(sProd, StrReverse$(BotVars.Product), vbBinaryCompare) = 0) Then
        sProd = vbNullString
    Else
        sProd = Space$(1) & sProd
    End If
    
    AddQ "/stats " & CleanUsername(GetClanSelectedUser) & sProd, PRIORITY.CONSOLE_MESSAGE
End Sub

Private Sub mnuPopClanUserlistWhois_Click()
    On Error Resume Next
    
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    Dim temp As udtGetAccessResponse
    Dim s As String
    
    s = GetClanSelectedUser
    
    temp = GetAccess(s)
    
    With RTBColors
        If temp.Rank > -1 Then
            If temp.Rank > 0 Then
                If temp.Flags <> vbNullString Then
                    AddChat .ConsoleText, "Found user " & s & ", with rank " & temp.Rank & " and flags " & temp.Flags & "."
                Else
                    AddChat .ConsoleText, "Found user " & s & ", with rank " & temp.Rank & "."
                End If
            Else
                If temp.Flags <> vbNullString Then
                    AddChat .ConsoleText, "Found user " & s & ", with flags " & temp.Flags & "."
                Else
                    AddChat .ConsoleText, "User not found."
                End If
            End If
        Else
            AddChat .ConsoleText, "User not found."
        End If
    End With
End Sub

Private Sub mnuPopClanWebProfileWAR3_Click()
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    GetW3LadderProfile GetClanSelectedUser, WAR3
End Sub

Private Sub mnuPopClanWebProfileW3XP_Click()
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    GetW3LadderProfile GetClanSelectedUser, W3XP
End Sub

Private Sub mnuPopClanWhisper_Click()
    On Error Resume Next
    
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If cboSend.Text <> vbNullString Then
        AddQ "/w " & CleanUsername(GetClanSelectedUser, True) & Space(1) & _
                cboSend.Text, PRIORITY.CONSOLE_MESSAGE
        
        cboSend.AddItem cboSend.Text, 0
        cboSend.Text = vbNullString
        cboSend.SetFocus
    End If
End Sub

Private Sub mnuPopClanWhois_Click()
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If Not (lvClanList.SelectedItem Is Nothing) Then
        AddQ "/whois " & lvClanList.SelectedItem.Text, PRIORITY.CONSOLE_MESSAGE
    End If
End Sub

Private Sub mnuPopFLAddLeft_Click()
    On Error Resume Next
    If Not PopupMenuCLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    Dim Index As Integer
    Dim s As String
    
    If txtPre.Enabled Then 'fix for topic 25290 -a
        s = vbNullString
        If Dii Then s = "*"
        s = StringFormat("/w {0}{1} ", s, GetFriendsSelectedUser)
        txtPre.Text = s
        
        cboSend.SetFocus
        cboSend.SelStart = Len(cboSend.Text)
    End If
End Sub

Private Sub mnuPopFLCopy_Click()
    On Error Resume Next
    If Not PopupMenuFLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    Clipboard.Clear
    
    Clipboard.SetText GetFriendsSelectedUser
End Sub

'Will move the selected user one spot down on the friends list.
Private Sub mnuPopFLDemote_Click()
    If Not PopupMenuFLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If Not (lvFriendList.SelectedItem Is Nothing) Then
        With lvFriendList.SelectedItem
            If (.Index < lvFriendList.ListItems.Count) Then
                AddQ "/f d " & GetFriendsSelectedUser, PRIORITY.CONSOLE_MESSAGE
                'MoveFriend .index, .index + 1
            End If
        End With
    End If
End Sub

Private Sub mnuPopFLInvite_Click()
    If Not PopupMenuFLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    Dim sPlayer As String
    
    If Not lvFriendList.SelectedItem Is Nothing Then
        sPlayer = GetFriendsSelectedUser
    End If
    
    If LenB(sPlayer) > 0 Then
        If g_Clan.Self.Rank >= 3 Then
            InviteToClan (ReverseConvertUsernameGateway(sPlayer))
            AddChat RTBColors.InformationText, "[CLAN] Invitation sent to " & GetFriendsSelectedUser & ", awaiting reply."
        End If
    End If
End Sub

Private Sub mnuPopFLProfile_Click()
    If Not PopupMenuFLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If Not lvFriendList.SelectedItem Is Nothing Then
        RequestProfile CleanUsername(lvFriendList.SelectedItem.Text)
        
        frmProfile.PrepareForProfile CleanUsername(lvFriendList.SelectedItem.Text), False
    End If
End Sub

'Will move the selected user one spot up on the friends list.
Private Sub mnuPopFLPromote_Click()
    If Not PopupMenuFLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If Not (lvFriendList.SelectedItem Is Nothing) Then
        With lvFriendList.SelectedItem
            If (.Index > 1) Then
                AddQ "/f p " & GetFriendsSelectedUser, PRIORITY.CONSOLE_MESSAGE
                'MoveFriend .index, .index - 1
            End If
        End With
    End If
End Sub

Private Sub mnuPopFLRefresh_Click()
    lvFriendList.ListItems.Clear
    Call FriendListHandler.RequestFriendsList(PBuffer)
End Sub

Private Sub mnuPopFLRemove_Click()
    If Not PopupMenuFLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If Not (lvFriendList.SelectedItem Is Nothing) Then
        AddQ "/f r " & GetFriendsSelectedUser, PRIORITY.CONSOLE_MESSAGE
    End If
End Sub

Private Sub mnuPopFLStats_Click()
    If Not PopupMenuFLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    Dim aInx As Integer
    Dim sProd As String
    
    aInx = lvFriendList.SelectedItem.Index
    sProd = g_Friends(aInx).Game
    Select Case sProd
        Case PRODUCT_STAR, PRODUCT_SEXP, PRODUCT_W2BN, PRODUCT_WAR3, PRODUCT_W3XP, PRODUCT_JSTR, PRODUCT_SSHR
            ' get stats for user on their current product
        Case Else
            ' their current product does not have stats, or they are offline
            Select Case StrReverse$(BotVars.Product)
                Case PRODUCT_STAR, PRODUCT_SEXP, PRODUCT_W2BN, PRODUCT_WAR3, PRODUCT_W3XP, PRODUCT_JSTR, PRODUCT_SSHR
                    ' get stats for user on the bot's product
                    sProd = StrReverse$(BotVars.Product)
                Case Else
                    ' unspecified product
                    AddChat RTBColors.ConsoleText, "This bot and the specified friend are not on a game that stores stats viewable via the Battle.net /stats command. " & _
                                                   "Type /stats " & CleanUsername(GetFriendsSelectedUser) & " <desired product code> to get this user's stats for another game."
                    Exit Sub
            End Select
    End Select
    
    If (StrComp(sProd, StrReverse$(BotVars.Product), vbBinaryCompare) = 0) Then
        sProd = vbNullString
    Else
        sProd = Space$(1) & sProd
    End If
    
    AddQ "/stats " & CleanUsername(GetFriendsSelectedUser) & sProd, PRIORITY.CONSOLE_MESSAGE
End Sub

Private Sub mnuPopFLUserlistWhois_Click()
    On Error Resume Next
    
    If Not PopupMenuFLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    Dim temp As udtGetAccessResponse
    Dim s As String
    
    s = GetFriendsSelectedUser
    
    temp = GetAccess(s)
    
    With RTBColors
        If temp.Rank > -1 Then
            If temp.Rank > 0 Then
                If temp.Flags <> vbNullString Then
                    AddChat .ConsoleText, "Found user " & s & ", with rank " & temp.Rank & " and flags " & temp.Flags & "."
                Else
                    AddChat .ConsoleText, "Found user " & s & ", with rank " & temp.Rank & "."
                End If
            Else
                If temp.Flags <> vbNullString Then
                    AddChat .ConsoleText, "Found user " & s & ", with flags " & temp.Flags & "."
                Else
                    AddChat .ConsoleText, "User not found."
                End If
            End If
        Else
            AddChat .ConsoleText, "User not found."
        End If
    End With
End Sub

Private Sub mnuPopFLWebProfile_Click()
    If Not PopupMenuFLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    Dim aInx As Integer
    Dim sProd As String
    Dim webProd As enuWebProfileTypes
    
    aInx = lvFriendList.SelectedItem.Index
    sProd = g_Friends(aInx).Game
    Select Case sProd
        ' get web profile for user on their current product
        Case PRODUCT_WAR3
            webProd = WAR3
        Case PRODUCT_W3XP
            webProd = W3XP
        Case Else
            Select Case StrReverse$(BotVars.Product)
                ' get web profile for user on the bot's product
                Case PRODUCT_WAR3
                    webProd = WAR3
                Case PRODUCT_W3XP
                    webProd = W3XP
                Case Else
                    ' their current product does not have stats, or they are offline
                    AddChat RTBColors.ConsoleText, "The specified friend must be online to decide which web profile to view."
                    Exit Sub
            End Select
    End Select
    
    GetW3LadderProfile CleanUsername(GetFriendsSelectedUser), webProd
End Sub

Private Sub mnuPopFLWhisper_Click()
    Dim Value As String
    
    If Not PopupMenuFLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    Value = cboSend.Text
    
    If LenB(Value) > 0 Then
        Value = "/w " & CleanUsername(GetFriendsSelectedUser, True) & Space$(1) & Value
        
        AddQ Value, PRIORITY.CONSOLE_MESSAGE
        
        cboSend.AddItem Value, 0
        cboSend.Text = vbNullString
        
        On Error Resume Next
        cboSend.SetFocus
    End If
End Sub

Private Sub mnuPopInvite_Click()
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    Dim sPlayer As String
    
    If Not lvChannel.SelectedItem Is Nothing Then
        sPlayer = GetSelectedUser
    End If
    
    If LenB(sPlayer) > 0 Then
        If g_Clan.Self.Rank >= 3 Then
            InviteToClan (ReverseConvertUsernameGateway(sPlayer))
            AddChat RTBColors.InformationText, "[CLAN] Invitation sent to " & GetSelectedUser & ", awaiting reply."
        End If
    End If
End Sub

Private Sub mnuPopProfile_Click()
    On Error Resume Next
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    Dim sUser As String
    sUser = StripAccountNumber(CleanUsername(GetSelectedUser))
    
    RequestProfile sUser
    
    frmProfile.PrepareForProfile sUser, False
End Sub

Private Sub mnuPopStats_Click()
    Dim aInx As Integer
    Dim sProd As String
    
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    aInx = g_Channel.GetUserIndex(GetSelectedUser)
    sProd = g_Channel.Users(aInx).Game
    Select Case sProd
        Case PRODUCT_STAR, PRODUCT_SEXP, PRODUCT_W2BN, PRODUCT_WAR3, PRODUCT_W3XP, PRODUCT_JSTR, PRODUCT_SSHR
            ' get stats for user on their current product
        Case Else
            ' unspecified product
            AddChat RTBColors.ConsoleText, "The specified user is not on a game that stores stats viewable via the Battle.net /stats command. " & _
                                           "Type /stats " & CleanUsername(GetSelectedUser) & " <desired product code> to get this user's stats for another game."
            Exit Sub
    End Select
    
    If (StrComp(sProd, StrReverse$(BotVars.Product), vbBinaryCompare) = 0) Then
        sProd = vbNullString
    Else
        sProd = Space$(1) & sProd
    End If
    
    AddQ "/stats " & StripAccountNumber(CleanUsername(GetSelectedUser)) & sProd, PRIORITY.CONSOLE_MESSAGE
End Sub

Private Sub mnuPopUserlistWhois_Click()
    On Error Resume Next
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    Dim temp As udtGetAccessResponse
    Dim s As String
    
    s = GetSelectedUser
    
    temp = GetAccess(s)
    
    With RTBColors
        If temp.Rank > -1 Then
            If temp.Rank > 0 Then
                If temp.Flags <> vbNullString Then
                    AddChat .ConsoleText, "Found user " & s & ", with rank " & temp.Rank & " and flags " & temp.Flags & "."
                Else
                    AddChat .ConsoleText, "Found user " & s & ", with rank " & temp.Rank & "."
                End If
            Else
                If temp.Flags <> vbNullString Then
                    AddChat .ConsoleText, "Found user " & s & ", with flags " & temp.Flags & "."
                Else
                    AddChat .ConsoleText, "User not found."
                End If
            End If
        Else
            AddChat .ConsoleText, "User not found."
        End If
    End With
End Sub

Private Sub mnuHomeChannel_Click()
    If (LenB(Config.HomeChannel) = 0) Then
        ' do product home join instead
        Call DoChannelJoinProductHome
    Else
        ' go home
        Call FullJoin(Config.HomeChannel, 2)
    End If
End Sub

Private Sub mnuLastChannel_Click()
    If (LenB(BotVars.LastChannel) = 0) Then
        ' do product home join instead
        Call DoChannelJoinProductHome
    Else
        ' go to last
        Call FullJoin(BotVars.LastChannel, 2)
    End If
End Sub

Private Sub mnuRealmSwitch_Click()
    If Dii Then
        If ds.MCPHandler Is Nothing Then
            Set ds.MCPHandler = New clsMCPHandler
            
            SEND_SID_QUERYREALMS2
        Else
            Call ds.MCPHandler.HandleQueryRealmServersResponse
        End If
    End If
End Sub

Private Sub mnuPublicChannels_Click(Index As Integer)
    ' some public channels are redirects
    'If (StrComp(mnuPublicChannels(Index).Caption, g_Channel.Name, vbTextCompare) = 0) Then
    '    Exit Sub
    'End If
    
    If Not BotVars.PublicChannels Is Nothing Then
        If BotVars.PublicChannels.Count > Index Then
            Select Case Config.AutoCreateChannels
                Case "ALERT", "NEVER"
                    Call FullJoin(BotVars.PublicChannels.Item(Index + 1), 0)
                Case Else ' "ALWAYS"
                    Call FullJoin(BotVars.PublicChannels.Item(Index + 1), 2)
            End Select
        End If
        'AddQ "/join " & PublicChannels.Item(Index + 1), PRIORITY.CONSOLE_MESSAGE
    End If
End Sub

Private Sub mnuCustomChannels_Click(Index As Integer)
    If (StrComp(QC(Index + 1), g_Channel.Name, vbTextCompare) = 0) Then
        Exit Sub
    End If

    Select Case Config.AutoCreateChannels
        Case "ALERT", "NEVER"
            Call FullJoin(QC(Index + 1), 0)
        Case Else ' "ALWAYS"
            Call FullJoin(QC(Index + 1), 2)
    End Select
    
    'AddQ "/join " & QC(Index + 1), PRIORITY.CONSOLE_MESSAGE
End Sub

Private Sub mnuCommandManager_Click()
    'frmCommands.Show vbModal, Me
    frmCommands.Show vbModeless
End Sub

Private Sub mnuConnect2_Click()
    Call DoConnect
End Sub

Private Sub mnuDisableVoidView_Click()
    mnuDisableVoidView.Checked = Not (mnuDisableVoidView.Checked)
    Config.VoidView = Not CBool(mnuDisableVoidView.Checked)
    Call Config.Save
    
    If Config.VoidView And g_Channel.IsSilent Then
        tmrSilentChannel(1).Enabled = Config.VoidView
        AddQ "/unignore " & GetCurrentUsername
    End If
End Sub

Private Sub mnuDisconnect2_Click()
    Dim Key As String, L As Long
    Key = GetProductKey()
    
'    If AttemptedNewVerbyte Then
'        AttemptedNewVerbyte = False
'        l = CLng(Val("&H" & ReadCFG("Main", Key & "VerByte")))
'        WriteINI "Main", Key & "VerByte", Hex(l - 1)
'    End If
    
    GErrorHandler.Reset
    Call DoDisconnect
End Sub

Private Sub mnuEditCaught_Click()
    If Dir$(GetFilePath(FILE_CAUGHT_PHRASES)) = vbNullString Then
        MsgBox "The bot has not caught any phrases yet."
        Exit Sub
    Else
        ShellOpenURL GetFilePath(FILE_CAUGHT_PHRASES), , False
    End If
End Sub

Private Sub mnuFlash_Click()
    mnuFlash.Checked = (Not mnuFlash.Checked)
    Config.FlashOnEvents = CBool(mnuFlash.Checked)
    Call Config.Save
End Sub

'Moves a person in the friends list view.
Private Sub MoveFriend(startPos As Integer, endPos As Integer)
    With lvFriendList.ListItems
        If (startPos > endPos) Then
            .Add endPos, , .Item(startPos).Text, , .Item(startPos).SmallIcon
            .Item(endPos).ListSubItems.Add , , , .Item(startPos + 1).ListSubItems.Item(1).ReportIcon
            .Remove startPos + 1
        Else
            .Add endPos + 1, , .Item(startPos).Text, .Item(startPos).Icon, .Item(startPos).SmallIcon
            .Item(endPos + 1).ListSubItems.Add , , , .Item(startPos).ListSubItems.Item(1).ReportIcon
            .Remove startPos
        End If
    End With
End Sub

Private Sub mnuGetNews_Click()
    If Not RequestINetPage(GetNewsURL(), SB_INET_NEWS, False) Then
        Call HandleNews("INet is busy", -1)
    End If
End Sub

Sub mnuHelpReadme_Click()
    OpenReadme
End Sub

Sub mnuHelpWebsite_Click()
    ShellOpenURL "http://www.stealthbot.net", "the StealthBot Forum"
End Sub

Private Sub mnuHideBans_Click()
    mnuHideBans.Checked = (Not mnuHideBans.Checked)
    Config.HideBanMessages = CBool(mnuHideBans.Checked)
    Call Config.Save
    AddChat RTBColors.InformationText, "Ban messages " & IIf(mnuHideBans.Checked, "disabled", "enabled") & "."
End Sub

Private Sub mnuHideWhispersInrtbChat_Click()
    mnuHideWhispersInrtbChat.Checked = (Not mnuHideWhispersInrtbChat.Checked)
    Config.HideWhispersInMain = CBool(mnuHideWhispersInrtbChat.Checked)
    Call Config.Save
End Sub

Private Sub mnuIgnoreInvites_Click()
    If mnuIgnoreInvites.Checked Then
        mnuIgnoreInvites.Checked = False
    Else
        mnuIgnoreInvites.Checked = True
    End If
    
    Config.IgnoreClanInvites = CBool(mnuIgnoreInvites.Checked)
    Call Config.Save
End Sub

Private Sub mnuLog0_Click()
    BotVars.Logging = 2
    Config.LoggingMode = BotVars.Logging
    Call Config.Save
    
    AddChat RTBColors.InformationText, "Full text logging enabled."
    mnuLog1.Checked = False
    mnuLog0.Checked = True
    mnuLog2.Checked = False
    'mnuLog3.Checked = False
    
    'MakeLoggingDirectory
End Sub

Private Sub mnuLog1_Click()
    BotVars.Logging = 1
    Config.LoggingMode = BotVars.Logging
    Call Config.Save
    
    AddChat RTBColors.InformationText, "Partial text logging enabled."
    mnuLog1.Checked = True
    mnuLog0.Checked = False
    mnuLog2.Checked = False
    'mnuLog3.Checked = False
    
    'MakeLoggingDirectory
End Sub

Private Sub mnuLog2_Click()
    BotVars.Logging = 0
    Config.LoggingMode = BotVars.Logging
    Call Config.Save
    
    AddChat RTBColors.InformationText, "Logging disabled."
    mnuLog1.Checked = False
    mnuLog0.Checked = False
    mnuLog2.Checked = True
    'mnuLog3.Checked = False
End Sub

Private Sub mnuOpenBotFolder_Click()
    Shell StringFormat("explorer.exe {0}", CurDir$()), vbNormalFocus
End Sub


Private Sub mnuPacketLog_Click()
    Dim f As Integer
    
    If mnuPacketLog.Checked Then
        ' turning this feature off
        AddChat RTBColors.SuccessText, "StealthBot packet traffic will no longer be logged."
    Else
        ' turning it on
        AddChat RTBColors.SuccessText, "StealthBot packet traffic will be logged in the bot's folder, in a file named " & Format(Date, "yyyy-MM-dd") & "-PacketLog.txt."
        AddChat RTBColors.SuccessText, "--"
        AddChat RTBColors.SuccessText, "Log packets at your own risk! Please read the note below:"
        AddChat RTBColors.ErrorMessageText, "*** CAUTION: THIS LOG MAY CONTAIN PRIVATE INFORMATION."
        AddChat RTBColors.ErrorMessageText, "*** CAUTION: DO NOT DISTRIBUTE it in public posts on StealthBot.net or on any other website!"
        AddChat RTBColors.ErrorMessageText, "*** CAUTION: Only produce a packet log if you're specifically instructed to by"
        AddChat RTBColors.ErrorMessageText, "*** CAUTION: a StealthBot.net tech, or you know what you're doing!"
        AddChat RTBColors.SuccessText, "If you wish to stop logging packets, uncheck the menu item or restart your bot."
        AddChat RTBColors.SuccessText, "This feature only logs StealthBot traffic. It is not a system-wide packet capture utility."
    End If
    
    mnuPacketLog.Checked = Not mnuPacketLog.Checked
    LogPacketTraffic = mnuPacketLog.Checked
End Sub

Private Sub mnuPopAddLeft_Click()
    On Error Resume Next
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    Dim Index As Integer
    Dim s As String
    
    If txtPre.Enabled Then 'fix for topic 25290 -a
        s = vbNullString
        If Dii Then s = "*"
        s = StringFormat("/w {0}{1} ", s, GetSelectedUser)
        txtPre.Text = s
        
        cboSend.SetFocus
        cboSend.SelStart = Len(cboSend.Text)
    End If
End Sub

Private Sub mnuPopAddToFList_Click()
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    If Not (lvChannel.SelectedItem Is Nothing) Then
        AddQ "/f a " & StripAccountNumber(CleanUsername(GetSelectedUser)), PRIORITY.CONSOLE_MESSAGE
    End If
End Sub

Private Sub mnuPopDes_Click()
    On Error Resume Next
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN

    AddQ "/designate " & CleanUsername(GetSelectedUser, True), PRIORITY.CONSOLE_MESSAGE
End Sub

Private Sub mnuPopFLWhois_Click()
    If Not PopupMenuFLUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on.
    
    If Not (lvFriendList.SelectedItem Is Nothing) Then
        AddQ "/whois " & lvFriendList.SelectedItem.Text, PRIORITY.CONSOLE_MESSAGE
    End If
End Sub

Private Sub mnuPopSafelist_Click()
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    Dim gAcc As udtGetAccessResponse
    Dim toSafe As String
    
    On Error Resume Next
    
    toSafe = GetSelectedUser
    
    gAcc.Rank = 1000
    
    Call ProcessCommand(GetCurrentUsername, "/safeadd " & toSafe, True, False)
End Sub

Private Sub mnuPopShitlist_Click()
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    Dim gAcc As udtGetAccessResponse
    Dim toBan As String
    
    On Error Resume Next
    
    toBan = GetSelectedUser
    
    gAcc.Rank = 1000
    
    Call ProcessCommand(GetCurrentUsername, "/shitadd " & toBan, True, False)
End Sub

Private Sub mnuPopSquelch_Click()
    On Error Resume Next
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    AddQ "/squelch " & GetSelectedUser, PRIORITY.CONSOLE_MESSAGE, PRIORITY.CONSOLE_MESSAGE
End Sub


Private Sub mnuPopUnsquelch_Click()
    'On Error Resume Next
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    AddQ "/unsquelch " & GetSelectedUser, PRIORITY.CONSOLE_MESSAGE
End Sub

Private Sub mnuPopWhisper_Click()
    On Error Resume Next
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    If cboSend.Text <> vbNullString Then
        AddQ "/w " & CleanUsername(GetSelectedUser, True) & Space(1) & _
                cboSend.Text, PRIORITY.CONSOLE_MESSAGE
        
        cboSend.AddItem cboSend.Text, 0
        cboSend.Text = vbNullString
        cboSend.SetFocus
    End If
End Sub

Private Sub mnuClear_Click()
    Call ClearChatScreen(3)
End Sub

Private Sub mnuClearWW_Click()
    Call ClearChatScreen(2)
End Sub

' clear the chat screen:
' 1 - clear chat window only
' 2 - clear whisper window only
' 3 (default) - clear chat and whisper
Sub ClearChatScreen(Optional ByVal ClearOption As Integer = 3)
    ' if they passed 0 (False), change to 3
    If ClearOption = 0 Then ClearOption = 3
    ' if they passed -1 (True), change to 1 (old behavior: DoNotClearWhispers)
    If ClearOption = -1 Then ClearOption = 1
    ' check for 2 (or 3) and clear whispers
    If ClearOption And 2 Then
        rtbWhispers.Text = vbNullString
        ' add cleared message
        AddWhisper RTBColors.ConsoleText, ">> Whisper window cleared."
    End If
    
    ' check for 1 (or 3) and clear chats
    If ClearOption And 1 Then
        rtbChat.Text = vbNullString
        rtbChatLength = 0
        ' add a sensical cleared message
        If ClearOption And 2 Then
            AddChat RTBColors.InformationText, "Chat window cleared."
        Else
            AddChat RTBColors.InformationText, "Chat and whisper windows cleared."
        End If
    End If
    
    ' set focus to send box
    On Error Resume Next
    cboSend.SetFocus
End Sub

Private Sub mnuPopWhois_Click()
    On Error Resume Next
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    AddQ "/whois " & CleanUsername(GetSelectedUser, True), PRIORITY.CONSOLE_MESSAGE
End Sub

Private Sub mnuPopWebProfile_Click()
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    Dim aInx As Integer
    Dim sProd As String
    Dim webProd As enuWebProfileTypes
    
    aInx = lvChannel.SelectedItem.Index
    sProd = g_Channel.Users(aInx).Game
    Select Case sProd
        ' get web profile for user on their current product
        Case PRODUCT_WAR3
            webProd = WAR3
        Case PRODUCT_W3XP
            webProd = W3XP
        Case Else
            ' their current product does not have a web profile
            AddChat RTBColors.ConsoleText, "The specified user must be on WarCraft III to view their web profile."
            Exit Sub
    End Select
    
    GetW3LadderProfile StripAccountNumber(CleanUsername(GetSelectedUser)), webProd
End Sub

Private Sub mnuClearedTxt_Click()
    Dim sPath As String
    sPath = StringFormat("{0}{1}.txt", g_Logger.LogPath, Format(Date, "yyyy-MM-dd"))
    
    If LenB(Dir$(sPath)) = 0 Then
        AddChat RTBColors.ErrorMessageText, "The log file for today is empty."
    Else
        ShellOpenURL sPath, , False
    End If
End Sub

Private Sub mnuRecordWindowPos_Click()
    RecordWindowPosition
End Sub

Private Sub mnuRepairCleanMail_Click()
    CleanUpMailFile
    frmChat.AddChat RTBColors.SuccessText, "Delivered and invalid pieces of mail have been removed from your mail.dat file."
End Sub

Private Sub mnuRepairDataFiles_Click()
    If MsgBox("Are you sure? This action will delete your mail.dat (Bot mail database) file.", vbYesNo, "Repair data files") = vbYes Then
        On Error Resume Next
        Kill GetFilePath(FILE_MAILDB)
        AddChat RTBColors.SuccessText, "The bot's DAT data files have been removed."
    End If
End Sub

Private Sub mnuRepairVerbytes_Click()
    Dim Index As Integer
    
    For Index = 0 To UBound(ProductList)
        If ProductList(Index).BNLS_ID > 0 Then
            Config.SetVersionByte ProductList(Index).ShortCode, GetVerByte(ProductList(Index).Code, 1)
        End If
    Next
    
    Call Config.Save
    
    frmChat.AddChat RTBColors.SuccessText, "The version bytes stored in config.ini have been restored to their defaults."
End Sub

Private Sub mnuScripts_Click()
'do nothing
End Sub

Private Sub mnuToggleShowOutgoing_Click()
    mnuToggleShowOutgoing.Checked = (Not mnuToggleShowOutgoing.Checked)
    Config.ShowOutgoingWhispers = CBool(mnuToggleShowOutgoing.Checked)
    Call Config.Save
End Sub

Private Sub mnuToggleWWUse_Click()
    mnuToggleWWUse.Checked = (Not mnuToggleWWUse.Checked)
    
    Config.WhisperWindows = CBool(mnuToggleWWUse.Checked)
    Call Config.Save
    
    If Not mnuToggleWWUse.Checked Then
        DestroyAllWWs
    End If
End Sub

Private Sub mnuUpdateVerbytes_Click()
    If Not RequestINetPage(VERBYTE_SOURCE, SB_INET_VBYTE, False) Then
        Call HandleUpdateVerbyte("INet is busy", -1)
    End If
End Sub

Private Sub mnuWhisperCleared_Click()
    Dim sPath As String
    sPath = StringFormat("{0}{1}-WHISPERS.txt", g_Logger.LogPath, Format(Date, "yyyy-MM-dd"))
    
    If LenB(Dir$(sPath)) = 0 Then
        AddChat RTBColors.ErrorMessageText, "The whisper log file for today is empty."
    Else
        ShellOpenURL sPath, , False
    End If
End Sub

Private Sub mnuEditUsers_Click()
    ShellOpenURL GetFilePath(FILE_USERDB), , False
End Sub

Sub mnuReloadScripts_Click()
    
    On Error GoTo ERROR_HANDLER

    'RunInAll "Event_LoggedOff"
    RunInAll "Event_Close"

    InitScriptControl SControl
    LoadScripts

    InitScripts
    
    Exit Sub

ERROR_HANDLER:

    ' Cannot call this method while the script is executing
    If (Err.Number = -2147467259) Then
        frmChat.AddChat RTBColors.ErrorMessageText, "Error: Script is still executing."
        
        Exit Sub
    End If

    frmChat.AddChat RTBColors.ErrorMessageText, "Error (#" & Err.Number & "): " & Err.Description & _
        " in mnuReloadScripts_Click()."
    
End Sub

Private Sub mnuSetTop_Click()
    mnuLog0.Checked = False
    mnuLog1.Checked = False
    mnuLog2.Checked = False

    Select Case BotVars.Logging
        Case 2: mnuLog0.Checked = True
        Case 1: mnuLog1.Checked = True
        Case 0: mnuLog2.Checked = True
    End Select
End Sub

Private Sub mnuTerms_Click()
    ShellOpenURL "http://eula.stealthbot.net", "the StealthBot EULA"
End Sub

Private Sub mnuFilters_Click()
    frmFilters.Show
End Sub

Private Sub mnuPopCopy_Click()
    On Error Resume Next
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    Clipboard.Clear
    
    Clipboard.SetText GetSelectedUser
End Sub

Private Sub mnuProfile_Click()
    frmProfile.PrepareForProfile vbNullString, True
End Sub

Private Sub mnuCustomChannelAdd_Click()
    Dim i As Integer
    
    If LenB(g_Channel.Name) > 0 Then
    
        For i = LBound(QC) To UBound(QC)
            If LenB(Trim$(QC(i))) = 0 Then
                QC(i) = g_Channel.Name
                PrepareQuickChannelMenu
                
                Exit Sub
            End If
        Next i
    
    End If
End Sub

Private Sub mnuCustomChannelEdit_Click()
    frmQuickChannel.Show
End Sub

Private Sub mnuReload_Click()
    On Error Resume Next
    Call ReloadConfig(1)
    AddChat RTBColors.SuccessText, "Configuration file loaded."
End Sub

Private Sub mnuUTF8_Click()
    If mnuUTF8.Checked Then
        mnuUTF8.Checked = False
        AddChat RTBColors.ConsoleText, "Messages will no longer be UTF-8-decoded."
    Else
        mnuUTF8.Checked = True
        AddChat RTBColors.ConsoleText, "Messages will now be UTF-8-decoded."
    End If
    
    Config.UseUTF8 = CBool(mnuUTF8.Checked)
    Call Config.Save
End Sub

Private Sub rtbChat_KeyDown(KeyCode As Integer, Shift As Integer)
    If (Shift = vbCtrlMask) And ((KeyCode = vbKeyL) Or (KeyCode = vbKeyE) Or (KeyCode = vbKeyR)) Then
        'Call Ctrl+L and Ctrl+R keyboard shortcuts as they code to automatically handle them will be canceled out below
        Select Case KeyCode
            Case vbKeyL
                Call mnuLock_Click
            Case vbKeyR
                Call mnuReloadScripts_Click
        End Select
        
        'Disable Ctrl+L, Ctrl+E, and Ctrl+R
        KeyCode = 0
    ElseIf (Shift = vbShiftMask) And (KeyCode = vbKeyDelete) Then
        'Call Shift+DEL keyboard shortcut since it doens't work with RTB focus.
        Call mnuClear_Click
    End If
End Sub

Private Sub rtbChat_KeyPress(KeyAscii As Integer)
    If (KeyAscii < 32) Then
        Exit Sub
    End If

    cboSend.SetFocus
    cboSend.SelText = Chr$(KeyAscii)
End Sub

Private Sub rtbWhispers_KeyDown(KeyCode As Integer, Shift As Integer)
    If (Shift = vbCtrlMask) And ((KeyCode = vbKeyL) Or (KeyCode = vbKeyE) Or (KeyCode = vbKeyR)) Then
        'Call Ctrl+L and Ctrl+R keyboard shortcuts as they code to automatically handle them will be canceled out below
        Select Case KeyCode
            Case vbKeyL
                Call mnuLock_Click
            Case vbKeyR
                Call mnuReloadScripts_Click
        End Select
        
        'Disable Ctrl+L, Ctrl+E, and Ctrl+R
        KeyCode = 0
    ElseIf (Shift = vbShiftMask) And (KeyCode = vbKeyDelete) Then
        'Call Shift+DEL keyboard shortcut since it doens't work with RTB focus.
        Call mnuClear_Click
    End If
End Sub

Private Sub rtbWhispers_KeyPress(KeyAscii As Integer)
    If (KeyAscii < 32) Then
        Exit Sub
    End If

    cboSend.SetFocus
    cboSend.SelText = Chr$(KeyAscii)
End Sub

Private Sub rtbChat_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    On Error Resume Next
    
    If Button = 1 And Len(rtbChat.SelText) > 0 Then
        If Not BotVars.NoRTBAutomaticCopy Then
            Clipboard.Clear
            Clipboard.SetText rtbChat.SelText, vbCFText
        End If
    End If
End Sub

Private Sub rtbWhispers_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    On Error Resume Next
    
    If Button = 1 And Len(rtbWhispers.SelText) > 0 Then
        Clipboard.Clear
        Clipboard.SetText rtbWhispers.SelText, vbCFText
    End If
End Sub

Private Sub mnuToggleFilters_Click()
    mnuToggleFilters.Checked = (Not (mnuToggleFilters.Checked))
    
    If Filters Then
        Filters = False
        AddChat RTBColors.InformationText, "Chat filtering disabled."
    Else
        Filters = True
        AddChat RTBColors.InformationText, "Chat filtering enabled."
    End If
    
    Config.ChatFilters = Filters
    Call Config.Save
End Sub

Private Sub mnuConnect_Click()
    GErrorHandler.Reset
    Call DoConnect
End Sub

Private Sub mnuPopKick_Click()
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    If MyFlags = 2 Or MyFlags = 18 Then
        AddQ "/kick " & CleanUsername(GetSelectedUser, True), PRIORITY.CONSOLE_MESSAGE
    End If
End Sub

Private Sub mnuPopBan_Click()
    If Not PopupMenuUserCheck Then Exit Sub 'Check user selected is the same one that was right-clicked on. - FrOzeN
    
    If MyFlags = 2 Or MyFlags = 18 Then
        AddQ "/ban " & CleanUsername(GetSelectedUser, True), PRIORITY.CONSOLE_MESSAGE
    End If
End Sub

Private Sub mnuTrayExit_click()
    Dim Result As VbMsgBoxResult

    Result = MsgBox("Are you sure you want to quit?", vbYesNo, "StealthBot")
    
    If (Result = vbYes) Then
        'frmChat.Show
    
        'UnhookWindowProc
        'RESTORE FORM
        'Call NewWindowProc(frmChat.hWnd, 0&, ID_TASKBARICON, WM_LBUTTONDOWN)
        'Call Form_Unload(0)
        Unload frmChat
    End If
End Sub

Private Sub mnuRestore_Click()
    Me.WindowState = vbNormal
    Me.Show
End Sub

Sub mnuLock_Click()
    mnuLock.Checked = (Not (mnuLock.Checked))
    
    If BotVars.LockChat = False Then
        AddChat RTBColors.InformationText, "Chat window locked."
        AddChat RTBColors.ErrorMessageText, "NO MESSAGES WHATSOEVER WILL BE DISPLAYED UNTIL YOU UNLOCK THE WINDOW."
        AddChat RTBColors.ErrorMessageText, "To return to normal mode, press CTRL+L or use the toggle under the Window menu."
        BotVars.LockChat = True
    Else
        BotVars.LockChat = False
        AddChat RTBColors.SuccessText, "Chat window unlocked."
    End If
End Sub

Sub mnuDisconnect_Click()
    Dim Key As String, L As Long
    Key = GetProductKey()
    
'    If AttemptedNewVerbyte Then
'        AttemptedNewVerbyte = False
'        l = CLng(Val("&H" & ReadCFG("Main", Key & "VerByte")))
'        WriteINI "Main", Key & "VerByte", Hex(l - 1)
'    End If
    
    GErrorHandler.Reset
    Call DoDisconnect
End Sub

Private Sub mnuExit_Click()
    'Call Form_Unload(0)
    Unload frmChat
End Sub

Private Sub mnuSetup_Click()
    If (SettingsForm Is Nothing) Then
        Set SettingsForm = New frmSettings
    End If
    
    SettingsForm.Show
End Sub

Private Sub mnuAbout_click()
    frmAbout.Show
End Sub

Private Sub mnuToggle_Click()
    mnuToggle.Checked = (Not (mnuToggle.Checked))
    
    If JoinMessagesOff = False Then
        AddChat RTBColors.InformationText, "Join/Leave messages disabled."
        JoinMessagesOff = True
    Else
        AddChat RTBColors.InformationText, "Join/Leave messages enabled."
        JoinMessagesOff = False
    End If
    
    Config.ShowJoinLeaves = Not JoinMessagesOff
    Call Config.Save
End Sub

Private Sub mnuUsers_Click()
    frmDBManager.Show
End Sub

Private Sub mnuScript_Click(Index As Integer)
    On Error Resume Next

    Dim obj As scObj
    
    obj = GetScriptObjByIndex("Menu", Index)
    RunInSingle obj.SCModule, obj.ObjName & "_Click"
End Sub

Private Sub sckScript_Connect(Index As Integer)
    On Error Resume Next

    Dim obj As scObj
    
    obj = GetScriptObjByIndex("Winsock", Index)
    RunInSingle obj.SCModule, obj.ObjName & "_Connect"
End Sub

Private Sub sckScript_ConnectionRequest(Index As Integer, ByVal requestID As Long)
    On Error Resume Next

    Dim obj As scObj
    
    obj = GetScriptObjByIndex("Winsock", Index)
    RunInSingle obj.SCModule, obj.ObjName & "_ConnectionRequest", requestID
End Sub

Private Sub sckScript_DataArrival(Index As Integer, ByVal bytesTotal As Long)
    On Error Resume Next

    Dim obj As scObj
    
    obj = GetScriptObjByIndex("Winsock", Index)
    RunInSingle obj.SCModule, obj.ObjName & "_DataArrival", bytesTotal
End Sub

Private Sub sckScript_SendComplete(Index As Integer)
    On Error Resume Next

    Dim obj As scObj
    
    obj = GetScriptObjByIndex("Winsock", Index)
    RunInSingle obj.SCModule, obj.ObjName & "_SendComplete"
End Sub

Private Sub sckScript_SendProgress(Index As Integer, ByVal bytesSent As Long, ByVal bytesRemaining As Long)
    On Error Resume Next

    Dim obj As scObj
    
    obj = GetScriptObjByIndex("Winsock", Index)
    RunInSingle obj.SCModule, obj.ObjName & "_SendProgress", bytesSent, bytesRemaining
End Sub

Private Sub sckScript_Close(Index As Integer)
    On Error Resume Next

    Dim obj As scObj
    
    obj = GetScriptObjByIndex("Winsock", Index)
    RunInSingle obj.SCModule, obj.ObjName & "_Close"
End Sub

Private Sub sckScript_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    On Error Resume Next

    Dim obj As scObj
    
    obj = GetScriptObjByIndex("Winsock", Index)
    RunInSingle obj.SCModule, obj.ObjName & "_Error", Number, Description, sCode, source, HelpFile, HelpContext, CancelDisplay
End Sub

Private Sub itcScript_StateChanged(Index As Integer, ByVal State As Integer)
    On Error Resume Next

    Dim obj As scObj
    
    obj = GetScriptObjByIndex("Inet", Index)
    RunInSingle obj.SCModule, obj.ObjName & "_StateChanged", State
End Sub

Private Sub tmrAccountLock_Timer()
    tmrAccountLock.Enabled = False
    
    If (Not sckBNet.State = sckConnected) Then 'g_online is set to true AFTER we login... makes this moot, changed to socket being connected.
        Exit Sub
    End If
    
    AddChat RTBColors.ErrorMessageText, "[BNCS] Your account appears to be locked, likely due to an excessive number of " & _
        "invalid logins.  Please try connecting again in 15-20 minutes."
        
    DoDisconnect
End Sub

Private Sub tmrScript_Timer(Index As Integer)
    On Error Resume Next

    Dim obj As scObj
    
    obj = GetScriptObjByIndex("Timer", Index)
    RunInSingle obj.SCModule, obj.ObjName & "_Timer"
End Sub

Private Sub tmrScriptLong_Timer(Index As Integer)
    On Error Resume Next

    Dim obj As scObj
    
    obj = GetScriptObjByIndex("LongTimer", Index)
    obj.obj.Counter = (obj.obj.Counter + 1)
    
    If (obj.obj.Counter >= obj.obj.Interval) Then
        RunInSingle obj.SCModule, obj.ObjName & "_Timer"
        
        obj.obj.Counter = 0
    End If
End Sub

Private Sub txtPre_GotFocus()
    Call cboSend_GotFocus
End Sub

Private Sub txtPost_GotFocus()
    Call cboSend_GotFocus
End Sub

Private Sub cboSend_GotFocus()
    On Error Resume Next

    Dim i As Integer
    cboSend.SelStart = cboSendSelStart
    cboSend.SelLength = cboSendSelLength

    If (BotVars.NoAutocompletion = False) Then
        For i = 0 To (Controls.Count - 1)
            If (TypeOf Controls(i) Is ListView) Or _
                    (TypeOf Controls(i) Is SSTab) Or _
                        (TypeOf Controls(i) Is RichTextBox) Or _
                            (TypeOf Controls(i) Is TextBox) Then
                If (Controls(i).TabStop = False) Then
                    Controls(i).Tag = "False"
                End If

                Controls(i).TabStop = False
            End If
        Next i
    End If
    
    cboSendHadFocus = True
End Sub

Private Sub txtPre_LostFocus()
    Call cboSend_LostFocus
End Sub

Private Sub txtPost_LostFocus()
    Call cboSend_LostFocus
End Sub

Private Sub cboSend_LostFocus()
    On Error Resume Next

    Dim i As Integer
    
    If (BotVars.NoAutocompletion = False) Then
        For i = 0 To (Controls.Count - 1)
            If (TypeOf Controls(i) Is ListView) Or _
                    (TypeOf Controls(i) Is TabStrip) Or _
                        (TypeOf Controls(i) Is RichTextBox) Or _
                            (TypeOf Controls(i) Is TextBox) Then
                            
                If (Controls(i).Tag <> "False") Then
                    Controls(i).TabStop = True
                End If
            End If
        Next i
    End If
    
    cboSendHadFocus = False
End Sub

Private Sub cboSend_Click()
    RecordcboSendSelInfo
End Sub

Private Sub cboSend_Change()
    'Debug.Print cboSendSelLength & "\" & cboSendSelStart
    RecordcboSendSelInfo
End Sub

Private Sub cboSend_KeyUp(KeyCode As Integer, Shift As Integer)
    RecordcboSendSelInfo
End Sub

Private Sub cboSend_KeyDown(KeyCode As Integer, Shift As Integer)
    On Error GoTo ERROR_HANDLER
    
    Static ACBuffer    As String
    Static ACWordStart As Long
    Static ACWordEnd   As Long
    Static ACUserPLen  As Long
    Static ACUserIndex As Integer
    
    Dim AccessAmount As udtGetAccessResponse
    
    Dim Vetoed As Boolean '
    
    Dim i           As Integer
    Dim j           As Integer
    Dim SavedSelPos As Long
    Dim SavedSelLen As Long
    Dim CurrentTab  As Integer
    Dim CurrentList As ListView
    Dim CurrentUser As Long
    Dim Value       As String
    
    SavedSelPos = cboSend.SelStart
    SavedSelLen = cboSend.SelLength
    
    CurrentTab = ListviewTabs.Tab
    Select Case CurrentTab
        Case LVW_BUTTON_FRIENDS: Set CurrentList = lvFriendList
        Case LVW_BUTTON_CLAN:    Set CurrentList = lvClanList
        Case Else:               Set CurrentList = lvChannel
    End Select
    
    If (Not (CurrentList.SelectedItem Is Nothing)) Then
        CurrentUser = CurrentList.SelectedItem.Index
    End If

    Select Case (KeyCode)
        Case vbKeySpace
            With cboSend
                If (LenB(LastWhisper) > 0) Then
                    If (Len(.Text) >= 2) Then
                        If StrComp(Split(.Text)(0), "/r", vbTextCompare) = 0 Then
                            .SelStart = 0
                            .SelLength = Len(.Text)
                            .SelText = "/w " & CleanUsername(LastWhisper, True)
                            .SelStart = Len(.Text)
                        End If
                    End If
                    
                    If (Len(.Text) >= 6) Then
                        If StrComp(Split(.Text)(0), "/reply", vbTextCompare) = 0 Then
                            .SelStart = 0
                            .SelLength = Len(.Text)
                            .SelText = "/w " & CleanUsername(LastWhisper, True)
                            .SelStart = Len(.Text)
                        End If
                    End If
                End If
                
                If (LenB(LastWhisperTo) > 0) Then
                    If (Len(.Text) >= 3) Then
                        If StrComp(Split(.Text)(0), "/rw", vbTextCompare) = 0 Then
                            .SelStart = 0
                            .SelLength = Len(.Text)
                            
                            If StrComp(LastWhisperTo, "%f%") = 0 Then
                                .SelText = "/f m"
                            Else
                                .SelText = "/w " & CleanUsername(LastWhisperTo, True)
                            End If
                            
                            .SelStart = Len(.Text)
                        End If
                    End If
                End If
            End With

        Case vbKeyPageDown 'ALT + PAGEDOWN
            If Shift = vbAltMask Then
                With CurrentList
                    If CurrentUser > 0 And CurrentUser < .ListItems.Count Then
                        .HideSelection = False
                        With .ListItems.Item(CurrentUser + 1)
                            .Selected = True
                            .EnsureVisible
                        End With
                    End If
                End With

                cboSend.SetFocus
                cboSend.SelStart = SavedSelPos
                cboSend.SelLength = SavedSelLen
                Exit Sub
            End If

        Case vbKeyPageUp 'ALT + PAGEUP
            If Shift = vbAltMask Then
                With CurrentList
                    If CurrentUser > 1 Then
                        .HideSelection = False
                        With .ListItems.Item(CurrentUser - 1)
                            .Selected = True
                            .EnsureVisible
                        End With
                    End If
                End With

                cboSend.SetFocus
                cboSend.SelStart = SavedSelPos
                cboSend.SelLength = SavedSelLen
                Exit Sub
            End If

        Case vbKeyHome 'ALT+HOME
            If Shift = vbAltMask Then
                With CurrentList
                    If .ListItems.Count > 0 Then
                        .HideSelection = False
                        With .ListItems.Item(1)
                            .Selected = True
                            .EnsureVisible
                        End With
                    End If
                End With

                cboSend.SetFocus
                cboSend.SelStart = SavedSelPos
                cboSend.SelLength = SavedSelLen
                Exit Sub
            End If

        Case vbKeyEnd 'ALT+END
            If Shift = vbAltMask Then
                With CurrentList
                    If .ListItems.Count > 0 Then
                        .HideSelection = False
                        With .ListItems.Item(.ListItems.Count)
                            .Selected = True
                            .EnsureVisible
                        End With
                    End If
                End With

                cboSend.SetFocus
                cboSend.SelStart = SavedSelPos
                cboSend.SelLength = SavedSelLen
                Exit Sub
            End If

        Case vbKeyN, vbKeyInsert 'ALT + N or ALT + INSERT
            If (Shift = vbAltMask) Then
                If (Not (CurrentList.SelectedItem Is Nothing)) Then
                    Value = CurrentList.SelectedItem.Text
                    If cboSend.SelStart = 0 Then Value = Value & BotVars.AutoCompletePostfix
                    Value = Value & Space$(1)
                    
                    cboSend.SelText = Value
                    cboSend.SelStart = cboSend.SelStart + Len(Value)
                    Exit Sub
                End If
            End If

        Case vbKeyV 'PASTE
            Dim x() As String
            Dim n As Long
            
            If (IsScrolling(rtbChat)) Then
                LockWindowUpdate rtbChat.hWnd
            
                SendMessage rtbChat.hWnd, EM_SCROLL, SB_BOTTOM, &H0
                
                LockWindowUpdate &H0
            End If
        
            If (Shift = vbCtrlMask) Then
                On Error Resume Next
                
                If (InStr(1, Clipboard.GetText, Chr(13), vbTextCompare) <> 0) Then
                    x() = Split(Clipboard.GetText, Chr(10))
                    
                    If UBound(x) > 0 Then
                        For n = LBound(x) To UBound(x)
                            x(n) = Replace(x(n), Chr(13), vbNullString)
                            
                            If (x(n) <> vbNullString) Then
                                If (n <> LBound(x)) Then
                                    AddQ txtPre.Text & x(n) & txtPost.Text, PRIORITY.CONSOLE_MESSAGE
                                    
                                    cboSend.AddItem txtPre.Text & x(n) & txtPost.Text, 0
                                Else
                                    AddQ txtPre.Text & cboSend.Text & x(n) & txtPost.Text, _
                                        PRIORITY.CONSOLE_MESSAGE
                                    
                                    cboSend.AddItem txtPre.Text & cboSend.Text & x(n) & txtPost.Text, 0
                                End If
                            End If
                        Next n
                        
                        cboSend.Text = vbNullString
                        
                        MultiLinePaste = True
                    End If
                End If
            End If
            
        Case vbKeyA
            If (Shift = vbCtrlMask) Then
                If (CurrentTab <> LVW_BUTTON_CHANNEL) Then
                    ListviewTabs.Tab = LVW_BUTTON_CHANNEL
                    Call ListviewTabs_Click(CurrentTab)
                Else
                    cboSend.SelStart = 0
                    cboSend.SelLength = Len(cboSend.Text)
                End If
            End If
            
        Case vbKeyS
            If (Shift = vbCtrlMask) Then
                If (CurrentTab <> LVW_BUTTON_FRIENDS) And (ListviewTabs.TabEnabled(LVW_BUTTON_FRIENDS)) Then
                    ListviewTabs.Tab = LVW_BUTTON_FRIENDS
                    Call ListviewTabs_Click(CurrentTab)
                End If
            End If
            
        Case vbKeyD
            If (Shift = vbCtrlMask) Then
                If (CurrentTab <> LVW_BUTTON_CLAN) And (ListviewTabs.TabEnabled(LVW_BUTTON_CLAN)) Then
                    ListviewTabs.Tab = LVW_BUTTON_CLAN
                    Call ListviewTabs_Click(CurrentTab)
                End If
            End If
            
        Case vbKeyB
            If (Shift = vbCtrlMask) Then
                cboSend.SelText = "�cb"
            End If
            
        'Case vbKeyJ
        '    If (Shift = vbCtrlMask) Then
        '        Call mnuToggle_Click
        '    End If
            
        Case vbKeyU
            If (Shift = vbCtrlMask) Then
                cboSend.SelText = "�cu"
            End If
            
        Case vbKeyI
            If (Shift = vbCtrlMask) Then
                cboSend.SelText = "�ci"
            End If
            
        Case vbKeyDelete
            ACUserIndex = 0
            
        Case vbKeyTab
            Dim ACList As Collection
            Dim ACUser As String
            Dim ACText As String
            
            If (Shift <> 0) Then
                Call cboSend_LostFocus
                
                If (txtPre.Visible = True) Then
                    Call txtPre.SetFocus
                Else
                    Call ListviewTabs.SetFocus
                    Call ListviewTabs_Click(0)
                End If
            Else
            
                With cboSend
                    ' check if auto-complete active
                    If ACUserIndex = 0 Then
                        ' reset the static variables and auto-complete the current word
                        ACBuffer = .Text
                        
                        If .SelStart = 0 Then
                            ACWordStart = 1
                        Else
                            ACWordStart = InStrRev(ACBuffer, Space$(1), .SelStart, vbBinaryCompare) + 1
                        End If
                        ACWordEnd = InStr(.SelStart + 1, ACBuffer, Space$(1), vbBinaryCompare)
                        If ACWordEnd = 0 Then ACWordEnd = Len(ACBuffer) + 1
                        
                        ACUserPLen = ACWordEnd - ACWordStart
                        If ACUserPLen < 0 Then ACUserPLen = 0
                        
                        'AddChat vbWhite, ACWordEnd - ACWordStart
                        'AddChat vbWhite, Mid$(ACBuffer, ACWordStart, ACUserPLen)
                        
                        ACUserIndex = 1
                    Else
                        ' advance last auto-complete
                        ACUserIndex = ACUserIndex + 1
                    End If
                    
                    ' repopulate autocomplete candidates
                    ' sort as we get them
                    Set ACList = New Collection
                    'If ACUserPLen > 0 Then
                    For i = 1 To CurrentList.ListItems.Count
                        If StrComp(Left$(CurrentList.ListItems.Item(i).Text, ACUserPLen), Mid$(ACBuffer, ACWordStart, ACUserPLen), vbTextCompare) = 0 Then
                            For j = 1 To ACList.Count
                                If StrComp(CurrentList.ListItems.Item(i).Text, ACList.Item(j), vbTextCompare) < 0 Then
                                    Exit For
                                End If
                            Next j
                            
                            'AddChat vbYellow, j & " - " & CurrentList.ListItems.Item(i).Text
                            
                            ' add at found position
                            If j - 1 = ACList.Count Then
                                ACList.Add CurrentList.ListItems.Item(i).Text
                            Else
                                ACList.Add CurrentList.ListItems.Item(i).Text, , j
                            End If
                        End If
                    Next i
                    'End If
                    
                    ' set the user to the next candidate
                    ACUser = vbNullString
                    If ACList.Count > 0 Then
                        If ACList.Count < ACUserIndex Then
                            ACUserIndex = 1
                        End If
                        
                        ACUser = ACList.Item(ACUserIndex)
                    End If
                    Set ACList = Nothing
                    
                    ' save to the text box
                    If (LenB(ACUser) > 0) Then
                        If (ACWordStart > 1) Then
                            ACText = Left$(ACBuffer, ACWordStart - 1)
                        ElseIf (ACWordStart = 1) Then
                            ' only includes the postfix for the first word
                            ACUser = ACUser & BotVars.AutoCompletePostfix
                        End If
                        
                        ACText = ACText & ACUser & Space$(1)
                        
                        SavedSelPos = Len(ACText)
                        
                        If (ACWordEnd > 0) Then
                            ACText = ACText & Mid$(ACBuffer, ACWordEnd + 1)
                        End If
                        
                        .Text = ACText
                        .SelStart = SavedSelPos
                    Else
                        ACUserIndex = 0
                    End If
                End With
            End If
            
        Case vbKeyReturn
            Dim DoRunCommands     As Boolean
            Dim NoProcs()         As String
            Dim StartOutfilterPos As Long
            
            If (IsScrolling(rtbChat)) Then
                LockWindowUpdate rtbChat.hWnd
            
                SendMessage rtbChat.hWnd, EM_SCROLL, SB_BOTTOM, &H0
                
                LockWindowUpdate &H0
            End If
            
            DoRunCommands = True
        
            Select Case (Shift)
                Case vbShiftMask 'CTRL+ENTER - rewhisper
                    If LenB(cboSend.Text) > 0 Then
                        Value = "/w " & LastWhisperTo & Space(1)
                        DoRunCommands = False
                    End If
                    
                Case vbShiftMask Or vbCtrlMask 'CTRL+SHIFT+ENTER - reply
                    If LenB(cboSend.Text) > 0 Then
                        Value = "/w " & LastWhisper & Space(1)
                        DoRunCommands = False
                    End If
            
                Case Else 'normal ENTER - old rules apply
                    If LenB(cboSend.Text) > 0 Then
                        Value = vbNullString
                    End If
            End Select
            
            ' prefix box
            If txtPre.Visible Then Value = Value & txtPre.Text
            ' sendbox
            Value = Value & cboSend.Text
            ' suffix box
            If txtPost.Visible Then Value = Value & txtPost.Text
            
            If DoRunCommands Then
                On Error Resume Next
                DoRunCommands = Not RunInAll("Event_PressedEnter", Value)
                On Error GoTo 0
            End If
            
            If (Left$(Value, 6) = "/tell ") Then
                Value = "/w " & Mid$(Value, 7)
            End If
                
            If DoRunCommands Then
                If (Left$(Value, 1) = "/") Then
                    If (LenB(Config.ServerCommandList) > 0) Then
                        Dim Args() As String
                        Dim UserArg As String
                        Dim CommandList As String
                        
                        CommandList = Config.ServerCommandList
                        
                        ' please note: only commands with "%" as the first argument (or no "%" arguments)
                        ' (i.e. "/w %", "/ban %") are supported to be correctly no-processed
                        ' complexify here if that is needed
                        Args() = Split(Value, Space(1), 3)
                        If UBound(Args) > 0 Then UserArg = Args(1)
                        
                        CommandList = Replace(CommandList, "%", UserArg)
                        
                        NoProcs() = Split(CommandList, ",")
                    Else
                        ReDim NoProcs(0)
                    End If
                    
                    For i = LBound(NoProcs) To UBound(NoProcs)
                        If (LenB(NoProcs(i)) > 0) And (StrComp(Left$(Value, Len(NoProcs(i)) + 2), "/" & NoProcs(i) & Space$(1), vbTextCompare) = 0) Then
                            DoRunCommands = False
                            StartOutfilterPos = Len(NoProcs(i)) + 3
                            Exit For
                        End If
                    Next i
                    
                    If DoRunCommands Then
                        ProcessCommand GetCurrentUsername, Value, True, False
                    Else
                        DoRunCommands = False
                    End If
                Else
                    DoRunCommands = False
                End If
            End If
            
            If Not DoRunCommands Then
                ' Don't do replacements for a command unless it involves text that will be seen by someone else
                '  and don't replace text in the command itself or the target username
                Value = Left$(Value, StartOutfilterPos) & OutFilterMsg(Mid$(Value, StartOutfilterPos + 1))
                
                Call AddQ(Value, PRIORITY.CONSOLE_MESSAGE)
            End If
            
            'Ignore rest of code as the bot is closing
            If BotIsClosing Then
                Exit Sub
            End If
            
            cboSend.AddItem Value, 0
            
            cboSend.Text = vbNullString
            
            If Me.WindowState <> vbMinimized Then
                On Error Resume Next
                cboSend.SetFocus
            End If
    End Select
    
    CurrentList.HideSelection = True
    
    If (KeyCode <> vbKeyTab) Then
        ACUserIndex = 0
    End If

    Exit Sub

ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, "Error " & Err.Number & " (" & Err.Description & ") " & _
        "in procedure cboSend_KeyDown"
        
    Exit Sub
End Sub

Private Sub cboSend_KeyPress(KeyAscii As Integer)
    Dim oldSelStart As Integer
    Dim sClosest As String
    
    'AddChat vbBlue, KeyAscii

    Select Case KeyAscii
        Case 1, 19, 4, 2, 9, 21, 13, 10
            KeyAscii = 0
        Case 22
            If MultiLinePaste Then
                KeyAscii = 0
                MultiLinePaste = False
            End If
            
    End Select
    
    With cboSend
        If (KeyAscii > 0) Then
            If (.ListCount > 15) Then
                .RemoveItem 15
            End If
        End If
    End With
    
    If Len(cboSend.Text) > 223 Then
        cboSend.ForeColor = vbRed
    Else
        cboSend.ForeColor = vbWhite
    End If
End Sub

Public Sub SControl_Error()
    Call modScripting.SC_Error
End Sub

Private Sub sckBNet_Close()
    sckBNet.Close
    If sckBNLS.State <> 0 Then sckBNLS.Close
    
    Call Event_BNetDisconnected
    
    ds.ClientToken = 0
    g_Connected = False
End Sub

Private Sub sckBNet_Connect()
    On Error Resume Next
    
    Call Event_BNetConnected
    
    If MDebug("all") Then
        AddChat COLOR_BLUE, "BNET CONNECT"
    End If
    
    Call modWarden.WardenCleanup(WardenInstance)
    WardenInstance = modWarden.WardenInitilize(sckBNet.SocketHandle)
    ds.Reset
        
    If (Not (BotVars.UseProxy)) Then
        InitBNetConnection
    Else
        LogonToProxy sckBNet, BotVars.Server, 6112, BotVars.ProxyIsSocks5
    End If
    
End Sub

Sub InitBNetConnection()
    g_Connected = True
    
    'sckBNet.SendData ChrW(1)
    Call Send(sckBNet.SocketHandle, ChrW(1), 1, 0)
    
    If BotVars.BNLS Then
        modBNLS.SEND_BNLS_REQUESTVERSIONBYTE
    Else
        Select Case modBNCS.GetLogonSystem()
            Case modBNCS.BNCS_NLS: Call modBNCS.SEND_SID_AUTH_INFO
            Case modBNCS.BNCS_OLS:
                modBNCS.SEND_SID_CLIENTID2
                modBNCS.SEND_SID_LOCALEINFO
                modBNCS.SEND_SID_STARTVERSIONING
            Case modBNCS.BNCS_LLS:
                modBNCS.SEND_SID_CLIENTID
                modBNCS.SEND_SID_STARTVERSIONING
            Case Else:
                AddChat RTBColors.ErrorMessageText, StringFormat("Unknown Logon System Type: {0}", modBNCS.GetLogonSystem())
                AddChat RTBColors.ErrorMessageText, "Please visit http://www.stealthbot.net/sb/issues/?unknownLogonType for information regarding this error."
                DoDisconnect
        End Select
    End If
End Sub

Private Sub sckBNet_Error(ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    Call Event_BNetError(Number, Description)
End Sub

Private Sub sckMCP_Close()
    AddChat RTBColors.ErrorMessageText, "[REALM] Connection closed."
    
    If Not ds.MCPHandler Is Nothing Then
        ds.MCPHandler.IsRealmError = True
        
        Call DoDisconnect
    End If
End Sub

Private Sub sckMCP_Connect()
    On Error Resume Next
    
    If MDebug("all") Then
        AddChat COLOR_BLUE, "MCP CONNECT"
    End If
    
    AddChat RTBColors.SuccessText, "[REALM] Connected!"
    
    'sckMCP.SendData ChrW(1)
    Call Send(sckMCP.SocketHandle, ChrW(1), 1, 0)
    
    If Not ds.MCPHandler Is Nothing Then
        ds.MCPHandler.SEND_MCP_STARTUP
    End If
End Sub

Private Sub sckMCP_DataArrival(ByVal bytesTotal As Long)
    On Error GoTo ERROR_HANDLER
    
    Dim strTemp As String
    
    sckMCP.GetData strTemp, vbString
    MCPBuffer.AddData strTemp

    While MCPBuffer.FullPacket
        strTemp = MCPBuffer.GetPacket
        
        If Not ds.MCPHandler Is Nothing Then
            Call ds.MCPHandler.ParsePacket(strTemp)
        End If
    Wend
    
    Exit Sub

ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, _
        "Error (#" & Err.Number & "): " & Err.Description & " in sckMCP_DataArrival()."

    Exit Sub
End Sub

Private Sub sckMCP_Error(ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    If Not g_Online Then
        ' This message is ignored if we've entered chat
        AddChat RTBColors.ErrorMessageText, "[REALM] Server error " & Number & ": " & Description
        
        If Not ds.MCPHandler Is Nothing Then
            If ds.MCPHandler.FormActive Then
                frmRealm.UnloadRealmError
            End If
        End If
    End If
End Sub


'// Written by Swent. Executes plugin timer subs
Private Sub scTimer_Timer()
    On Error Resume Next

    RunInAll "scTimer_Timer"
End Sub

' centralized "idle" events:
' IDLE MESSAGE (.5*IDLEMESSAGEDELAY minutes - user setting)
' PROFILE AMP (1 minute - useful minimum song length)
' BNCS.SID_NULL (2 minutes - keep alive)
' BNCS.SID_CLANMOTD (10 minutes - may change)
' BNCS.SID_FRIENDSLIST (5 minutes - for D1,W2,D2 [no update], SC,W3 [bug in SID_FRIENDSUPDATE])
Private Sub tmrIdleTimer_Timer()
    On Error GoTo ERROR_HANDLER

    ' long-counter
    Static lCounter As Long
    
    lCounter = lCounter + 1
    
    If g_Online Then
        ' bot idle (30 second interval (x config value), offset 0 seconds)
        If Config.IdleMessage Then
            Dim IdleWait As Long
            
            IdleWait = Config.IdleMessageDelay * 30
            
            If (lCounter Mod IdleWait) = 0 Then
                'AddQ "IDLE"
                Call tmrIdleTimer_Timer_IdleMsg
            End If
        End If
        
        ' bot ProfileAmp (1 minute interval, offset 5 seconds)
        If g_Online And Config.ProfileAmp Then
            If (lCounter Mod 60) = 5 Then
                'AddQ "PROFILE AMP"
                Call UpdateProfile
            End If
        End If
        
        ' BNCS keepalive... (2 minute interval; offset -15 seconds)
        If (lCounter Mod 120&) = 105& Then
            ' if W3 & in clan, then (10 minute interval; offset -15 seconds from 2nd minute)
            If IsW3 And Clan.isUsed And (lCounter Mod 600&) = 105& Then
                ' request clan MOTD instead of NULL
                'AddQ "CLAN MOTD"
                RequestClanMOTD
            ' if friend list updates enabled, then (5 minute interval; offset -15 seconds from 4th minute)
            ElseIf Config.FriendsListTab And (lCounter Mod 300&) = 225& Then
                ' request friendlist instead of FL
                'AddQ "FRIENDS"
                If (lvFriendList.ListItems.Count > 0) Then
                    Call FriendListHandler.RequestFriendsList(PBuffer)
                Else
                    PBuffer.SendPacket SID_NULL
                End If
            ' else standard null
            Else
                'AddQ "NULL"
                PBuffer.SendPacket SID_NULL
            End If
        End If
    End If
    
    Exit Sub

ERROR_HANDLER:

    AddChat RTBColors.ErrorMessageText, "Error (#" & Err.Number & "): " & Err.Description & " in tmrIdleTimer_Timer()."
    
    Exit Sub
    
End Sub

Private Sub tmrIdleTimer_Timer_IdleMsg()
    On Error GoTo ERROR_HANDLER

    Dim U As String, IdleMsg As String, s() As String
    Dim IdleWaitS As String, IdleType As String
    Dim IdleWait As Integer, UDP As Byte
    Dim IsError As Boolean

    BotVars.JoinWatch = 0
    
    If Not Config.IdleMessage Then Exit Sub
    
    IdleMsg = Config.IdleMessageText
    IdleWait = Config.IdleMessageDelay
    IdleType = Config.IdleMessageType
    
    If IdleWait < 2 Then Exit Sub
    
    'If iCounter >= IdleWait Then
    'iCounter = 0
    'on error resume next
    If IdleType = "msg" Or IdleType = vbNullString Then
    
        If StrComp(IdleMsg, "null", vbTextCompare) = 0 Or IdleMsg = vbNullString Then
            Exit Sub
        End If
        
        IdleMsg = Replace(IdleMsg, "%cpuup", ConvertTime(GetUptimeMS))
        IdleMsg = Replace(IdleMsg, "%chan", g_Channel.Name)
        IdleMsg = Replace(IdleMsg, "%c", g_Channel.Name)
        IdleMsg = Replace(IdleMsg, "%me", GetCurrentUsername)
        IdleMsg = Replace(IdleMsg, "%v", CVERSION)
        IdleMsg = Replace(IdleMsg, "%ver", CVERSION)
        IdleMsg = Replace(IdleMsg, "%bc", BanCount)
        IdleMsg = Replace(IdleMsg, "%botup", ConvertTime(uTicks))
        IdleMsg = Replace(IdleMsg, "%mp3", Replace(MediaPlayer.TrackName, "&", "+"))
        IdleMsg = Replace(IdleMsg, "%quote", g_Quotes.GetRandomQuote)
        IdleMsg = Replace(IdleMsg, "%rnd", GetRandomPerson)
        IdleMsg = Replace(IdleMsg, "%t", Time$)
        
        If (IdleMsg = vbNullString) Then
            IsError = True
        End If
        
    ElseIf IdleType = "uptime" Then
        IdleMsg = "/me -: System Uptime: " & ConvertTime(GetUptimeMS()) & " :: Connection Uptime: " & ConvertTime(uTicks) & " :: " & CVERSION & " :-"
        
    ElseIf IdleType = "mp3" Then
        Dim WindowTitle As String
        
        WindowTitle = MediaPlayer.TrackName
        
        If WindowTitle = vbNullString Then
            IsError = True
        ElseIf (MediaPlayer.IsPaused) Then
            IdleMsg = "/me -: Now Playing: " & WindowTitle & " (paused) :: " & CVERSION & " :-"
        Else
            IdleMsg = "/me -: Now Playing: " & WindowTitle & " :: " & CVERSION & " :-"
        End If

    ElseIf IdleType = "quote" Then
        U = g_Quotes.GetRandomQuote
        
        IdleMsg = "/me : " & U
        
        If Len(U) > 217 Then
            IsError = True
        End If
        
    End If
            
    If (IsError) Then
        IdleMsg = "/me -- " & CVERSION
    End If
    
    If sckBNet.State = 7 Then
        If InStr(1, IdleMsg, "& ", vbTextCompare) And IdleType = "msg" Then
            s = Split(IdleMsg, "& ")
            
            For IdleWait = LBound(s) To UBound(s)
                If Len(s(IdleWait)) > 215 Then
                    s(IdleWait) = Left$(s(IdleWait), 215)
                End If
                AddQ s(IdleWait)
            Next
        Else
            If Len(IdleMsg) > 215 Then
                IdleMsg = Left$(IdleMsg, 215)
            End If
            
            frmChat.AddQ IdleMsg
        End If
    End If
    'End If
    
    Exit Sub

ERROR_HANDLER:

    AddChat RTBColors.ErrorMessageText, "Error (#" & Err.Number & "): " & Err.Description & " in tmrIdleTimer_Timer_IdleMsg()."
    
    Exit Sub
    
End Sub

Private Sub tmrSilentChannel_Timer(Index As Integer)
    On Error GoTo ERROR_HANDLER

    Dim User    As clsUserObj
    Dim Item    As ListItem
    
    Dim i       As Integer
    Dim j       As Integer
    Dim found   As Boolean
    Dim WasZero As Boolean
    
    If (g_Channel.IsSilent = False) Then
        Exit Sub
    End If

    If (Index = 0) Then
        If (frmChat.mnuDisableVoidView.Checked = False) Then
            'For i = 1 To g_Channel.Users.Count
            '    ' with our doevents, we can miss our cue indicating that we
            '    ' need to stop silent channel processing and cause an rte.
            '    If (i > g_Channel.Users.Count) Then
            '        Exit For
            '    End If
            '
            '     Set user = g_Channel.Users(i)
            '
            '    If (lvChannel.FindItem(user.DisplayName) Is Nothing) Then
            '        Dim Stats As String
            '        Dim Clan  As String
            '
            '        ParseStatstring user.Statstring, Stats, Clan
            '
            '        AddName user.DisplayName, user.Game, user.Flags, user.Ping, user.Clan
            '    End If
            'Next i
            
            Call LockWindowUpdate(&H0)
            
            lblCurrentChannel.Caption = GetChannelString()
        End If
    
        tmrSilentChannel(0).Enabled = False
    ElseIf (Index = 1) Then
        If (mnuDisableVoidView.Checked = False) Then
            If (g_Channel.IsSilent) Then
                Call g_Channel.ClearUsers
                
                frmChat.lvChannel.ListItems.Clear
            End If
        
            Call AddQ("/unsquelch " & GetCurrentUsername, PRIORITY.SPECIAL_MESSAGE)
        End If
    End If
    
    Exit Sub
    
ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, "Error: " & Err.Description & " in tmrSilentChannel_Timer(" & Index & ")."
    
    Exit Sub
End Sub

Private Sub txtPre_KeyPress(KeyAscii As Integer)
    If (KeyAscii = 13) Then
        Call cboSend_KeyPress(KeyAscii)
    End If
End Sub

Private Sub txtPost_KeyPress(KeyAscii As Integer)
    If (KeyAscii = 13) Then
        Call cboSend_KeyPress(KeyAscii)
    End If
End Sub

Sub ConnectBNLS()
    ' Don't try and connect if we don't have a server to connect to.
    If Len(BotVars.BNLSServer) = 0 Then
        AddChat RTBColors.ErrorMessageText, "[BNLS] A working BNLS server could not be found."
        AddChat RTBColors.ErrorMessageText, "[BNLS]   Go to Settings -> Bot Settings -> Connection Settings -> Advanced and either set a server or use the automatic server finder."
        Call DoDisconnect
        Exit Sub
    End If
    
    Call Event_BNLSConnecting
    
    With sckBNLS
        If .State <> 0 Then .Close
        
        .RemoteHost = BotVars.BNLSServer
        .RemotePort = 9367
        .Connect
    End With
End Sub

Sub Connect()
    Dim NotEnoughInfo As Boolean
    Dim MissingInfo As String
    
    'g_username = BotVars.Username
    
    If sckBNet.State = 0 And sckBNLS.State = 0 Then
    
        'Vars
        NotEnoughInfo = False
        MissingInfo = "Information required to connect: "
        If BotVars.Username = vbNullString Then
            MissingInfo = MissingInfo & "Username, "
            NotEnoughInfo = True
        End If
        If BotVars.Password = vbNullString Then
            MissingInfo = MissingInfo & "Password, "
            NotEnoughInfo = True
        End If
        If BotVars.Server = vbNullString Then
            MissingInfo = MissingInfo & "Server, "
            NotEnoughInfo = True
        End If
        If BotVars.Product = vbNullString Then
            MissingInfo = MissingInfo & "your choice of Client, "
            NotEnoughInfo = True
        Else
            Select Case GetProductInfo(BotVars.Product).KeyCount
                Case 0
                Case 1
                    If BotVars.CDKey = vbNullString Then
                        MissingInfo = MissingInfo & "CDKey, "
                        NotEnoughInfo = True
                    End If
                Case 2
                    If BotVars.CDKey = vbNullString Then
                        MissingInfo = MissingInfo & "CDKey, "
                        NotEnoughInfo = True
                    End If
                    If BotVars.ExpKey = vbNullString Then
                        MissingInfo = MissingInfo & "expansion CDKey, "
                        NotEnoughInfo = True
                    End If
            End Select
        End If
        
        If NotEnoughInfo Then
            MsgBox "You haven't provided enough information to connect! " & _
                "Please edit your connection settings by choosing Bot Settings under the Settings menu." & _
                vbNewLine & Left$(MissingInfo, Len(MissingInfo) - 2) & ".", vbInformation
            
            Call DoDisconnect(1)
            
            Exit Sub
        End If
        
        SetTitle "Connecting..."
        
        If ((StrComp(BotVars.Product, "PX2D", vbTextCompare) = 0) Or _
            (StrComp(BotVars.Product, "VD2D", vbTextCompare) = 0)) Then
            
            Dii = True
        Else
            Dii = False
        End If

        'Changed 10-07-2009 - Hdx - Are we going to have private betas anymore?
        #If (BETA = 2) Then
            Call AddChat(RTBColors.InformationText, "Authorizing your private-release, please wait...")
            
            If (GetAuth(BotVars.Username)) Then
                Call AddChat(RTBColors.SuccessText, "Private usage authorized, connecting your bot...")
                
                ' was auth function bypassed?
                If (AUTH_CHECKED = False) Then BotVars.Password = Chr$(0)
            Else
                Call AddChat(RTBColors.ErrorMessageText, "- - - - - YOU ARE NOT AUTHORIZED TO USE THIS PROGRAM - - - - -")
                
                Call DoDisconnect
                UserCancelledConnect = False
                Exit Sub
            End If
        #Else
            AddChat RTBColors.InformationText, "Connecting your bot..."
        #End If
        
        
        If BotVars.BNLS Then
            If Len(BotVars.BNLSServer) = 0 Then
                If BotVars.UseAltBnls Then
                    Call FindBNLSServer
                    
                    Exit Sub
                End If
            End If
            
            Call ConnectBNLS
        Else
            Call Event_BNetConnecting
        End If
        
        With sckBNet
            If .State <> 0 Then
                AddChat RTBColors.ErrorMessageText, "Already connected."
                Exit Sub
            End If
    
            
            If Not BotVars.UseProxy Then
                .RemoteHost = BotVars.Server
                .RemotePort = 6112
            Else
                '// PROXY
                If BotVars.ProxyPort > 0 And LenB(BotVars.ProxyIP) > 0 Then
                    .RemoteHost = BotVars.ProxyIP
                    .RemotePort = BotVars.ProxyPort
                Else
                    MsgBox "You have selected to use proxies, but no proxy is configured. Please set one up in the Advanced " & _
                        " section of Bot Settings.", vbInformation
                        
                    DoDisconnect
                    
                    Exit Sub
                End If
            End If

            If Not BotVars.BNLS Then .Connect

        End With
        
    End If
    
    Exit Sub
    
Error:
    MsgBox "Configuration file error. Please re-write your configuration file " & _
        "using the Setup dialog.", vbCritical + vbOKOnly, "Error"
    
    Call SetTitle("Disconnected")
    
    Exit Sub
End Sub

Public Sub Pause(ByVal fSeconds As Single, Optional ByVal AllowEvents As Boolean = True)
    Dim i As Integer
    If AllowEvents Then
        For i = 0 To (1000 * fSeconds) \ 100
            Sleep 100
            DoEvents
        Next i
    Else
        Sleep fSeconds * 1000
    End If
End Sub

'/* Fires every second */
Private Sub UpTimer_Timer()

    On Error GoTo ERROR_HANDLER

    Dim newColor  As Long
    Dim i         As Integer
    Dim pos       As Integer
    Dim doCheck   As Boolean

    uTicks = (uTicks + 1000)
    
    If (floodCap > 2) Then
        floodCap = floodCap - 3
    End If
    
    If (VoteDuration > 0) Then
        VoteDuration = VoteDuration - 1
        
        If (VoteDuration = 0) Then
            Dim s As String
            
            s = Voting(BVT_VOTE_END)
            
            If (Len(s) > 1) Then
                AddQ s
            End If
        End If
    End If
    
    If (g_Queue.Count > 0) Then
        Ban vbNullString, 0, 3
    End If

    If (g_Channel.IsSilent = False) Then
        doCheck = True
    
        For i = 1 To g_Channel.Users.Count
            With g_Channel.Users(i)
                If (g_Channel.Self.IsOperator) Then
                    If (.IsOperator = False) Then
                        ' channel password
                        If ((BotVars.ChannelPasswordDelay > 0) And (Len(BotVars.ChannelPassword) > 0)) Then
                            If (.PassedChannelAuth = False) Then
                                If (.TimeInChannel() > BotVars.ChannelPasswordDelay) Then
                                    If (GetSafelist(.DisplayName) = False) Then
                                        Ban .DisplayName & " Password time is up", (AutoModSafelistValue - 1)
                                         
                                        doCheck = False
                                    End If
                                End If
                            End If
                        End If
                        
                        ' idle bans
                        If ((doCheck) And ((BotVars.IB_On = BTRUE) And (BotVars.IB_Wait > 0))) Then
                            If (.TimeSinceTalk() > BotVars.IB_Wait) Then
                                If (GetSafelist(.DisplayName) = False) Then
                                    Ban .DisplayName & " Idle for " & BotVars.IB_Wait & "+ seconds", _
                                        (AutoModSafelistValue - 1), IIf(BotVars.IB_Kick, 1, 0)
                                        
                                    doCheck = False
                                End If
                            End If
                        End If
                    End If
                End If
                
                If (BotVars.NoColoring = False) Then
                    pos = checkChannel(.DisplayName)
                
                    If (pos > 0) Then
                        newColor = GetNameColor(.Flags, .TimeSinceTalk, StrComp(.DisplayName, _
                            GetCurrentUsername, vbBinaryCompare) = 0)
                        
                        If (lvChannel.ListItems(pos).ForeColor <> newColor) Then
                            lvChannel.ListItems(pos).ForeColor = newColor
                        End If
                    End If
                End If
            End With
            
            doCheck = True
        Next i
    End If
    
    Exit Sub
    
ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, "Error (#" & Err.Number & "): " & Err.Description & " in UpTimer_Timer()."

    Exit Sub
    
End Sub

'StealthLock (c) 2003 Stealth, Please do not remove this header
Private Function GetAuth(ByVal Username As String) As Long
    On Error GoTo ERROR_HANDLER

    Static lastAuth     As Long
    Static lastAuthName As String
    
    Dim clsCRC32 As New clsCRC32
    Dim hostFile As String
    Dim hostPath As String
    Dim f        As Integer
    Dim tmp      As String
    Dim Result   As Integer      ' string variable for storing beta authorization result
                                 ' 0  == unauthorized
                                 ' >0 == authorized
                                 
    If (lastAuth) Then
        If (StrComp(Username, lastAuthName, vbTextCompare) = 0) Then
            GetAuth = lastAuth
            
            Exit Function
        End If
    End If
    
    f = FreeFile
    
    If (g_OSVersion.IsWindowsNT) Then
        hostPath = _
            GetRegistryValue(HKEY_LOCAL_MACHINE, "SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\", _
                "DatabasePath")
        
        If (Len(hostPath) = 0) Then
            hostPath = "%SystemRoot%\system32\drivers\etc\"
        End If
    Else
        hostPath = "%WinDir%"
    End If
    
    hostPath = ReplaceEnvironmentVars(hostPath & "\hosts")
 
    If (LenB(Dir$(hostPath)) > 0) Then
        Open hostPath For Input As #f
            Do While (EOF(f) = False)
                Line Input #f, tmp
                
                hostFile = hostFile & tmp
            Loop
        Close #f
    End If
    
    If (clsCRC32.CRC32(BETA_AUTH_URL) = BETA_AUTH_URL_CRC32) Then
        If (InStr(1, hostFile, Split(BETA_AUTH_URL, ".")(1), vbTextCompare) = 0) Then
            Result = CInt(Val(INet.OpenURL(BETA_AUTH_URL & Username)))
        End If
    End If
    
    Do While INet.StillExecuting
        DoEvents
    Loop
    
    If (Result = 1) Then
        lastAuth = Result
        lastAuthName = Username
    
        GetAuth = True
        
        AUTH_CHECKED = True
    End If
    
    Set clsCRC32 = Nothing

    Exit Function

ERROR_HANDLER:

    AddChat RTBColors.ErrorMessageText, "Beta Auth Error: #", vbRed, Err.Number, vbRed, ": ", vbRed, Err.Description
    Set clsCRC32 = Nothing
    GetAuth = False
    Exit Function
    
End Function

' http://www.go4expert.com/forums/showthread.php?t=208
Private Function ReplaceEnvironmentVars(ByVal str As String) As String

    Dim i     As Integer
    Dim Name  As String
    Dim Value As String
    Dim tmp   As String
    
    tmp = str
    
    i = 1

    While (Environ$(i) <> "")
        Name = Mid$(Environ$(i), 1, InStr(1, Environ$(i), "=") - 1)

        Value = Mid$(Environ$(i), InStr(1, Environ$(i), "=") + 1)

        tmp = Replace(tmp, "%" & Name & "%", Value)
    
        i = i + 1
    Wend

    ReplaceEnvironmentVars = tmp

End Function

Function AddQ(ByVal Message As String, Optional msg_priority As Integer = -1, Optional ByVal User As String = _
    vbNullString, Optional ByVal Tag As String = vbNullString, Optional OversizeDelimiter As String = " ") As Integer

    On Error GoTo ERROR_HANDLER
    
    Dim Splt()         As String
    Dim strTmp         As String
    Dim i              As Long
    Dim currChar       As Long
    Dim Send           As String
    Dim Command        As String
    Dim GTC            As Double
    Dim Q              As clsQueueOBj
    Dim delay          As Long
    Dim Index          As Long
    Dim s              As String      ' temp string for settings
    Dim MaxLength      As Integer     ' stores max length for split (with override)
    
    Static LastGTC  As Double
    Static BanCount As Integer

    strTmp = Message
    
    ' cap priority at 100
    If (msg_priority > 100) Then
        msg_priority = 100
    End If
    
    If (g_Queue.Count = 0) Then
        BanCount = 0
    End If
    
    If (strTmp <> vbNullString) Then
        ReDim Splt(0)
    
        ' check for tabs and replace with spaces (2005-09-23)
        If (InStr(1, strTmp, Chr$(9), vbBinaryCompare) <> 0) Then
            strTmp = Replace$(strTmp, Chr$(9), Space(4))
        End If
        
        ' check for invalid characters in the message
        For i = 1 To Len(strTmp)
            currChar = Asc(Mid$(strTmp, i, 1))
        
            If (currChar < 32) Then
                Exit Function
            End If
        Next i
        
        ' is this an internal or battle.net command?
        If (StrComp(Left$(strTmp, 1), "/", vbBinaryCompare) = 0) Then
            ' if so, we have extra work to do
            For i = 2 To Len(strTmp)
                currChar = Asc(Mid$(strTmp, i, 1))
            
                ' find the first non-space after the /
                If (Not currChar = Asc(Space(1))) Then
                    Exit For
                End If
            Next i
            
            ' if we found a non-space, strip everything
            If (i >= 2) Then
                strTmp = StringFormat("/{0}", Mid$(strTmp, i))
            End If

            ' Find the next instance of a space (the end of the command word)
            Index = InStr(1, strTmp, Space(1), vbBinaryCompare)
            
            ' is it a valid command word?
            If (Index > 2) Then
                ' extract the command word
                Command = LCase$(Mid$(strTmp, 2, (Index - 2)))

                ' test it for being battle.net commands we need to process now
                If ((Command = "w") Or _
                    (Command = "whisper") Or _
                    (Command = "m") Or _
                    (Command = "msg") Or _
                    (Command = "message") Or _
                    (Command = "whois") Or _
                    (Command = "where") Or _
                    (Command = "whereis") Or _
                    (Command = "squelch") Or _
                    (Command = "unsquelch") Or _
                    (Command = "ignore") Or _
                    (Command = "unignore") Or _
                    (Command = "ban") Or _
                    (Command = "unban") Or _
                    (Command = "kick") Or _
                    (Command = "designate")) Then
        
                    Splt() = Split(strTmp, Space$(1), 3)
                    
                    If (UBound(Splt) > 0) Then
                        Command = StringFormat("{0} {1}", Splt(0), ReverseConvertUsernameGateway(Splt(1)))

                        If ((g_Channel.IsSilent) And (frmChat.mnuDisableVoidView.Checked = False)) Then
                            If ((LCase$(Splt(0)) = "/unignore") Or (LCase$(Splt(0)) = "/unsquelch")) Then
                                If (StrComp(Splt(1), GetCurrentUsername, vbTextCompare) = 0) Then
                                    lvChannel.ListItems.Clear
                                End If
                            End If
                        End If
                        
                        If (UBound(Splt) > 1) Then
                            ReDim Preserve Splt(0 To UBound(Splt) - 1)
                        End If
                    End If
                    
                ElseIf ((Command = "f") Or _
                        (Command = "friends")) Then
                    
                    Splt() = Split(strTmp, Space$(1), 3)
                    
                    Command = Splt(0)
                    
                    If (UBound(Splt) >= 1) Then
                        Command = StringFormat("{0} {1}", Command, Splt(1))
                        
                        If (UBound(Splt) >= 2) Then
                            Select Case (LCase$(Splt(1)))
                                Case "m", "msg"
                                    ReDim Preserve Splt(0 To UBound(Splt) - 1)

                                Case Else
                                    Splt() = Split(strTmp, Space$(1), 4)
                                
                                    If ((StrReverse$(BotVars.Product) = PRODUCT_WAR3) Or _
                                        (StrReverse$(BotVars.Product) = PRODUCT_W3XP)) Then
                                        
                                        Command = StringFormat("{0} {1}", Command, ReverseConvertUsernameGateway(Splt(2)))
                                    Else
                                        Command = StringFormat("{0} {1}", Command, Splt(2))
                                    End If
                                    
                                    If (UBound(Splt) >= 3) Then
                                        Command = StringFormat("{0} {1}", Command, Splt(3))
                                    End If
                            End Select
                        End If
                    End If
                Else
                    Command = StringFormat("/{0}", Command)
                    strTmp = Mid$(strTmp, Len(Command) + 2)
                End If
                
                If (Len(Command) >= BNET_MSG_LENGTH) Then
                    Exit Function
                End If

                If (UBound(Splt) > 0) Then
                    strTmp = Mid$(strTmp, _
                        (Len(Join(Splt(), Space$(1))) + (Len(Space$(1))) + 1))
                End If
            End If
        End If
        
        If (msg_priority < 0) Then
            Dim cmdName    As String
            Dim spaceIndex As Long

            spaceIndex = InStr(1, Message, Space$(1), vbBinaryCompare)
            
            If (spaceIndex >= 2) Then
                cmdName = LCase$(Left$(Mid$(Message, 2), spaceIndex - 2))
            Else
                cmdName = LCase$(Mid$(Message, 2))
            End If
            
            Select Case (cmdName)
                Case "designate": msg_priority = PRIORITY.SPECIAL_MESSAGE
                Case "resign":    msg_priority = PRIORITY.SPECIAL_MESSAGE
                Case "who":       msg_priority = PRIORITY.SPECIAL_MESSAGE
                Case "unban":     msg_priority = PRIORITY.SPECIAL_MESSAGE
                Case "clan", "c": msg_priority = PRIORITY.SPECIAL_MESSAGE
                Case "ban":       msg_priority = PRIORITY.CHANNEL_MODERATION_MESSAGE
                Case "kick":      msg_priority = PRIORITY.CHANNEL_MODERATION_MESSAGE
                Case Else:        msg_priority = PRIORITY.MESSAGE_DEFAULT
            End Select
        End If
        
        MaxLength = Config.MaxMessageLength
        
        Call SplitByLen(strTmp, (MaxLength - Len(Command)), Splt(), vbNullString, , OversizeDelimiter)

        ReDim Preserve Splt(0 To UBound(Splt))

        ' add to the queue!
        For i = LBound(Splt) To UBound(Splt)
            ' store current tick
            GTC = GetTickCount()
            
            ' store working copy
            Send = Splt(i)
            If (LenB(Command) > 0) Then
                If (LenB(Send) > 0) Then
                    Send = StringFormat("{0} {1}", Command, Send)
                Else
                    Send = Command
                End If
            ElseIf (Left(Send, 1) = "/" And i > LBound(Splt)) Then
                Send = StringFormat(" {0}", Send)
            End If
            
            ' create the queue object
            Set Q = New clsQueueOBj
            
            With Q
                .Message = Send
                .PRIORITY = msg_priority
                .Tag = Tag
            End With

            ' add it
            g_Queue.Push Q
            
            ' should we subject this message to the typical delay,
            ' or can we get it out of here a bit faster?  If we
            ' want it out of here quick, we need an empty queue
            ' and have had at least 10 seconds elapse since the
            ' previous message.
            If (g_Queue.Count() = 1) Then
                If (GTC - LastGTC >= 10000) Then
                    ' set default message delay when queue is empty (in ms)
                    delay = 10
                    
                    ' are we issuing a ban or kick command?
                    If (msg_priority = PRIORITY.CHANNEL_MODERATION_MESSAGE) Then
                        delay = g_BNCSQueue.BanDelay()
                    End If
                End If
            End If
            
            ' If queueTimerID is 0 the timer is idle right now, so reset it
            If QueueTimerID = 0 Then
                If delay = 0 Then
                    delay = g_BNCSQueue.GetDelay(g_Queue.Peek.Message)
                End If
            
                ' set the delay before our next queue cycle
                QueueTimerID = SetTimer(0&, 0&, delay, AddressOf QueueTimerProc)
            End If
        Next i
        
        AddQ = UBound(Splt) + 1
        
        ' store our tick for future reference
        LastGTC = GTC
    End If
        
    Exit Function
    
ERROR_HANDLER:
    Call AddChat(vbRed, "Error: " & Err.Description & " in AddQ().")

    Exit Function
End Function


Sub ClearChannel()
    ' reset channel object
    Set g_Channel = Nothing
    Set g_Channel = New clsChannelObj
    
    ' clear channel UI elements
    lvChannel.ListItems.Clear
    lblCurrentChannel.Caption = vbNullString
    
    ' reset this random boolean
    PassedClanMotdCheck = False
End Sub


Sub ReloadConfig(Optional Mode As Byte = 0)
    On Error GoTo ERROR_HANDLER

    Dim default_group_access As udtGetAccessResponse
    Dim s                    As String
    Dim i                    As Integer
    Dim f                    As Integer
    Dim Index                As Integer
    Dim bln                  As Boolean
    Dim doConvert            As Boolean
    Dim command_output()     As String
    
    Dim oCommandGenerator    As New clsCommandGeneratorObj
    
    If Mode <> 0 Then
        Config.Load GetConfigFilePath()
    End If
    
    BotVars.TSSetting = Config.TimestampMode

    ' Client settings
    If LenB(BotVars.Username) > 0 And StrComp(BotVars.Username, Config.Username, vbTextCompare) <> 0 Then
        AddChat RTBColors.ConsoleText, "Username set to " & Config.Username & "."
    End If
    BotVars.Username = Config.Username
    BotVars.Password = Config.Password
    BotVars.CDKey = Config.CDKey
    BotVars.ExpKey = Config.ExpKey
    BotVars.Product = StrReverse$(GetProductInfo(Config.Game).Code)
    BotVars.Server = Config.Server
    BotVars.HomeChannel = Config.HomeChannel
    BotVars.BotOwner = Config.BotOwner
    
    BotVars.Trigger = Config.Trigger
    'If (BotVars.TriggerLong = vbNullString) Then
    '    BotVars.Trigger = "."
    'End If
    
    BotVars.BNLSServer = Config.BNLSServer
    
    ' Load database and commands
    Call LoadDatabase
    Call oCommandGenerator.GenerateCommands
    
    ' Set UI fonts
    If Mode <> 1 Then
        Dim ResizeChatElements As Boolean
        Dim ResizeChannelElements As Boolean
        
        s = Config.ChatFont
        If s <> vbNullString And s <> rtbChat.Font.Name Then
            'rtbChat.Font.Name = s
            cboSend.Font.Name = s
            'rtbWhispers.Font.Name = s
            txtPre.Font.Name = s
            txtPost.Font.Name = s
            
            ResizeChatElements = True
        End If
        
        s = Config.ChannelListFont
        If s <> vbNullString And s <> lvChannel.Font.Name Then
            lvChannel.Font.Name = s
            lvClanList.Font.Name = s
            lvFriendList.Font.Name = s
            lblCurrentChannel.Font.Name = s
            ListviewTabs.Font.Name = s
            
            ResizeChatElements = True
        End If
        
        s = Config.ChatFontSize
        If StrictIsNumeric(s) Then
            If CInt(s) <> rtbChat.Font.Size Then
                'rtbChat.Font.Size = s
                cboSend.Font.Size = s
                'rtbWhispers.Font.Size = s
                txtPre.Font.Size = s
                txtPost.Font.Size = s
                
                ResizeChannelElements = True
            End If
        End If
        
        s = Config.ChannelListFontSize
        If StrictIsNumeric(s) Then
            If CInt(s) <> lvChannel.Font.Size Then
                lvChannel.Font.Size = s
                lvClanList.Font.Size = s
                lvFriendList.Font.Size = s
                lblCurrentChannel.Font.Size = s
                ListviewTabs.Font.Size = s
                
                ResizeChannelElements = True
            End If
        End If
    
        If ResizeChannelElements Then
            Dim lblHeight As Single
            
            lblCurrentChannel.AutoSize = True
            lblHeight = lblCurrentChannel.Height + 40
            lblCurrentChannel.AutoSize = False
            lblCurrentChannel.Height = lblHeight
            
            ResizeChatElements = True
        End If
        
        If ResizeChatElements Then
            Call ChangeRTBFont(rtbChat, Config.ChatFont, Config.ChannelListFontSize)
            Call ChangeRTBFont(rtbWhispers, Config.ChatFont, Config.ChannelListFontSize)
            
            Form_Resize
        End If
    End If
    
    Filters = Config.ChatFilters
    mnuToggleFilters.Checked = Filters
    If (Not Filters) Then
        BotVars.JoinWatch = 0
    End If
    
    BotVars.AutofilterMS = 0
    
    AutoModSafelistValue = Config.AutoSafelistLevel
    BotVars.ShowOfflineFriends = Config.ShowOfflineFriends
    
    If Config.HideClanDisplay Then
        With lvChannel
            .Width = (.Width - .ColumnHeaders(2).Width)
            .ColumnHeaders(2).Width = 0
        End With
    End If
    
    If Config.HidePingDisplay Then
        With lvChannel
            .Width = (.Width - .ColumnHeaders(3).Width)
            .ColumnHeaders(3).Width = 0
        End With
    End If
    
    BotVars.RetainOldBans = Config.RetainOldBans
    BotVars.StoreAllBans = Config.StoreAllBans
    
    BotVars.GatewayConventions = Config.NamespaceConvention
    BotVars.UseD2Naming = Config.UseD2Naming
    BotVars.D2NamingFormat = Config.D2NamingFormat
    
    BotVars.ShowStatsIcons = Config.ShowStatsIcons
    BotVars.ShowFlagsIcons = Config.ShowFlagIcons
    
    If (g_Online) Then
        Dim found       As ListItem
        Dim CurrentUser As Object
        Dim outbuf      As String

        SetTitle GetCurrentUsername & ", online in channel " & g_Channel.Name
        
        frmChat.UpdateTrayTooltip
        
        lvChannel.ListItems.Clear
        
        For i = 1 To g_Channel.Users.Count
            Set CurrentUser = g_Channel.Users(i)
        
            AddName CurrentUser.DisplayName, CurrentUser.Name, CurrentUser.Game, CurrentUser.Flags, CurrentUser.Ping, _
                CurrentUser.Stats.IconCode, CurrentUser.Clan
        Next i
        
        frmChat.lvFriendList.ListItems.Clear
        
        For i = 1 To g_Friends.Count
            Set CurrentUser = g_Friends(i)
        
            AddFriend CurrentUser.DisplayName, CurrentUser.Game, CurrentUser.Status
        Next i
    End If
    
    JoinMessagesOff = Not Config.ShowJoinLeaves
    mnuToggle.Checked = JoinMessagesOff

    mail = Config.BotMail
    
    BotVars.BanEvasion = Config.BanEvasion
    BotVars.Logging = Config.LoggingMode
    
    mnuToggleWWUse.Checked = Config.WhisperWindows
    BotVars.WhisperCmds = Config.WhisperCommands
    PhraseBans = Config.PhraseBans
    BotVars.CaseSensitiveFlags = Config.CaseSensitiveDBFlags
    BotVars.AutoCompletePostfix = Config.AutoCompletePostfix
    BotVars.BNLS = Config.UseBNLS
    BotVars.LogDBActions = Config.LogDBActions
    BotVars.LogCommands = Config.LogCommands

    '/* time to idle: defaults to 600 seconds / 10 minutes idle */
    BotVars.SecondsToIdle = Config.SecondsToIdle
    
    BotVars.BanUnderLevel = Config.LevelBanW3
    BotVars.BanUnderLevelMsg = Config.LevelBanMessage
    BotVars.BanPeons = Config.PeonBan
    
    BotVars.KickOnYell = Config.KickOnYell
    
    ' Capped at 32767, topic=29986 -Andy
    BotVars.IB_Wait = Config.IdleBanDelay

    BotVars.DefaultShitlistGroup = Config.ShitlistGroup
    If (BotVars.DefaultShitlistGroup <> vbNullString) Then
        default_group_access = _
                GetAccess(BotVars.DefaultShitlistGroup, "GROUP")
        
        If (default_group_access.Username = vbNullString) Then
            Call ProcessCommand(GetCurrentUsername, "/add " & BotVars.DefaultShitlistGroup & _
                    " B --type group --banmsg Shitlisted", True, False, False)
        End If
    End If
    
    BotVars.DefaultTagbansGroup = Config.TagbanGroup
    If (BotVars.DefaultTagbansGroup <> vbNullString) Then
        default_group_access = _
                GetAccess(BotVars.DefaultTagbansGroup, "GROUP")
        
        If (default_group_access.Username = vbNullString) Then
            Call ProcessCommand(CurrentUsername, "/add " & BotVars.DefaultTagbansGroup & _
                    " B --type group --banmsg Tagbanned", True, False, False)
        End If
    End If
    
    BotVars.DefaultSafelistGroup = Config.SafelistGroup
    If (BotVars.DefaultSafelistGroup <> vbNullString) Then
        default_group_access = _
                GetAccess(BotVars.DefaultSafelistGroup, "GROUP")
        
        If (default_group_access.Username = vbNullString) Then
            Call ProcessCommand(GetCurrentUsername, "/add " & BotVars.DefaultSafelistGroup & _
                    " S --type group", True, False, False)
        End If
    End If
    
    BotVars.DisableMP3Commands = Not Config.Mp3Commands
    
    BotVars.MaxBacklogSize = Config.MaxBacklogSize
    BotVars.MaxLogFileSize = Config.MaxLogFileSize
    
    If Config.UrlDetection Then
        EnableURLDetect rtbChat.hWnd
    Else
        DisableURLDetect rtbChat.hWnd
    End If
    
    ' reload quotes file
    Set g_Quotes = New clsQuotesObj
    
    BotVars.UseBackupChan = Config.UseBackupChannel
    BotVars.BackupChan = Config.BackupChannel

    mnuUTF8.Checked = Config.UseUTF8
    
    mnuToggleShowOutgoing.Checked = Config.ShowOutgoingWhispers
    mnuHideWhispersInrtbChat.Checked = Config.HideWhispersInMain
    mnuIgnoreInvites.Checked = Config.IgnoreClanInvites
    
    'LoadSafelist
    LoadArray LOAD_PHRASES, Phrases()
    LoadArray LOAD_FILTERS, gFilters()
    
    ProtectMsg = Config.ChannelProtectionMessage

    Call LoadOutFilters
    
    BotVars.IB_On = Config.IdleBan
    BotVars.IB_Kick = Config.IdleBanKick
    BotVars.IB_Wait = Config.IdleBanDelay

    BotVars.Spoof = Config.PingSpoofing
    
    Protect = Config.ChannelProtection
    BotVars.UseUDP = Config.UseUDP
    BotVars.IPBans = Config.IPBans
    BotVars.UseAltBnls = Config.BNLSFinder
    BotVars.QuietTime = Config.QuietTime
    
    mnuFlash.Checked = Config.FlashOnEvents
    
    BotVars.UseProxy = Config.UseProxy
    If BotVars.UseProxy And sckBNet.State = sckConnected Then BotVars.ProxyStatus = psOnline
    BotVars.ProxyIP = Config.ProxyIP
    BotVars.ProxyPort = Config.ProxyPort
    BotVars.ProxyIsSocks5 = CBool(StrComp(Config.ProxyType, "SOCKS5", vbTextCompare) = 0)
    
    BotVars.NoTray = Not Config.MinimizeToTray
    BotVars.NoAutocompletion = Not Config.NameAutoComplete
    BotVars.NoColoring = Not Config.NameColoring
    
    mnuDisableVoidView.Checked = Not Config.VoidView
    
    BotVars.MediaPlayer = Config.MediaPlayer
    
    
    ' Load some queue stuff, reluctantly
    BotVars.QueueMaxCredits = Config.QueueMaxCredits
    BotVars.QueueCostPerPacket = Config.QueueCostPerPacket
    BotVars.QueueCostPerByte = Config.QueueCostPerByte
    BotVars.QueueCostPerByteOverThreshhold = Config.QueueCostPerByteOver
    BotVars.QueueStartingCredits = Config.QueueStartingCredits
    BotVars.QueueThreshholdBytes = Config.QueueThresholdBytes
    BotVars.QueueCreditRate = Config.QueueCreditRate

    BotVars.UseRealm = Config.UseD2Realms

    txtPre.Text = ""
    txtPost.Text = ""
    
    txtPre.Visible = Not Config.DisablePrefixBox
    mnuPopAddLeft.Enabled = Not Config.DisablePrefixBox
    mnuPopFLAddLeft.Enabled = Not Config.DisablePrefixBox
    mnuPopClanAddLeft.Enabled = Not Config.DisablePrefixBox

    txtPost.Visible = Not Config.DisableSuffixBox
    
    '[Other] MathAllowUI - Will allow People to use MessageBox/InputBox or other UI related commands in the .eval/.math commands ~Hdx 09-25-07
    SCRestricted.AllowUI = Config.MathAllowUI
    BotVars.NoRTBAutomaticCopy = Config.DisableRTBAutoCopy
    
    BotVars.UseGreet = Config.GreetMessage
    BotVars.GreetMsg = Config.GreetMessageText
    BotVars.WhisperGreet = Config.WhisperGreet
    
    BotVars.ChatDelay = Config.ChatDelay
    
    s = Config.GetFilePath("Logs")
    If (Not (s = vbNullString)) Then
        g_Logger.LogPath = s
    End If

    Call ChatQueue_Initialize

    ' I reluctantly add the queue variables here.
    
    If (g_Online) Then
        Call g_Channel.CheckUsers
    Else
        Err.Clear
     
        '//Removed 10/29/09 - Hdx - I'll add in this feature later properly, does not work as is.
        'If (ReadCfg(OV, "LocalIP") <> vbNullString) Then
        '    If (Err.Number = 0) Then: sckBNet.bind , ReadCfg(OV, "LocalIP")
        '    If (Err.Number = 0) Then: sckBNLS.bind , ReadCfg(OV, "LocalIP")
        '    If (Err.Number = 0) Then: sckMCP.bind , ReadCfg(OV, "LocalIP")
        'End If
    End If
    
    ' disable the script system if override is set
    modScripting.SetScriptSystemDisabled Config.DisableScripting
    
    Set oCommandGenerator = Nothing
    
    Exit Sub

ERROR_HANDLER:
    If (Err.Number = 10049) Then
        AddChat RTBColors.ErrorMessageText, "Error (#" & Err.Number & "): " & Err.Description & " in ReloadConfig()."
    End If
    
    Resume Next
End Sub

Private Sub ChangeRTBFont(rtb As RichTextBox, ByVal NewFont As String, ByVal NewSize As Integer)
    Dim tmpBuffer As String
    
    With rtb
        .SelStart = 0
        .SelLength = Len(.Text)
        .SelFontSize = NewSize
        .SelFontName = NewFont
        tmpBuffer = .TextRTF
        .Text = vbNullString
        .Font.Name = NewFont
        .Font.Size = NewSize
        .TextRTF = tmpBuffer
        .SelStart = Len(.Text)
    End With
End Sub

'returns OK to Proceed
Function DisplayError(ByVal ErrorNumber As Integer, bytType As Byte, _
    ByVal source As enuErrorSources) As Boolean
    
    Dim s As String
    
    s = GErrorHandler.GetErrorString(ErrorNumber, source)
    
    If (LenB(s) > 0) Then
        Select Case (bytType)
            Case 0: s = "[BNLS] " & s
            Case 1: s = "[BNCS] " & s
            Case 2: s = "[PROXY] " & s
        End Select
        
        AddChat RTBColors.ErrorMessageText, s
    End If
    
    DisplayError = GErrorHandler.OKToProceed()
End Function

Sub LoadOutFilters()
    Const o As String = "Outgoing"
    Const f As String = FILE_FILTERS
    
    Dim s   As String
    Dim i   As Integer
    
    ReDim gOutFilters(1 To 1)
    ReDim Catch(0)
    
    Catch(0) = vbNullString
    
    s = ReadINI(o, "Total", f)
    
    If (Not (StrictIsNumeric(s))) Then
        Exit Sub
    End If
    
    For i = 1 To Val(s)
        gOutFilters(i).ofFind = Replace(LCase(ReadINI(o, "Find" & i, f)), "�", " ")
        gOutFilters(i).ofReplace = Replace(ReadINI(o, "Replace" & i, f), "�", " ")
        
        If (i <> Val(s)) Then
            ReDim Preserve gOutFilters(1 To i + 1)
        End If
    Next i
    
    If (Dir$(GetFilePath(FILE_CATCH_PHRASES)) <> vbNullString) Then
        i = FreeFile
        
        Open GetFilePath(FILE_CATCH_PHRASES) For Input As #i
        
            If (LOF(i) < 2) Then
                Close #i
                
                Exit Sub
            End If
            
            Do While Not EOF(i)
                Line Input #i, s
                
                If ((s <> vbNullString) And (s <> " ")) Then
                    Catch(UBound(Catch)) = LCase$(s)
                    
                    ReDim Preserve Catch(0 To UBound(Catch) + 1)
                End If
            Loop
            
            'Note: Why did this happen?
            'If Catch(0) = vbNullString Then Catch(0) = "�"
            
        Close #i
    End If
End Sub

Function OutFilterMsg(ByVal strOut As String) As String
    Dim i As Integer
    
    If (UBound(gOutFilters) > 0) Then
        For i = LBound(gOutFilters) To UBound(gOutFilters)
            strOut = Replace(strOut, gOutFilters(i).ofFind, _
                gOutFilters(i).ofReplace)
        Next i
    End If
    
    OutFilterMsg = strOut
End Function

Private Sub sckBNet_DataArrival(ByVal bytesTotal As Long)
    'On Error GoTo ERROR_HANDLER

    Dim strTemp     As String
    Dim fTemp       As String
    Dim BufferLimit As Long
    Dim interations As Integer
    
    sckBNet.GetData strTemp, vbString
    
'    Debug.Print "--> socket received a packet"
'    Debug.Print DebugOutput(strTemp)
    
    If Not BotVars.UseProxy Or BotVars.ProxyStatus = psOnline Then
        'Debug.Print String(50, "-")
        BNCSBuffer.AddData strTemp
    
        While BNCSBuffer.FullPacket And BufferLimit < 20
            
            strTemp = BNCSBuffer.GetPacket
            
            'BNCSBuffer.WriteLog "Parsing the following packet:", True
            'BNCSBuffer.WriteLog strTemp
            
            Call BNCSParsePacket(strTemp)
            
            'interations = (interations + 1)
           
            'If (interations >= 2000) Then
            '    MsgBox "ahhhh!"
            '
            '    Exit Sub
            'End If
            
            ' Why do we need this?  Anyway, it's causing topic id #26093
            ' (The Void issue).
            'BufferLimit = (BufferLimit + 1) 'DebugOutput Left$(strBuffer, lngLen)
        Wend
    Else
        'proxy is ON and NOT CONNECTED
        'parse incoming data
        ParseProxyPacket strTemp
    End If
    
    Exit Sub
    
ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, "Error (#" & Err.Number & "): " & Err.Description & " in sckBNet_DataArrival()."
    
    Exit Sub
End Sub

Sub LoadArray(ByVal Mode As Byte, ByRef tArray() As String)
    Dim f As Integer
    Dim Path As String
    Dim temp As String
    Dim i As Integer
    Dim c As Integer
    
    f = FreeFile
    
    Const FI As String = "TextFilters"
    
    Select Case Mode
        Case LOAD_FILTERS
            Path = GetFilePath(FILE_FILTERS)
        Case LOAD_PHRASES
            Path = GetFilePath(FILE_PHRASE_BANS)
        Case LOAD_DB
            Path = GetFilePath(FILE_USERDB)
            Exit Sub
    End Select
    
    If Dir(Path) <> vbNullString Then
        Open Path For Input As #f
        If LOF(f) > 2 Then
            ReDim tArray(0)
            If Mode <> LOAD_FILTERS Then
                Do
                    Line Input #f, temp
                    If Len(temp) > 0 Then
                        ' removed for 2.5 - why am I PCing it ?
                        'If Mode = LOAD_SAFELIST Then temp = PrepareCheck(temp)
                        tArray(UBound(tArray)) = LCase(temp)
                        ReDim Preserve tArray(UBound(tArray) + 1)
                    End If
                Loop While Not EOF(f)
            Else
                temp = ReadINI(FI, "Total", FILE_FILTERS)
                If temp <> vbNullString And CInt(temp) > -1 Then
                    c = Int(temp)
                    For i = 1 To c
                        temp = ReadINI(FI, "Filter" & i, FILE_FILTERS)
                        If temp <> vbNullString Then
                            tArray(UBound(tArray)) = LCase(temp)
                            If i <> c Then ReDim Preserve tArray(UBound(tArray) + 1)
                        End If
                    Next i
                End If
            End If
        End If
        Close #f
    End If
End Sub

Private Sub sckBNLS_Close()
    If MDebug("all") Then
        AddChat COLOR_BLUE, "BNLS CLOSE"
    End If
    If (Not BNLSAuthorized) Then
        AddChat RTBColors.ErrorMessageText, "You have been disconnected from the BNLS server. You may be IPbanned from the server, it may be having issues, or there is something blocking your connection."
        AddChat RTBColors.ErrorMessageText, "Try using another BNLS server to connect, and check your firewall settings."
    End If
End Sub

Private Sub sckBNLS_Connect()
    If MDebug("all") Then
        AddChat COLOR_BLUE, "BNLS CONNECT"
    End If
    
    Call Event_BNLSConnected
    
    'With PBuffer
    '    .InsertNTString "stealth"
    '    .vLSendPacket &HE
    'End With
    modBNLS.SEND_BNLS_AUTHORIZE
    
    SetNagelStatus sckBNLS.SocketHandle, False
    
    'frmChat.sckBNet.Connect 'BNLS is authorized, proceed to initiate BNet connection.
End Sub

Private Sub sckBNLS_DataArrival(ByVal bytesTotal As Long)
    On Error GoTo ERROR_HANDLER

    Dim strTemp As String
    
    sckBNLS.GetData strTemp, vbString
    
    If BotVars.UseProxy And (BotVars.ProxyStatus = psConnecting Or BotVars.ProxyStatus = psLoggingIn) Then
    
'        Debug.Print "prox input: " & DebugOutput(strTemp)
    
        Select Case BotVars.ProxyStatus
            Case psConnecting
                'chr(5) or chr(4) depending on version & method
                'do an instr search to find the method number.
                'For public proxys you are looking for chr(0)
                '<macyui>
                
                If InStr(1, strTemp, Chr(5)) > 0 Or InStr(1, strTemp, Chr(4)) > 0 Then
                    If InStr(1, strTemp, Chr(0)) > 0 Then
                        UpdateProxyStatus psLoggingIn, PROXY_LOGGING_IN
                        
                        LogonToProxy sckBNLS, BotVars.BNLSServer, 9367, False
                    Else
                        UpdateProxyStatus psNotConnected, PROXY_IS_NOT_PUBLIC
                        sckBNLS.Close
                    End If
                Else
                    UpdateProxyStatus psNotConnected, PROXY_IS_NOT_PUBLIC
                    sckBNLS.Close
                End If
                
            Case psLoggingIn
                'Then when it sends back chr(5) & chr(0) indicating
                'connection success, login and proceed as usual.
                
                If InStr(1, strTemp, Chr(5)) > 0 And InStr(1, strTemp, Chr(0)) > 0 Then
                    UpdateProxyStatus psOnline, PROXY_LOGIN_SUCCESS
                Else
                    UpdateProxyStatus psNotConnected, PROXY_LOGIN_FAILED
                    sckBNLS.Close
                End If
                
        End Select
    Else
        BNLSBuffer.AddData strTemp
            
        While BNLSBuffer.FullPacket
            modBNLS.BNLSRecvPacket BNLSBuffer.GetPacket
        Wend
    End If
    
    Exit Sub
    
ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, _
        "Error (#" & Err.Number & "): " & Err.Description & " in sckBNLS_DataArrival()."

    Exit Sub
End Sub

Private Sub sckBNLS_Error(ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    Call Event_BNLSError(Number, Description)
End Sub

'This function checks if the user selected when right-clicked is the same one when they click on the menu option. - FrOzeN
Private Function PopupMenuUserCheck() As Boolean
    If Not (lvChannel.SelectedItem Is Nothing) Then
        If mnuPopup.Tag <> lvChannel.SelectedItem.Text Then
            PopupMenuUserCheck = False
            Exit Function
        End If
    End If
    
    PopupMenuUserCheck = True
End Function

Private Function PopupMenuFLUserCheck() As Boolean
    If Not (lvFriendList.SelectedItem Is Nothing) Then
        If mnuPopFList.Tag <> lvFriendList.SelectedItem.Text Then
            PopupMenuFLUserCheck = False
            Exit Function
        End If
    End If
    
    PopupMenuFLUserCheck = True
End Function

Private Function PopupMenuCLUserCheck() As Boolean
    If Not (lvClanList.SelectedItem Is Nothing) Then
        If mnuPopClanList.Tag <> lvClanList.SelectedItem.Text Then
            PopupMenuCLUserCheck = False
            Exit Function
        End If
    End If
    
    PopupMenuCLUserCheck = True
End Function

Function GetSelectedUsers() As Collection
    Dim i As Integer

    Set GetSelectedUsers = New Collection
    
    For i = 1 To lvChannel.ListItems.Count
        If (lvChannel.ListItems(i).Selected) Then
            Call GetSelectedUsers.Add(lvChannel.ListItems(i).Text)
        End If
    Next i
End Function

Function GetSelectedUser() As String
    If (lvChannel.SelectedItem Is Nothing) Then
        GetSelectedUser = vbNullString
    
        Exit Function
    End If
    
    GetSelectedUser = lvChannel.SelectedItem.Tag
End Function

Function GetFriendsSelectedUser() As String
    If (lvFriendList.SelectedItem Is Nothing) Then
        GetFriendsSelectedUser = vbNullString
    
        Exit Function
    End If
    
    GetFriendsSelectedUser = CleanUsername(ReverseConvertUsernameGateway(lvFriendList.SelectedItem.Text))
End Function

Function GetRandomPerson() As String
    Dim i As Integer
    
    If (g_Channel.Users.Count > 0) Then
        Randomize
        
        i = Int(g_Channel.Users.Count * Rnd + 1)

        GetRandomPerson = g_Channel.Users(i).DisplayName
    End If
End Function

Function MatchClosest(ByVal toMatch As String, Optional startIndex As Long = 1) As String
    Dim lstView     As ListView

    Dim i           As Integer
    Dim CurrentName As String
    Dim atChar      As Integer
    Dim Index       As Integer
    Dim Loops       As Integer

    i = InStr(1, toMatch, " ", vbBinaryCompare)
    
    If (i > 0) Then
        toMatch = Mid$(toMatch, i + 1)
    End If
    
    Select Case (ListviewTabs.Tab)
        Case 0:
            Set lstView = lvChannel
        Case 1:
            Set lstView = lvFriendList
        Case 2:
            Set lstView = lvClanList
    End Select
    
    With lstView.ListItems
        If (.Count > 0) Then
            Dim c As Integer
            
            If (startIndex > .Count) Then
                Index = 1
            Else
                Index = startIndex
            End If
        
            While (Loops < 2)
                For i = Index To .Count 'for each user
                    CurrentName = .Item(i).Text
                
                    If (Len(CurrentName) >= Len(toMatch)) Then
                        For c = 1 To Len(toMatch) 'for each letter in their name
                            If (StrComp(Mid$(toMatch, c, 1), Mid$(CurrentName, c, 1), _
                                vbTextCompare) <> 0) Then
                                
                                Exit For
                            End If
                        Next c
                        
                        If (c >= (Len(toMatch) + 1)) Then
                            MatchClosest = .Item(i).Text
                            
                            MatchIndex = i
                            
                            Exit Function
                        End If
                    End If
                Next i
                
                Index = 1
                
                Loops = (Loops + 1)
            Wend
            
            Loops = 0
        End If
    End With
    
    atChar = InStr(1, toMatch, "@", vbBinaryCompare)
    
    If (atChar <> 0) Then
        Dim tmp      As String
        Dim Gateways(5, 2) As String
        Dim OtherGateway As String
        
        ' populate list
        Gateways(0, 0) = "USWest"
        Gateways(0, 1) = "Lordaeron"
        Gateways(1, 0) = "USEast"
        Gateways(1, 1) = "Azeroth"
        Gateways(2, 0) = "Asia"
        Gateways(2, 1) = "Kalimdor"
        Gateways(3, 0) = "Europe"
        Gateways(3, 1) = "Northrend"
        Gateways(4, 0) = "Beta"
        Gateways(4, 1) = "Westfall"
        
        Dim CurrentGateway As Integer
        CurrentGateway = -1
        If (LenB(BotVars.Gateway) > 0) Then
            For i = 0 To UBound(Gateways, 1)
                If (StrComp(BotVars.Gateway, Gateways(i, 0)) = 0) Then
                    CurrentGateway = i
                    OtherGateway = Gateways(i, 1)
                    Exit For
                End If
                If (StrComp(BotVars.Gateway, Gateways(i, 1)) = 0) Then
                    CurrentGateway = i
                    OtherGateway = Gateways(i, 0)
                    Exit For
                End If
            Next i
            If (CurrentGateway = -1) Then ' BotVars.Gateway not known, @[tab]=@BotVars.Gateway
                OtherGateway = BotVars.Gateway
                CurrentGateway = 0
            End If
        Else ' BotVars.Gateway is nothing, @[tab]
            MatchClosest = vbNullString
            
            MatchIndex = 1
            
            Exit Function
        End If
        
    
        If (startIndex > UBound(Gateways, 2)) Then
            Index = 0
        Else
            Index = (startIndex - 1)
        End If
        
        If (Len(toMatch) >= (atChar + 1)) Then
            tmp = Mid$(toMatch, atChar + 1)

            While (Loops < 2)
                If (Len(OtherGateway) >= Len(tmp)) Then
                    If (StrComp(Left$(OtherGateway, Len(tmp)), tmp, _
                        vbTextCompare) = 0) Then
                        
                        Dim j As Integer
                    
                        MatchClosest = Left$(toMatch, atChar) & Gateways(CurrentGateway, i)
                        
                        MatchIndex = (i + 1)
                        
                        Exit Function
                    End If
                End If
                
                Index = 0
                
                Loops = (Loops + 1)
            Wend
        Else
            If (tmp = vbNullString) Then
                MatchClosest = Left$(toMatch, atChar) & OtherGateway
                    
                MatchIndex = (Index + 1)
                    
                Exit Function
            End If
        End If
    End If
    
    MatchClosest = vbNullString
    
    MatchIndex = 1
End Function

Function GetChannelString() As String
    If Not g_Online Then
        GetChannelString = vbNullString
    Else
        Select Case ListviewTabs.Tab
            Case 0:
                If LenB(g_Channel.Name) = 0 Then
                    GetChannelString = BotVars.Gateway
                Else
                    GetChannelString = g_Channel.Name & " (" & lvChannel.ListItems.Count & ")"
                End If
            Case 1: GetChannelString = "Friends (" & lvFriendList.ListItems.Count & ")"
            Case 2: GetChannelString = "Clan " & g_Clan.Name & " (" & lvClanList.ListItems.Count & " members)"
        End Select
    End If
End Function

'this is a fucking mess. It reads:
'"This copy of StealthBot has been tampered with. Please get a new copy of StealthBot at http://www.stealthbot.net.
'Additionally, please report the website at which you downloaded StealthBot in an e-mail to abuse@stealthbot.net. Thanks!"

Function GetHexProtectionMessage() As String
    GetHexProtectionMessage = _
Chr(Asc("T")) & Chr(Asc("h")) & Chr(Asc("i")) & Chr(Asc("s")) & Chr(Asc(" ")) & Chr(Asc("c")) & _
Chr(Asc("o")) & Chr(Asc("p")) & Chr(Asc("y")) & Chr(Asc(" ")) & Chr(Asc("o")) & Chr(Asc("f")) & Chr(Asc(" ")) & Chr(Asc("S")) & Chr(Asc("t")) & Chr(Asc("e")) & Chr(Asc("a")) & Chr(Asc("l")) & Chr(Asc("t")) & Chr(Asc("h")) & Chr(Asc("B")) & Chr(Asc("o")) & Chr(Asc("t")) & Chr(Asc(" ")) & Chr(Asc("h")) & Chr(Asc("a")) & Chr(Asc("s")) & Chr(Asc(" ")) & Chr(Asc("b")) & Chr(Asc("e")) & Chr(Asc("e")) & Chr(Asc("n")) & Chr(Asc(" ")) & Chr(Asc("t")) & Chr(Asc("a")) & Chr(Asc("m")) & Chr(Asc("p")) & Chr(Asc("e")) & Chr(Asc("r")) & Chr(Asc("e")) & Chr(Asc("d")) & Chr(Asc(" ")) & Chr(Asc("w")) & Chr(Asc("i")) & Chr(Asc("t")) & Chr(Asc("h")) & Chr(Asc(".")) & Chr(Asc(" ")) & Chr(Asc("P")) & Chr(Asc("l")) & Chr(Asc("e")) & Chr(Asc("a")) & Chr(Asc("s")) & Chr(Asc("e")) & Chr(Asc(" ")) & Chr(Asc("g")) & Chr(Asc("e")) & Chr(Asc("t")) & Chr(Asc(" ")) & Chr(Asc("a")) & Chr(Asc(" ")) & Chr(Asc("n")) & Chr(Asc("e")) & Chr(Asc("w")) & _
 Chr(Asc(" ")) & Chr(Asc("c")) & Chr(Asc("o")) & Chr(Asc("p")) & Chr(Asc("y")) & Chr(Asc(" ")) & Chr(Asc("o")) & Chr(Asc("f")) & Chr(Asc(" ")) & Chr(Asc("S")) & Chr(Asc("t")) & Chr(Asc("e")) & Chr(Asc("a")) & Chr(Asc("l")) & Chr(Asc("t")) & Chr(Asc("h")) & Chr(Asc("B")) & Chr(Asc("o")) & Chr(Asc("t")) & Chr(Asc(" ")) & Chr(Asc("a")) & Chr(Asc("t")) & Chr(Asc(" ")) & Chr(Asc("h")) & Chr(Asc("t")) & Chr(Asc("t")) & Chr(Asc("p")) & Chr(Asc(":")) & Chr(Asc("/")) & Chr(Asc("/")) & Chr(Asc("w")) & Chr(Asc("w")) & Chr(Asc("w")) & Chr(Asc(".")) & Chr(Asc("s")) & Chr(Asc("t")) & Chr(Asc("e")) & Chr(Asc("a")) & Chr(Asc("l")) & Chr(Asc("t")) & Chr(Asc("h")) & Chr(Asc("b")) & Chr(Asc("o")) & Chr(Asc("t")) & Chr(Asc(".")) & Chr(Asc("n")) & Chr(Asc("e")) & Chr(Asc("t")) & Chr(Asc(".")) & Chr(Asc(" ")) & Chr(Asc("A")) & Chr(Asc("d")) & Chr(Asc("d")) & Chr(Asc("i")) & Chr(Asc("t")) & Chr(Asc("i")) & Chr(Asc("o")) & Chr(Asc("n")) & _
    Chr(Asc("a")) & Chr(Asc("l")) & Chr(Asc("l")) & Chr(Asc("y")) & Chr(Asc(",")) & Chr(Asc(" ")) & _
 Chr(Asc("p")) & Chr(Asc("l")) & Chr(Asc("e")) & Chr(Asc("a")) & Chr(Asc("s")) & Chr(Asc("e")) & Chr(Asc(" ")) & Chr(Asc("r")) & Chr(Asc("e")) & Chr(Asc("p")) & Chr(Asc("o")) & Chr(Asc("r")) & Chr(Asc("t")) & Chr(Asc(" ")) & Chr(Asc("t")) & Chr(Asc("h")) & Chr(Asc("e")) & Chr(Asc(" ")) & Chr(Asc("w")) & Chr(Asc("e")) & Chr(Asc("b")) & Chr(Asc("s")) & Chr(Asc("i")) & Chr(Asc("t")) & Chr(Asc("e")) & Chr(Asc(" ")) & Chr(Asc("a")) & Chr(Asc("t")) & Chr(Asc(" ")) & Chr(Asc("w")) & Chr(Asc("h")) & Chr(Asc("i")) & Chr(Asc("c")) & Chr(Asc("h")) & Chr(Asc(" ")) & Chr(Asc("y")) & Chr(Asc("o")) & Chr(Asc("u")) & Chr(Asc(" ")) & Chr(Asc("d")) & Chr(Asc("o")) & Chr(Asc("w")) & Chr(Asc("n")) & Chr(Asc("l")) & Chr(Asc("o")) & Chr(Asc("a")) & Chr(Asc("d")) & Chr(Asc("e")) & Chr(Asc("d")) & Chr(Asc(" ")) & Chr(Asc("S")) & Chr(Asc("t")) & Chr(Asc("e")) & Chr(Asc("a")) & Chr(Asc("l")) & Chr(Asc("t")) & Chr(Asc("h")) & Chr(Asc("B")) & _
 Chr(Asc("o")) & Chr(Asc("t")) & Chr(Asc(" ")) & Chr(Asc("i")) & Chr(Asc("n")) & Chr(Asc(" ")) & _
 Chr(Asc("a")) & Chr(Asc("n")) & Chr(Asc(" ")) & Chr(Asc("e")) & Chr(Asc("-")) & Chr(Asc("m")) & Chr(Asc("a")) & Chr(Asc("i")) & Chr(Asc("l")) & Chr(Asc(" ")) & Chr(Asc("t")) & Chr(Asc("o")) & Chr(Asc(" ")) & Chr(Asc("a")) & Chr(Asc("b")) & Chr(Asc("u")) & Chr(Asc("s")) & Chr(Asc("e")) & Chr(Asc("@")) & Chr(Asc("s")) & Chr(Asc("t")) & Chr(Asc("e")) & Chr(Asc("a")) & Chr(Asc("l")) & Chr(Asc("t")) & Chr(Asc("h")) & Chr(Asc("b")) & Chr(Asc("o")) & Chr(Asc("t")) & Chr(Asc(".")) & Chr(Asc("n")) & Chr(Asc("e")) & Chr(Asc("t")) & Chr(Asc(".")) & Chr(Asc(" ")) & Chr(Asc("T")) & Chr(Asc("h")) & Chr(Asc("a")) & Chr(Asc("n")) & Chr(Asc("k")) & Chr(Asc("s")) & Chr(Asc("!"))
End Function

Sub DeconstructSettings()
    If Not (SettingsForm Is Nothing) Then
        Set SettingsForm = Nothing
    End If
End Sub

'SHOW/HIDE STUFF
Public Sub cmdShowHide_Click()
    rtbWhispersVisible = (StrComp(cmdShowHide.Caption, CAP_HIDE))
    rtbWhispers.Visible = rtbWhispersVisible
    Config.WhisperWindows = CBool(rtbWhispers.Visible)
    Call Config.Save
    
    If Me.WindowState <> vbMaximized And Me.WindowState <> vbMinimized Then
        If rtbWhispersVisible Then
            Me.Height = Me.Height + rtbWhispers.Height - Screen.TwipsPerPixelY
        Else
            Me.Height = Me.Height - rtbWhispers.Height + Screen.TwipsPerPixelY
        End If
    End If
        
    Call Form_Resize
End Sub

'// to be called on every successful login
Sub InitListviewTabs()
    Dim toSet As Boolean

    If IsW3() Then
        If Clan.isUsed Then
            toSet = True
        Else
            toSet = False
        End If
    Else
        toSet = False
    End If
    
    ListviewTabs.TabEnabled(LVW_BUTTON_CLAN) = toSet
    ListviewTabs.TabEnabled(LVW_BUTTON_FRIENDS) = Config.FriendsListTab
End Sub

'// to be called at disconnect time
Sub DisableListviewTabs()
    ListviewTabs.TabEnabled(LVW_BUTTON_FRIENDS) = False
    ListviewTabs.TabEnabled(LVW_BUTTON_CLAN) = False
End Sub

Sub AddClanMember(ByVal Name As String, Rank As Integer, Online As Integer)
On Error GoTo ERROR_HANDLER:
    Dim visible_rank As Integer
    
    visible_rank = Rank
    
    If (visible_rank = 0) Then visible_rank = 1
    If (visible_rank > 4) Then visible_rank = 5 '// handle bad ranks
    
    '// add user
    
    Name = KillNull(Name)
    
    If (Not Online = 0) Then Online = 1
    
    With lvClanList
        .ListItems.Add .ListItems.Count + 1, , Name, , visible_rank
        If (BotVars.NoColoring = False) Then
            If (StrComp(StripAccountNumber(GetCurrentUsername), Name) = 0) Then
                .ListItems(.ListItems.Count).ForeColor = FormColors.ChannelListSelf
            End If
        End If
        .ListItems(.ListItems.Count).ListSubItems.Add , , , Online + 6
        .ListItems(.ListItems.Count).ListSubItems.Add , , visible_rank
        .SortKey = 2
        .SortOrder = lvwDescending
        .Sorted = True
    End With
    
    lblCurrentChannel.Caption = GetChannelString()
    
    frmChat.ListviewTabs_Click 0
    
    RunInAll "Event_ClanInfo", Name, Rank, Online
    Exit Sub
ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, StringFormat("Error: #{0}: {1} in frmChat.AddClanMember", Err.Number, Err.Description)
End Sub

Private Function GetClanSelectedUser() As String
    With lvClanList
        If Not (.SelectedItem Is Nothing) Then
            If .SelectedItem.Index < 1 Then
                GetClanSelectedUser = vbNullString: Exit Function
            Else
                GetClanSelectedUser = CleanUsername(ReverseConvertUsernameGateway(.SelectedItem.Text))
            End If
        End If
    End With
End Function

Private Sub lvClanList_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim aInx As Integer
    Dim bIsOn As Boolean
    Dim MyRank As Long
    Dim TheirRank As Long
    Dim CanMoveUp As Boolean
    Dim CanMoveDown As Boolean
    Dim CanRemove As Boolean
    Dim CanMakeChief As Boolean
    Dim CanDisband As Boolean
    Dim IsSelf As Boolean
    Dim CanLeave As Boolean
    
    If (lvClanList.SelectedItem Is Nothing) Then
        Exit Sub
    End If

    If Button = vbRightButton Then
        If Not (lvClanList.SelectedItem Is Nothing) Then
            aInx = lvClanList.SelectedItem.Index
            
            If aInx > 0 Then
                MyRank = g_Clan.Self.Rank
                TheirRank = g_Clan.GetUser(GetClanSelectedUser).Rank
                IsSelf = StrComp(g_Clan.Self.Name, GetClanSelectedUser, vbBinaryCompare) = 0
                
                CanMoveUp = Not IsSelf And (MyRank > (TheirRank + 1)) And (TheirRank > 0)
                CanMoveDown = Not IsSelf And (MyRank > TheirRank) And (TheirRank > 1)
                CanRemove = Not IsSelf And (CanMoveUp Or CanMoveDown)
                CanMakeChief = Not IsSelf And (MyRank = 4) And (TheirRank > 1)
                CanLeave = IsSelf And (MyRank > 0 And MyRank < 4)
                CanDisband = IsSelf And (MyRank = 4)
                
                bIsOn = g_Clan.GetUser(GetClanSelectedUser).IsOnline
                
                mnuPopClanWhisper.Enabled = bIsOn
                
                mnuPopClanPromote.Enabled = CanMoveUp
                mnuPopClanDemote.Enabled = CanMoveDown
                mnuPopClanRemove.Enabled = CanRemove
                mnuPopClanLeave.Enabled = CanLeave
                mnuPopClanDisband.Enabled = CanDisband
                mnuPopClanMakeChief.Enabled = CanMakeChief
                
                mnuPopClanPromote.Visible = Not IsSelf
                mnuPopClanDemote.Visible = Not IsSelf
                mnuPopClanRemove.Visible = Not IsSelf
                mnuPopClanLeave.Visible = IsSelf And (MyRank <> 4)
                mnuPopClanDisband.Visible = IsSelf And (MyRank = 4)
                mnuPopClanMakeChief.Visible = Not IsSelf And (MyRank = 4)
            End If
        End If
        
        mnuPopClanList.Tag = lvClanList.SelectedItem.Text 'Record which user is selected at time of right-clicking. - FrOzeN
        
        PopupMenu mnuPopClanList
    End If
End Sub

Sub DoConnect()

    If ((sckBNLS.State <> sckClosed) Or (sckBNet.State <> sckClosed)) Then
        Call DoDisconnect
    End If
    
    uTicks = 0
    
    UserCancelledConnect = False
    
    'Reset the BNLS auto-locator list
    BNLSFinderGotList = False
    
    'If Not IsValidIPAddress(BotVars.Server) And BotVars.UseProxy Then
        'AddChat RTBColors.ErrorMessageText, "[PROXY] Proxied connections must use a direct server IP address, such as those listed below your desired gateway in the Connection Settings menu, to connect."
        'AddChat RTBColors.ErrorMessageText, "[PROXY] Please change servers and try connecting again."
    'Else
        Call Connect
    'End If
End Sub

Sub DoDisconnect(Optional ByVal DoNotShow As Byte = 0, Optional ByVal LeaveUCCAlone As Boolean = False)
    On Error GoTo ERROR_HANDLER

    Dim i As Integer
    
    If (Not (UserCancelledConnect)) Then
        tmrAccountLock.Enabled = False
    
        SetTitle "Disconnected"
        
        frmChat.UpdateTrayTooltip
        
        Call CloseAllConnections(DoNotShow = 0)
        
        Set g_Channel = Nothing
        Set g_Clan = Nothing
        Set g_Friends = Nothing
        
        BotVars.Gateway = vbNullString
        
        CurrentUsername = vbNullString
        
        ListviewTabs.Tab = 0
        
        Call g_Queue.Clear
        
        If Not LeaveUCCAlone Then
            UserCancelledConnect = True
        End If
        
        If (UserCancelledConnect) Then
            'AddChat vbRed, "DISC!"
        
            If ReconnectTimerID > 0 Then
                KillTimer 0, ReconnectTimerID
                ReconnectTimerID = 0
            End If
            
            If ExReconnectTimerID > 0 Then
                KillTimer 0, ExReconnectTimerID
                ExReconnectTimerID = 0
            End If
            
            If SCReloadTimerID > 0 Then
                KillTimer 0, SCReloadTimerID
                SCReloadTimerID = 0
            End If
        Else
            'ReconnectTimerID = SetTimer(0, 0, BotVars.ReconnectDelay, _
            '    AddressOf Reconnect_TimerProc)
            '
            'ExReconnectTimerID = SetTimer(0, ExReconnectTimerID, _
            '    BotVars.ReconnectDelay, AddressOf ExtendedReconnect_TimerProc)
        End If
        
        DisableListviewTabs
        
        BotVars.ProxyStatus = psNotConnected
        
        Clan.isUsed = False
        lvClanList.ListItems.Clear
        
        BNLSBuffer.ClearBuffer
        BNCSBuffer.ClearBuffer
        MCPBuffer.ClearBuffer
        
        g_Connected = False
        g_Online = False
        ds.EnteredChatFirstTime = False
        ds.ClientToken = 0
        
        Call ClearChannel
        lvClanList.ListItems.Clear
        lvFriendList.ListItems.Clear
        
        'tmrSilentChannel(0).Enabled = False
        
        Call g_Queue.Clear
    
        BNLSAuthorized = False
        uTicks = 0
        
        mnuSepZ.Visible = False
        mnuIgnoreInvites.Visible = False
        mnuRealmSwitch.Visible = False
        
        BotVars.LastChannel = vbNullString
        PrepareHomeChannelMenu
        PrepareQuickChannelMenu
        
        Set BotVars.PublicChannels = Nothing
        PreparePublicChannelMenu
        
        If ((Me.WindowState = vbNormal) And _
            (DoNotShow = 0)) Then
            
            'This SetFocus() call causes an error if any script have InputBoxes open.
            'This is the best fix I could come up with. :( -Pyro
            On Error Resume Next
            Call cboSend.SetFocus
            On Error GoTo ERROR_HANDLER
        End If
        
        ' clean up realms
        If Not ds.MCPHandler Is Nothing Then
            If ds.MCPHandler.FormActive Then
                frmRealm.UnloadAfterBNCSClose
            End If
            
            Set ds.MCPHandler = Nothing
        End If
        
        ' clean up email reg
        Unload frmEMailReg
        
        ' close any pending INet
        INet.Tag = SB_INET_UNSET
        INet.Cancel
        
        ' reset BNLS finder
        BNLSFinderGotList = False
        BNLSFinderIndex = 0
        
        PassedClanMotdCheck = False
        
        On Error Resume Next
        RunInAll "Event_LoggedOff"
    End If
    
    Exit Sub
    
ERROR_HANDLER:
    AddChat RTBColors.ErrorMessageText, "Error (#" & Err.Number & "): " & Err.Description & " in DoDisconnect()."
    
    Exit Sub
End Sub

Public Sub ParseFriendsPacket(ByVal PacketID As Long, ByVal Contents As String)
    FriendListHandler.ParsePacket PacketID, Contents
End Sub

Public Sub ParseClanPacket(ByVal PacketID As Long, ByVal Contents As String)
    ClanHandler.ParseClanPacket PacketID, Contents
End Sub

Public Sub RecordWindowPosition(Optional Maximized As Boolean = False)
    'Don't record other position information if maximized, otherwise when they unmaximize it will be fullscreen width and height. - FrOzeN
    If Not Maximized Then
        Config.PositionLeft = Int(Me.Left / Screen.TwipsPerPixelX)
        Config.PositionTop = Int(Me.Top / Screen.TwipsPerPixelY)
        Config.PositionHeight = Int(Me.Height / Screen.TwipsPerPixelY)
        Config.PositionWidth = Int(Me.Width / Screen.TwipsPerPixelX)
    End If
    
    Config.IsMaximized = Maximized
    Call Config.Save
End Sub

Public Sub MakeLoggingDirectory()
    On Error Resume Next
    MkDir GetFolderPath("Logs")
End Sub

' Called from several points to keep accurate tabs on the user's prior selection
'  in the send combo
Public Sub RecordcboSendSelInfo()
    'Debug.Print "SelStart: " & cboSend.SelStart & ", SelLength: " & cboSend.SelLength
    cboSendSelLength = cboSend.SelLength
    cboSendSelStart = cboSend.SelStart
End Sub
