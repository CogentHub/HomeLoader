
#Region Includes
;#include <File.au3>
;#include <Date.au3>
;#include <MsgBoxConstants.au3>
;#include <TrayConstants.au3>
#endregion

#Region Declare Variables/Const 1
;Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
;If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Config_INI = @ScriptDir & "\System\config.ini"

Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $Version = IniRead($Config_INI, "Settings", "Version", "")

Global $HTCVive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\HTC\HTC Vive\', "ViveHelperPath")
Global $HTCVive_Path_StringReplace_1 = StringReplace($HTCVive_Path_REG, 'PCClient\ViveportDesktopHelper.exe', '')
Global $HTCVive_Path = StringReplace($HTCVive_Path_StringReplace_1, '/', '\')

Global $Viveport_Bat_File_Folder = $installdir & "WebPage\Viveport\"

Global $PIN_HTML_GamePage_Value = IniRead($Config_INI, "Settings", "PIN_HTML_GamePage", "")

Global $Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "")

Global $Autostart_App_1_State = IniRead($Config_INI, "Autostart", "App_1_State", "")
Global $Autostart_App_2_State = IniRead($Config_INI, "Autostart", "App_2_State", "")
Global $Autostart_App_3_State = IniRead($Config_INI, "Autostart", "App_3_State", "")
Global $Autostart_App_4_State = IniRead($Config_INI, "Autostart", "App_4_State", "")
Global $Autostart_App_5_State = IniRead($Config_INI, "Autostart", "App_5_State", "")
Global $Autostart_App_6_State = IniRead($Config_INI, "Autostart", "App_6_State", "")
Global $Autostart_App_7_State = IniRead($Config_INI, "Autostart", "App_7_State", "")
Global $Autostart_App_8_State = IniRead($Config_INI, "Autostart", "App_8_State", "")
Global $Autostart_App_9_State = IniRead($Config_INI, "Autostart", "App_9_State", "")

Global $Autostart_App_1_Name = IniRead($Config_INI, "Autostart", "App_1_Name", "")
Global $Autostart_App_2_Name = IniRead($Config_INI, "Autostart", "App_2_Name", "")
Global $Autostart_App_3_Name = IniRead($Config_INI, "Autostart", "App_3_Name", "")
Global $Autostart_App_4_Name = IniRead($Config_INI, "Autostart", "App_4_Name", "")
Global $Autostart_App_5_Name = IniRead($Config_INI, "Autostart", "App_5_Name", "")
Global $Autostart_App_6_Name = IniRead($Config_INI, "Autostart", "App_6_Name", "")
Global $Autostart_App_7_Name = IniRead($Config_INI, "Autostart", "App_7_Name", "")
Global $Autostart_App_8_Name = IniRead($Config_INI, "Autostart", "App_8_Name", "")
Global $Autostart_App_9_Name = IniRead($Config_INI, "Autostart", "App_9_Name", "")

Global $Autostart_App_1_Path = IniRead($Config_INI, "Autostart", "App_1_Path", "")
Global $Autostart_App_2_Path = IniRead($Config_INI, "Autostart", "App_2_Path", "")
Global $Autostart_App_3_Path = IniRead($Config_INI, "Autostart", "App_3_Path", "")
Global $Autostart_App_4_Path = IniRead($Config_INI, "Autostart", "App_4_Path", "")
Global $Autostart_App_5_Path = IniRead($Config_INI, "Autostart", "App_5_Path", "")
Global $Autostart_App_6_Path = IniRead($Config_INI, "Autostart", "App_6_Path", "")
Global $Autostart_App_7_Path = IniRead($Config_INI, "Autostart", "App_7_Path", "")
Global $Autostart_App_8_Path = IniRead($Config_INI, "Autostart", "App_8_Path", "")
Global $Autostart_App_9_Path = IniRead($Config_INI, "Autostart", "App_9_Path", "")

Global $Open_HTML_GamePage_OnStart = IniRead($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "")

Global $GamePage_URL = $Install_DIR & "WebPage\GamePage_ALL.html"

Global $stats_log_FILE = @ScriptDir & "\Logs\stats_log.txt"

Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Local $Vive_Home_Folder_1 = StringInStr($Home_Path, "\", 1, - 1)
Local $Vive_Home_Folder_2 = StringLeft($Home_Path, $Vive_Home_Folder_1)

Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"

Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
Global $Steam_Path = StringReplace($Steam_Path_REG, '/', '\') & "\"

Global $ApplicationList_SteamVRLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
Global $ApplicationList_Non_Steam_Appl_INI = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
Global $ApplicationList_Custom_1_INI = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
Global $ApplicationList_Custom_2_INI = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
Global $ApplicationList_Custom_3_INI = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
Global $ApplicationList_Custom_4_INI = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

Global $SteamVR_Environment_Name = IniRead($Config_INI, "Settings", "SteamVR_Environment_Name", "homeloader")

Global $SteamVR_stats_log = $Steam_Path & "logs\stats_log.txt"
#endregion




Func _StartHomeApp()

	$stats_log_FILE = @ScriptDir & "\System\Logs\stats_log.txt"
	;MsgBox(0, "$stats_log_FILE 2", $stats_log_FILE)
#region Start LOG
	FileWrite($stats_log_FILE, @CRLF & "[Start _StartHomeApp: " & _Now() & "]" & @CRLF & _
									"- Home App: " & $HomeApp & @CRLF & _
									"- Home App Path: " & $Home_Path & @CRLF & _
									"- Home App Window Name: " & $WinName & @CRLF & _
									"- ScanLibrary_OnStart_SettingValue: " & $ScanLibrary_OnStart_SettingValue & @CRLF & _
									"- Steam_Path: " & $Steam_Path & @CRLF & _
									"- SteamVR_Path: " & $SteamVR_Path & @CRLF & _
									"- Default_vrsettings_File: " & $default_vrsettings_File & @CRLF & _
									"- Steam_tools_vrmanifest_File: " & $Steam_tools_vrmanifest_File & @CRLF & _
									"- Steamvr_vrsettings_FilePath: " & $Steamvr_vrsettings_FilePath & @CRLF & _
									"- Steamapps_vrmanifest_FilePath: " & $Steamapps_vrmanifest_FilePath & @CRLF & _
									"- Steam_AppConfig_Json: " & $Steam_AppConfig_Json & @CRLF & _
									"- HomeLoader_Overlay_Folder: " & $HomeLoader_Overlay_Folder & @CRLF & _
									"- VRToolBox_Steam_Folder: " & $VRToolBox_Steam_Folder & @CRLF & _
									"- HTCVive_Path: " & $HTCVive_Path & @CRLF & _
									"- Revive_Path: " & $Revive_Path & @CRLF & _
									"- Revive_revive_vrmanifest_FilePath: " & $Revive_revive_vrmanifest_FilePath & @CRLF & _
									"- Revive_support_vrmanifest_FilePath " & $Revive_support_vrmanifest_FilePath & @CRLF & _
									"- DeleteHomeLoaderLibraryData: " & $DeleteHomeLoaderLibraryData & @CRLF & _
									"- Request_Steamdb_info: " & $Request_Steamdb_info & @CRLF & _
									"- ScanOnlyVR: " & $ScanOnlyVR & @CRLF & _
									"- ScanVIVEApps: " & $ScanVIVEApps & @CRLF & _
									"- ScanOculusApps: " & $ScanOculusApps & @CRLF & _
									"- Sort_Alphabetical_order: " & $Sort_Alphabetical_order & @CRLF & _
									"- Use_Steam_Tags: " & $Use_Steam_Tags & @CRLF & _
									"- Allow_Multiple_Tag_Assignments: " & $Allow_Multiple_Tag_Assignments & @CRLF & _
									"- Add_Apps_Tags_to_categories: " & $Add_Apps_Tags_to_categories & @CRLF & _
									"- Create_HTML_GamePage: " & $Create_HTML_GamePage & @CRLF & _
									"- Add_Back_to_HTML_GamePage: " & $Add_Back_to_HTML_GamePage & @CRLF & _
									"- Add_PlayersOnline_to_Icons: " & $Add_PlayersOnline_to_Icons & @CRLF & _
									"- Add_SS_to_Icons: " & $Add_SS_to_Icons & @CRLF & _
									"- Add_SS_per_game: " & $Add_SS_per_game & @CRLF & _
									"- Autostart VRUB: " & $State_Checkbox_Autostart_VRUB & @CRLF & _
									"- HomeLoader Overlay SteamID: " & $HomeLoaderOverlaySteamID & @CRLF)
#endregion

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Home APP:")
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Home APP = " & $HomeApp)
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Home Path = " & $Home_Path)

	;_Exit_Check()
	_Start_actions_before()


	If $HomeApp <> "None" And $HomeApp <> "" Then
		Local $HomeApp_Arguments = "-vr -retail -useappid SteamVRAppID -nowindow -vconport 29009"
		If $HomeApp = "SteamVR Home" Then ShellExecute($Home_Path, $HomeApp_Arguments)
		If $HomeApp = "VR Toolbox" Then ShellExecute($Home_Path, "-e" & $HomeApp_Arguments)
		If $HomeApp = "Vive Home" Then ShellExecute($Home_Path, $HomeApp_Arguments, $Vive_Home_Folder_2)
		If $HomeApp <> "SteamVR Home" And $HomeApp <> "VR Toolbox" And $HomeApp <> "Vive Home" Then ShellExecute($Home_Path, $HomeApp_Arguments)
	EndIf

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Home APP '" & $HomeApp & "' started - " & "Path: '" & $Home_Path & "'")

	If $Autostart_VRUB = "true" Then
		_Read_from_VRUB_PersistentStore_File()
	EndIf

	If $HomeApp <> "SteamVR Home" Then
		Sleep(6000)
	Else
		Sleep(3000)
	EndIf

	;_Exit_Check()
	_Start_actions_after()

	If $Autostart_VRUB = "true" Then
		_Write_Settings_to_VRUB_PersistentStore_File()
		;_Write_ALL_Categories_to_VRUB_PersistentStore_File()
		If Not ProcessExists("VRUtilityBelt.exe") Then
			ShellExecute("steam://rungameid/645370")
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " --- VRUB " & "VRUtilityBelt" & " started --- " & "[" & _Now() & "]")
			Sleep(3000)
			_Start_HomeLoader_VROverlay()
		EndIf
	EndIf

	;If $Open_HTML_GamePage_OnStart = "true" Or $HomeApp = "SteamVR Home" Then
	;	_Keep_HomeLoader_Allive_Check()
	;EndIf

	;MsgBox(0, "", $Open_HTML_GamePage_OnStart & @CRLF & $HomeApp)

	If $Open_HTML_GamePage_OnStart = "true" Or $HomeApp = "SteamVR Home" Then
		_Keep_HomeLoader_SteamVR_Home_Allive_Check()
	EndIf
EndFunc


#Region Start Funktionen
Func _Start_actions_before()
	If WinExists("Game Page Menu") Then
		If $PIN_HTML_GamePage_Value = "true" Then
			WinSetOnTop("Game Page Menu", "", $WINDOWS_ONTOP)
		Else
			WinSetOnTop("Game Page Menu", "", $WINDOWS_NOONTOP)
		EndIf
	EndIf
EndFunc

Func _Start_actions_after()
	;MsgBox(0, "SteamVR_was_started", $SteamVR_was_started)
	;If $SteamVR_was_started = "true" Then
		Local $Value_SSD_SetSoundDevice = IniRead($Config_INI, "Settings", "SSD_SetSoundDevice", "")
		If $Value_SSD_SetSoundDevice = "true" Then
			_Button_Set_Playback_Device()
			Sleep(1500)
			_Button_Set_Recording_Device()
			Sleep(1000)
			$SteamVR_was_started = "false"
		EndIf
	;EndIf

	If $Autostart_VRUB = "true" Then
		If ProcessExists("VRUtilityBelt.exe") Then ProcessClose("VRUtilityBelt.exe")
		Do
			Sleep(500)
			_Exit_Check()
		Until Not ProcessExists("VRUtilityBelt.exe")
		Sleep(500)
		_Write_Settings_to_VRUB_PersistentStore_File()
		;_Write_ALL_Categories_to_VRUB_PersistentStore_File()
		Sleep(500)
		If Not ProcessExists("VRUtilityBelt.exe") Then
			ShellExecute("steam://rungameid/645370")
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " --- VRUB " & "VRUtilityBelt" & " started --- " & "[" & _Now() & "]")
			Sleep(3000)
			_Start_HomeLoader_VROverlay()
		EndIf
	EndIf

	For $LOOP = 1 To 10
		Local $Autostart_App_Name = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_Name", "")
		Local $Autostart_App_Path = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_Path", "")
		Local $Autostart_App_State = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_State", "")

		If $Autostart_App_State = "true" Then
			If $Autostart_App_Path <> "" Then
				If $Autostart_App_Name <> "Viveport Desktop / Dashboard" Then

					If $Autostart_App_Name = "Pluto" Then
						If Not ProcessExists("PlutoVR_Overlay.exe") Then
							ShellExecute($Autostart_App_Path)
						EndIf
					EndIf

					If $Autostart_App_Name = "OVRdrop" Then
						If ProcessExists("OVRdrop.exe") Then
							ShellExecute($Autostart_App_Path)
						EndIf
					EndIf

					If $Autostart_App_Name = "Virtual Desktop Dashboard" Then
						If Not ProcessExists("VirtualDesktop.Dashboard.exe") Then
							ShellExecute($Autostart_App_Path)
						EndIf
					EndIf

					If $Autostart_App_Name <> "Pluto" And $Autostart_App_Name <> "OVRdrop" And $Autostart_App_Name <> "Virtual Desktop Dashboard" Then
						ShellExecute($Autostart_App_Path)
					EndIf
				Else
					If Not WinExists("Vive") Then
						If FileExists($Autostart_App_Path) Then ShellExecute($Autostart_App_Path)
					Else
						WinSetState("Vive", "", @SW_ENABLE)
					EndIf
				EndIf
			EndIf
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " --- APP " & $Autostart_App_Name & " started --- " & $Autostart_App_Path &  " --- " &"[" & _Now() & "]")
			Sleep(3000)
		EndIf
	Next
	Sleep(1000)

	If $PIN_HTML_GamePage_Value = "true" Then
		WinSetOnTop("Game Page Menu", "", $WINDOWS_ONTOP)
	Else
		WinSetOnTop("Game Page Menu", "", $WINDOWS_NOONTOP)
	EndIf
EndFunc


Func _RELOAD_Keep_HomeLoader_Allive_Check()
	Sleep(3000)
	_Check_VRUB_PersistentStore_TEMP_Files()
	_Start_HomeLoader_VROverlay()
	Exit
EndFunc

Func _Keep_HomeLoader_Allive_Check()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " OVERLAY: Start HomeLoader Overlay.")
	Do
		#Region VRUB Check
		Local $HLOS_Temp_Check = IniRead($Config_INI, "TEMP", "HLOS", "")
		Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
		Local $sText = FileRead($filePath)
		Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

		For $i2 = 1 To $aArray[0]
			Local $StringReplaced1 = StringReplace($aArray[$i2], '{', '')
			Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
			Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
			Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

			If $StringSplit[1] = "AppIDLoaded" Then
				If $StringSplit[2] <> "" Then
					;MsgBox(0, "266 - AppIDLoaded", $StringSplit[2])

					Global $Check_VIVE_Oculus = StringReplace($StringReplaced3, 'AppIDLoaded:', '')
					;MsgBox(0, "$Check_Oculus", $Check_VIVE_Oculus)

					If StringLeft($Check_VIVE_Oculus, 4) = "vive" Then
						If $HLOS_Temp_Check <> "vive" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Start Viveport App." & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "vive")
							_Start_Vive_Oculus_App()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf

					$Check_VIVE_Oculus = StringReplace($Check_VIVE_Oculus, 'steam://rungameid/', '')
					If StringLeft($Check_VIVE_Oculus, 11) = "revive.app." Then
						If $HLOS_Temp_Check <> "revive.app." Then
							;MsgBox(0, "$HLOS_Temp_Check", $HLOS_Temp_Check)
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Start Oculus App." & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "revive.app.")
							_Start_Vive_Oculus_App()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf

					$Check_VIVE_Oculus = StringReplace($Check_VIVE_Oculus, 'steam://rungameid/', '')
					If StringLeft($Check_VIVE_Oculus, 5) = "HLNSG" Then
						If $HLOS_Temp_Check <> "HLNSG" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Start HLNSG App." & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "HLNSG")
							_Start_Vive_Oculus_App()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf
				EndIf
			EndIf

			If $StringSplit[1] = "FuncLoaded" Then
				If $StringSplit[2] <> "" Then
					If $StringSplit[2] = "Save" Then
						If $HLOS_Temp_Check <> "Save" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Save Settings." & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "Save")
							_Read_from_VRUB_PersistentStore_File()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf

					If $StringSplit[2] = "Save_ResolutionScale" Then
						If $HLOS_Temp_Check <> "Save_ResolutionScale" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Save ResolutionScale." & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "Save_ResolutionScale")
							_Write_ResolutionScale_OVERLAY_to_SteamVR_VRSettings()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf

					If $StringSplit[2] = "Start_HomeApp" Then
						If $HLOS_Temp_Check <> "Start_HomeApp" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Start HomeApp." & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "Start_HomeApp")
							_StartHomeApp()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf

					If $StringSplit[2] = "Start_Discord" Then
						If $HLOS_Temp_Check <> "Start_Discord" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Start Discord." & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "Start_Discord")
							;MsgBox(0, "Start_Discord", "Start_Discord")
							_Start_Discord()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf

					If $StringSplit[2] = "Start_OBS" Then
						If $HLOS_Temp_Check <> "Start_OBS" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Start OBS." & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "Start_OBS")
							;MsgBox(0, "Start_OBS", "Start_OBS")
							_Start_OBS()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf

					If $StringSplit[2] = "OBS_Record_Start" Then
						;MsgBox(0, "1 OBS_Record_Start", "OBS_Record_Start")
						If $HLOS_Temp_Check <> "OBS_Record_Start" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Start Recording." & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "OBS_Record_Start")
							;MsgBox(0, "2 OBS_Record_Start", "OBS_Record_Start")
							_Start_OBS_Record_Start()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf

					If $StringSplit[2] = "OBS_Record_Stop" Then
						;MsgBox(0, "1 OBS_Record_Stop", "OBS_Record_Stop")
						If $HLOS_Temp_Check <> "OBS_Record_Stop" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Stop Recording" & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "OBS_Record_Stop")
							;MsgBox(0, "2 OBS_Record_Stop", "OBS_Record_Stop")
							_Start_OBS_Record_Stop()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf

					If $StringSplit[2] = "Discord_Microphone_on_off" Then
						;MsgBox(0, "1 OBS_Record_Stop", "OBS_Record_Stop")
						If $HLOS_Temp_Check <> "Discord_Microphone_on_off" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Discord Microphone on/off" & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "Discord_Microphone_on_off")
							;MsgBox(0, "2 OBS_Record_Stop", "OBS_Record_Stop")
							_Start_Discord_Microphone_on_off()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf

					If $StringSplit[2] = "Discord_Speakers_on_off" Then
						;MsgBox(0, "1 OBS_Record_Stop", "OBS_Record_Stop")
						If $HLOS_Temp_Check <> "Discord_Speakers_on_off" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Discord Speakers on/off" & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "Discord_Speakers_on_off")
							;MsgBox(0, "2 OBS_Record_Stop", "OBS_Record_Stop")
							_Start_Discord_Speakers_on_off()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf

					If $StringSplit[2] = "Restart_HomeApp" Then
						If $HLOS_Temp_Check <> "Restart_HomeApp" Then
							FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Restart HomeApp." & @CRLF)
							IniWrite($Config_INI, "TEMP", "HLOS", "Restart_HomeApp")
							_Restart_HomeApp()
							_RELOAD_Keep_HomeLoader_Allive_Check()
						EndIf
					EndIf
				EndIf
			EndIf

		Next
		#endregion


		#Region config Check



		#endregion

		_Exit_Check_VRUB()
		Sleep(1000)

	Until Not ProcessExists("VRUtilityBelt.exe")


	_Exit_Check()

	;ProcessClose("HomeLoaderLibrary.exe")
	FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " OVERLAY: Exit HomeLoader Overlay.")
	Sleep(1000)
	Exit
EndFunc

Func _Keep_HomeLoader_SteamVR_Home_Allive_Check()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " SteamVR Home, Steamtours Check 1.")

	If Not ProcessExists("steamtours.exe") Then Sleep(1000)
	If Not ProcessExists("steamtours.exe") Then Sleep(1000)
	If Not ProcessExists("steamtours.exe") Then Sleep(1000)
	If Not ProcessExists("steamtours.exe") Then Sleep(1000)
	If Not ProcessExists("steamtours.exe") Then Sleep(1000)

	Local $Check_File = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\" & $SteamVR_Environment_Name & "\temp\log.txt"
	FileDelete($Check_File)

	Do
		Local $Content_File = FileRead($Check_File)
		;MsgBox(0, "$Content_File", $Content_File)
		Local $Steam_appid_temp = StringReplace($Content_File, 'Steam.appid=', '')
		;Local $Viveport_appid_temp = StringReplace($Content_File, 'Steam.appid=', '')
		;Local $Oculus_appid_temp = StringReplace($Content_File, 'Steam.appid=', '')
		If StringLeft($Content_File, 11) = "Steam.appid" Then
			;MsgBox(0, $Steam_appid_temp, "Start:" & @CRLF & "steam://rungameid/" & $Steam_appid_temp & '"')
			ShellExecute("steam://rungameid/" & $Steam_appid_temp & '"')
			Sleep(500)
			FileDelete($Check_File)
		EndIf
		If StringLeft($Content_File, 13) = "Viveport.Appl" Then
			Local $ApplicationList_Temp_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
			If $ScanOnlyVR = "true" Then
				Local $ApplicationList_Temp_INI = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
			Else
				Local $ApplicationList_Temp_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
			EndIf
			Local $ID = StringReplace($Content_File, 'Viveport.Appl=', '')
			Local $installdir = IniRead($ApplicationList_Temp_INI, "Application_" & $ID, "binary_path_windows", "")
			Local $Execute_Path = $Viveport_Bat_File_Folder & $ID & ".bat"
			Local $Working_Dir = StringLeft($installdir, StringInStr($installdir, "\", 0, -1) - 1)
			If FileExists($installdir) Then
				If Not ProcessExists("Vive.exe") Then
					If FileExists($HTCVive_Path & "PCClient\Vive.exe") Then
						ShellExecute($HTCVive_Path & "PCClient\Vive.exe")
						Do
							Sleep(1000)
						Until ProcessExists("Vive.exe")
						Sleep(2000)
					EndIf
				EndIf
				;MsgBox(0, "", $installdir & @CRLF & @CRLF & $Working_Dir)
				;ShellExecute($Execute_Path)
				ShellExecute($installdir, "", $Working_Dir)
				;Run($installdir, $Working_Dir, @SW_SHOW)
				Sleep(500)
				FileDelete($Check_File)
				FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " Viveport_Application started. --> Exit" & " [" & _Now() & "]")
				Exit
			EndIf
		EndIf
		If StringLeft($Content_File, 11) = "Oculus.Appl" Then
			If $ScanOnlyVR = "true" Then
				Local $ApplicationList_Temp_INI = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
			Else
				Local $ApplicationList_Temp_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
			EndIf
			Local $ID = StringReplace($Content_File, 'Oculus.Appl=', '')
			Local $installdir = $Install_DIR & "WebPage\Revive\" & $ID & ".bat"
			If FileExists($installdir) Then
				ShellExecute($installdir)
				Sleep(500)
				FileDelete($Check_File)
				FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " Oculus_Application started. --> Exit" & " [" & _Now() & "]")
				Exit
			EndIf
		EndIf
		If StringLeft($Content_File, 14) = "Non.Steam.Appl" Then
			Local $HLNSG_ID = StringReplace($Content_File, 'Non.Steam.Appl=', '')
			Local $HLNSG_installdir = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $HLNSG_ID, "installdir", "")

			If $HLNSG_installdir <> "" Then
				ShellExecute($HLNSG_installdir)
				Sleep(500)
				FileDelete($Check_File)
				FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " Non-Steam_Application started. --> Exit" & " [" & _Now() & "]")
				Exit
			EndIf
		EndIf
		_Exit_Check()
		Sleep(500)
	Until Not ProcessExists("steamtours.exe")

	_Exit_Check()

	FileWrite($stats_log_FILE, "[" & _Now() & "]" & " SteamVR Home, Steamtours Check 2.")
	Sleep(1000)
	If FileExists($Check_File) Then FileDelete($Check_File)
	Exit
EndFunc

Func _Start_Vive_Oculus_App_BACKUP()
	Local $Check_AppId = $Check_VIVE_Oculus
	Local $StringLeft_Check_AppID = StringLeft($Check_AppId, 14)
	Local $StringTrimLeft_Check_AppID = StringTrimLeft($Check_AppId, 14)
	Local $StringLeft_Check_HL = StringLeft($Check_AppId, 5)
	Local $StringLeft_Check_Revive = StringLeft($Check_AppId, 11)
	Local $Viveport_binary_path_windows = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "binary_path_windows", "")
	If $ScanOnlyVR = "true" Then $Viveport_binary_path_windows = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "binary_path_windows", "")
	;MsgBox(0, "1", "Application_vive.htc." & $StringTrimLeft_Check_AppID)

	Local $Revive_ShellExecute = $Revive_Path & "Revive\ReviveInjector_x64.exe"

	;MsgBox(0, "_Start_Vive_Oculus_App", $Check_AppId & @CRLF & $StringLeft_Check_AppID & @CRLF & $StringTrimLeft_Check_AppID & @CRLF & $StringLeft_Check_HL & @CRLF & $StringLeft_Check_Revive & @CRLF & $Revive_ShellExecute & @CRLF)

	If $Check_AppId <> "" Then
		If $StringLeft_Check_AppID = "vive://runapp/" Then
			If Not ProcessExists("Vive.exe") Then
				If FileExists($Viveport_binary_path_windows) Then
					ShellExecute($Viveport_binary_path_windows)
				Else
					If FileExists($HTCVive_Path & "PCClient\Vive.exe") Then
						ShellExecute($HTCVive_Path & "PCClient\Vive.exe")
						Do
							Sleep(1000)
							_Exit_Check()
						Until ProcessExists("Vive.exe")
						Sleep(1000)
						ShellExecute("vive://runapp/" & $StringTrimLeft_Check_AppID)
					EndIf
				EndIf
			Else
				ShellExecute("vive://runapp/" & $StringTrimLeft_Check_AppID)
			EndIf
		EndIf

		If $StringLeft_Check_Revive = "revive.app." Then
			ShellExecute($Install_DIR & "WebPage\Revive\" & $Check_AppId & ".bat")
		EndIf

		If $StringLeft_Check_HL = "HLNSG" Then
			Local $HLNSG_installdir = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Check_AppId, "installdir", "")
			ShellExecute($HLNSG_installdir)
		EndIf

		Sleep(200)
		;_Beenden()
	EndIf
EndFunc

Func _Start_Vive_Oculus_App()
	Local $Check_AppId = $Check_VIVE_Oculus
	Local $StringLeft_Check_AppID = StringLeft($Check_AppId, 14)
	Local $StringTrimLeft_Check_AppID = StringTrimLeft($Check_AppId, 14) ;;;;;;;;
	Local $StringLeft_Check_HL = StringLeft($Check_AppId, 5)
	Local $StringLeft_Check_Revive = StringLeft($Check_AppId, 11)
	Local $Viveport_binary_path_windows = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "binary_path_windows", "")
	If $ScanOnlyVR = "true" Then $Viveport_binary_path_windows = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "binary_path_windows", "")
	;MsgBox(0, "1", "Application_vive.htc." & $StringTrimLeft_Check_AppID)

	Local $Revive_ShellExecute = $Revive_Path & "Revive\ReviveInjector_x64.exe"

	;MsgBox(0, "_Start_Vive_Oculus_App", $Check_AppId & @CRLF & $StringLeft_Check_AppID & @CRLF & $StringTrimLeft_Check_AppID & @CRLF & $StringLeft_Check_HL & @CRLF & $StringLeft_Check_Revive & @CRLF & $Revive_ShellExecute & @CRLF)

	If $Check_AppId <> "" Then
		If $StringLeft_Check_AppID = "vive://runapp/" Then
			Local $ViveportAppPath = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "binary_path_windows", "")
			Local $ViveportAppDirPath = StringReplace(IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "IconPath", ""), 'Thumbnail-square.jpg', '')
			If $ScanOnlyVR = "true" Then
				$ViveportAppPath = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "binary_path_windows", "")
				$ViveportAppDirPath = StringReplace(IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "IconPath", ""), 'Thumbnail-square.jpg', '')
			EndIf

			MsgBox(0, "Application_vive.htc." & $StringTrimLeft_Check_AppID, $ViveportAppDirPath & @CRLF & @CRLF & $ViveportAppPath)

			If FileExists($ViveportAppPath) Then ShellExecute($ViveportAppPath, "", $ViveportAppDirPath)
		EndIf

		If $StringLeft_Check_Revive = "revive.app." Then
			ShellExecute($Install_DIR & "WebPage\Revive\" & $Check_AppId & ".bat")
		EndIf

		If $StringLeft_Check_HL = "HLNSG" Then
			Local $HLNSG_installdir = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Check_AppId, "installdir", "")
			ShellExecute($HLNSG_installdir)
		EndIf

		Sleep(200)
		;_Beenden()
	EndIf
EndFunc

Func _Restart_HomeApp()
	If ProcessExists("VRUtilityBelt.exe") Then ProcessClose("VRUtilityBelt.exe")
	If ProcessExists("vrmonitor.exe") Then ProcessClose("vrmonitor.exe")
	Do
		Sleep(1000)
	Until Not ProcessExists("vrmonitor.exe")
	Sleep(500)
	_Write_Settings_to_VRUB_PersistentStore_File()
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "StartHomeLoaderHomeApp", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "StartHomeLoaderHomeApp", $Install_DIR)
	EndIf
	;_StartHomeApp()
	;Exit
EndFunc


Func _Start_Discord()
	If FileExists("C:\Users\Cogent\AppData\Local\Discord\Update.exe") Then
		ShellExecute("C:\Users\Cogent\AppData\Local\Discord\Update.exe", "--processStart Discord.exe", "")
	Else
		;ShellExecute($Install_DIR & "HomeLoader.au3", "StartHomeLoaderHomeApp", $Install_DIR)
	EndIf
EndFunc

Func _Start_OBS()
	; "C:\Program Files(x86)\OBS\OBS.exe" -multi -portable -profile "QuickSync 30fps" -scenecollection "games" -start
	If FileExists(@ProgramFilesDir & "\obs-studio\bin\64bit\obs64.exe") Then
		ShellExecute(@ProgramFilesDir & "\obs-studio\bin\64bit\obs64.exe", '', @ProgramFilesDir & "\obs-studio\bin\64bit\")
	Else
		;ShellExecute($Install_DIR & "HomeLoader.au3", "StartHomeLoaderHomeApp", $Install_DIR)
	EndIf
EndFunc

Func _Start_OBS_Record_Start()
	Opt("WinTitleMatchMode",4)
	Local $windowTitle = WinGetTitle("[ACTIVE]")
	WinActivate($windowTitle)

	If ProcessExists("obs32.exe") or ProcessExists("obs64.exe") Then
		Send("{CTRLDOWN}")
		Send("{ALTDOWN}")
		Send("{A down}")
		Sleep(100)
		Send("{CTRLUP}")
		Send("{ALTUP}")
		Send("{A up}")
	EndIf
EndFunc

Func _Start_OBS_Record_Stop()
	Opt("WinTitleMatchMode", 4)
	Local $windowTitle = WinGetTitle("[ACTIVE]")
	WinActivate($windowTitle)

	If ProcessExists("obs32.exe") or ProcessExists("obs64.exe") Then
		Send("{CTRLDOWN}")
		Send("{ALTDOWN}")
		Send("{S down}")
		Sleep(100)
		Send("{CTRLUP}")
		Send("{ALTUP}")
		Send("{S up}")
	EndIf
EndFunc

Func _Start_Discord_PushToTalk_on_off()
	Opt("WinTitleMatchMode",4)
	Local $windowTitle = WinGetTitle("[ACTIVE]")
	WinActivate($windowTitle)

	If ProcessExists("Discord.exe") Then
		Send("{CTRLDOWN}")
		Send("{ALTDOWN}")
		Send("{NUMPAD1 down}")
		Sleep(100)
		Send("{CTRLUP}")
		Send("{ALTUP}")
		Send("{NUMPAD1 up}")
	EndIf
EndFunc

Func _Start_Discord_PushToMute_on_off()
	Opt("WinTitleMatchMode",4)
	Local $windowTitle = WinGetTitle("[ACTIVE]")
	WinActivate($windowTitle)

	If ProcessExists("Discord.exe") Then
		Send("{CTRLDOWN}")
		Send("{ALTDOWN}")
		Send("{NUMPAD2 down}")
		Sleep(100)
		Send("{CTRLUP}")
		Send("{ALTUP}")
		Send("{NUMPAD2 up}")
	EndIf
EndFunc

Func _Start_Discord_Microphone_on_off()
	Opt("WinTitleMatchMode",4)
	Local $windowTitle = WinGetTitle("[ACTIVE]")
	WinActivate($windowTitle)

	If ProcessExists("Discord.exe") Then
		Send("{CTRLDOWN}")
		Send("{ALTDOWN}")
		Send("{NUMPAD3 down}")
		Sleep(100)
		Send("{CTRLUP}")
		Send("{ALTUP}")
		Send("{NUMPAD3 up}")
	EndIf
EndFunc

Func _Start_Discord_Speakers_on_off()
	Opt("WinTitleMatchMode",4)
	Local $windowTitle = WinGetTitle("[ACTIVE]")
	WinActivate($windowTitle)

	If ProcessExists("Discord.exe") Then
		Send("{CTRLDOWN}")
		Send("{ALTDOWN}")
		Send("{NUMPAD4 down}")
		Sleep(100)
		Send("{CTRLUP}")
		Send("{ALTUP}")
		Send("{NUMPAD4 up}")
	EndIf
EndFunc


#endregion