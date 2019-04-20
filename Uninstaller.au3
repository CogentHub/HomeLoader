
#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <File.au3>

Global $Install_DIR = @ScriptDir & "\"
Global $System_DIR = $Install_DIR & "System\"
;Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
;If Not FileExists($Config_INI) Then FileCopy($System_DIR & "config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Config_INI = $System_DIR & "config.ini"

Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
Global $Steam_Path = StringReplace($Steam_Path_REG, '/', '\') & "\"
Global $SteamVR_Path = $Steam_Path & "SteamApps\common\SteamVR\"

Global $Steam_tools_vrmanifest_File = IniRead($Config_INI, "Folders", "Steam_tools_vrmanifest", "")

Global $Array_tools_vrmanifest_File, $Line_NR_binary_path_windows


Local $Abfrage_uninstall = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Uninstall HomeLoader", "Do you really want to uninstall HomeLoader?" & @CRLF)

If $Abfrage_uninstall = 6 Then
	_Restore_default_SteamVR_Home_app()
	_Start_Uninstall()
	;_Delete_Settings_Files_AppData()
	_Delete_HomeLoader_SteamVR_Environment_Folders()
	_Validate_SteamVR_Files()
	;MsgBox($MB_OK + $MB_ICONINFORMATION, "Uninstalled", "The default SteamVR Home APP / SteamVR Settings has been restored and HomeLoader has been successfully uninstalled." & @CRLF)
	_Exit()
Else
	_Exit()
EndIf

Func _Restore_default_SteamVR_Home_app()
	If FileExists($Steam_tools_vrmanifest_File & ".bak") Then
		FileCopy($Steam_tools_vrmanifest_File & ".bak", $Steam_tools_vrmanifest_File, $FC_CREATEPATH + $FC_OVERWRITE)
	Else
		If FileExists($Install_DIR & "HomeLoader.exe") Then
			ShellExecute($Install_DIR & "HomeLoader.exe", "Uninstall_HomeLoader")
		EndIf
	EndIf
EndFunc

Func _Start_Uninstall()
	DirRemove($Install_DIR & "ApplicationList", 1)
	Sleep(50)
	DirRemove($Install_DIR & "Apps", 1)
	Sleep(50)
	DirRemove($Install_DIR & "Icons", 1)
	Sleep(50)
	DirRemove($Install_DIR & "System", 1)
	Sleep(50)
	DirRemove($Install_DIR & "WebPage", 1)
	Sleep(100)
	FileDelete($Install_DIR & "HomeLoader.exe")
	Sleep(200)
	DirRemove($Install_DIR, $DIR_REMOVE)
EndFunc

Func _Delete_Settings_Files_AppData()
	Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Delete HomeLoader Settings", "Do you want to delete the HomeLoader Settings File located in " & @CRLF & _
																							$Config_INI	& "?" & @CRLF)

	If $Abfrage = 6 Then
		Local $HomeLoader_Settings_Folder = StringReplace($Config_INI, 'config.ini', '')
		DirRemove($HomeLoader_Settings_Folder, $DIR_REMOVE)
	Else
		Sleep(100)
	EndIf
EndFunc

Func _Delete_HomeLoader_SteamVR_Environment_Folders()
	Local $SteamVR_Environment_Name = "homeloader"

	Local $HomeLoader_content_Folder = $SteamVR_Path & "tools\steamvr_environments\content\steamtours_addons\" & $SteamVR_Environment_Name & "\"
	Local $HomeLoader_game_Folder = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\" & $SteamVR_Environment_Name & "\"

	If FileExists($HomeLoader_game_Folder) Then
		Local $Abfrage_delete = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Delete HomeLoader SteamVR Environment Folder", "HomeLoader SteamVR Environment Folder found. " & _
																		"Do you want to delete the HomeLoader SteamVR Environment Folder too?" & @CRLF)

		If $Abfrage_delete = 6 Then
			If FileExists($HomeLoader_content_Folder) Then DirRemove($HomeLoader_content_Folder, $DIR_REMOVE)
			If FileExists($HomeLoader_game_Folder) Then DirRemove($HomeLoader_game_Folder, $DIR_REMOVE)
		EndIf
	EndIf
EndFunc

Func _Validate_SteamVR_Files()
	Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONINFORMATION, "HomeLoader uninstalled", "The default SteamVR Home APP has been restored and HomeLoader has been successfully uninstalled." & @CRLF & @CRLF & _
															"Verify the local SteamVR files:" & @CRLF & _
															"If you did have any problem or if you will experience any problem in the future then Steam can verify the local SteamVR files and if needed restore the settings." & @CRLF & _
															"This process may take a few seconds." & @CRLF & @CRLF & _
															"This can be done at any time by using the uninstaller again or in the 'HomeLoader SteamVR Start Settings' Window and with Steam in the app properties window of SteamVR." & @CRLF & @CRLF & _
															'Do you want to verify your local SteamVR files?' & @CRLF)

	If $Abfrage = 6 Then
		ShellExecuteWait("steam://validate/250820")
	EndIf
EndFunc

Func _Exit()
	Exit
EndFunc

