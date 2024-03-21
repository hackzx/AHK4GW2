;此模板由哔站大佬 Melis 提供，禁止倒卖！
#NoEnv
#NoTrayIcon
SendMode Input
CoordMode, Pixel, Screen
;/颜色初始化
getcls=0
filePath := "C:\夺魂.txt"

;/添加全局坐标信息

;/----------------------------------------------------
;/-------------此处设置你的按键信息-------------
;/左侧1-5按键信息
sk1key=1
sk2key=2
sk3key=3
sk4key=4
sk5key=5

;/右侧6-0按键信息
sk6key=q
sk7key=e
sk8key=r
sk9key=t
sk10key=g

;/F1
skf1key=z

;/----------------------------------------------------

;----------------------------终极傻瓜教程----------------------------
;----------------------------终极傻瓜教程----------------------------

;----------------------------打开qq截图----------------------------
;--------------------把鼠标移动到对应技能上，按f10----------------------------
;----------------获得[x,y]，直接粘贴到下面:=的后面---------------

;----------------------------终极傻瓜教程----------------------------
;----------------------------终极傻瓜教程----------------------------

;技能2
wp2:= [1001,1365]

;技能3
wp3:= [1064,1366]

;技能4
wp4:= [1124,1365]

;技能5
wp5:= [1189,1362]

;技能6治疗
wp6:= [1360,1365]

;技能7，取12点左侧一点的区域，方便识别黑色
ty2:= [1426,1359]

;技能8，取12点左侧一点的区域，方便识别黑色
ty3:= [1487,1360]

;技能9
ty4:= [1543,1366]

;精英技能
ty5:= [1604,1367]

;F1
f01:= [1175,1293]

;/-------------------------下面代码不要更改------------------------------------
;/读取txt文本内对应技能的颜色
;/武器2
targetSkill := "Skill2"
sk2color := extractColorFromTxt(filePath, targetSkill)
;/武器3
targetSkill := "Skill3"
sk3color := extractColorFromTxt(filePath, targetSkill)
;/武器4
targetSkill := "Skill4"
sk4color := extractColorFromTxt(filePath, targetSkill)
;/武器5
targetSkill := "Skill5"
sk5color := extractColorFromTxt(filePath, targetSkill)

;/通用1技能
targetSkill := "Skill6"
sk6color := extractColorFromTxt(filePath, targetSkill)

;/通用2技能
targetSkill := "Skill7"
sk7color := extractColorFromTxt(filePath, targetSkill)
;/通用3技能
targetSkill := "Skill8"
sk8color := extractColorFromTxt(filePath, targetSkill)
;/通用4技能
targetSkill := "Skill9"
sk9color := extractColorFromTxt(filePath, targetSkill)

;/精英技能
targetSkill := "Skill10"
sk10color := extractColorFromTxt(filePath, targetSkill)

;/F1
targetSkill := "F1"
f1color := extractColorFromTxt(filePath, targetSkill)

;/----------------------------------下面代码不要更改----------------------------------------
Label=%1%
if (Label!="")
{
	Suspend, On
	if IsLabel(Label)
		Gosub, %Label%
	ExitApp
}

Menu, Tray, Icon
Class Thread
{
	__New(Label)
	{
		if (A_IsCompiled)
			Run, "%A_ScriptFullPath%" /f "%Label%",,, pid
		else
			Run, "%A_AhkPath%" /f "%A_ScriptFullPath%" "%Label%",,, pid
		this.pid:=pid
	}
	__Delete()
	{
		Process, Close, % this.pid
	}
}
;/----------------------------------上面代码不要更改----------------------------------------

;/如需改热键，需要把CapsLock，与下面的CapsLock一起修改
For k, v in ["*CapsLock"]
	Hotkey, % v, % RegExReplace(v, " ")
return

;-- 热键
*CapsLock::
	;/添加一个系统提示音，证明按键开启或者关闭
	SoundPlay, *-2

	aaa1 := (onoff1 := !onoff1) ? new Thread("a1") : ""
	aaa2 := (onoff2 := !onoff2) ? new Thread("a2") : ""
	;/当按键处于停止状态时，才提示循环信息，避免占用开启热键后的延迟占用
	if(onoff1 = 0)
	{
		ToolTip, % (onoff1 ? "" : "循环关闭")
		sleep 1000
		ToolTip
	}
return

; 线程1
a1:
	;/右侧按键顺序，治疗-黑暗-苦难-弱者退散，精英魔像
	;/为了追求最大伤害，实战中避免在双法池释放过程中关闭脚本，可以等2个法池释放完后再停止脚本
	start=0
	starttime:=""
  dj4=0
	dj5=0
  WM=0
	Loop {
		;大剑5
			getty2 := GetPixelColor(ty2) ;黑暗法池
			getty3 := GetPixelColor(ty3) ;苦难法池
			if (getty2 = sk7color && getty3 = sk8color) {
				send {%sk5key%}
				sleep 200
				dj5=1
				wm=0
			}

			;大剑4
			getty2 := GetPixelColor(ty2) ;黑暗法池
			getty3 := GetPixelColor(ty3) ;苦难法池
			if (getty2 = sk7color && getty3 = sk8color) {
				send {%sk4key%}
				sleep 480
				dj4=1
			}
			
			;弱者退散
			getty4 := GetPixelColor(ty4)
			if (getty4 = sk9color) {
				send {%sk9key%}
			}
	
			;大剑5，大剑4释放过
			 ;黑暗法池
					
					if (dj4=1 && dj5=1) {
						send {%sk7key%}
						sleep 100
					;苦难法池
						send {%sk8key%}
						sleep 100
		}

					;/如果双法池为黑色，那么进入帷幕
					if( GetPixelColor(ty2)=="0x000000" && GetPixelColor(ty3)=="0x000000")
					{

						getf1 := GetPixelColor(f01)
						if(getf1=f1color)
						{
							send {%skf1key%}
							sleep 150
							starttime:=A_tickcount

							;帷幕3
							send {%sk3key%}
							sleep 150
							dj4=0
			        dj5=0
					}
				}
			

		;------------------------------------------------------------------------------
		;/进入帷幕时间超过5.8秒，释放3技能惊惧魔甲
		diff:= A_tickcount-starttime
		if(diff>5800)
		{
			send {%sk3key%}
			sleep 150
		}
		;/进入帷幕时间超过7秒，释放4技能灵魂旋涡
		if(diff>7000)
		{
			send {%sk4key%}
			sleep 150
		}
		
	;/进入帷幕时间超过11秒，释放5技能并退出帷幕	
		if(diff>11000)
		{
			send {%sk5key%}
				sleep 1000
			send {%skf1key%}
			sleep 150
			;/退出帷幕后释放大剑3
			send {%sk3key%}
			sleep 900
			starttime:=""
			wm=1
		}
	


		;大剑2
	getf1 := GetPixelColor(f01)
		if (wm=1)
	{
			send {%sk2key%}
			sleep 500
		}
		else
			;大剑3
			ggetf1 := GetPixelColor(f01)
		if (wm=1) {
			send {%sk3key%}
			sleep 900
		}
		;弱者退散
		getty4 := GetPixelColor(ty4)
		if (getty4 = sk9color) {
			send {%sk9key%}
		}
	}
		
return

; 线程2
a2:
	;/添加一个判断，当脚本开启后，文字提示开启信息，并且保留1秒钟，由于是线程2操作，不会占用主体循环时间
	start=0
	Loop {
		if(start=0)
		{
			ToolTip, % (onoff1 ? "" : "循环开启")
			sleep 1000
			ToolTip
			start=1
		}
	}
return

F9::
	;/保存颜色参数到指定目录，可自行修改

	if(getcls=1)
	{
		ToolTip "你已经识别过技能"
		sleep 500
		tooltip
	}
	else
		if(getcls=0)
		{

			msgbox 颜色保存成功`n保存目录为%filePath%

			;/////////////////////////////////////
			;/武器2取色
			PixelGetColor,wp2color, wp2[1],wp2[2], RGB
			;/武器3取色
			PixelGetColor,wp3color, wp3[1],wp3[2], RGB
			;/武器4取色
			PixelGetColor,wp4color, wp4[1],wp4[2], RGB
			;/武器5取色
			PixelGetColor,wp5color, wp5[1],wp5[2], RGB
			;/////////////////////////////////////
			;/通用1取色
			PixelGetColor,ty1color, ty1[1],ty1[2], RGB
			;/通用2取色
			PixelGetColor,ty2color, ty2[1],ty2[2], RGB
			;/通用3取色
			PixelGetColor,ty3color, ty3[1],ty3[2], RGB
			;/通用4取色
			PixelGetColor,ty4color, ty4[1],ty4[2], RGB
			;/精英取色
			PixelGetColor,jycolor, ty5[1],ty5[2], RGB
			;/F1取色
			PixelGetColor,f1color, F01[1],F01[2], RGB

			; 保存颜色到文件
			;/取色前先删除掉之前颜色记录
			FileDelete, %filePath%
			FileAppend, Skill2: %wp2color%`nSkill3: %wp3color%`nSkill4: %wp4color%`nSkill5: %wp5color%`nSkill6: %ty1color%`nSkill7: %ty2color%`nSkill8: %ty3color%`nSkill9: %ty4color%`nSkill10: %jycolor%`nF1: %f1color%, %filePath%
			getcls=1
		}
return
;--------------------------------------------------------------------

F10:: ;F10是热键，按F10触发取色的功能，下面是取色脚本
	MouseGetPos, mouseX, mouseY
	;获取坐标的横坐标和纵坐标赋值给mouseX和mouseY
	;PixelGetColor, color, %mouseX%, %mouseY%, RGB
	;获取横坐标和纵坐标（即mouseX和mouseY）的颜色值并赋值给color
	clipboard = [%mouseX%,%mouseY%]
	;复制（粘贴数据） mouseX,mouseY==color
	ToolTip, 复制完成
	Sleep 500
	ToolTip
return ;结束
;--------------------------------------------------------------------

GetPixelColor(xy) ; xy是一个数组或一个对象
{
	PixelGetColor, color, xy[1], xy[2], RGB ; 如果xy是一个数组，用数组的第一个和第二个元素作为x和y
	StringRight color,color,10
	return color
}
;--------------------------------------------------------------------

extractColorFromTxt(filePath, targetSkill) {

	FileRead, fileContent, %filePath%
	found := false
	Loop, parse, fileContent, `n, `r
	{
		line := Trim(A_LoopField)
		if (StrLen(line) > 0 && SubStr(line, 1, StrLen(targetSkill)) = targetSkill) {
			skillColor := SubStr(line, StrLen(targetSkill) + 1)
			skillColor := StrReplace(skillColor, ":", "") ; 去掉冒号
			found := true
			return skillColor
		}
	}
	if (!found) {
		return ""
	}
}
;--------------------------------------------------------------------
