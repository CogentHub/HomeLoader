
_Send_Keypress_Wireframe()

Exit

Func _Send_Keypress_Wireframe()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{F10 down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{F10 up}")
EndFunc