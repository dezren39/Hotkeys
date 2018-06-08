;Title:       Project 2 AHK Configuration
;Description: Hotkeys for mapping Project 2.
;Author:      Drewry Pope
;Date:        1/18/17
;Version:     2.1.0.0
;Symbols: ^:Ctrl !:Alt +:Shift #:Win
;2.1.0.0: Updated two renamed functions to reflect new names.
;         ImgPresent, ImgPresentThenImgNav. Added Num0+Num#, #alt+# to
;         allow for quickly mapping #. 1/18/17
;2.0.0.0: Refactored code into libraries of functions. 12/19/16
;1.1.2.1: Minor changes and cleanup, new hotstrings. 11/17
;1.1.2.0: Changed #g added scrollock, new multi-script chooser scripter, 
;         no compatibility issues since last release. 11/10
#include %A_ScriptDir%\..\lib\Global.ahk
#include %A_ScriptDir%\..\lib\Subgroup.ahk
#ifwinactive ; (*redacted-url*)
Pause::send ^!u ;Toggle Unable To Map
F1::SendKey("Bucket")
F2::DeleteAllKeywords("Bucket")
F3::DeleteAllKeywords("Unknown")
F4::SendKey("unsp")

F9::ToggleRadio("s")
F10::ToggleRadio("a")
F11::ToggleRadio("p")
F12::ToggleRadio("r",100)
^F11::send {F11}
^+U::SendKey("unknown")
^+L::SendKey("large")
^+M::SendKey("medium")
^+S::SendKey("small")
Home::^!2 
^Home::^!1 
End::^!3 
\::
  keywait \
  if ImgPresent("Submit") {
    ImgNav("Submit")
  } else if ImgPresent("Select") {
    OpenClinicOrHitEnter()
    WaitforReload()
    WaitforReload()
    ImgNav("F","Ff")
  } else if ImgPresent("Next"){
    ImgNav("Next")
  } else if !ImgPresent("FuH") {
      ImgNav("F")
  }exit
^\::
  keywait \
  keywait Ctrl
  if !ImgPresentThenImgNav("MuH","F","Ff"){
    ImgNav("M","Mu")
    WaitforReload()
    LpHitEnter()
  }exit
|::
  keywait |
  keywait \
  keywait Shift
  if !ImgPresentThenImgNav("FfH","F")
    ImgNav("F","Ff")
  exit
NumpadEnter::OpenClinicOrHitEnter()
Enter::
  if (ImgPresent("Select")){
    OpenClinicOrHitEnter()
    WaitforReload()
    WaitforReload()
    ImgNav("F","Ff")
  }
  if (!ImgPresent("MuH")) {
    send {Enter}
  }
  else {
    if (!ImgPresent("K")&&!ImgPresent("Kl")) {
      Send {Enter}
    }
  }
  exit
+Enter::
if (ImgPresent("Select")){
  OpenClinicOrHitEnter()
  WaitforReload()
  WaitforReload()
  ImgNav("F","Ff")
} else send {enter}
~LButton::
  Keywait, LButton
  if ImgPresent("MuH") {
    WaitforReload()
    WaitforReload()
    LpHitEnter()
  }exit 
^RButton::Click R
^~::
^+Insert::
^+NumLock::SendMap(,"!x",,"NoCheck") ;Exclude
~::
+Insert::
+NumLock::
  SendMap(,"!x",,"NoCheck")
  WaitforReload()
  LpHitEnter()
  exit
^`::
^Numlock::
^Insert::SendMap()
`::
Insert::
Alt & Numpad1::
Numpad0 & Numpad1::
Numlock::
keywait, numpad1
  SendMap()   
  sleep, 50
  WaitforReload()
  LpHitEnter()
  exit
Alt & Numpad2::
Numpad0 & Numpad2::
keywait, numpad2
  SendMap("{Tab}")  
  sleep, 50
  WaitforReload()
  LpHitEnter()
  exit
Alt & Numpad3::
Numpad0 & Numpad3::
keywait, numpad3
  SendMap("{Tab 2}") 
  sleep, 50
  WaitforReload()
  LpHitEnter()
  exit
Alt & Numpad4::
Numpad0 & Numpad4::
  SendMap("{Tab 3}") 
  sleep, 50
  WaitforReload()
  LpHitEnter()
  exit
Alt & Numpad5::
Numpad0 & Numpad5::
  SendMap("{Tab 4}")
  sleep, 50
  WaitforReload()
  LpHitEnter()
  exit
Alt & Numpad6::
Numpad0 & Numpad6::
  SendMap("{Tab 5}") 
  sleep, 50
  WaitforReload()
  LpHitEnter()
  exit
;|---------|
