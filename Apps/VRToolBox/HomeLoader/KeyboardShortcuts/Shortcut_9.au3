
_Send_Keypress_Recenter_view()

Exit

Func _Send_Keypress_Recenter_view()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{F2 down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{F2 up}")
EndFunc