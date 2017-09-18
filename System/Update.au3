#include <WindowsConstants.au3>
#include <InetConstants.au3>
#include <File.au3>
#include "_Zip.au3"

Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $System_DIR = $Install_DIR & "\System\"
Global $Config_INI = $System_DIR & "config.ini"
Global $Config_NEW_INI = $System_DIR & "config_NEW.ini"
Global $Version = IniRead($config_ini, "Settings", "Version", "")
Global $Version_Right = StringRight($Version, 2)

Global $UpdateFolder = $System_DIR & "Update\"
Global $UpdateTargetFolder = $Install_DIR
Global $Update_ZIP = $System_DIR & "TEMP.zip"
Global $Changelog_TXT = $System_DIR & "Changelog.txt"

Global $Read_Version, $Read_Show_Settings_at_Startup, $Read_Advanced_Settings , $Read_USE_GUI, $Read_Minimize_Oculus, $Read_Time_Interval, $Read_First_Start
Global $Read_Steam_Library, $Read_ButtonTAB_State, $Read_USE_PHP_WebServer, $Read_ChangeDefaultSteamVRHome, $Read_USE_Key_Presses, $Read_Reload_HOMEonExit
Global $Read_Add_PlayersOnline_to_Icons, $Read_Add_SS_to_Icons, $Read_Add_SS_per_game, $Read_Start_HomeLoader_with_HomeApp, $Read_TAB1_Name, $Read_TAB2_Name
Global $Read_TAB3_Name, $Read_TAB4_Name, $Read_TAB5_Name, $Read_TAB6_Name, $Read_Install_Folder_Steam_1, $Read_Install_Folder_Steam_2, $Read_Install_Folder_Steam_3
Global $Read_Install_Folder_Steam_4, $Read_Install_Folder_Steam_5, $Read_Steam_default_vrsettings, $Read_Steam_tools_vrmanifest, $Read_Icon_Folder_1, $Read_Icon_Folder_2
Global $Read_Icon_Folder_3, $Read_Home_Path, $Read_WindowName


_Changelog()
;_Restart_Settings_GUI()


Func _Changelog()
	Global $Backup_File = $Install_DIR & "Backups\Home_Loader_0." & $Version_Right - 1 & "\config.ini"
	Global $Backup_Version = "0." & $Version_Right - 1
	If Not FileExists($Backup_File) Then $Backup_File = $Install_DIR & "Backups\Home_Loader_0." & $Version_Right - 2 & "\"
	If Not FileExists($Backup_File) Then Global $Backup_Version = "0." & $Version_Right - 2
	If Not FileExists($Backup_File) Then $Backup_File = $Install_DIR & "Backups\Home_Loader_0." & $Version_Right - 3 & "\"
	If Not FileExists($Backup_File) Then Global $Backup_Version = "0." & $Version_Right - 3
	If Not FileExists($Backup_File) Then $Backup_File = $Install_DIR & "Backups\Home_Loader_0." & $Version_Right - 4 & "\"
	If Not FileExists($Backup_File) Then Global $Backup_Version = "0." & $Version_Right - 4
	If Not FileExists($Backup_File) Then $Backup_File = $Install_DIR & "Backups\Home_Loader_0." & $Version_Right - 5 & "\"
	If Not FileExists($Backup_File) Then Global $Backup_Version = "0." & $Version_Right - 5

	$NR_Lines = _FileCountLines($Changelog_TXT)
	$Changelog_Value = ""
	For $LOOP_Changelog = 1 To $NR_Lines
		$Changelog_Value = FileReadLine($Changelog_TXT, $LOOP_Changelog)
		If $LOOP_Changelog = 1 Then $Changelog = $Changelog_Value
		If $LOOP_Changelog <> 1 Then $Changelog = $Changelog & @CRLF & $Changelog_Value
	Next

	$Abfrage = MsgBox($MB_YESNOCANCEL + $MB_ICONINFORMATION, "Changelog", "New in Home Loader " & $Version & ":" & @CRLF & _
																					$Changelog & @CRLF & _
																					"" & @CRLF & @CRLF & _
																					"Restore Settings [from previous Version]:" & @CRLF & _
																					"Do you want to restore your settings from previous Version?" & @CRLF & @CRLF & _
																					"Backup File that will be used:" & @CRLF & $Backup_File)

	If $Abfrage = 6 Then
		If Not FileExists($Backup_File) Then MsgBox($MB_ICONWARNING, "Backup File missing", "Backup file is missing to be able to restore the settings.")

		If FileExists($Backup_File) Then
			_Read_from_Backup_INI()
			_Write_to_Target_INI()
				MsgBox($MB_ICONINFORMATION, "Settings restored", "Home Loader settings from version '" & $Backup_Version & "' restored.")
		Else
			MsgBox($MB_ICONWARNING, "Backup File missing", "Backup file is missing to be able to restore the settings.")
		EndIf
	EndIf
EndFunc

Func _Read_from_Backup_INI()
	;$Read_Version = IniRead($Backup_File, "Settings", "Version", "")
	$Read_Show_Settings_at_Startup = IniRead($Backup_File, "Settings", "Show_Settings_at_Startup", "")
	$Read_Advanced_Settings = IniRead($Backup_File, "Settings", "Advanced_Settings", "")
	$Read_USE_GUI = IniRead($Backup_File, "Settings", "USE_GUI", "")
	$Read_Minimize_Oculus = IniRead($Backup_File, "Settings", "Minimize_Oculus", "")
	$Read_Time_Interval = IniRead($Backup_File, "Settings", "Time_Interval", "")
	$Read_First_Start = IniRead($Backup_File, "Settings", "First_Start", "")
	$Read_Steam_Library = IniRead($Backup_File, "Settings", "Steam_Library", "")
	$Read_ButtonTAB_State = IniRead($Backup_File, "Settings", "ButtonTAB_State", "")
	$Read_USE_PHP_WebServer = IniRead($Backup_File, "Settings", "USE_PHP_WebServer", "")
	$Read_ChangeDefaultSteamVRHome = IniRead($Backup_File, "Settings", "ChangeDefaultSteamVRHome", "")
	$Read_USE_Key_Presses = IniRead($Backup_File, "Settings", "USE_Key_Presses", "")
	$Read_Reload_HOMEonExit = IniRead($Backup_File, "Settings", "Reload_HOMEonExit", "")
	$Read_Add_PlayersOnline_to_Icons = IniRead($Backup_File, "Settings", "Add_PlayersOnline_to_Icons", "")
	$Read_Add_SS_to_Icons = IniRead($Backup_File, "Settings", "Add_SS_to_Icons", "")
	$Read_Add_SS_per_game = IniRead($Backup_File, "Settings", "Add_SS_per_game", "")
	$Read_Start_HomeLoader_with_HomeApp = IniRead($Backup_File, "Settings", "Start_HomeLoader_with_HomeApp", "")
	$Read_TAB1_Name = IniRead($Backup_File, "Settings", "TAB1_Name", "")
	$Read_TAB2_Name = IniRead($Backup_File, "Settings", "TAB2_Name", "")
	$Read_TAB3_Name = IniRead($Backup_File, "Settings", "TAB3_Name", "")
	$Read_TAB4_Name = IniRead($Backup_File, "Settings", "TAB4_Name", "")
	$Read_TAB5_Name = IniRead($Backup_File, "Settings", "TAB5_Name", "")
	$Read_TAB6_Name = IniRead($Backup_File, "Settings", "TAB6_Name", "")
	$Read_Install_Folder_Steam_1 = IniRead($Backup_File, "Folders", "Install_Folder_Steam_1", "")
	$Read_Install_Folder_Steam_2 = IniRead($Backup_File, "Folders", "Install_Folder_Steam_2", "")
	$Read_Install_Folder_Steam_3 = IniRead($Backup_File, "Folders", "Install_Folder_Steam_3", "")
	$Read_Install_Folder_Steam_4 = IniRead($Backup_File, "Folders", "Install_Folder_Steam_4", "")
	$Read_Install_Folder_Steam_5 = IniRead($Backup_File, "Folders", "Install_Folder_Steam_5", "")
	$Read_Steam_default_vrsettings = IniRead($Backup_File, "Folders", "Steam_default_vrsettings", "")
	$Read_Steam_tools_vrmanifest = IniRead($Backup_File, "Folders", "Steam_tools_vrmanifest", "")
	$Read_Icon_Folder_1 = IniRead($Backup_File, "Folders", "Icon_Folder_1", "")
	$Read_Icon_Folder_2 = IniRead($Backup_File, "Folders", "Icon_Folder_2", "")
	$Read_Icon_Folder_3 = IniRead($Backup_File, "Folders", "Icon_Folder_3", "")
	$Read_Home_Path = IniRead($Backup_File, "Settings_HomeAPP", "Home_Path", "")
	$Read_WindowName = IniRead($Backup_File, "Settings_HomeAPP", "WindowName", "")
EndFunc

Func _Write_to_Target_INI()
	;IniWrite($Config_NEW_INI, "Settings", "Version", $Read_Version)
	IniWrite($Config_NEW_INI, "Settings", "Show_Settings_at_Startup", $Read_Show_Settings_at_Startup)
	IniWrite($Config_NEW_INI, "Settings", "Advanced_Settings", $Read_Advanced_Settings)
	IniWrite($Config_NEW_INI, "Settings", "USE_GUI", $Read_USE_GUI)
	IniWrite($Config_NEW_INI, "Settings", "Minimize_Oculus", $Read_Minimize_Oculus)
	IniWrite($Config_NEW_INI, "Settings", "Time_Interval", $Read_Time_Interval)
	IniWrite($Config_NEW_INI, "Settings", "First_Start", $Read_First_Start)
	IniWrite($Config_NEW_INI, "Settings", "Steam_Library", $Read_Steam_Library)
	IniWrite($Config_NEW_INI, "Settings", "ButtonTAB_State", $Read_ButtonTAB_State)
	IniWrite($Config_NEW_INI, "Settings", "USE_PHP_WebServer", $Read_USE_PHP_WebServer)
	IniWrite($Config_NEW_INI, "Settings", "ChangeDefaultSteamVRHome", $Read_ChangeDefaultSteamVRHome)
	IniWrite($Config_NEW_INI, "Settings", "USE_Key_Presses", $Read_USE_Key_Presses)
	IniWrite($Config_NEW_INI, "Settings", "Reload_HOMEonExit", $Read_Reload_HOMEonExit)
	IniWrite($Config_NEW_INI, "Settings", "Add_PlayersOnline_to_Icons", $Read_Add_PlayersOnline_to_Icons)
	IniWrite($Config_NEW_INI, "Settings", "Add_SS_to_Icons", $Read_Add_SS_to_Icons)
	IniWrite($Config_NEW_INI, "Settings", "Add_SS_per_game", $Read_Add_SS_per_game)
	IniWrite($Config_NEW_INI, "Settings", "Start_HomeLoader_with_HomeApp", $Read_Start_HomeLoader_with_HomeApp)
	IniWrite($Config_NEW_INI, "Settings", "TAB1_Name", $Read_TAB1_Name)
	IniWrite($Config_NEW_INI, "Settings", "TAB2_Name", $Read_TAB2_Name)
	IniWrite($Config_NEW_INI, "Settings", "TAB3_Name", $Read_TAB3_Name)
	IniWrite($Config_NEW_INI, "Settings", "TAB4_Name", $Read_TAB4_Name)
	IniWrite($Config_NEW_INI, "Settings", "TAB5_Name", $Read_TAB5_Name)
	IniWrite($Config_NEW_INI, "Settings", "TAB6_Name", $Read_TAB6_Name)
	IniWrite($Config_NEW_INI, "Settings", "Install_Folder_Steam_1", $Read_Install_Folder_Steam_1)
	IniWrite($Config_NEW_INI, "Settings", "Install_Folder_Steam_2", $Read_Install_Folder_Steam_2)
	IniWrite($Config_NEW_INI, "Settings", "Install_Folder_Steam_3", $Read_Install_Folder_Steam_3)
	IniWrite($Config_NEW_INI, "Settings", "Install_Folder_Steam_4", $Read_Install_Folder_Steam_4)
	IniWrite($Config_NEW_INI, "Settings", "Install_Folder_Steam_5", $Read_Install_Folder_Steam_5)
	IniWrite($Config_NEW_INI, "Settings", "Steam_default_vrsettings", $Read_Steam_default_vrsettings)
	IniWrite($Config_NEW_INI, "Settings", "Steam_tools_vrmanifest", $Read_Steam_tools_vrmanifest)
	IniWrite($Config_NEW_INI, "Settings", "Icon_Folder_1", $Read_Icon_Folder_1)
	IniWrite($Config_NEW_INI, "Settings", "Icon_Folder_2", $Read_Icon_Folder_2)
	IniWrite($Config_NEW_INI, "Settings", "Icon_Folder_3", $Read_Icon_Folder_3)
	IniWrite($Config_NEW_INI, "Settings", "Home_Path", $Read_Home_Path)
	IniWrite($Config_NEW_INI, "Settings", "WindowName", $Read_WindowName)
EndFunc

Func _Restart_Settings_GUI()
	If FileExists($System_DIR & "Settings.exe") Then
		ShellExecute($System_DIR & "Settings.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "Settings.au3", "", $System_DIR)
	EndIf
	IniWrite($config_ini, "TEMP", "Update", "Done, delete Update")
	If FileExists($UpdateFolder) Then DirRemove($UpdateFolder, $DIR_REMOVE)
	If FileExists($Update_ZIP) Then FileDelete($Update_ZIP)
	Exit
EndFunc

