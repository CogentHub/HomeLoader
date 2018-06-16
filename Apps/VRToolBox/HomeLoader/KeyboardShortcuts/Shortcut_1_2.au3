
_Send_Keypress_RIGHT()

Exit

Func _Send_Keypress_RIGHT()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{RIGHT down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{RIGHT up}")
EndFunc