
_Send_Keypress_DOWN()

Exit

Func _Send_Keypress_DOWN()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{DOWN down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{DOWN up}")
EndFunc