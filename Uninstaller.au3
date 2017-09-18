
#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <File.au3>


Global $Install_DIR = @ScriptDir & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $Config_INI = $System_DIR & "config.ini"

Global $Steam_tools_vrmanifest_File = IniRead($Config_INI, "Folders", "Steam_tools_vrmanifest", "")

Global $Array_tools_vrmanifest_File, $Line_NR_binary_path_windows

_Uninstal_HomeLoader()
_Start_Uninstal()
_Exit()

Func _Uninstal_HomeLoader() ; SteamVR Home
	Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Uninstall HomeLoader", "Do you want to restore the default SteamVR Home app first?" & @CRLF)

	If $Abfrage = 6 Then
		_Restore_default_SteamVR_Home_app()
	Else
		_Exit()
	EndIf
EndFunc

Func _Restore_default_SteamVR_Home_app()
	_FileReadToArray($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File)

	FileDelete($Steam_tools_vrmanifest_File)

    For $LOOP_vrmanifest = 1 To $Array_tools_vrmanifest_File[0]
		$ReadLine_tools_vrmanifest = $Array_tools_vrmanifest_File[$LOOP_vrmanifest]
		If $ReadLine_tools_vrmanifest = '			"app_key": "openvr.tool.steamvr_environments",' Then
			Local $Line_NR_binary_path_windows = $LOOP_vrmanifest + 3
		EndIf

		If $LOOP_vrmanifest = $Line_NR_binary_path_windows Then
			$NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
			FileWriteLine($Steam_tools_vrmanifest_File, $NewLine)
		Else
			FileWriteLine($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File[$LOOP_vrmanifest])
		EndIf
    Next
EndFunc

Func _Start_Uninstal()
	If FileExists($Install_DIR & "Uninstall Files.exe") Then
		ShellExecuteWait($Install_DIR & "Uninstall Files.exe")
	EndIf
	Sleep(1000)
	DirRemove($Install_DIR & "ApplicationList", 1)
	DirRemove($Install_DIR & "Icons", 1)
	DirRemove($Install_DIR & "System", 1)
	DirRemove($Install_DIR & "WebPage", 1)
	FileDelete($Install_DIR & "Uninstaller.exe")
	FileDelete($Install_DIR & "Uninstaller.au3")
	FileDelete($Install_DIR & "Uninstal.exe")
	Sleep(500)
	If FileExists($Install_DIR & "Uninstal.exe") Then FileDelete($Install_DIR & "Uninstal.exe")
	DirRemove($Install_DIR, 1)
	Exit
EndFunc

Func _Exit()
	Exit
EndFunc

