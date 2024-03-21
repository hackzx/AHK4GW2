#NoEnv
#NoTrayIcon
#SingleInstance force
SetKeyDelay, -1

SendMode Input
CoordMode, Pixel, Screens

; 创建GUI窗口
Gui +OwnDialogs
GuiControlGet, kai, , startfont
ScriptDir := A_ScriptDir

NewFolder := ScriptDir . "\config"
FileCreateDir, %NewFolder%
global iniFilePath
IniFilePath := ScriptDir . "\config\三BD模板.ini"

IniWrite, "free", %iniFilePath%, "本脚本免费使用如遇卖钱皆为骗子", by:

    ;副本/奶T，可用txt全局搜索进行文字替换，例如无需奶T可将奶T替换成奶T
    ;/----------------------职业模式读取--------------------

    keys := ["option"]
    for index, key in keys {
        IniRead, %key%, %iniFilePath%, mode, %key%
    }

    if(option!="副本" && option!="奶T" && option!="野外")
    {

        msgbox 第一次运行，请先按f10 `n然后选择对应的副本/奶T/野外，bd保存一次`n在进行取色，改延迟等操作
    }

    keys := ["wp1","wp2","wp3","wp4", "wp5"]
    if(option=="副本")
    {
        type:="wpcolor副本"
    }
    if(option=="奶T")
    {
        type:="wpcolor奶T"
    }
     if(option=="野外")
    {
        type:="wpcolor野外"
    }
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, %type%, %key%x
        IniRead, %key%y, %iniFilePath%, %type%, %key%y
        IniRead, %key%color, %iniFilePath%, %type%, %key%color
    }

    ;------------------------------------
    keys := ["twp2","twp3","twp4","twp5"]
    if(option=="副本")
    {
        type:="twpcolor副本"
    }
    if(option=="奶T")
    {
        type:="twpcolor奶T"
    }
    if(option=="野外")
    {
        type:="twpcolor野外"
    }
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, %type%, %key%x
        IniRead, %key%y, %iniFilePath%, %type%, %key%y
        IniRead, %key%color, %iniFilePath%, %type%, %key%color
    }

    ;------------------------------------
    ;------------------------------------

    keys := ["ty1","ty2","ty3","ty4","ty5"]
    if(option=="副本")
    {
        type:="tycolor副本"
    }
    if(option=="奶T")
    {
        type:="tycolor奶T"
    }
    if(option=="野外")
    {
        type:="tycolor野外"
    }
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, %type%, %key%x
        IniRead, %key%y, %iniFilePath%, %type%, %key%y
        IniRead, %key%color, %iniFilePath%, %type%, %key%color
    }
    ;------------------------------------
    ;------------------------------------

    keys := ["f1", "f2", "f3", "f4","f5"]

    if(option=="副本")
    {
        type:="fcolor副本"
    }
    if(option=="奶T")
    {
        type:="fcolor奶T"
    }
    if(option=="野外")
    {
        type:="fcolor野外"
    }
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, %type%, %key%x
        IniRead, %key%y, %iniFilePath%, %type%, %key%y
        IniRead, %key%color, %iniFilePath%, %type%, %key%color
    }

    ;------------------------------------
    ;------------------------------------

    keys := ["wp1key", "wp2key", "wp3key", "wp4key", "wp5key", "ty1key", "ty2key", "ty3key", "ty4key", "ty5key", "f1key", "f2key", "f3key", "f4key", "f5key", "qwqkey", "startkey", "savecolorkey", "savekey"]
    for index, key in keys {
        IniRead, %key%, %iniFilePath%, Hotkeys, %key%
    }

    IniRead, qwqx, %iniFilePath%, qwq, qwqx
    IniRead, qwqy, %iniFilePath%, qwq, qwqy
    IniRead, qwqcolor, %iniFilePath%, qwq, qwqcolor


     ;/蔑视条读取
    saveType:="mst"
    IniRead, mstx, %iniFilePath%, %saveType%, mstx
    IniRead, msty, %iniFilePath%, %saveType%, msty
    IniRead, mstcolor, %iniFilePath%, %saveType%, mstcolor

     ;/血量读取
    saveType:="xl"
    IniRead, xlx, %iniFilePath%, %saveType%, xlx
    IniRead, xly, %iniFilePath%, %saveType%, xly
    IniRead, xlcolor, %iniFilePath%, %saveType%, xlcolor




    keys := ["wp1key", "wp2key", "wp3key", "wp4key", "wp5key", "ty1key", "ty2key", "ty3key", "ty4key", "ty5key", "f1key", "f2key", "f3key", "f4key", "f5key", "qwqkey", "startkey", "savecolorkey", "savekey"]
    defaultValues := ["1", "2", "3", "4", "5", "e", "x", "c", "z", "", "F1", "F2", "F3", "F4", "F5", "``", "capslock", "f9", "f10"]
    for index, key in keys {
        if (%key% = "" or %key% = "error") {
            %key% := defaultValues[index]

        }
    }

    ;/-----------------------技能延迟读取--------------------
    keys := ["wp2sleep","wp3sleep","wp4sleep","wp5sleep" , "twp2sleep","twp3sleep","twp4sleep","twp5sleep" , "ty1sleep","ty2sleep","ty3sleep","ty4sleep","ty5sleep" , "f1sleep","f2sleep","f3sleep","f4sleep","f5sleep","alltime"]

    ;/副本延迟
    if(option=="副本" )
    {
        type:="副本sleep"
        defaultValues := ["710","710","480","710" , "1210","710","480","710" , "1160","670","710","910","910" , "470","0","0","0","0" , "26"]
        for index, key in keys {
            IniRead, %key%, %iniFilePath%, %type%, %key%
            if (%key% = "" or %key% = "error") {
                %key% := defaultValues[index]
            }
        }
    }


    ;/奶Tbd延迟
    if(option=="奶T")
    {
        type:="奶Tsleep"
        defaultValues := ["700","900","470","700" , "470","1600","470","1800", "890","680","460","0","1100" , "470","0","0","0","0", "26"]
        for index, key in keys {
            IniRead, %key%, %iniFilePath%, %type%, %key%
            if (%key% = "" or %key% = "error") {
                %key% := defaultValues[index]
            }
        }
    }

 ;/野外bd延迟
    if(option=="野外")
    {
        type:="野外sleep"
        defaultValues := ["1250","750","500","750" , "500","1750","500","2000", "750","750","500","0","1000" , "400","0","0","0","0", "26"]
        for index, key in keys {
            IniRead, %key%, %iniFilePath%, %type%, %key%
            if (%key% = "" or %key% = "error") {
                %key% := defaultValues[index]
            }
        }
    }



    ;/-----------------------开启关闭读取--------------------
    IniRead, startfont, %iniFilePath%, Hotkeys, startfont
    if(startfont="error")
    {
        startfont :="开启中"
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

    Hotkey, %startkey%, startrun

    Hotkey, %savecolorkey%, findcolor

    Hotkey, %savekey%, savekey

return

startrun:

aaa1 := (onoff1 := !onoff1) ? new Thread("a1") : ""
aaa2 := (onoff2 := !onoff2) ? new Thread("a2") : ""
aaa3 := (onoff3 := !onoff3) ? new Thread("a3") : ""
; 4线程备用
; aaa4 := (onoff4 := !onoff4) ? new Thread("a4") : ""

    if(startkey =="capslock" )
    {
        if( onoff1 = 0)
        {
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
start=0
   loop{
         if(option=="副本")
        {
            if(start=0) ;/起手循环，只运行一次
        {
          
            ;/精英
            getty5:=GetPixelColor(ty5x,ty5y)
            if(getty5==ty5color )
            {
            SendLoop(ty5key,ty5sleep)
            }
             
         ;/执行F1
          getf1:=GetPixelColor(f1x,f1y)
          if(getf1==f1color)
          {
            SendLoop(f1key,f1sleep)
          }
          
            ;/执行F5
            getf5:=GetPixelColor(f5x,f5y)
            if(getf5==f5color)
            {
                ;/鲜血力量识别
                getty3:=GetPixelColor(ty3x,ty3y)
                if(getty3==ty3color)
                {
                 SendLoop(ty3key,ty3sleep)
                }
                ;/f5
                SendLoop(f5key,f5sleep)
            }

            ;/节杖2
           getwp2:=GetPixelColor(wp2x,wp2y)
            if(getwp2==wp2color)
            {
                SendLoop(wp2key,wp2sleep)
            }

        ;/节杖3
         getwp3:=GetPixelColor(wp3x,wp3y)
            if(getwp3==wp3color)
            {
                SendLoop(wp3key,wp3sleep)
            }

        ;/手枪2
            gettwp2:=GetPixelColor(twp2x,twp2y)
            if(gettwp2==twp2color)
            {
                SendLoop(wp2key,twp2sleep)
            }

        ;/手枪3
        gettwp3:=GetPixelColor(twp3x,twp3y)
        if(gettwp3==twp3color)
        {
         SendLoop(wp3key,twp3sleep)
        }
 
            ;/火炬4
            getwp4:=GetPixelColor(wp4x,wp4y)
            if(getwp4==wp4color)
            {
             SendLoop(wp4key,wp4sleep)
            }

            ;/火炬5
            getwp5:=GetPixelColor(wp5x,wp5y)
            if(getwp5==wp5color)
            {
            SendLoop(wp5key,wp5sleep)
            }

            ;/怨恨文章
             getty2:=GetPixelColor(ty2x,ty2y)
            if(getty2==ty2color)
            {
                SendLoop(ty2key,ty2sleep)
            }
            start=1
        }
        
       ;/切武器，如果武器2-武器3为黑色图标，切武器
        getqwq:=GetPixelColor(qwqx,qwqy)
        getwp2:=GetPixelColor(wp2x,wp2y)
        getwp3:=GetPixelColor(wp3x,wp3y)
        if(getwp3==0x000000 && getwp2==0x000000 && getqwq==qwqcolor)
        {
            SendLoop(qwqkey,150)
            SendLoop(wp2key,100)
        }
        ;/-----------------------------------------------------------------------------------------------
        /*
        ;自动加血
        getxl:=GetPixelColor(xlx,xly)  
        getty1:=GetPixelColor(ty1x,ty1y)
        if(getxl!=xlcolor && getty1==ty1color)
        {
            SendLoop(ty1key,ty1sleep)
        }
        */
        
        ;/手枪2
            gettwp2:=GetPixelColor(twp2x,twp2y)
            if(gettwp2==twp2color)
            {
                SendLoop(wp2key,twp2sleep)
            }

        ;/手枪3
        gettwp3:=GetPixelColor(twp3x,twp3y)
        if(gettwp3==twp3color)
        {
         SendLoop(wp3key,twp3sleep)
        }


        ;/节杖2
        getwp2:=GetPixelColor(wp2x,wp2y)
        if(getwp2==wp2color)
        {
        SendLoop(wp2key,wp2sleep)
        }

        ;/节杖3
        getwp3:=GetPixelColor(wp3x,wp3y)
        if(getwp3==wp3color)
        {
        SendLoop(wp3key,wp3sleep)
        }

        ;/执行F5
        getf5:=GetPixelColor(f5x,f5y)
        if(getf5==f5color)
        {
            ;/鲜血力量识别
            getty3:=GetPixelColor(ty3x,ty3y)
            if(getty3==ty3color)
            {
             SendLoop(ty3key,ty3sleep)
            }
            ;/f5
            SendLoop(f5key,f5sleep)
        }

        ;/火炬4
        getwp4:=GetPixelColor(wp4x,wp4y)
        if(getwp4==wp4color)
        {
        SendLoop(wp4key,wp4sleep)
        }

        ;/火炬5
        getwp5:=GetPixelColor(wp5x,wp5y)
        if(getwp5==wp5color)
        {
        SendLoop(wp5key,wp5sleep)
        }
        
        ;/怨恨文章
         getty2:=GetPixelColor(ty2x,ty2y)
            if(getty2==ty2color)
            {
                SendLoop(ty2key,ty2sleep)
            }

        ;/精英
        getty5:=GetPixelColor(ty5x,ty5y)
        if(getty5==ty5color)
        {
        SendLoop(ty5key,ty5sleep)
        }
 
    ;/执行F2
        getf2:=GetPixelColor(f2x,f2y)
        if(getf2==f2color)
        {
            SendLoop(f1key,f1sleep)
            SendLoop(f2key,f2sleep)
        }
  }
         ;----------------------------------------------------------------
          if(option=="奶T")
        {
            ;/精英
            getty5:=GetPixelColor(ty5x,ty5y)
            if(getty5==ty5color )
            {
            SendLoop(ty5key,ty5sleep)
            } 
        
           ;自动加血
        getxl:=GetPixelColor(xlx,xly)  
        getty1:=GetPixelColor(ty1x,ty1y)
        if(getxl!=xlcolor && getty1==ty1color)
        {
            SendLoop(ty1key,ty1sleep)
        }
        
            ;/通用3
            getty3:=GetPixelColor(ty3x,ty3y)
            if(getty3==ty3color)
            {
                SendLoop(ty3key,ty3sleep)
            }
   
          ;/通用2
           getty2:=GetPixelColor(ty2x,ty2y)
            if(getty2==ty2color)
            {
                SendLoop(ty2key,ty2sleep)
            }

        ;/执行F1\F2
        getf2:=GetPixelColor(f2x,f2y)
        if(getf2==f2color)
        {
            SendLoop(f1key,f1sleep)
            SendLoop(f2key,f2sleep)
        }
        
         ;/执行F3
        getf2:=GetPixelColor(f2x,f2y)
        if(getf2==0x000000)
        {
        SendLoop(f3key,f3sleep)
        }

        ;2技能
        getwp2:=GetPixelColor(wp2x,wp2y)
        if(getwp2==wp2color)
        {
          SendLoop(wp2key,wp2sleep)
        }
        
        ;3技能
        getwp3:=GetPixelColor(wp3x,wp3y)
        if(getwp3==wp3color)
        {
          SendLoop(wp3key,wp3sleep)
        }
         ;4技能
        getwp4:=GetPixelColor(wp4x,wp4y)
        if(getwp4==wp4color)
        {
           SendLoop(wp4key,wp4sleep)
        }
        ;5技能
        getwp5:=GetPixelColor(wp5x,wp5y)
        if(getwp5==wp5color)
        {
         SendLoop(wp5key,wp5sleep)
        }
        }
      ;------------------------------------------------------------- 
      if(option=="野外")
       {
        ;自动加血
        getxl:=GetPixelColor(xlx,xly)  
        getty1:=GetPixelColor(ty1x,ty1y)
        if(getxl!=xlcolor && getty1==ty1color)
        {
            SendLoop(ty1key,ty1sleep)
        }
        
           ;释放F2 ,这里判断F2的颜色把 F1 的循环加入其中
            getf2:=GetPixelColor(f2x,f2y)
            if(getf2==f2color)
            {
             SendLoop(f1key,f1sleep)
             SendLoop(f2key,f2sleep) 
            }
            
           ;当F2黑色后，释放F3 黄沙瀑布
            getf2:=GetPixelColor(f2x,f2y)
            getf3:=GetPixelColor(f3x,f3y)
            if(getf2==0x000000 && getf3==f3color)
            {
             SendLoop(f3key,f3sleep)
            }

           ;释放通用5
          getty5:=GetPixelColor(ty5x,ty5y)
          if(getty5==ty5color)
         {
            SendLoop(ty5key,ty5sleep)
         }

   
             ;释放手枪2技能 哀嚎射击
            getwp2:=GetPixelColor(wp2x,wp2y)
            if(getwp2==wp2color)
            {
                SendLoop(wp2key,wp2sleep)
            }
            
            ;释放手枪3技能 恶毒爆冲
            getwp3:=GetPixelColor(wp3x,wp3y)
            if(getwp3==wp3color)
            {
                SendLoop(wp3key,wp3sleep)
            }

 
           ;释放火炬4技能 痛苦浪潮
            getwp4:=GetPixelColor(wp4x,wp4y)
            if(getwp4==wp4color)
            {
                SendLoop(wp4key,wp4sleep)
            }

             ;释放火炬5技能 重压崩溃
            getwp5:=GetPixelColor(wp5x,wp5y)
            if(getwp5==wp5color)
            {
                SendLoop(wp5key,wp5sleep)
            }

       ;释放通用3 ，巨蛇虹吸
          getty3:=GetPixelColor(ty3x,ty3y)
          if(getty3==ty3color)
         {
            SendLoop(ty3key,ty3sleep)
    }
       
       
           ;释放通用2 致命干燥
           getty2:=GetPixelColor(ty2x,ty2y)
           if(getty2==ty2color)
        {
            SendLoop(ty2key,ty2sleep)
        }
         
    
            ;释放水下3技能
            gettwp3:=GetPixelColor(twp3x,twp3y)
            if(gettwp3==twp3color)
            {
                SendLoop(wp3key,twp3sleep)
            }
            
            ;释放水下2技能
            gettwp2:=GetPixelColor(twp2x,twp2y)
            if(gettwp2==twp2color)
            {
                SendLoop(wp2key,twp2sleep)
            }
            
             ;释放水下5技能
            gettwp5:=GetPixelColor(twp5x,twp5y)
            if(gettwp5==twp5color)
            {
                SendLoop(wp5key,twp5sleep)
            }
            
             ;释放水下4技能
            gettwp4:=GetPixelColor(twp4x,twp4y)
            if(gettwp4==twp4color)
            {
                SendLoop(wp4key,twp4sleep)
            }
         } 
}

return
/*
    start:=0
    wp2:=0
    loop
    {
        ;-------------------------------
        if(option=="副本")
        {
            if(start=0)
            {

                start=1
            }

            ;/将wp2x,wp2y的颜色赋予给getwp2的参数
            ;然后将屏幕获得的颜色与本地保存的颜色，wp2color对比，如果一样，那么执行按键
            getwp2:=GetPixelColor(wp2x,wp2y)
            if(getwp2==wp2color)
            {
                ;/通过函数调用wp2的按键，并且延迟1000毫秒
                SendLoop(wp2key,1000)

                ;/此处是技能判断是否释放完毕的备选方案，例如有些时候，实战中因为延迟导致技能跳过，或者技能打断，可在对应技能添加次参数
                ;/当技能图标为黑色后，才进行后续代码，避免因为其他原因造成该技能没有成功释放，但是注意，该方案可能会影响部分输出，图标变黑比技能原本延迟更高。
                loop {
                    getwp2:=GetPixelColor(wp2x,wp2y)
                    ;当武器2屏幕的颜色为黑色，那么跳出，进行后续代码。
                    if(getwp2==0x000000)
                    {
                        break
                    }
                }

                ;/使用过武器2技能后，wp2的值+1
                wp2++
            }

            ;/切武器判断
            getwp2:=GetPixelColor(wp2x,wp2y)
            ;/有时候，有主武器，副武器，如果只判断武器技能2的图标变化，难免会造成冲突，这时候需要在技能释放完后添加一个参数，当这个参数>1，切武器才有效。

            ;/例如这里，当武器2图标为黑，同时武器2的值为1，表示主武器2技能释放过，这样就可以区分主副武器的区别
            if(getwp2==0x000000 && wp2==1)
            {
                SendLoop(qwqkey,200)
                ;切武器后，可以直接使用对应技能，而武器颜色判断，从而实现快速释放,一般只释放1个技能
                sendloop(wp2key,wp2sleep)

                ;/释放完毕后，要把wp2的值归0，相当于重置武器2的参数
                wp2:=0
            }

            ;另外，当武器2技能使用过2次，在街其他技能也是一样。
            if(wp2>=2)
            {
                SendLoop(wp3key,wp3sleep)
                wp2:=0
            }

        }
        ;-------------------------------
        if(option=="奶T")
        {

            if(start=0)
            {

                start=1
            }

        }
        ;-------------------------------
    }
*/


a2:
    ;/线程2可放置一些顺发技能，这样无需进行顺序读取，实现快速释放，例如时空的f123，或者灵刃的f123等
    loop
    {
        if(option=="副本")
        {
     
           ;加入自动破蔑视，释放 F4 技能
           getmst:=GetPixelColor(mstx,msty)
           getf4:=GetPixelColor(f4x,f4y)
            if(getmst==mstcolor && getf4==f4color)
            {
             SendLoop(f4key,f4sleep)
            }
        
        }

        if(option=="奶T")
        {
        ;/执行F5
        getf5:=GetPixelColor(f5x,f5y)
        if(getf5==f5color)
        {
            SendLoop(f5key,f5sleep)
        }
         ;/痛苦路径
        getty4:=GetPixelColor(ty4x,ty4y)
        if(getty4==ty4color)
        {
         SendLoop(ty4key,ty4sleep)
        }
        
        }
        
        if(option=="野外")
        {
        ;/执行F5
        getf5:=GetPixelColor(f5x,f5y)
        if(getf5==f5color)
        {
            SendLoop(f5key,f5sleep)
        }
         ;释放通用4 痛苦路径 
        getty4:=GetPixelColor(ty4x,ty4y)
        if(getty4==ty4color)
        {
         SendLoop(ty4key,ty4sleep)
        } 
        ;加入自动破蔑视，释放 F4 技能
           getmst:=GetPixelColor(mstx,msty)
           getf4:=GetPixelColor(f4x,f4y)
            if(getmst==mstcolor && getf4==f4color)
            {
             SendLoop(f4key,f4sleep)
            }
        }
    }

return

a3:
    loop
    {
        if(startfont!="")
        {
            ToolTip, %startfont%
        }
    }
return


findcolor:

    msgbox "下面将对技能进行取色，请按照提示移动到对应技能图标处，按下F9！"

    ;/-----------------------------------切武器---------------------------------------------
    type:="qwq"
    loop
    {

        tooltip "请移动到切武器图标箭头处，如该职业不切武器可F11跳过"
        ;/取色跳过,参数值为上方
        if GetKeyState(savecolorkey, "P")
        {
            getcolor(type,"","qwq")
            break
        }

        ;/按下F11跳过
        if GetKeyState("F11", "P")
        {
            jump(200)
            break
        }
    }

 ;/-----------------------------------蔑视条---------------------------------------------
    type:="mst"
    loop
    {

        tooltip "请移动到蔑视条十分之一处的中间位置，按F11可跳过"
        ;/取色跳过,参数值为上方
        if GetKeyState(savecolorkey, "P")
        {
            getcolor(type,"","mst")
            break
        }

        ;/按下F11跳过
        if GetKeyState("F11", "P")
        {
            jump(200)
            break
        }
    }

;/-----------------------------------血量---------------------------------------------
    type:="xl"
    loop
    {

        tooltip "请移动到血量2的左下角白色位置用QQ截图进行精准取色，按F11可跳过"
        ;/取色跳过,参数值为上方
        if GetKeyState(savecolorkey, "P")
        {
            getcolor(type,"","xl")
            break
        }

        ;/按下F11跳过
        if GetKeyState("F11", "P")
        {
            jump(200)
            break
        }
    }



    ;/-----------------------------------武器1取色---------------------------------------------

    if(option=="副本")
    {
        ;/此处定义参数前的名称，wp为武器
        name:="wp"
        type := name . "color副本"
    }
    if(option=="奶T")
    {
        ;/此处定义参数前的名称，wp为武器
        name:="wp"
        type := name . "color奶T"
    }
    if(option=="野外")
    {
        ;/此处定义参数前的名称，wp为武器
        name:="wp"
        type := name . "color野外"
    }
    array := ["2", "3", "4", "5"]
    Loop, % array.MaxIndex()
    {
        skill := array[A_Index]
        Loop
        {
            if(option=="副本")
            {
                tooltip "移动到主武器" %skill% "技能图标处"
            }

            if(option=="奶T")
            {
                tooltip "移动到主武器" %skill% "技能图标处"
            }
            if(option=="野外")
            {
                tooltip "移动到主武器" %skill% "技能图标处"
            }
            ;/取色跳过,参数值为上方wp
            if GetKeyState(savecolorkey, "P")
            {
                getcolor(type,name,skill)
                break
            }

            ;/按下F11跳过
            if GetKeyState("F11", "P")
            {
                jump(200)
                break
            }
        }
    }

    keys := ["wp1","wp2", "wp3","wp4", "wp5"]
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, %type%, %key%x
        IniRead, %key%y, %iniFilePath%, %type%, %key%y
        IniRead, %key%color, %iniFilePath%, %type%, %key%color
    }

    getwp2:=GetPixelColor(wp2x,wp2y)
    getwp3:=GetPixelColor(wp3x,wp3y)
    getwp4:=GetPixelColor(wp4x,wp4y)
    getwp5:=GetPixelColor(wp5x,wp5y)

    if(getwp2==wp2color && getwp3==wp3color && getwp4==wp4color && getwp5==wp5color )
    {
        msgbox "主武器所有颜色正确，可进行后续取色"
    }
    Else
    {
        msgbox "主武器有颜色错误，请重新取色"
    }

    ;/-----------------------------------武器2取色---------------------------------------------
    if(option=="副本")
    {
        ;/此处定义参数前的名称，twp为副武器
        name:="twp"
        type := name . "color副本"
    }
    if(option=="奶T")
    {
        ;/此处定义参数前的名称，twp为副武器
        name:="twp"
        type := name . "color奶T"
    }
    if(option=="野外")
    {
        ;/此处定义参数前的名称，twp为副武器
        name:="twp"
        type := name . "color野外"
    }
    array := ["2", "3", "4", "5"]
    Loop, % array.MaxIndex()
    {
        skill := array[A_Index]
        Loop
        {
            if(option=="副本")
            {
                tooltip "移动到副武器" %skill% "技能图标处"
            }

            if(option=="奶T")
            {
                tooltip "移动到副武器" %skill% "技能图标处"
            }
            if(option=="野外")
            {
                tooltip "移动到副武器" %skill% "技能图标处"
            }
            ;/取色跳过,参数值为上方twp
            if GetKeyState(savecolorkey, "P")
            {
                getcolor(type,name,skill)
                break
            }

            ;/按下F11跳过
            if GetKeyState("F11", "P")
            {
                jump(200)
                break
            }
        }
    }

    keys := ["twp1","twp2", "twp3","twp4", "twp5"]
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, %type%, %key%x
        IniRead, %key%y, %iniFilePath%, %type%, %key%y
        IniRead, %key%color, %iniFilePath%, %type%, %key%color
    }

    gettwp2:=GetPixelColor(twp2x,twp2y)
    gettwp3:=GetPixelColor(twp3x,twp3y)
    gettwp4:=GetPixelColor(twp4x,twp4y)
    gettwp5:=GetPixelColor(twp5x,twp5y)

    if(gettwp2==twp2color && gettwp3==twp3color && gettwp4==twp4color && gettwp5==twp5color )
    {
        msgbox "副武器所有颜色正确，可进行后续取色"
    }
    Else
    {
        msgbox "副武器有颜色错误，请重新取色"
    }

    ;/-----------------------------------通用技能取色---------------------------------------------
    if(option=="副本")
    {
        ;/此处定义参数前的名称，ty为通用
        name:="ty"
        type := name . "color副本"
    }
    if(option=="奶T")
    {
        ;/此处定义参数前的名称，ty为通用
        name:="ty"
        type := name . "color奶T"
    }
    if(option=="野外")
    {
        ;/此处定义参数前的名称，ty为通用
        name:="ty"
        type := name . "color野外"
    }
    array := ["1","2", "3", "4", "5"]
    Loop, % array.MaxIndex()
    {
        skill := array[A_Index]
        Loop
        {
            if(option=="副本")
            {
                if(skill==1)
                {
                    tooltip "移动到通用" %skill% "技能(吸血纹章)图标处"
                }
                if(skill==2)
                {
                    tooltip "移动到通用" %skill% "技能(怨恨纹章)图标处"
                }
                if(skill==3)
                {
                    tooltip "移动到通用" %skill% "技能(鲜血力量)图标处"
                }
                if(skill==4)
                {
                    tooltip "移动到通用" %skill% "技能(不死纹章)图标处"
                }
                if(skill==5)
                {
                    tooltip "移动到通用" %skill% "技能(瘟疫化身)图标处"
                }
            }

            if(option=="奶T")
            {
                if(skill==1)
                {
                    tooltip "移动到通用" %skill% "技能(鲜血法池)图标处"
                }
                if(skill==2)
                {
                    tooltip "移动到通用" %skill% "技能(致命干燥)图标处"
                }
                if(skill==3)
                {
                    tooltip "移动到通用" %skill% "技能(巨蛇虹吸)图标处"
                }
                if(skill==4)
                {
                    tooltip "移动到通用" %skill% "技能(痛苦路径)图标处"
                }
                if(skill==5)
                {
                    tooltip "移动到通用" %skill% "技能(血肉魔像)图标处"
                }
            }

             if(option=="野外")
            {
                if(skill==1)
                {
                    tooltip "移动到通用" %skill% "技能(沙尘闪耀)图标处"
                }
                if(skill==2)
                {
                    tooltip "移动到通用" %skill% "技能(致命干燥)图标处"
                }
                if(skill==3)
                {
                    tooltip "移动到通用" %skill% "技能(巨蛇虹吸)图标处"
                }
                if(skill==4)
                {
                    tooltip "移动到通用" %skill% "技能(痛苦路径)图标处"
                }
                if(skill==5)
                {
                    tooltip "移动到通用" %skill% "技能(瘟疫化身)图标处"
                }
            }
            ;/取色跳过,参数值为上方twp
            if GetKeyState(savecolorkey, "P")
            {
                getcolor(type,name,skill)
                break
            }

            ;/按下F11跳过
            if GetKeyState("F11", "P")
            {
                jump(200)
                break
            }
        }
    }

    keys := ["ty1", "ty2", "ty3", "ty4", "ty5"]
    for index, key in keys {
        IniRead, %key%x, %iniFilePath%, %type%, %key%x
        IniRead, %key%y, %iniFilePath%, %type%, %key%y
        IniRead, %key%color, %iniFilePath%, %type%, %key%color
    }

    getty1:=GetPixelColor(ty1x,ty1y)
    getty2:=GetPixelColor(ty2x,ty2y)
    getty3:=GetPixelColor(ty3x,ty3y)
    getty4:=GetPixelColor(ty4x,ty4y)

    if(getty1==ty1color && getty2==ty2color && getty3==ty3color && getty4==ty4color )
    {
        msgbox "通用所有颜色正确，可进行后续取色"
    }
    Else
    {
        msgbox "通用有颜色错误，请重新取色"
    }

    ;/-----------------------------------职业技能取色---------------------------------------------
    if(option=="副本")
    {
        ;/此处定义参数前的名称，f为职业技能
        name:="f"
        type := name . "color副本"
    }
    if(option=="奶T")
    {
        ;/此处定义参数前的名称，f为职业技能
        name:="f"
        type := name . "color奶T"
    }
    if(option=="野外")
    {
        ;/此处定义参数前的名称，f为职业技能
        name:="f"
        type := name . "color野外"
    }

    ;/此处是职业技能，例如有些职业只有F123，而没有45，这里可以将4,5之前包括逗号一起删除
    array := ["1","2", "3", "4", "5"]
    Loop, % array.MaxIndex()
    {
        skill := array[A_Index]
        Loop
        {
            if(option=="副本")
            {
                tooltip "移动到职业技能" %skill% "技能图标处"
            }

            if(option=="奶T")
            {
                tooltip "移动到职业技能" %skill% "技能图标处"
            }

            if(option=="野外")
            {
                tooltip "移动到职业技能" %skill% "技能图标处"
            }
            ;/取色跳过,参数值为上方twp
            if GetKeyState(savecolorkey, "P")
            {
                getcolor(type,name,skill)
                break
            }

            ;/按下F11跳过
            if GetKeyState("F11", "P")
            {
                jump(200)
                break
            }
        }
    }

    msgbox "取色完毕，可开启热键循环"
return

;/--------------------------------------------------------------------------
savekey:

    IfWinExist, MyGui
    {
        WinActivate, MyGui
    }
    {
        Gui, MyGui:New, +Resize +MinSize100x260, 热键
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

        Gui, Add, Edit,x30 y240 w70 vstartfont Choose,%startfont%

        Gui Add, Text, x110 y240 w50 h20, 全局延迟
        Gui Add, edit, x165 y240 w30 valltime , %alltime%

        Gui, Add, Radio, x10 y270 w70 h20 voption1, 副本

        Gui, Add, Radio, x90 y270 w70 h20 voption2, 奶T
        
        Gui, Add, Radio, x180 y270 w70 h20 voption3, 野外

        Gui Add, Button, x60 y300 w50 h30 gSaveButton default, 保存

        Gui Add, Button, x120 y300 w50 h30 gaboutButton default, 说明

        ;/此处判断配置文件是否保存过优先模式，如果有，则对gui页面控件调整，如果没有设置全局延迟为26
        if(option=="副本")
        {
            GuiControl,, Option1, 1
        }
        Else
            if(option=="奶T")
        {
            GuiControl,, Option2, 1
        }
         Else
            if(option=="野外")
        {
            GuiControl,, Option3, 1
        }
        Else
        {
            GuiControl,, alltime, 26
        }
        Gui Show
    }
return

aboutButton:

    msgbox 本程序由哔站Melis大佬免费开源`n 相关bd可搜索星岬岛、ezgame等网站`n 唯一发布地址bilibili，百度云
    Run, https://space.bilibili.com/1612761/dynamic

return

SaveButton:
    gui Submit
    saveType := "Hotkeys"

    ;/获得gui页面选项参数，判断bd类型
    GuiControlGet, option1Status, , option1, 1
    GuiControlGet, option2Status, , option2, 1
    GuiControlGet, option3Status, , option3, 1

    if(option1Status==1)
    {
        type:="副本sleep"
        IniWrite, %alltime%, %iniFilePath% , %type%, alltime
        IniWrite, "副本", %iniFilePath%, mode, Option
    }
  
        if(option2Status==1)
    {
        type:="奶Tsleep"
        IniWrite, %alltime%, %iniFilePath% , %type%, alltime
        IniWrite, "奶T", %iniFilePath%, mode, Option
    }

        
        if(option3Status==1)
    {
        type:="野外sleep"
        IniWrite, %alltime%, %iniFilePath% , %type%, alltime
        IniWrite, "野外", %iniFilePath%, mode, Option
    }
    

  
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

    IniWrite, %startfont%, %iniFilePath%, %saveType%, startfont

    Reload

return

GetPixelColor(x,y) ;自定义函数GetColor：即用于获取坐标（X，Y）色值
{
    PixelGetColor, color, x, y, RGB
    ; StringRight color,color,8
return color ;返回变量color

}

SendLoop(key, loopCount) {
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
    sleep, (loopCount-alltime)

}

jump(jumptime)
{

    tooltip "跳过"
    sleep, jumptime
    tooltip

}

getcolor(types,names,skill)
{
    MouseGetPos, xpos, ypos
    mousemove, xpos, ypos - 200
    PixelGetColor, color, %xpos%, %ypos%, RGB
    ; 保存数据到INI文件
    IniWrite, %xpos%, %iniFilePath%, %types%, %names%%skill%x
    IniWrite, %ypos%, %iniFilePath%, %types%, %names%%skill%y
    IniWrite, %color%, %iniFilePath%, %types%, %names%%skill%color
    mousemove, xpos, ypos
    tooltip "获取完毕"
    sleep 200
    tooltip
}