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

; BD: [&DQQgLwgrHjV5AHkAuwCaALcAqwGlAawB7QDtAAMZFRkAAAAAAAAAAAAAAAACawAjAAA=]

SkillChains:
	{

		; SkillChains: 1 f r e 1 f r q e xcv b


        if (GetColor(812,1057)=="0x201F00") ;大地冲击
            {
			Send {3}
			Sleep 770
            }
		if (GetColor(756,1055)=="0x140000") ;冲锋
            {
			Send {6}
			Sleep 1020
            }
        if (GetColor(701,1056)=="0x38F2F3") ;飞踢
            {
			Send {1}
			Sleep 520
            }


        if (GetColor(1103,1135)=="0x926F4E") ;快保护我
			{
			Send x
			Sleep 50
			}

        if (GetColor(1104,1129)=="0x956924") ;锋开磨砺
			{
			Send x
			Sleep 50
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
        if (GetColor(1166,1127)=="0xFFFF2E") ;尖刺陷阱
            {
            Send c
            Sleep 400
            }
        if (GetColor(1164,1132)=="0xF7FD44") ;磐石精魄
            {
            Send c
            Sleep 250
            }

		if (GetColor(1224,1130)=="0x594B37") ;干掉他们
			{
			Send v
			Sleep 50
			}
        if (GetColor(1225,1132)=="0xCE9131") ;锋开磨砺
			{
			Send v
			Sleep 50
			}

        if (GetColor(1286,1129)=="0x382000") ;藤蔓缠绕
			{
			Send b
			Sleep 770
			}
		if (GetColor(1288,1136)=="0x420F00") ;群攻之力
			{
			Send b
            Sleep 529
			}
		if (GetColor(1287,1131)=="0x2F3300") ;独狼之力
			{
			Send b
            Sleep 250
			}


		if (GetColor(961,1100)!="0xE12005") ;血量低于2/3 治疗
			{
			Send z
			Sleep 1020
			}


		if (GetColor(685,1135)=="0xA27D0E") ;短弓2
			{
			Send q
			Sleep 270
			}
        if (GetColor(808,1131)=="0x000000") ;短弓4
			{
			Send r
			Sleep 50
			}
		if (GetColor(868,1131)=="0x474229") ;短弓5
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
		if (GetColor(690,1133)=="0xFFFF78") ;大剑2
			{
			if (GetColor(872,1130)=="0x708B19") ;大剑5
				{
				; ToolTip, qqqqqqqfffffffff
				Send q
				Sleep 770
				Send f
				Sleep 700
				Send q
				Sleep 770
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
		if (GetColor(747,1129)=="0xFFF912") ;大剑3
			{
			; ToolTip, eeeeeeeeeeee
			Send e
			Sleep 770
			; ToolTip, end eeeeeeee
			}


        if (GetColor(748,1135)=="0x7498C5") ;斧3
            {
			Send e
			Sleep 520
            }
        if (GetColor(685,1135)=="0x837D17") ;斧2
            {
			Send q
			Sleep 780
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


        if (GetColor(808,1133)=="0x22221D") ;号角4
            {
			Send r
			Sleep 1020
            }
        if (GetColor(870,1134)=="0x252C00") ;号角5
            {
			Send f
			Sleep 260
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


        if (GetColor(958,1014)=="0xF6FFFF") ;天界化身
            {
			Send 5
            Sleep 300
			Send f
            Send q
            Sleep 2250
            Send e
            Sleep 1250
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
            ; Send 4
            ; Send 1
			Sleep 50
            ; continue
			}
	}

return