
_Send_Keypress_Use_webcam()

Exit

Func _Send_Keypress_Use_webcam()
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{W down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{W up}")
EndFunc