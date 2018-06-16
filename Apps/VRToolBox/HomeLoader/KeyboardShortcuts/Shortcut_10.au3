
_Send_Keypress_Change_stereo_mode()

Exit

Func _Send_Keypress_Change_stereo_mode()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{F3 down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{F3 up}")
EndFunc