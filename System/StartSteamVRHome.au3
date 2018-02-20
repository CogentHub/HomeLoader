
#Region Includes
#include <File.au3>
#include <Date.au3>
#endregion

Opt("GUIOnEventMode", 1)

#Region Declare Globals
Global $Array_tools_vrmanifest_File, $GUI_Loading, $FileSelect
Global $HomeApp_Overlay, $HomeAppSteamID_Overlay, $HomeLoaderOverlaySteamID_Overlay
Global $PressedOverlayButton_Overlay, $AppIDLoaded_Overlay
Global $OverlaySettings_RenderTargetMultiplier, $OverlaySettings_SupersampleScale, $OverlaySettings_AllowSupersampleFiltering
Global $OverlaySettings_Checkbox1, $OverlaySettings_Checkbox2, $OverlaySettings_Checkbox3
Global $OverlaySettings_Checkbox4, $OverlaySettings_Checkbox5, $OverlaySettings_Checkbox6
Global $OverlaySettings_LabelCustomPage3, $OverlaySettings_LabelCustomPage4, $OverlaySettings_LabelCustomPage5
Global $OverlaySettings_LabelCustomPage6, $FirstStart_Overlay, $HomeAppGroup
#endregion

#Region Variables
Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Version = IniRead($Config_INI, "Settings", "Version", "")
Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $Apps_DIR = $Install_DIR & "Apps\"

Global $Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $TEMP_StartHomeSettings = IniRead($Config_INI, "TEMP", "StartHomeLoaderSettings", "")
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")

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

Global $HomeLoader_Overlay_Folder = $Steam_Path & "steamapps\common\VRUtilityBelt\addons\custom\HomeLoader\overlays\HomeLoader\"

Global $Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
Global $Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
Global $Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
Global $Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
Global $Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

Global $default_vrsettings_File = IniRead($Config_INI, "Folders", "Steam_default_vrsettings", "")
Global $default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
Global $default_vrsettings_File_new = $default_vrsettings_File & ".new"

Global $Steam_tools_vrmanifest_File = IniRead($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
Global $Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"

Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
Global $HomeAppSteamID = IniRead($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
Global $StartHomeAPP_bat = $System_DIR & "StartHomeAPP.bat"
Global $StartSteamVRHome_au3 = $System_DIR & "StartSteamVRHome.au3"
Global $StartSteamVRHome_exe = $System_DIR & "StartSteamVRHome.exe"

Global $State_Checkbox_Autostart_VRUB = IniRead($config_ini,"Settings", "Autostart_VRUB", "")

Global $UpdateOverlay = IniRead($Config_INI, "Settings", "UpdateOverlay", "")
Global $Use_Local_Icons = IniRead($Config_INI, "Settings", "Use_Local_Icons", "")
Global $ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
Global $Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "")
Global $Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "")
Global $Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
Global $HomeLoaderOverlaySteamID = IniRead($Config_INI, "Settings", "HomeLoaderOverlaySteamID", "")

Global $default_renderTargetMultiplier = IniRead($Config_INI, "SteamVR_Status", "default_renderTargetMultiplier", "")
Global $default_supersampleScale = IniRead($Config_INI, "SteamVR_Status", "default_supersampleScale", "")
Global $default_allowSupersampleFiltering = IniRead($Config_INI, "SteamVR_Status", "default_allowSupersampleFiltering", "")

Global $stats_log_FILE = $System_DIR & "Logs\stats_log.txt"
	Local $stats_log_FILE_Lines = _FileCountLines($stats_log_FILE)
	If $stats_log_FILE_Lines > 400 Then FileDelete($stats_log_FILE)

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

#region Start LOG
FileWrite($stats_log_FILE, @CRLF & "[Start SteamVR_HomeApp: " & _Now() & "]" & @CRLF & _
								"- Home App: " & $HomeApp & @CRLF & _
								"- Autostart VRUB: " & $State_Checkbox_Autostart_VRUB & @CRLF & _
								"- Update Overlay: " & $UpdateOverlay & @CRLF & _
								"- Use Local Icons: " & $Use_Local_Icons & @CRLF & _
								"- Scan Library OnStart: " & $ScanLibrary_OnStart_SettingValue & @CRLF & _
								"- Add PlayersOnline to Icons: " & $Add_PlayersOnline_to_Icons & @CRLF & _
								"- Add SS to Icons: " & $Add_SS_to_Icons & @CRLF & _
								"- Add SS per game: " & $Add_SS_per_game & @CRLF & _
								"- HomeLoader Overlay SteamID: " & $HomeLoaderOverlaySteamID & @CRLF)
#endregion

#region First Start Check
_First_Start_Empty_Check_1()

If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK, $FC_OVERWRITE)
If $default_vrsettings_File = "" Then MsgBox(48, "Attention!", "Default.vrsettings File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")

If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK, $FC_OVERWRITE)
If $Steam_tools_vrmanifest_File = ""  Then MsgBox(48, "Attention!", "Tools.vrmanifest File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")

If FileExists(@DesktopDir & "\HomeLoaderOverlay.url") Then
	Local $HomeLoaderOverlay_url = IniRead(@DesktopDir & "\HomeLoaderOverlay.url", "InternetShortcut","URL", "ERROR")
	Local $StringReplace_SteamID = StringReplace($HomeLoaderOverlay_url, 'http://"steam://rungameid/', '')
	$HomeLoaderOverlaySteamID = StringReplace($StringReplace_SteamID, '"', '')
	IniWrite($Config_INI, "Settings", "HomeLoaderOverlaySteamID", $HomeLoaderOverlaySteamID)
	FileDelete(@DesktopDir & "\HomeLoaderOverlay.url")
EndIf

If $First_Start = "true" Then
	If Not FileExists($Install_DIR & "Backups\default.vrsettings") Then FileCopy($default_vrsettings_File, $Install_DIR & "Backups\default.vrsettings", $FC_OVERWRITE)
	If Not FileExists($Install_DIR & "Backups\tools.vrmanifest") Then FileCopy($Steam_tools_vrmanifest_File, $Install_DIR & "Backups\tools.vrmanifest", $FC_OVERWRITE)
	_FirstStart_Restart()
EndIf

#endregion

#region Start Check
If $Autostart_VRUB = "true" Then
	_Read_from_VRUB_PersistentStore_File()
	_Start_Home_Loader()
EndIf

If $Autostart_VRUB <> "true" Then
	If $ScanLibrary_OnStart_SettingValue = "true" Or $Add_PlayersOnline_to_Icons = "true" Or $Add_SS_to_Icons = "true" Then
		_Start_Home_Loader()
	EndIf
EndIf
#endregion


_Sync_Config_INI()
_Start_Home_APP()
_Exit()


#Region Func First Start And Empty Check
Func _First_Start_Empty_Check_1()
	Global $Install_Folder_Steam_Search_Folder, $Install_Folder_Steam_Search_Folder

	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	If $Install_Folder_Steam_1 = "" Then
		$Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
		$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\')

		If $Install_Folder_Steam_Search_Folder <> "" Then
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $Install_Folder_Steam_Search_Folder & "\")
		Else
			MsgBox($MB_ICONINFORMATION, "Steam folder", "Steam folder was not found." & @CRLF & _
							"Choose the folder before continue." & @CRLF)

			Local $FileSelectFolder = FileSelectFolder("Choose Steam folder", $Install_Folder_Steam_Search_Folder & "\")
			If $FileSelectFolder <> "" Then
				IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $FileSelectFolder & "\")
			Else
				MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
				IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", "")
				_Restart()
			EndIf
		EndIf
		$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	EndIf

	If $default_vrsettings_File = "" Then
		If FileExists($Install_Folder_Steam_1 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_2 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_3 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_4 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_5 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\"

		$default_vrsettings_File = $SteamVR_Path & "resources\settings\default.vrsettings"
		If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
		$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"

		If Not FileExists($default_vrsettings_File) Then
			MsgBox($MB_ICONINFORMATION, "Default.vrsettings File", "Default.vrsettings File not found." & @CRLF & _
				"Choose the File before continue." & @CRLF)

			Local $FileSelect = FileOpenDialog("Default.vrsettings File", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
			If $FileSelect <> "" Then
				IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $FileSelect)
			Else
				MsgBox($MB_ICONWARNING, "Attention!", "Default.vrsettings File" & @CRLF & @CRLF & "Search the File and write the path manually to the config.igi File or try again.")
				IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", "")
				_Restart()
			EndIf
		EndIf
	EndIf


	Global $Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
	If $Icon_Folder_1 = "" Then
		If FileExists($Install_DIR & "WebPage\images\") Then
			$Icon_Folder_1 = $Install_DIR & "WebPage\images\"
			IniWrite($Config_INI, "Folders", "Icon_Folder_1", $Icon_Folder_1)
		EndIf
	EndIf

	Global $Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
	If $Icon_Folder_2 = "" Then
		If FileExists($HTCVive_Path & "Updater\App\Dashboard\win32\header_image\") Then
			$Icon_Folder_2 = $HTCVive_Path & "Updater\App\Dashboard\win32\header_image\"
			IniWrite($Config_INI, "Folders", "Icon_Folder_2", $Icon_Folder_2)
		EndIf
	EndIf

	Global $Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")
	If $Icon_Folder_3 = "" Then
		If FileExists($HomeLoader_Overlay_Folder & "images\") Then
			$Icon_Folder_3 = $HomeLoader_Overlay_Folder & "images\"
			IniWrite($Config_INI, "Folders", "Icon_Folder_3", $Icon_Folder_3)
		EndIf
	EndIf

	If $Steam_tools_vrmanifest_File = "" Then
		If FileExists($Install_Folder_Steam_1 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_2 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_3 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_4 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_5 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\"

		$Steam_tools_vrmanifest_File = $SteamVR_Path & "tools\tools.vrmanifest"
		If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
		$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"

		If Not FileExists($Steam_tools_vrmanifest_File) Then
			MsgBox($MB_ICONINFORMATION, "Tools.vrmanifest File", "Tools.vrmanifest File not found." & @CRLF & _
				"Choose the File before continue." & @CRLF)

			Local $FileSelect = FileOpenDialog("Tools.vrmanifest File", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
			If $FileSelect <> "" Then
				IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $FileSelect)
			Else
				MsgBox($MB_ICONWARNING, "Attention!", "Tools.vrmanifest File" & @CRLF & @CRLF & "Search the File and write the path manually to the config.igi File or try again.")
				IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
				_Restart()
			EndIf
		EndIf
	EndIf

	If FileExists(@DesktopDir & "\HomeLoaderOverlay.url") Then
		Local $HomeLoaderOverlay_url = IniRead(@DesktopDir & "\HomeLoaderOverlay.url", "InternetShortcut","URL", "ERROR")
		Local $StringReplace_SteamID = StringReplace($HomeLoaderOverlay_url, 'http://"steam://rungameid/', '')
		Local $HomeLoaderOverlaySteamID = StringReplace($StringReplace_SteamID, '"', '')
		IniWrite($Config_INI, "Settings", "HomeLoaderOverlaySteamID", $HomeLoaderOverlaySteamID)
		_Write_HomeLoaderOverlaySteamID_to_VRUB_PersistentStore_File()
	EndIf

EndFunc
#endregion

#Region Func MAIN
Func _Read_from_VRUB_PersistentStore_File()
	FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Read_from_VRUB_PersistentStore_File' -----" & _Now() & "]")
	$HomeApp_Overlay = ""
	$HomeLoaderOverlaySteamID_Overlay = ""

	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
    Local $sText = FileRead($filePath)
    Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

    For $i1 = 1 To $aArray[0]
		Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
		Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
		Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
        Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

		If $StringSplit[1] = "FirstStart" Then
			$FirstStart_Overlay = $StringSplit[2] ; FirstStart
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "FirstStart = <" & $FirstStart_Overlay & ">")
		EndIf
		If $StringSplit[1] = "HomeApp" Then
			$HomeApp_Overlay = $StringSplit[2] ; Home App
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "HomeApp = <" & $HomeApp_Overlay & ">")
		EndIf
		If $StringSplit[1] = "HomeAppSteamID" Then
			$HomeAppSteamID_Overlay = $StringSplit[2] ; HomeAppSteamID
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "HomeAppSteamID = <" & $HomeAppSteamID_Overlay & ">")
		EndIf
		If $StringSplit[1] = "HomeLoaderOverlaySteamID" Then
			$HomeLoaderOverlaySteamID_Overlay = $StringSplit[2] ; HomeLoaderOverlaySteamID
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "HomeLoaderOverlaySteamID = <" & $HomeLoaderOverlaySteamID_Overlay & ">")
		EndIf
		If $StringSplit[1] = "PressedOverlayButton" Then
			$PressedOverlayButton_Overlay = $StringSplit[2] ; PressedOverlayButton
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "PressedOverlayButton = <" & $PressedOverlayButton_Overlay & ">")
		EndIf
		If $StringSplit[1] = "AppIDLoaded" Then
			$AppIDLoaded_Overlay = $StringSplit[2] ; AppIDLoaded
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "AppIDLoaded = <" & $AppIDLoaded_Overlay & ">")
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox1" Then
			$OverlaySettings_Checkbox1 = $StringSplit[2] ;;; Update Overlay using HomeLoader ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox1 = <" & $OverlaySettings_Checkbox1 & ">")
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox2" Then
			$OverlaySettings_Checkbox2 = $StringSplit[2] ;;; Use local Icons ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox2 = <" & $OverlaySettings_Checkbox2 & ">")
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox3" Then
			$OverlaySettings_Checkbox3 = $StringSplit[2] ;;; Scan Steam Library on Home App Start ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox3 = <" & $OverlaySettings_Checkbox3 & ">")
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox4" Then
			$OverlaySettings_Checkbox4 = $StringSplit[2] ;;; Add number of current Players to the game Icons ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox4 = <" & $OverlaySettings_Checkbox4 & ">")
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox5" Then
			$OverlaySettings_Checkbox5 = $StringSplit[2] ;;; Add saved Supersampling settings to the game Icons ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox5 = <" & $OverlaySettings_Checkbox5 & ">")
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox6" Then
			$OverlaySettings_Checkbox6 = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox6 = <" & $OverlaySettings_Checkbox6 & ">")
		EndIf
		If $StringSplit[1] = "RenderTargetMultiplier" Then
			$OverlaySettings_RenderTargetMultiplier = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "RenderTargetMultiplier = <" & $OverlaySettings_RenderTargetMultiplier & ">")
		EndIf
		If $StringSplit[1] = "SupersampleScale" Then
			$OverlaySettings_SupersampleScale = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "SupersampleScale = <" & $OverlaySettings_SupersampleScale & ">")
		EndIf
		If $StringSplit[1] = "AllowSupersampleFiltering" Then
			$OverlaySettings_AllowSupersampleFiltering = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "AllowSupersampleFiltering = <" & $OverlaySettings_AllowSupersampleFiltering & ">")
		EndIf

		If $StringSplit[1] = "LabelCustomPage3" Then
			$OverlaySettings_LabelCustomPage3 = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCustomPage3 = <" & $OverlaySettings_LabelCustomPage3 & ">")
		EndIf
		If $StringSplit[1] = "LabelCustomPage4" Then
			$OverlaySettings_LabelCustomPage4 = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCustomPage4 = <" & $OverlaySettings_LabelCustomPage4 & ">")
		EndIf
		If $StringSplit[1] = "LabelCustomPage5" Then
			$OverlaySettings_LabelCustomPage5 = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCustomPage5 = <" & $OverlaySettings_LabelCustomPage5 & ">")
		EndIf
		If $StringSplit[1] = "LabelCustomPage6" Then
			$OverlaySettings_LabelCustomPage6 = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCustomPage6 = <" & $OverlaySettings_LabelCustomPage6 & ">")
		EndIf

    Next

	If $HomeApp_Overlay <> "" Then
		If $HomeApp_Overlay <> $HomeApp Then
			If $HomeApp_Overlay = "SteamVR Home" Then _StartUp_Radio_1()
			If $HomeApp_Overlay = "Vive Home" Then _StartUp_Radio_2()
			If $HomeApp_Overlay = "Janus VR" Then _StartUp_Radio_3()
			If $HomeApp_Overlay = "VR Toolbox" Then _StartUp_Radio_4()
			If $HomeApp_Overlay = "Other" Then _StartUp_Radio_5()
			If $HomeApp_Overlay = "Viveport VR" Then _StartUp_Radio_6()
		EndIf
	EndIf

	If $HomeAppSteamID_Overlay <> "" Then
		If $HomeAppSteamID_Overlay <> $HomeAppSteamID Then
			IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", $HomeAppSteamID_Overlay)
			_Ident_HomeApp_from_ID()
			_Create_StartHomeAPP_BAT_File()
		EndIf
	EndIf

	If $OverlaySettings_Checkbox1 <> "" Then
		If $OverlaySettings_Checkbox1 <> $UpdateOverlay Then
			IniWrite($Config_INI, "Settings", "UpdateOverlay", $OverlaySettings_Checkbox1)
		EndIf
	EndIf
	If $OverlaySettings_Checkbox2 <> "" Then
		If $OverlaySettings_Checkbox2 <> $Use_Local_Icons Then
			IniWrite($Config_INI, "Settings", "Use_Local_Icons", $OverlaySettings_Checkbox2)
		EndIf
	EndIf
	If $OverlaySettings_Checkbox3 <> "" Then
		If $OverlaySettings_Checkbox3 <> $ScanLibrary_OnStart_SettingValue Then
			IniWrite($Config_INI, "Settings", "ScanLibrary_OnStart", $OverlaySettings_Checkbox3)
		EndIf
	EndIf
	If $OverlaySettings_Checkbox4 <> "" Then
		If $OverlaySettings_Checkbox4 <> $Add_PlayersOnline_to_Icons Then
			IniWrite($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", $OverlaySettings_Checkbox4)
		EndIf
	EndIf
	If $OverlaySettings_Checkbox5 <> "" Then
		If $OverlaySettings_Checkbox5 <> $Add_SS_to_Icons Then
			IniWrite($Config_INI, "Settings", "Add_SS_to_Icons", $OverlaySettings_Checkbox5)
		EndIf
	EndIf
	If $OverlaySettings_Checkbox6 <> "" Then
		If $OverlaySettings_Checkbox6 <> $Add_SS_per_game Then
			IniWrite($Config_INI, "Settings", "Add_SS_per_game", $OverlaySettings_Checkbox6)
		EndIf
	EndIf
	If $OverlaySettings_RenderTargetMultiplier <> "" Then
		If $OverlaySettings_RenderTargetMultiplier <> $default_renderTargetMultiplier Then
			IniWrite($Config_INI, "SteamVR_Status", "default_renderTargetMultiplier", $OverlaySettings_RenderTargetMultiplier)
		EndIf
	EndIf
	If $OverlaySettings_SupersampleScale <> "" Then
		If $OverlaySettings_SupersampleScale <> $default_supersampleScale Then
			IniWrite($Config_INI, "SteamVR_Status", "default_supersampleScale", $OverlaySettings_SupersampleScale)
		EndIf
	EndIf
	If $OverlaySettings_AllowSupersampleFiltering <> "" Then
		If $OverlaySettings_AllowSupersampleFiltering <> $default_allowSupersampleFiltering Then
			IniWrite($Config_INI, "SteamVR_Status", "default_allowSupersampleFiltering", $OverlaySettings_AllowSupersampleFiltering)
		EndIf
	EndIf

	If $OverlaySettings_LabelCustomPage3 <> "" Then
		If $OverlaySettings_LabelCustomPage3 <> $TAB3_Label Then
			IniWrite($Config_INI, "Settings", "TAB3_Name", $OverlaySettings_LabelCustomPage3)
		EndIf
	EndIf
	If $OverlaySettings_LabelCustomPage4 <> "" Then
		If $OverlaySettings_LabelCustomPage4 <> $TAB4_Label Then
			IniWrite($Config_INI, "Settings", "TAB4_Name", $OverlaySettings_LabelCustomPage4)
		EndIf
	EndIf
	If $OverlaySettings_LabelCustomPage5 <> "" Then
		If $OverlaySettings_LabelCustomPage5 <> $TAB5_Label Then
			IniWrite($Config_INI, "Settings", "TAB5_Name", $OverlaySettings_LabelCustomPage5)
		EndIf
	EndIf
	If $OverlaySettings_LabelCustomPage6 <> "" Then
		If $OverlaySettings_LabelCustomPage6 <> $TAB6_Label Then
			IniWrite($Config_INI, "Settings", "TAB6_Name", $OverlaySettings_LabelCustomPage6)
		EndIf
	EndIf

	_Start_HomeLoader_UpdateOverlay()
EndFunc

Func _Start_Home_Loader()
	FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_Home_Loader' -----" & _Now() & "]")
	If FileExists($System_DIR & "HomeLoader.exe") Then
		ShellExecute($System_DIR & "HomeLoader.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoader.au3", "", $System_DIR)
	EndIf
EndFunc

Func _Start_Home_APP()
	FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_Home_APP' -----" & _Now() & "]")
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


	If $Autostart_VRUB = "true" Then
		_Write_config_INI_Values_to_VRUB_PersistentStore_File()
	EndIf

	If $HomeApp <> "Default SteamVR Home" Then
		_Start_Home_APP_File()
	EndIf

EndFunc

Func _Add_Default_SS_to_SteamVR()
	FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Add_Default_SS_to_SteamVR' -----" & _Now() & "]")
	If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK, $FC_OVERWRITE)

	Local $FileLines = _FileCountLines($default_vrsettings_File)

	Global $default_renderTargetMultiplier_value = IniRead($Config_INI, "SteamVR_Status", "default_renderTargetMultiplier", "1.0")
	Global $default_supersampleScale_value = IniRead($Config_INI, "SteamVR_Status", "default_supersampleScale", "1.0")
	Global $default_allowSupersampleFiltering_value = IniRead($Config_INI, "SteamVR_Status", "default_allowSupersampleFiltering", "true")

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Starting adding Default SS to SteamVR: ")

	Local $renderTargetMultiplier_value = $default_renderTargetMultiplier_value
	Local $supersampleScale_value = $default_supersampleScale_value
	Local $allowSupersampleFiltering_value = $default_allowSupersampleFiltering_value

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " <Default_renderTargetMultiplier: " & $renderTargetMultiplier_value & ">" & " - " & "<Default_supersampleScale: " & $supersampleScale_value & ">" & " - " & "<Default_allowSupersampleFiltering: " & $allowSupersampleFiltering_value & ">")

	FileWriteLine($default_vrsettings_File_new, '{')
	FileWriteLine($default_vrsettings_File_new, '	"steamvr" : {')

	For $LOOP_vrsettings = 3 To $FileLines
		Local $ReadLine = FileReadLine($default_vrsettings_File, $LOOP_vrsettings)
		Local $ReadLine_Split_value = $ReadLine

		If $ReadLine <> '	},' Then
			Local $ReadLine_Split = StringSplit($ReadLine, ':')
			$ReadLine_Split_value = StringReplace($ReadLine_Split[1], '"', '')
			$ReadLine_Split_value = StringReplace($ReadLine_Split_value, '        ', '')
			$ReadLine_Split_value = StringReplace($ReadLine_Split_value, ' ', '')
		EndIf

		If $ReadLine_Split_value = 'renderTargetMultiplier' Then
			FileWriteLine($default_vrsettings_File_new, '        "renderTargetMultiplier" : ' & $renderTargetMultiplier_value & ',')
		EndIf

		If $ReadLine_Split_value = 'supersampleScale' Then
			FileWriteLine($default_vrsettings_File_new, '        "supersampleScale" : ' & $supersampleScale_value & ',')
		EndIf

		If $ReadLine_Split_value = 'allowSupersampleFiltering' Then
			FileWriteLine($default_vrsettings_File_new, '        "allowSupersampleFiltering" : ' & $allowSupersampleFiltering_value & ',')
		EndIf

		If $ReadLine_Split_value <> 'renderTargetMultiplier' And $ReadLine_Split_value <> 'supersampleScale' And $ReadLine_Split_value <> 'allowSupersampleFiltering' Then
			FileWriteLine($default_vrsettings_File_new, $ReadLine)
		EndIf
	Next
	FileCopy($default_vrsettings_File_new, $default_vrsettings_File, $FC_OVERWRITE)
	FileDelete($default_vrsettings_File_new)
	If Not FileExists($default_vrsettings_File) Then FileCopy($default_vrsettings_File_BAK, $default_vrsettings_File, $FC_OVERWRITE)
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End adding Default SS to SteamVR:")
EndFunc

Func _Sync_Config_INI()
	FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Sync_Config_INI' -----" & _Now() & "]")
	FileCopy($Config_INI, $System_DIR & "config.ini", $FC_OVERWRITE)
EndFunc
#endregion

#Region Func Set Home App
Func _StartUp_Radio_1() ; SteamVR Home
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "SteamVR Home")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $SteamVR_Path & "tools\steamvr_environments\game\bin\win64\steamtours.exe")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "SteamVR Home")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")

	If $HomeApp = "Default SteamVR Home" Then _ADD_2_SteamVR_Home_default()
	_Create_StartHomeAPP_BAT_File()
EndFunc

Func _StartUp_Radio_2() ; Vive Home
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Vive Home")
	Local $ViveHome_SDK_Path = $Install_DIR & "Apps\ViveHome\ViveHomeSDKTestbed.exe"
	Local $ViveHome_Path = $HTCVive_Path & "Updater\App\Home\win32\ViveHome.exe"

	If FileExists($ViveHome_SDK_Path) Then $ViveHome_Path = $ViveHome_SDK_Path

	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $ViveHome_Path)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")

	If $HomeApp = "Default SteamVR Home" Then _ADD_2_SteamVR_Home_default()
	_Create_StartHomeAPP_BAT_File()
EndFunc

Func _StartUp_Radio_3() ; Janus VR
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
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")

	If $HomeApp = "Default SteamVR Home" Then _ADD_2_SteamVR_Home_default()
	_Create_StartHomeAPP_BAT_File()
EndFunc

Func _StartUp_Radio_4() ; VR Toolbox
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "VR Toolbox")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")

	If $HomeApp = "Default SteamVR Home" Then _ADD_2_SteamVR_Home_default()
	_Create_StartHomeAPP_BAT_File()
	_Start_HomeLoaderLibrary_UpdateStartPage()
EndFunc

Func _StartUp_Radio_5() ; Other
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Other")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
EndFunc

Func _StartUp_Radio_6() ; Viveport VR
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Setting Home App to Viveport VR:")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Viveport VR")
	Local $Viveport_Path = $HTCVive_Path & "Updater\App\ViveportVR\VPNextApp.exe"

	FileWriteLine($stats_log_FILE, "- ViveportVR Path = " & $Viveport_Path)

	If FileExists($Viveport_Path) Then
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $Viveport_Path)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Viveport VR")
	Else
		$FileSelect = FileOpenDialog("Select 'VPNextApp.exe' File", $Install_DIR, "Executable (*.exe)")
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Viveport VR")
	EndIf

	If FileExists($Viveport_Path) Then
		IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
		_ADD_2_SteamVR_Home_default()
		Local $HomeAppGroup_Label = "Home app:"
		If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
		GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "'Viveport VR' app was set as Home app.")
	EndIf
	_Sync_Config_INI()
EndFunc

Func _ADD_2_SteamVR_Home_default()
	Local $Line_NR_binary_path_windows
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	Local $Install_DIR_StringReplace = StringReplace($Install_DIR, '\', '/')
	Local $NewHomePath = StringTrimRight($Install_DIR_StringReplace, 1) & "/System/StartHomeAPP.bat"
	_FileReadToArray($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File)
	_ArrayDisplay($Array_tools_vrmanifest_File, "Original", Default, 8)

	If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
	FileDelete($Steam_tools_vrmanifest_File)

    For $LOOP_vrmanifest = 1 To $Array_tools_vrmanifest_File[0]
		Local $ReadLine_tools_vrmanifest = $Array_tools_vrmanifest_File[$LOOP_vrmanifest]
		If $ReadLine_tools_vrmanifest = '			"app_key": "openvr.tool.steamvr_environments",' Then
			Local $Line_NR_binary_path_windows = $LOOP_vrmanifest + 3
		EndIf

		If $LOOP_vrmanifest = $Line_NR_binary_path_windows Then
			Local $NewLine = '			"binary_path_windows" : "' & $NewHomePath & '",'
			If $HomeApp = "Default SteamVR Home" Then $NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
			FileWriteLine($Steam_tools_vrmanifest_File, $NewLine)
		Else
			FileWriteLine($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File[$LOOP_vrmanifest])
		EndIf
    Next
EndFunc

Func _Create_StartHomeAPP_BAT_File()
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	If FileExists($StartHomeAPP_bat) Then FileDelete($StartHomeAPP_bat)
	If FileExists($StartSteamVRHome_au3) Then Local $StartSteamVRHome_x = "StartSteamVRHome.au3"
	If FileExists($StartSteamVRHome_exe) Then Local $StartSteamVRHome_x = "StartSteamVRHome.exe"

	FileWrite($StartHomeAPP_bat, "@echo off" & @CRLF & _
									"@echo - HOME LOADER [" & $Version & "] -" & @CRLF & _
									"@echo." & @CRLF & _
									"@echo Starting Home APP:" & @CRLF & _
									"@echo " & $HomeApp & @CRLF & _
									"@echo." & @CRLF & _
									"@echo Please Wait..." & @CRLF & _
									"@echo." & @CRLF & _
									"@echo HomeLoader by Cogent" & @CRLF & _
									$StartSteamVRHome_x)
EndFunc

Func _Ident_HomeApp_from_ID()
	$HomeAppSteamID = IniRead($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
	Local $HomeAppNR = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $HomeAppSteamID, "NR", "")
	Local $HomeAppName = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $HomeAppSteamID, "name", "")
	Local $HomeAppappid = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $HomeAppSteamID, "appid", "")

	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", $HomeAppName)
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
	If $HomeAppappid <> "" Then IniWrite($Config_INI, "Settings_HomeAPP", "Home_Path", "steam://rungameid/" & $HomeAppappid)
	If $HomeAppappid <> "" Then IniWrite($Config_INI, "Settings_HomeAPP", "WindowName", $HomeAppName)
EndFunc

#endregion

#Region Func Overlay Functions
Func _Write_config_INI_Values_to_VRUB_PersistentStore_File()
	Local $HomeLoaderOverlaySteamID = IniRead($Config_INI, "Settings", "HomeLoaderOverlaySteamID", "")
	Local $NEW_sText = ""
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
    Local $sText = FileRead($filePath)
    Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT)

	Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "200")
	Local $appid_TEMP = ""
	Local $SteamLibraryContent = ""

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
Func _Start_HomeLoader_UpdateOverlay()
	FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_HomeLoader_UpdateOverlay' -----" & _Now() & "]")
	If FileExists($System_DIR & "HomeLoader.exe") Then
		ShellExecute($System_DIR & "HomeLoader.exe", "UpdateOverlay", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoader.au3", "UpdateOverlay", $System_DIR)
	EndIf
EndFunc

Func _Start_HomeLoaderLibrary_UpdateStartPage()
	FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_HomeLoaderLibrary_UpdateStartPage' -----" & _Now() & "]")
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "UpdateStartPage", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "UpdateStartPage", $System_DIR)
	EndIf
EndFunc

Func _Start_Home_APP_File()
	FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Start_Home_APP_File' -----" & _Now() & "]")
	If FileExists($System_DIR & "StartHomeApp.exe") Then
		ShellExecute($System_DIR & "StartHomeApp.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "StartHomeApp.au3", "", $System_DIR)
	EndIf
	;Exit
EndFunc

Func _FirstStart_Restart()
	FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_FirstStart_Restart' -----" & _Now() & "]")
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	Exit
EndFunc

Func _Restart()
	FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Restart' -----" & _Now() & "]")
	If FileExists($System_DIR & "StartSteamVRHome.exe") Then
		ShellExecute($System_DIR & "StartSteamVRHome.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "StartSteamVRHome.au3", "", $System_DIR)
	EndIf
	Exit
EndFunc

Func _Exit()
	FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " StartSteamVRHome: Start Func --> '_Exit()' -----" & _Now() & "]")
	Exit
EndFunc

#endregion

