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

		if (GetColor(824,1036)=="0x392400") ;沙暴帷幕
			{
			Send 5
			Sleep 50
			}
		if (GetColor(623,1031)=="0xB79017") ;显形沙影
			{
			Send 1
			Sleep 50
			}
		; if (GetColor(707,1034)=="0x4E410B") ;邪恶恩惠
		; 	{
		; 	Send 6
		; 	Sleep 50
		; 	}
		if (GetColor(744,1035)=="0xF7DA01") ;黄沙瀑布
			{
			Send 3
			Sleep 50
			}
		if (GetColor(786,1035)=="0xC39930") ;炫耀之柱
			{
			Send 4
			Sleep 50
			}



		; if (GetColor(1101,1137)=="0x1F0C00") ;影魔
		; 	{
		; 	Send x
		; 	Sleep 50
		; 	}
		if (GetColor(1104,1131)=="0x062500") ;痛苦路径
			{
			Send x
			Sleep 50
			}
		if (GetColor(1105,1131)=="0x00D9E6") ;鬼灵铠甲
			{
			Send x
			Sleep 50
			}


		; if (GetColor(1161,1136)=="0xF61812") ;骨魔
		; 	{
		; 	Send c
		; 	Sleep 50
		; 	}
		; if (GetColor(1164,1136)=="0x0C1B0C") ;鲜血力量
		; 	{
		; 	Send c
		; 	Sleep 700
		; 	}
		if (GetColor(1166,1134)=="0xFFFFF3") ;致命干燥
			{
			Send c
			Sleep 770
			}
		; if (GetColor(1163,1133)=="0x5D4D1E") ;蝗虫纹章
		; 	{
		; 	Send c
		; 	Sleep 500
		; 	}


		if (GetColor(1227,1134)=="0x061B1B") ;巨蛇虹吸
			{
			Send v
			Sleep 520
			}


		if (GetColor(1289,1132)=="0x000000") ;瘟疫化身
			{
			Send b
			Sleep 1020
			}





		if (GetColor(961,1088)=="0x000000") ;血量低于2/3 回血
			{
			Send z
			; Send 6
			Sleep 50
			}



		if (GetColor(810,1135)=="0x5CFF6E") ;火炬4
			{
			Send r
			Sleep 520
			}
		if (GetColor(873,1136)=="0xFFFFA3") ;火炬5
			{
			Send f
			Sleep 770
			}


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


		if (GetColor(687,1130)=="0x3A9049") ;节杖2
			{
			Send q
			Sleep 770
			}
		if (GetColor(750,1132)=="0xB6FB4C") ;节杖3
			{
			Send e
			Sleep 770
			}


		else ;防罚站
			{
			Send 2
            Send 1
            Send 3
            Send 4
            Send 5
			Sleep 50
			}
	}

return