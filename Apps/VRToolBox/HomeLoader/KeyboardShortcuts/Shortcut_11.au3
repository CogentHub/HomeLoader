
_Send_Keypress_Camera_pass_through()

Exit

Func _Send_Keypress_Camera_pass_through()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{F4 down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{F4 up}")
EndFunc