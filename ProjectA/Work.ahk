#noenv
#hotstring z * k-1 c1 o ?
#singleinstance force
;#installkeybdhook
;#installmousehook
;#keyhistory 0
;listlines off
sendmode input
setbatchlines -1
setcontroldelay -1
setdefaultmousespeed 0
setkeydelay -1
setmousedelay -1
setwindelay -1
setcapslockstate alwaysoff
setnumlockstate AlwaysOn
settitlematchmode 2 ;Match title when string is contained anywhere inside.
global vX ;virtual X axis (spans all monitors)
global vY ;virtual Y axis (spans all monitors)
sysget vX,78 
sysget vY,79
#n::RunOrActivate("Sublime","C:\Program Files\Sublime Text 3\sublime_text.exe")
#e::RunOrActivate("emacs","C:\Users\dpope\Documents\bCal\emacs\bin\runemacs.exe")
^SPACE::  Winset, /* sdfsfsdf */ Alwaysontop, , A
^#g::suspend, toggle
#g:: reload, toggle
!a::Send {Volume_Down 3}
!s::Send {Volume_Up 3}
!d::Send {Volume_Mute}
#ifwinactive *redacted(
capslock::
sendlevel 1
sendevent \
return
+capslock::
sendlevel 1
sendevent |
return
^capslock::
sendlevel 1
sendevent ^\
return
^+capslock::
sendlevel 1
sendevent ^|
return
!capslock::
sendlevel 1
sendevent !\
return


RunHotStringTool() {
  autotrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard = ;()
  send ^c
  clipwait 1
  if ErrorLevel
    return
  stringreplace Hotstring,Clipboard,``,````,All
  stringreplace Hotstring,Hotstring,`r`n,``r,All
  stringreplace Hotstring,Hotstring,`n,``r,All
  stringreplace Hotstring,Hotstring,%A_Tab%,``t,All
  stringreplace Hotstring,Hotstring,`;,```;,All
  Clipboard = %ClipboardOld%
  settimer MoveCaret,10
  inputbox Hotstring,New Hotstring,Type your abreviation at the indicated insertion point. You can also edit the replacement text if you wish.`n`nExample entry: :R:btw`::by the way,,,,,,,, ::`::%Hotstring%{Enter}
  if ErrorLevel
    return
  ifinstring Hotstring,:R`:::
  {
    msgbox Invalid abbreviation. The hotstring has been removed. Please evaluate.
    return
  }
  fileappend `n%Hotstring%,%A_ScriptFullPath%
  exitapp
  sleep 200
  msgbox 4,,The hotstring just added appears to be improperly formatted.  Would you like to open the script for editing? Note that the bad hotstring is at the bottom of the script.
  ifmsgbox Yes,edit
    return
  return
  MoveCaret:
    ifwinnotactive New Hotstring
      return
    send {Home}{Right 2}
    settimer MoveCaret,Off
    return
}
RunOrActivate(windowName,programPath:="") {
  ifwinexist %windowName%
    winactivate
  else{ 
    if (programPath == "")
      programPath:=windowName
    run %programPath%
  }
}

/*

;|---------|

#g::
ScrollLock::exitapp
PrintScreen::run SnippingTool.exe
#c::RunOrActivate("Calculator","Calc")
#f::RunOrActivate("C:\Users\dpope\OneDrive)

#o::RunOrActivate("Outlook")
#s::RunOrActivate("Skype","Lync")
#h::RunHotstringTool()
#z::
  if ImgPresent("LP")
    displaytooltip("yep")
  else displaytooltip("nope")
  exit

;|---------|

DisplayToolTip(toolTipDescription,toolTipTimer:=500) {
  tooltip %toolTipDescription%
  settimer RemoveToolTip,%toolTipTimer%
  return
  RemoveToolTip:
    settimer RemoveToolTip,Off
    tooltip
    exit
}
ImgClickOffset(tX:=0,tY:=0,img*) {
  mousegetpos oX,oY
  for imgNum,imgName in img {
    if ImgPresent(imgName){
      imagesearch fX,fY,0,0,vX,vY, ..\img\%imgName%.png
      fX:=fX+tX
      fY:=fY+tY
      click, %fX%,%fY%
      ;Mousemove, %fX%,%fY%
     mousemove oX,oY
    }
  }
}
ImgMov(imgName) {
  imagesearch fX,fY,0,0,vX,vY, ..\img\%imgName%.png
  mousemove fX,fY
}
ImgNav(img*) {
  mousegetpos oX,oY
  for imgNum,imgName in img {
    imagesearch fX,fY,0,0,vX,vY, ..\img\%imgName%.png
    mousemove fX,fY ;if (ErrorLevel != 0) ;errorStatus = (%imgName% not found.)`n%errorStatus%
    if (imgNum = img.MaxIndex()){
      if (ErrorLevel = 0)
        click
      mousemove oX,oY
      return !ErrorLevel
    }sleep, 50
  }
}
ImgPresent(conditionImage) {
  imagesearch fX,fY,0,0,vX,vY, ..\img\%conditionImage%.png
  return !ErrorLevel
}
ImgPresentThenImgNav(conditionImage,img*) {
  if ImgPresent(conditionImage)
    return ImgNav(img*)
}

*/
