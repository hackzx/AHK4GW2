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
XButton1::Pause

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

		if (GetColor(1164,1139)=="0x1C1B0F") ;c 弱者退散
			{
			Send c
			Sleep 50
			}
		if (GetColor(1161,1136)=="0xF61812") ;c 骨魔
			{
			Send c
			Sleep 50
			}
		if (GetColor(1226,1136)=="0x62E999") ;v 无尽苦痛
			{
			Send v
			Sleep 50
			}
		if (GetColor(1228,1135)=="0x002500") ; 迷雾归来
			{
			Send c
			Sleep 50
			}

		if (GetColor(862,1069)=="0x28791D") ;1 夺魂之幕
			{
			Send 1
			Sleep 50
			}

		if (GetColor(961,1100)!="0xE12005") ;血量低于2/3 灵魂夺取
			{
			Send z
			Sleep 178
			}

		if (GetColor(871,1133)=="0x001E00") ;f 大剑5
			{
			Send f
			Sleep 482
			}
		if (GetColor(808,1133)=="0xA5FF83") ;r 大剑4
			{
			Send r
			Sleep 499
			}
		if (GetColor(686,1138)=="0x2A7462") ;q 大剑2
			{
			Send q
			Sleep 159
			}
		if (GetColor(752,1135)=="0x070D00") ;e 大剑3
			{
			Send e
			Sleep 128
			}

		if (GetColor(1101,1137)=="0x1F0C00") ;x 影魔
			{
			Send x
			Sleep 50
			}
		if (GetColor(1102,1137)=="0x695017") ;蝗虫纹章
			{
			Send x
			Sleep 50
			}
		if (GetColor(1288,1138)=="0x5D565A") ;b 严寒刺骨
			{
			Sleep 529
			Send b
			}

		if (GetColor(745,1135)=="0x111A1E") ; 1-e
			{
			Send e
			Sleep 50
			}
		if (GetColor(872,1141)=="0x267636") ;1-f
			{
			Send f
			Sleep 232
			}
		if (GetColor(811,1138)=="0x000000") ;1-r
			{
			Send r
			Sleep 290
			}

		else ;防罚站
			{
			Send 2
			Sleep 200
			}
	}

return