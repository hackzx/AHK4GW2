Home::Suspend
return

^I::
AHK_ID1:= WinExist("A")
return

1::
ControlSend,, {x}, ahk_id %AHK_ID1%
sleep 250
ControlSend,, {r}, ahk_id %AHK_ID1%
sleep 200
ControlSend,, {1}, ahk_id %AHK_ID1%
sleep 200
return

2::
ControlSend,, {g}, ahk_id %AHK_ID1%
sleep 500
ControlSend,, {r}, ahk_id %AHK_ID1%
sleep 200
ControlSend,, {1}, ahk_id %AHK_ID1%
sleep 200
return

3::
ControlSend,, {z}, ahk_id %AHK_ID1%
sleep 200
ControlSend,, {3}, ahk_id %AHK_ID1%
return

e::
ControlSend,, {e}, ahk_id %AHK_ID1%
sleep 100
ControlSend,, {z}, ahk_id %AHK_ID1%
sleep 100
return

z::
ControlSend,, {z}, ahk_id %AHK_ID1%
sleep 100
ControlSend,, {1}, ahk_id %AHK_ID1%
sleep 100
return




End::
sleep,200
EXITAPP
return