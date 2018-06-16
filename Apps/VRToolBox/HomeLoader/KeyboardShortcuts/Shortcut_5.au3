
_Send_Keypress_Resize_Screen()

Exit

Func _Send_Keypress_Resize_Screen()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{S down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{S up}")
EndFunc