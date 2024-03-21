GetColor(x,y)
{
	PixelGetColor, color, x, y, RGB
	StringRight color,color,10
	return color
}


^p::
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
	Send q
	Send e
	Send r
	Send f
	Send 1,6,3,4,5
	; Send x,c,v
	Send c,v
Return



^b::ExitApp
; F2::ExitApp

^3::Pause
; F1::Pause

F1::
; XButton2:: ;前侧键
	if(a:=!a)
	{
		Send 2
		ToolTip,Scourge On
		SetTimer,SkillChains,0
	}
	else
	{
		ToolTip,Scourge OFF
		SetTimer,SkillChains,off
		; Send {esc}
		Sleep 1000
		ToolTip
	}
return

; BD: [&DQg1KTIlIjbBEigPcAGBAPESQAGmEnUBAxOVAAAAAAAAAAAAAAAAAAAAAAACMgBZAAA=]

SkillChains:
	{

		if (GetColor(823,914)=="0x8F5D00") ;沙暴帷幕
			{
			Send 5
			Sleep 50
			}
		if (GetColor(622,912)=="0x523E0D") ;显形沙影
			{
			Send 1
			Sleep 50
			}
		if (GetColor(704,916)=="0xD9AD48") ;邪恶恩惠
			{
			Send 6
			Sleep 50
			}
		if (GetColor(745,912)=="0xFFFF1F") ;黄沙瀑布
			{
			Send 3
			Sleep 50
			}
		if (GetColor(785,914)=="0xFFD969") ;炫耀之柱
			{
			Send 4
			Sleep 50
			}


		if (GetColor(1104,1131)=="0x062500") ;痛苦路径
			{
			Send x
			Sleep 50
			}
		if (GetColor(1105,1011)=="0x2BE0F0") ;鬼灵铠甲
			{
			Send x
			Sleep 50
			}


		if (GetColor(1166,1011)=="0xF8FFAD") ;致命干燥
			{
			Send c
			Sleep 900
			}


		if (GetColor(1226,1009)=="0x0CA1B3") ;巨蛇虹吸
			{
			Send v
			Sleep 670
			}


		if (GetColor(1287,1010)=="0x1F4D40") ;瘟疫化身
			{
			Send b
			Sleep 1270
			}
		if (GetColor(1287,1011)=="0x94B333") ;恐怖吐息
			{
			Send b
			Sleep 1270
			}


		if (GetColor(1043,1013)=="0x10341A") ;沙尘闪耀
			{
			Send z
			Sleep 900
			}





		if (GetColor(961,1088)=="0x000000") ;血量低于2/3 回血
			{
			Send z
			; Send 6
			Sleep 50
			}



		if (GetColor(811,1014)=="0x4BFF61") ;火炬4
			{
			Send r
			Sleep 670
			}
		if (GetColor(873,1013)=="0xCFFF6F") ;火炬5
			{
			Send f
			Sleep 900
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


		if (GetColor(689,1013)=="0x3EEE2B") ;节杖2
			{
			Send q
			Sleep 900
			}
		if (GetColor(749,1010)=="0xDDFF5A") ;节杖3
			{
			Send e
			Sleep 900
			}


		else ;防罚站
			{
			; Send 2
            Send 1
            ; Send 3
            ; Send 4
            Send 5
			Sleep 50
			}
	}

return