;Title:    Project 1 AHK Configuration
;Description:  Hotkeys for Project 1 w/emphasis on minimized mouse pointing and increased Numpadusage.
;Author:   Drewry Pope
;Date:     1/25/17 
;Version:  2.1.0.1
;Symbols:  ^:Ctrl !:Alt +:Shift #:Win 
;2.1.0.1: zz deletes all inserts 'zz', for ZZ CC.
;2.1.0.0: Further refactoring, also added alt+# to #, 
;         num0+num#=chgqtyl#. pack hotstrings start with 0 now.
;         two renamed func: ImgPresent, ImgPresentThenImgNav. 1/18/17
;2.0.0.0: Refactored code into libraries of functions. 12/19/16
;1.0.4.1: Minor changes and cleanup, new hotstrings. 11/17
;1.0.4.0: Changed #g added scllock, new Multi-script chooser scripter, 
;         no compatibility issues since last release 11/10
#include %A_ScriptDir%\..\lib\Global.ahk
#include %A_ScriptDir%\..\lib\Subgroup.ahk

#ifwinactive
#z::
  if ImgPresent("PP")
    displaytooltip("yep")
  else displaytooltip("nope")
  exit

#ifwinactive programName
F1::DeleteAllKeywords("Test")
F2::DeleteAllKeywords("1234")
!F2::
keywait, alt
DeleteAllKeywords("words")
sleep, 250
WaitforReload()
sleep, 250
SendMap()
exit
F4::SendKey("form")
+F4::SendKey("bucket")
F6::SendKey("per ml")
+F6::SendKey("dose")
F8::SendMap("+{Tab}+{Tab}1")
F9::SendKey("orange")
F10::SendKey("blue")
F11::SendKey("purple")
F12::SendKey("red")
+F9::SendKey("teal")
+F10::SendKey("green")
+F11::SendKey("brown")
+F12::SendKey("plum")
^F9::SendKey("magenta")
^F10::SendKey("turquoise")
^F11::SendKey("mauve")
^F12::SendKey("tan")
!F10::SendKey("white")
!F9::SendKey("yellow")
^+u::SendKey("unknown")
^+b::SendKey("bucket")
^+a::SendKey("anti")
^+l::SendKey("large")
^+m::SendKey("medium")
^+s::SendKey("small")

Home::^!1 ;Bucket
End::^!2 ;Keyword
\::
  keywait \
  if ImgPresent("Submit"){
    ImgNav("Submit")
  }else if ImgPresent("Select"){
    OpenClinicOrHitEnter()
  }else if ImgPresent("Next")
    ImgNav("Next")
  else {
    if !ImgPresent("FuH")
      ImgNav("F")
  }exit
^\::
  keywait \
  keywait ctrl
  if !ImgPresentThenImgNav("M","F","Ff")
    ImgNav("Mapping","Ff")
  exit
|::
  keywait |
  keywait \
  keywait Shift
  if !ImgPresentThenImgNav("FfH","F"){
    if ImgPresent("F")
      ImgNav("F","Ff")
  }exit
NumpadEnter::
Enter::OpenClinicOrHitEnter()
~::
F7::
+Insert::
+NumLock::SendMap(,"!x",,"NoCheck")
`::
!`::
F5::
Insert::
^Insert::
!Insert::
Numlock::
^NumLock::
!Numlock::
!1::
Numpad1 & Alt::
Alt & Numpad1::SendMap()
!2::
Numpad2 & Alt::
Alt & Numpad2::SendMap("{Tab 2}")
!3::
Numpad3 & Alt::
Alt & Numpad3::SendMap("{Tab 4}")
!4::
Numpad4 & Alt::
Alt & Numpad4::SendMap("{Tab 6}")
!5::
Numpad5 & Alt::
Alt & Numpad5::SendMap("{Tab 8}")
!6::
Numpad6 & Alt::
Alt & Numpad6::SendMap("{Tab 10}")
NumpadAdd & Numpad0::
Numpad1 & Numpad0::
Numpad0 & Numpad1::SendMap("+{Tab}+{Tab}",,"") 
Numpad2 & Numpad0::
Numpad0 & Numpad2::SendMap("{Tab}",,"")        
Numpad3 & Numpad0::
Numpad0 & Numpad3::SendMap("{Tab 3}",,"")      
Numpad4 & Numpad0::
Numpad0 & Numpad4::SendMap("{Tab 5}",,"")      
Numpad5 & Numpad0::
Numpad0 & Numpad5::SendMap("{Tab 7}",,"")      
Numpad6 & Numpad0::
Numpad0 & Numpad6::SendMap("{Tab 9}",,"")      

Numpad1 & NumpadSub::
NumpadSub & Numpad1::SendKey("-1","a")
Numpad2 & NumpadSub::
NumpadSub & Numpad2::SendKey("-2","a")
Numpad3 & NumpadSub::
NumpadSub & Numpad3::SendKey("-3","a")
Numpad4 & NumpadSub::
NumpadSub & Numpad4::SendKey("-4","a")
Numpad5 & NumpadSub::
NumpadSub & Numpad5::SendKey("-5","a")
Numpad6 & NumpadSub::
NumpadSub & Numpad6::SendKey("-6","a")
Numpad7 & NumpadSub::
NumpadSub & Numpad7::SendKey("-7","a")
Numpad8 & NumpadSub::
NumpadSub & Numpad8::SendKey("-8","a")
Numpad9 & NumpadSub::
NumpadSub & Numpad9::SendKey("-9","a")
Numpad1 & NumpadAdd::
NumpadAdd & Numpad1::SendKey("1","a")
Numpad2 & NumpadAdd::
NumpadAdd & Numpad2::SendKey("2","a")
Numpad3 & NumpadAdd::
NumpadAdd & Numpad3::SendKey("3","a")
Numpad4 & NumpadAdd::
NumpadAdd & Numpad4::SendKey("4","a")
Numpad5 & NumpadAdd::
NumpadAdd & Numpad5::SendKey("5","a")
Numpad6 & NumpadAdd::
NumpadAdd & Numpad6::SendKey("6","a")
Numpad7 & NumpadAdd::
NumpadAdd & Numpad7::SendKey("7","a")
Numpad8 & NumpadAdd::
NumpadAdd & Numpad8::SendKey("8","a")
Numpad9 & NumpadAdd::
NumpadAdd & Numpad9::SendKey("9","a")

Numpad1 & NumpadDiv::
NumpadDiv & Numpad1::SendMap("+{Tab}+{Tab}-1")
Numpad2 & NumpadDiv::
NumpadDiv & Numpad2::SendMap("+{Tab}+{Tab}-2")
Numpad3 & NumpadDiv::
NumpadDiv & Numpad3::SendMap("+{Tab}+{Tab}-3")
Numpad4 & NumpadDiv::
NumpadDiv & Numpad4::SendMap("+{Tab}+{Tab}-4")
Numpad5 & NumpadDiv::
NumpadDiv & Numpad5::SendMap("+{Tab}+{Tab}-5")
Numpad6 & NumpadDiv::
NumpadDiv & Numpad6::SendMap("+{Tab}+{Tab}-6")
Numpad7 & NumpadDiv::
NumpadDiv & Numpad7::SendMap("+{Tab}+{Tab}-7")
Numpad8 & NumpadDiv::
NumpadDiv & Numpad8::SendMap("+{Tab}+{Tab}-8")
Numpad9 & NumpadDiv::
NumpadDiv & Numpad9::SendMap("+{Tab}+{Tab}-9")
Numpad1 & NumpadMult::
NumpadMult & Numpad1::SendMap("+{Tab}+{Tab}1")
Numpad2 & NumpadMult::
NumpadMult & Numpad2::SendMap("+{Tab}+{Tab}2")
Numpad3 & NumpadMult::
NumpadMult & Numpad3::SendMap("+{Tab}+{Tab}3")
Numpad4 & NumpadMult::
NumpadMult & Numpad4::SendMap("+{Tab}+{Tab}4")
Numpad5 & NumpadMult::
NumpadMult & Numpad5::SendMap("+{Tab}+{Tab}5")
Numpad6 & NumpadMult::
NumpadMult & Numpad6::SendMap("+{Tab}+{Tab}6")
Numpad7 & NumpadMult::
NumpadMult & Numpad7::SendMap("+{Tab}+{Tab}7")
Numpad8 & NumpadMult::
NumpadMult & Numpad8::SendMap("+{Tab}+{Tab}8")
Numpad9 & NumpadMult::
NumpadMult & Numpad9::SendMap("+{Tab}+{Tab}9")


::zz::
  DeleteAllKeywords("zz")
  exit
;|---------|