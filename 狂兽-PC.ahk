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

	Send 2
	Send {f6}

	if (GetColor(1043,954)=="0xFFF456") ;觉醒伏击：如果存在「能量觉醒」buff
		{
		; Send 0
		Send 5
		Sleep 200
		Send 1
		Send 6
		Send 3
		Sleep 1000
		Send 5
		Send 2
		Sleep 3500
		Send 0
		Send 2
		}
	if (GetColor(964,910)=="0xA28F00") ;保持游侠觉醒状态，buff1
		{
		Send 5
		}
	if (GetColor(1084,955)=="0x050705") ;保持游侠觉醒状态，buff2
		{
		Send 5
		}
	if (GetColor(1117,958)=="0x232108") ;保持游侠觉醒状态，buff3
		{
		Send 5
		}


	if (GetColor(1225,1013)=="0x732793") ;风暴精魄
		{
		Send v
		Sleep 400
		}
	if (GetColor(1226,1008)=="0x8D6623") ;锋开磨砺
		{
		Send v
		Sleep 50
		}
	if (GetColor(1227,1015)=="0x150501") ;干掉他们
		{
		Send v
		Sleep 50
		}



	if (GetColor(811,1008)=="0x6A5A01") ;长弓4
		{
		Send r
		Sleep 499
		}
	if (GetColor(688,1013)=="0xFFF821") ;长弓2
		{
		Send q
		Sleep 2500
		}


	if (GetColor(688,1015)=="0xFAFF8D") ;大锤2
		{
		Send q
		Sleep 700
		}
	if (GetColor(750,1013)=="0x5C5451") ;大锤3
		{
		Send e
		Sleep 499
		}
	if (GetColor(809,1014)=="0xF8FF00") ;大锤4
		{
		Send r
		Sleep 1100
		}
	if (GetColor(873,1016)=="0x595658") ;大锤5
		{
		Send f
		Sleep 1100
		}


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
Return






F1::
Hotkey, %A_ThisHotkey%,, T2

if (flag)
	{
	Reload
	Send {f7}
	; Send {esc}
	; Sleep 200
	; Send {esc}
	; Sleep 200
	; Send {esc}
	return
	}

flag := true


Loop{
	ToolTip,Ranger On

	; Send 0
	Send 2
	; Send {f6}


	; if (GetColor(577,1022)=="0x766960") ;保持切换武器
	; 	{
	; 	Send 0,2
	; 	}


	if (GetColor(1043,954)=="0xFFF456") ;觉醒伏击：如果存在「能量觉醒」buff
		{
		; Send 0
		Send 5
		Sleep 200
		Send 1
		Send 6
		Send 3
		Sleep 1000
		Send 5
		Send 2
		Sleep 3500
		Send 0
		Send 2
		}
	if (GetColor(964,910)=="0xA28F00") ;保持游侠觉醒状态，buff1
		{
		Send 5
		}
	if (GetColor(1084,955)=="0x050705") ;保持游侠觉醒状态，buff2
		{
		Send 5
		}
	if (GetColor(1117,958)=="0x232108") ;保持游侠觉醒状态，buff3
		{
		Send 5
		}


	if (GetColor(1225,1013)=="0x732793") ;风暴精魄
		{
		Send v
		Sleep 400
		}
	if (GetColor(1226,1008)=="0x8D6623") ;锋开磨砺
		{
		Send v
		Sleep 50
		}
	if (GetColor(1227,1015)=="0x150501") ;干掉他们
		{
		Send v
		Sleep 50
		}


	if (GetColor(1286,1010)=="0x432200") ;群攻之力
		{
		Send b
		Sleep 1300
		; Send z
		; Sleep 1000
		}


	; if (GetColor(1043,1018)=="0x58FFFF") ;同心治疗
	; 	{
	; 	Send z
	;     Sleep 1000
	; 	}


	; if (GetColor(871,1013)=="0xB9C415") ;长弓5
	; 	{
	; 	Send f
	; 	Sleep 2700
	; 	}
	if (GetColor(811,1008)=="0x6A5A01") ;长弓4
		{
		Send r
		Sleep 499
		}
	if (GetColor(688,1013)=="0xFFF821") ;长弓2
		{
		Send q
		Sleep 2500
		}


	if (GetColor(688,1015)=="0xFAFF8D") ;大锤2
		{
		Send q
		Sleep 700
		}
	if (GetColor(750,1013)=="0x5C5451") ;大锤3
		{
		Send e
		Sleep 499
		}
	if (GetColor(809,1014)=="0xF8FF00") ;大锤4
		{
		Send r
		Sleep 1100
		}
	if (GetColor(873,1016)=="0x595658") ;大锤5
		{
		Send f
		Sleep 1100
		}


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




	else ;防罚站
		{
		Send 2
		; Send 0
		Send 6
		Send 1
		; Send 3
		Sleep 200
		; continue
		}
	}

return
