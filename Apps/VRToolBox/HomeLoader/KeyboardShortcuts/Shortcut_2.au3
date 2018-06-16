
_Send_Keypress_FPS_Mode()

Exit

Func _Send_Keypress_FPS_Mode()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{SPACE down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{SPACE up}")
EndFunc