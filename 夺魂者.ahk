GetColor(x,y)
{
	PixelGetColor, color, x, y, RGB
	StringRight color,color,10
	return color
}


^e::
; F1::
; XButton2:: ;前侧键
; XButton1:: ;后侧键
	MouseGetPos, mouseX, mouseY
	PixelGetColor, color, %mouseX%, %mouseY%, RGB
	Clipboard = (%mouseX%,%mouseY%)=="%color%"
	ToolTip, `(%mouseX%`, %mouseY%`)== %color%
	Sleep 1000
	ToolTip
	; ExitApp
return


^x::ExitApp
; F2::ExitApp

^3::Pause

^2::
; XButton2:: ;前侧键
	if(a:=!a)
	{
		SetTimer,SkillChains,0
	}
	else
	{
		SetTimer,SkillChains,off
	}
return

; BD: [&DQg1KTIlIjbBEigPcAGBAPESQAGmEnUBAxOVAAAAAAAAAAAAAAAAAAAAAAACMgBZAAA=]

SkillChains:
	{
		; MouseGetPos, mouseX, mouseY
		; PixelGetColor, color, %mouseX%, %mouseY%, RGB
		; Clipboard = (%mouseX%,%mouseY%)=="%color%"
		; ToolTip, `(%mouseX%`, %mouseY%`)== %color%
		; Sleep 1000
		; ToolTip

		; 每15秒一次灵魂倒钩，切换1状态
		; e会被r打断
		; SkillChains: 1 f r e 1 f r q e xcv b

		if (GetColor(1164,1139)=="0x1C1B0F") ;c
			Send c
			Sleep 50
		if (GetColor(1226,1136)=="0x62E999") ;v
			Send v
			Sleep 50

		if (GetColor(862,1069)=="0x28791D") ;1
			Send 1
			Sleep 50

		if (GetColor(961,1100)!="0xE12005") ;血量低于2/3
			Send z
			Sleep 178

		if (GetColor(871,1133)=="0x001E00") ;f
			Send f
			Sleep 482
		if (GetColor(808,1133)=="0xA5FF83") ;r
			Send r
			Sleep 499
		if (GetColor(686,1138)=="0x2A7462") ;q
			Send q
			Sleep 159
		if (GetColor(752,1135)=="0x070D00") ;e
			Send e
			Sleep 128

		if (GetColor(1101,1137)=="0x1F0C00") ;x
			Send x
			Sleep 50
		if (GetColor(1288,1138)=="0x5D565A") ;b
			Sleep 529
			Send b

		if (GetColor(745,1135)=="0x111A1E") ; 1-e
			Send e
			Sleep 50
		if (GetColor(872,1141)=="0x267636") ;1-f
			Send f
			Sleep 232
		if (GetColor(811,1138)=="0x000000") ;1-r
			Send r
			Sleep 550
	}

return