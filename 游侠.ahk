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
F1::Pause

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

; BD: [&DQQgLwgrHjV5AHkAuwCaALcAqwGlAawB7QDtAAMZFRkAAAAAAAAAAAAAAAACawAjAAA=]

SkillChains:
	{

		; SkillChains: 1 f r e 1 f r q e xcv b

		if (GetColor(1165,1136)=="0x5B453B") ;给我守住
			{
			Send c
			Sleep 50
			}
		if (GetColor(1225,1136)=="0x150E0E") ;干掉他们
			{
			Send v
			Sleep 50
			}

		if (GetColor(961,1100)!="0xE12005") ;血量低于2/3 治疗
			{
			Send z
			Sleep 178
			}

		if (GetColor(868,1131)=="0x474229") ;短弓5
			{
			Send f
			Sleep 482
			}
		if (GetColor(808,1131)=="0x000000") ;短弓4
			{
			Send r
			Sleep 499
			}
		if (GetColor(685,1135)=="0xA27D0E") ;短弓2
			{
			Send q
			Sleep 159
			}

		if (GetColor(872,1136)=="0x867408") ;长弓5
			{
			Send f
			Sleep 2482
			}
		if (GetColor(809,1133)=="0xFFFF10") ;长弓4
			{
			Send r
			Sleep 499
			}
		if (GetColor(685,1136)=="0xE1E512") ;长弓2
			{
			Send q
			Sleep 2489
			}

		if (GetColor(1103,1135)=="0x926F4E") ;快保护我
			{
			Send x
			Sleep 50
			}
		if (GetColor(1288,1136)=="0x420F00") ;群攻之力
			{
			Sleep 529
			Send b
			}

		else ;防罚站
			{
			Send 2
            Send 0
            Send 4
			Sleep 200
            ; continue
			}
	}

return