
#Region Includes
#include <File.au3>
#include <Date.au3>
#include <Array.au3>
#include <String.au3>
#include "HomeLoaderLibrary.au3"
#endregion

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
Global $ReadLine_AppID,$ReadLine_appName, $ReadLine_resolutionScale, $ReadLine_AppID, $ReadLine_appName, $ReadLine_resolutionScale
Global $FileSize, $FileContent, $FileContent_Left, $FileContent_Right, $Loop_End_1
Global $SteamVR_VRSettings_Content, $SteamVR_VRSettings_Count
Global $SteamVR_VRSettings_Array_1[1][4] = [["Steam App ID", "Name", "Resolution Scale", "Added"]]
#endregion

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
Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"

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

Global $State_Checkbox_Autostart_VRUB = IniRead($config_ini,"Settings", "Autostart_VRUB", "")

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

#endregion

#region Declare Names
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
#endregion

#Region Start Check
Local $Parameter_1 = ""
If $CmdLine[0] Then
	$Parameter_1 = $CmdLine[1]
EndIf

If $Parameter_1 = "StartHomeLoaderHomeApp" Then
	_Start_HomeLoader_HomeApp()
	_Start_HomeLoader_UpdateLibrary()
	Exit
EndIf

If $Parameter_1 = "StartSteamVRHome" Then
	_StartSteamVRHome()
EndIf

If $Parameter_1 = "GamePageMode" Then
	_Create_HTMLGamePage_GUI()
	Exit
EndIf

If $Parameter_1 = "Create_HTML_GamePages_All" Then
	_RM_Create_HTML_GamePages_All()
	Exit
EndIf

If $Parameter_1 = "Start_Shortcut_1" Then
	MsgBox(0, "Start_Shortcut_1", "Start_Shortcut_1")
	Exit
EndIf
#endregion


#Region Func MAIN
Func _StartSteamVRHome()
	FileWrite($stats_log_FILE, @CRLF & "[Start SteamVR and HomeLoader StartUp Process: " & _Now() & "]" & @CRLF)
	$stats_log_FILE = @ScriptDir & "\System\Logs\stats_log.txt"
	#region Start Check
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

	If $ScanLibrary_OnStart_SettingValue = "true" Then
		_Start_HomeLoader_UpdateLibrary()
	EndIf

	;FileWrite($stats_log_FILE, @CRLF & "[End SteamVR and HomeLoader StartUp Process: " & _Now() & "]" & @CRLF)
	#endregion

	Exit
	;_Exit()
EndFunc



Func _Read_from_VRUB_PersistentStore_File()
	FileWriteLine($stats_log_FILE,"[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Read_from_VRUB_PersistentStore_File()'")
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

			If $StringSplit[1] = "OverlaySettings_Checkbox1" Then
				$OverlaySettings_Checkbox1 = $StringSplit[2] ;;; Scan with HomeApp Start ;;;
				If $OverlaySettings_Checkbox1 <> "" Then
					If $OverlaySettings_Checkbox1 <> $CurrentValue_CheckBox_1 Then
						IniWrite($Config_INI, "Settings", "ScanLibrary_OnStart", $OverlaySettings_Checkbox1)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox1 = <" & $OverlaySettings_Checkbox1 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox2" Then
				$OverlaySettings_Checkbox2 = $StringSplit[2] ;;; Request Steamdb Info ;;;
				If $OverlaySettings_Checkbox2 <> "" Then
					If $OverlaySettings_Checkbox2 <> $CurrentValue_CheckBox_2 Then
						IniWrite($Config_INI, "Settings", "Request_Steamdb_info", $OverlaySettings_Checkbox2)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox2 = <" & $OverlaySettings_Checkbox2 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox3" Then
				$OverlaySettings_Checkbox3 = $StringSplit[2] ;;; Request Steamdb Tags ;;;
				If $OverlaySettings_Checkbox3 <> "" Then
					If $OverlaySettings_Checkbox3 <> $CurrentValue_CheckBox_3 Then
						IniWrite($Config_INI, "Settings", "Use_Steam_Tags", $OverlaySettings_Checkbox3)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox3 = <" & $OverlaySettings_Checkbox3 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox4" Then
				$OverlaySettings_Checkbox4 = $StringSplit[2] ;;; Scan for Viveport Apps ;;;
				If $OverlaySettings_Checkbox4 <> "" Then
					If $OverlaySettings_Checkbox4 <> $CurrentValue_CheckBox_4 Then
						IniWrite($Config_INI, "Settings", "ScanVIVEApps", $OverlaySettings_Checkbox4)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox4 = <" & $OverlaySettings_Checkbox4 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox5" Then
				$OverlaySettings_Checkbox5 = $StringSplit[2] ;;; Scan for Oculus Apps ;;;
				If $OverlaySettings_Checkbox5 <> "" Then
					If $OverlaySettings_Checkbox5 <> $CurrentValue_CheckBox_5 Then
						IniWrite($Config_INI, "Settings", "ScanOculusApps", $OverlaySettings_Checkbox5)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox5 = <" & $OverlaySettings_Checkbox5 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox6" Then
				$OverlaySettings_Checkbox6 = $StringSplit[2] ;;; Sort Apps in Alphabetical order ;;;
				If $OverlaySettings_Checkbox6 <> "" Then
					If $OverlaySettings_Checkbox6 <> $CurrentValue_CheckBox_6 Then
						IniWrite($Config_INI, "Settings", "Sort_Alphabetical_order", $OverlaySettings_Checkbox6)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox6 = <" & $OverlaySettings_Checkbox6 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox7" Then
				$OverlaySettings_Checkbox7 = $StringSplit[2] ;;; Add Apps based on their Tags to the Categories ;;;
				If $OverlaySettings_Checkbox7 <> "" Then
					If $OverlaySettings_Checkbox7 <> $CurrentValue_CheckBox_7 Then
						IniWrite($Config_INI, "Settings", "Add_Apps_Tags_to_categories", $OverlaySettings_Checkbox7)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox7 = <" & $OverlaySettings_Checkbox7 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox8" Then
				$OverlaySettings_Checkbox8 = $StringSplit[2] ;;; Allow multiple Tag assigments ;;;
				If $OverlaySettings_Checkbox8 <> "" Then
					If $OverlaySettings_Checkbox8 <> $CurrentValue_CheckBox_8 Then
						IniWrite($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", $OverlaySettings_Checkbox8)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox8 = <" & $OverlaySettings_Checkbox8 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox9" Then
				$OverlaySettings_Checkbox9 = $StringSplit[2] ;;; Add number of current Players to the game Icons ;;;
				If $OverlaySettings_Checkbox9 <> "" Then
					If $OverlaySettings_Checkbox9 <> $CurrentValue_CheckBox_9 Then
						IniWrite($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", $OverlaySettings_Checkbox9)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox9 = <" & $OverlaySettings_Checkbox9 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox10" Then
				$OverlaySettings_Checkbox10 = $StringSplit[2] ;;; Add the Resolution Scale Value to the game Icons ;;;
				If $OverlaySettings_Checkbox10 <> "" Then
					If $OverlaySettings_Checkbox10 <> $CurrentValue_CheckBox_10 Then
						IniWrite($Config_INI, "Settings", "Add_SS_to_Icons", $OverlaySettings_Checkbox10)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox10 = <" & $OverlaySettings_Checkbox10 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox11" Then
				$OverlaySettings_Checkbox11 = $StringSplit[2] ;;; Allow Read/Write of the Resolution Scale Value;;;
				If $OverlaySettings_Checkbox11 <> "" Then
					If $OverlaySettings_Checkbox11 <> $CurrentValue_CheckBox_11 Then
						IniWrite($Config_INI, "Settings", "Add_SS_per_game", $OverlaySettings_Checkbox11)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox11 = <" & $OverlaySettings_Checkbox11 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox12" Then
				$OverlaySettings_Checkbox12 = $StringSplit[2] ;;; Create HTML Game Pages ;;;
				If $OverlaySettings_Checkbox12 <> "" Then
					If $OverlaySettings_Checkbox12 <> $CurrentValue_CheckBox_12 Then
						IniWrite($Config_INI, "Settings", "Create_HTML_GamePage", $OverlaySettings_Checkbox12)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox12 = <" & $OverlaySettings_Checkbox12 & ">")
			EndIf
			If $StringSplit[1] = "OverlaySettings_Checkbox13" Then
				$OverlaySettings_Checkbox13 = $StringSplit[2] ;;; Delete old HomeLoader Library Data first ;;;
				If $OverlaySettings_Checkbox13 <> "" Then
					If $OverlaySettings_Checkbox13 <> $CurrentValue_CheckBox_13 Then
						IniWrite($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", $OverlaySettings_Checkbox13)
					EndIf
				EndIf
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox13 = <" & $OverlaySettings_Checkbox13 & ">")
			EndIf
		Next
		_Write_UpdateLibrary_to_VRUB_PersistentStore_File()
	EndIf
	_Read_Scan_Settings()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End Updating Overlay.")
EndFunc

Func _Start_Home_APP()
	FileWriteLine($stats_log_FILE,"[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_Home_APP()'")
	Local $sOutput
	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
	Local $HomeAppSteamID = IniRead($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	Global $Vive_Home_Folder = "", $WaitNR = "1"

	If Not ProcessExists("vrmonitor.exe") Then
		ShellExecute("steam://rungameid/250820")
	EndIf

	Do
		Sleep(1000)
	Until ProcessExists("vrmonitor.exe")

	If $HomeApp <> "Default SteamVR Home" Then
		;_Exit_Check()
		_StartHomeApp()
	EndIf
EndFunc

Func _Compare_SteamVR_VRSettings_INI()
	If FileExists($SteamVR_VRSettings_INI) Then
		Local $FileLinesTEMP = _FileCountLines($SteamVR_VRSettings_INI)

		For $LOOP = 0 To $FileLinesTEMP
			Local $ReadLine_1 = FileReadLine($SteamVR_VRSettings_INI, $LOOP)
			Local $ReadLine_2 = StringReplace($ReadLine_1, '[','')
			Local $ReadLine_3 = StringReplace($ReadLine_2, ']','')
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

		For $Loop = 1 to 8
			Local $FileContent_Check = StringRight($FileContent, $Loop)
			If StringLeft($FileContent_Check, 1) = "," Then
				Local $FileContent_1 = StringTrimRight($FileContent, $Loop)
				Local $FileContent_2 = StringReplace(StringRight($FileContent, $Loop), ',', '')
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
EndFunc

Func _SSVRH_Write_to_SteamVR_VRSettings()
	Local $SteamAppExist = "false"
	If FileExists($Steamvr_vrsettings_FilePath) Then _FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)
	If Not FileExists($Steamvr_vrsettings_FilePath) Then _FileReadToArray($Steamvr_vrsettings_FilePath & ".bak", $Steamvr_vrsettings_Array)
    $Loop_End_1 = $Steamvr_vrsettings_Array[0]

	If FileExists($Steamvr_vrsettings_FilePath) Then FileDelete($Steamvr_vrsettings_FilePath)

	For $LOOP = 1 to $Loop_End_1 - 2
		$Steamvr_vrsettings_aArray = _StringBetween($Steamvr_vrsettings_Array[$LOOP], '"', '"', $STR_ENDNOTSTART)
		If $Steamvr_vrsettings_aArray <> "" Then
			;If $Steamvr_vrsettings_aArray <> 0 Then
				;If $Steamvr_vrsettings_aArray[0] <> "" Then
						For $LOOP_2 = 1 to $SteamVR_VRSettings_Count
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

	For $LOOP_3 = 1 to $SteamVR_VRSettings_Count
		If $SteamVR_VRSettings_Array_1[$LOOP_3][3] = "false" Then
			FileWriteLine($Steamvr_vrsettings_FilePath, '   "steam.app.' & $SteamVR_VRSettings_Array_1[$LOOP_3][0] & '" : {')
			FileWriteLine($Steamvr_vrsettings_FilePath, '      "appName" : "' & $SteamVR_VRSettings_Array_1[$LOOP_3][1] & '",')
			FileWriteLine($Steamvr_vrsettings_FilePath, '      "resolutionScale" : ' & $SteamVR_VRSettings_Array_1[$LOOP_3][2] & '')
			FileWriteLine($Steamvr_vrsettings_FilePath, '   },')
		EndIf
	Next
	FileWriteLine($Steamvr_vrsettings_FilePath, '}')
EndFunc

Func _Write_config_INI_Values_to_VRUB_PersistentStore_File()
	Local $HomeLoaderOverlaySteamID = IniRead($Config_INI, "Settings", "HomeLoaderOverlaySteamID", "")
	Local $NEW_sText = ""
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
    Local $sText = FileRead($filePath)
    Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

	Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "200")
	Local $appid_TEMP = ""
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
		$appid_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_SteamLibrary, "appid", "")
		 $SteamLibraryContent = $SteamLibraryContent & "_" & $appid_TEMP
		 If $Loop_SteamLibrary = 1 Then $SteamLibraryContent = $appid_TEMP
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
			$NEW_sText = $NEW_sText & '"' &  $StringSplit[1] & '"' & ':"' & $InsertValue & '"}'
		EndIf
    Next
	Local $StringRightCheck = StringRight($NEW_sText, '1')
	If $StringRightCheck = "," Then $NEW_sText = StringTrimRight($NEW_sText, '1')
	Local $StringLeftCheck = StringLeft($NEW_sText, '1')
	If $StringLeftCheck <> "{" Then $NEW_sText = "{" & $NEW_sText
	If FileExists($filePath) Then FileDelete($filePath)
	FileWrite($filePath, $NEW_sText)
EndFunc

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
EndFunc

#endregion

#Region Func Overlay Functions
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
				$NEW_sText = $NEW_sText & '"' &  $StringSplit[1] & '"' & ':"' & $UpdateLibrary_Value & '"}'
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
EndFunc

Func _Write_HomeLoaderOverlaySteamID_to_VRUB_PersistentStore_File()
	Local $HomeLoaderOverlaySteamID = IniRead($Config_INI, "Settings", "HomeLoaderOverlaySteamID", "")
	Local $NEW_sText = ""
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
    Local $sText = FileRead($filePath)
    Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

    For $i1 = 1 To $aArray[0]
		Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
		Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
		Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
        Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

		If $StringSplit[1] = "HomeLoaderOverlaySteamID" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $HomeLoaderOverlaySteamID & '",'
			Else
				$NEW_sText = $NEW_sText & '"' &  $StringSplit[1] & '"' & ':"' & $HomeLoaderOverlaySteamID & '"}'
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
EndFunc

Func _Write_HomeApp_to_VRUB_PersistentStore_File()
	Local $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	Local $NEW_sText = ""
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
    Local $sText = FileRead($filePath)
    Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

    For $i1 = 1 To $aArray[0]
		Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
		Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
		Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
        Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

		If $StringSplit[1] = "HomeApp" Then
			If $i1 <> $aArray[0] Then
				$NEW_sText = $NEW_sText & '"' & $StringSplit[1] & '"' & ':"' & $HomeApp & '",'
			Else
				$NEW_sText = $NEW_sText & '"' &  $StringSplit[1] & '"' & ':"' & $HomeApp & '"}'
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
EndFunc

Func _Start_HomeLoader_UpdateLibrary()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_HomeLoader_UpdateLibrary()'")
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "UpdateLibrary", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "UpdateLibrary", $Install_DIR)
	EndIf
EndFunc

Func _Start_Home_APP_File()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_Home_APP_File()'")
	_StartHomeApp()
	;If FileExists($System_DIR & "StartHomeApp.exe") Then
	;	ShellExecute($System_DIR & "StartHomeApp.exe", "", $System_DIR)
	;Else
	;	ShellExecute($System_DIR & "StartHomeApp.au3", "", $System_DIR)
	;EndIf
	;Exit
EndFunc

Func _FirstStart_Restart()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_FirstStart_Restart()'")
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	Exit
EndFunc


Func _Read_SteamVR_VRSettings_IN()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Read_SteamVR_VRSettings_IN()'")
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecuteWait($System_DIR & "HomeLoaderLibrary.exe", "Read_SteamVR_VRSettings_IN", $System_DIR)
	Else
		ShellExecuteWait($System_DIR & "HomeLoaderLibrary.au3", "Read_SteamVR_VRSettings_IN", $System_DIR)
	EndIf
EndFunc





#endregion

