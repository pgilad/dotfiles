; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; See http://duartes.org/gustavo/blog/home-row-computing for more information on this script
; See the AutoHotKey docs at http://www.autohotkey.com/docs/  for AutoHotKey documentation
; Most of the syntax is described at http://www.autohotkey.com/docs/Hotkeys.htm


; AppsKey + jkl;

Appskey & j::Send {Blind}{Up DownTemp}
AppsKey & j up::Send {Blind}{Up Up}

AppsKey & k::Send {Blind}{Down DownTemp}
AppsKey & k up::Send {Blind}{Down Up}

AppsKey & l::Send {Blind}{Left DownTemp}
AppsKey & l up::Send {Blind}{Left Up}

AppsKey & `;::Send {Blind}{Right DownTemp}
AppsKey & `; up::Send {Blind}{Right Up}


; AppsKey + uiop

AppsKey & u::SendInput {Blind}{PgUp Down}
AppsKey & u up::SendInput {Blind}{PgUp Up}

AppsKey & i::SendInput {Blind}{PgDn Down}
AppsKey & i up::SendInput {Blind}{PgDn Up}

AppsKey & o::SendInput {Blind}{Home Down}
AppsKey & o up::SendInput {Blind}{Home Up}

AppsKey & p::SendInput {Blind}{End Down}
AppsKey & p up::SendInput {Blind}{End Up}


; AppsKey + asdf

AppsKey & a::SendInput {Ctrl Down}{a Down}
AppsKey & a up::SendInput {Ctrl Up}{a Up}

AppsKey & s::SendInput {Ctrl Down}{x Down}
AppsKey & s up::SendInput {Ctrl Up}{x Up}

AppsKey & d::SendInput {Ctrl Down}{c Down}
AppsKey & d up::SendInput {Ctrl Up}{c Up}

AppsKey & f::SendInput {Ctrl Down}{v Down}
AppsKey & f up::SendInput {Ctrl Up}{v Up}
			
AppsKey::SendInput {AppsKey Down}
AppsKey up::SendInput {AppsKey Up}


; AppsKey + dbwer

AppsKey & h::SendInput {Blind}{Del Down}
AppsKey & w::SendInput {Ctrl down}{F4}{Ctrl up}
AppsKey & e::SendInput {Alt down}{F4}{Alt up}

AppsKey & n::SendInput {Blind}{BS Down}
AppsKey & BS::SendInput {Blind}{BS Down}
AppsKey & r::SendInput {Blind}{Esc Down}

; Make AppsKey & Enter equivalent to Control+Enter
AppsKey & Enter::SendInput {Ctrl down}{Enter}{Ctrl up}

; Make AppsKey & Alt Equivalent to Control+Alt
!AppsKey::SendInput {Ctrl down}{Alt Down}
!AppsKey up::SendInput {Ctrl up}{Alt up}

; Make Windows Key + Apps Key work like Caps Lock
#AppsKey::Capslock