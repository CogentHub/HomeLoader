
#Region Includes
#include <File.au3>
#include <Date.au3>
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>
#endregion

#Region Declare Variables/Const 1
;Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
;If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Config_INI = @ScriptDir & "\System\config.ini"

Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $Version = IniRead($Config_INI, "Settings", "Version", "")

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

	If $HomeApp <> "SteamVR Home" Then
		Sleep(6000)
	Else
		Sleep(3000)
	EndIf

	;_Exit_Check()
	_Start_actions_after()

	If $Open_HTML_GamePage_OnStart = "true" Then
		;_Keep_HomeLoader_Allive_Check()
	EndIf
EndFunc


#Region Start Funktionen
Func _Start_actions_before()
	Local $Start_HomeLoaderGUI = IniRead($Config_INI, "Settings", "Start_HomeLoaderGUI", "")
	Local $Start_HomeLoaderLibrary = IniRead($Config_INI, "Settings", "Start_HomeLoaderLibrary", "")
	Local $Start_Settings = IniRead($Config_INI, "Settings", "Start_Settings", "")

	Local $Titel_HomeLoaderGUI = "HomeLoader GUI"
	Local $Titel_HomeLoaderSettings = "HomeLoader - Settings"
	Local $Titel_HomeLoaderLibrary = "Home Loader Library"

	If $PIN_HTML_GamePage_Value = "true" Then
		WinSetOnTop("Game Page Menu", "", $WINDOWS_ONTOP)
	Else
		WinSetOnTop("Game Page Menu", "", $WINDOWS_NOONTOP)
	EndIf

	If $Start_HomeLoaderGUI = "true" Then
		If FileExists($Install_DIR & "Home Loader GUI.exe") Then
			ShellExecute($Install_DIR & "Home Loader GUI.exe", "", $Install_DIR)
		Else
			ShellExecute($Install_DIR & "Home Loader GUI.au3", "", $Install_DIR)
		EndIf
	EndIf

	If $Start_HomeLoaderLibrary = "true" Then
		If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
			ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
		Else
			ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
		EndIf
	EndIf

	If $Start_Settings = "true" Then
		If FileExists($System_DIR & "Settings.exe") Then
			ShellExecute($System_DIR & "Settings.exe", "", $System_DIR)
		Else
			ShellExecute($System_DIR & "Settings.au3", "", $System_DIR)
		EndIf
	EndIf
EndFunc

Func _Start_actions_after()
	If $Autostart_VRUB = "true" Then
		_Read_from_VRUB_PersistentStore_File()
		If $Add_SS_per_game = "true" Then _Compare_SteamVR_VRSettings_INI()
		;_Start_Home_Loader()
		_Write_config_INI_Values_to_VRUB_PersistentStore_File()
	EndIf

	Sleep(1000)

	If $Autostart_VRUB = "true" Then
		If Not ProcessExists("VRUtilityBelt.exe") Then
			ShellExecute("steam://rungameid/645370")
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " --- VRUB " & "VRUtilityBelt" & " started --- " & "[" & _Now() & "]")
			Sleep(3000)
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



Func _Keep_HomeLoader_Allive_Check()
	If $HomeApp = "None" Then Exit
	Do
		_Exit_Check()
		Local $NR_FileCountLines = _FileCountLines($SteamVR_stats_log)
		Local $Check_HomeApp_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
		Local $HomeApp_ID = StringReplace($Check_HomeApp_Path, 'steam://rungameid/', '')
		Local $Check_HomeApp_ID = IniRead($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
		If $Check_HomeApp_ID <> "" Then
			$HomeApp_ID = $Check_HomeApp_ID
		EndIf

		Local $Check_AppID_Running = FileReadLine($SteamVR_stats_log, $NR_FileCountLines)
		Local $Check_AppID_Last = FileReadLine($SteamVR_stats_log, $NR_FileCountLines - 1)
		Local $iPosition = StringInStr($Check_AppID_Running, "AppID")
		Local $Check_AppID_1 = StringTrimLeft($Check_AppID_Running, $iPosition - 2)
		Local $Check_AppID_2 = StringLeft($Check_AppID_1, 14)
		Local $Check_AppID_3 = StringReplace($Check_AppID_2, 'AppID', '')
		Local $Check_AppID_4 = StringReplace($Check_AppID_3, ' ', '')
		Local $Check_AppID_5 = StringReplace($Check_AppID_4, '[', '')
		Local $Check_AppID_6 = StringReplace($Check_AppID_5, ']', '')

		Local $Current_ID = $Check_AppID_6

		Local $NewAppStarted = "false"
		If $Current_ID <> $HomeApp_ID Then $NewAppStarted = "true"
		;If $Current_ID <> $HomeApp_ID Then MsgBox(0, "Exit GamePageMode", $NewAppStarted & @CRLF & @CRLF & $Current_ID & @CRLF & $HomeApp_ID)

		For $Loop = 1 To 9
			Local $AutostartApp_ID = IniRead($Config_INI, "Autostart", "App_" & $Loop & "_Path", "")
			$AutostartApp_ID = StringReplace($AutostartApp_ID, 'steam://rungameid/', '')
			If $AutostartApp_ID <> "" Then
				If $AutostartApp_ID = $Current_ID Then $NewAppStarted = "false"
			EndIf
		Next

		If $Check_HomeApp_ID = "" Then Exit
		If $HomeApp = "None" Then Exit

		Sleep(1000)

	Until $NewAppStarted = "true"
	_Exit_Check()

	ProcessClose("HomeLoaderLibrary.exe")
	IniWrite($Config_INI, "TEMP", "GamePageMenu", "Exit")
	FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " Exit Game Check: Game Page Closed.")
	Sleep(1000)
	Exit
EndFunc



#endregion