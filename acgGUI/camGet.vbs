' Script for cimcurventing Windows telnet client's lack of pipes to controll VLC
Dim ObjArgs : Set ObjArgs = WScript.Arguments
Dim objShell : Set objShell = CreateObject("Wscript.Shell")
objShell.Run "cmd.exe",1,False
WScript.Sleep 1000
objShell.SendKeys "telnet localhost 4444 -a"
WScript.Sleep 500
objShell.SendKeys "{ENTER}"

WScript.Sleep 500
objShell.SendKeys ObjArgs.Item(0)

WScript.Sleep 500
objShell.SendKeys "{ENTER}"

if ObjArgs.Count = 2 then
WScript.Sleep 500
objShell.SendKeys ObjArgs.Item(1)
WScript.Sleep 500
objShell.SendKeys "{ENTER}"
end if

WScript.Sleep 500
objShell.SendKeys "{ENTER}"

WScript.Sleep 500
objShell.SendKeys "exit"

WScript.Sleep 500
objShell.SendKeys "{ENTER}"