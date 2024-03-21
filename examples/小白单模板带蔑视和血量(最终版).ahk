;本模板由哔站Melis大佬提供,由哔站 紫麟吉他 优化并加入了蔑视和血量控制
#NoEnv
#NoTrayIcon
#SingleInstance force
SetKeyDelay, -1

; 创建GUI窗口
Gui +OwnDialogs
GuiControlGet, kai, , startfont
;/获得当前文件路径，命名为ScriptDir
ScriptDir := A_ScriptDir

;/新建config文件夹
NewFolder := ScriptDir . "\config"
FileCreateDir, %NewFolder%

;获取配置文件信息，命名为IniFilePath
IniFilePath := ScriptDir . "\config\教学.ini"

;/加载后写入数据
IniWrite, "free", %iniFilePath%, "本脚本免费使用", by:

    ;------------------------------------
    ;/获取武器1的对应技能，分别是12345
    ;/下方"wpcolor"是读取ini里的[wpcolor]组下面的信息
    wpcolor:="wpcolor"
    keys := ["wp1","wp2", "wp3","wp4", "wp5"]
    for index, key in keys {
        ;/读取ini文件内wpcolor组内的，x数据，%key%为变量，会依次读取keys内的数组
        IniRead, %key%x, %iniFilePath%, %wpcolor%, %key%x
        IniRead, %key%y, %iniFilePath%, %wpcolor%, %key%y
        IniRead, %key%color, %iniFilePath%, %wpcolor%, %key%color
    }

    ;------------------------------------
    ;/获取武器2的对应技能，分别是12345
    ;/下方"twpcolor"是读取ini里的[twpcolor]组下面的信息
    twpcolor:="twpcolor"
    keys := ["twp2","twp3","twp4","twp5"]
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, %twpcolor%, %key%x
        IniRead, %key%y, %iniFilePath%, %twpcolor%, %key%y
        IniRead, %key%color, %iniFilePath%, %twpcolor%, %key%color
    }

    ;------------------------------------
    ;/获取通用技能，对应1234,5为精英技能
    ;/下方"tycolor"是读取ini里的[tycolor]组下面的信息
    tycolor:="tycolor"
    keys := ["ty1", "ty2", "ty3", "ty4", "ty5"]
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, %tycolor%, %key%x
        IniRead, %key%y, %iniFilePath%, %tycolor%, %key%y
        IniRead, %key%color, %iniFilePath%, %tycolor%, %key%color
    }

    ;------------------------------------
    ;/获取通用职业技能，对应12345，以及其他，例如时空的5个豆子的判定
    ;/下方"fcolor"是读取ini里的[fcolor]组下面的信息
    fcolor:="fcolor"
    keys := ["f1", "f2", "f3", "f4", "f5","point","mst","xl"]
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, %fcolor%, %key%x
        IniRead, %key%y, %iniFilePath%, %fcolor%, %key%y
        IniRead, %key%color, %iniFilePath%, %fcolor%, %key%color
    }

    ;------------------------------------
    ;/获取键盘按键信息
    Hotkeys:="Hotkeys"
    keys := ["wp1key", "wp2key", "wp3key", "wp4key", "wp5key", "ty1key", "ty2key", "ty3key", "ty4key", "ty5key", "f1key", "f2key", "f3key", "f4key", "f5key", "qwqkey", "startkey", "savecolorkey", "savekey","alltime"]
    defaultValues := ["1", "2", "3", "4", "5", "e", "x", "c", "z", "", "F1", "F2", "F3", "F4", "F5", "``", "capslock", "f9", "f10","20"]
    for index, key in keys {
        IniRead, %key%, %iniFilePath%, %Hotkeys%, %key%
        ;如果按键信息为空，或者error，那么自动获取defaultValues数组内默认按键信息
        if (%key% = "" or %key% = "error") {
            %key% := defaultValues[index]

        }
    }

    ;/切武器读取
    qwq:="qwq"
    IniRead, qwqx, %iniFilePath%, %qwq%, qwqx
    IniRead, qwqy, %iniFilePath%, %qwq%, qwqy
    IniRead, qwqcolor, %iniFilePath%, %qwq%, qwqcolor


    ;/-----------------------开启关闭读取--------------------
    IniRead, startfont, %iniFilePath%, %Hotkeys%, startfont

    if(startfont="" or startfont= "error")
    {
        startfont:= "启动中"
    }

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

    ;设置热键，开始热键caps lock
    Hotkey, %startkey%, startrun

    ;设置热键，取色热键f9
    Hotkey, %savecolorkey%, findcolor

    ;设置热键，面板热键f10
    Hotkey, %savekey%, savekey

return

startrun:

aaa1 := (onoff1 := !onoff1) ? new Thread("a1") : ""
aaa2 := (onoff2 := !onoff2) ? new Thread("a2") : ""
aaa3 := (onoff3 := !onoff3) ? new Thread("a3") : ""

    ;/如果默认按键是capslock
    if(startkey =="capslock" )
    {
        if( onoff1 = 0)
        {
            ;/强制关闭大写
            SetCapsLockState, Off
            ToolTip
        }

    }

    if(startkey !="capslock" )
    {
        if( onoff1 = 0)
        {
            ToolTip
        }

    }

return

; 线程1
a1:
loop{
     getqwq:=GetPixelColor(qwqx,qwqy)
             if(getqwq!=qwqcolor)
            {
            SendLoop(wp2key,100)
}
     getmst:=GetPixelColor(mstx,msty)
            if(getmst==mstcolor)
            {
            SendLoop(wp2key,100)
}

        getxl:=GetPixelColor(xlx,xly)
            if(getxl==xlcolor)
            {
            SendLoop(wp4key,100)
}

      getpoint:=GetPixelColor(pointx,pointy)

        ;/获取豆子的颜色与本地颜色对比，如果一致，在去判断f1-2-3这类技能是否可用。
        if(getpoint==pointcolor)
          {
            SendLoop(wp3key,100)
          }
}

return



/*
    start=0

    Loop {

        ;此处表示，如果第一次启动，那么只执行一次，也就是start=0开始执行，执行完后start变成了1，后续不在执行。
        if(start==0)
        {
            start=1
        }

        ;获取屏幕坐标的颜色，保存到getwp2参数里
        getwp2:=GetPixelColor(wp2x,wp2y)

        ;使用getwp2对比本地的wp2color颜色，如果一致，那么按下2键，并且指定延迟400毫秒
        if(getwp2==wp2color)
        {
            sendloop(wp1key,400)
            ;此处是使用了函数，wp1key为按键1   400为延迟，这样就避免了换行在输入延迟信息。
        }

    }
*/

/*
a2:

    loop
    {
        ;此处是时空/灵刃/刺客获取豆子后判断f12345这类技能，例如时空f123跟武器技能不冲突，可以直接用线程2代替

        ;/先获取5豆子颜色，保存到getpoint参数里。
        getpoint:=GetPixelColor(pointx,pointy)

        ;/获取豆子的颜色与本地颜色对比，如果一致，在去判断f1-2-3这类技能是否可用。
        if(getpoint==pointcolor)
        {
            ;/在判断f1图标是否可用
            getf1:=GetPixelColor(f1x,f1y)
            if(getf1==f1color)
            {
                ;/添加一个循环，当按下f1后，如果5豆子颜色消失，那么说明已经释放，在跳过
                ;如果是时空，f123是独立释放，不会被武器技能打断，那么可以实现最快速的释放，而不用指定延迟。
                loop
                {
                    SendLoop(f1key, 10)

                    ;/此处对比豆子颜色与本地颜色差别，如果5个豆子消失了，表示f123已经释放过，那么通过break跳出循环。
                    getpoint:=GetPixelColor(pointx,pointy)
                    if(getpoint!=pointcolor)
                    {
                        break
                    }
                }
            }
        }

    }
return
*/
a3:
    loop
    {
        ;/此处是启动中的文字提示，需要先获取切武器对应的xy轴，才会显示在对应坐标，否则会跟随鼠标。
        ToolTip, %startfont%,qwqx-30,qwqy-50
    }
return

;/找色F9
findcolor:
    sltime:=100
    jumptime:=100

    msgbox "下面将开始对武器技能取色"`n"请按照文字提示依次移动到技能左上角11点方向，按下" %savecolorkey%

    saveType := "wpcolor"
    wp := ["2", "3", "4", "5"]
    Loop, % wp.MaxIndex()
    {
        skill := wp[A_Index]
        Loop
        {
            tooltip "请移动到武器组一" %skill% "，11点方向按下F9取消按F11"
            if GetKeyState(savecolorkey, "P")
            {

                ;获得xy轴的坐标
                MouseGetPos, xpos, ypos
                ;在你鼠标所在位置向上移动，避免取色的时候出现图标高亮
                mousemove, xpos, ypos - 200
                sleep %sltime%
                ;/获得xy轴指向的对应颜色
                PixelGetColor, color, %xpos%, %ypos%, RGB

                ;写入数据到ini文件内的[wpcolor]组，保存为wp开头，依次保存为wp2x,wp3y,wp4y,wp5y
                ;/循环到5后，跳出执行下个代码
                IniWrite, %xpos%, %iniFilePath%, wpcolor, wp%skill%x
                IniWrite, %ypos%, %iniFilePath%, wpcolor, wp%skill%y
                IniWrite, %color%, %iniFilePath%, wpcolor, wp%skill%color

                ;/还原鼠标坐标
                mousemove, xpos, ypos
                ;/弹出文字提示，设置获取完毕的信息，也可不用
                tooltip "获取完毕"
                sleep jumptime
                tooltip
                break
            }
            if GetKeyState("F11", "P")
            {
                tooltip "跳过"
                sleep jumptime
                tooltip
                break
            }

        }
    }
    ;--------------------------------------------------重新读取配置文件数据，并弹窗提示--------------------------------------------------
    keys := ["wp2", "wp3","wp4", "wp5"]
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, wpcolor, %key%x
        IniRead, %key%y, %iniFilePath%, wpcolor, %key%y
        IniRead, %key%color, %iniFilePath%, wpcolor, %key%color
    }

    getwp2:=GetPixelColor(wp2x,wp2y)
    getwp3:=GetPixelColor(wp3x,wp3y)
    getwp4:=GetPixelColor(wp4x,wp4y)
    getwp5:=GetPixelColor(wp5x,wp5y)
    msgbox "武器组一检测"`n"武器2颜色" %getwp2% "武器2本地颜色" %wp2color%`n"武器3颜色" %getwp3% "武器3本地颜色" %wp3color%`n"武器4颜色" %getwp4% "武器4本地颜色" %wp4color%`n"武器5颜色" %getwp5% "武器5本地颜色" %wp5color%`n

    ;--------------------------------------------------;--------------------------------------------------

    saveType := "twpcolor"
    wp := ["2", "3", "4", "5"]
    Loop, % wp.MaxIndex()
    {
        skill := wp[A_Index]
        Loop
        {
            tooltip "请移动到武器组二" %skill% "，11点方向按下F9取消按F11"
            if GetKeyState(savecolorkey, "P")
            {
                MouseGetPos, xpos, ypos
                mousemove, xpos, ypos - 200
                sleep %sltime%
                PixelGetColor, color, %xpos%, %ypos%, RGB
                ; 保存数据到INI文件
                IniWrite, %xpos%, %iniFilePath%, %saveType%, twp%skill%x
                IniWrite, %ypos%, %iniFilePath%, %saveType%, twp%skill%y
                IniWrite, %color%, %iniFilePath%, %saveType%, twp%skill%color
                mousemove, xpos, ypos
                tooltip "武器组二" %skill% "获取完毕"
                sleep jumptime
                tooltip
                break
            }
            if GetKeyState("F11", "P")
            {
                tooltip "跳过"
                sleep jumptime
                tooltip
                break
            }

        }
    }
    ;--------------------------------------------------;--------------------------------------------------

    keys := ["twp2","twp3","twp4","twp5"]
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, twpcolor, %key%x
        IniRead, %key%y, %iniFilePath%, twpcolor, %key%y
        IniRead, %key%color, %iniFilePath%, twpcolor, %key%color
    }


    gettwp2:=GetPixelColor(twp2x,twp2y)
    gettwp3:=GetPixelColor(twp3x,twp3y)
    gettwp4:=GetPixelColor(twp4x,twp4y)
    gettwp5:=GetPixelColor(twp5x,twp5y)
    msgbox "武器组二"`n"武器2颜色" %gettwp2% "武器2本地颜色" %twp2color%`n"武器3颜色" %gettwp3% "武器3本地颜色" %twp3color%`n"武器4颜色" %gettwp4% "武器4本地颜色" %twp4color%`n"武器5颜色" %gettwp5% "武器5本地颜色" %twp5color%`n

    ;--------------------------------------------------;--------------------------------------------------

    saveType := "tycolor"
    ty:= ["1","2", "3", "4", "5"]
    Loop, % ty.MaxIndex()
    {
        skill := ty[A_Index]
        Loop
        {
            if(skill==1)
            {
                tooltip "移动到通用1（技能名称）11点处按下F9取消按F11"
            }
            if(skill==2)
            {
                tooltip "移动到通用2（）11点处按下F9取消按F11"
            }
            if(skill==3)
            {
                tooltip "移动到通用3（）11点处按下F9取消按F11"
            }
            if(skill==4)
            {
                tooltip "移动到通用4（）11点处按下F9取消按F11"
            }
            if(skill==5)
            {
                tooltip "移动到通用5（）11点处按下F9取消按F11"
            }
            if GetKeyState(savecolorkey, "P")
            {
                MouseGetPos, xpos, ypos
                mousemove,xpos,ypos-200
                sleep %sltime%
                PixelGetColor, color, %xpos%, %ypos%, RGB
                IniWrite, %xpos%, %iniFilePath%, %saveType%, ty%skill%x
                IniWrite, %ypos%, %iniFilePath%, %saveType%, ty%skill%y
                IniWrite, %color%, %iniFilePath%, %saveType%, ty%skill%color
                mousemove, xpos, ypos
                tooltip "通用技能" %skill% "获取完毕"
                sleep jumptime
                tooltip
                break
            }
            if GetKeyState("F11", "P")
            {
                tooltip "跳过"
                sleep jumptime
                tooltip
                break
            }
        }
    }
    ;--------------------------------------------------;--------------------------------------------------

    keys := ["ty1", "ty2", "ty3", "ty4", "ty5"]
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, tycolor, %key%x
        IniRead, %key%y, %iniFilePath%, tycolor, %key%y
        IniRead, %key%color, %iniFilePath%, tycolor, %key%color
    }

    getty1:=GetPixelColor(ty1x,ty1y)
    getty2:=GetPixelColor(ty2x,ty2y)
    getty3:=GetPixelColor(ty3x,ty3y)
    getty4:=GetPixelColor(ty4x,ty4y)
    msgbox "通用颜色检测"`n"通用1颜色" %getty1% "副武器1本地颜色" %ty1color%`n"通用2颜色" %getty2% "通用2本地颜色" %ty2color%`n"通用3颜色" %getty3% "通用3本地颜色" %ty3color%`n"通用4颜色" %getty4% "通用4本地颜色" %ty4color%`n
    ;--------------------------------------------------;--------------------------------------------------

    saveType := "fcolor"
    f:= ["1","2", "3", "4", "5"]
    Loop, % f.MaxIndex()
    {
        skill := f[A_Index]
        Loop
        {

            tooltip "请移动到F1-F5技能" F%skill% "，11点方向按下F9取消按F11"
            if GetKeyState(savecolorkey, "P")
            {
                MouseGetPos, xpos, ypos
                mousemove,xpos,ypos-200
                sleep %sltime%
                PixelGetColor, color, %xpos%, %ypos%, RGB
                IniWrite, %xpos%, %iniFilePath%, %saveType%, f%skill%x
                IniWrite, %ypos%, %iniFilePath%, %saveType%, f%skill%y
                IniWrite, %color%, %iniFilePath%, %saveType%, f%skill%color
                mousemove, xpos, ypos
                tooltip "F1-F5技能" F%skill% "获取完毕"
                sleep jumptime
                tooltip
                break
            }
            if GetKeyState("F11", "P")
            {
                tooltip "跳过"
                sleep jumptime
                tooltip
                break
            }
        }
    }

    ;--------------------------------------------------;--------------------------------------------------

    loop
    {
        tooltip "请在满豆子状态下，移动到第三个豆子中心处按F9取消按F11"
        if GetKeyState(savecolorkey, "P")
        {
            ; 定义保存数据的变量
            saveType := "fcolor"
            MouseGetPos, xpos, ypos
            mousemove,xpos,ypos-200
            sleep %sltime%
            PixelGetColor, color, %xpos%, %ypos%, RGB
            IniWrite, %xpos%, %iniFilePath%, %saveType%, pointx
            IniWrite, %ypos%, %iniFilePath%, %saveType%, pointy
            IniWrite, %color%, %iniFilePath%, %saveType%, pointcolor
            mousemove, xpos, ypos
            tooltip "豆子取色完毕"
            sleep jumptime
            tooltip
            break
        }

        if GetKeyState("F11", "P")
        {
            tooltip "跳过"
            sleep jumptime
            tooltip
            break
        }
}

 loop
    {
        tooltip "请在蔑视条十分之一处的中间取色按F9取消按F11"
        if GetKeyState(savecolorkey, "P")
        {
            ; 定义保存数据的变量
            saveType := "fcolor"
            MouseGetPos, xpos, ypos
            mousemove,xpos,ypos-200
            sleep %sltime%
            PixelGetColor, color, %xpos%, %ypos%, RGB
            IniWrite, %xpos%, %iniFilePath%, %saveType%, mstx
            IniWrite, %ypos%, %iniFilePath%, %saveType%, msty
            IniWrite, %color%, %iniFilePath%, %saveType%, mstcolor
            mousemove, xpos, ypos
            tooltip "豆子取色完毕"
            sleep jumptime
            tooltip
            break
        }

        if GetKeyState("F11", "P")
        {
            tooltip "跳过"
            sleep jumptime
            tooltip
            break
        }
}

loop
    {
        tooltip "请在血量2的左下角用QQ截图精准取色按F9取消按F11"
        if GetKeyState(savecolorkey, "P")
        {
            ; 定义保存数据的变量
            saveType := "fcolor"
            MouseGetPos, xpos, ypos
            mousemove,xpos,ypos-200
            sleep %sltime%
            PixelGetColor, color, %xpos%, %ypos%, RGB
            IniWrite, %xpos%, %iniFilePath%, %saveType%, xlx
            IniWrite, %ypos%, %iniFilePath%, %saveType%, xly
            IniWrite, %color%, %iniFilePath%, %saveType%, xlcolor
            mousemove, xpos, ypos
            tooltip "豆子取色完毕"
            sleep jumptime
            tooltip
            break
        }

        if GetKeyState("F11", "P")
        {
            tooltip "跳过"
            sleep jumptime
            tooltip
            break
        }
}

loop{
        tooltip "请移动到切武器图标箭头处按F9取消按F11"
        if GetKeyState(savecolorkey, "P")
        {
            ; 定义保存数据的变量
            saveType := "qwq"
            MouseGetPos, xpos, ypos
            mousemove,xpos,ypos-200
            sleep %sltime%
            PixelGetColor, color, %xpos%, %ypos%, RGB
            IniWrite, %xpos%, %iniFilePath%, %saveType%, qwqx
            IniWrite, %ypos%, %iniFilePath%, %saveType%, qwqy
            IniWrite, %color%, %iniFilePath%, %saveType%, qwqcolor
            mousemove, xpos, ypos
            msgbox "切武器获取完毕,可开启热键循环"
            sleep jumptime
            tooltip
            break
        }

        if GetKeyState("F11", "P")
        {
            tooltip "跳过"
            sleep jumptime
            tooltip
            break
        }
    }

    ;--------------------------------------------------;--------------------------------------------------
return


savekey:

    IfWinExist, MyGui
    {
        WinActivate, MyGui
    }
    {
        Gui, MyGui: New , 0 , 热键
        Gui Add, Text, x10 y10 w50 h20, 武器
        Gui Add, Hotkey, x10 y30 w50 vwp1key Choose, %wp1key%
        Gui Add, Hotkey, x10 y60 w50 vwp2key Choose, %wp2key%
        Gui Add, Hotkey, x10 y90 w50 vwp3key Choose, %wp3key%
        Gui Add, Hotkey, x10 y120 w50 vwp4key Choose, %wp4key%
        Gui Add, Hotkey, x10 y150 w50 vwp5key Choose, %wp5key%

        Gui Add, Text, x80 y10 w50 h20, 通用
        Gui Add, Hotkey, x70 y30 w70 vty1key Choose, %ty1key%
        Gui Add, Hotkey, x70 y60 w70 vty2key Choose, %ty2key%
        Gui Add, Hotkey, x70 y90 w70 vty3key Choose, %ty3key%
        Gui Add, Hotkey, x70 y120 w70 vty4key Choose, %ty4key%
        Gui Add, Hotkey, x70 y150 w70 vty5key Choose, %ty5key%

        Gui Add, Text, x140 y10 w50 h20, F1-F5
        Gui Add, Hotkey, x150 y30 w70 vf1key Choose, %f1key%
        Gui Add, Hotkey, x150 y60 w70 vf2key Choose, %f2key%
        Gui Add, Hotkey, x150 y90 w70 vf3key Choose, %f3key%
        Gui Add, Hotkey, x150 y120 w70 vf4key Choose, %f4key%
        Gui Add, Hotkey, x150 y150 w70 vf5key Choose, %f5key%

        Gui Add, Text, x10 y185 w50 h20, 切
        Gui Add, edit, x30 y180 w70 vqwqkey Choose, %qwqkey%

        Gui Add, Text, x110 y185 w50 h20, 启
        Gui Add, edit, x130 y180 w70 vstartkey Choose, %startkey%

        Gui Add, Text, x10 y210 w50 h20, 取
        Gui Add, Hotkey, x30 y210 w70 vsavecolorkey Choose, %savecolorkey%

        Gui Add, Text, x110 y210 w50 h20, 存
        Gui Add, Hotkey, x130 y210 w70 vsavekey Choose, %savekey%

        Gui Add, Text, x10 y240 w50 h20, 开
        Gui, Add, Edit,x30 y240 w70 vstartfont ,%startfont%

        Gui Add, Text, x110 y240 w50 h20, 全局延迟
        Gui Add, edit, x165 y240 w30 valltime , %alltime%

        Gui Add, Button, x90 y270 w50 h30 gSaveButton default, 保存

        Gui Show
    }
return

;/保存按键信息
SaveButton:
    gui Submit
    saveType := "Hotkeys"
    IniWrite, %wp1key%, %iniFilePath%, %saveType%, wp1key
    IniWrite, %wp2key%, %iniFilePath%, %saveType%, wp2key
    IniWrite, %wp3key%, %iniFilePath%, %saveType%, wp3key
    IniWrite, %wp4key%, %iniFilePath%, %saveType%, wp4key
    IniWrite, %wp5key%, %iniFilePath%, %saveType%, wp5key

    IniWrite, %ty1key%, %iniFilePath%, %saveType%, ty1key
    IniWrite, %ty2key%, %iniFilePath%, %saveType%, ty2key
    IniWrite, %ty3key%, %iniFilePath%, %saveType%, ty3key
    IniWrite, %ty4key%, %iniFilePath%, %saveType%, ty4key
    IniWrite, %ty5key%, %iniFilePath%, %saveType%, ty5key

    IniWrite, %f1key%, %iniFilePath%, %saveType%, f1key
    IniWrite, %f2key%, %iniFilePath%, %saveType%, f2key
    IniWrite, %f3key%, %iniFilePath%, %saveType%, f3key
    IniWrite, %f4key%, %iniFilePath%, %saveType%, f4key
    IniWrite, %f5key%, %iniFilePath%, %saveType%, f5key
    IniWrite, %qwqkey%, %iniFilePath%, %saveType%, qwqkey
    IniWrite, %startkey%, %iniFilePath%, %saveType%, startkey

    IniWrite, %savecolorkey%, %iniFilePath%, %saveType%, savecolorkey
    IniWrite, %savekey%, %iniFilePath%, %saveType%, savekey

    IniWrite, %kai%, %iniFilePath%, %saveType%, startfont
    IniWrite, %alltime%, %iniFilePath%,sleep, alltime

    MsgBox, 保存成功！
return

;/获取对应坐标的颜色
GetPixelColor(x,y)
{
    PixelGetColor, color, x, y, RGB
return color

}

;/获取对应按键，以及延迟信息，并释放
SendLoop(key, loopCount) {
    ;定义alltime为全局参数
    global alltime

    patternHotkey := "F[1-9]|F1[0-2]"
    patternShift := "shift"
    patternmbutton := "mbutton"
    patternmtab := "tab"
    isHotkey := RegExMatch(key, patternHotkey)
    isShift := RegExMatch(key, patternShift)
    isMbutton := RegExMatch(key, patternmbutton)
    istab := RegExMatch(key, patternmtab)

    if (isHotkey || isShift || isMbutton ||istab) {
        send, {%key%}
    } else {
        send, %key%
    }
    ;此处是函数等待延迟，在指定延迟的基础上减去全局延迟，实现最大程度的微调
    sleep, (loopCount-alltime)

}

