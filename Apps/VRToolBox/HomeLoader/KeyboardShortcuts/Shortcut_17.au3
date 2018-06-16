
_Send_Keypress_Mirror_view_window()

Exit

Func _Send_Keypress_Mirror_view_window()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{F12 down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{F12 up}")
EndFunc