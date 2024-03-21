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
	              if (GetColor(1116,1269)=="0xFF80FF") ; 取第三个豆子满的状态
	{
	send {z}
	sleep 100
	send {x}
	sleep 100
	}

	else{
               if (GetColor(1064,1368)=="0xD78DE1") ; 取狂刃风暴
	{
	send {3}
	sleep 200
	send {3}
	sleep 200
	send {3}
	sleep 40
	}
		               if (GetColor(1182,1367)=="0x65BCF4") ; 取幻影刺客
	{
	send {5}
	sleep 200
	send {5}
	sleep 200
	send {5}
	sleep 200
	send {5}
	sleep 200
	send {5}
	sleep 80
	}
  
      if (GetColor(1000,1367)=="0x0F045B") ; 取利刃呼唤
	{
	send {2}
	sleep 200
	send {2}
	sleep 200
	send {2}
	sleep 40
	}

	                if (GetColor(900,1389)=="0xBEBFAE" and GetColor(1000,1367)=="0x000000") ; 取切换武器键和2技能使用以后的
	{
	send `` 
	sleep 200
	}
	
	/*
	               if (GetColor(1064,1366)=="0xF498FF") ; 取心灵穿刺，之所以未加入循环是因为它是一个软控技能-50%移动速度，在副本某些场合不合适
	{
	send {3}
	sleep 100
	send {3}
	sleep 100
	}
	*/
	               if (GetColor(1125,1368)=="0x981959") ; 取幻影狂战
	{
	send {4}
	sleep 200
	send {4}
	sleep 200
	send {4}
	sleep 200
	}
	
	                if (GetColor(1005,1365)=="0xFFFEFF") ; 取镜像飞刃
	{
	send {2}
	sleep 200
	send {2}
	sleep 200
	send {2}
	sleep 200
	send {2}
	sleep 120
	}
	

			              if (GetColor(1508,1368)=="0xFFFFFF") ; 取苦痛咒语右上角数字2 的左下角的白色
	{
	send {r}
	sleep 100
	}


			              if (GetColor(1482,1367)=="0x7C0E5B") ; 取幻影除魔，用这个技能不用苦痛咒语的可以把 /*和*/删除掉
	{
	send {r}
	sleep 200
	send {r}
	sleep 200
	send {r}
	sleep 200
	send {r}
	sleep 160
	}


		              if (GetColor(1418,1367)=="0xBA3DA4") ; 取灾难法池
	{
	send {e}
	sleep 300
	send {e}
	sleep 300
	send {e}
	sleep 190
	}

									if (GetColor(1540,1367)=="0xFC4885") ; 取行动法池
	{
	send {t}
	sleep 300
	send {t}
	sleep 300
	send {t}
	sleep 200
	}
	
	
	
	;加入自动破蔑视，取boss前面蔑视条两个蓝色点	
			              if (GetColor(1111,128)=="0x42867A" or GetColor(1136,129)=="0x42877A") 
	{
	send {g} ;释放重力陷阱
	sleep 200
	send {g}
	sleep 300
	send {g}
	sleep 300
	send {g}
	sleep 200
	}
	
	;加入自动破蔑视，取boss蔑视条和第三个豆子颜色
			              if (GetColor(1116,1269)=="0xFF80FF" and GetColor(1136,129)=="0x42877A") 
	{
	send {c} ;释放时间沉降
	sleep 200
	}
	
	;加入自动破蔑视，取boss前面蔑视条15%位置和幻象之波颜色
			              if (GetColor(1190,1371)=="0xFFB5FF" and GetColor(1136,129)=="0x42877A") 
	{
	send {5} ;释放幻象之波
	sleep 200
	send {5}
	sleep 200
	send {5}
	sleep 240
	}
	
;加入自动破蔑视，取boss前面蔑视条15%位置和幻象还击颜色	
			              if (GetColor(1125,1382)=="0xE2C8E4" and GetColor(1136,129)=="0x42877A") 
	{
	send {4} ;释放幻象还击 释放还击按两下即为破蔑视的一个技能
	sleep 200
	send {4}
	sleep 200
	send {4}
	sleep 280
	}	
	
	
		              if (GetColor(910,1362)=="0x565756") ; 取切换武器使用以后的灰色 加入强制攻击
	{
	send {1}
	sleep 200
	}
	
		               if (GetColor(1184,1366)=="0x000000" and GetColor(1482,1368)=="0x000000") ; 取幻影刺客使用后和幻影除魔使用后
	{
	send {q}
	sleep 200
	send {q}
	sleep 200
	send {q}
	sleep 200
	send {q}
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