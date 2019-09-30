
#Region Includes
;#include <File.au3>
;#include <Date.au3>
;#include <Array.au3>
;#include <String.au3>
#include "HomeLoaderLibrary.au3"
#EndRegion Includes

Opt("GUIOnEventMode", 1)

#Region Declare Globals
Global $Array_tools_vrmanifest_File, $GUI_Loading, $FileSelect
Global $HomeApp_Overlay, $HomeAppSteamID_Overlay, $HomeLoaderOverlaySteamID_Overlay
Global $PressedOverlayButton_Overlay, $AppIDLoaded_Overlay
Global $OverlaySettings_Checkbox1, $OverlaySettings_Checkbox2, $OverlaySettings_Checkbox3
Global $OverlaySettings_Checkbox4, $OverlaySettings_Checkbox5, $OverlaySettings_Checkbox6
Global $OverlaySettings_Checkbox7, $OverlaySettings_Checkbox8, $OverlaySettings_Checkbox9
Global $OverlaySettings_Checkbox10, $OverlaySettings_Checkbox11, $OverlaySettings_Checkbox12, $OverlaySettings_Checkbox13
Global $OverlaySettings_LabelCustomPage3, $OverlaySettings_LabelCustomPage4, $OverlaySettings_LabelCustomPage5
Global $OverlaySettings_LabelCustomPage6, $FirstStart_Overlay, $HomeAppGroup, $OverlaySettings_resolutionScale
Global $OverlaySettings_OS_Autostart_checkbox1, $OverlaySettings_OS_Autostart_checkbox2, $OverlaySettings_OS_Autostart_checkbox3
Global $OverlaySettings_OS_Autostart_checkbox4, $OverlaySettings_OS_Autostart_checkbox5, $OverlaySettings_OS_Autostart_checkbox6
Global $OverlaySettings_OS_Autostart_checkbox7, $OverlaySettings_OS_Autostart_checkbox8, $OverlaySettings_OS_Autostart_checkbox9
Global $OverlaySettings_OS_Autostart_checkbox10, $Game_ID, $AppID_TEMP, $LOOP, $LOOP_2, $OverlaySettings_resolutionScale_TEMP
Global $App_Name_Exist_Check_TEMP, $ReadLine, $LOOP_NR_TEMP, $App_Name_TEMP, $Steamvr_vrsettings_Array
Global $ReadLine_AppID, $ReadLine_appName, $ReadLine_resolutionScale, $ReadLine_AppID, $ReadLine_appName, $ReadLine_resolutionScale
Global $FileSize, $FileContent, $FileContent_Left, $FileContent_Right, $Loop_End_1
Global $SteamVR_VRSettings_Content, $SteamVR_VRSettings_Count, $SteamVR_was_started
Global $SteamVR_VRSettings_Array_1[1][4] = [["Steam App ID", "Name", "Resolution Scale", "Added"]]
#EndRegion Declare Globals

#Region Variables
;Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
;If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Config_INI = @ScriptDir & "\System\config.ini"
;MsgBox(0, "$Config_INI", $Config_INI)
Global $Version = IniRead($Config_INI, "Settings", "Version", "")
Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $Apps_DIR = $Install_DIR & "Apps\"

Global $Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $TEMP_StartHomeSettings = IniRead($Config_INI, "TEMP", "StartHomeLoaderSettings", "")
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")

Global $Open_HTML_GamePage_OnStart = IniRead($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "")
Global $PIN_HTML_GamePage_Value = IniRead($Config_INI, "Settings", "PIN_HTML_GamePage", "")

Global $gfx = $System_DIR & "gfx\"
Global $Icons = $Install_DIR & "Icons\"
Global $stats_log_FILE = $System_DIR & "Logs\stats_log.txt"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"

Global $ApplicationList_SteamVRLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
Global $ApplicationList_Non_Steam_Appl_INI = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
Global $ApplicationList_Custom_1_INI = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
Global $ApplicationList_Custom_2_INI = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
Global $ApplicationList_Custom_3_INI = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
Global $ApplicationList_Custom_4_INI = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
Global $Steam_Path = StringReplace($Steam_Path_REG, '/', '\') & "\"
Global $SteamVR_Path = $Steam_Path & "SteamApps\common\SteamVR\"

Global $HTCVive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\HTC\HTC Vive\', "ViveHelperPath")
Global $HTCVive_Path_StringReplace_1 = StringReplace($HTCVive_Path_REG, 'PCClient\ViveportDesktopHelper.exe', '')
Global $HTCVive_Path = StringReplace($HTCVive_Path_StringReplace_1, '/', '\')

Global $Revive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Revive\', "")
Global $Revive_Path = StringReplace($Revive_Path_REG, '/', '\')
If StringRight($Revive_Path, 1) <> "\" Then $Revive_Path = $Revive_Path & "\"

Global $Revive_revive_vrmanifest_FilePath = $Revive_Path & "revive.vrmanifest"
Global $Revive_support_vrmanifest_FilePath = $Revive_Path & "support.vrmanifest"

Global $Steam_AppConfig_Json = $Steam_Path & "config\appconfig.json"
Global $VRToolBox_Steam_Folder = $Steam_Path & "steamapps\common\VRToolbox\"

Global $HomeLoader_Overlay_Folder = $Steam_Path & "steamapps\common\VRUtilityBelt\addons\custom\HomeLoader\overlays\HomeLoader\"

Global $Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
Global $Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
Global $Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
Global $Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
Global $Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

Global $default_vrsettings_File = $SteamVR_Path & "resources\settings\default.vrsettings"
If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
Global $default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"

Global $Steam_tools_vrmanifest_File = $SteamVR_Path & "tools\tools.vrmanifest"
If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
Global $Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"

Global $Steamvr_vrsettings_FilePath = $Steam_Path & "config\steamvr.vrsettings"
If Not FileExists($Steamvr_vrsettings_FilePath & ".bak") Then FileCopy($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_FilePath & ".bak", $FC_CREATEPATH + $FC_OVERWRITE)

Global $Steamapps_vrmanifest_FilePath = $Steam_Path & "config\steamapps.vrmanifest"
If Not FileExists($Steamapps_vrmanifest_FilePath & ".bak") Then FileCopy($Steamapps_vrmanifest_FilePath, $Steamapps_vrmanifest_FilePath & ".bak", $FC_CREATEPATH + $FC_OVERWRITE)
If Not FileExists($Install_DIR & "Backups\steamapps.vrmanifest") Then FileCopy($Steamapps_vrmanifest_FilePath, $Install_DIR & "Backups\steamapps.vrmanifest")

Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $HomeAppSteamID = IniRead($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
Global $StartHomeAPP_bat = $System_DIR & "StartHomeAPP.bat"
Global $StartSteamVRHome_au3 = $System_DIR & "StartSteamVRHome.au3"
Global $StartSteamVRHome_exe = $System_DIR & "StartSteamVRHome.exe"

Global $Add_HomeLoader_to_VRToolbox_StartPage = IniRead($config_ini, "Settings", "Add_HomeLoader_to_VRToolbox_StartPage", "")

Global $State_Checkbox_Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "")

Global $Use_Local_Icons = IniRead($Config_INI, "Settings", "Use_Local_Icons", "")
Global $ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
Global $Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "")
Global $Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "")
Global $Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
Global $HomeLoaderOverlaySteamID = IniRead($Config_INI, "Settings", "HomeLoaderOverlaySteamID", "")
Global $DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
Global $Request_Steamdb_info = IniRead($Config_INI, "Settings", "Request_Steamdb_info", "")
Global $ScanOnlyVR = IniRead($Config_INI, "Settings", "ScanOnlyVR", "")
Global $ScanVIVEApps = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
Global $ScanOculusApps = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
Global $Sort_Alphabetical_order = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
Global $Use_Steam_Tags = IniRead($Config_INI, "Settings", "Use_Steam_Tags", "")
Global $Allow_Multiple_Tag_Assignments = IniRead($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "")
Global $Add_Apps_Tags_to_categories = IniRead($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "")
Global $Create_HTML_GamePage = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
Global $Add_Back_to_HTML_GamePage = IniRead($Config_INI, "Settings", "Add_Back_to_HTML_GamePage", "")

Global $Autostart_App_1_State = IniRead($Config_INI, "Autostart", "App_1_State", "")
Global $Autostart_App_2_State = IniRead($Config_INI, "Autostart", "App_2_State", "")
Global $Autostart_App_3_State = IniRead($Config_INI, "Autostart", "App_3_State", "")
Global $Autostart_App_4_State = IniRead($Config_INI, "Autostart", "App_4_State", "")
Global $Autostart_App_5_State = IniRead($Config_INI, "Autostart", "App_5_State", "")
Global $Autostart_App_6_State = IniRead($Config_INI, "Autostart", "App_6_State", "")
Global $Autostart_App_7_State = IniRead($Config_INI, "Autostart", "App_7_State", "")
Global $Autostart_App_8_State = IniRead($Config_INI, "Autostart", "App_8_State", "")
Global $Autostart_App_9_State = IniRead($Config_INI, "Autostart", "App_9_State", "")
Global $Autostart_App_10_State = IniRead($Config_INI, "Autostart", "App_10_State", "")

Global $stats_log_FILE = $System_DIR & "Logs\stats_log.txt"
Local $stats_log_FILE_Lines = _FileCountLines($stats_log_FILE)
If $stats_log_FILE_Lines > 999 Then FileDelete($stats_log_FILE)

#EndRegion Variables

#Region Declare Names
Global $TAB1_Label = IniRead($Config_INI, "Settings", "TAB1_Name", "")
Global $TAB2_Label = IniRead($Config_INI, "Settings", "TAB2_Name", "")
Global $TAB3_Label = IniRead($Config_INI, "Settings", "TAB3_Name", "")
Global $TAB4_Label = IniRead($Config_INI, "Settings", "TAB4_Name", "")
Global $TAB5_Label = IniRead($Config_INI, "Settings", "TAB5_Name", "")
Global $TAB6_Label = IniRead($Config_INI, "Settings", "TAB6_Name", "")
If $TAB1_Label = "" Then $TAB1_Label = "Steam Library"
If $TAB2_Label = "" Then $TAB2_Label = "Non-Steam_Appl"
If $TAB3_Label = "" Then $TAB3_Label = "Page 1"
If $TAB4_Label = "" Then $TAB4_Label = "Page 2"
If $TAB5_Label = "" Then $TAB5_Label = "Page 3"
If $TAB6_Label = "" Then $TAB6_Label = "Page 4"
#EndRegion Declare Names

#Region Start Check
Local $Check_File = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\" & $SteamVR_Environment_Name & "\temp\log.txt"
If FileExists($Check_File) Then FileDelete($Check_File)

Local $Parameter_1 = ""
If $CmdLine[0] Then
	$Parameter_1 = $CmdLine[1]
EndIf

If $Parameter_1 = "Uninstall_HomeLoader" Then
	_Restore_Default_SteamVR_Home()
	Exit
EndIf

If $Parameter_1 = "StartHomeLoaderHomeApp" Then
	;_Start_HomeLoader_HomeApp()
	;_Start_HomeLoader_UpdateLibrary()

	If $ScanLibrary_OnStart_SettingValue = "true" Then
		MsgBox(0, "_Start_HomeLoader_UpdateLibrary()", "_Start_HomeLoader_UpdateLibrary()")
		_Start_HomeLoader_UpdateLibrary()
	EndIf

	_StartSteamVRHome()

	Exit
EndIf

;If $Parameter_1 = "StartSteamVRHome" Then
	;_StartSteamVRHome()
;EndIf

If $Parameter_1 = "GamePageMode" Then
	_Create_HTMLGamePage_GUI()
	Exit
EndIf

If $Parameter_1 = "Create_HTML_GamePages_All" Then
	_RM_Create_HTML_GamePages_All()
	Exit
EndIf

If $Parameter_1 = "VROverlay" Then
	_Keep_HomeLoader_Allive_Check()
	Exit
EndIf

If $Parameter_1 = "Start_Shortcut_1" Then
	;MsgBox(0, "Start_Shortcut_1", "Start_Shortcut_1")
	Exit
EndIf
#EndRegion Start Check


#Region Func MAIN
Func _StartSteamVRHome()
	FileWrite($stats_log_FILE, @CRLF & @CRLF & "[Start SteamVR and HomeLoader StartUp Process: " & _Now() & "]" & @CRLF)
	$stats_log_FILE = @ScriptDir & "\System\Logs\stats_log.txt"
	#Region Start Check
	If $Open_HTML_GamePage_OnStart = "true" Then
		If $HomeApp = "VR Toolbox" Then Send("{ESC}")
		If $HomeApp <> "VR Toolbox" Then
			If Not WinExists("Game Page Menu") Then
				_Start_Create_HTMLGamePage_GUI()
			EndIf
		EndIf
	EndIf

	_Start_Home_APP()
	_Sync_Config_INI()

	If $PIN_HTML_GamePage_Value = "true" Then
		WinSetOnTop("Game Page Menu", "", $WINDOWS_ONTOP)
	Else
		WinSetOnTop("Game Page Menu", "", $WINDOWS_NOONTOP)
	EndIf

	FileWrite($stats_log_FILE, "[End SteamVR and HomeLoader StartUp Process: " & _Now() & "]" & @CRLF & @CRLF)

	;FileWrite($stats_log_FILE, @CRLF & "[End SteamVR and HomeLoader StartUp Process: " & _Now() & "]" & @CRLF)
	#EndRegion Start Check

	Exit
	;_Exit()
EndFunc   ;==>_StartSteamVRHome

Func _Start_Home_APP()
	$SteamVR_was_started = "false"
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_Home_APP()'")
	Local $sOutput
	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
	Local $HomeAppSteamID = IniRead($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	Global $Vive_Home_Folder = "", $WaitNR = "1"

	If Not ProcessExists("vrmonitor.exe") Then
		ShellExecute("steam://rungameid/250820")
		Do
			Sleep(1000)
		Until ProcessExists("vrmonitor.exe")
		;$SteamVR_was_started = "true"
		;MsgBox(0, "SteamVR_was_started", $SteamVR_was_started)
	EndIf

	If $HomeApp <> "Default SteamVR Home" Then
		;_Exit_Check()
		_StartHomeApp()
	EndIf
EndFunc   ;==>_Start_Home_APP

Func _Compare_SteamVR_VRSettings_INI()
	If FileExists($SteamVR_VRSettings_INI) Then
		Local $FileLinesTEMP = _FileCountLines($SteamVR_VRSettings_INI)

		For $LOOP = 0 To $FileLinesTEMP
			Local $ReadLine_1 = FileReadLine($SteamVR_VRSettings_INI, $LOOP)
			Local $ReadLine_2 = StringReplace($ReadLine_1, '[', '')
			Local $ReadLine_3 = StringReplace($ReadLine_2, ']', '')
			Local $ReadLine_4 = StringLeft($ReadLine_3, 10)
			$ReadLine = $ReadLine_4

			If $ReadLine = "steam.app." Then
				$ReadLine_AppID = StringTrimLeft($ReadLine_3, 10)
				Local $ReadLine_appName_1 = FileReadLine($SteamVR_VRSettings_INI, $LOOP + 1)
				Local $ReadLine_appName_2 = StringTrimLeft($ReadLine_appName_1, 8)
				$ReadLine_appName = $ReadLine_appName_2
				Local $ReadLine_resolutionScale_1 = FileReadLine($SteamVR_VRSettings_INI, $LOOP + 2)
				Local $ReadLine_resolutionScale_2 = StringTrimLeft($ReadLine_resolutionScale_1, 16)
				$ReadLine_resolutionScale = $ReadLine_resolutionScale_2

				$SteamVR_VRSettings_Content = $ReadLine_AppID & "|" & $ReadLine_appName & "|" & $ReadLine_resolutionScale & "|" & "false"
				_ArrayAdd($SteamVR_VRSettings_Array_1, $SteamVR_VRSettings_Content)
				$SteamVR_VRSettings_Count = $SteamVR_VRSettings_Count + 1
			EndIf
		Next

		;_ArrayDisplay($SteamVR_VRSettings_Array_1, "2D - Item delimited")

		_SSVRH_Write_to_SteamVR_VRSettings()

		Local $FileContent = FileRead($Steamvr_vrsettings_FilePath)
		If FileExists($Steamvr_vrsettings_FilePath) Then FileDelete($Steamvr_vrsettings_FilePath)

		For $LOOP = 1 To 8
			Local $FileContent_Check = StringRight($FileContent, $LOOP)
			If StringLeft($FileContent_Check, 1) = "," Then
				Local $FileContent_1 = StringTrimRight($FileContent, $LOOP)
				Local $FileContent_2 = StringReplace(StringRight($FileContent, $LOOP), ',', '')
				$FileContent = $FileContent_1 & $FileContent_2
				FileWrite($Steamvr_vrsettings_FilePath, $FileContent)
				ExitLoop
			EndIf
		Next

		If ProcessExists("vrmonitor.exe") Then
			If FileExists($SteamVR_VRSettings_INI) Then FileDelete($SteamVR_VRSettings_INI)
			If ProcessExists("VRUtilityBelt.exe") Then
				ProcessClose("VRUtilityBelt.exe")
				Sleep(500)
			EndIf
			ProcessClose("vrmonitor.exe")
			Sleep(3000)
			ShellExecute("steam://rungameid/250820")
		EndIf

		FileWriteLine($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " RESTART: New Resolution Scale Values Synchronized")
		Exit
	EndIf
EndFunc   ;==>_Compare_SteamVR_VRSettings_INI

Func _SSVRH_Write_to_SteamVR_VRSettings()
	Local $SteamAppExist = "false"
	If FileExists($Steamvr_vrsettings_FilePath) Then _FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)
	If Not FileExists($Steamvr_vrsettings_FilePath) Then _FileReadToArray($Steamvr_vrsettings_FilePath & ".bak", $Steamvr_vrsettings_Array)
	$Loop_End_1 = $Steamvr_vrsettings_Array[0]

	If FileExists($Steamvr_vrsettings_FilePath) Then FileDelete($Steamvr_vrsettings_FilePath)

	For $LOOP = 1 To $Loop_End_1 - 2
		$Steamvr_vrsettings_aArray = _StringBetween($Steamvr_vrsettings_Array[$LOOP], '"', '"', $STR_ENDNOTSTART)
		If $Steamvr_vrsettings_aArray <> "" Then
			;If $Steamvr_vrsettings_aArray <> 0 Then
			;If $Steamvr_vrsettings_aArray[0] <> "" Then
			For $LOOP_2 = 1 To $SteamVR_VRSettings_Count
				If $Steamvr_vrsettings_aArray[0] = "steam.app." & $SteamVR_VRSettings_Array_1[$LOOP_2][0] Then
					;MsgBox(0, "=", "steam.app." & $SteamVR_VRSettings_Array_1[$LOOP_2][0])
					FileWriteLine($Steamvr_vrsettings_FilePath, '   "steam.app.' & $SteamVR_VRSettings_Array_1[$LOOP_2][0] & '" : {')
					FileWriteLine($Steamvr_vrsettings_FilePath, '      "appName" : "' & $SteamVR_VRSettings_Array_1[$LOOP_2][1] & '",')
					FileWriteLine($Steamvr_vrsettings_FilePath, '      "resolutionScale" : ' & $SteamVR_VRSettings_Array_1[$LOOP_2][2] & '')
					;FileWriteLine($Steamvr_vrsettings_FilePath & ".new2", '   },')
					$LOOP = $LOOP + 3
					$SteamVR_VRSettings_Array_1[$LOOP_2][3] = "true"
				Else
					If $LOOP_2 = $SteamVR_VRSettings_Count Then
						FileWriteLine($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array[$LOOP])
					EndIf
				EndIf
			Next
			;EndIf
			;EndIf
		Else
			FileWriteLine($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array[$LOOP])
		EndIf
	Next

	;_ArrayDisplay($SteamVR_VRSettings_Array_1, "2D - Item delimited")

	FileWriteLine($Steamvr_vrsettings_FilePath, '   },')

	For $LOOP_3 = 1 To $SteamVR_VRSettings_Count
		If $SteamVR_VRSettings_Array_1[$LOOP_3][3] = "false" Then
			FileWriteLine($Steamvr_vrsettings_FilePath, '   "steam.app.' & $SteamVR_VRSettings_Array_1[$LOOP_3][0] & '" : {')
			FileWriteLine($Steamvr_vrsettings_FilePath, '      "appName" : "' & $SteamVR_VRSettings_Array_1[$LOOP_3][1] & '",')
			FileWriteLine($Steamvr_vrsettings_FilePath, '      "resolutionScale" : ' & $SteamVR_VRSettings_Array_1[$LOOP_3][2] & '')
			FileWriteLine($Steamvr_vrsettings_FilePath, '   },')
		EndIf
	Next
	FileWriteLine($Steamvr_vrsettings_FilePath, '}')
EndFunc   ;==>_SSVRH_Write_to_SteamVR_VRSettings

Func _Write_config_INI_Values_to_VRUB_PersistentStore_File()
	Local $HomeLoaderOverlaySteamID = IniRead($Config_INI, "Settings", "HomeLoaderOverlaySteamID", "")
	Local $NEW_sText = ""
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
	Local $sText = FileRead($filePath)
	Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

	Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "200")
	Local $AppID_TEMP = ""
	Local $SteamLibraryContent = ""

	Global $Autostart_App_1_Name = IniRead($Config_INI, "Autostart", "App_1_Name", "")
	Global $Autostart_App_2_Name = IniRead($Config_INI, "Autostart", "App_2_Name", "")
	Global $Autostart_App_3_Name = IniRead($Config_INI, "Autostart", "App_3_Name", "")
	Global $Autostart_App_4_Name = IniRead($Config_INI, "Autostart", "App_4_Name", "")
	Global $Autostart_App_5_Name = IniRead($Config_INI, "Autostart", "App_5_Name", "")
	Global $Autostart_App_6_Name = IniRead($Config_INI, "Autostart", "App_6_Name", "")
	Global $Autostart_App_7_Name = IniRead($Config_INI, "Autostart", "App_7_Name", "")
	Global $Autostart_App_8_Name = IniRead($Config_INI, "Autostart", "App_8_Name", "")
	Global $Autostart_App_9_Name = IniRead($Config_INI, "Autostart", "App_9_Name", "")
	Global $Autostart_App_10_Name = "Viveport Desktop / Dashboard"

	For $Loop_SteamLibrary = 1 To $NR_Applications
		$AppID_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_SteamLibrary, "appid", "")
		$SteamLibraryContent = $SteamLibraryContent & "_" & $AppID_TEMP
		If $Loop_SteamLibrary = 1 Then $SteamLibraryContent = $AppID_TEMP
	Next

	For $i1 = 1 To $aArray[0]
		Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
		Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
		Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
		Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

		Local $InsertValue = $StringSplit[2]
		If $StringSplit[1] = "HomeLoaderOverlaySteamID" Then $InsertValue = $HomeLoaderOverlaySteamID
		If $StringSplit[1] = "HomeApp" Then $InsertValue = $HomeApp
		If $StringSplit[1] = "SteamLibrary" Then $InsertValue = $SteamLibraryContent
		If $StringSplit[1] = "OS_Autostart_AppName1" Then $InsertValue = $Autostart_App_1_Name
		If $StringSplit[1] = "OS_Autostart_AppName2" Then $InsertValue = $Autostart_App_2_Name
		If $StringSplit[1] = "OS_Autostart_AppName3" Then $InsertValue = $Autostart_App_3_Name
		If $StringSplit[1] = "OS_Autostart_AppName4" Then $InsertValue = $Autostart_App_4_Name
		If $StringSplit[1] = "OS_Autostart_AppName5" Then $InsertValue = $Autostart_App_5_Name
		If $StringSplit[1] = "OS_Autostart_AppName6" Then $InsertValue = $Autostart_App_6_Name
		If $StringSplit[1] = "OS_Autostart_AppName7" Then $InsertValue = $Autostart_App_7_Name
		If $StringSplit[1] = "OS_Autostart_AppName8" Then $InsertValue = $Autostart_App_8_Name
		If $StringSplit[1] = "OS_Autostart_AppName9" Then $InsertValue = $Autostart_App_9_Name
		If $StringSplit[1] = "OS_Autostart_AppName10" Then $InsertValue = $Autostart_App_10_Name
		If $i1 <> $aArray[0] Then
			$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $InsertValue & '",'
		Else
			$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $InsertValue & '"}'
		EndIf
	Next
	Local $StringRightCheck = StringRight($NEW_sText, '1')
	If $StringRightCheck = "," Then $NEW_sText = StringTrimRight($NEW_sText, '1')
	Local $StringLeftCheck = StringLeft($NEW_sText, '1')
	If $StringLeftCheck <> "{" Then $NEW_sText = "{" & $NEW_sText
	If FileExists($filePath) Then FileDelete($filePath)
	FileWrite($filePath, $NEW_sText)
EndFunc   ;==>_Write_config_INI_Values_to_VRUB_PersistentStore_File

Func _Read_Scan_Settings()
	$ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
	$Request_Steamdb_info = IniRead($Config_INI, "Settings", "Request_Steamdb_info", "")
	$Use_Steam_Tags = IniRead($Config_INI, "Settings", "Use_Steam_Tags", "")
	$ScanVIVEApps = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
	$ScanOculusApps = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
	$Sort_Alphabetical_order = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
	$Add_Apps_Tags_to_categories = IniRead($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "")
	$Allow_Multiple_Tag_Assignments = IniRead($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "")
	$Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "")
	$Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "")
	$Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	$Create_HTML_GamePage = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
	$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
EndFunc   ;==>_Read_Scan_Settings

#EndRegion Func MAIN

#Region Func Overlay Functions
Func _Check_VRUB_PersistentStore_TEMP_Files()
	Local $AppIDLoaded_Temp, $FuncLoaded_Temp
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Read_from_VRUB_PersistentStore_File()'")
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	$HomeApp_Overlay = ""
	$HomeLoaderOverlaySteamID_Overlay = ""

	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
	Local $sText = FileRead($filePath)
	Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

	Local $Update_Settings = ""

	For $i1 = 1 To $aArray[0]
		Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
		Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
		Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
		Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

		If $StringSplit[1] = "AppIDLoaded" Then
			$AppIDLoaded_Temp = $StringSplit[2]
		EndIf

		If $StringSplit[1] = "FuncLoaded" Then
			$FuncLoaded_Temp = $StringSplit[2]
		EndIf
	Next

	If $AppIDLoaded_Temp = "" And $FuncLoaded_Temp = "" Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Clear Temp Values...")
		IniWrite($Config_INI, "TEMP", "HLOS", "")
	Else
		_Write_AppIDLoaded_FuncLoaded_to_VRUB_PersistentStore_File()
	EndIf

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End Updating Overlay.")
EndFunc   ;==>_Read_from_VRUB_PersistentStore_File

Func _Read_from_VRUB_PersistentStore_File()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Read_from_VRUB_PersistentStore_File()'")
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	$HomeApp_Overlay = ""
	$HomeLoaderOverlaySteamID_Overlay = ""

	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
	Local $sText = FileRead($filePath)
	Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

	Local $Update_Settings = ""

	For $i1 = 1 To $aArray[0]
		Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
		Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
		Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
		Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

		If $StringSplit[1] = "Update_Settings" Then
			Local $OverlaySettings_Update_Settings = $StringSplit[2]
			If $OverlaySettings_Update_Settings = "true" Then
				$Update_Settings = "true"
			EndIf
			ExitLoop
		EndIf
	Next

	If $Update_Settings = "true" Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Updating Overlay Settings...")
		For $i2 = 1 To $aArray[0]
			Local $StringReplaced1 = StringReplace($aArray[$i2], '{', '')
			Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
			Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
			Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

			Local $CurrentValue_CheckBox_1 = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
			Local $CurrentValue_CheckBox_2 = IniRead($Config_INI, "Settings", "Request_Steamdb_info", "")
			Local $CurrentValue_CheckBox_3 = IniRead($Config_INI, "Settings", "Use_Steam_Tags", "")
			Local $CurrentValue_CheckBox_4 = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
			Local $CurrentValue_CheckBox_5 = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
			Local $CurrentValue_CheckBox_6 = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
			Local $CurrentValue_CheckBox_7 = IniRead($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "")
			Local $CurrentValue_CheckBox_8 = IniRead($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "")
			Local $CurrentValue_CheckBox_9 = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "")
			Local $CurrentValue_CheckBox_10 = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "")
			Local $CurrentValue_CheckBox_11 = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
			Local $CurrentValue_CheckBox_12 = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
			Local $CurrentValue_CheckBox_13 = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")

			Local $CurrentValue_TAB3_Name = IniRead($Config_INI, "Settings", "TAB3_Name", "")
			Local $CurrentValue_TAB4_Name = IniRead($Config_INI, "Settings", "TAB4_Name", "")
			Local $CurrentValue_TAB5_Name = IniRead($Config_INI, "Settings", "TAB5_Name", "")
			Local $CurrentValue_TAB6_Name = IniRead($Config_INI, "Settings", "TAB6_Name", "")

			If $StringSplit[1] = "HomeApp" Then
				$HomeApp_Overlay = $StringSplit[2] ; Home App
				;MsgBox(0, $StringSplit[1], $StringSplit[2])
				If $HomeApp_Overlay <> "" Then
					If $HomeApp_Overlay <> $HomeApp Then
						If $HomeApp_Overlay = "SteamVR Home" Then _StartUp_Overlay_Radio_1()
						If $HomeApp_Overlay = "Vive Home" Then _StartUp_Overlay_Radio_2()
						If $HomeApp_Overlay = "Viveport VR" Then _StartUp_Overlay_Radio_6()
						If $HomeApp_Overlay = "Bigscreen" Then _StartUp_Overlay_Radio_7()
						If $HomeApp_Overlay = "VR Toolbox" Then _StartUp_Overlay_Radio_4()
						If $HomeApp_Overlay = "Virtual Desktop" Then _StartUp_Overlay_Radio_8()
						If $HomeApp_Overlay = "None" Then _StartUp_Overlay_Radio_3()
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "HomeApp = <" & $HomeApp_Overlay & ">")
			EndIf

			If $StringSplit[1] = "Settings_Checkbox1" Then
				$OverlaySettings_Checkbox1 = $StringSplit[2] ;;; Scan with HomeApp Start ;;;
				If $OverlaySettings_Checkbox1 <> "" Then
					If $OverlaySettings_Checkbox1 <> $CurrentValue_CheckBox_1 Then
						IniWrite($Config_INI, "Settings", "ScanLibrary_OnStart", $OverlaySettings_Checkbox1)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox1 = <" & $OverlaySettings_Checkbox1 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox2" Then
				$OverlaySettings_Checkbox2 = $StringSplit[2] ;;; Request Steamdb Info ;;;
				If $OverlaySettings_Checkbox2 <> "" Then
					If $OverlaySettings_Checkbox2 <> $CurrentValue_CheckBox_2 Then
						IniWrite($Config_INI, "Settings", "Request_Steamdb_info", $OverlaySettings_Checkbox2)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox2 = <" & $OverlaySettings_Checkbox2 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox3" Then
				$OverlaySettings_Checkbox3 = $StringSplit[2] ;;; Request Steamdb Tags ;;;
				If $OverlaySettings_Checkbox3 <> "" Then
					If $OverlaySettings_Checkbox3 <> $CurrentValue_CheckBox_3 Then
						IniWrite($Config_INI, "Settings", "Use_Steam_Tags", $OverlaySettings_Checkbox3)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox3 = <" & $OverlaySettings_Checkbox3 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox4" Then
				$OverlaySettings_Checkbox4 = $StringSplit[2] ;;; Scan for Viveport Apps ;;;
				If $OverlaySettings_Checkbox4 <> "" Then
					If $OverlaySettings_Checkbox4 <> $CurrentValue_CheckBox_4 Then
						IniWrite($Config_INI, "Settings", "ScanVIVEApps", $OverlaySettings_Checkbox4)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox4 = <" & $OverlaySettings_Checkbox4 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox5" Then
				$OverlaySettings_Checkbox5 = $StringSplit[2] ;;; Scan for Oculus Apps ;;;
				If $OverlaySettings_Checkbox5 <> "" Then
					If $OverlaySettings_Checkbox5 <> $CurrentValue_CheckBox_5 Then
						IniWrite($Config_INI, "Settings", "ScanOculusApps", $OverlaySettings_Checkbox5)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox5 = <" & $OverlaySettings_Checkbox5 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox6" Then
				$OverlaySettings_Checkbox6 = $StringSplit[2] ;;; Sort Apps in Alphabetical order ;;;
				If $OverlaySettings_Checkbox6 <> "" Then
					If $OverlaySettings_Checkbox6 <> $CurrentValue_CheckBox_6 Then
						IniWrite($Config_INI, "Settings", "Sort_Alphabetical_order", $OverlaySettings_Checkbox6)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox6 = <" & $OverlaySettings_Checkbox6 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox7" Then
				$OverlaySettings_Checkbox7 = $StringSplit[2] ;;; Add Apps based on their Tags to the Categories ;;;
				If $OverlaySettings_Checkbox7 <> "" Then
					If $OverlaySettings_Checkbox7 <> $CurrentValue_CheckBox_7 Then
						IniWrite($Config_INI, "Settings", "Add_Apps_Tags_to_categories", $OverlaySettings_Checkbox7)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox7 = <" & $OverlaySettings_Checkbox7 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox8" Then
				$OverlaySettings_Checkbox8 = $StringSplit[2] ;;; Allow multiple Tag assigments ;;;
				If $OverlaySettings_Checkbox8 <> "" Then
					If $OverlaySettings_Checkbox8 <> $CurrentValue_CheckBox_8 Then
						IniWrite($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", $OverlaySettings_Checkbox8)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox8 = <" & $OverlaySettings_Checkbox8 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox9" Then
				$OverlaySettings_Checkbox9 = $StringSplit[2] ;;; Add number of current Players to the game Icons ;;;
				If $OverlaySettings_Checkbox9 <> "" Then
					If $OverlaySettings_Checkbox9 <> $CurrentValue_CheckBox_9 Then
						IniWrite($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", $OverlaySettings_Checkbox9)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox9 = <" & $OverlaySettings_Checkbox9 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox10" Then
				$OverlaySettings_Checkbox10 = $StringSplit[2] ;;; Add the Resolution Scale Value to the game Icons ;;;
				If $OverlaySettings_Checkbox10 <> "" Then
					If $OverlaySettings_Checkbox10 <> $CurrentValue_CheckBox_10 Then
						IniWrite($Config_INI, "Settings", "Add_SS_to_Icons", $OverlaySettings_Checkbox10)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox10 = <" & $OverlaySettings_Checkbox10 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox11" Then
				$OverlaySettings_Checkbox11 = $StringSplit[2] ;;; Allow Read/Write of the Resolution Scale Value;;;
				If $OverlaySettings_Checkbox11 <> "" Then
					If $OverlaySettings_Checkbox11 <> $CurrentValue_CheckBox_11 Then
						IniWrite($Config_INI, "Settings", "Add_SS_per_game", $OverlaySettings_Checkbox11)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox11 = <" & $OverlaySettings_Checkbox11 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox12" Then
				$OverlaySettings_Checkbox12 = $StringSplit[2] ;;; Create HTML Game Pages ;;;
				If $OverlaySettings_Checkbox12 <> "" Then
					If $OverlaySettings_Checkbox12 <> $CurrentValue_CheckBox_12 Then
						IniWrite($Config_INI, "Settings", "Create_HTML_GamePage", $OverlaySettings_Checkbox12)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox12 = <" & $OverlaySettings_Checkbox12 & ">")
			EndIf
			If $StringSplit[1] = "Settings_Checkbox13" Then
				$OverlaySettings_Checkbox13 = $StringSplit[2] ;;; Delete old HomeLoader Library Data first ;;;
				If $OverlaySettings_Checkbox13 <> "" Then
					If $OverlaySettings_Checkbox13 <> $CurrentValue_CheckBox_13 Then
						IniWrite($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", $OverlaySettings_Checkbox13)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox13 = <" & $OverlaySettings_Checkbox13 & ">")
			EndIf

			If $StringSplit[1] = "LabelCategory3" Then
				If $StringSplit[2] <> "" Then
					If $StringSplit[2] <> $CurrentValue_TAB3_Name Then
						IniWrite($Config_INI, "Settings", "TAB3_Name", $CurrentValue_TAB3_Name)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCategory3 = <" & $StringSplit[2] & ">")
			EndIf

			If $StringSplit[1] = "LabelCategory4" Then
				If $StringSplit[2] <> "" Then
					If $StringSplit[2] <> $CurrentValue_TAB4_Name Then
						IniWrite($Config_INI, "Settings", "TAB4_Name", $CurrentValue_TAB4_Name)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCategory4 = <" & $StringSplit[2] & ">")
			EndIf

			If $StringSplit[1] = "LabelCategory5" Then
				If $StringSplit[2] <> "" Then
					If $StringSplit[2] <> $CurrentValue_TAB5_Name Then
						IniWrite($Config_INI, "Settings", "TAB5_Name", $CurrentValue_TAB5_Name)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCategory5 = <" & $StringSplit[2] & ">")
			EndIf

			If $StringSplit[1] = "LabelCategory6" Then
				If $StringSplit[2] <> "" Then
					If $StringSplit[2] <> $CurrentValue_TAB6_Name Then
						IniWrite($Config_INI, "Settings", "TAB6_Name", $CurrentValue_TAB6_Name)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCategory6 = <" & $StringSplit[2] & ">")
			EndIf
		Next
		_Write_UpdateLibrary_to_VRUB_PersistentStore_File()
	EndIf
	_Read_Scan_Settings()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End Updating Overlay.")
EndFunc   ;==>_Read_from_VRUB_PersistentStore_File

Func _Write_UpdateLibrary_to_VRUB_PersistentStore_File()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start _Write_UpdateLibrary_to_VRUB_PersistentStore_File()")
	Local $UpdateLibrary_Value = "false"
	Local $NEW_sText = ""
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
	Local $sText = FileRead($filePath)
	Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

	For $i1 = 1 To $aArray[0]
		Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
		Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
		Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
		Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

		If $StringSplit[1] = "UpdateLibrary" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $UpdateLibrary_Value & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $UpdateLibrary_Value & '"}'
			EndIf
		Else
			$NEW_sText = $NEW_sText & $aArray[$i1] & ","
		EndIf
	Next
	Local $StringRightCheck = StringRight($NEW_sText, '1')
	If $StringRightCheck = "," Then $NEW_sText = StringTrimRight($NEW_sText, '1')
	Local $StringLeftCheck = StringLeft($NEW_sText, '1')
	If $StringLeftCheck <> "{" Then $NEW_sText = "{" & $NEW_sText
	If FileExists($filePath) Then FileDelete($filePath)
	FileWrite($filePath, $NEW_sText)
EndFunc   ;==>_Write_UpdateLibrary_to_VRUB_PersistentStore_File

Func _Write_AppIDLoaded_FuncLoaded_to_VRUB_PersistentStore_File()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start _Write_SAVE_to_VRUB_PersistentStore_File()")
	Local $NEW_sText = ""
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
	Local $sText = FileRead($filePath)
	Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

	For $i1 = 1 To $aArray[0]
		Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
		Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
		Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
		Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

		If $StringSplit[1] = "AppIDLoaded" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '"}'
			EndIf
		Else
			If $StringSplit[1] = "FuncLoaded" Then
				If $i1 <> $aArray[0] Then
					$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '",'
				Else
					$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '"}'
				EndIf
			Else
				$NEW_sText = $NEW_sText & $aArray[$i1] & ","
			EndIf
		EndIf
	Next
	Local $StringRightCheck = StringRight($NEW_sText, '1')
	If $StringRightCheck = "," Then $NEW_sText = StringTrimRight($NEW_sText, '1')
	Local $StringLeftCheck = StringLeft($NEW_sText, '1')
	If $StringLeftCheck <> "{" Then $NEW_sText = "{" & $NEW_sText
	If FileExists($filePath) Then FileDelete($filePath)
	FileWrite($filePath, $NEW_sText)
EndFunc   ;==>_Write_AppIDLoaded_FuncLoaded_to_VRUB_PersistentStore_File

Func _Write_Settings_to_VRUB_PersistentStore_File()
	Local $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	Local $NEW_sText = ""
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
	Local $sText = FileRead($filePath)
	Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)
	Local $Setting_Exist = ""

	Local $CurrentValue_HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")

	Local $CurrentValue_CheckBox_1 = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
	Local $CurrentValue_CheckBox_2 = IniRead($Config_INI, "Settings", "Request_Steamdb_info", "")
	Local $CurrentValue_CheckBox_3 = IniRead($Config_INI, "Settings", "Use_Steam_Tags", "")
	Local $CurrentValue_CheckBox_4 = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
	Local $CurrentValue_CheckBox_5 = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
	Local $CurrentValue_CheckBox_6 = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
	Local $CurrentValue_CheckBox_7 = IniRead($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "")
	Local $CurrentValue_CheckBox_8 = IniRead($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "")
	Local $CurrentValue_CheckBox_9 = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "")
	Local $CurrentValue_CheckBox_10 = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "")
	Local $CurrentValue_CheckBox_11 = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	Local $CurrentValue_CheckBox_12 = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
	Local $CurrentValue_CheckBox_13 = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")

	Local $CurrentValue_TAB3_Name = IniRead($Config_INI, "Settings", "TAB3_Name", "")
	Local $CurrentValue_TAB4_Name = IniRead($Config_INI, "Settings", "TAB4_Name", "")
	Local $CurrentValue_TAB5_Name = IniRead($Config_INI, "Settings", "TAB5_Name", "")
	Local $CurrentValue_TAB6_Name = IniRead($Config_INI, "Settings", "TAB6_Name", "")

	Local $CurrentValue_ScanOnlyVR = IniRead($Config_INI, "Settings", "ScanOnlyVR", "")

	For $i1 = 1 To $aArray[0]
		$Setting_Exist = ""
		Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
		Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
		Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
		Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

		If $StringSplit[1] = "HomeApp" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_HomeApp & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_HomeApp & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "AppIDSelected" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "AppIDLoaded" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "FuncLoaded" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox1" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_1 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_1 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox2" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_2 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_2 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox3" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_3 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_3 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox4" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_4 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_4 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox5" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_5 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_5 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox6" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_6 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_6 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox7" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_7 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_7 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox8" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_8 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_8 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox9" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_9 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_9 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox10" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_10 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_10 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox11" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_11 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_11 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox12" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_12 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_12 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "Settings_Checkbox13" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_13 & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_CheckBox_13 & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf


		If $StringSplit[1] = "LabelCategory3" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_TAB3_Name & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_TAB3_Name & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "LabelCategory4" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_TAB4_Name & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_TAB4_Name & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "LabelCategory5" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_TAB5_Name & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_TAB5_Name & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $StringSplit[1] = "LabelCategory6" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_TAB6_Name & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_TAB6_Name & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf


		If $StringSplit[1] = "ScanOnlyVR" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_ScanOnlyVR & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $CurrentValue_ScanOnlyVR & '"}'
			EndIf
			$Setting_Exist = "true"
		EndIf

		If $Setting_Exist <> "true" Then
			$NEW_sText = $NEW_sText & $aArray[$i1] & ","
		EndIf
	Next
	Local $StringRightCheck = StringRight($NEW_sText, '1')
	If $StringRightCheck = "," Then $NEW_sText = StringTrimRight($NEW_sText, '1')
	Local $StringLeftCheck = StringLeft($NEW_sText, '1')
	If $StringLeftCheck <> "{" Then $NEW_sText = "{" & $NEW_sText
	If FileExists($filePath) Then FileDelete($filePath)
	FileWrite($filePath, $NEW_sText)
EndFunc   ;==>_Write_Settings_to_VRUB_PersistentStore_File

Func _Write_ResolutionScale_OVERLAY_to_SteamVR_VRSettings()
	Local $OverlaySettings_AppIDSelected, $Steam_app_Name, $OverlaySettings_App_ResolutionScale, $SteamAppExist, $ApplicationList_TEMP
	$Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
	Local $sText = FileRead($filePath)
	Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

	$ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
	If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI

	If $Add_SS_per_game = "true" Then

		For $i1 = 1 To $aArray[0]
			Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
			Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
			Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
			Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

			If $StringSplit[1] = "AppIDSelected" Then
				If $StringSplit[2] <> "" Then
					$OverlaySettings_AppIDSelected = $StringSplit[2]
				EndIf
			EndIf
			If $StringSplit[1] = $OverlaySettings_AppIDSelected & "_resolutionScale" Then
				If $StringSplit[2] <> "" Then
					$OverlaySettings_App_ResolutionScale = $StringSplit[2]
					;MsgBox(0, $OverlaySettings_AppIDSelected, $OverlaySettings_App_ResolutionScale)
					ExitLoop
				EndIf
			EndIf
		Next

		$Game_ID = $OverlaySettings_AppIDSelected
		;MsgBox(0, "1168", $Game_ID)
		$Steam_app_Name = IniRead($ApplicationList_TEMP, "Application_" & $Game_ID, "name", "")
		If $ScanOnlyVR = "true" Then $Steam_app_Name = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Game_ID, "name", "")
		;MsgBox(0, "1171", $Steam_app_Name)

		;MsgBox(0, "1173", $OverlaySettings_App_ResolutionScale)

		Local $FileLines = _FileCountLines($Steamvr_vrsettings_FilePath)
		_FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)
		$Loop_End_1 = $Steamvr_vrsettings_Array[0]

		For $LOOP = 1 To $Loop_End_1
			$Steamvr_vrsettings_aArray = _StringBetween($Steamvr_vrsettings_Array[$LOOP], '"', '"', $STR_ENDNOTSTART)
			If $Steamvr_vrsettings_aArray <> "" Then
				If $Steamvr_vrsettings_aArray <> 0 Then
					If $Steamvr_vrsettings_aArray[0] <> "" Then
						Local $Check_Left = StringLeft($Steamvr_vrsettings_aArray[0], 10)
						Local $Check_Right = $Game_ID

						If $Steamvr_vrsettings_aArray[0] = "steam.app." & $Check_Right Then
							$SteamAppExist = "true"
							$Steam_app_Name_TEMP = _StringBetween($Steamvr_vrsettings_Array[$LOOP + 1], '"', '"', $STR_ENDNOTSTART)
							$ResolutionScale_TEMP = StringRight($Steamvr_vrsettings_Array[$LOOP + 2], 3)
							$ResolutionScale_TEMP = $OverlaySettings_App_ResolutionScale
							Local $SteamAppID_TEMP = $Check_Right

							;Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
							;IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "name", $Steam_app_Name_TEMP[1])
							;IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
							;$ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
							;IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "name", $Steam_app_Name_TEMP[1])
							;IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])

							;$ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
							;IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
							;IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
							;$ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
							;IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
							;IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)

							For $Loop_Temp = 1 To 6
								If $Loop_Temp = 1 Then $ApplicationList_TEMP_RS = $ApplicationList_SteamLibrary_ALL_INI
								If $Loop_Temp = 2 Then $ApplicationList_TEMP_RS = $ApplicationList_SteamVRLibrary_ALL_INI
								If $Loop_Temp = 3 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_1_INI
								If $Loop_Temp = 4 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_2_INI
								If $Loop_Temp = 5 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_3_INI
								If $Loop_Temp = 6 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_4_INI
								Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "NR", "")
								Local $ID_Exist_Check_1 = IniRead($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "appid", "")

								If $ID_Exist_Check_1 <> "" Then
									IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "name", $Steam_app_Name_TEMP[1])
									IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
									IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
									IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
								EndIf
							Next

							FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   "steam.app.' & $SteamAppID_TEMP & '" : {')
							FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "appName" : "' & $Steam_app_Name_TEMP[1] & '",')
							FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "resolutionScale" : ' & $ResolutionScale_TEMP & '')
							FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   },')
							$LOOP = $LOOP + 3
						Else
							FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$LOOP])
						EndIf
					EndIf
				EndIf
			Else
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$LOOP])
			EndIf
		Next

		If $SteamAppExist = "false" Then
			If FileExists($Steamvr_vrsettings_FilePath & ".new") Then FileDelete($Steamvr_vrsettings_FilePath & ".new")
			Local $SteamAppID_TEMP = $Game_ID
			Local $Steam_app_Name_TEMP = $Steam_app_Name
			Local $ResolutionScale_TEMP = $OverlaySettings_App_ResolutionScale

			For $LOOP = 1 To $Loop_End_1 - 2
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$LOOP])
			Next

			Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
			Local $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")

			If $ButtonTAB_State = "1" Then
				If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
				If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
			EndIf
			If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
			If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
			If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
			If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
			If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

			For $Loop_Temp = 1 To 6
				If $Loop_Temp = 1 Then $ApplicationList_TEMP_RS = $ApplicationList_SteamLibrary_ALL_INI
				If $Loop_Temp = 2 Then $ApplicationList_TEMP_RS = $ApplicationList_SteamVRLibrary_ALL_INI
				If $Loop_Temp = 3 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_1_INI
				If $Loop_Temp = 4 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_2_INI
				If $Loop_Temp = 5 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_3_INI
				If $Loop_Temp = 6 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_4_INI
				Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "NR", "")

				Local $ID_Exist_Check_1 = IniRead($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "appid", "")

				If $ID_Exist_Check_1 <> "" Then
					IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "name", $Steam_app_Name_TEMP)
					IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
					IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP)
					IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
				EndIf
			Next

			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   },')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   "steam.app.' & $SteamAppID_TEMP & '" : {')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "appName" : "' & $Steam_app_Name_TEMP & '",')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "resolutionScale" : ' & $ResolutionScale_TEMP & '')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   }')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '}')
		EndIf
		If FileExists($Steamvr_vrsettings_FilePath) Then FileDelete($Steamvr_vrsettings_FilePath)
		FileMove($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_FilePath)
		_Get_AD_SS_Values_to_Icons()
		_Sync_Icons()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Resolution Scale Values updated for: " & $Steam_app_Name_TEMP & "[" & $SteamAppID_TEMP & ":" & $OverlaySettings_App_ResolutionScale & "]")
	Else
		MsgBox($MB_ICONINFORMATION, "Attention!", "Read/Write Resolution Scale is disabled." & @CRLF & _
				"Enable it in the Settings to be able to use this function.")
	EndIf
EndFunc   ;==>_Write_ResolutionScale_OVERLAY_to_SteamVR_VRSettings

Func _Write_ALL_Categories_to_VRUB_PersistentStore_File()
	Local $NEW_sText = ""
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
	Local $sText = FileRead($filePath)
	Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)
	Local $Steam_appid, $NR_Applications_Temp, $Value_Category_1_ALL, $Value_Category_1_VR, $Value_Category_2, $Value_Category_3
	Local $Value_Category_4, $Value_Category_5, $Value_Category_6, $Value_Category_7, $Value_Category_8


	If FileExists($ApplicationList_SteamLibrary_ALL_INI) Then
		$NR_Applications_Temp = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		If $NR_Applications_Temp <> "" Then
			For $Loop_1 = 1 To $NR_Applications_Temp
				$Steam_appid = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_1, "appid", "")
				$Value_Category_1_ALL = $Value_Category_1_ALL & "_" & $Steam_appid
			Next
		EndIf
	EndIf
	If StringLeft($Value_Category_1_ALL, 1) = "_" Then $Value_Category_1_ALL = StringTrimLeft($Value_Category_1_ALL, 1)
	If StringRight($Value_Category_1_ALL, 1) = "_" Then $Value_Category_1_ALL = StringTrimRight($Value_Category_1_ALL, 1)

	If FileExists($ApplicationList_SteamVRLibrary_ALL_INI) Then
		$NR_Applications_Temp = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		If $NR_Applications_Temp <> "" Then
			For $Loop_1 = 1 To $NR_Applications_Temp
				$Steam_appid = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Loop_1, "appid", "")
				$Value_Category_1_VR = $Value_Category_1_VR & "_" & $Steam_appid
			Next
		EndIf
	EndIf
	If StringLeft($Value_Category_1_VR, 1) = "_" Then $Value_Category_1_VR = StringTrimLeft($Value_Category_1_VR, 1)
	If StringRight($Value_Category_1_VR, 1) = "_" Then $Value_Category_1_VR = StringTrimRight($Value_Category_1_VR, 1)

	;;;

	If FileExists($ApplicationList_Non_Steam_Appl_INI) Then
		$NR_Applications_Temp = IniRead($ApplicationList_Non_Steam_Appl_INI, "ApplicationList", "NR_Applications", "")
		If $NR_Applications_Temp <> "" Then
			For $LOOP_2 = 1 To $NR_Applications_Temp
				$Steam_appid = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $LOOP_2, "appid", "")
				$Value_Category_2 = $Value_Category_2 & "_" & $Steam_appid
			Next
		EndIf
	EndIf
	If StringLeft($Value_Category_2, 1) = "_" Then $Value_Category_2 = StringTrimLeft($Value_Category_2, 1)
	If StringRight($Value_Category_2, 1) = "_" Then $Value_Category_2 = StringTrimRight($Value_Category_2, 1)

	;;;


	If FileExists($ApplicationList_Custom_1_INI) Then
		$NR_Applications_Temp = IniRead($ApplicationList_Custom_1_INI, "ApplicationList", "NR_Applications", "")
		If $NR_Applications_Temp <> "" Then
			For $LOOP_3 = 1 To $NR_Applications_Temp
				$Steam_appid = IniRead($ApplicationList_Custom_1_INI, "Application_" & $LOOP_3, "appid", "")
				$Value_Category_3 = $Value_Category_3 & "_" & $Steam_appid
			Next
		EndIf
	EndIf
	If StringLeft($Value_Category_3, 1) = "_" Then $Value_Category_3 = StringTrimLeft($Value_Category_3, 1)
	If StringRight($Value_Category_3, 1) = "_" Then $Value_Category_3 = StringTrimRight($Value_Category_3, 1)

	;;;


	If FileExists($ApplicationList_Custom_2_INI) Then
		$NR_Applications_Temp = IniRead($ApplicationList_Custom_2_INI, "ApplicationList", "NR_Applications", "")
		If $NR_Applications_Temp <> "" Then
			For $Loop_4 = 1 To $NR_Applications_Temp
				$Steam_appid = IniRead($ApplicationList_Custom_2_INI, "Application_" & $Loop_4, "appid", "")
				$Value_Category_4 = $Value_Category_4 & "_" & $Steam_appid
			Next
		EndIf
	EndIf
	If StringLeft($Value_Category_4, 1) = "_" Then $Value_Category_4 = StringTrimLeft($Value_Category_4, 1)
	If StringRight($Value_Category_4, 1) = "_" Then $Value_Category_4 = StringTrimRight($Value_Category_4, 1)

	;;;

	If FileExists($ApplicationList_Custom_3_INI) Then
		$NR_Applications_Temp = IniRead($ApplicationList_Custom_3_INI, "ApplicationList", "NR_Applications", "")
		If $NR_Applications_Temp <> "" Then
			For $Loop_5 = 1 To $NR_Applications_Temp
				$Steam_appid = IniRead($ApplicationList_Custom_3_INI, "Application_" & $Loop_5, "appid", "")
				$Value_Category_5 = $Value_Category_5 & "_" & $Steam_appid
			Next
		EndIf
	EndIf
	If StringLeft($Value_Category_5, 1) = "_" Then $Value_Category_5 = StringTrimLeft($Value_Category_5, 1)
	If StringRight($Value_Category_5, 1) = "_" Then $Value_Category_5 = StringTrimRight($Value_Category_5, 1)

	;;;

	If FileExists($ApplicationList_Custom_4_INI) Then
		$NR_Applications_Temp = IniRead($ApplicationList_Custom_4_INI, "ApplicationList", "NR_Applications", "")
		If $NR_Applications_Temp <> "" Then
			For $Loop_6 = 1 To $NR_Applications_Temp
				$Steam_appid = IniRead($ApplicationList_Custom_4_INI, "Application_" & $Loop_6, "appid", "")
				$Value_Category_6 = $Value_Category_6 & "_" & $Steam_appid
			Next
		EndIf
	EndIf
	If StringLeft($Value_Category_6, 1) = "_" Then $Value_Category_6 = StringTrimLeft($Value_Category_6, 1)
	If StringRight($Value_Category_6, 1) = "_" Then $Value_Category_6 = StringTrimRight($Value_Category_6, 1)

	;;;

	If FileExists($ApplicationList_SteamVRLibrary_ALL_INI) Then
		$NR_Applications_Temp = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		If $NR_Applications_Temp <> "" Then
			For $Loop_7 = 1 To $NR_Applications_Temp
				$Steam_appid = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Loop_7, "appid", "")
				If StringLeft($Steam_appid, 9) = "vive.htc." Then
					$Value_Category_7 = $Value_Category_7 & "_" & $Steam_appid
				EndIf
			Next
		EndIf
	EndIf
	If StringLeft($Value_Category_7, 1) = "_" Then $Value_Category_7 = StringTrimLeft($Value_Category_7, 1)
	If StringRight($Value_Category_7, 1) = "_" Then $Value_Category_7 = StringTrimRight($Value_Category_7, 1)


	;;;

	If FileExists($ApplicationList_SteamVRLibrary_ALL_INI) Then
		$NR_Applications_Temp = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		If $NR_Applications_Temp <> "" Then
			For $Loop_8 = 1 To $NR_Applications_Temp
				$Steam_appid = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Loop_8, "appid", "")
				If StringLeft($Steam_appid, 11) = "revive.app." Then
					$Value_Category_8 = $Value_Category_8 & "_" & $Steam_appid
				EndIf
			Next
		EndIf
	EndIf
	If StringLeft($Value_Category_8, 1) = "_" Then $Value_Category_8 = StringTrimLeft($Value_Category_8, 1)
	If StringRight($Value_Category_8, 1) = "_" Then $Value_Category_8 = StringTrimRight($Value_Category_8, 1)


	;;;


	For $i1 = 1 To $aArray[0]
		Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
		Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
		Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
		Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

		If $StringSplit[1] = "Category_1_ALL" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_1_ALL & '",'
			Else
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_1_ALL & '"}'
			EndIf
		Else
			If $StringSplit[1] = "Category_1_VR" Then
				If $i1 <> $aArray[0] Then
					$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_1_VR & '",'
				Else
					$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_1_VR & '"}'
				EndIf
			Else
				If $StringSplit[1] = "Category_2" Then
					If $i1 <> $aArray[0] Then
						$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_2 & '",'
					Else
						$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_2 & '"}'
					EndIf
				Else
					If $StringSplit[1] = "Category_3" Then
						If $i1 <> $aArray[0] Then
							$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_3 & '",'
						Else
							$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_3 & '"}'
						EndIf
					Else
						If $StringSplit[1] = "Category_4" Then
							If $i1 <> $aArray[0] Then
								$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_4 & '",'
							Else
								$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_4 & '"}'
							EndIf
						Else
							If $StringSplit[1] = "Category_5" Then
								If $i1 <> $aArray[0] Then
									$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_5 & '",'
								Else
									$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_5 & '"}'
								EndIf
							Else
								If $StringSplit[1] = "Category_6" Then
									If $i1 <> $aArray[0] Then
										$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_6 & '",'
									Else
										$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_6 & '"}'
									EndIf
								Else
									If $StringSplit[1] = "Category_7" Then
										If $i1 <> $aArray[0] Then
											$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_7 & '",'
										Else
											$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_7 & '"}'
										EndIf
									Else
										If $StringSplit[1] = "Category_8" Then
											If $i1 <> $aArray[0] Then
												$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_8 & '",'
											Else
												$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $Value_Category_8 & '"}'
											EndIf
										Else
											If $StringSplit[1] = "AppIDSelected" Then
												If $i1 <> $aArray[0] Then
													$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '",'
												Else
													$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '"}'
												EndIf
											Else
												If $StringSplit[1] = "AppIDLoaded" Then
													If $i1 <> $aArray[0] Then
														$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '",'
													Else
														$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '"}'
													EndIf
												Else
													If $StringSplit[1] = "FuncLoaded" Then
														If $i1 <> $aArray[0] Then
															$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '",'
														Else
															$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & "" & '"}'
														EndIf
													Else
														$NEW_sText = $NEW_sText & $aArray[$i1] & ","
													EndIf
												EndIf
											EndIf
										EndIf
									EndIf
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Next
	Local $StringRightCheck = StringRight($NEW_sText, '1')
	If $StringRightCheck = "," Then $NEW_sText = StringTrimRight($NEW_sText, '1')
	Local $StringLeftCheck = StringLeft($NEW_sText, '1')
	If $StringLeftCheck <> "{" Then $NEW_sText = "{" & $NEW_sText
	If FileExists($filePath) Then FileDelete($filePath)
	FileWrite($filePath, $NEW_sText)
EndFunc   ;==>_Write_ALL_Categories_to_VRUB_PersistentStore_File

#EndRegion Func Overlay Functions

#Region Func Radio Selection
Func _StartUp_Overlay_Radio_1() ; SteamVR Home
	Local $Old_HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "SteamVR Home")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $SteamVR_Path & "tools\steamvr_environments\game\bin\win64\steamtours.exe")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "SteamVR Home")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "250820")

	If IniRead($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "") = "true" Then
		IniWrite($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "true")
		IniWrite($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "")
	EndIf

	If $Old_HomeApp = "VR Toolbox" Then _Start_Create_HTML_GamePages_All()
EndFunc

Func _StartUp_Overlay_Radio_2() ; Vive Home
	Local $Old_HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Setting Home App to Vive Home:")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Vive Home")
	Local $ViveHome_SDK_Path = $Install_DIR & "Apps\ViveHome\ViveHomeSDKTestbed.exe"
	Local $ViveHome_Path = $HTCVive_Path & "Updater\App\Home\win32\ViveHome.exe"

	If IniRead($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "") = "true" Then
		IniWrite($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "true")
		IniWrite($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "")
	EndIf

	If FileExists($ViveHome_SDK_Path) Then $ViveHome_Path = $ViveHome_SDK_Path

	FileWriteLine($stats_log_FILE, "- Vive Home Path = " & $ViveHome_Path)

	If FileExists($ViveHome_Path) Then
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $ViveHome_Path)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	Else
		Local $FileSelect = FileOpenDialog("Select 'VIVEHome.exe' File", $Install_DIR, "Executable (*.exe)")
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	EndIf

	If FileExists($ViveHome_Path) Then
		IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
		;_ADD_2_SteamVR_Home_default()
	EndIf
	If $Old_HomeApp = "VR Toolbox" Then _Start_Create_HTML_GamePages_All()
EndFunc

Func _StartUp_Overlay_Radio_3() ; None
	Local $Old_HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	$HomeApp = "None"
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "None")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "None")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")

	If IniRead($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "") = "true" Then
		IniWrite($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "true")
		IniWrite($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "")
	EndIf

	If $Old_HomeApp = "VR Toolbox" Then _Start_Create_HTML_GamePages_All()
EndFunc

Func _StartUp_Overlay_Radio_3_Backup() ; Janus VR Backup
	Local $Old_HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Janus VR")
	Global $JanusVR_Path = ""
	If FileExists($Install_Folder_Steam_1 & "SteamApps\common\Janus VR\janusvr.exe") Then $JanusVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\Janus VR\janusvr.exe"
	If FileExists($Install_Folder_Steam_2 & "SteamApps\common\Janus VR\janusvr.exe") Then $JanusVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\Janus VR\janusvr.exe"
	If FileExists($Install_Folder_Steam_3 & "SteamApps\common\Janus VR\janusvr.exe") Then $JanusVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\Janus VR\janusvr.exe"
	If FileExists($Install_Folder_Steam_4 & "SteamApps\common\Janus VR\janusvr.exe") Then $JanusVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\Janus VR\janusvr.exe"
	If FileExists($Install_Folder_Steam_5 & "SteamApps\common\Janus VR\janusvr.exe") Then $JanusVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\Janus VR\janusvr.exe"
	If $JanusVR_Path = "" Then $JanusVR_Path = "steam://rungameid/602090"
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $JanusVR_Path)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Janus VR")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "602090")

	If IniRead($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "") = "true" Then
		IniWrite($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "true")
		IniWrite($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "")
	EndIf

	;If $Create_JanusVR_Bookmark = "true" Then
		;_RM_Create_Janus_VR_bookmarks()
	;EndIf

	;If $JanusVR_Autostart_HomeLoader_Room = "true" Then
		;_RM_Autostart_HomeLoader_Room()
	;EndIf

	If $Old_HomeApp = "VR Toolbox" Then _Start_Create_HTML_GamePages_All()
EndFunc

Func _StartUp_Overlay_Radio_4() ; VR Toolbox
	Local $Old_HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "VR Toolbox")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "488040")

	IniWrite($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "true")

	;_ADD_2_SteamVR_Home_default()
	;_Sync_Config_INI()
	If $Add_HomeLoader_to_VRToolbox_StartPage = "true" Then
		_Start_HomeLoaderLibrary_UpdateStartPage()
	EndIf
	If $Old_HomeApp <> "VR Toolbox" Then _Start_Create_HTML_GamePages_All()
EndFunc

Func _StartUp_Overlay_Radio_5() ; Other
	Local $Old_HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	;;;
EndFunc

Func _StartUp_Overlay_Radio_6() ; Viveport VR
	Local $Old_HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Setting Home App to Viveport VR:")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Viveport VR")
	Local $Viveport_Path = $HTCVive_Path & "Updater\App\ViveportVR\VPNextApp.exe"

	If IniRead($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "") = "true" Then
		IniWrite($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "true")
		IniWrite($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "")
	EndIf

	FileWriteLine($stats_log_FILE, "- ViveportVR Path = " & $Viveport_Path)

	If FileExists($Viveport_Path) Then
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $Viveport_Path)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Viveport VR")
	Else
		Local $FileSelect = FileOpenDialog("Select 'VPNextApp.exe' File", $Install_DIR, "Executable (*.exe)")
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Viveport VR")
	EndIf

	If FileExists($Viveport_Path) Then
		IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
		;_ADD_2_SteamVR_Home_default()
	EndIf
	If $Old_HomeApp = "VR Toolbox" Then _Start_Create_HTML_GamePages_All()
EndFunc

Func _StartUp_Overlay_Radio_7() ; BIGSCREEN
	Local $Old_HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Bigscreen")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/457550")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Bigscreen Beta")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "457550")

	If IniRead($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "") = "true" Then
		IniWrite($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "true")
		IniWrite($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "")
	EndIf

	If $Old_HomeApp = "VR Toolbox" Then _Start_Create_HTML_GamePages_All()
EndFunc

Func _StartUp_Overlay_Radio_8() ; Virtual Desktop
	Local $Old_HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Virtual Desktop")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/382110")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Virtual Desktop")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "382110")

	If IniRead($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "") = "true" Then
		IniWrite($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "true")
		IniWrite($Config_INI, "TEMP", "Open_HTML_GamePage_OnStart", "")
	EndIf

	If $Old_HomeApp = "VR Toolbox" Then _Start_Create_HTML_GamePages_All()
EndFunc
#endregion

#Region Func Restart/Exit
Func _Start_Create_HTMLGamePage_GUI()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Func --> '_Start_Create_HTMLGamePage_GUI() Started8'")
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "GamePageMode", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "GamePageMode", $Install_DIR)
	EndIf
EndFunc   ;==>_Start_Create_HTMLGamePage_GUI

Func _Start_HomeLoader_UpdateLibrary()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_HomeLoader_UpdateLibrary()'")
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "UpdateLibrary", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "UpdateLibrary", $Install_DIR)
	EndIf
EndFunc   ;==>_Start_HomeLoader_UpdateLibrary

Func _Start_HomeLoader_VROverlay()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_HomeLoader_VROverlay()'")
	;_Write_AppIDLoaded_FuncLoaded_to_VRUB_PersistentStore_File()
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "VROverlay", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "VROverlay", $Install_DIR)
	EndIf
EndFunc   ;==>_Start_HomeLoader_VROverlay

Func _Start_Home_APP_File()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_Home_APP_File()'")
	_StartHomeApp()
	;If FileExists($System_DIR & "StartHomeApp.exe") Then
	;	ShellExecute($System_DIR & "StartHomeApp.exe", "", $System_DIR)
	;Else
	;	ShellExecute($System_DIR & "StartHomeApp.au3", "", $System_DIR)
	;EndIf
	;Exit
EndFunc   ;==>_Start_Home_APP_File

Func _FirstStart_Restart()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_FirstStart_Restart()'")
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	Exit
EndFunc   ;==>_FirstStart_Restart


Func _Read_SteamVR_VRSettings_IN()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Read_SteamVR_VRSettings_IN()'")
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecuteWait($System_DIR & "HomeLoaderLibrary.exe", "Read_SteamVR_VRSettings_IN", $System_DIR)
	Else
		ShellExecuteWait($System_DIR & "HomeLoaderLibrary.au3", "Read_SteamVR_VRSettings_IN", $System_DIR)
	EndIf
EndFunc   ;==>_Read_SteamVR_VRSettings_IN

#EndRegion Func Restart/Exit

