
_Send_Keypress_Mouse_cursor_on_off()

Exit

Func _Send_Keypress_Mouse_cursor_on_off()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{F1 down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{F1 up}")
EndFunc