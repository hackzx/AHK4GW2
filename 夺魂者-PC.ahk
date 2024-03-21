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

XButton1::
	Send 2
	; Send x,c,v
	Send x
	; Send c
	Send v
	Send q
	Send e
	Send r
	Send f
	Send b
Return


^b::ExitApp
; F2::ExitApp

^3::Pause
; F1::Pause

F1::
; XButton2:: ;前侧键
	if(a:=!a)
	{
		ToolTip,Reaper On
		SetTimer,SkillChains,0
	}
	else
	{
		ToolTip,Reaper OFF
		SetTimer,SkillChains,off
		Sleep 1000
		ToolTip
	}
return

; BD: [&DQg1KTIlIjbBEigPcAGBAPESQAGmEnUBAxOVAAAAAAAAAAAAAAAAAAAAAAACMgBZAAA=]

SkillChains:
	{

		; 每15秒一次灵魂倒钩，切换1状态
		; e会被r打断
		; SkillChains: 1 f r e 1 f r q e xcv b

		if (GetColor(1104,1012)=="0x338A4D") ;迷雾归来
			{
			Send x
			Sleep 50
			}


		if (GetColor(1164,1011)=="0xD08D78") ;弱者退散
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

		if (GetColor(1225,1009)=="0x2D7B6E") ;无尽苦痛
			{
			Send v
			Sleep 50
			}


		if (GetColor(1288,1010)=="0x958490") ;严寒刺骨
			{
			Sleep 1470
			Send b
			}


		if (GetColor(858,944)=="0x1A661B") ;夺魂之幕
			{
			Send 1
			Sleep 50
			}
		; if (GetColor(1083,960)=="0xFFFFFF") ;监控buff，退出夺魂之幕
		; 	{
		; 	Send 1
		; 	Sleep 50
		; 	}




		if (GetColor(959,989)!="0xE41B07") ;血量低于2/3 灵魂夺取
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


		if (GetColor(688,1014)=="0x3BD850") ;大剑2
			{
			Send q
			; Sleep 1470
			Sleep 50
			}
		if (GetColor(748,1013)=="0x16382D") ;大剑3
			{
			Send e
			Sleep 1220
			}
		if (GetColor(809,1012)=="0x000500") ;大剑4
			{
			Send r
			Sleep 520
			}
		if (GetColor(872,1011)=="0x6E7E6E") ;大剑5
			{
			Send f
			Sleep 770
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
		if (GetColor(689,1132)=="0x318E44") ;匕首2
			{
			Send q
			Sleep 770
			}
		if (GetColor(746,1131)=="0x000B09") ;匕首3
			{
			Send e
			Sleep 1020
			}


		if (GetColor(748,1010)=="0x0C250C") ;死幕3
			{
			Send e
			Sleep 50
			}
		if (GetColor(873,1016)=="0x094111") ;死幕5
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
			Send x
			; Send 0
			Sleep 50
			}
	}

return