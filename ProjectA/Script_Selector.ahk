#noenv
#notrayicon
#keyhistory 0
#singleinstance force
listLines off
setbatchlines -1
setkeydelay -1, -1
setwindelay -1
setcontroldelay -1
setworkingdir %A_ScriptDir%/script ;Ensures a consistent starting directory.

ReloadGui:
gui Destroy
gui Add,Text,,Pick a file to launch from the list below.`nTo cancel, press ESCAPE or close this window.
gui Add,ListBox,vMyListBox gMyListBox w640 r10
gui Add,Button,Default,OK
loop *.ahk { ;Change this wildcard pattern to suit your preferences.
  if (A_LoopFileFullPath = A_ScriptName)
    continue
  else
    guicontrol,,MyListBox,%A_LoopFileFullPath%
}

OpenGui:
gui Show
return

MyListBox:
if A_GuiEvent <> DoubleClick
  return ;Fall through to the next label.

ButtonOK:
guiControlGet MyListBox ;Retrieve the ListBox's current selection.
gui Hide
runwait %MyListBox%
goto OpenGui

GuiClose:
GuiEscape:
gui, Hide

ScrollLock::goto, ReloadGui
+ScrollLock::exitapp