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


^b::ExitApp
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

; BD: [&DQg1KTIlIjbBEigPcAGBAPESQAGmEnUBAxOVAAAAAAAAAAAAAAAAAAAAAAACMgBZAAA=]

SkillChains:
	{

		; 每15秒一次灵魂倒钩，切换1状态
		; e会被r打断
		; SkillChains: 1 f r e 1 f r q e xcv b

		if (GetColor(1101,1127)=="0x08251C") ;迷雾归来
			{
			Send x
			Sleep 50
			}
		; if (GetColor(1101,1137)=="0x1F0C00") ;影魔
		; 	{
		; 	Send x
		; 	Sleep 50
		; 	}


		if (GetColor(1164,1139)=="0x1C1B0F") ;弱者退散
			{
			Send c
			Sleep 50
			}
		; if (GetColor(1161,1136)=="0xF61812") ;骨魔
		; 	{
		; 	Send c
		; 	Sleep 50
		; 	}
		; if (GetColor(1165,1129)=="0x43914F") ;迷雾归来
		; 	{
		; 	Send c
		; 	Sleep 50
		; 	}
		; if (GetColor(1164,1136)=="0x0C1B0C") ;鲜血力量
		; 	{
		; 	Send c
		; 	Sleep 700
		; 	}
		; if (GetColor(1163,1133)=="0x5D4D1E") ;蝗虫纹章
		; 	{
		; 	Send c
		; 	Sleep 500
		; 	}

		if (GetColor(1226,1136)=="0x62E999") ;无尽苦痛
			{
			Send v
			Sleep 50
			}


		if (GetColor(1288,1138)=="0x5D565A") ;严寒刺骨
			{
			Sleep 1270
			Send b
			}


		if (GetColor(862,1069)=="0x28791D") ;夺魂之幕
			{
			Send 1
			Sleep 50
			}


		if (GetColor(961,1100)!="0xE12005") ;血量低于2/3 灵魂夺取
			{
			Send z
			Sleep 770
			}


		; if (GetColor(871,1133)=="0x001E00") ;大剑5
		; 	{
		; 	Send f
		; 	Sleep 482
		; 	}
		; if (GetColor(808,1133)=="0xA5FF83") ;大剑4
		; 	{
		; 	Send r
		; 	Sleep 499
		; 	}
		; if (GetColor(686,1138)=="0x2A7462") ;大剑2
		; 	{
		; 	Send q
		; 	Sleep 159
		; 	}
		; if (GetColor(752,1135)=="0x070D00") ;大剑3
		; 	{
		; 	Send e
		; 	Sleep 128
		; 	}
		if (GetColor(871,1133)=="0x001E00") ;大剑5
			{
			Send f
			Sleep 770
			}
		if (GetColor(808,1133)=="0xA5FF83") ;大剑4
			{
			Send r
			Sleep 520
			}
		if (GetColor(686,1138)=="0x2A7462") ;大剑2
			{
			Send q
			Sleep 1270
			}
		if (GetColor(752,1135)=="0x070D00") ;大剑3
			{
			Send e
			Sleep 1020
			}


		; if (GetColor(872,1135)=="0x000000") ;聚能器5
		; 	{
		; 	Send f
		; 	Sleep 1020
		; 	}
		; if (GetColor(809,1134)=="0x000000") ;聚能器4
		; 	{
		; 	Send r
		; 	Sleep 520
		; 	}


		; if (GetColor(810,1135)=="0x5CFF6E") ;火炬4
		; 	{
		; 	Send r
		; 	Sleep 482
		; 	}
		; if (GetColor(873,1136)=="0xFFFFA3") ;火炬5
		; 	{
		; 	Send f
		; 	Sleep 499
		; 	}


		; if (GetColor(689,1132)=="0x318E44") ;匕首2
		; 	{
		; 	Send q
		; 	Sleep 159
		; 	}
		; if (GetColor(746,1131)=="0x000B09") ;匕首3
		; 	{
		; 	Send e
		; 	Sleep 128
		; 	}
		; if (GetColor(689,1132)=="0x318E44") ;匕首2
		; 	{
		; 	Send q
		; 	Sleep 770
		; 	}
		; if (GetColor(746,1131)=="0x000B09") ;匕首3
		; 	{
		; 	Send e
		; 	Sleep 1020
		; 	}


		if (GetColor(745,1135)=="0x111A1E") ;死幕3
			{
			Send e
			Sleep 50
			}
		if (GetColor(872,1141)=="0x267636") ;死幕5
			{
			Send f
			Sleep 50
			}
		; if (GetColor(811,1138)=="0x000000") ;死幕4
		; 	{
		; 	Send r
		; 	Sleep 2750
		; 	}

		else ;防罚站
			{
			Send 2
			; Send 0
			Sleep 50
			}
	}

return