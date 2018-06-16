
Global $Install_DIR = StringReplace(@ScriptDir, 'Apps\VRToolBox\HomeLoader', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"

_Launch_HomeLoaderLibrary()
Sleep(1000)
_Send_Keypress_Detach_app()

Exit

Func _Launch_HomeLoaderLibrary()
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
	EndIf
EndFunc

Func _Send_Keypress_Detach_app()
	WinActive("HomeLoader - Library")
	Send("{CTRLDOWN}")
	Send("{SHIFTDOWN}")
	Send("{P down}")
	Sleep(100)
	Send("{SHIFTUP}")
	Send("{CTRLUP}")
	Send("{P up}")
EndFunc