
_Send_Keypress_Focus_Screen()

Exit

Func _Send_Keypress_Focus_Screen()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{F down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{F up}")
EndFunc