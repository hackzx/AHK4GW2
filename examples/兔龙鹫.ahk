$F5::

send {space up}
sleep 66
send {space down}
sleep 800
send {F3}
sleep 66
send {space up}
sleep 66
send {space down}
sleep 100
send {w}
sleep 100
send {F3}
sleep 600
return

将此宏复制到文本文档，用AHK打开，将F3改为你的狮鹫键，w改为滑翔增益键。按住F5键即可无限爬升。

另外分享一个兔子弹射宏：
$F6::

send,{F2 down}
sleep,63
send,{f2 up}
sleep,500

send,{space down}
sleep,600
send,{f4 down}
sleep,81
send,{f4 up}
sleep,56
send,{space up}
sleep 1300

send {space down}
sleep 66
send {space up}

sleep 66

send {w}
sleep 1288
send {F3}
return
其中F2是兔子，F3是狮鹫，W是滑翔弹射技能