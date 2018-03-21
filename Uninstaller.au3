
#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <File.au3>

Global $Install_DIR = @ScriptDir & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
If Not FileExists($Config_INI) Then FileCopy($System_DIR & "config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)

Global $Steam_tools_vrmanifest_File = IniRead($Config_INI, "Folders", "Steam_tools_vrmanifest", "")

Global $Array_tools_vrmanifest_File, $Line_NR_binary_path_windows

_Uninstal_HomeLoader()
_Delete_Settings_File()
_Start_Uninstal()
_Exit()

Func _Uninstal_HomeLoader()
	Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Uninstall HomeLoader", "Do you want to restore the default SteamVR Home app first?" & @CRLF)

	If $Abfrage = 6 Then
		_Restore_default_SteamVR_Home_app()
	Else
		_Exit()
	EndIf
EndFunc

Func _Restore_default_SteamVR_Home_app()
	If FileExists($Steam_tools_vrmanifest_File & ".bak") Then
		FileCopy($Steam_tools_vrmanifest_File & ".bak", $Steam_tools_vrmanifest_File, $FC_CREATEPATH + $FC_OVERWRITE)
	EndIf
EndFunc

Func _Start_Uninstal()
	If FileExists($Install_DIR & "Uninstall Files.exe") Then
		ShellExecuteWait($Install_DIR & "Uninstall Files.exe")
	EndIf
	Sleep(200)
	DirRemove($Install_DIR & "ApplicationList", 1)
	Sleep(50)
	DirRemove($Install_DIR & "Icons", 1)
	Sleep(50)
	DirRemove($Install_DIR & "System", 1)
	Sleep(50)
	DirRemove($Install_DIR & "WebPage", 1)
	Sleep(50)
	FileDelete($Install_DIR & "Uninstaller.exe")
	Sleep(50)
	FileDelete($Install_DIR & "Uninstaller.au3")
	Sleep(200)
	DirRemove($Install_DIR, $DIR_REMOVE)
EndFunc

Func _Delete_Settings_File()
	Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Delete HomeLoader Settings", "Do you want to delete the HomeLoader Settings File located in " & @CRLF & _
																							$Config_INI	& "?" & @CRLF)

	If $Abfrage = 6 Then
		Local $HomeLoader_Settings_Folder = StringReplace($Config_INI, 'config.ini', '')
		DirRemove($HomeLoader_Settings_Folder, $DIR_REMOVE)
	Else
		Sleep(100)
	EndIf
EndFunc

Func _Exit()
	Exit
EndFunc

