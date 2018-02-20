
#Region Includes
#include <GuiButton.au3>
#include <File.au3>
#include <GUIConstants.au3>
#include <Date.au3>
#endregion

Opt("GUIOnEventMode", 1)

#Region Declare Globals
Global $Button_Exit, $Select_HomeApp_Label, $Line_NR_binary_path_windows
Global $Array_tools_vrmanifest_File, $Add_Other_GUI, $bookmarksArray, $settingsArray, $StartSteamVRHome_x
Global $font_arial = "arial"
#endregion

#Region Variables
Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Version = "0.65"
Global $Auto_CheckUpdates = IniRead($Config_INI, "Settings", "Auto_CheckUpdates", "")
Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $TEMP_StartHomeLoader = IniRead($Config_INI, "TEMP", "StartHomeLoader", "")
Global $TEMP_StartHomeSettings = IniRead($Config_INI, "TEMP", "StartHomeLoaderSettings", "")
Global $USE_FB_GUI = IniRead($Config_INI, "Settings", "USE_GUI", "")
Global $StartSteamVRHome = $System_DIR & "StartSteamVRHome.exe"
Global $StartSteamVRHome_au3 = $System_DIR & "StartSteamVRHome.au3"
Global $StartSteamVRHome_exe = $System_DIR & "StartSteamVRHome.exe"
Global $StartHomeAPP_bat = $System_DIR & "StartHomeAPP.bat"
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $gfx = $Install_DIR & "System\gfx\"
Global $JanusVR_Page = $Install_DIR & "WebPage\janusvr\" & "index.html"
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")
Global $Update_Performed_Check = IniRead($config_ini, "TEMP", "Update", "")

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

Global $HomeLoader_Overlay_Folder = $Steam_Path & "steamapps\common\VRUtilityBelt\addons\custom\HomeLoader\overlays\HomeLoader\"
Global $UpdateOverlay = IniRead($Config_INI, "Settings", "UpdateOverlay", "")
Global $Use_Local_Icons = IniRead($Config_INI, "Settings", "Use_Local_Icons", "")
Global $ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
Global $Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "")
Global $Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "")
Global $Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
Global $HomeLoaderOverlaySteamID = IniRead($Config_INI, "Settings", "HomeLoaderOverlaySteamID", "")

Global $State_Checkbox_Autostart_VRUB = IniRead($config_ini,"Settings", "Autostart_VRUB", "")
Global $VRUB_HomeLoaderFile = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)

Global $stats_log_FILE = $System_DIR & "Logs\stats_log.txt"

IniWrite($config_ini, "Settings", "Version", $Version)
#endregion

#Region First Start Check
_First_Start_Empty_Check_1()

If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK, $FC_OVERWRITE)
If $default_vrsettings_File = "" Then MsgBox($MB_ICONERROR, "Attention!", "Default.vrsettings File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")

If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK, $FC_OVERWRITE)
If $Steam_tools_vrmanifest_File = ""  Then MsgBox($MB_ICONERROR, "Attention!", "Tools.vrmanifest File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")

If $First_Start = "true" Then
	If Not FileExists($Install_DIR & "Backups\default.vrsettings") Then FileCopy($default_vrsettings_File, $Install_DIR & "Backups\default.vrsettings", $FC_OVERWRITE)
	If Not FileExists($Install_DIR & "Backups\tools.vrmanifest") Then FileCopy($Steam_tools_vrmanifest_File, $Install_DIR & "Backups\tools.vrmanifest", $FC_OVERWRITE)
	_FirstStart_Restart()
EndIf

If $First_Start = "Settings" Then
	MsgBox($MB_ICONWARNING, "Welcome to Home Loader, by CogentRifter", "Choose your Home app, and then choose HomeLoaderLibrary to set up your games" & @CRLF & @CRLF & _
							"or Start SteamVR to just jump in." & @CRLF & @CRLF & _
							'Click "Advanced Settings" to access additional features.')
	IniWrite($Config_INI, "Settings", "First_Start", "false")
EndIf

If Not FileExists($Steam_tools_vrmanifest_File) Then _Detect_SteamVR_Files()
If Not FileExists($default_vrsettings_File) Then _Detect_SteamVR_Files()
#endregion

_Settings_GUI()

#Region First Start And Empty Check
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

	If $default_vrsettings_File = "" Or Not FileExists($default_vrsettings_File) Then
		If FileExists($Install_Folder_Steam_1 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_2 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_3 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_4 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_5 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\"

		$default_vrsettings_File = $SteamVR_Path & "resources\settings\default.vrsettings"
		If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
		If Not FileExists($default_vrsettings_File) Then _Detect_SteamVR_Files()
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

	If $Steam_tools_vrmanifest_File = "" Or Not FileExists($Steam_tools_vrmanifest_File) Then
		If FileExists($Install_Folder_Steam_1 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_2 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_3 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_4 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_5 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\"

		$Steam_tools_vrmanifest_File = $SteamVR_Path & "tools\tools.vrmanifest"
		If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
		If Not FileExists($Steam_tools_vrmanifest_File) Then _Detect_SteamVR_Files()
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


	$Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
	If $Icon_Folder_1 = "" Then
		If FileExists($Install_DIR & "WebPage\images\") Then
			$Icon_Folder_1 = $Install_DIR & "WebPage\images\"
			IniWrite($Config_INI, "Folders", "Icon_Folder_1", $Icon_Folder_1)
		EndIf
	EndIf

	$Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
	If $Icon_Folder_2 = "" Then
		If FileExists($HTCVive_Path & "Updater\App\Dashboard\win32\header_image\") Then
			$Icon_Folder_2 = $HTCVive_Path & "Updater\App\Dashboard\win32\header_image\"
			IniWrite($Config_INI, "Folders", "Icon_Folder_2", $Icon_Folder_2)
		EndIf
	EndIf

	$Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")
	If $Icon_Folder_3 = "" Then
		If FileExists($HomeLoader_Overlay_Folder & "images\") Then
			$Icon_Folder_3 = $HomeLoader_Overlay_Folder & "images\"
			IniWrite($Config_INI, "Folders", "Icon_Folder_3", $Icon_Folder_3)
		EndIf
	EndIf

	_Create_Uninstaller()

	If FileExists(@DesktopDir & "\HomeLoaderOverlay.url") Then
		$HomeLoaderOverlay_url = IniRead(@DesktopDir & "\HomeLoaderOverlay.url", "InternetShortcut","URL", "ERROR")
		$StringReplace_SteamID = StringReplace($HomeLoaderOverlay_url, 'http://"steam://rungameid/', '')
		$HomeLoaderOverlaySteamID = StringReplace($StringReplace_SteamID, '"', '')
		IniWrite($Config_INI, "Settings", "HomeLoaderOverlaySteamID", $HomeLoaderOverlaySteamID)
		FileDelete(@DesktopDir & "\HomeLoaderOverlay.url")
	EndIf

EndFunc

Func _Detect_SteamVR_Files()
	IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", "")
	IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")

	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

	If FileExists($Install_Folder_Steam_1 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_2 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_3 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_4 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_5 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\"

	$default_vrsettings_File = $SteamVR_Path & "resources\settings\default.vrsettings"
	If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
	$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"

	$Steam_tools_vrmanifest_File = $SteamVR_Path & "tools\tools.vrmanifest"
	If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
	$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
EndFunc
#endregion

#Region Func MAIN GUI
Func _Settings_GUI()

	Global $HEIGHT_GUI = 375 ; 440
	Global $POS_X = 10
	Global $POS_Y_HomeApp_Group = 5
	Global $POS_Y_Autostart_Group = 110
	Global $POS_Y_AdditionalSettings_Group = 160
	Global $POS_Y_Button_Start_HomeLoaderLibrary = 275
	Global $POS_Y_Button_Close = 310 ; 372

	Global $HomeAppGroup
	Global $HomeAppGroup_Label

    Global $GUI_StartUp_settings = GUICreate("HomeLoader - Settings" & "                        " & "[v" & $Version & "]", 250, $HEIGHT_GUI, -1, -1, $WS_EX_TOPMOST)
	GUISetIcon(@AutoItExe, -2, $GUI_StartUp_settings)
    GUISetState(@SW_SHOW, $GUI_StartUp_settings)

	Global $font_StartUp_arial = "arial"

	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"

	$HomeAppGroup = GUICtrlCreateGroup($HomeAppGroup_Label, 5, $POS_Y_HomeApp_Group, 235, 100)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)

	Global $StartUp_Radio_0 = GUICtrlCreateRadio("SteamVR", 10, $POS_Y_HomeApp_Group + 20, 62, 20) ; Default
		GuiCtrlSetTip(-1, "Sets SteamVR as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_0, "_StartUp_Radio_1")

	Global $StartUp_Radio_1 = GUICtrlCreateRadio("Vive Home", 80, $POS_Y_HomeApp_Group + 20, 70, 20) ; SteamVR
		GuiCtrlSetTip(-1, "Sets Vive Home as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_1, "_StartUp_Radio_2")

	Global $StartUp_Radio_2 = GUICtrlCreateRadio("Viveport VR", 160, $POS_Y_HomeApp_Group + 20, 75, 20) ; Vive Home
		GuiCtrlSetTip(-1, "Sets Viveport as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_2, "_StartUp_Radio_6")

	Global $StartUp_Radio_3 = GUICtrlCreateRadio("JanusVR", 10, $POS_Y_HomeApp_Group + 42, 60, 20) ; JanusVR
		GuiCtrlSetTip(-1, "Sets JanusVR as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_3, "_StartUp_Radio_3")

	Global $StartUp_Radio_4 = GUICtrlCreateRadio("VR Toolbox", 80, $POS_Y_HomeApp_Group + 42, 75, 20) ; VR Toolbox
		GuiCtrlSetTip(-1, "Sets VR Toolbox as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_4, "_StartUp_Radio_4")

	Global $StartUp_Radio_5 = GUICtrlCreateRadio("Other", 160, $POS_Y_HomeApp_Group + 42, 45, 20) ; Other
	GuiCtrlSetTip(-1, "Sets any other Apllication as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_5, "_StartUp_Radio_5")

	If $HomeApp = "SteamVR Home" Then GUICtrlSetState($StartUp_Radio_0, $GUI_CHECKED)
	If $HomeApp = "Vive Home" Then GUICtrlSetState($StartUp_Radio_1, $GUI_CHECKED)
	If $HomeApp = "Viveport VR" Then GUICtrlSetState($StartUp_Radio_2, $GUI_CHECKED)
	If $HomeApp = "Janus VR" Then GUICtrlSetState($StartUp_Radio_3, $GUI_CHECKED)
	If $HomeApp = "VR Toolbox" Then GUICtrlSetState($StartUp_Radio_4, $GUI_CHECKED)
	If $HomeApp = "Other" And $Home_Path <> "" Then GUICtrlSetState($StartUp_Radio_5, $GUI_CHECKED)

	Global $Button_Restore_DefaultSteamVRHome = GUICtrlCreateButton("Restore Default SteamVR Home Path", 10, $POS_Y_HomeApp_Group + 68, 223, 25)
		GuiCtrlSetTip(-1, "Restores the SteamVR Home Path.")
		GUICtrlSetOnEvent($Button_Restore_DefaultSteamVRHome, "_Restore_Default_SteamVR_Home")


	GUICtrlCreateGroup("Autostart:", 5, $POS_Y_Autostart_Group, 235, 45)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)

	$State_Checkbox_Autostart_VRUB = IniRead($config_ini,"Settings", "Autostart_VRUB", "")
	Global $Checkbox_Autostart_VRUB = GUICtrlCreateCheckbox(" VRUtilityBelt", 10, $POS_Y_Autostart_Group + 20, 100, 20)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
		GuiCtrlSetTip(-1, "If activated it will automatically start VRUB when SteamVR is launched." & @CRLF & _
							"VRUB is needed to be able to use the 'Automatically add SS per game' function." & @CRLF & _
							"Games need to be started from the VRUB Overlay to load the predefined values.")
		If $State_Checkbox_Autostart_VRUB = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateLabel("[HomeLoader Overlay]", 115, $POS_Y_Autostart_Group + 22, 120, 20)
		GuiCtrlSetTip(-1, "HomeLoader Overlay uses VR UTILITY BELT."  & @CRLF & "VRUB needs to be activated and the HomeLoader Overlay needs to be already installed.")
	GUICtrlSetFont(-1, 8.8, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Autostart_VRUB, "_Checkbox_Autostart_VRUB")
	If Not FileExists($VRUB_HomeLoaderFile) Then GUICtrlSetState($Checkbox_Autostart_VRUB, $GUI_UNCHECKED)
	If Not FileExists($VRUB_HomeLoaderFile) Then GUICtrlSetState($Checkbox_Autostart_VRUB, $GUI_DISABLE)


	GUICtrlCreateGroup("Additional Settings:", $POS_X - 5, $POS_Y_AdditionalSettings_Group, 235, 108)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)


	$State_Checkbox_Add_PlayersOnline_to_Icons = IniRead($config_ini,"Settings", "Add_PlayersOnline_to_Icons", "")
	Global $Checkbox_Add_PlayersOnline_to_Icons = GUICtrlCreateCheckbox(" Add current Players to Icons", $POS_X, $POS_Y_AdditionalSettings_Group + 21, 220, 20)
		GuiCtrlSetTip(-1, "If activated it will check the number of Players that are" & @CRLF & "currently playing the game and write it on top of the Icon.")
		If $State_Checkbox_Add_PlayersOnline_to_Icons = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Add_PlayersOnline_to_Icons, "_Checkbox_Add_PlayersOnline_to_Icons")

	$State_Checkbox_Add_SS_to_Icons = IniRead($config_ini,"Settings", "Add_SS_to_Icons", "")
	Global $Checkbox_Add_SS_to_Icons = GUICtrlCreateCheckbox(" Add Supersampling to Icons", $POS_X, $POS_Y_AdditionalSettings_Group + 41, 220, 20)
		GuiCtrlSetTip(-1, "If activated it will check the saved Supersampling settings" & @CRLF & "for each game and adds it on top of the Icon.")
		If $State_Checkbox_Add_SS_to_Icons = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Add_SS_to_Icons, "_Checkbox_Add_SS_to_Icons")

	$State_Checkbox_Add_SS_per_game = IniRead($config_ini,"Settings", "Add_SS_per_game", "")
	Global $Checkbox_Add_SS_per_game = GUICtrlCreateCheckbox(" Automatically add SS per game", $POS_X, $POS_Y_AdditionalSettings_Group + 61, 220, 20)
		GuiCtrlSetTip(-1, "If activated it will check the saved Supersampling settings" & @CRLF & "for the current loaded game and adds these value to SteamVR.")
		If $State_Checkbox_Add_SS_per_game = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Add_SS_per_game, "_Checkbox_Add_SS_per_game")
	If Not FileExists($VRUB_HomeLoaderFile) Then GUICtrlSetState($Checkbox_Add_SS_per_game, $GUI_UNCHECKED)
	If Not FileExists($VRUB_HomeLoaderFile) Then GUICtrlSetState($Checkbox_Add_SS_per_game, $GUI_DISABLE)
	If GUICtrlRead($Checkbox_Autostart_VRUB) = 4 Then GUICtrlSetState($Checkbox_Add_SS_per_game, $GUI_UNCHECKED)
	If GUICtrlRead($Checkbox_Autostart_VRUB) = 4 Then GUICtrlSetState($Checkbox_Add_SS_per_game, $GUI_DISABLE)

	Global $Button_Restore_SteamVR_Settings = GUICtrlCreateButton("Restore SteamVR Settings", $POS_X, $POS_Y_AdditionalSettings_Group + 81, 223, 20)
		GuiCtrlSetTip(-1, "Restores the SteamVR Settings." & @CRLF & @CRLF & "It will Restore the following Files:" & @CRLF & "- default.vrsettings" & @CRLF & "- tools.vrmanifest")
		GUICtrlSetOnEvent($Button_Restore_SteamVR_Settings, "_Button_Restore_SteamVR_Settings")


	Global $Button_Start_HomeLoaderLibrary = GUICtrlCreateButton("HomeLoader Library", 5, $POS_Y_Button_Start_HomeLoaderLibrary, 235, 30, $BS_BITMAP)

	If FileExists($ApplicationList_SteamLibrary_ALL_INI) Then
		GUICtrlSetColor(-1, "0x0000CD")
		GUICtrlSetFont(-1, 14, 600, 2, $font_StartUp_arial)
	Else
		GUICtrlSetData($Button_Start_HomeLoaderLibrary, "Scan Steam Library first")
		GUICtrlSetColor(-1, "0xFF0000")
		GUICtrlSetFont(-1, 13, 600, 2, $font_StartUp_arial)
	EndIf

	GuiCtrlSetTip(-1, "Starts Home Loader Library.")
	GUICtrlSetOnEvent($Button_Start_HomeLoaderLibrary, "_Button_Start_HomeLoaderLibrary")


	Global $Exit = GUICtrlCreateButton("Close", 5, $POS_Y_Button_Close, 235, 30)
		GuiCtrlSetTip(-1, "Closes Settings Window.")
		GUICtrlSetFont(-1, 14, 600, 2, $font_StartUp_arial)
		GUICtrlSetColor(-1, "0x006600")
		GUICtrlSetOnEvent($Exit, "_Exit")

	Global $State_StartUp_Radio_1 = GUICtrlRead($StartUp_Radio_1)
	Global $State_StartUp_Radio_2 = GUICtrlRead($StartUp_Radio_2)
	Global $State_StartUp_Radio_3 = GUICtrlRead($StartUp_Radio_3)
	Global $State_StartUp_Radio_4 = GUICtrlRead($StartUp_Radio_4)
	Global $State_StartUp_Radio_5 = GUICtrlRead($StartUp_Radio_5)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop
        EndSwitch
    WEnd

EndFunc

Func _StartUp_Add_Other_GUI()
	$font_arial = "arial"
	$Add_Other_GUI = GUICreate("Add Home App", 315, 165 , - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	GUICtrlCreateGroup("Choose new Home app", 5, 5, 305, 115)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 14, 400, 6, $font_arial)

	GUICtrlCreateLabel("Steam App:", 10, 40, 170, 25)
	GUICtrlSetFont(-1, 12, 400, 1, $font_arial)
	Global $DROPDOWN_Other_GUI = GUICtrlCreateCombo("Choose Application", 100, 39, 203, 35)
	GUICtrlSetOnEvent(- 1, "_DROPDOWN_Other_GUI")
	_DropDown_Add_Other_GUI_Set_Data()
	GUICtrlSetFont(-1, 10, 400, 2, "arial")

	GUICtrlCreateLabel("Game Path:", 10, 82, 115, 25)
	GUICtrlSetFont(-1, 12, 400, 1, $font_arial)
	Global $BUTTON_GamePath_Folder_Other_GUI = GUICtrlCreateButton("Select File", 100, 76, 205, 30, 0)
	GUICtrlSetOnEvent(- 1, "_BUTTON_GamePath_Folder_Other_GUI")
	GUICtrlSetFont(-1, 9, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Select File.")

	Global $Button_Exit_Add_Other_GUI = GUICtrlCreateButton("Exit", 275, 125, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_Add_Other_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	GUISetState()
EndFunc

#endregion

#Region Func MAIN
Func _StartUp_Button_HomeLoader()
	$State_StartUp_Radio_1 = GUICtrlRead($StartUp_Radio_1)
	$State_StartUp_Radio_2 = GUICtrlRead($StartUp_Radio_2)
	$State_StartUp_Radio_3 = GUICtrlRead($StartUp_Radio_3)
	$State_StartUp_Radio_4 = GUICtrlRead($StartUp_Radio_4)
	$State_StartUp_Radio_5 = GUICtrlRead($StartUp_Radio_5)

	If $State_StartUp_Radio_1 <> "4" Or $State_StartUp_Radio_2 <> "4" Or $State_StartUp_Radio_3 <> "4" Or $State_StartUp_Radio_4 <> "4" Or $State_StartUp_Radio_5 <> "4" Then
		GUICtrlSetState($Select_HomeApp_Label, $GUI_HIDE)
	EndIf
EndFunc

Func _ADD_2_SteamVR_Home_default()
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	$Install_DIR_StringReplace = StringReplace($Install_DIR, '\', '/')
	$NewHomePath = StringTrimRight($Install_DIR_StringReplace, 1) & "/System/StartHomeAPP.bat"
	_FileReadToArray($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File)

	If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
	FileDelete($Steam_tools_vrmanifest_File)

    For $LOOP_vrmanifest = 1 To $Array_tools_vrmanifest_File[0]
		$ReadLine_tools_vrmanifest = $Array_tools_vrmanifest_File[$LOOP_vrmanifest]
		If $ReadLine_tools_vrmanifest = '			"app_key": "openvr.tool.steamvr_environments",' Then
			Local $Line_NR_binary_path_windows = $LOOP_vrmanifest + 3
		EndIf

		If $LOOP_vrmanifest = $Line_NR_binary_path_windows Then
			$NewLine = '			"binary_path_windows" : "' & $NewHomePath & '",'
			If $HomeApp = "Default SteamVR Home" Then $NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
			FileWriteLine($Steam_tools_vrmanifest_File, $NewLine)
		Else
			FileWriteLine($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File[$LOOP_vrmanifest])
		EndIf
    Next
	_Create_StartHomeAPP_BAT_File()
EndFunc

Func _Create_StartHomeAPP_BAT_File()
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	If FileExists($StartHomeAPP_bat) Then FileDelete($StartHomeAPP_bat)
	If FileExists($StartSteamVRHome_au3) Then $StartSteamVRHome_x = "StartSteamVRHome.au3"
	If FileExists($StartSteamVRHome_exe) Then $StartSteamVRHome_x = "StartSteamVRHome.exe"

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

Func _Create_Uninstaller()
	If Not FileExists($Install_DIR & "Uninstall Files.exe") Then
		If FileExists($Install_DIR & "Uninstall.exe") Then
			FileMove($Install_DIR & "Uninstall.exe", $Install_DIR & "Uninstall Files.exe", $FC_CREATEPATH + $FC_OVERWRITE)
		EndIf
		Sleep(500)
		If FileExists($Install_DIR & "Uninstaller.exe") Then
			FileMove($Install_DIR & "Uninstaller.exe", $Install_DIR & "Uninstall.exe", $FC_CREATEPATH + $FC_OVERWRITE)
		EndIf
	EndIf
EndFunc

Func _Create_JanusVR_Page()
	$Install_DIR_replaced = StringReplace($Install_DIR, '\', '/')
	If FileExists($JanusVR_Page) Then FileDelete($JanusVR_Page)
	FileWrite($JanusVR_Page, '<!-- Written with Janus VR.  URL: file:///' & $Install_DIR_replaced & ' -->' & @CRLF & _
								'<html>' & @CRLF & _
								'<head>' & @CRLF & _
								'<title>Showcase Room</title>' & @CRLF & _
								'<meta charset="utf-8">' & @CRLF & _
								'</head>' & @CRLF & _
								'<body>' & @CRLF & _
								'<!--' & @CRLF & _
								'<FireBoxRoom>' & @CRLF & _
								'<Assets>' & @CRLF & _
								'<AssetObject id="Main" src="Walls_Roof_And_Floor.dae" />' & @CRLF & _
								'<AssetObject id="Wall_Frame_1" src="PictureFrame_1.obj" />' & @CRLF & _
								'<AssetObject id="Wall_Frame_2" src="PictureFrame_2.obj" />' & @CRLF & _
								'<AssetObject id="Wall_Frame_3" src="PictureFrame_3.obj" />' & @CRLF & _
								'<AssetObject id="Wall_Frame_4" src="PictureFrame_4.obj" />' & @CRLF & _
								'<AssetWebSurface height="1080" id="GamePage_ALL" show_url_bar="false" src="file:///' & $Install_DIR_replaced & 'WebPage/GamePage_ALL.html" width="1920" />' & @CRLF & _
								'<AssetWebSurface height="1080" id="GamePage_Non-Steam_Appl" show_url_bar="false" src="file:///' & $Install_DIR_replaced & 'WebPage/GamePage_Non-Steam_Appl.html" width="1920" />' & @CRLF & _
								'<AssetWebSurface height="1080" id="GamePage_Custom_1" show_url_bar="false" src="file:///' & $Install_DIR_replaced & 'WebPage/GamePage_Custom_1.html" width="1920" />' & @CRLF & _
								'<AssetWebSurface height="1080" id="GamePage_Custom_2" show_url_bar="false" src="file:///' & $Install_DIR_replaced & 'WebPage/GamePage_Custom_2.html" width="1920" />' & @CRLF & _
								'</Assets>' & @CRLF & _
								'<Room visible="false" pos="-4.6 0 4.6" xdir="-0.707109 0 -0.707105" ydir="0 1 0" zdir="0.707105 0 -0.707109">' & @CRLF & _
								'<Object id="Main" lighting="false" cull_face="none" collision_id="Main" />' & @CRLF & _
								'<Object id="Wall_Frame_1" pos="0 1 -2" websurface_id="GamePage_ALL" />' & @CRLF & _
								'<Object id="Wall_Frame_2" pos="0 0 0" websurface_id="GamePage_Non-Steam_Appl" />' & @CRLF & _
								'<Object id="Wall_Frame_3" pos="0 1 -2" websurface_id="GamePage_Custom_1" />' & @CRLF & _
								'<Object id="Wall_Frame_4" pos="0 0 0" websurface_id="GamePage_Custom_2" />' & @CRLF & _
								'</Room>' & @CRLF & _
								'</FireBoxRoom>' & @CRLF & _
								'-->' & @CRLF & _
								'<script src="https://web.janusvr.com/janusweb.js"></script>' & @CRLF & _
								'<script>elation.janusweb.init({url: document.location.href})</script>' & @CRLF & _
								'</body>' & @CRLF & _
								'</html>')
EndFunc

Func _Restore_Default_SteamVR_Home()
	FileCopy($Steam_tools_vrmanifest_File_BAK, $Steam_tools_vrmanifest_File)
	$WinName = "Default SteamVR Home"
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Default SteamVR Home")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/250820")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Default SteamVR Home")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
	$Install_DIR_StringReplace = StringReplace($Install_DIR, '\', '/')
	$NewHomePath = StringTrimRight($Install_DIR_StringReplace, 1) & "/StartSteamVRHome.exe"
	_FileReadToArray($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File)

	FileDelete($Steam_tools_vrmanifest_File)

    For $LOOP_vrmanifest = 1 To $Array_tools_vrmanifest_File[0]
		$ReadLine_tools_vrmanifest = $Array_tools_vrmanifest_File[$LOOP_vrmanifest]
		If $ReadLine_tools_vrmanifest = '			"app_key": "openvr.tool.steamvr_environments",' Then
			Local $Line_NR_binary_path_windows = $LOOP_vrmanifest + 3
		EndIf

		If $LOOP_vrmanifest = $Line_NR_binary_path_windows Then
			$NewLine = '			"binary_path_windows" : "' & $NewHomePath & '",'
			If $WinName = "Default SteamVR Home" Then $NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
			FileWriteLine($Steam_tools_vrmanifest_File, $NewLine)
		Else
			FileWriteLine($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File[$LOOP_vrmanifest])
		EndIf
    Next

	GUICtrlSetState($StartUp_Radio_0, $GUI_CHECKED)
	MsgBox($MB_OK + $MB_ICONINFORMATION, "SteamVR Files restored", "SteamVR Files sucessfully restored. You can now restart SteamVR or set a new Home App.")

EndFunc

#endregion

#Region Func Radio Selection
Func _StartUp_Radio_1() ; SteamVR Home
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "SteamVR Home")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $SteamVR_Path & "tools\steamvr_environments\game\bin\win64\steamtours.exe")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "SteamVR Home")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")

	_ADD_2_SteamVR_Home_default()
	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
	GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
	MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "'SteamVR Home' app was set as Home app.")
	_StartUp_Button_HomeLoader()
	_Sync_Config_INI()
EndFunc

Func _StartUp_Radio_2() ; Vive Home
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Setting Home App to Vive Home:")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Vive Home")
	Local $ViveHome_SDK_Path = $Install_DIR & "Apps\ViveHome\ViveHomeSDKTestbed.exe"
	Local $ViveHome_Path = $HTCVive_Path & "Updater\App\Home\win32\ViveHome.exe"

	If FileExists($ViveHome_SDK_Path) Then $ViveHome_Path = $ViveHome_SDK_Path

	FileWriteLine($stats_log_FILE, "- Vive Home Path = " & $ViveHome_Path)

	If FileExists($ViveHome_Path) Then
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $ViveHome_Path)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	Else
		$FileSelect = FileOpenDialog("Select 'VIVEHome.exe' File", $Install_DIR, "Executable (*.exe)")
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	EndIf

	If FileExists($ViveHome_Path) Then
		IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
		_ADD_2_SteamVR_Home_default()
		$HomeAppGroup_Label = "Home app:"
		If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
		GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "'Vive Home' app was set as Home app.")
		_StartUp_Button_HomeLoader()
	EndIf
	_Sync_Config_INI()
	;MsgBox(0, "HomePath", $ViveHome_Path)
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

	$JanusVR_Settings_Folder = "c:\Users\" & @UserName & "\Documents\janusvr\"
	$bookmarks_json = "c:\Users\" & @UserName & "\Documents\janusvr\appdata\bookmarks.json"
	$settings_json = "c:\Users\" & @UserName & "\Documents\janusvr\appdata\settings.json"

	Local $Abfrage_1 = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Janus VR bookmarks [1/3]", "Do you also want to add the default Home Loader Room" & @CRLF & _
																"to the JanusVR bookmark page?" & @CRLF & _
																$bookmarks_json & @CRLF & @CRLF & _
																"JanusVR Settings can be found in the following folder:" & @CRLF & _
																$JanusVR_Settings_Folder & @CRLF)

	If $Abfrage_1 = 6 Then
		_Create_JanusVR_Page()
		$Source_copy = $gfx & "VRGameLauncher.png"
		$Target_copy = StringReplace($JanusVR_Path, 'janusvr.exe', 'assets\3dui\thumbs\VRGameLauncher.png')
		$thumbnail_path = StringReplace($Target_copy, '\', '/')
		$Install_DIR_StringReplace_path = StringReplace($Install_DIR, '\', '/')
		FileCopy($Source_copy, $Target_copy, $FC_OVERWRITE)

		_FileReadToArray($bookmarks_json, $bookmarksArray)

		FileCopy($bookmarks_json, $bookmarks_json & ".bak", $FC_OVERWRITE)
		FileDelete($bookmarks_json)

		For $Loop = 1 To $bookmarksArray[0]
			If $Loop = 3 Then FileWriteLine($bookmarks_json, '        "thumbnail": "file:///' & $thumbnail_path & '",')
			If $Loop = 4 Then FileWriteLine($bookmarks_json, '        "title": "VR Game Launcher",')
			If $Loop = 5 Then FileWriteLine($bookmarks_json, '        "url": "file:///' & $Install_DIR_StringReplace_path & 'WebPage/janusvr/index.html"')

			If $Loop <> 3 And $Loop <> 4 And $Loop <> 5 Then
				FileWriteLine($bookmarks_json, $bookmarksArray[$Loop])
			EndIf
		Next
	EndIf


	Local $Abfrage_2 = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Home Loader Room autostart [2/3]", "Do you also want to autostart the default Home Loader Room" & @CRLF & _
																"after launching JanusVR?" & @CRLF & _
																$settings_json & @CRLF & @CRLF & _
																"JanusVR Settings can be found in the following folder:" & @CRLF & _
																$JanusVR_Settings_Folder & @CRLF & @CRLF & @CRLF & _
																"Bei Verwendung der SteamVR Version muss der Pfad" & @CRLF & _
																"in den Steam Startoptionen eingetragen werden." & @CRLF & _
																"'file:///" & $Install_DIR_StringReplace_path & "WebPage/janusvr/index.html'" & @CRLF)

	If $Abfrage_2 = 6 Then
		$Install_DIR_StringReplace_path = StringReplace($Install_DIR, '\', '/')

		_FileReadToArray($settings_json, $settingsArray)

		FileCopy($settings_json, $settings_json & ".bak", $FC_OVERWRITE)
		FileDelete($settings_json)

		For $Loop = 1 To $settingsArray[0]
			If $Loop = 20 Then FileWriteLine($settings_json, '    "launchurl": "file:///' & $Install_DIR_StringReplace_path & 'WebPage/janusvr/index.html",')

			If $Loop <> 20 Then
				FileWriteLine($settings_json, $settingsArray[$Loop])
			EndIf
		Next
	EndIf

	_ADD_2_SteamVR_Home_default()
	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
	GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
	MsgBox($MB_OK + $MB_ICONINFORMATION, "DDefault SteamVR Home 'Janus VR' [3/3]", "'Janus VR' app was set as Home app.")
	_StartUp_Button_HomeLoader()
	_Sync_Config_INI()
EndFunc

Func _StartUp_Radio_4() ; VR Toolbox
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "VR Toolbox")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")

	_ADD_2_SteamVR_Home_default()
	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
	GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
	MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "'VR Toolbox' app was set as Home app.")
	_StartUp_Button_HomeLoader()
	_Sync_Config_INI()
	_Start_HomeLoaderLibrary_UpdateStartPage()
EndFunc

Func _StartUp_Radio_5() ; Other
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Other")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
	_StartUp_Add_Other_GUI()
	_Sync_Config_INI()
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
		$HomeAppGroup_Label = "Home app:"
		If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
		GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "'Viveport VR' app was set as Home app.")
		_StartUp_Button_HomeLoader()
	EndIf
	_Sync_Config_INI()
	;MsgBox(0, "HomePath", $Viveport_Path)
EndFunc

#endregion

#Region Func Other GUI
Func _DropDown_Add_Other_GUI_Set_Data()
	Global $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	Global $DROPDOWN_DATA =  ""
	For $NR = 1 To $NR_Applications
		Global $Application_NR = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR + 1, "appid", "")
		Global $Application_name = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR + 1, "name", "")

		If $Application_appid <> "" Then
			If $NR = 1 Then
				$DROPDOWN_DATA = $Application_name & " [" & $Application_appid & "]"
			Else
				$DROPDOWN_DATA = $DROPDOWN_DATA & "|" & $Application_name & " [" & $Application_appid & "]"
			EndIf
		EndIf
	Next
	GUICtrlSetData($DROPDOWN_Other_GUI, $DROPDOWN_DATA, "Choose Application")
EndFunc

Func _DROPDOWN_Other_GUI() ; Other GUI DropDown
	$DROPDOWN = GUICtrlRead($DROPDOWN_Other_GUI)

	Local $StringSplit = StringSplit($DROPDOWN, '[')
	Local $SteamStartGameName = StringTrimRight(StringReplace($StringSplit[1], ']', ''), 1)
	Local $SteamStartURL = "steam://rungameid/" & StringReplace($StringSplit[2], ']', '')

	If $SteamStartGameName = "Bigscreen Beta" Then $SteamStartGameName = "Bigscreen"

	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", $SteamStartGameName)
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $SteamStartURL)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", $SteamStartGameName)

	_ADD_2_SteamVR_Home_default()
	MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "'" & $SteamStartGameName & "'" & " app was set as Home app.")

	_StartUp_Button_HomeLoader()
	GUIDelete($Add_Other_GUI)
	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
	GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
EndFunc

Func _BUTTON_GamePath_Folder_Other_GUI() ; Other GUI BUTTON
	$FileSelect = FileOpenDialog("Select the app you want to start.", @ScriptDir & "\", "Executable (*.exe;*.au3; ...)", $FD_FILEMUSTEXIST)

	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "")

	_ADD_2_SteamVR_Home_default()

	_StartUp_Button_HomeLoader()
	GUIDelete($Add_Other_GUI)
EndFunc

Func _Button_Exit_Add_Other_GUI()
	GUIDelete($Add_Other_GUI)
EndFunc

#endregion

#Region Func Checkbox
Func _Checkbox_Autostart_VRUB()
	$State_Checkbox = GUICtrlRead($Checkbox_Autostart_VRUB)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Autostart_VRUB", "true")
		GUICtrlSetState($Checkbox_Add_SS_per_game, $GUI_ENABLE)
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Autostart_VRUB", "false")
		IniWrite($config_ini, "Settings", "Add_SS_per_game", "false")
		GUICtrlSetState($Checkbox_Add_SS_per_game, $GUI_UNCHECKED)
		GUICtrlSetState($Checkbox_Add_SS_per_game, $GUI_DISABLE)
	EndIf
	_Sync_Config_INI()
EndFunc

Func _Checkbox_Add_PlayersOnline_to_Icons()
	$State_Checkbox = GUICtrlRead($Checkbox_Add_PlayersOnline_to_Icons)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Add_PlayersOnline_to_Icons", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Add_PlayersOnline_to_Icons", "false")
	EndIf
	_Sync_Config_INI()
EndFunc

Func _Checkbox_Add_SS_to_Icons()
	$State_Checkbox = GUICtrlRead($Checkbox_Add_SS_to_Icons)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Add_SS_to_Icons", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Add_SS_to_Icons", "false")
	EndIf
	_Sync_Config_INI()
EndFunc

Func _Checkbox_Add_SS_per_game()
	$State_Checkbox = GUICtrlRead($Checkbox_Add_SS_per_game)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Add_SS_per_game", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Add_SS_per_game", "false")
	EndIf
	_Sync_Config_INI()
EndFunc

Func _Button_Restore_SteamVR_Settings()
	Local $Abfrage = MsgBox($MB_ICONWARNING, "Attention!", "This function will delete the following Files and create new ones:" & @CRLF & _
															"- default.vrsettings" &  @CRLF & _
															"- tools.manifest" & @CRLF & @CRLF & _
															"Do you want to continue?")

	If $Abfrage = 6 Then
		FileDelete($default_vrsettings_File)
		FileDelete($Steam_tools_vrmanifest_File)
		Sleep(500)
		FileCopy($Install_DIR & "Backups\default.vrsettings", $default_vrsettings_File, $FC_OVERWRITE)
		FileCopy($Install_DIR & "Backups\tools.vrmanifest", $Steam_tools_vrmanifest_File, $FC_OVERWRITE)

		If FileExists($default_vrsettings_File) And FileExists($Steam_tools_vrmanifest_File) Then
			MsgBox($MB_ICONINFORMATION, "Finished", "New Files successfully created/restored.")
		Else
			MsgBox($MB_ICONERROR, "Error", "Something went wrong, new Files not created.")
		EndIf
	EndIf
	_Sync_Config_INI()
EndFunc

#endregion

#Region Func Restart / Exit / Reload
Func _Button_Start_HomeLoaderLibrary()
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	Exit
EndFunc

Func _Sync_Config_INI()
	FileCopy($Config_INI, $System_DIR & "config.ini", $FC_OVERWRITE)
EndFunc

Func _FirstStart_Restart()
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	Exit
EndFunc

Func _Start_HomeLoaderLibrary_UpdateStartPage()
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "UpdateStartPage", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "UpdateStartPage", $System_DIR)
	EndIf
EndFunc

Func _Restart()
	GUIDelete($GUI_StartUp_settings)
	If FileExists($System_DIR & "Settings.exe") Then
		ShellExecute($System_DIR & "Settings.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "Settings.au3", "", $System_DIR)
	EndIf
	Exit
EndFunc

Func _Exit()
	_Sync_Config_INI()
	Exit
EndFunc

#endregion

