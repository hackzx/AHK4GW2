#IfWinActive ahk_exe Gw2-64.exe
SendMode Input


GetColor(x,y)
{
	PixelGetColor, color, x, y, RGB
	StringRight color,color,10
	return color
}


^p:: ;取色
	MouseGetPos, mouseX, mouseY
	PixelGetColor, color, %mouseX%, %mouseY%, RGB
	Clipboard = (%mouseX%,%mouseY%)=="%color%"
	ToolTip, `(%mouseX%`, %mouseY%`)== %color%
	Sleep 1000
	ToolTip
return



XButton1::
; 鼠标后侧键，手动指令
	Send 2
	Send 6
	Send 3
	Send 1
	Send q
	Send e
	Send r
	; Send c
	; Send b
	if (GetColor(811,941)=="0x325A2D") ;机甲
	{
		Send 4
	}
Return


F1::
Hotkey, %A_ThisHotkey%,, T2

if (flag)
	{
	SoundPlay *16
	Reload
	Return
	}

flag := true


SoundPlay *-1
Loop {
	ToolTip,SkillChains On

	; Send 0
	Send 2
	; If (A_Index == 1){
	; 	Send 2
	; }

	Send 6
	Send 3
	Send 1

	Send q
	Send e
	Send r


	if (GetColor(811,941)=="0x325A2D") ;机甲
	{
		Send 4
	}


	if (GetColor(689,1014)=="0x342912") ;步枪2
	{
		Send q
		Sleep 700
	}
	if (GetColor(749,1015)=="0xFE8D29") ;步枪3
	{
		Send e
		Sleep 50
	}
	if (GetColor(812,1008)=="0xE4BE8F") ;步枪4
	{
		Send r
		Sleep 50
	}


	if (GetColor(690,1017)=="0xAAEA99") ;手枪2
	{
		Send q
		Sleep 1800
		Send 2
	}
	if (GetColor(750,1016)=="0xFFFCFF") ;手枪3
	{
		Send e
		Sleep 50
	}
	if (GetColor(811,1016)=="0xAFBACE") ;手枪4
	{
		Send r
		Sleep 800
	}


	if (GetColor(1166,1019)=="0x010101") ;B型试剂，进攻buff
	{
		Send c
		Sleep 600
	}
	if (GetColor(1226,1018)=="0x070907") ;U型试剂，增益buff
	{
		Send v
		Sleep 50
	}
	if (GetColor(1227,1017)=="0xC3FFFF") ;屏障文章
	{
		Send v
		Sleep 700
	}

	Sleep 500

}


; return



; F1::
; ; XButton2:: ;前侧键
; 	if(a:=!a)
; 	{
; 		SoundPlay *-1
; 		Send 2
; 		ToolTip, Scourge On
; 		SetTimer, SkillChains,0
; 	}
; 	else
; 	{
; 		SoundPlay *16
; 		ToolTip, Scourge OFF
; 		SetTimer, SkillChains,off
; 		Sleep 1000
; 		ToolTip
; 	}
; return

; SkillChains:
; 	{
; 		Send 2
; 		Send 1
; 		Send 6
; 		Send 3
; 		Send q
; 		Send e
; 		Send r
; 		; Send c
; 		; Send v
; 		Sleep 500

; 		if (GetColor(811,941)=="0x325A2D") ;机甲
; 		{
; 			Send 4
; 		}


; 		if (GetColor(690,1017)=="0xAAEA99") ;手枪2
; 		{
; 			Send q
; 			Sleep 1800
; 			Send 2
; 		}
; 		if (GetColor(750,1016)=="0xFFFCFF") ;手枪3
; 		{
; 			Send e
; 			Sleep 50
; 		}
; 		if (GetColor(811,1016)=="0xAFBACE") ;手枪4
; 		{
; 			Send r
; 			Sleep 800
; 		}

; 		if (GetColor(1166,1019)=="0x010101") ;B型试剂，进攻buff
; 		{
; 			Send c
; 			Sleep 600
; 		}
; 		if (GetColor(1226,1018)=="0x070907") ;U型试剂，增益buff
; 		{
; 			Send v
; 			Sleep 50
; 		}

; 	}

; return