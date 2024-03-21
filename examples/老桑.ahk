#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#IfWinActive ahk_exe StreetFighter6.exe

k_360(){
    Send, {a down}
    Sleep, 5
    Send, {s down}
    Sleep, 5
    Send, {a up}
    Sleep, 5
    Send, {d down}
    Sleep, 5
    Send, {s up}
    Sleep, 5
    Send, {w down}
    Sleep, 5
    Send, {d up}
    Sleep, 5
    Send, {a down}
    Sleep, 5
    Send, {w up}
    Sleep, 5
    Send, {a up}
    Sleep, 5
    Send, {j down}
    Sleep, 50
    Send, {j up}
}

su_u_o_k(){
    Send, {s down}
    Sleep, 69
    Send, {u down}
    Sleep, 50
    Send, {u up}
    Sleep, 59
    Send, {s up}
    Sleep, 50
    Send, {u down}
    Sleep, 30
    Send, {u up}

    Sleep, 180
    Send, {o down}
    Sleep, 300
    Send, {o up}
    Sleep, 100
    ; Send, {i down}
    ; Sleep, 50
    ; Send, {i up}
    ; Sleep, 200
    ; Send, {i down}
    ; Sleep, 50
    ; Send, {i up}
    ; Sleep, 800

    k_360()

}

su_su_o_i_i_k(){
    Send, {s down}
    Sleep, 69
    Send, {u down}
    Sleep, 50
    Send, {u up}
    Sleep, 59
    Send, {u down}
    Sleep, 30
    Send, {u up}
    Send, {s up}
    Sleep, 50

    Sleep, 180
    Send, {o down}
    Sleep, 200
    Send, {o up}
    Sleep, 200
    Send, {i down}
    Sleep, 50
    Send, {i up}
    Sleep, 200
    Send, {i down}
    Sleep, 50
    Send, {i up}
    Sleep, 800

    k_360()

}

l::
    ; k_360()
    su_u_o_k()
    ; su_su_o_i_i_k()
Return

`;::
    k_360()
Return