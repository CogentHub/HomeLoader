
#Region Includes
#include <GuiButton.au3>
#include <File.au3>
#include <GUIConstants.au3>
#include <Date.au3>
#include <GuiImageList.au3>
#include <AutoItConstants.au3>
#include <GuiMenu.au3>
#endregion

Opt("GUIOnEventMode", 1)

#Region Declare Globals
Global $Button_Exit, $Select_HomeApp_Label, $Line_NR_binary_path_windows, $Line_NR_arguments
Global $Array_tools_vrmanifest_File, $Add_Other_GUI, $bookmarksArray, $settingsArray, $StartSteamVRHome_x
Global $RM_AutoStart_Item1, $RM_AutoStart_Item2, $RM_AutoStart_Item3, $RM_AutoStart_Item4, $RM_AutoStart_Item5
Global $RM_AutoStart_Item6, $RM_AutoStart_Item7, $RM_AutoStart_Item8, $RM_AutoStart_Item9, $RM_AutoStart_Item10
Global $RM_AutoStart_Item11, $RM_AutoStart_Item12, $Autostart_App_10_State, $Autostart_App_10_State_New
Global $bookmarks_json, $JanusVR_Settings_Folder, $JanusVR_Path, $settings_json, $Install_DIR_StringReplace_path
Global $GUI_StartUp_settings, $NR_ApplicationsCheck
Global $font_arial = "arial"
#endregion

#Region Variables
;Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
;If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Config_INI = @ScriptDir & "\System\config.ini"
Global $Version = "0.72"
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
;Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")
Global $Update_Performed_Check = IniRead($config_ini, "TEMP", "Update", "")
Global $Add_HomeLoader_to_VRToolbox_StartPage = IniRead($config_ini, "Settings", "Add_HomeLoader_to_VRToolbox_StartPage", "")
Global $VRToolbox_HomeLoader_StartPage  = $Install_DIR & "Apps\VRToolBox\HomeLoader\HomeLoader_StartPage.html"

Global $Create_JanusVR_Bookmark = IniRead($config_ini, "Settings", "Create_JanusVR_Bookmark", "")
Global $JanusVR_Autostart_HomeLoader_Room = IniRead($config_ini, "Settings", "JanusVR_Autostart_HomeLoader_Room", "")

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
Global $libraryfolders_vdf = $Steam_Path & "steamapps\libraryfolders.vdf"

Global $Steamvr_vrsettings_FilePath = $Steam_Path & "config\steamvr.vrsettings"
If Not FileExists($Steamvr_vrsettings_FilePath & ".bak") Then FileCopy($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_FilePath & ".bak", $FC_CREATEPATH + $FC_OVERWRITE)
If Not FileExists($Install_DIR & "Backups\steamvr.vrsettings") Then FileCopy($Steamvr_vrsettings_FilePath, $Install_DIR & "Backups\steamvr.vrsettings", $FC_CREATEPATH + $FC_OVERWRITE)

Global $Steamapps_vrmanifest_FilePath = $Steam_Path & "config\steamapps.vrmanifest"
If Not FileExists($Steamapps_vrmanifest_FilePath & ".bak") Then FileCopy($Steamapps_vrmanifest_FilePath, $Steamapps_vrmanifest_FilePath & ".bak", $FC_CREATEPATH + $FC_OVERWRITE)
If Not FileExists($Install_DIR & "Backups\steamapps.vrmanifest") Then FileCopy($Steamapps_vrmanifest_FilePath, $Install_DIR & "Backups\steamapps.vrmanifest", $FC_CREATEPATH + $FC_OVERWRITE)


Global $HTCVive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\HTC\HTC Vive\', "ViveHelperPath")
Global $HTCVive_Path_StringReplace_1 = StringReplace($HTCVive_Path_REG, 'PCClient\ViveportDesktopHelper.exe', '')
Global $HTCVive_Path = StringReplace($HTCVive_Path_StringReplace_1, '/', '\')

Global $Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
Global $Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
Global $Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
Global $Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
Global $Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

Global $default_vrsettings_File = $SteamVR_Path & "resources\settings\default.vrsettings"
If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
Global $default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
Global $default_vrsettings_File_new = $default_vrsettings_File & ".new"

Global $Steam_tools_vrmanifest_File = $SteamVR_Path & "tools\tools.vrmanifest"
If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
Global $Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"

Global $htc_vive_overlay_vrappconfig = $Steam_Path & "config\vrappconfig\" & "htc.vive.overlay.vrappconfig"

Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")

Global $Autostart_Apps = IniRead($Config_INI, "Autostart", "Autostart", "")

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

Global $Autostart_App_1_Path = IniRead($Config_INI, "Autostart", "App_1_Path", "")
Global $Autostart_App_2_Path = IniRead($Config_INI, "Autostart", "App_2_Path", "")
Global $Autostart_App_3_Path = IniRead($Config_INI, "Autostart", "App_3_Path", "")
Global $Autostart_App_4_Path = IniRead($Config_INI, "Autostart", "App_4_Path", "")
Global $Autostart_App_5_Path = IniRead($Config_INI, "Autostart", "App_5_Path", "")
Global $Autostart_App_6_Path = IniRead($Config_INI, "Autostart", "App_6_Path", "")
Global $Autostart_App_7_Path = IniRead($Config_INI, "Autostart", "App_7_Path", "")
Global $Autostart_App_8_Path = IniRead($Config_INI, "Autostart", "App_8_Path", "")
Global $Autostart_App_9_Path = IniRead($Config_INI, "Autostart", "App_9_Path", "")
Global $Autostart_App_10_Path = $HTCVive_Path & "Updater\App\Dashboard\win32\ViveDashboard.exe"

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

;MsgBox(0, "Settings GUI 1", $First_Start & @CRLF & _
;							$Config_INI & @CRLF & _
;							$Install_DIR & @CRLF & _
;							$System_DIR & @CRLF & _
;							$Steam_Path & @CRLF & _
;							$SteamVR_Path & @CRLF)


;_Settings_GUI()

#Region First Start And Empty Check

Func _First_Start_Check()
	If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK, $FC_OVERWRITE)
	If $default_vrsettings_File = "" Then MsgBox($MB_ICONERROR, "Attention!", "Default.vrsettings File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")

	If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK, $FC_OVERWRITE)
	If $Steam_tools_vrmanifest_File = ""  Then MsgBox($MB_ICONERROR, "Attention!", "Tools.vrmanifest File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")

	If $First_Start = "true" Then
		If Not FileExists($Install_DIR & "Backups\default.vrsettings") Then FileCopy($default_vrsettings_File, $Install_DIR & "Backups\default.vrsettings", $FC_OVERWRITE)
		If Not FileExists($Install_DIR & "Backups\tools.vrmanifest") Then FileCopy($Steam_tools_vrmanifest_File, $Install_DIR & "Backups\tools.vrmanifest", $FC_OVERWRITE)
		;_FirstStart_Restart()
	EndIf

	If $First_Start = "true" Then ; Settings
		MsgBox($MB_ICONWARNING, "Welcome to HomeLoader, by CogentRifter", "Choose your Home app, and then choose HomeLoaderLibrary" & @CRLF & _
								"to set up your games or Start SteamVR to just jump in." & @CRLF & @CRLF & @CRLF & @CRLF & _
								'Additional Informations:' & @CRLF & _
								'The first time that you use HomeLoader, it will create Backups' & @CRLF & _
								'for your "default.vrsettings" and "tools.manifest" files.' & @CRLF & _
								"You can find them at '" & $Install_DIR & "Backups\" & "'" & @CRLF & @CRLF & _
								'When you tell it to, HomeLoader will scan your Steam' & @CRLF & _
								'directories for games. HomeLoader automatically finds your'  & @CRLF & _
								'Steam directories but you can still change or add manually'  & @CRLF & _
								'Steam Library folders in the settings. Click the "Settings" icon' & @CRLF & _
								'in the lower right to add additional Steam Library folders.' & @CRLF & _
								'If you changed the default installation path for Steam then' & @CRLF & _
								'you can change it in "Settings" as well.')
		IniWrite($Config_INI, "Settings", "First_Start", "false")
		_Settings_GUI()
	EndIf

	If Not FileExists($Steam_tools_vrmanifest_File) Then _Settings_Detect_SteamVR_Files()
	If Not FileExists($default_vrsettings_File) Then _Settings_Detect_SteamVR_Files()
EndFunc



Func _Check_vrappconfig_File()
	Local $Value = FileReadLine($htc_vive_overlay_vrappconfig, 2)
	Local $Check_autolaunch = StringReplace(StringReplace($Value, '   "autolaunch" : ', ''), ',', '')
	$Autostart_App_10_State = $Check_autolaunch
	If $Autostart_App_10_State = "true" Then GUICtrlSetState($RM_AutoStart_Item12, $GUI_CHECKED)
	If $Autostart_App_10_State <> "true" Then GUICtrlSetState($RM_AutoStart_Item12, $GUI_UNCHECKED)
EndFunc

Func _Write_vrappconfig_File()
	Local $Value = FileReadLine($htc_vive_overlay_vrappconfig, 2)
	Local $Check_autolaunch = StringReplace(StringReplace($Value, '   "autolaunch" : ', ''), ',', '')
	$Autostart_App_10_State = $Check_autolaunch
	$Autostart_Apps = IniRead($Config_INI, "Autostart", "Autostart", "")
	If $Autostart_Apps <> "true" Then $Autostart_App_10_State = "true"
	Local $Value_1 = FileReadLine($htc_vive_overlay_vrappconfig, 1)
	Local $Value_2 = FileReadLine($htc_vive_overlay_vrappconfig, 2)
	Local $Value_3 = FileReadLine($htc_vive_overlay_vrappconfig, 3)
	If FileExists($htc_vive_overlay_vrappconfig) Then FileDelete($htc_vive_overlay_vrappconfig)

	FileWriteLine($htc_vive_overlay_vrappconfig, $Value_1)
	If $Autostart_App_10_State = "true" Then
		FileWriteLine($htc_vive_overlay_vrappconfig, '   "autolaunch" : ' & "false,")
		IniWrite($Config_INI, "Autostart", "App_10_Name", $Autostart_App_10_Name)
		IniWrite($Config_INI, "Autostart", "App_10_Path", $Autostart_App_10_Path)
		IniWrite($Config_INI, "Autostart", "App_10_State", "false")
	Else
		FileWriteLine($htc_vive_overlay_vrappconfig, '   "autolaunch" : ' & "true,")
		IniWrite($Config_INI, "Autostart", "App_10_Name", $Autostart_App_10_Name)
		IniWrite($Config_INI, "Autostart", "App_10_Path", $Autostart_App_10_Path)
		IniWrite($Config_INI, "Autostart", "App_10_State", "true")
	EndIf
	FileWriteLine($htc_vive_overlay_vrappconfig, $Value_3)
EndFunc

Func _Settings_Detect_SteamVR_Files()
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

	Global $HEIGHT_GUI = 288 ; 440
	Global $POS_X = 5
	Global $POS_Y_HomeApp_Group = 5
	Global $POS_Y_Autostart_Group = 100
	Global $POS_Y_AdditionalSettings_Group = 160
	Global $POS_Y_Button_Start_HomeLoaderLibrary = 188
	Global $POS_Y_Button_Close = 223 ; 372

	Global $HomeAppGroup
	Global $HomeAppGroup_Label

    Global $GUI_StartUp_settings = GUICreate("HomeLoader - Settings", 250, $HEIGHT_GUI, -1, -1, $WS_EX_TOPMOST)
	GUISetIcon(@AutoItExe, -2, $GUI_StartUp_settings)
    GUISetState(@SW_SHOW, $GUI_StartUp_settings)

	Global $font_StartUp_arial = "arial"

	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"

	$HomeAppGroup = GUICtrlCreateGroup($HomeAppGroup_Label, 5, $POS_Y_HomeApp_Group, 235, 90)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)

	Global $StartUp_Radio_0 = GUICtrlCreateRadio("SteamVR", 9, $POS_Y_HomeApp_Group + 20, 62, 20) ; SteamVR
		GuiCtrlSetTip(-1, "Sets SteamVR as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_0, "_StartUp_Radio_1")

	Global $StartUp_Radio_1 = GUICtrlCreateRadio("Vive Home", 76, $POS_Y_HomeApp_Group + 20, 70, 20) ; Vive Home
		GuiCtrlSetTip(-1, "Sets Vive Home as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_1, "_StartUp_Radio_2")

	Global $StartUp_Radio_2 = GUICtrlCreateRadio("Viveport VR", 148, $POS_Y_HomeApp_Group + 20, 75, 20) ; Viveport VR
		GuiCtrlSetTip(-1, "Sets Viveport VR as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_2, "_StartUp_Radio_6")

	Global $StartUp_Radio_3 = GUICtrlCreateRadio("Bigscreen", 9, $POS_Y_HomeApp_Group + 42, 65, 20) ; Bigscreen ; JanusVR Backup
		GuiCtrlSetTip(-1, "Sets Bigscreen as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_3, "_StartUp_Radio_7")

	Global $StartUp_Radio_4 = GUICtrlCreateRadio("VRToolbox", 76, $POS_Y_HomeApp_Group + 42, 70, 20) ; VR Toolbox
		GuiCtrlSetTip(-1, "Sets VRToolbox as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_4, "_StartUp_Radio_4")

	Global $StartUp_Radio_5 = GUICtrlCreateRadio("Virtual Desktop", 148, $POS_Y_HomeApp_Group + 42, 87, 20) ; Virtual Desktop
		GuiCtrlSetTip(-1, "Sets Virtual Desktop as SteamVR Home App.")
		GUICtrlSetOnEvent($StartUp_Radio_5, "_StartUp_Radio_8")

	Global $StartUp_Radio_6 = GUICtrlCreateRadio("None", 9, $POS_Y_HomeApp_Group + 64, 45, 20) ; None
		GuiCtrlSetTip(-1, "Removes the current SteamVR Home app and don't set's an new one." & @CRLF & "[White empty room]")
		GUICtrlSetOnEvent($StartUp_Radio_6, "_StartUp_Radio_3")

	Global $StartUp_Radio_9 = GUICtrlCreateRadio("Other [Choose App]", 76, $POS_Y_HomeApp_Group + 64, 110, 20) ; Other
	GuiCtrlSetTip(-1, "Sets any other Apllication as SteamVR Home App." & @CRLF & "Choose the desired application from the Drop Down Menu.")
		GUICtrlSetOnEvent($StartUp_Radio_9, "_StartUp_Radio_5")

	_RM_Selection_Contextmenu_SteamVR()
	_RM_Selection_Contextmenu_ViveHome()
	_RM_Selection_Contextmenu_ViveportVR()
	_RM_Selection_Contextmenu_JanusVR()
	_RM_Selection_Contextmenu_VRToolBox()
	_RM_Selection_Contextmenu_Bigscreen()
	_RM_Selection_Contextmenu_VirtualDesktop()
	_RM_Selection_Contextmenu_Other()

	GUICtrlCreateGroup("Autostart:", 5, $POS_Y_Autostart_Group, 235, 45)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)

	Global $State_Checkbox_Autostart_VRUB = IniRead($config_ini,"Settings", "Autostart_VRUB", "")
	Global $Checkbox_Autostart_VRUB = GUICtrlCreateCheckbox(" VRUtilityBelt", 10, $POS_Y_Autostart_Group + 20, 100, 20)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
		GuiCtrlSetTip(-1, "If activated it will automatically start VRUB when SteamVR is launched.")
		If $State_Checkbox_Autostart_VRUB = "True" Then GUICtrlSetState($Checkbox_Autostart_VRUB, $GUI_CHECKED)


	; Button $AutoStart_Selection
	Global $AutoStart_Selection = GUICtrlCreateButton("[Select Applications]", 115, $POS_Y_Autostart_Group + 16, 120, 20)
	GUICtrlSetOnEvent(- 1, "_RM_Selection_Button")
	GUICtrlSetTip(-1, "Right Click to select Apps.")
	Global $hImagebtn = _GUIImageList_Create(13, 13, 5, 3)
	_GUIImageList_AddIcon($hImagebtn, "shell32.dll", 137, True)
	_GUICtrlButton_SetImageList($AutoStart_Selection, $hImagebtn)

	_RM_Selection_Contextmenu()
	If $Autostart_Apps = "true" Then _Check_vrappconfig_File()

	GUICtrlSetFont(-1, 8.8, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Autostart_VRUB, "_Checkbox_Autostart_VRUB")
	If Not FileExists($VRUB_HomeLoaderFile) Then GUICtrlSetState($Checkbox_Autostart_VRUB, $GUI_UNCHECKED)
	If Not FileExists($VRUB_HomeLoaderFile) Then GUICtrlSetState($Checkbox_Autostart_VRUB, $GUI_DISABLE)


	Global $Button_Restore_SteamVR_Settings = GUICtrlCreateButton("Restore SteamVR Settings", $POS_X, $POS_Y_AdditionalSettings_Group - 7, 235, 30)
		GuiCtrlSetTip(-1, "Restores the SteamVR Settings." & @CRLF & @CRLF & "It will Restore the following Files:" & @CRLF & _
																				"- tools.manifest" & @CRLF & _
																				"- steamvr.vrsettings" & @CRLF & _
																				"- default.vrsettings" & @CRLF & _
																				"- steamapps.vrmanifest")

		GUICtrlSetFont(-1, 11, 600, 2, $font_StartUp_arial)
		GUICtrlSetColor(-1, "0")
		GUICtrlSetOnEvent($Button_Restore_SteamVR_Settings, "_Button_Restore_SteamVR_Settings")


	Global $Button_Start_HomeLoaderLibrary = GUICtrlCreateButton("HomeLoader Library", 5, $POS_Y_Button_Start_HomeLoaderLibrary, 235, 30, $BS_BITMAP)

	$NR_ApplicationsCheck = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	If $NR_ApplicationsCheck = "" Or $NR_ApplicationsCheck = 0 Then
		$NR_ApplicationsCheck = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	EndIf

	If Not FileExists($ApplicationList_SteamVRLibrary_ALL_INI) Or $NR_ApplicationsCheck = "" Or $NR_ApplicationsCheck = 0 Then
		GUICtrlSetData($Button_Start_HomeLoaderLibrary, "Scan Steam Library first")
		GUICtrlSetColor(-1, "0xFF0000")
		GUICtrlSetFont(-1, 13, 600, 2, $font_StartUp_arial)
	Else
		GUICtrlSetColor(-1, "0x0000CD")
		GUICtrlSetFont(-1, 14, 600, 2, $font_StartUp_arial)
	EndIf

	GuiCtrlSetTip(-1, "Starts Home Loader Library.")
	GUICtrlSetOnEvent($Button_Start_HomeLoaderLibrary, "_Button_Start_HomeLoaderLibrary")


	Global $Exit = GUICtrlCreateButton("Close", 5, $POS_Y_Button_Close, 235, 30)
		GuiCtrlSetTip(-1, "Closes Settings Window.")
		GUICtrlSetFont(-1, 14, 600, 2, $font_StartUp_arial)
		GUICtrlSetColor(-1, "0x006600")
		GUICtrlSetOnEvent($Exit, "_Settings_Exit")

	If $State_Checkbox_Autostart_VRUB = "true" Then
		_Func_AutoStart_1_Hide()
	Else
		If $HomeApp = "SteamVR Home" Then GUICtrlSetState($StartUp_Radio_0, $GUI_CHECKED)
		If $HomeApp = "Vive Home" Then GUICtrlSetState($StartUp_Radio_1, $GUI_CHECKED)
		If $HomeApp = "Viveport VR" Then GUICtrlSetState($StartUp_Radio_2, $GUI_CHECKED)
		If $HomeApp = "Bigscreen" Then GUICtrlSetState($StartUp_Radio_3, $GUI_CHECKED)
		If $HomeApp = "VR Toolbox" Then GUICtrlSetState($StartUp_Radio_4, $GUI_CHECKED)
		If $HomeApp = "Virtual Desktop" Then GUICtrlSetState($StartUp_Radio_5, $GUI_CHECKED)
		If $HomeApp = "None" Then GUICtrlSetState($StartUp_Radio_6, $GUI_CHECKED)
		If $HomeApp = "Other" And $Home_Path <> "" Then GUICtrlSetState($StartUp_Radio_9, $GUI_CHECKED)
	EndIf

	Global $State_StartUp_Radio_1 = GUICtrlRead($StartUp_Radio_1)
	Global $State_StartUp_Radio_2 = GUICtrlRead($StartUp_Radio_2)
	Global $State_StartUp_Radio_3 = GUICtrlRead($StartUp_Radio_3)
	Global $State_StartUp_Radio_4 = GUICtrlRead($StartUp_Radio_4)
	Global $State_StartUp_Radio_5 = GUICtrlRead($StartUp_Radio_5)
	Global $State_StartUp_Radio_6 = GUICtrlRead($StartUp_Radio_6)
	Global $State_StartUp_Radio_9 = GUICtrlRead($StartUp_Radio_9)

    ;While 1
    ;    Switch GUIGetMsg()
    ;        Case $GUI_EVENT_CLOSE
    ;            ExitLoop
    ;    EndSwitch
    ;WEnd

EndFunc

Func _RM_Selection_Contextmenu_SteamVR()
	Global $contextmenu_SteamVR = GUICtrlCreateContextMenu($StartUp_Radio_0)

	Global $RM_SteamVR_Item1 = GUICtrlCreateMenuItem("Open HomeLoader Library in Game Page Mode", $contextmenu_SteamVR)
		If IniRead($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "") = "true" Then
			GUICtrlSetState(- 1, $GUI_CHECKED)
		EndIf
		GUICtrlSetOnEvent(- 1, "_RM_Open_GamePage_with_HomeApp")
EndFunc

Func _RM_Selection_Contextmenu_ViveHome()
	Global $contextmenu_ViveHome = GUICtrlCreateContextMenu($StartUp_Radio_1)

	Global $RM_ViveHome_Item1 = GUICtrlCreateMenuItem("Open HomeLoader Library in Game Page Mode", $contextmenu_ViveHome)
		If IniRead($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "") = "true" Then
			GUICtrlSetState(- 1, $GUI_CHECKED)
		EndIf
		GUICtrlSetOnEvent(- 1, "_RM_Open_GamePage_with_HomeApp")
EndFunc

Func _RM_Selection_Contextmenu_ViveportVR()
	Global $contextmenu_ViveportVR = GUICtrlCreateContextMenu($StartUp_Radio_2)

	Global $RM_ViveportVR_Item1 = GUICtrlCreateMenuItem("Open HomeLoader Library in Game Page Mode", $contextmenu_ViveportVR)
		If IniRead($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "") = "true" Then
			GUICtrlSetState(- 1, $GUI_CHECKED)
		EndIf
		GUICtrlSetOnEvent(- 1, "_RM_Open_GamePage_with_HomeApp")
EndFunc

Func _RM_Selection_Contextmenu_JanusVR()
	Global $contextmenu_JanusVR = GUICtrlCreateContextMenu($StartUp_Radio_3)

	;Global $RM_JanusVR_Item1 = GUICtrlCreateMenuItem("Create JanusVR Bookmark for HomeLoader", $contextmenu_JanusVR)
	;	If IniRead($Config_INI, "Settings", "Create_JanusVR_Bookmark", "") = "true" Then
	;		GUICtrlSetState(- 1, $GUI_CHECKED)
	;	EndIf
	;	GUICtrlSetOnEvent(- 1, "_RM_JanusVR_CheckBox_1")

	;Global $RM_JanusVR_Item2 = GUICtrlCreateMenuItem("Autostart HomeLoader Room", $contextmenu_JanusVR)
	;	If IniRead($Config_INI, "Settings", "JanusVR_Autostart_HomeLoader_Room", "") = "true" Then
	;		GUICtrlSetState(- 1, $GUI_CHECKED)
	;	EndIf
	;	GUICtrlSetOnEvent(- 1, "_RM_JanusVR_CheckBox_2")

	Global $RM_JanusVR_Item3 = GUICtrlCreateMenuItem("Open HomeLoader Library in Game Page Mode", $contextmenu_JanusVR)
		If IniRead($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "") = "true" Then
			GUICtrlSetState(- 1, $GUI_CHECKED)
		EndIf
		GUICtrlSetOnEvent(- 1, "_RM_Open_GamePage_with_HomeApp")
EndFunc

Func _RM_Selection_Contextmenu_VRToolBox()
	Global $contextmenu_VRToolBox = GUICtrlCreateContextMenu($StartUp_Radio_4)

	Global $RM_VRToolBox_Item_1 = GUICtrlCreateMenu("YouTube Video Page", $contextmenu_VRToolBox)

	Global $RM_VRToolBox_Item_1_1 = GUICtrlCreateMenuItem("ON", $RM_VRToolBox_Item_1, -1, 1)
		If IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "Settings", "UseVideoPages", "") = "true" Then
			GUICtrlSetState(- 1, $GUI_CHECKED)
		EndIf
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_1")

	Global $RM_VRToolBox_Item_1_2 = GUICtrlCreateMenuItem("OFF", $RM_VRToolBox_Item_1, -1, 1)
		If IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "Settings", "UseVideoPages", "") <> "true" Then
			GUICtrlSetState(- 1, $GUI_CHECKED)
		EndIf
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_2")

	GUICtrlCreateMenuItem("", $RM_VRToolBox_Item_1)

	Global $RM_VRToolBox_Item_1_3 = GUICtrlCreateMenu("Select Video Page", $RM_VRToolBox_Item_1)

	Global $VIDEOID_1 = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_1", "")
	If $VIDEOID_1 <> "" Then
		Global $RM_VRToolBox_Item1_3_1 = GUICtrlCreateMenuItem("1 - " & $VIDEOID_1, $RM_VRToolBox_Item_1_3)
		Global $hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Selection.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($RM_VRToolBox_Item_1_3), $RM_VRToolBox_Item1_3_1, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_3_1")
	EndIf

	Global $VIDEOID_2 = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_2", "")
	If $VIDEOID_2 <> "" Then
		Global $RM_VRToolBox_Item1_3_2 = GUICtrlCreateMenuItem("2 - " & $VIDEOID_2, $RM_VRToolBox_Item_1_3)
		$hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Selection.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($RM_VRToolBox_Item_1_3), $RM_VRToolBox_Item1_3_2, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_3_2")
	EndIf

	Global $VIDEOID_3 = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_3", "")
	If $VIDEOID_3 <> "" Then
		Global $RM_VRToolBox_Item1_3_3 = GUICtrlCreateMenuItem("3 - " & $VIDEOID_3, $RM_VRToolBox_Item_1_3)
		$hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Selection.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($RM_VRToolBox_Item_1_3), $RM_VRToolBox_Item1_3_3, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_3_3")
	EndIf

	Global $VIDEOID_4 = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_4", "")
	If $VIDEOID_4 <> "" Then
		Global $RM_VRToolBox_Item1_3_4 = GUICtrlCreateMenuItem("4 - " & $VIDEOID_4, $RM_VRToolBox_Item_1_3)
		$hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Selection.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($RM_VRToolBox_Item_1_3), $RM_VRToolBox_Item1_3_4, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_3_4")
	EndIf

	Global $VIDEOID_5 = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_5", "")
	If $VIDEOID_5 <> "" Then
		Global $RM_VRToolBox_Item1_3_5 = GUICtrlCreateMenuItem("5 - " & $VIDEOID_5, $RM_VRToolBox_Item_1_3)
		$hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Selection.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($RM_VRToolBox_Item_1_3), $RM_VRToolBox_Item1_3_5, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_3_5")
	EndIf

	Global $VIDEOID_6 = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_6", "")
	If $VIDEOID_6 <> "" Then
		Global $RM_VRToolBox_Item1_3_6 = GUICtrlCreateMenuItem("6 - " & $VIDEOID_6, $RM_VRToolBox_Item_1_3)
		$hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Selection.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($RM_VRToolBox_Item_1_3), $RM_VRToolBox_Item1_3_6, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_3_6")
	EndIf

	Global $VIDEOID_7 = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_7", "")
	If $VIDEOID_7 <> "" Then
		Global $RM_VRToolBox_Item1_3_7 = GUICtrlCreateMenuItem("7 - " & $VIDEOID_7, $RM_VRToolBox_Item_1_3)
		$hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Selection.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($RM_VRToolBox_Item_1_3), $RM_VRToolBox_Item1_3_7, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_3_7")
	EndIf

	Global $VIDEOID_8 = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_8", "")
	If $VIDEOID_8 <> "" Then
		Global $RM_VRToolBox_Item1_3_8 = GUICtrlCreateMenuItem("8 - " & $VIDEOID_8, $RM_VRToolBox_Item_1_3)
		$hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Selection.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($RM_VRToolBox_Item_1_3), $RM_VRToolBox_Item1_3_8, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_3_8")
	EndIf

	Global $VIDEOID_9 = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_9", "")
	If $VIDEOID_9 <> "" Then
		Global $RM_VRToolBox_Item1_3_9 = GUICtrlCreateMenuItem("9 - " & $VIDEOID_9, $RM_VRToolBox_Item_1_3)
		$hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Selection.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($RM_VRToolBox_Item_1_3), $RM_VRToolBox_Item1_3_9, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_3_9")
	EndIf

	Global $VIDEOID_10 = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_10", "")
	If $VIDEOID_10 <> "" Then
		Global $RM_VRToolBox_Item1_3_10 = GUICtrlCreateMenuItem("10 - " & $VIDEOID_10, $RM_VRToolBox_Item_1_3)
		$hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Selection.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($RM_VRToolBox_Item_1_3), $RM_VRToolBox_Item1_3_10, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_3_10")
	EndIf

	Global $RM_VRToolBox_Item_1_4 = GUICtrlCreateMenuItem("Prepare new Video Page [Random Video]", $RM_VRToolBox_Item_1)
		$hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Selection.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($RM_VRToolBox_Item_1), $RM_VRToolBox_Item_1_4, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_VRToolBox_Item_1_4")

	Global $RM_VRToolBox_Item_2 = GUICtrlCreateMenuItem("Open HomeLoader Library in Game Page Mode", $contextmenu_VRToolBox)
		If IniRead($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "") = "true" Then
			GUICtrlSetState(- 1, $GUI_CHECKED)
		EndIf
		GUICtrlSetOnEvent(- 1, "_RM_Open_GamePage_with_HomeApp")

	Global $RM_VRToolBox_Item_3 = GUICtrlCreateMenuItem("Add HomeLoader Shortcut to the VRToolbox Start Page", $contextmenu_VRToolBox)
		If IniRead($Config_INI, "Settings", "Add_HomeLoader_to_VRToolbox_StartPage", "") = "true" Then
			GUICtrlSetState(- 1, $GUI_CHECKED)
		EndIf
		GUICtrlSetOnEvent(- 1, "_RM_Add_HomeLoader_to_VRToolbox_StartPage")

	Global $RM_VRToolBox_Item_4 = GUICtrlCreateMenuItem("Add Link to the VRToolbox 'HomeLoader Start Page'", $contextmenu_VRToolBox)
		$hBmpCreate = _WinAPI_LoadImage(0, $gfx & "RM_Add.bmp", $IMAGE_BITMAP, 16, 16, BitOR($LR_LOADTRANSPARENT, $LR_LOADFROMFILE))
		_GUICtrlMenu_SetItemBitmaps(GUICtrlGetHandle($contextmenu_VRToolBox), $RM_VRToolBox_Item_4, $hBmpCreate, $hBmpCreate, False)
		GUICtrlSetOnEvent(- 1, "_RM_Add_Link_to_HL_StartPage_GUI")

	_Settings_Set_States()
EndFunc

Func _RM_Selection_Contextmenu_Bigscreen()
	Global $contextmenu_Bigscreen = GUICtrlCreateContextMenu($StartUp_Radio_5)

	Global $RM_Bigscreen_Item1 = GUICtrlCreateMenuItem("Open HomeLoader Library in Game Page Mode", $contextmenu_Bigscreen)
		If IniRead($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "") = "true" Then
			GUICtrlSetState(- 1, $GUI_CHECKED)
		EndIf
		GUICtrlSetOnEvent(- 1, "_RM_Open_GamePage_with_HomeApp")
EndFunc

Func _RM_Selection_Contextmenu_VirtualDesktop()
	Global $contextmenu_VirtualDesktop = GUICtrlCreateContextMenu($StartUp_Radio_6)

	Global $RM_VirtualDesktop_Item1 = GUICtrlCreateMenuItem("Open HomeLoader Library in Game Page Mode", $contextmenu_VirtualDesktop)
		If IniRead($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "") = "true" Then
			GUICtrlSetState(- 1, $GUI_CHECKED)
		EndIf
		GUICtrlSetOnEvent(- 1, "_RM_Open_GamePage_with_HomeApp")
EndFunc

Func _RM_Selection_Contextmenu_Other()
	Global $contextmenu_Other = GUICtrlCreateContextMenu($StartUp_Radio_9)

	Global $RM_Other_Item1 = GUICtrlCreateMenuItem("Open HomeLoader Library in Game Page Mode", $contextmenu_Other)
		If IniRead($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "") = "true" Then
			GUICtrlSetState(- 1, $GUI_CHECKED)
		EndIf
		GUICtrlSetOnEvent(- 1, "_RM_Open_GamePage_with_HomeApp")
EndFunc

Func _RM_Selection_Contextmenu()
	$contextmenu = GUICtrlCreateContextMenu($AutoStart_Selection)
	$RM_AutoStart_Item1 = GUICtrlCreateMenuItem("ON", $contextmenu, -1, 1)
		If $Autostart_Apps = "true" Then GUICtrlSetState($RM_AutoStart_Item1, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item1")

	$RM_AutoStart_Item2 = GUICtrlCreateMenuItem("OFF", $contextmenu, -1, 1)
		If $Autostart_Apps = "false" Then GUICtrlSetState($RM_AutoStart_Item2, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item2")

	GUICtrlCreateMenuItem("", $contextmenu)

	If $Autostart_App_1_Name <> "" Then
		$RM_AutoStart_Item3 = GUICtrlCreateMenuItem($Autostart_App_1_Name, $contextmenu)
		If $Autostart_App_1_State = "true" Then GUICtrlSetState($RM_AutoStart_Item3, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item3")
	EndIf

	If $Autostart_App_2_Name <> "" Then
		$RM_AutoStart_Item4 = GUICtrlCreateMenuItem($Autostart_App_2_Name, $contextmenu)
		If $Autostart_App_2_State = "true" Then GUICtrlSetState($RM_AutoStart_Item4, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item4")
	EndIf

	If $Autostart_App_3_Name <> "" Then
		$RM_AutoStart_Item5 = GUICtrlCreateMenuItem($Autostart_App_3_Name, $contextmenu)
		If $Autostart_App_3_State = "true" Then GUICtrlSetState($RM_AutoStart_Item5, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item5")
	EndIf

	If $Autostart_App_4_Name <> "" Then
		$RM_AutoStart_Item6 = GUICtrlCreateMenuItem($Autostart_App_4_Name, $contextmenu)
		If $Autostart_App_4_State = "true" Then GUICtrlSetState($RM_AutoStart_Item6, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item6")
	EndIf

	If $Autostart_App_5_Name <> "" Then
		$RM_AutoStart_Item7 = GUICtrlCreateMenuItem($Autostart_App_5_Name, $contextmenu)
		If $Autostart_App_5_State = "true" Then GUICtrlSetState($RM_AutoStart_Item7, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item7")
	EndIf

	If $Autostart_App_6_Name <> "" Then
		$RM_AutoStart_Item8 = GUICtrlCreateMenuItem($Autostart_App_6_Name, $contextmenu)
		If $Autostart_App_6_State = "true" Then GUICtrlSetState($RM_AutoStart_Item8, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item8")
	EndIf

	If $Autostart_App_7_Name <> "" Then
		$RM_AutoStart_Item9 = GUICtrlCreateMenuItem($Autostart_App_7_Name, $contextmenu)
		If $Autostart_App_7_State = "true" Then GUICtrlSetState($RM_AutoStart_Item9, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item9")
	EndIf

	If $Autostart_App_8_Name <> "" Then
		$RM_AutoStart_Item10 = GUICtrlCreateMenuItem($Autostart_App_8_Name, $contextmenu)
		If $Autostart_App_8_State = "true" Then GUICtrlSetState($RM_AutoStart_Item10, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item10")
	EndIf

	If $Autostart_App_9_Name <> "" Then
		$RM_AutoStart_Item11 = GUICtrlCreateMenuItem($Autostart_App_9_Name, $contextmenu)
		If $Autostart_App_9_State = "true" Then GUICtrlSetState($RM_AutoStart_Item11, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item11")
	EndIf

	If $Autostart_App_10_Name <> "" Then
		$RM_AutoStart_Item12 = GUICtrlCreateMenuItem($Autostart_App_10_Name, $contextmenu)
		If $Autostart_App_10_State = "true" Then GUICtrlSetState($RM_AutoStart_Item12, $GUI_CHECKED)
		GUICtrlSetOnEvent(- 1, "_RM_AutoStart_Item12")
	EndIf

	If $Autostart_Apps <> "true" Then _RM_GUI_DISABLE_ALL()
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


Func _Settings_Set_States()
	If $HomeApp = "VR Toolbox" Then
		IniWrite($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "false")
	EndIf
	GUICtrlSetState($RM_VRToolBox_Item_2, $GUI_UNCHECKED)
	GUICtrlSetState($RM_VRToolBox_Item_2, $GUI_DISABLE)
EndFunc


#endregion

#Region Func MAIN
Func _StartUp_Button_HomeLoader()
	$State_StartUp_Radio_1 = GUICtrlRead($StartUp_Radio_1)
	$State_StartUp_Radio_2 = GUICtrlRead($StartUp_Radio_2)
	$State_StartUp_Radio_3 = GUICtrlRead($StartUp_Radio_3)
	$State_StartUp_Radio_4 = GUICtrlRead($StartUp_Radio_4)
	$State_StartUp_Radio_5 = GUICtrlRead($StartUp_Radio_5)
	$State_StartUp_Radio_6 = GUICtrlRead($StartUp_Radio_6)
	$State_StartUp_Radio_9 = GUICtrlRead($StartUp_Radio_9)

	If $State_StartUp_Radio_1 <> "4" Or $State_StartUp_Radio_2 <> "4" Or $State_StartUp_Radio_3 <> "4" Or $State_StartUp_Radio_4 <> "4" Or $State_StartUp_Radio_5 <> "4" Or $State_StartUp_Radio_6 <> "4" Or $State_StartUp_Radio_9 <> "4" Then
		GUICtrlSetState($Select_HomeApp_Label, $GUI_HIDE)
	EndIf
EndFunc

Func _ADD_2_SteamVR_Home_default()
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	Local $Install_DIR_StringReplace = StringReplace($Install_DIR, '\', '/')
	;Local $NewHomePath = StringTrimRight($Install_DIR_StringReplace, 1) & "/System/StartHomeLoader.exe"
	Local $NewHomePath = $Install_DIR_StringReplace & "HomeLoader.exe"
	;If Not FileExists($NewHomePath) Then $NewHomePath = StringTrimRight($Install_DIR_StringReplace, 1) & "/System/StartHomeLoader.au3"
	_FileReadToArray($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File)

	If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
	FileDelete($Steam_tools_vrmanifest_File)

    For $LOOP_vrmanifest = 1 To $Array_tools_vrmanifest_File[0]
		Local $ReadLine_tools_vrmanifest = $Array_tools_vrmanifest_File[$LOOP_vrmanifest]
		If $ReadLine_tools_vrmanifest = '			"app_key": "openvr.tool.steamvr_environments",' Then
			Local $Line_NR_binary_path_windows = $LOOP_vrmanifest + 3
			Local $Line_NR_arguments = $LOOP_vrmanifest + 6
		EndIf

		If $LOOP_vrmanifest = $Line_NR_binary_path_windows Then
			Local $NewLine = '			"binary_path_windows" : "' & $NewHomePath & '",'
			If $HomeApp = "Default SteamVR Home" Then $NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
			FileWriteLine($Steam_tools_vrmanifest_File, $NewLine)
		Else
			If $LOOP_vrmanifest = $Line_NR_arguments Then
				Local $NewLine_2 = '			"arguments": "StartHomeLoaderHomeApp",'
				If $HomeApp = "Default SteamVR Home" Then $NewLine_2 = '			"arguments": "-vr -retail -useappid SteamVRAppID -nowindow -vconport 29009",'
				FileWriteLine($Steam_tools_vrmanifest_File, $NewLine_2)
			Else
				FileWriteLine($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File[$LOOP_vrmanifest])
			EndIf
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
	Local $Install_DIR_replaced = StringReplace($Install_DIR, '\', '/')
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
	Local $Install_DIR_StringReplace = StringReplace($Install_DIR, '\', '/')
	Local $NewHomePath = StringTrimRight($Install_DIR_StringReplace, 1) & "/StartSteamVRHome.exe"
	_FileReadToArray($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File)

	FileDelete($Steam_tools_vrmanifest_File)

    For $LOOP_vrmanifest = 1 To $Array_tools_vrmanifest_File[0]
		Local $ReadLine_tools_vrmanifest = $Array_tools_vrmanifest_File[$LOOP_vrmanifest]
		If $ReadLine_tools_vrmanifest = '			"app_key": "openvr.tool.steamvr_environments",' Then
			Local $Line_NR_binary_path_windows = $LOOP_vrmanifest + 3
		EndIf

		If $LOOP_vrmanifest = $Line_NR_binary_path_windows Then
			Local $NewLine = '			"binary_path_windows" : "' & $NewHomePath & '",'
			If $WinName = "Default SteamVR Home" Then $NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
			FileWriteLine($Steam_tools_vrmanifest_File, $NewLine)
		Else
			FileWriteLine($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File[$LOOP_vrmanifest])
		EndIf
    Next

	GUICtrlSetState($StartUp_Radio_0, $GUI_CHECKED)
	;MsgBox($MB_OK + $MB_ICONINFORMATION, "SteamVR Files restored", "SteamVR Files sucessfully restored. You can now restart SteamVR or set a new Home App.")
EndFunc

Func _Refresh_GUICtrlSetState()
	Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	$State_Checkbox_Autostart_VRUB = IniRead($config_ini,"Settings", "Autostart_VRUB", "")
	Global $VRUB_HomeLoaderFile = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
	Local $State_Checkbox_Add_PlayersOnline_to_Icons = IniRead($config_ini,"Settings", "Add_PlayersOnline_to_Icons", "")
	Local $State_Checkbox_Add_SS_to_Icons = IniRead($config_ini,"Settings", "Add_SS_to_Icons", "")
	Local $State_Checkbox_Add_SS_per_game = IniRead($config_ini,"Settings", "Add_SS_per_game", "")

	If $HomeApp = "SteamVR Home" Then GUICtrlSetState($StartUp_Radio_0, $GUI_CHECKED)
	If $HomeApp = "Vive Home" Then GUICtrlSetState($StartUp_Radio_1, $GUI_CHECKED)
	If $HomeApp = "Viveport VR" Then GUICtrlSetState($StartUp_Radio_2, $GUI_CHECKED)
	If $HomeApp = "Janus VR" Then GUICtrlSetState($StartUp_Radio_3, $GUI_CHECKED)
	If $HomeApp = "VR Toolbox" Then GUICtrlSetState($StartUp_Radio_4, $GUI_CHECKED)
	If $HomeApp = "Other" And $Home_Path <> "" Then GUICtrlSetState($StartUp_Radio_9, $GUI_CHECKED)

	If $State_Checkbox_Autostart_VRUB = "True" Then GUICtrlSetState($Checkbox_Autostart_VRUB, $GUI_CHECKED)
	If Not FileExists($VRUB_HomeLoaderFile) Then GUICtrlSetState($Checkbox_Autostart_VRUB, $GUI_UNCHECKED)
	If Not FileExists($VRUB_HomeLoaderFile) Then GUICtrlSetState($Checkbox_Autostart_VRUB, $GUI_DISABLE)
EndFunc

#endregion

#Region Func Radio Selection
Func _StartUp_Radio_1() ; SteamVR Home
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "SteamVR Home")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $SteamVR_Path & "tools\steamvr_environments\game\bin\win64\steamtours.exe")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "SteamVR Home")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "250820")

	_ADD_2_SteamVR_Home_default()
	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
	GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
	MsgBox($MB_OK + $MB_ICONINFORMATION, "SteamVR Home", "'SteamVR Home' app was set as Home app.")
	_StartUp_Button_HomeLoader()
	_Sync_Config_INI()
	_Settings_Set_States()
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
		Local $FileSelect = FileOpenDialog("Select 'VIVEHome.exe' File", $Install_DIR, "Executable (*.exe)")
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	EndIf

	If FileExists($ViveHome_Path) Then
		IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
		_ADD_2_SteamVR_Home_default()
		$HomeAppGroup_Label = "Home app:"
		If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
		GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
		MsgBox($MB_OK + $MB_ICONINFORMATION, "SteamVR Home", "'Vive Home' app was set as Home app.")
		_StartUp_Button_HomeLoader()
	EndIf
	_Sync_Config_INI()
	_Settings_Set_States()
EndFunc

Func _StartUp_Radio_3() ; None
	$HomeApp = "None"
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "None")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "None")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")

	_ADD_2_SteamVR_Home_default()
	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
	GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
	MsgBox($MB_OK + $MB_ICONINFORMATION, "SteamVR Home App", "'None' app was set as Home app.")
	_StartUp_Button_HomeLoader()
	_Sync_Config_INI()
	_Settings_Set_States()
EndFunc

Func _StartUp_Radio_3_Backup() ; Janus VR Backup
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

	If $Create_JanusVR_Bookmark = "true" Then
		_RM_Create_Janus_VR_bookmarks()
	EndIf

	If $JanusVR_Autostart_HomeLoader_Room = "true" Then
		_RM_Autostart_HomeLoader_Room()
	EndIf

	_ADD_2_SteamVR_Home_default()
	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
	GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
	MsgBox($MB_OK + $MB_ICONINFORMATION, "SteamVR Home 'Janus VR' [3/3]", "'Janus VR' app was set as Home app.")
	_StartUp_Button_HomeLoader()
	_Sync_Config_INI()
	_Settings_Set_States()
EndFunc

Func _StartUp_Radio_4() ; VR Toolbox
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "VR Toolbox")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "488040")

	_ADD_2_SteamVR_Home_default()
	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
	GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
	MsgBox($MB_OK + $MB_ICONINFORMATION, "SteamVR Home", "'VR Toolbox' app was set as Home app.")
	_StartUp_Button_HomeLoader()
	_Sync_Config_INI()
	If $Add_HomeLoader_to_VRToolbox_StartPage = "true" Then
		_Start_HomeLoaderLibrary_UpdateStartPage()
	EndIf
	_Settings_Set_States()
	_Start_Create_HTML_GamePages_All()
EndFunc

Func _StartUp_Radio_5() ; Other
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Other")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
	_StartUp_Add_Other_GUI()
	_Sync_Config_INI()
	_Settings_Set_States()
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
		Local $FileSelect = FileOpenDialog("Select 'VPNextApp.exe' File", $Install_DIR, "Executable (*.exe)")
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Viveport VR")
	EndIf

	If FileExists($Viveport_Path) Then
		IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "")
		_ADD_2_SteamVR_Home_default()
		$HomeAppGroup_Label = "Home app:"
		If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
		GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
		MsgBox($MB_OK + $MB_ICONINFORMATION, "SteamVR Home", "'Viveport VR' app was set as Home app.")
		_StartUp_Button_HomeLoader()
	EndIf
	_Sync_Config_INI()
	_Settings_Set_States()
EndFunc

Func _StartUp_Radio_7() ; BIGSCREEN
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Bigscreen")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/457550")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Bigscreen Beta")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "457550")

	_ADD_2_SteamVR_Home_default()
	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
	GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
	_StartUp_Button_HomeLoader()
	_Sync_Config_INI()
	MsgBox($MB_OK + $MB_ICONINFORMATION, "SteamVR Home App", "'Bigscreen' app was set as Home app.")
	_Settings_Set_States()
EndFunc

Func _StartUp_Radio_8() ; Virtual Desktop
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Virtual Desktop")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/382110")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Virtual Desktop")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", "382110")

	_ADD_2_SteamVR_Home_default()
	$HomeAppGroup_Label = "Home app:"
	If $HomeApp <> "" Then $HomeAppGroup_Label = "Home app: " & "  [" & $HomeApp & "]"
	GUICtrlSetData($HomeAppGroup, $HomeAppGroup_Label)
	_StartUp_Button_HomeLoader()
	_Sync_Config_INI()
	MsgBox($MB_OK + $MB_ICONINFORMATION, "SteamVR Home App", "'Virtual Desktop' app was set as Home app.")
	_Settings_Set_States()
EndFunc
#endregion

#Region Func RM Selection
Func _RM_Selection_Button()
	MouseClick($MOUSE_CLICK_RIGHT)
EndFunc

Func _RM_AutoStart_Item1()
	Local $Autostart_Apps_old = IniRead($Config_INI, "Autostart", "Autostart", "")
	_RM_GUI_ENABLE_ALL()
	IniWrite($Config_INI, "Autostart", "Autostart", "true")
	If $Autostart_Apps_old <> "true" Then
		$Autostart_App_10_State = IniRead($Config_INI, "Autostart", "App_10_State", "")
		If $Autostart_App_10_State = "true" Then $Autostart_App_10_State_New = "true"
		If $Autostart_App_10_State <> "true" Then $Autostart_App_10_State_New = ""
		_Write_vrappconfig_File()
	EndIf
EndFunc

Func _RM_AutoStart_Item2()
	Local $Autostart_Apps_old = IniRead($Config_INI, "Autostart", "Autostart", "")
	IniWrite($Config_INI, "Autostart", "Autostart", "false")
	If $Autostart_Apps_old = "true" Then _Write_vrappconfig_File()
	_RM_GUI_DISABLE_ALL()
EndFunc

Func _RM_AutoStart_Item3()
	Local $Value = IniRead($Config_INI, "Autostart", "App_1_State", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Autostart", "App_1_State", "false")
		GUICtrlSetState($RM_AutoStart_Item3, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Autostart", "App_1_State", "true")
		GUICtrlSetState($RM_AutoStart_Item3, $GUI_CHECKED)
	EndIf
EndFunc

Func _RM_AutoStart_Item4()
	Local $Value = IniRead($Config_INI, "Autostart", "App_2_State", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Autostart", "App_2_State", "false")
		GUICtrlSetState($RM_AutoStart_Item4, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Autostart", "App_2_State", "true")
		GUICtrlSetState($RM_AutoStart_Item4, $GUI_CHECKED)
	EndIf
EndFunc

Func _RM_AutoStart_Item5()
	Local $Value = IniRead($Config_INI, "Autostart", "App_3_State", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Autostart", "App_3_State", "false")
		GUICtrlSetState($RM_AutoStart_Item5, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Autostart", "App_3_State", "true")
		GUICtrlSetState($RM_AutoStart_Item5, $GUI_CHECKED)
	EndIf
EndFunc

Func _RM_AutoStart_Item6()
	Local $Value = IniRead($Config_INI, "Autostart", "App_4_State", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Autostart", "App_4_State", "false")
		GUICtrlSetState($RM_AutoStart_Item6, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Autostart", "App_4_State", "true")
		GUICtrlSetState($RM_AutoStart_Item6, $GUI_CHECKED)
	EndIf
EndFunc

Func _RM_AutoStart_Item7()
	Local $Value = IniRead($Config_INI, "Autostart", "App_5_State", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Autostart", "App_5_State", "false")
		GUICtrlSetState($RM_AutoStart_Item7, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Autostart", "App_5_State", "true")
		GUICtrlSetState($RM_AutoStart_Item7, $GUI_CHECKED)
	EndIf
EndFunc

Func _RM_AutoStart_Item8()
	Local $Value = IniRead($Config_INI, "Autostart", "App_6_State", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Autostart", "App_6_State", "false")
		GUICtrlSetState($RM_AutoStart_Item8, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Autostart", "App_6_State", "true")
		GUICtrlSetState($RM_AutoStart_Item8, $GUI_CHECKED)
	EndIf
EndFunc

Func _RM_AutoStart_Item9()
	Local $Value = IniRead($Config_INI, "Autostart", "App_7_State", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Autostart", "App_7_State", "false")
		GUICtrlSetState($RM_AutoStart_Item8, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Autostart", "App_7_State", "true")
		GUICtrlSetState($RM_AutoStart_Item9, $GUI_CHECKED)
	EndIf
EndFunc

Func _RM_AutoStart_Item10()
	Local $Value = IniRead($Config_INI, "Autostart", "App_8_State", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Autostart", "App_8_State", "false")
		GUICtrlSetState($RM_AutoStart_Item10, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Autostart", "App_8_State", "true")
		GUICtrlSetState($RM_AutoStart_Item10, $GUI_CHECKED)
	EndIf
EndFunc

Func _RM_AutoStart_Item11()
	Local $Value = IniRead($Config_INI, "Autostart", "App_9_State", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Autostart", "App_9_State", "false")
		GUICtrlSetState($RM_AutoStart_Item11, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Autostart", "App_9_State", "true")
		GUICtrlSetState($RM_AutoStart_Item11, $GUI_CHECKED)
	EndIf
EndFunc

Func _RM_AutoStart_Item12()
	_Write_vrappconfig_File()
	_Check_vrappconfig_File()
EndFunc

Func _RM_GUI_ENABLE_ALL()
	If $Autostart_App_1_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item3, $GUI_ENABLE)
	If $Autostart_App_2_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item4, $GUI_ENABLE)
	If $Autostart_App_3_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item5, $GUI_ENABLE)
	If $Autostart_App_4_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item6, $GUI_ENABLE)
	If $Autostart_App_5_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item7, $GUI_ENABLE)
	If $Autostart_App_6_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item8, $GUI_ENABLE)
	If $Autostart_App_7_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item9, $GUI_ENABLE)
	If $Autostart_App_8_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item10, $GUI_ENABLE)
	If $Autostart_App_9_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item11, $GUI_ENABLE)
	If $Autostart_App_10_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item12, $GUI_ENABLE)
EndFunc

Func _RM_GUI_DISABLE_ALL()
	If $Autostart_App_1_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item3, $GUI_DISABLE)
	If $Autostart_App_2_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item4, $GUI_DISABLE)
	If $Autostart_App_3_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item5, $GUI_DISABLE)
	If $Autostart_App_4_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item6, $GUI_DISABLE)
	If $Autostart_App_5_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item7, $GUI_DISABLE)
	If $Autostart_App_6_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item8, $GUI_DISABLE)
	If $Autostart_App_7_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item9, $GUI_DISABLE)
	If $Autostart_App_8_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item10, $GUI_DISABLE)
	If $Autostart_App_9_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item11, $GUI_DISABLE)
	If $Autostart_App_10_Name <> "" Then GUICtrlSetState($RM_AutoStart_Item12, $GUI_DISABLE)
EndFunc

Func _RM_VRToolBox_Item_1_1()
	Local $Value = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "Settings", "UseVideoPages", "")
	IniWrite($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "Settings", "UseVideoPages", "true")
	_Start_HomeLoaderLibrary_UpdateStartPage()
EndFunc

Func _RM_VRToolBox_Item_1_2()
	Local $Value = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "Settings", "UseVideoPages", "")
	IniWrite($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "Settings", "UseVideoPages", "false")
	_Start_HomeLoaderLibrary_UpdateStartPage()
EndFunc

Func _RM_VRToolBox_Item_1_3_1()
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"
	Local $Video_ID_Temp = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_1", "")
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWriteLine($VideoPage_path, '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID_Temp & '">')
EndFunc

Func _RM_VRToolBox_Item_1_3_2()
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"
	Local $Video_ID_Temp = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_2", "")
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWriteLine($VideoPage_path, '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID_Temp & '">')
EndFunc

Func _RM_VRToolBox_Item_1_3_3()
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"
	Local $Video_ID_Temp = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_3", "")
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWriteLine($VideoPage_path, '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID_Temp & '">')
EndFunc

Func _RM_VRToolBox_Item_1_3_4()
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"
	Local $Video_ID_Temp = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_4", "")
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWriteLine($VideoPage_path, '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID_Temp & '">')
EndFunc

Func _RM_VRToolBox_Item_1_3_5()
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"
	Local $Video_ID_Temp = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_5", "")
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWriteLine($VideoPage_path, '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID_Temp & '">')
EndFunc

Func _RM_VRToolBox_Item_1_3_6()
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"
	Local $Video_ID_Temp = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_6", "")
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWriteLine($VideoPage_path, '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID_Temp & '">')
EndFunc

Func _RM_VRToolBox_Item_1_3_7()
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"
	Local $Video_ID_Temp = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_7", "")
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWriteLine($VideoPage_path, '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID_Temp & '">')
EndFunc

Func _RM_VRToolBox_Item_1_3_8()
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"
	Local $Video_ID_Temp = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_8", "")
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWriteLine($VideoPage_path, '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID_Temp & '">')
EndFunc

Func _RM_VRToolBox_Item_1_3_9()
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"
	Local $Video_ID_Temp = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_9", "")
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWriteLine($VideoPage_path, '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID_Temp & '">')
EndFunc

Func _RM_VRToolBox_Item_1_3_10()
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"
	Local $Video_ID_Temp = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "VIDEOID", "VIDEOID_10", "")
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWriteLine($VideoPage_path, '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID_Temp & '">')
EndFunc

Func _RM_VRToolBox_Item_1_4()
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWrite($VideoPage_path, '')
EndFunc

Func _RM_Open_GamePage_with_HomeApp()
	Local $Value = IniRead($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "false")
		GUICtrlSetState($RM_SteamVR_Item1, $GUI_UNCHECKED)
		GUICtrlSetState($RM_ViveHome_Item1, $GUI_UNCHECKED)
		GUICtrlSetState($RM_ViveportVR_Item1, $GUI_UNCHECKED)
		GUICtrlSetState($RM_JanusVR_Item3, $GUI_UNCHECKED)
		GUICtrlSetState($RM_VRToolBox_Item_2, $GUI_UNCHECKED)
		GUICtrlSetState($RM_Bigscreen_Item1, $GUI_UNCHECKED)
		GUICtrlSetState($RM_VirtualDesktop_Item1, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Settings", "Open_HTML_GamePage_OnStart", "true")
		GUICtrlSetState($RM_SteamVR_Item1, $GUI_CHECKED)
		GUICtrlSetState($RM_ViveHome_Item1, $GUI_CHECKED)
		GUICtrlSetState($RM_ViveportVR_Item1, $GUI_CHECKED)
		GUICtrlSetState($RM_JanusVR_Item3, $GUI_CHECKED)
		GUICtrlSetState($RM_VRToolBox_Item_2, $GUI_CHECKED)
		GUICtrlSetState($RM_Bigscreen_Item1, $GUI_CHECKED)
		GUICtrlSetState($RM_VirtualDesktop_Item1, $GUI_CHECKED)
	EndIf
EndFunc

Func _RM_Add_HomeLoader_to_VRToolbox_StartPage()
	Local $Value = IniRead($Config_INI, "Settings", "Add_HomeLoader_to_VRToolbox_StartPage", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Settings", "Add_HomeLoader_to_VRToolbox_StartPage", "false")
		GUICtrlSetState($RM_VRToolBox_Item_3, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Settings", "Add_HomeLoader_to_VRToolbox_StartPage", "true")
		GUICtrlSetState($RM_VRToolBox_Item_3, $GUI_CHECKED)
		_Start_HomeLoaderLibrary_UpdateStartPage()
	EndIf
EndFunc


Func _RM_Add_Link_to_HL_StartPage_GUI()

	Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Add an new Link to the VRToolbox 'HomeLoader Start Page'", "Do you want to add an new Link to the VRToolbox 'HomeLoader Start Page'?" & @CRLF & @CRLF & _
															"Instructions: " & @CRLF & _
															"1. Select the File and confirm the 'File Path prompt'" & @CRLF & _
															"2. Enter the Name using the Input Box that appears" & @CRLF & _
															"3. Choose an Icon for the new Link [empty = default Icon]")


	If $Abfrage = 6 Then
		Local $HL_StartPage_Install_Dir_Replace = "file:///" & StringReplace($Install_DIR, '\', '/')

		For $Loop_Temp = 1 To 1
			Local $File_Temp = FileOpenDialog("Choose File", $Install_DIR, "Executable (*)", $FD_FILEMUSTEXIST)
			If @error = 1 Or @error = 5 Then
				MsgBox(0, "No File selected", "No File selected", 3)
				ExitLoop
			EndIf
			Local $File_Path_Replace = "file:///" & StringReplace($File_Temp, '\', '/')

			Local $InputBox_Name = InputBox("Enter Name", "Enter the Name of the Link you want to add.", "", "", -1, 160)
			If @error = 1 Or @error = 5 Then
				$InputBox_Name = ""
			EndIf

			Local $Icon_Temp = FileOpenDialog("Choose Icon", $Install_DIR, "Executable (*)", $FD_FILEMUSTEXIST)
			If @error = 1 Or @error = 5 Then
				$Icon_Temp = $install_dir & "Apps\VRToolBox\HomeLoader\Images\Template_1.png"
			EndIf
			Local $Icon_Path_Replace = StringReplace($Icon_Temp, '\', '/')
			$Icon_Path_Replace = "file:///" & $Icon_Path_Replace

			Local $New_HLSP_Link = '    <div class="tooltip"><a href="' & $File_Path_Replace & '"><img class="icon" src="' & $Icon_Path_Replace & '" width="200" /><span class="tooltiptext">' & $InputBox_Name & '</span></a></div>'
		Next

		Local $VRToolbox_HomeLoader_StartPage_Array = ""
		_FileReadToArray($VRToolbox_HomeLoader_StartPage, $VRToolbox_HomeLoader_StartPage_Array)

		;MsgBox(0, "", $VRToolbox_HomeLoader_StartPage_Array[0] & @CRLF & $VRToolbox_HomeLoader_StartPage_Array[0] - 3)

		If FileExists($VRToolbox_HomeLoader_StartPage) Then FileDelete($VRToolbox_HomeLoader_StartPage)

		For $Loop_Temp = 1 To $VRToolbox_HomeLoader_StartPage_Array[0] - 2
			FileWriteLine($VRToolbox_HomeLoader_StartPage, $VRToolbox_HomeLoader_StartPage_Array[$Loop_Temp])
		Next

		FileWriteLine($VRToolbox_HomeLoader_StartPage, $New_HLSP_Link)
		FileWriteLine($VRToolbox_HomeLoader_StartPage, '</body>')
		FileWriteLine($VRToolbox_HomeLoader_StartPage, '</html>')

		MsgBox(0, "New Link added", "Name: " & $InputBox_Name & @CRLF & "File: " & $File_Temp & @CRLF & "Icon: " & $Icon_Temp)
	EndIf

EndFunc   ;==>_Create_VRToolBox_HL_StartPage


Func _RM_Add_Link_to_HL_StartPage()

	MsgBox(0, "_RM_Add_Link_to_HL_StartPage", "_RM_Add_Link_to_HL_StartPage")



EndFunc

Func _RM_JanusVR_CheckBox_1()
	Local $Value = IniRead($Config_INI, "Settings", "Create_JanusVR_Bookmark", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Settings", "Create_JanusVR_Bookmark", "false")
		;GUICtrlSetState($RM_JanusVR_Item1, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Settings", "Create_JanusVR_Bookmark", "true")
		;GUICtrlSetState($RM_JanusVR_Item1, $GUI_CHECKED)

		Local $Abfrage_1 = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Janus VR bookmarks [1/3]", "Do you also want to add the default Home Loader Room" & @CRLF & _
																	"to the JanusVR bookmark page?" & @CRLF & _
																	$bookmarks_json & @CRLF & @CRLF & _
																	"JanusVR Settings can be found in the following folder:" & @CRLF & _
																	$JanusVR_Settings_Folder & @CRLF)

		If $Abfrage_1 = 6 Then
			_RM_Create_Janus_VR_bookmarks()
		EndIf
	EndIf
EndFunc

Func _RM_JanusVR_CheckBox_2()
	Local $Value = IniRead($Config_INI, "Settings", "JanusVR_Autostart_HomeLoader_Room", "false")
	If $Value = "true" Then
		IniWrite($Config_INI, "Settings", "JanusVR_Autostart_HomeLoader_Room", "false")
		;GUICtrlSetState($RM_JanusVR_Item2, $GUI_UNCHECKED)
	Else
		IniWrite($Config_INI, "Settings", "JanusVR_Autostart_HomeLoader_Room", "true")
		;GUICtrlSetState($RM_JanusVR_Item2, $GUI_CHECKED)

		Local $Abfrage_2 = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Home Loader Room autostart [2/3]", "Do you also want to autostart the default Home Loader Room" & @CRLF & _
																	"after launching JanusVR?" & @CRLF & _
																	$settings_json & @CRLF & @CRLF & _
																	"JanusVR Settings can be found in the following folder:" & @CRLF & _
																	$JanusVR_Settings_Folder & @CRLF & @CRLF & @CRLF & _
																	"Bei Verwendung der SteamVR Version muss der Pfad" & @CRLF & _
																	"in den Steam Startoptionen eingetragen werden." & @CRLF & _
																	"'file:///" & $Install_DIR_StringReplace_path & "WebPage/janusvr/index.html'" & @CRLF)

		If $Abfrage_2 = 6 Then
			_RM_Autostart_HomeLoader_Room()
		EndIf
	EndIf
EndFunc



Func _RM_Create_Janus_VR_bookmarks()
	Global $JanusVR_Settings_Folder = "c:\Users\" & @UserName & "\Documents\janusvr\"
	Global $bookmarks_json = "c:\Users\" & @UserName & "\Documents\janusvr\appdata\bookmarks.json"
	Global $settings_json = "c:\Users\" & @UserName & "\Documents\janusvr\appdata\settings.json"

	Global $Install_DIR_StringReplace_path = StringReplace($Install_DIR, '\', '/')

	_Create_JanusVR_Page()
	Local $Source_copy = $gfx & "VRGameLauncher.png"
	Local $Target_copy = StringReplace($JanusVR_Path, 'janusvr.exe', 'assets\3dui\thumbs\VRGameLauncher.png')
	Local $thumbnail_path = StringReplace($Target_copy, '\', '/')
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
EndFunc

Func _RM_Autostart_HomeLoader_Room()
	Global $JanusVR_Settings_Folder = "c:\Users\" & @UserName & "\Documents\janusvr\"
	Global $bookmarks_json = "c:\Users\" & @UserName & "\Documents\janusvr\appdata\bookmarks.json"
	Global $settings_json = "c:\Users\" & @UserName & "\Documents\janusvr\appdata\settings.json"

	Global $Install_DIR_StringReplace_path = StringReplace($Install_DIR, '\', '/')

	_FileReadToArray($settings_json, $settingsArray)

	FileCopy($settings_json, $settings_json & ".bak", $FC_OVERWRITE)
	FileDelete($settings_json)

	For $Loop = 1 To $settingsArray[0]
		If $Loop = 20 Then FileWriteLine($settings_json, '    "launchurl": "file:///' & $Install_DIR_StringReplace_path & 'WebPage/janusvr/index.html",')

		If $Loop <> 20 Then
			FileWriteLine($settings_json, $settingsArray[$Loop])
		EndIf
	Next
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
	Local $DROPDOWN = GUICtrlRead($DROPDOWN_Other_GUI)

	Local $StringSplit = StringSplit($DROPDOWN, '[')
	Local $SteamStartGameName = StringTrimRight(StringReplace($StringSplit[1], ']', ''), 1)
	Local $SteamStartURL = "steam://rungameid/" & StringReplace($StringSplit[2], ']', '')
	Local $SteamStartID = StringReplace($StringSplit[2], ']', '')

	If $SteamStartGameName = "Bigscreen Beta" Then $SteamStartGameName = "Bigscreen"

	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", $SteamStartGameName)
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $SteamStartURL)
	IniWrite($config_ini, "Settings_HomeAPP", "HomeAppSteamID", $SteamStartID)
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
	Local $FileSelect = FileOpenDialog("Select the app you want to start.", @ScriptDir & "\", "Executable (*.exe;*.au3; ...)", $FD_FILEMUSTEXIST)

	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
	IniWrite($config_ini, "Settings_HomeAPP", "HomeAppSteamID", "")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "")

	_ADD_2_SteamVR_Home_default()

	_StartUp_Button_HomeLoader()
	MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "'" & $FileSelect & "'" & " app was set as Home app.")
	GUIDelete($Add_Other_GUI)
EndFunc

Func _Button_Exit_Add_Other_GUI()
	GUIDelete($Add_Other_GUI)
EndFunc

#endregion

#Region Func Checkbox
Func _Checkbox_Autostart_VRUB()
	Local $State_Checkbox = GUICtrlRead($Checkbox_Autostart_VRUB)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Autostart_VRUB", "true")
		_Func_AutoStart_1_Hide()
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Autostart_VRUB", "false")
		IniWrite($config_ini, "Settings", "Add_SS_per_game", "false")
		_Func_AutoStart_1_Show()
		_Sync_Config_INI()
		_Refresh_GUICtrlSetState()
	EndIf
	_Sync_Config_INI()
EndFunc

Func _Button_Restore_SteamVR_Settings()
	Local $Abfrage = MsgBox($MB_ICONWARNING + $MB_YESNO, "Attention!", "This function will restore the SteamVR Settings using Backups that were created on the first start of HomeLoader."  & @CRLF & @CRLF & _
																							"The following Settings/Files are restored:" & @CRLF & _
																							"- tools.manifest [SteamVR Home App]" & @CRLF & _
																							"- steamvr.vrsettings [Resolution Scale]" & @CRLF & _
																							"- default.vrsettings [SteamVR Settings]" & @CRLF & _
																							"- steamapps.vrmanifest [Resolution Scale]" & @CRLF & @CRLF & _
																							"Do you want to continue?")

	If $Abfrage = 6 Then
		_Restore_Default_SteamVR_Home()
		FileDelete($default_vrsettings_File)
		FileDelete($Steam_tools_vrmanifest_File)
		FileDelete($Steamvr_vrsettings_FilePath)
		FileDelete($Steamapps_vrmanifest_FilePath)
		Sleep(500)
		FileCopy($default_vrsettings_File & ".bak", $default_vrsettings_File, $FC_OVERWRITE)
		FileCopy($Steam_tools_vrmanifest_File & ".bak", $Steam_tools_vrmanifest_File, $FC_OVERWRITE)
		FileCopy($Steamvr_vrsettings_FilePath & ".bak", $Steamvr_vrsettings_FilePath, $FC_OVERWRITE)
		FileCopy($Steamapps_vrmanifest_FilePath & ".bak", $Steamapps_vrmanifest_FilePath, $FC_OVERWRITE)

		If FileExists($default_vrsettings_File) And FileExists($Steam_tools_vrmanifest_File) And FileExists($Steamvr_vrsettings_FilePath) And FileExists($Steamapps_vrmanifest_FilePath) Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "SteamVR Files restored", "SteamVR Files sucessfully restored.")
		Else
			MsgBox($MB_ICONERROR, "Error", "Something went wrong, Backup Files not restored." & @CRLF & @CRLF & _
											"To restore the Files manually use the Backups that are located in '...\HomeLoader\Backups\' folder." & @CRLF & @CRLF & _
											"Copy these files into the corresponding Steam folders.")
		EndIf
	EndIf
	_Sync_Config_INI()
EndFunc

Func _Func_AutoStart_1_Hide()
	GUICtrlSetState($StartUp_Radio_0, $GUI_UNCHECKED)
	GUICtrlSetState($StartUp_Radio_0, $GUI_DISABLE)
	GUICtrlSetState($StartUp_Radio_1, $GUI_UNCHECKED)
	GUICtrlSetState($StartUp_Radio_1, $GUI_DISABLE)
	GUICtrlSetState($StartUp_Radio_2, $GUI_UNCHECKED)
	GUICtrlSetState($StartUp_Radio_2, $GUI_DISABLE)
	GUICtrlSetState($StartUp_Radio_3, $GUI_UNCHECKED)
	GUICtrlSetState($StartUp_Radio_3, $GUI_DISABLE)
	GUICtrlSetState($StartUp_Radio_4, $GUI_UNCHECKED)
	GUICtrlSetState($StartUp_Radio_4, $GUI_DISABLE)
	GUICtrlSetState($StartUp_Radio_5, $GUI_UNCHECKED)
	GUICtrlSetState($StartUp_Radio_5, $GUI_DISABLE)
	GUICtrlSetState($StartUp_Radio_6, $GUI_UNCHECKED)
	GUICtrlSetState($StartUp_Radio_6, $GUI_DISABLE)
	GUICtrlSetState($StartUp_Radio_9, $GUI_UNCHECKED)
	GUICtrlSetState($StartUp_Radio_9, $GUI_DISABLE)
	GUICtrlSetState($AutoStart_Selection, $GUI_UNCHECKED)
	GUICtrlSetState($AutoStart_Selection, $GUI_DISABLE)
EndFunc

Func _Func_AutoStart_1_Show()
	GUICtrlSetState($StartUp_Radio_0, $GUI_ENABLE)
	GUICtrlSetState($StartUp_Radio_1, $GUI_ENABLE)
	GUICtrlSetState($StartUp_Radio_2, $GUI_ENABLE)
	GUICtrlSetState($StartUp_Radio_3, $GUI_ENABLE)
	GUICtrlSetState($StartUp_Radio_4, $GUI_ENABLE)
	GUICtrlSetState($StartUp_Radio_5, $GUI_ENABLE)
	GUICtrlSetState($StartUp_Radio_6, $GUI_ENABLE)
	GUICtrlSetState($StartUp_Radio_9, $GUI_ENABLE)
	GUICtrlSetState($AutoStart_Selection, $GUI_ENABLE)
EndFunc
#endregion

#Region Func Restart / Exit / Reload
Func _Button_Start_HomeLoaderLibrary()
	If Not WinExists("HomeLoader - Library") Then _Create_HLL_GUI()
	GUIDelete($GUI_StartUp_settings)
EndFunc

Func _Sync_Config_INI()
	FileCopy($Config_INI, $System_DIR & "config.ini", $FC_OVERWRITE)
EndFunc

Func _Start_HomeLoaderLibrary_UpdateStartPage()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start creating VRToolBox StartPage:")
	_Create_VRToolBox_StartPage()
	_Create_VRToolBox_HL_StartPage()
	_Create_VRToolBox_VideoPage()
	_Copy_2_VRToolBox()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating VRToolBox StartPage:")
EndFunc

Func _Settings_Restart()
	GUIDelete($GUI_StartUp_settings)
	_Settings_GUI()
EndFunc

Func _Settings_Exit()
	_Sync_Config_INI()
	GUIDelete($GUI_StartUp_settings)
	;Exit
EndFunc

Func _Start_Create_HTML_GamePages_All()
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "Create_HTML_GamePages_All")
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "Create_HTML_GamePages_All")
	EndIf
EndFunc

#endregion

