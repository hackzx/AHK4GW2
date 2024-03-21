#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;------------------------------------
;以下为兔子弹跳宏，站在原地不要上坐骑,按一下F5即可
F5::
{
send {7 down}  ;7为兔子快捷键
sleep 100
send {7 Up}  ;7为兔子快捷键
sleep 1200
send {XButton2 down}  ;XButton2为技能条最右边下坐骑的快捷键，技能名称“跳下”
sleep 75
send {1 down}    ;1为1技能的快捷键
sleep 90
send {XButton2 Up}  ;XButton2为技能条最右边下坐骑的快捷键，技能名称“跳下”
sleep 28
send {1 up}   ;1为1技能的快捷键
sleep 1070    ;此数值决定了成功率，可在1000-1150 毫秒之间尝试,如果人物攻击了就要降低此数值
send {- down}  ;-为飞龙快捷键
sleep 100
send {- up}  ;-为飞龙快捷键
sleep 0
}
;当成功以后技能4、5会变成飞天麟龙的技能，此时狂按空格键即可无限攀升，达到自己想要的高度以后，多按几下下狮鹫快捷键即可上狮鹫

;以下为飞天麟龙切狮鹫无限攀升宏，没有兔子弹射宏成功率高，且麻烦
F6::
{
  

;先上飞龙离开地面，不要太高，否则成功率很低
send {- down} ;-为飞龙快捷键
sleep 10
send {0 down}  ;0为狮鹫快捷键
sleep 10
send {1 down}  ;1就是1技能的快捷键
sleep 10
send {space down}   ;空格都是通用不用动
sleep 10
send {1 Up}   ;1就是1技能的快捷键
sleep 0
send {space Up}   ;空格都是通用不用动
sleep 0
send {- up}   ;-为飞龙快捷键
sleep 0
send {0 up}     ;0为狮鹫快捷键
sleep 0
}
;成功以后人物会自动骑上飞天麟龙无限攀升，达到自己想要的高度以后，多按几下下狮鹫快捷键即可上狮鹫 


