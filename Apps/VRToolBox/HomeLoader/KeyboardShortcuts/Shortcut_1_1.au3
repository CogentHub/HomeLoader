
_Send_Keypress_up()

Exit

Func _Send_Keypress_up()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{UP down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{UP up}")
EndFunc