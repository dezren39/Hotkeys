;Title:   AHK Subgroup Library
;Description: This script contains hotkeys and functions used in multiple
;             scripts that are related exclusively subgroup functions.
;Date:    1/18/2017
;Version: 1.1.0.0
;Symbols:  ^:Ctrl !:Alt +:Shift #:Win 
;1.1.0.0: Refactored check keywords into lp. cleaned code. 1/18/2017
;1.0.0.0: Initial Hotkeys and Functions factored out of Project 1. 12/19/2016
#ifwinactive *redact*
;|---------|
^w::return
^|::
  keywait |
  keywait \
  keywait shift
  keywait ctrl
  ImgNav("F","Ff","Fi")
  exit
$!\::
  keywait \
  keywait alt
  ImgNav("M","Mu","Mm")
  exit
]::send ]
'::send '
/::send /
+]::send {}}
+'::send " ;'
+/::send ?
] & ':: ;'
' & ]::send {wheelup 5} ;'
' & /:: ;'
/ & '::send {wheeldown 5} ;'
!WheelUp::send +{Tab} ;Tab up
!WheelDown::send {Tab} ;Tab down
^!WheelUp::send {Space}+{Tab} ;Un/Check up
^!WheelDown::send {Tab}{Space} ;Un/Check down
!+WheelUp::send +{Tab}+{Tab} ;Tab up 2-col
!+WheelDown::send {Tab}{Tab} ;Tab down 2-col
^!+WheelUp::send {Space}+{Tab}+{Tab} ;Un/Check up 2-col
^!+WheelDown::send {Tab}{Tab}{Space} ;Un/Check down 2-col
~NumpadDot::send {sc 053}
+NumpadSub::send -
+Del::SendKey("+{Tab}{Delete}")
^+Del::SendExc("{Delete}")
+Home::send +{Home}
+End::send +{End}
^End:: ;Submit. ;if ImgPresent("Gear")
  ImgNav("Gear")
  if !ImgPresent("Yes")
    WaitforReload() ;if ImgPresent("Yes")
  ImgNav("Yes")
  Click
  exit
^+End::ImgNav("Gear")
Numpad0::
  sendlevel 1
  sendevent 0
  return
Numpad1::
  sendlevel 1
  sendevent 1
  return
Numpad2::
  sendlevel 1
  sendevent 2
  return
Numpad3::
  sendlevel 1
  sendevent 3
  return
Numpad4::
  sendlevel 1
  sendevent 4
  return
Numpad5::
  sendlevel 1
  sendevent 5
  return
Numpad6::
  sendlevel 1
  sendevent 6
  return
Numpad7::
  sendlevel 1
  sendevent 7
  return
Numpad8::
  sendlevel 1
  sendevent 8
  return
Numpad9::
  sendlevel 1
  sendevent 9
  return
^Numpad1::
^1::SendKey("Single")
^Numpad2::
^2::SendKey("2 pack")
^Numpad3::
^3::SendKey("3 pack")
^Numpad4::
^4::SendKey("4 pack")
^Numpad6::
^6::SendKey("6 pack")
^NumpadEnd::
^+1::
  keywait NumpadEnd
  SendKey("{Shift up}1 count")
  exit
^NumpadPgDn::
^+3::  
  keywait NumpadPgdn
  SendKey("{Shift up}30 count")
  exit
^NumpadLeft::
^+4:: 
  keywait NumpadLeft
  SendKey("{Shift up}14 count")
  exit
^NumpadRight::
^+6::
  keywait NumpadRight
  SendKey("{Shift up}60 count")
  exit
^NumpadUp::
^+8::
  keywait NumpadUp
  SendKey("{Shift up}180 count")
  exit

#ifwinactive Calculator
NumpadDot::send {NumpadDot}
NumpadDel::RunOrActivate("*redacted-info*","Firefox")

#ifwinnotactive *redacted-info*
NumpadDel::RunOrActivate("*redacted-info*","Firefox")

;Esc::
NumpadDot::RunOrActivate("*redacted-info*","Firefox")

;|---------|
DeleteAllKeywords(inputKeyword:="") {
  send ^!e+{Tab}{Delete}+{Tab}{Delete}+{Tab}{Delete}+{Tab}{Delete}+{Tab}{Delete}+{Tab}%inputKeyword%{Enter}
}
Lp() {
  if ImgPresent("Lp")
    return 1
  else Exit
}
LpHitEnter(){
  if Lp()
    SendKey("") ;DisplayToolTip("Enter")
}
OpenClinicOrHitEnter() {
  if ImgPresent("PP"){
    loop 4{
      if imgpresent("Blue")
        Send {escape}
      Sleep, 100
      if ImgPresent("Select")
        ImgNav("Select")
      else break
      WaitforReload()
    }
  }else send {Enter}
}
SendExc(exclude) {
  SendKey(exclude,"!e^a")
}
SendKey(keyword:="",modifier:="!k",enter:="{Enter}") {
  send ^%modifier%%keyword%%enter%
}
SendMap(options:="",modifier:="!m",enter:="{Enter}",noCheck:="") {
  if !noCheck{
      if Lp()
        SendKey(options,modifier,enter)
  }else SendKey(options,modifier,enter)
}
ToggleRadio(button,time:=750) {
  send ^!%button%
  settimer EnterTime,-%time%
  exit
  EnterTime:
    if !(ImgPresent("K") && ImgPresent("Kl"))
      SendKey("")
    return
}
WaitForReload() {
  imagesearch fX,fY,0,0,vX,vY, ..\img\Globe.png
  while ErrorLevel != 0 {
    if (A_Index > 100)
      exit
    imagesearch fX,fY,0,0,vX,vY, ..\img\Globe.png
  }
}
