SetKeyDelay, 0 ; 延时为 -1 则从不休眠. 为了提高可靠性, 推荐使用 0 而不是 -1


CapsLock:: ;该脚本的开关键 

SoundPlay, *-2   ;添加一个按键提示音不需要可删除

if(a:=!a)
{
SetTimer,TagCX,1
}
else
{
SetTimer,TagCX,off
}
Return

TagCX:
	              if (GetColor(1186,1365)=="0x51ACEA") 
	{
	send {5}
	sleep 200  ;毫秒 1秒=1000毫秒
  send {5}
	sleep 200
  send {5}
	sleep 200
  send {5}
	sleep 200
	send {5}
	sleep 80
	}

              if (GetColor(1006,1366)=="0x180165") 
	{
	send {2}
	sleep 200 ;毫秒 1秒=1000毫秒
	}

             if (GetColor(1508,1368)=="0xFFFFFF") 
	{
	send {r}
	sleep 200 ;毫秒 1秒=1000毫秒
	}



return


F10::
;F1是热键，按F1触发下?的功能
MouseGetPos, mouseX, mouseY
;获取?标的横坐标和纵坐标赋值给mouseX和mouseY
PixelGetColor, color, %mouseX%, %mouseY%, RGB
;获取横坐标和纵坐标（即mouseX和mouseY）的颜?值并赋值给color
clipboard = (%mouseX%,%mouseY%)=="%color%"
;复制（?便粘贴数据） mouseX,mouseY==color
tooltip, %mouseX%，%mouseY%颜?是：%color%?标所在XY值和颜?值已发送到剪贴板。`n5秒后?动消失`n请粘贴到指定位置`n
sleep 5000  ;休眠5秒让tip显?5秒
tooltip ;5秒后去掉浮框提?
return  ;结束

GetColor(x,y) ;自定义函数GetColor：即用于获取坐标（X，Y）色值

{

PixelGetColor, color, x, y, RGB  ;获取指定的 x, y 坐标处像素的颜色到color变量内，格式为RGB

StringRight color,color,10 ;从第二个变量color的右边提取10个字符到第一个变量color.例0xFFFFFF一共只有8个字符，超过字符长度则会提取完整内容

return color ;返回变量color

} 