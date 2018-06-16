
_Send_Keypress_Camera_stabilization()

Exit

Func _Send_Keypress_Camera_stabilization()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{F11 down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{F11 up}")
EndFunc