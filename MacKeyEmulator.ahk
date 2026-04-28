#Requires AutoHotkey v2.0
#SingleInstance Force
A_MenuMaskKey := "vkE8"

; =========================================================
; Mac-like keyboard behavior on Windows
;
; Assumptions:
;   Command  -> Windows key physically
;   Option   -> Alt
;
; Design:
;   - Option behaves like Alt everywhere
;   - EXCEPT Option+Left/Right → word navigation (Ctrl)
;   - Option+Up/Down untouched (for editors like VS Code)
;   - Command is remapped to Ctrl globally
;   - Ctrl+Arrow rules give us Mac-style navigation
; =========================================================

SetKeyDelay -1
InstallKeybdHook

; =========================================================
; 1) OPTION + LEFT/RIGHT ONLY (word navigation)
; =========================================================

!Left::Send "^{Left}"
!Right::Send "^{Right}"
!+Left::Send "^+{Left}"
!+Right::Send "^+{Right}"

; =========================================================
; 2) COMMAND (⌘) NAVIGATION VIA CTRL
; =========================================================
; Because Command is remapped to Ctrl below,
; these define ⌘ behavior.

^Left::Send "{Home}"
^Right::Send "{End}"
^+Left::Send "+{Home}"
^+Right::Send "+{End}"

^Up::Send "^{Home}"
^Down::Send "^{End}"
^+Up::Send "^+{Home}"
^+Down::Send "^+{End}"

; Optional: also catch Win directly (harmless fallback)
#Left::Send "{Home}"
#Right::Send "{End}"
#+Left::Send "+{Home}"
#+Right::Send "+{End}"

#Up::Send "^{Home}"
#Down::Send "^{End}"
#+Up::Send "^+{Home}"
#+Down::Send "^+{End}"

; =========================================================
; 3) DELETION (MAC-LIKE)
; =========================================================

; Option + Backspace = delete previous word
!Backspace::Send "^{Backspace}"

; Option + Delete / Option + Fn + Backspace = delete next word
!Delete::Send "^{Delete}"

; Command + Backspace = delete to beginning of line
#Backspace::Send "+{Home}{Backspace}"

; Command + Delete = delete to end of line
#Delete::Send "+{End}{Delete}"

; =========================================================
; 4) COMMAND SHORTCUTS (⌘ → Ctrl)
; =========================================================

#a::Send "^a"
#c::Send "^c"
#x::Send "^x"
#v::Send "^v"
#z::Send "^z"
#+z::Send "^y"

#s::Send "^s"
#o::Send "^o"
#n::Send "^n"
#w::Send "^w"
#f::Send "^f"
#g::Send "^g"
#p::Send "^p"
#t::Send "^t"
#+t::Send "^+t"
#l::Send "^l"
#r::Send "^r"

#d::Send "^d"
#+d::Send "^+d"
#,::Send "^,"
#/::Send "^/"

; =========================================================
; 5) TAB / DOCUMENT NAVIGATION
; =========================================================

#[::Send "^{PgUp}"
#]::Send "^{PgDn}"

!#Left::Send "^{PgUp}"
!#Right::Send "^{PgDn}"

#1::Send "^1"
#2::Send "^2"
#3::Send "^3"
#4::Send "^4"
#5::Send "^5"
#6::Send "^6"
#7::Send "^7"
#8::Send "^8"
#9::Send "^9"

; =========================================================
; 6) APP SWITCHING (⌘+Tab)
; =========================================================

#Tab::Send "!{Tab}"
#+Tab::Send "!+{Tab}"

; =========================================================
; 7) LINE HELPERS
; =========================================================

#Enter::Send "{End}{Enter}"
#+Enter::Send "{Home}{Enter}{Up}"

; =========================================================
; 8) BLOCK WINDOWS BEHAVIOR
; =========================================================

#Space::Return
#q::Return
#e::Return
#m::Return
#+m::Return
#.::Return
#;::Return

; =========================================================
; 9) MISC
; =========================================================

; =========================================================
; 10) BASE REMAP (IMPORTANT)
; =========================================================

LWin::Ctrl
RWin::Ctrl

; =========================================================
; 11) SCRIPT CONTROL
; =========================================================

^!+r::Reload
^!+q::ExitApp
