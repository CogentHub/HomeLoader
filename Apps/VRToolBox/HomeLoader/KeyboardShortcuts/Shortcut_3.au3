
_Send_Keypress_Wrap_cylinder()

Exit

Func _Send_Keypress_Wrap_cylinder()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{C down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{C up}")
EndFunc