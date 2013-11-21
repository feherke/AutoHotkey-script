; Key Compose   version 0.3   july 2013   written by Fehérke
; key compose without compose key and key combination

#SingleInstance

SplitPath, A_ScriptName, , , ext, name
conffile=%name%-conf.%ext% ; hope for more flexible #Include in the future
conffile=KeyCompose-conf.ahk
linkfile=%A_Startup%\%name%.lnk

composetype:=[]
composetype.length:=0

Loop, Read, %conffile%
{
  line:=RegExReplace(A_LoopReadLine, "S)``(.)", "$1")

  If RegExMatch(line, "OSi)\s*#If\s+.*?\bcompose\b.*?(\d+)\s+;\s*(.*)?$", match) {
    composetype[match[1]]:=match[2]
    composetype.length++
  }
}

Loop, % composetype.length
  Menu, Tray, Add, % composetype[A_Index-1] , KeyComposeLabel
Menu, Tray, Add
Menu, Tray, Add, Show compose..., ShowComposeLabel
Menu, Tray, Add, Edit compose..., EditComposeLabel
Menu, Tray, Add, Start automatically, StartAutomaticallyLabel
Menu, Tray, Add, About..., AboutLabel
Menu, Tray, Add
Menu, Tray, NoStandard
Menu, Tray, Standard

IfExist, %linkfile%
  Menu, Tray, Check, Start automatically

compose=0
Gosub, KeyComposeLabel

#HotString *?

#!^r::Reload ; Alt-Ctrl-R
#!^s::Gosub, ShowComposeLabel ; Alt-Ctrl-S
#!^a::Gosub, AboutLabel ; Alt-Ctrl-A

!^f2::Gosub, KeyComposeNextLabel ; Alt-Ctrl-F2
!^+f2::Gosub, KeyComposePrevLabel ; Alt-Ctrl-Shift-F2

Shift & Shift::Send {Click up} ; Shift-Shift

Goto, EndLabel

KeyComposeNextLabel:
KeyComposePrevLabel:
KeyComposeLabel:

  IfEqual, A_ThisLabel, KeyComposeLabel
    compose:=A_ThisMenuItemPos?A_ThisMenuItemPos-1:0
  Else
    compose:=mod(compose+(A_ThisLabel=="KeyComposePrevLabel"?composetype.length-1:1),composetype.length)

  composenow:=composetype[compose]

  Loop, % composetype.length
    Menu, Tray, Uncheck, % composetype[A_Index-1]
  Menu, Tray, Check, %composenow%

  Menu, Tray, Default, % composetype[mod(compose+1,composetype.length)]

  Menu, Tray, Icon, KeyCompose-%compose%.ico
  Menu, Tray, Tip, Key Compose set to %composenow%
  TrayTip, Key Compose, Set to %composenow%

Return

ShowComposeLabel:

  ImageListID:=IL_Create(composetype.length)
  Loop, % composetype.length
    IL_Add(ImageListID, "KeyCompose-" . (A_Index-1) . ".ico")

  Gui, New, +Resize
  Gui, Add, Text, , Currently defined key compose sequences :
  Gui, Add, ListView, W400 H300, Type|Get|Description
  LV_SetImageList(ImageListID)

  Loop, Read, %conffile%
  {
    line:=RegExReplace(A_LoopReadLine, "S)``(.)", "$1")

    If RegExMatch(line, "OSi)\s*#If\s+.*?\bcompose\b.*?(\d+)\s+;\s*(.*)?$", match)
      LV_Add("Icon" . (match[1]+1), "", "", match[2])

    If RegExMatch(line, "OS)^\s*:[^:]*:(.+?)::(.+?)(?:\s+;\s*(.*))?", match)
      LV_Add("Icon-1", match[1], match[2], match[3])
  }

  LV_ModifyCol(1, "Auto AutoHdr")

  Gui, Add, Button, Cancel gShowComposeCloseLabel, Close
  Gui, Show, AutoSize, Show key compose

Return

EditComposeLabel:

  IfWinExist, %conffile%
    WinActivate
  Else
    Run, edit %conffile%

Return

StartAutomaticallyLabel:

  IfExist, %startuplink%
    FileDelete, %startuplink%
  Else
    FileCreateShortcut, %A_ScriptFullPath%, %startuplink%, %A_ScriptDir%, , Key Compose, %A_ScriptDir%\KeyCompose-on.ico

  IfExist, %startuplink%
    Menu, Tray, Check, Start automatically
  Else
    Menu, Tray, Uncheck, Start automatically

Return

AboutLabel:

  text:=""
  Loop, Read, %A_ScriptFullPath%
  {
    If RTrim(A_LoopReadLine)=="" and text<>""
      Break

    text:=text . LTrim(A_LoopReadLine, "; ") . "`n"
  }

  MsgBox, , About key compose, %text%

Return

GuiEscape:
ShowComposeCloseLabel:

  Gui, Cancel

Return

EndLabel:

  #Include KeyCompose-conf.ahk
