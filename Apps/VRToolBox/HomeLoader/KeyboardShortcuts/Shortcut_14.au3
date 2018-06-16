
_Send_Keypress_Debug_textures_lighting()

Exit

Func _Send_Keypress_Debug_textures_lighting()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{F9 down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{F9 up}")
EndFunc