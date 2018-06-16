
_Send_Keypress_Controllers_on_off()

Exit

Func _Send_Keypress_Controllers_on_off()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{F5 down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{F5 up}")
EndFunc