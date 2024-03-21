Home::Suspend
SetKeyDelay, 0

;以下代码可以设置两个键作为开关，如果使用请删除/*和*/ 以及下面的 CapsLock::
/*
CapsLock::SetTimer,TagCX,0  ;此行代码的意思是按下CapsLock键开启脚本
XButton2::SetTimer,TagCX,off  ;此行代码的意思是按下鼠标前侧键停止脚本
*/
CapsLock:: ;该脚本的开关键
SoundPlay, *-2   ;添加一个按键提示音不需要可删除

if(a:=!a)
{
SetTimer,TagCX,1
ToolTip, 开, 1205, 911, WhichToolTip  ;在人物中间添加 开  字，不需要可删除
}
else
{
SetTimer,TagCX,off
ToolTip, 关, 1205, 1100, WhichToolTip  ;在人物下方添加 关 字 3秒后消失，不需要可删除
SetTimer, RemoveToolTip, -3000
}
Return

TagCX:
	              if (GetColor(1062,1366)=="0x698D85") ; 取第三个豆子满的状态
	{
	send {3}
	sleep 200
	}

	else{ 
		if (GetColor(1013,1251)=="0xA2F4FF")
	{
	send {4}
	sleep 200
}
}
	
	return
RemoveToolTip:
ToolTip
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