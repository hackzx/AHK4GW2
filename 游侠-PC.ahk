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
	Send q
	Send e
	Send r
	Send f
	; Send 1,6,3,4,5
	; Send x,c,v
	Send x,v
Return


^b::ExitApp
; F2::ExitApp

^3::Pause
; F1::Pause

; ^2::
F1::
; XButton2:: ;前侧键
	if(a:=!a)
	{
		ToolTip,Ranger On
		SetTimer,SkillChains,0
	}
	else
	{
		ToolTip,Ranger OFF
		SetTimer,SkillChains,off
		Sleep 1000
		ToolTip
	}
return

; BD: [&DQQgLwgrHjV5AHkAuwCaALcAqwGlAawB7QDtAAMZFRkAAAAAAAAAAAAAAAACawAjAAA=]

SkillChains:
	{

		; SkillChains: 1 f r e 1 f r q e xcv b


        if (GetColor(1105,1015)=="0x91724C") ;快保护我
			{
			Send x
			Sleep 50
			}
        if (GetColor(1104,1129)=="0x956924") ;锋开磨砺
			{
			Send x
			Sleep 50
			}
        if (GetColor(1105,1014)=="0xFFFF2F") ;尖刺陷阱
			{
			Send x
			Sleep 600
			}

		if (GetColor(1165,1136)=="0x5B453B") ;给我守住
			{
			Send c
			Sleep 50
			}
		if (GetColor(1165,1133)=="0x0B1300") ;秃鹫姿态
			{
			Send c
			Sleep 50
			}
        if (GetColor(1165,1133)=="0xF4CC46") ;陆行鸟姿态
            {
            Send c
            Sleep 50
            }
        if (GetColor(1165,1011)=="0xFFFF2B") ;尖刺陷阱
            {
            Send c
            Sleep 400
            }
        if (GetColor(1164,1015)=="0xFFFF4C") ;磐石精魄
            {
            Send c
            Sleep 350
            }

		if (GetColor(1226,1012)=="0x2B1F1F") ;干掉他们
			{
			Send v
			Sleep 50
			}
        if (GetColor(1228,1015)=="0x999183") ;锋开磨砺
			{
			Send v
			Sleep 50
			}

        if (GetColor(1287,1014)=="0x432A03") ;藤蔓缠绕
			{
			Send b
			Sleep 770
			}
		if (GetColor(1288,1136)=="0x420F00") ;群攻之力
			{
			Send b
            Sleep 529
			}
		if (GetColor(1287,1016)=="0x323800") ;独狼之力
			{
			Send b
            Sleep 250
			}



        if (GetColor(811,937)=="0x88861A") ;大地冲击
            {
			Send {3}
			Sleep 770
            }
		if (GetColor(757,935)=="0x34EDEE") ;冲锋
            {
			Send {6}
			Sleep 1020
            }
        if (GetColor(701,934)=="0x34FFFF") ;飞踢
            {
			Send {1}
			Sleep 520
            }



		; if (GetColor(959,983)!="0xED1F07") ;血量低于2/3 治疗
		; 	{
		; 	Send z
		; 	Sleep 1020
		; 	}



		if (GetColor(687,1015)=="0x8C6600") ;短弓2
			{
			Send q
			Sleep 350
			}
        if (GetColor(809,1010)=="0xFFFFFF") ;短弓4
			{
			Send r
			Sleep 50
			}
		if (GetColor(872,1015)=="0x2B2A15") ;短弓5
			{
			Send f
			Sleep 270
			}


		; if (GetColor(872,1136)=="0x867408") ;长弓5
		; 	{
		; 	Send f
		; 	Sleep 2482
		; 	}
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


		; if (GetColor(689,1135)=="0xFFFF46") ;大剑2
		; 	{
		; 	Send q
		; 	Sleep 770
		; 	}
		; if (GetColor(749,1132)=="0x000000") ;大剑3
		; 	{
		; 	Send e
		; 	Sleep 770
		; 	}
		; if (GetColor(872,1130)=="0x708B19") ;大剑5
		; 	{
		; 	Send f
		; 	Sleep 520
		; 	}\
		if (GetColor(688,1012)=="0xFFFFA8") ;大剑2
			{
			if (GetColor(872,1013)=="0x0E1001") ;大剑5
				{
				; ToolTip, qqqqqqqfffffffff
				Send q
				Sleep 1000
				Send f
				Sleep 1000
				Send q
				Sleep 1000
				; ToolTip, end qf
				}
			else
				{
				; ToolTip, qqqqqqq
				Send q
				Sleep 770
				; ToolTip, end q
				}
			}
		if (GetColor(749,1015)=="0x151507") ;大剑3
			{
			; ToolTip, eeeeeeeeeeee
			Send e
			Sleep 770
			; ToolTip, end eeeeeeee
			}


        if (GetColor(689,1011)=="0x7B6F12") ;斧2
            {
			Send q
			Sleep 850
            }
        if (GetColor(750,1014)=="0x162B45") ;斧3
            {
			Send e
			Sleep 600
            }


        if (GetColor(687,1133)=="0x1A2216") ;匕首2
            {
			Send q
			Sleep 770
            }
        if (GetColor(749,1134)=="0x74AA1F") ;匕首3
            {
			Send e
			Sleep 770
            }


        if (GetColor(810,1012)=="0x56450E") ;号角4
            {
			Send r
			Sleep 1160
            }
        if (GetColor(873,1011)=="0x363401") ;号角5
            {
			Send f
			Sleep 750
			Send z
			Sleep 1050
            }


        if (GetColor(811,1010)=="0x141105") ;火炬4
            {
			Send r
			Sleep 600
            }
        if (GetColor(873,1013)=="0x4B3A0A") ;火炬5
            {
			Send f
			Sleep 600
            }


        ; if (GetColor(755,1054)=="0x8F8A51") ;F2 河流龙蜥
        ;     {
		; 	Send {6}
		; 	Sleep 480
        ;     }
		; if (GetColor(698,1058)=="0x8F6849") ;F1 河流龙蜥
        ;     {
		; 	Send {1}
		; 	Sleep 480
        ;     }
        ; if (GetColor(809,1057)=="0xEDED43") ;F3 河流龙蜥
        ;     {
		; 	Send {3}
		; 	Sleep 725
        ;     }


        if (GetColor(958,891)=="0xD4FFFF") ;天界化身
            {
			Send 5
            Sleep 300
			Send f
            Send q
            Sleep 2250
            Send e
            Sleep 1250
			Sleep 200
            Send 5
            }

        ; if (GetColor(871,1129)=="0xFFFFD0") ;天界化身 5
        ;     {
		; 	Send f
		; 	Sleep 725
        ;     }
        ; if (GetColor(685,1129)=="0x68E3FF") ;天界化身 2
        ;     {
		; 	Send q
		; 	Sleep 50
        ;     }
        ; if (GetColor(750,1131)=="0xFFFFFF") ;天界化身 3
        ;     {
		; 	Send e
		; 	Sleep 750
        ;     }


		else ;防罚站
			{
			Send 2
            ; Send 0
            ; Send  4
            ; Send 1
			Sleep 50
            ; continue
			}
	}

return