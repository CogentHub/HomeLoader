
_Send_Keypress_Take_screenshot()

Exit

Func _Send_Keypress_Take_screenshot()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{F8 down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{F8 up}")
EndFunc