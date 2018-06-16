
_Send_Keypress_Detach_app()

Exit

Func _Send_Keypress_Detach_app()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{P down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{P up}")
EndFunc