
_Send_Keypress_LEFT()

Exit

Func _Send_Keypress_LEFT()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{LEFT down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{LEFT up}")
EndFunc