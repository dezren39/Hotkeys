;Title:    Project 3 AHK Configuration
;Description:  Hotkeys for annotating Project 3.
;Author:   Drewry Pope
;Date:     1/18/2017
;Version:  2.1.0.0
;Symbols:  ^:Ctrl !:Alt +:Shift #:Win 
;2.1.0.0: Added hotkey triggers on opposite side of keyboard, changed focus image. 1/18/17
;2.0.0.0: Refactored code into libraries of functions. 12/19/17
;1.0.0.1: Initial release. added multiple hotkeys to expand included key combinations in
;         Project 3 to include similar ones to those used in the mapping scripts.
;         copied script efficiency lines and multi-script choice hotkey. 11/09/16
#include %A_ScriptDir%\..\lib\Global.ahk

global vX ;virtual X axis (spans all monitors)
global vY ;virtual Y axis (spans all monitors)
sysget vX,78
sysget vY,79
#IfWinActive ; (*redacted-info*)
^w::return
^+c::
  imagesearch fX,fY,0,0,vX,vY, *15 ..\img\back.png
  mousemove fX,fY
  Displaytooltip(ErrorLevel)
  exit
Enter::send {Enter 2}
+Home::send {Home}
`::
=::
Insert::
Numlock::send +s
~::
-::
Home::
  send +q
  send ^a{Delete}
  Exit
1:: ; 85, 50
Numpad1::
Delete::send {Space} ;Row 1
2::
Numpad2::
End::ImgClickOffset(154,190, "back")
3::
Numpad3::
PgUp::ImgClickOffset(154,240, "back")
4::
Numpad4::
PgDn::ImgClickOffset(154,290, "back")
+1::
F1::
+Delete::ImgClickOffset(122,140, "back")
+2::
F2::
+End::ImgClickOffset(122,190, "back")
+3::
F3::
+PgDn::ImgClickOffset(122,240, "back")
+4::
F4::
+PgUp::ImgClickOffset(122,290, "back")
^z::ImgNav("back")
w::
\::
 keywait \
  ImgClickOffset(122, 190, "back") ;122,190, "back")
  loop 2 {
    sleep 125
    send {Right}  
  }
  sleep 125
  send {Space}
  exit
+w::
]::
  keywait Ctrl
  keywait \
  ImgClickOffset(122,190, "back")
  loop 3{
    sleep 125
    send {Right}  
  }
  exit
[::
  keywait Ctrl
  keywait \
  ImgClickOffset(122,190, "back")
  loop 3{
    sleep 125
    send {Right}  
  }
  ImgClickOffset(154,190, "back")
  exit
p::
  keywait Ctrl
  keywait \
  ImgClickOffset(122,190, "back")
  loop 3{
    sleep 125
    send {Right}  
  } sleep 125
  send {down}
  sleep 125
  send {right}
  exit
0::
  keywait Ctrl
  keywait \
  ImgClickOffset(122,190, "back")
  loop 3{
    sleep 125
    send {Right}  
  } sleep 125
  send {down}
  sleep 125
  send {right}
  sleep 125
  send {down}
  sleep 125
  send {right}
  sleep 125
  send {right}
  sleep 125
  send {down}
  sleep, 125
  send {space}
  exit
9::
  keywait Ctrl
  keywait \
  ImgClickOffset(122,190, "back")
  loop 3{
    sleep 125
    send {Right}  
  } sleep 125
  send {down}
  sleep 125
  send {right}
  sleep 125
  send {down}
  sleep 125
  send {right}
  sleep 125
  send {right}
  sleep 100
  send {space}
  exit
^\::
  if ImgPresent("otherback"){
    ImgNav("otherback")
    loop 8{
    send {Left}
    sleep 125
    }
  }exit
|::
  keywait shift
  keywait |
  ImgClickOffset(122,190, "back")
  loop 2 {
    sleep 125
    send {Right}
  }exit
+e::
}::
'::
  keywait ]
  ImgClickOffset(122,190, "back")
  loop 3{
    Sleep 125
    Send {Right}
  }sleep 250
  ImgClickOffset(154,240, "back")
  exit

![::
  keywait ]
  ImgClickOffset(122,190, "back")
  loop 3{
    Sleep 125
    Send {Right}
  }sleep 250
  ImgClickOffset(154,240, "back")
  Send {Down}{Right}
  exit
  !]::
  keywait ]
  ImgClickOffset(122,190, "back")
  loop 3{
    Sleep 125
    Send {Right}
  }sleep 250
  ImgClickOffset(154,240, "back")
  Send {Down}{Right}
  exit
!\::
  keywait \
  ImgClickOffset(122,190, "back")
  loop 2{
    sleep 125
    send {Right}
  }sleep 125
  sleep 50
  send {Right}
  sleep 290
  send {down}
  sleep, 125
  send {right}


#IfWinNotActive ; (*redacted-info*)
Escape::
;NumpadDot::RunOrActivate("*redacted-info*", "chrome.exe *redacted-info*")
#IfWinActive ; (*redacted-info*)
;|---------|
