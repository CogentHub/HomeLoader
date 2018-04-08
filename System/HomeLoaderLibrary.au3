
#Region Includes
#include <GuiButton.au3>
#include <FontConstants.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <File.au3>
#include <GuiMenu.au3>
#include <GuiStatusBar.au3>
#include <GUIConstants.au3>
#include <GDIPlus.au3>
#include <Inet.au3>
#include <Array.au3>
#include <String.au3>
#include "_GDIPlus_WTOB.au3"
#endregion


Opt("GUIOnEventMode", 1)

#Region Set Global
Global $GUI_Loading, $AddGame2Library_GUI, $Settings_GUI, $Button_Exit_Settings_GUI, $HTML_GUI, $NR_Applications
Global $appid, $name, $installdir, $NR_temp1, $NR_temp2, $NR_temp3, $NR_Library, $NR_Library_temp
Global $listview, $listview_2, $listview_3, $listview_4, $listview_5, $listview_6, $iStylesEx, $CheckBox_Restart, $Icon_Preview, $ApplicationList_TEMP
Global $ListView_ImageList_Temp, $SS_Settings_GUI, $VRSettings_Group
Global $TAB_NR, $listview_7, $listview_8, $listview_9, $listview_10, $listview_11, $listview_TEMP
Global $contextmenu, $RM_Item0, $RM_Item1, $RM_Item2, $RM_Item3, $RM_Item4, $RM_Item5, $RM_Item5_1, $RM_Item5_2
Global $RM_Item6, $RM_Item7,$RM_Item8,$RM_Item9, $RM_Item10, $RM_Item11, $RM_Item12
Global $RM_Item_RS_0, $RM_Item_RS_1, $RM_Item_RS_2, $RM_Item_RS_3, $RM_Item_RS_4, $RM_Item_RS_5, $RM_Item_RS_6, $RM_Item_RS_7, $RM_Item_RS_8
Global $RM_Item_RS_9, $RM_Item_RS_10, $RM_Item_RS_11, $RM_Item_RS_12, $RM_Item_RS_13, $RM_Item_RS_14
Global $GUI, $UpdateOverlay_SettingValue, $ScanLibrary_OnStart_SettingValue, $LOOP_NR_TEMP, $SteamAppID_TEMP, $NR_LOOP_TO_TEMP
Global $Key_Name_TEMP, $ReadLine_SteamAppCheck, $ResolutionScale_Group, $ReadLine, $Steam_app_Name_TEMP, $ResolutionScale_TEMP
Global $Game_ID, $hImage1, $hImage2, $hBMPBuff, $hImage1_Path, $hImage2_Path, $hGraphic, $hPen
Global $Steamvr_vrsettings_Array, $Steamvr_vrsettings_aArray, $Loop_End_1
Global $font = "arial"
Global $font_arial = "arial"
#endregion

#Region Declare Variables/Const 1
Global $Version = "0.70"
Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $SteamVR_VRSettings_INI = _PathFull("HomeLoader\SteamVR_VRSettings.ini", @AppDataDir)
;If Not FileExists($SteamVR_VRSettings_INI) Then FileCopy(@ScriptDir & "\SteamVR_VRSettings.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $System_DIR = $Install_DIR & "\System\"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $ApplicationList_INI = $Install_DIR & "ApplicationList.ini"
Global $GamePage_path = $Install_DIR & "WebPage\StartPage.html"
Global $Steam_Library = IniRead($Config_INI, "Settings", "Steam_Library", "")
Global $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
Global $Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "")
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")
Global $Use_Local_Icons = IniRead($Config_INI, "Settings", "Use_Local_Icons", "")
Global $DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
Global $ScanVIVEApps = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
Global $Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "false")
Global $Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "false")
Global $Add_SS_per_game = IniRead($config_ini,"Settings", "Add_SS_per_game", "")

Global $gfx = $Install_DIR & "System\gfx\"
Global $Icons = $Install_DIR & "Icons\"

Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")

Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
Global $Steam_Path = StringReplace($Steam_Path_REG, '/', '\') & "\"
Global $SteamVR_Path = $Steam_Path & "SteamApps\common\SteamVR\"
Global $libraryfolders_vdf = $Steam_Path & "steamapps\libraryfolders.vdf"

Global $Steam_AppConfig_Json = $Steam_Path & "config\appconfig.json"

Global $HomeLoader_Overlay_Folder = $Steam_Path & "steamapps\common\VRUtilityBelt\addons\custom\HomeLoader\overlays\HomeLoader\"

Global $VRToolBox_Steam_Folder = $Steam_Path & "steamapps\common\VRToolbox\"

Global $HTCVive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\HTC\HTC Vive\', "ViveHelperPath")
Global $HTCVive_Path_StringReplace_1 = StringReplace($HTCVive_Path_REG, 'PCClient\ViveportDesktopHelper.exe', '')
Global $HTCVive_Path = StringReplace($HTCVive_Path_StringReplace_1, '/', '\')

Global $Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
Global $Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
Global $Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
Global $Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
Global $Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

Global $Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
Global $Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
Global $Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")
Global $Icon_Folder_4 = IniRead($Config_INI, "Folders", "Icon_Folder_4", "")
Global $Icon_Folder_5 = IniRead($Config_INI, "Folders", "Icon_Folder_5", "")

Global $default_vrsettings_File = IniRead($Config_INI, "Folders", "Steam_default_vrsettings", "")
Global $default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
Global $default_vrsettings_File_new = $default_vrsettings_File & ".new"

Global $Steam_tools_vrmanifest_File = IniRead($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
Global $Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"

Global $Steamvr_vrsettings_FilePath = $Steam_Path & "config\steamvr.vrsettings"
If Not FileExists($Steamvr_vrsettings_FilePath & ".bak") Then FileCopy($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_FilePath & ".bak", $FC_CREATEPATH + $FC_OVERWRITE)

Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
Global $ApplicationList_Non_Steam_Appl_INI = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
Global $ApplicationList_Custom_1_INI = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
Global $ApplicationList_Custom_2_INI = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
Global $ApplicationList_Custom_3_INI = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
Global $ApplicationList_Custom_4_INI = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

Global $UpdateOverlay_SettingValue = IniRead($Config_INI, "Settings", "UpdateOverlay", "")
Global $ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")

Global $stats_log_FILE = $System_DIR & "Logs\stats_log.txt"

IniWrite($config_ini, "Settings", "Version", $Version)
#endregion

#region First Start and Update performed Check
_First_Start_Empty_Check_1()

If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK, $FC_OVERWRITE)
If $default_vrsettings_File = "" Then MsgBox($MB_ICONWARNING, "Attention!", "Default.vrsettings File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")

If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK, $FC_OVERWRITE)
If $Steam_tools_vrmanifest_File = ""  Then MsgBox($MB_ICONWARNING, "Attention!", "Tools.vrmanifest File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")


If $First_Start = "true" Then
	MsgBox($MB_ICONWARNING, "Welcome to Home Loader, by CogentRifter", 'The first time that you use Home Loader, it will create Backups for your' & @CRLF & _
								'"default.vrsettings" and "tools.manifest" files.' & @CRLF & _
								"You can find them at '" & $Install_DIR & "Backups\" & "'" & @CRLF & @CRLF & _
								'When you tell it to, Home Loader will scan your default Steam directory' & @CRLF & _
								'for games. Click the "Settings" icon in the lower right to add additional Steam Library folders.' & @CRLF & _
								'If you changed the default installation path for Steam, you can change it in "Settings" as well.')



	If Not FileExists($Install_DIR & "Backups\default.vrsettings") Then FileCopy($default_vrsettings_File, $Install_DIR & "Backups\default.vrsettings", $FC_OVERWRITE)
	If Not FileExists($Install_DIR & "Backups\tools.vrmanifest") Then FileCopy($Steam_tools_vrmanifest_File, $Install_DIR & "Backups\tools.vrmanifest", $FC_OVERWRITE)

	_Settings_GUI()
	;_Detect_SteamVR_Files()
EndIf
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
If $TAB3_Label = "" Then $TAB3_Label = "Custom 1"
If $TAB4_Label = "" Then $TAB4_Label = "Custom 2"
If $TAB5_Label = "" Then $TAB5_Label = "Custom 3"
If $TAB6_Label = "" Then $TAB6_Label = "Custom 4"
#endregion

#region Start Check
If $Autostart_VRUB = "true" Then
	Local $Parameter_1 = ""
	If $CmdLine[0] Then
		$Parameter_1 = $CmdLine[1]
	EndIf

	If $Parameter_1 = "UpdateOverlay" Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Updating Overlay:")
		;_Sync_Icons()
		$UpdateOverlay_SettingValue = IniRead($Config_INI, "Settings", "UpdateOverlay", "")
		$ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
		_Exit_Check()
		If $ScanLibrary_OnStart_SettingValue = "true" Then _Overlay_ReScan_Steam_Library()
		_Exit_Check()
		If $HomeApp = "VR Toolbox" Then _Create_VRToolBox_StartPage()
		_Exit_Check()
		If $HomeApp = "VR Toolbox" Then _Copy_2_VRToolBox()
		_Exit_Check()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End Updating the Overlay:")
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start creating Game Pages:")
		_Create_GamePages()
		_Exit_Check()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating Game Pages:")
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start creating Single Game Pages:")
		_Create_SinglePages()
		_Exit_Check()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating Single Game Pages:")
		Exit
	EndIf

	If $Parameter_1 = "UpdateStartPage" Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start creating VRToolBox StartPage:")
		_Create_VRToolBox_StartPage()
		_Exit_Check()
		_Copy_2_VRToolBox()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating VRToolBox StartPage:")
		Exit
	EndIf
Else
	Local $Parameter_1 = ""
	If $CmdLine[0] Then
		$Parameter_1 = $CmdLine[1]
	EndIf

	If $Parameter_1 = "Update" Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Updating:")
		_Sync_Icons()
		$UpdateOverlay_SettingValue = IniRead($Config_INI, "Settings", "UpdateOverlay", "")
		$ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")

		_Exit_Check()
		If $ScanLibrary_OnStart_SettingValue = "true" Then _Overlay_ReScan_Steam_Library()
		_Exit_Check()
		If $HomeApp = "VR Toolbox" Then _Create_VRToolBox_StartPage()
		_Exit_Check()
		If $HomeApp = "VR Toolbox" Then _Copy_2_VRToolBox()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End Updating:")
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start creating Game Pages:")
		_Create_GamePages()
		_Exit_Check()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating Game Pages:")
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start creating Single Game Pages:")
		_Create_SinglePages()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating Single Game Pages:")
		Exit
	EndIf

	If $Parameter_1 = "UpdateStartPage" Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start creating VRToolBox StartPage:")
		_Create_VRToolBox_StartPage()
		_Exit_Check()
		_Copy_2_VRToolBox()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating VRToolBox StartPage:")
		Exit
	EndIf
EndIf
#endregion

Local $Parameter_1 = ""
If $CmdLine[0] Then
	$Parameter_1 = $CmdLine[1]
EndIf

If $Parameter_1 = "Read_SteamVR_VRSettings_IN" Then
	_Read_SteamVR_VRSettings()
	Exit
EndIf

_Read_SteamVR_VRSettings()

#Region GUI
If $First_Start <> "true" Then
	#region GUI Erstellen
	Local $hGUI, $hGraphic, $hPen
	Local $GUI, $aSize, $aStrings[5]
	Local $btn, $chk, $rdo, $Msg
	Local $GUI_List_Auswahl, $tu_Button0, $to_button1, $to_button2, $to_button3, $to_button4
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sPath = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\Advanced\Images"

	Local $DesktopWidth = "855"
	Local $DesktopHeight = @DesktopHeight - 75
	Local $POS_X_GUI = 4

	Global $GUI = GUICreate("Home Loader Library", 800, $DesktopHeight, $POS_X_GUI, 4, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	; PROGRESS
	Global $Anzeige_Fortschrittbalken_2 = GUICtrlCreateProgress(0, $DesktopHeight - 25, $DesktopWidth, 5)
	Global $Anzeige_Fortschrittbalken = GUICtrlCreateProgress(0, $DesktopHeight - 121, $DesktopWidth, 5)

	Global $Statusbar = _GUICtrlStatusBar_Create($GUI)
	_GUICtrlStatusBar_SetSimple($Statusbar, True)
	_GUICtrlStatusBar_SetText($Statusbar, "Loading, please wait." & @TAB & "" & @TAB & "'Version " & $Version & "'")
	GUISetState()

	; Rahmen
	Global $Linie_oben = GUICtrlCreatePic($gfx & "Frame.jpg", 612, 4, 177, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_unten = GUICtrlCreatePic($gfx & "Frame.jpg", 612, 87, 177, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_rechts = GUICtrlCreatePic($gfx & "Frame.jpg", 786, 4, 3, 84, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_links = GUICtrlCreatePic($gfx & "Frame.jpg", 612, 4, 3, 83, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))

	; Icon Preview
	Global $Icon_Preview_Image = GUICtrlCreatePic($gfx & "Icon_Preview.jpg", 615, 7, 171, 80)

	; Toolbar oben
	GUICtrlCreateLabel("Home Loader Library", 5, 0, 350, 38)
	GUICtrlSetFont(-1, 24, 400, 6, "arial")

	; Elemente oben
	Global $Combo_SteamLibrary = GUICtrlCreateCombo("", 0, 60, 155, 25, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, "ALL|Steam Library 1|Steam Library 2|Steam Library 3|Steam Library 4|Steam Library 5", $Steam_Library)
	GUICtrlSetFont(-1, 14, 400, 2, "arial")
	GuiCtrlSetTip(-1, "Choose Steam Library.")

	Global $Button_ShowGamePage = GUICtrlCreateButton("Show Game Page", 160, 45, 118, 46, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_ShowGamePage, $gfx & "GamePage.bmp")
	GuiCtrlSetTip(-1, "Opens the created Game Page for the current selection." & @CRLF)

	Global $Button_AddGame2Library = GUICtrlCreateButton("Add Game to Library", 345, 5, 100, 80, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_AddGame2Library, $gfx & "AddGame2Library.bmp")
	GuiCtrlSetTip(-1, "Add Game to the Home Loader Library." & @CRLF)

	Global $Button_ReScan_Steam_Library = GUICtrlCreateButton("Rescan Steam Library", 450, 5, 155, 42, $BS_BITMAP) ; 155, 80 --> 174, 71
	_GUICtrlButton_SetImage($Button_ReScan_Steam_Library, $gfx & "ReScan_SteamLibrary.bmp")
	If $ButtonTAB_State <>  1 Then GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GuiCtrlSetTip(-1, "Rescan Steam Library." & @CRLF)

	Global $Checkbox_ScanVIVEData_Value = ""
	If $ScanVIVEApps = "true" Then $Checkbox_ScanVIVEData_Value = "a"
	Global $Checkbox_ScanVIVEData = GUICtrlCreateLabel($Checkbox_ScanVIVEData_Value, 452, 49, 15, 15, 0x1201)
	GuiCtrlSetTip(-1, "Scans also for Viveport Apps if activated." & @CRLF)
	GUICtrlSetFont(-1, 20, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateLabel("Scan Viveport Apps", 473, 48, 135, 20)
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Scans also for Viveport Apps if activated." & @CRLF)

	Global $Checkbox_DeleteData_Value = ""
	If $DeleteHomeLoaderLibraryData = "true" Then $Checkbox_DeleteData_Value = "a"
	Global $Checkbox_DeleteData = GUICtrlCreateLabel($Checkbox_DeleteData_Value, 452, 68, 15, 15, 0x1201)
	GuiCtrlSetTip(-1, "Deletes the old Library data before it scans and adds the new content." & @CRLF)
	GUICtrlSetFont(-1, 18, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateLabel("Del. old Library Data", 473, 68, 135, 20)
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Deletes the old Library data before it scans and adds the new content." & @CRLF)


	Global $Button_ResolutionScale = GUICtrlCreateButton("Resolution Scale", 408, $DesktopHeight - 110, 96, 37, $BS_BITMAP) ; 440, $DesktopHeight - 100, 96, 42
	_GUICtrlButton_SetImage($Button_ResolutionScale, $gfx & "ResolutionScale.bmp")
	GuiCtrlSetTip(-1, "Shows the Home Loader settings menu.")

	Global $Button_HomeLoaderSettings = GUICtrlCreateButton("Home Loader settings", 408, $DesktopHeight - 70, 96, 37, $BS_BITMAP) ; 440, $DesktopHeight - 100, 96, 42
	_GUICtrlButton_SetImage($Button_HomeLoaderSettings, $gfx & "HomeLoaderSettings.bmp")
	GuiCtrlSetTip(-1, "Shows the Home Loader settings menu.")

	Global $Button_Settings = GUICtrlCreateButton("Settings", 590, $DesktopHeight - 100, 65, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Settings, $gfx & "Settings.bmp")
	GuiCtrlSetTip(-1, "Settings." & @CRLF & @CRLF &  "Includes:" & @CRLF & "- Steam Library Folders" & @CRLF & "- Icon Folders")

	Global $Button_Restart = GUICtrlCreateButton("Restart", 660, $DesktopHeight - 100, 65, 65, $BS_BITMAP) ;
	_GUICtrlButton_SetImage($Button_Restart, $gfx & "Restart.bmp")
	GuiCtrlSetTip(-1, "Restart.")

	Global $Button_Exit = GUICtrlCreateButton("Exit", 730, $DesktopHeight - 100, 65, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Exit, $gfx & "Exit.bmp")
	GuiCtrlSetTip(-1, "Close.")


	Global $ButtonTAB_Steam_Library = GUICtrlCreateButton($TAB1_Label, 0, 90, 100)
	Global $ButtonTAB_Non_Steam_Appl = GUICtrlCreateButton($TAB2_Label, 100, 90, 100)
	Global $ButtonTAB_Custom_1 = GUICtrlCreateButton($TAB3_Label, 205, 90, 100)
	Global $ButtonTAB_Custom_2 = GUICtrlCreateButton($TAB4_Label, 305, 90, 100)
	Global $ButtonTAB_Custom_3 = GUICtrlCreateButton($TAB5_Label, 405, 90, 100)
	Global $ButtonTAB_Custom_4 = GUICtrlCreateButton($TAB6_Label, 505, 90, 100)

	If $ButtonTAB_State = "1" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_SHOW)
	EndIf

	If $ButtonTAB_State = "2" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	EndIf

	If $ButtonTAB_State = "3" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	EndIf

	If $ButtonTAB_State = "4" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	EndIf

	If $ButtonTAB_State = "5" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	EndIf

	If $ButtonTAB_State = "6" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_DISABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	EndIf

	_Create_ListView_1()
	_Create_ListView_2()
	_Create_ListView_3()
	_Create_ListView_4()
	_Create_ListView_5()
	_Create_ListView_6()

	If $ButtonTAB_State = "1" Then GUICtrlSetState($listview, $GUI_SHOW)
	If $ButtonTAB_State = "2" Then GUICtrlSetState($listview_2, $GUI_SHOW)
	If $ButtonTAB_State = "3" Then GUICtrlSetState($listview_3, $GUI_SHOW)
	If $ButtonTAB_State = "4" Then GUICtrlSetState($listview_4, $GUI_SHOW)
	If $ButtonTAB_State = "5" Then GUICtrlSetState($listview_5, $GUI_SHOW)
	If $ButtonTAB_State = "6" Then GUICtrlSetState($listview_6, $GUI_SHOW)


	; Elemente unten
	Global $ElementeUntenGroup = GUICtrlCreateGroup("Create Game Page", 65, $DesktopHeight - 114, 177, 88)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

	Global $Checkbox_CreatePage = GUICtrlCreateLabel("", 4, $DesktopHeight - 77, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 22, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	Global $Checkbox_CreatePage_Label = GUICtrlCreateLabel("All", 30, $DesktopHeight - 78, 35, 20)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")

	Global $Button_Create_GamePage = GUICtrlCreateButton("Create Game Page", 70, $DesktopHeight - 96, 166, 32, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Create_GamePage, $gfx & "Create_GamePage.bmp")
	GuiCtrlSetTip(-1, "Create Game Page." & @CRLF & _
						"This function creates an .html Game Page containing all selected Games." & @CRLF & @CRLF)

	Global $Button_Create_SinglePage = GUICtrlCreateButton("Create Single Page", 70, $DesktopHeight - 63, 166, 32, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Create_SinglePage, $gfx & "Create_SinglePage.bmp")
	GuiCtrlSetTip(-1, "Create Single Page." & @CRLF & _
						"This function creates an .html Game Page for every selected Games." & @CRLF & @CRLF)



	$ElementeUntenGroup = GUICtrlCreateGroup("Add Game to TAB", 255, $DesktopHeight - 114, 143, 88)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

	Global $Combo_Add_to_Custom = GUICtrlCreateCombo("Choose TAB", 261, $DesktopHeight - 95, 130, 32, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, $TAB3_Label & "|" & $TAB4_Label & "|" & $TAB5_Label & "|" & $TAB6_Label, "")
	GUICtrlSetFont(-1, 14, 400, 2, "arial")
	If $ButtonTAB_State = 1 Or $ButtonTAB_State = 2 Then
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
	Else
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	EndIf
	GuiCtrlSetTip(-1, "Choose the TAB where you want to add the games.")

	Global $Button_Add_to_Custom = GUICtrlCreateButton("Add to Custom", 260, $DesktopHeight - 63, 133, 32, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Add_to_Custom, $gfx & "Add_to_Custom.bmp")
	If $ButtonTAB_State = 1 Or $ButtonTAB_State = 2 Then
		GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	Else
		GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	EndIf
	GuiCtrlSetTip(-1, "Add selected games to chosen TAB.")
	#endregion

	_Loading_GUI()

	#Region Funktionen Verknüpfen
	GUISetOnEvent($GUI_EVENT_CLOSE, "_Beenden")
	GUICtrlSetOnEvent($Button_Restart, "_Restart")
	GUICtrlSetOnEvent($Button_Exit, "_Beenden")
	GUICtrlSetOnEvent($Button_Settings, "_Settings_GUI")
	GUICtrlSetOnEvent($Button_Exit_Settings_GUI, "_Button_Exit_Settings_GUI")

	GUICtrlSetOnEvent($Combo_SteamLibrary, "_Combo_SteamLibrary")
	GUICtrlSetOnEvent($Button_ShowGamePage, "_Show_HTML_GamePage_GUI")
	GUICtrlSetOnEvent($Button_AddGame2Library, "_Button_AddGame2Library")
	GUICtrlSetOnEvent($Button_ReScan_Steam_Library, "_Button_ReScan_Steam_Library")
	GUICtrlSetOnEvent($Checkbox_DeleteData, "_Checkbox_DeleteData")
	GUICtrlSetOnEvent($Checkbox_ScanVIVEData, "_Checkbox_ScanVIVEData")

	GUICtrlSetOnEvent($ButtonTAB_Steam_Library, "_ButtonTAB_Steam_Library")
	GUICtrlSetOnEvent($ButtonTAB_Non_Steam_Appl, "_ButtonTAB_Non_Steam_Appl")
	GUICtrlSetOnEvent($ButtonTAB_Custom_1, "_ButtonTAB_Custom_1")
	GUICtrlSetOnEvent($ButtonTAB_Custom_2 , "_ButtonTAB_Custom_2")
	GUICtrlSetOnEvent($ButtonTAB_Custom_3 , "_ButtonTAB_Custom_3")
	GUICtrlSetOnEvent($ButtonTAB_Custom_4 , "_ButtonTAB_Custom_4")

	GUICtrlSetOnEvent($Button_ResolutionScale, "_SS_GUI")
	GUICtrlSetOnEvent($Button_HomeLoaderSettings, "_Button_HomeLoaderSettings")

	GUICtrlSetOnEvent($Checkbox_CreatePage, "_Checkbox_all")
	GUICtrlSetOnEvent($Checkbox_CreatePage_Label, "_Checkbox_all")

	GUICtrlSetOnEvent($Button_Create_GamePage, "_Button_Create_GamePage_selected")
	GUICtrlSetOnEvent($Button_Create_SinglePage, "_Button_Create_SinglePage_selected")
	GUICtrlSetOnEvent($Button_Add_to_Custom, "_Button_Add_to_Custom")

	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5_1, "_RM_Menu_Item_5_1")
	GUICtrlSetOnEvent($RM_Item5_2, "_RM_Menu_Item_5_2")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	#endregion

	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)

	Local $NR_ApplicationsCheck = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")

	If $NR_ApplicationsCheck = "" Or $NR_ApplicationsCheck = "0" Then

		Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Scan Library", "The Game Library is emtpty." & @CRLF & @CRLF & _
																	"Do you want to scan your Steam and if available also your" & @CRLF & _
																	"Viveport Library?" & @CRLF & @CRLF & _
																	'This can also be done manually by using the "Rescan" Button.' & @CRLF)

		If $Abfrage = 6 Then
			_Button_ReScan_Steam_Library()
			_Restart()
		EndIf
	EndIf

	_Read_from_INI_ADD_2_ListView()

	Sleep(500)
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)

	GUIRegisterMsg($WM_notify, "_ClickOnListView")
	GUIDelete($GUI_Loading)

	$NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	_GUICtrlStatusBar_SetText($Statusbar, "'Rescan Steam Library' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & @TAB & "'Version " & $Version & "'")
EndIf

#endregion

If $Parameter_1 = "Show_SS_Menu" Then
	_SS_GUI()
EndIf

#Region While 1
While 1
	Sleep(100)
    Global $nMsg = GUIGetMsg()

    Switch $nMsg

        Case $GUI_EVENT_CLOSE
            Exit

	EndSwitch
WEnd
#endregion


#Region First Start And Update / Empty Check
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

	$Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
	$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\')
	If $Install_Folder_Steam_Search_Folder <> "" Then
		For $Loop_FolderCheck = 2 To 5
			Local $LineNR = 3 + $Loop_FolderCheck
			Local $Install_Folder_Check = IniRead($Config_INI, "Folders", "Install_Folder_Steam_" & $Loop_FolderCheck, "")
			Local $Install_Folder_1 = FileReadLine($libraryfolders_vdf, $LineNR)
			Local $Install_Folder_2 = StringTrimLeft($Install_Folder_1, 6)
			Local $Install_Folder_3 = StringReplace($Install_Folder_2, '"', '')
			Local $Install_Folder_4 = StringReplace($Install_Folder_3, '}', '')
			Local $Install_Folder_5 = StringReplace($Install_Folder_4, '\\', '\') & "\"
			If $Install_Folder_4 <> "" Then IniWrite($Config_INI, "Folders", "Install_Folder_Steam_" & $Loop_FolderCheck, $Install_Folder_5)
		Next
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
	_Detect_SteamVR_Files()

	If FileExists(@DesktopDir & "\HomeLoaderOverlay.url") Then
		Local $HomeLoaderOverlay_url = IniRead(@DesktopDir & "\HomeLoaderOverlay.url", "InternetShortcut","URL", "ERROR")
		Local $StringReplace_SteamID = StringReplace($HomeLoaderOverlay_url, 'http://"steam://rungameid/', '')
		Local $HomeLoaderOverlaySteamID = StringReplace($StringReplace_SteamID, '"', '')
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

	If Not FileExists($SteamVR_Path & "resources\settings\default.vrsettings") Then
		If FileExists($Install_Folder_Steam_1 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_2 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_3 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_4 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_5 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\"

		$default_vrsettings_File = $SteamVR_Path & "resources\settings\default.vrsettings"
		If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
		$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
	EndIf

	If Not FileExists($SteamVR_Path & "tools\tools.vrmanifest") Then
		If FileExists($Install_Folder_Steam_1 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_2 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_3 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_4 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_5 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\"

		$Steam_tools_vrmanifest_File = $SteamVR_Path & "tools\tools.vrmanifest"
		If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
		$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
	EndIf
EndFunc
#endregion

#Region Func MAIN
Func _Loading_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	Local $POS_X_Loading_GUI = ($DesktopWidth / 2) - 152

	$GUI_Loading = GUICreate("Loading...please wait...", 250, 65, $POS_X_Loading_GUI, - 1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	GUISetIcon(@AutoItExe, -2, $GUI_Loading)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	GUICtrlCreateLabel("...Loading...", 66, 5, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)
	GUICtrlCreateLabel("...Please wait...", 49, 32, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)

	GUISetState(@SW_SHOW, $GUI_Loading)
	WinSetOnTop("Loading...please wait...", "", $WINDOWS_ONTOP)
EndFunc

Func _Settings_GUI()
	Global $HEIGHT_GUI = 710
	Global $POS_X = 5
	Global $POS_Y_SteamLibraryFolders_Group = 5
	Global $POS_Y_IconFolders_Group = 335

	Global $POS_Y_Button_Exit_Settings_GUI = 670


	$Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
	$Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
	$Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")

	$Settings_GUI = GUICreate("Settings", 540, $HEIGHT_GUI, - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

#Region Folders
	GUICtrlCreateGroup("Steam Library Folders", 5, $POS_Y_SteamLibraryFolders_Group, 531, 325)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	GUICtrlCreateLabel("Library Folder 1:", 10, $POS_Y_SteamLibraryFolders_Group + 37, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_1 = GUICtrlCreateInput($Install_Folder_Steam_1, 10, $POS_Y_SteamLibraryFolders_Group + 60, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_1 = GUICtrlCreateButton("...", 430, $POS_Y_SteamLibraryFolders_Group + 61, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1")
	GuiCtrlSetTip(-1, "Choose Folder.")
	Global $Button_Install_Folder_Steam_1_open = GUICtrlCreateButton("Open", 465, $POS_Y_SteamLibraryFolders_Group + 61, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	Global $Button_Install_Folder_Steam_1_save = GUICtrlCreateButton("Save", 500, $POS_Y_SteamLibraryFolders_Group + 61, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_1_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_1_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 2:", 10, $POS_Y_SteamLibraryFolders_Group + 92, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_2 = GUICtrlCreateInput($Install_Folder_Steam_2, 10, $POS_Y_SteamLibraryFolders_Group + 115, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_2 = GUICtrlCreateButton("...", 430, $POS_Y_SteamLibraryFolders_Group + 114, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2")
	GuiCtrlSetTip(-1, "Choose Folder.")
	Global $Button_Install_Folder_Steam_2_open = GUICtrlCreateButton("Open", 465, $POS_Y_SteamLibraryFolders_Group + 114, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	Global $Button_Install_Folder_Steam_2_save = GUICtrlCreateButton("Save", 500, $POS_Y_SteamLibraryFolders_Group + 114, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_2_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_2_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 3:", 10, $POS_Y_SteamLibraryFolders_Group + 147, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_3 = GUICtrlCreateInput($Install_Folder_Steam_3, 10, $POS_Y_SteamLibraryFolders_Group + 170, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_3 = GUICtrlCreateButton("...", 430, $POS_Y_SteamLibraryFolders_Group + 169, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3")
	GuiCtrlSetTip(-1, "Choose Folder.")
	Global $Button_Install_Folder_Steam_3_open = GUICtrlCreateButton("Open", 465, $POS_Y_SteamLibraryFolders_Group + 169, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	Global $Button_Install_Folder_Steam_3_save = GUICtrlCreateButton("Save", 500, $POS_Y_SteamLibraryFolders_Group + 169, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_3_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_3_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 4:", 10, $POS_Y_SteamLibraryFolders_Group + 202, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_4 = GUICtrlCreateInput($Install_Folder_Steam_4, 10, $POS_Y_SteamLibraryFolders_Group + 225, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_4 = GUICtrlCreateButton("...", 430, $POS_Y_SteamLibraryFolders_Group + 224, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4")
	GuiCtrlSetTip(-1, "Choose Folder.")
	Global $Button_Install_Folder_Steam_4_open = GUICtrlCreateButton("Open", 465, $POS_Y_SteamLibraryFolders_Group + 224, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	Global $Button_Install_Folder_Steam_4_save = GUICtrlCreateButton("Save", 500, $POS_Y_SteamLibraryFolders_Group + 224, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_4_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_4_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 5:", 10, $POS_Y_SteamLibraryFolders_Group + 257, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_5 = GUICtrlCreateInput($Install_Folder_Steam_5, 10, $POS_Y_SteamLibraryFolders_Group + 280, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_5 = GUICtrlCreateButton("...", 430, $POS_Y_SteamLibraryFolders_Group + 279, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5")
	GuiCtrlSetTip(-1, "Choose Folder.")
	Global $Button_Install_Folder_Steam_5_open = GUICtrlCreateButton("Open", 465, $POS_Y_SteamLibraryFolders_Group + 279, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	Global $Button_Install_Folder_Steam_5_save = GUICtrlCreateButton("Save", 500, $POS_Y_SteamLibraryFolders_Group + 279, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_5_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_5_save, $gfx & "Save_small.bmp")
#endregion


#Region Icon Folders
	GUICtrlCreateGroup("Icon Folders", $POS_X, $POS_Y_IconFolders_Group, 531, 325)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	Local $Label_Icon_Path_1 = "Custom 1:"
	If $Icon_Folder_1 = $Install_DIR & "WebPage\images\" Then
		$Label_Icon_Path_1 = "Web Page:"
	EndIf

	Local $Label_Icon_Path_2 = "Custom 2:"
	If $Icon_Folder_2 = $HTCVive_Path & "Updater\App\Dashboard\win32\header_image\" Then
		$Label_Icon_Path_2 = "Vive Home:"
	EndIf

	Local $Label_Icon_Path_3 = "Custom 3:"
	Local $Icon_Folder_3_StringInStr = StringInStr($Icon_Folder_3, "VRUtilityBelt")
	If $Icon_Folder_3_StringInStr <> 0 Then $Label_Icon_Path_3 = "VRUtilityBelt Overlay:"


	GUICtrlCreateLabel($Label_Icon_Path_1, $POS_X + 5, $POS_Y_IconFolders_Group + 37, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Icon_Folder_1 = GUICtrlCreateInput($Icon_Folder_1, $POS_X + 5, $POS_Y_IconFolders_Group + 60, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Icon_Folder_1 = GUICtrlCreateButton("...", $POS_X + 425, $POS_Y_IconFolders_Group + 61, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_1")
	GuiCtrlSetTip(-1, "Choose Folder.")
	Global $Button_Icon_Folder_1_open = GUICtrlCreateButton("Open", $POS_X + 460, $POS_Y_IconFolders_Group + 61, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_1_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	Global $Button_Icon_Folder_1_save = GUICtrlCreateButton("Save", $POS_X + 495, $POS_Y_IconFolders_Group + 61, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_1_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Icon_Folder_1_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Icon_Folder_1_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel($Label_Icon_Path_2, $POS_X + 5, $POS_Y_IconFolders_Group + 92, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Icon_Folder_2 = GUICtrlCreateInput($Icon_Folder_2, $POS_X + 5, $POS_Y_IconFolders_Group + 115, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Icon_Folder_2 = GUICtrlCreateButton("...", $POS_X + 425, $POS_Y_IconFolders_Group + 116, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_2")
	GuiCtrlSetTip(-1, "Choose Folder.")
	Global $Button_Icon_Folder_2_open = GUICtrlCreateButton("Open", $POS_X + 460, $POS_Y_IconFolders_Group + 116, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_2_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	Global $Button_Icon_Folder_2_save = GUICtrlCreateButton("Save", $POS_X + 495, $POS_Y_IconFolders_Group + 116, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_2_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Icon_Folder_2_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Icon_Folder_2_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel($Label_Icon_Path_3, $POS_X + 5, $POS_Y_IconFolders_Group + 147, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Icon_Folder_3 = GUICtrlCreateInput($Icon_Folder_3, $POS_X + 5, $POS_Y_IconFolders_Group + 170, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Icon_Folder_3 = GUICtrlCreateButton("...", $POS_X + 425, $POS_Y_IconFolders_Group + 171, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_3")
	GuiCtrlSetTip(-1, "Choose Folder.")
	Global $Button_Icon_Folder_3_open = GUICtrlCreateButton("Open", $POS_X + 460, $POS_Y_IconFolders_Group + 171, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_3_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	Global $Button_Icon_Folder_3_save = GUICtrlCreateButton("Save", $POS_X + 495, $POS_Y_IconFolders_Group + 171, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_3_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Icon_Folder_3_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Icon_Folder_3_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Custom 4:", $POS_X + 5, $POS_Y_IconFolders_Group + 202, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Icon_Folder_4 = GUICtrlCreateInput($Icon_Folder_4, $POS_X + 5, $POS_Y_IconFolders_Group + 225, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Icon_Folder_4 = GUICtrlCreateButton("...", $POS_X + 425, $POS_Y_IconFolders_Group + 226, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_4")
	GuiCtrlSetTip(-1, "Choose Folder.")
	Global $Button_Icon_Folder_4_open = GUICtrlCreateButton("Open", $POS_X + 460, $POS_Y_IconFolders_Group + 226, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_4_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	Global $Button_Icon_Folder_4_save = GUICtrlCreateButton("Save", $POS_X + 495, $POS_Y_IconFolders_Group + 226, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_4_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Icon_Folder_4_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Icon_Folder_4_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Custom 5:", $POS_X + 5, $POS_Y_IconFolders_Group + 257, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Icon_Folder_5 = GUICtrlCreateInput($Icon_Folder_5, $POS_X + 5, $POS_Y_IconFolders_Group + 280, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Icon_Folder_5 = GUICtrlCreateButton("...", $POS_X + 425, $POS_Y_IconFolders_Group + 281, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_5")
	GuiCtrlSetTip(-1, "Choose Folder.")
	Global $Button_Icon_Folder_5_open = GUICtrlCreateButton("Open", $POS_X + 460, $POS_Y_IconFolders_Group + 281, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_5_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	Global $Button_Icon_Folder_5_save = GUICtrlCreateButton("Save", $POS_X + 495, $POS_Y_IconFolders_Group + 281, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_5_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Icon_Folder_5_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Icon_Folder_5_save, $gfx & "Save_small.bmp")

	Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", 500, $POS_Y_Button_Exit_Settings_GUI, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_Settings_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	GUISetState()
	$Game_ID = ""
EndFunc
#endregion

Func _AddGame2Library_GUI()
	$AddGame2Library_GUI = GUICreate("Add Game to Library", 349, 305 , - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	; Rahmen
	Global $Frame_up = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 190, 110, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_down = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 243, 110, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_right = GUICtrlCreatePic($gfx & "Frame.jpg", 330, 190, 3, 56, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_left = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 190, 3, 56, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Icon_Preview = GUICtrlCreatePic($gfx & "Icon_Preview.jpg", 223, 193, 107, 50)

	GUICtrlCreateGroup("Properties", 5, 5, 340, 255)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	GUICtrlCreateLabel("Library:", 10, 40, 170, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $DROPDOWN_Library = GUICtrlCreateCombo("", 130, 39, 203, 35)
	GUICtrlSetOnEvent(- 1, "_DROPDOWN_Library")
	GUICtrlSetData(-1, "Non_Steam_Appl", "Non_Steam_Appl")
	GUICtrlSetFont(-1, 12, 400, 2, "arial")

	GUICtrlCreateLabel("Game Path:", 10, 80, 115, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $BUTTON_GamePath_Folder = GUICtrlCreateButton("Select File", 130, 76, 99, 30, 0)
	GUICtrlSetOnEvent(- 1, "_BUTTON_GamePath_Folder")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Select File.")
	Global $BUTTON_Use_SteamID= GUICtrlCreateButton("Use Steam ID", 234, 76, 100, 30, 0)
	GUICtrlSetOnEvent(- 1, "_BUTTON_Use_SteamID")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Enter Steam ID.")
	Global $Input_GamePath_Folder = GUICtrlCreateInput("", 130, 108, 203, 30)
	GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")

	GUICtrlCreateLabel("Appl. Name:", 10, 153, 150, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Name = GUICtrlCreateInput("", 130, 149, 203, 30)
	GUICtrlSetOnEvent(- 1, "_Input_Name")
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")

	GUICtrlCreateLabel("Icon Path:", 10, 207, 115, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $BUTTON_IconPath_Folder = GUICtrlCreateButton("Select Icon", 130, 203, 85, 30, 0)
	GUICtrlSetOnEvent(- 1, "_BUTTON_IconPath_Folder")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Select File.")

	GUICtrlCreateGroup("Drop Field", 350, 5, 130, 255)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	Global $Button_SAVE_APP = GUICtrlCreateButton("Save", 5, 265, 300, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_SAVE_APP")
	_GUICtrlButton_SetImage(- 1, $gfx & "Create_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	Global $Button_Exit_AddGame2Library_GUI = GUICtrlCreateButton("Exit", 310, 265, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_AddGame2Library_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")
	GUISetState()

	GUICtrlSetState($Input_GamePath_Folder, $GUI_HIDE)
	GUICtrlSetState($Input_Name, $GUI_HIDE)
	GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_HIDE)
	GUICtrlSetState($Frame_up, $GUI_HIDE)
	GUICtrlSetState($Frame_down, $GUI_HIDE)
	GUICtrlSetState($Frame_right, $GUI_HIDE)
	GUICtrlSetState($Frame_left, $GUI_HIDE)
	GUICtrlSetState($Icon_Preview, $GUI_HIDE)
	GUICtrlSetState($Button_SAVE_APP, $GUI_HIDE)
EndFunc

Func _SS_GUI()
	$SS_Settings_GUI = GUICreate("Resolution Scale Menu", 285, 455 , - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $renderTargetMultiplier_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "renderTargetMultiplier", "1.0")
	Local $rTM_1 = StringLeft($renderTargetMultiplier_value, 1)
	Local $rTM_2 = StringRight($renderTargetMultiplier_value, 1)
	Local $rTM_value = $rTM_1 & $rTM_2
	Local $rTM_Input_value = $rTM_1 & "." & $rTM_2
	If $rTM_1 = "0" Then $rTM_value = $rTM_2
	If $rTM_1 = "0" Then $rTM_Input_value = "0." & $rTM_2
	Local $supersampleScale_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "supersampleScale", "1.0")
	Local $ssS_1 = StringLeft($supersampleScale_value, 1)
	Local $ssS_2 = StringRight($supersampleScale_value, 1)
	Local $ssS_value = $ssS_1 & $ssS_2
	Local $ssS_Input_value = $ssS_1 & "." & $ssS_2
	If $ssS_1 = "0" Then $ssS_value = $ssS_2
	If $ssS_1 = "0" Then $ssS_Input_value = "0." & $ssS_2
	Local $allowSupersampleFiltering_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "allowSupersampleFiltering", "true")
	If $allowSupersampleFiltering_value = "true" Then Local $aSsF_value = 0
	If $allowSupersampleFiltering_value = "false" Then Local $aSsF_value = 1

	Local $ResolutionScale_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "ResolutionScale", "100")

	; Group 1
	Local $Steam_app_Name_RS = StringLeft($Steam_app_Name, 16)
	If StringLen($Steam_app_Name) > 16 Then $Steam_app_Name_RS = $Steam_app_Name_RS & "..."
	$ResolutionScale_Group = GUICtrlCreateGroup("Scale [%] for: " & $Steam_app_Name_RS, 5, 5, 275, 105)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 12, 400, 6, $font_arial)

	Global $Slider_0 = GUICtrlCreateSlider(8, 35, 200, 30, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUICtrlSetLimit($Slider_0, 500, 20)
	GUICtrlSetData ($Slider_0, $ResolutionScale_value)
	GUICtrlSetOnEvent(- 1, "_Slider_0")

	Global $Input_ResolutionScale = GUICtrlCreateInput($ResolutionScale_value, 208, 35, 65, 30)
	GUICtrlSetFont(-1, 14, $FW_NORMAL, "", $font_arial)
	Global $UpDown_ResolutionScale = GUICtrlCreateUpdown($Input_ResolutionScale)
	GUICtrlSetOnEvent(- 1, "_UpDown_ResolutionScale")

	Global $SAVE_Button_Group_1 = GUICtrlCreateButton("SAVE", 10, 70, 264, 30)
		GuiCtrlSetTip(-1, "Closes Settings Window.")
		GUICtrlSetFont(-1, 14, 600, 2, $font_arial)
		GUICtrlSetColor(-1, "0x006600")
		GUICtrlSetOnEvent($SAVE_Button_Group_1, "_Write_to_SteamVR_VRSettings")

	; Group 2
	$VRSettings_Group = GUICtrlCreateGroup("Main Supersampling Settings", 5, 130, 275, 270)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 12, 400, 6, $font_arial)


	GUICtrlCreateLabel("Render Target Multiplier:", 10, 160, 265, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)

	Global $Slider_1 = GUICtrlCreateSlider(8, 190, 200, 30, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUICtrlSetLimit($Slider_1, 25, 5)
	GUICtrlSetData ($Slider_1, $rTM_value)
	GUICtrlSetOnEvent(- 1, "_Slider_1")

	Global $Input_renderTargetMultiplier = GUICtrlCreateInput($rTM_Input_value, 208, 190, 65, 30)
	GUICtrlSetFont(-1, 14, $FW_NORMAL, "", $font_arial)
	Global $UpDown_renderTargetMultiplier = GUICtrlCreateUpdown($Input_renderTargetMultiplier)
	GUICtrlSetOnEvent(- 1, "_UpDown_renderTargetMultiplier")

	GUICtrlCreateLabel("Supersample Scale:", 10, 225, 265, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)

	Global $Slider_2 = GUICtrlCreateSlider(8, 257, 200, 30, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUICtrlSetLimit($Slider_2, 25, 5)
	GUICtrlSetData ($Slider_2, $ssS_value)
	GUICtrlSetOnEvent(- 1, "_Slider_2")

	Global $Input_supersampleScale = GUICtrlCreateInput($ssS_Input_value, 208, 255, 65, 30)
	GUICtrlSetFont(-1, 14, $FW_NORMAL, "", $font_arial)
	Global $UpDown_supersampleScale = GUICtrlCreateUpdown($Input_supersampleScale)
	GUICtrlSetOnEvent(- 1, "_UpDown_supersampleScale")

	GUICtrlCreateLabel("Allow Supersample Filtering:", 10,295 , 265, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)

	Global $Slider_3 = GUICtrlCreateSlider(8, 325, 200, 30, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUICtrlSetLimit($Slider_3, 1, 0)
	GUICtrlSetData ($Slider_3, $aSsF_value)
	GUICtrlSetOnEvent(- 1, "_Slider_3")

    Global $ComboBox_3 = GUICtrlCreateCombo("", 208, 325, 65, 30)
	GUICtrlSetFont(-1, 13, 400, 1, $font_arial)
	GUICtrlSetData($ComboBox_3, "true|false", $allowSupersampleFiltering_value)
	GUICtrlSetOnEvent(- 1, "_ComboBox_3")

	Global $SAVE_Button_Group_2 = GUICtrlCreateButton("SAVE", 10, 360, 264, 30)
		GuiCtrlSetTip(-1, "Closes Settings Window.")
		GUICtrlSetFont(-1, 14, 600, 2, $font_arial)
		GUICtrlSetColor(-1, "0x006600")
		GUICtrlSetOnEvent($SAVE_Button_Group_2, "_Button_Add2Steam_Settings_GUI")


	Global $Button_StartGame_Settings_GUI = GUICtrlCreateButton("Start Game", 5, 410, 85, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_StartGame_Settings_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "StartGame.bmp")
	GuiCtrlSetTip(-1, "Saves, Adds and Starts the selected game using the current values.")

	Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", 245, 410, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_SS_Settings_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	GUISetState()
EndFunc

Func _Update_StatusBar()
	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $rTM_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "renderTargetMultiplier", "1.0")
	Local $ssS_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "supersampleScale", "1.0")
	Local $aSF_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "allowSupersampleFiltering", "true")

	_GUICtrlStatusBar_SetText($Statusbar, $Steam_app_Name & " [" & $Game_ID & "] " & @TAB & "RTM: " & $rTM_value & " / " & "SSS: " & $ssS_value &  " / " & "ASF: " & $aSF_value & @TAB & "'Version " & $Version & "'")
EndFunc

Func _Search_Files()
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "ALL" Then Local $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"

	If $Combo <> "ALL" Then
		If $Combo = "Steam Library 1" Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		If $Combo = "Steam Library 2" Then $s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
		If $Combo = "Steam Library 3" Then $s_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
		If $Combo = "Steam Library 4" Then $s_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
		If $Combo = "Steam Library 5" Then $s_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"
		If $Combo = "" Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		Local $FileList = _FileListToArray($s_LocalFolder , "*.acf" , 1)
		Global $Application_NR = 1

		If $FileList <> "" Then
			FileDelete($ApplicationList_INI)
			For $NR = 1 To $FileList[0]
				Global $FileList_NR = $FileList[0]
				Global $File_Name = $FileList[$NR]
				Global $File_Path = $s_LocalFolder & $File_Name
				Global $ProcessBar_Status = $NR * 100 / $FileList[0]
				$ProcessBar_Status = $ProcessBar_Status ; - 15
				GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)
				If StringLeft(FileRead($File_Path), 3) <> "0x0" Then
					_ApplicationList_Update()
					$Application_NR = $Application_NR + 1
				EndIf
				$File_Path =  ""
			Next
			Sleep(500)
		EndIf
	EndIf

	If $Combo = "ALL" Then
			If $NR_Library_temp = 1 Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
			If $NR_Library_temp = 2 Then $s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
			If $NR_Library_temp = 3 Then $s_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
			If $NR_Library_temp = 4 Then $s_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
			If $NR_Library_temp = 5 Then $s_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"

			Local $FileList = _FileListToArray($s_LocalFolder , "*.acf" , 1)
			Global $Application_NR = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "") + 1

			If $FileList <> "" Then
				For $NR_temp2 = 1 To $FileList[0]
					Global $FileList_NR = $FileList[0]
					Global $File_Name = $FileList[$NR_temp2]
					Global $File_Path = $s_LocalFolder & $File_Name
					Global $ProcessBar_Status = $NR_temp2 * 100 / $FileList[0]
					$ProcessBar_Status = $ProcessBar_Status ; - 15
					GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)
					If StringLeft(FileRead($File_Path), 3) <> "0x0" Then
						_ApplicationList_Update()
						$Application_NR = $Application_NR + 1
					EndIf
					$File_Path =  ""
				Next
				Sleep(500)
			EndIf
			$FileList = ""
	EndIf
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _ApplicationList_Update()
	Global $File = $File_Path
	Global $Wert_Zeile = ""

	If $File <> "" Then
			For $iCount_1 = 1 To 7
				Local $Wert_Zeile_komplett = FileReadLine($File, $iCount_1)

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "appid")
				If $iPosition <> 0 Then
					Global $appid = StringReplace($Wert_Zeile_komplett, '	"appid"		"', '')
					$appid = StringReplace($appid, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "Universe")
				If $iPosition <> 0 Then
					Global $Universe = StringReplace($Wert_Zeile_komplett, '	"Universe"		"', '')
					$Universe = StringReplace($Universe, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "name")
				If $iPosition <> 0 Then
					$name = StringReplace($Wert_Zeile_komplett, '	"name"		"', '')
					$name = StringReplace($name, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "StateFlags")
				If $iPosition <> 0 Then
					Global $StateFlags = StringReplace($Wert_Zeile_komplett, '	"StateFlags"		"', '')
					$StateFlags = StringReplace($StateFlags, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "installdir")
				If $iPosition <> 0 Then
					Global $installdir = StringReplace($Wert_Zeile_komplett, '	"installdir"		"', '')
					$installdir = StringReplace($installdir, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "LastUpdated")
				If $iPosition <> 0 Then
					Global $LastUpdated = StringReplace($Wert_Zeile_komplett, '	"LastUpdated"		"', '')
					$LastUpdated = StringReplace($LastUpdated, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "UpdateResult")
				If $iPosition <> 0 Then
					Global $UpdateResult = StringReplace($Wert_Zeile_komplett, '	"UpdateResult"		"', '')
					$UpdateResult = StringReplace($UpdateResult, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "SizeOnDisk")
				If $iPosition <> 0 Then
					Global $SizeOnDisk = StringReplace($Wert_Zeile_komplett, '	"SizeOnDisk"		"', '')
					$SizeOnDisk = StringReplace($SizeOnDisk, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "buildid")
				If $iPosition <> 0 Then
					Global $buildid = StringReplace($Wert_Zeile_komplett, '	"buildid"		"', '')
					$buildid = StringReplace($buildid, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "LastOwner")
				If $iPosition <> 0 Then
					Global $LastOwner = StringReplace($Wert_Zeile_komplett, '	"LastOwner"		"', '')
					$LastOwner = StringReplace($LastOwner, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "BytesToDownload")
				If $iPosition <> 0 Then
					Global $BytesToDownload = StringReplace($Wert_Zeile_komplett, '	"BytesToDownload"		"', '')
					$BytesToDownload = StringReplace($BytesToDownload, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "BytesDownloaded")
				If $iPosition <> 0 Then
					Global $BytesDownloaded = StringReplace($Wert_Zeile_komplett, '	"BytesDownloaded"		"', '')
					$BytesDownloaded = StringReplace($BytesDownloaded, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "AutoUpdateBehavior")
				If $iPosition <> 0 Then
					Global $AutoUpdateBehavior = StringReplace($Wert_Zeile_komplett, '	"AutoUpdateBehavior"		"', '')
					$AutoUpdateBehavior = StringReplace($AutoUpdateBehavior, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "AllowOtherDownloadsWhileRunning")
				If $iPosition <> 0 Then
					Global $AllowOtherDownloadsWhileRunning = StringReplace($Wert_Zeile_komplett, '	"AllowOtherDownloadsWhileRunning"		"', '')
					$AllowOtherDownloadsWhileRunning = StringReplace($AllowOtherDownloadsWhileRunning, '"', '')
				EndIf
			Next

			IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "NR", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "appid", $appid)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "name", $name)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "installdir", $installdir)

			IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "NR", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "appid", $appid)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "name", $name)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "installdir", $installdir)

			If $appid <> "" Then
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", $Icons & "steam.app." & $appid & ".jpg")
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", $Icons & "steam.app." & $appid & ".jpg")
			Else
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", "")
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", "")
			EndIf

			_Download_Icon_for_SteamGameID()

			$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
			If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icons & "32x32\" & "steam.app." & $appid & ".bmp")
			If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icons & "256x256\" & "steam.app." & $appid & ".bmp")

			If Not FileExists($Icons & "32x32\" & "steam.app." & $appid & ".bmp") Then
				_Get_SteamGame_Icon_32x32()
			EndIf

			If Not FileExists($Icons & "256x256\" & "steam.app." & $appid & ".bmp") Then
				_Get_SteamGame_Icon_256x256()
			EndIf

			If $appid <> "" Then
				_Get_ADD_PlayersOnline_DATA()
			EndIf
	EndIf
EndFunc

Func _Get_ADD_PlayersOnline_DATA()
	Global $Check_AppId = $appid
	If $Check_AppId <> "" Then
		Local $URL = "https://steamdb.info/app/" & $appid & "/graphs/"
		_INetGetSource($URL)

		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $URL, false)
			$WinHttpReq.Send()
			Local $Data = $WinHttpReq.ResponseText

			Local $iPosition_1 = StringInStr($Data, '<li><strong>')
			Local $iPosition_2 = StringInStr($Data, '</strong><em>all-time peak')
			Local $iPosition_3 = $iPosition_2 - $iPosition_1

			Local $sString = StringMid($Data, $iPosition_1, $iPosition_3)
			Global $aArray = StringSplit($sString, '<li><strong>', $STR_ENTIRESPLIT)

			If $aArray[0] > 1 Then
				Global $PlayersOnline_right_now = StringSplit($aArray[2], '<')
				$PlayersOnline_right_now = $PlayersOnline_right_now[1]
				Global $PlayersOnline_24h_peak = StringSplit($aArray[3], '<')
				$PlayersOnline_24h_peak = $PlayersOnline_24h_peak[1]
				Global $PlayersOnline_all_time_peak = StringSplit($aArray[4], '<')
				$PlayersOnline_all_time_peak = $PlayersOnline_all_time_peak[1]

				Local $AppIdTemp = IniRead($ApplicationList_INI, "Application_" & $Application_NR, "appid", "")

				IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "right_now", $PlayersOnline_right_now)
				IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "24h_peak", $PlayersOnline_24h_peak)
				IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "all_time_peak", $PlayersOnline_all_time_peak)
				IniWrite($ApplicationList_INI, "Application_" & $AppIdTemp, "right_now", $PlayersOnline_right_now)
				IniWrite($ApplicationList_INI, "Application_" & $AppIdTemp, "24h_peak", $PlayersOnline_24h_peak)
				IniWrite($ApplicationList_INI, "Application_" & $AppIdTemp, "all_time_peak", $PlayersOnline_all_time_peak)

				If $Add_PlayersOnline_to_Icons = "true" Then
					_Write_PO_TEXT_2_Image()
					_Write_PO_Image_2_Image()
				EndIf

				$PlayersOnline_right_now = ""
				$PlayersOnline_24h_peak = ""
				$PlayersOnline_all_time_peak = ""
			EndIf
		Else
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Get_ADD_PlayersOnline_DATA]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
		EndIf
	EndIf
EndFunc

Func _Write_PO_TEXT_2_Image()
	_GDIPlus_Startup()
	Global $hImage = _GDIPlus_WTOB($gfx & "Icon_NR_Background.jpg", $PlayersOnline_right_now, "Arial", 45, -1, 3, 0, 0, 0x00CCFF, 1, 1)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()

	If FileExists(@ScriptDir & "\" & "WTOB.png") Then
		FileCopy(@ScriptDir & "\" & "WTOB.png", @ScriptDir & "\Icon_NR_Background" & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		FileDelete(@ScriptDir & "\" & "WTOB.png")
	EndIf
EndFunc

Func _Write_PO_Image_2_Image()
	Global $ImageSizeX = 460, $ImageSizeY = 215
	Global $FAVImageSizeX = 80, $FAVImageSizeY = 60

	$hImage1_Path = $Icons & "steam.app." & $Check_AppId & ".jpg"
	$hImage2_Path = @ScriptDir & "\" & "Icon_NR_Background.jpg"

	Local $Check_StringSplit_NR = StringInStr($hImage1_Path, "/", "", -1)
	If $Check_StringSplit_NR = "0" Then $Check_StringSplit_NR = StringInStr($hImage1_Path, "\", "", -1)
	Local $Check_Filename_1 = StringTrimLeft($hImage1_Path, $Check_StringSplit_NR)
	Local $Check_Filename_2 = StringRight($Check_Filename_1, 11)
	Local $Check_Filename = $Check_Filename_1

	GUISetState()

	_GDIPlus_Startup()
	$hImage1 = _GDIPlus_ImageLoadFromFile($hImage1_Path)
	$hImage2 = _GDIPlus_ImageLoadFromFile($hImage2_Path)

	$hBMPBuff = _GDIPlus_ImageLoadFromFile($hImage1_Path)
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hBMPBuff)

	;Graphics
	_GDIPlus_GraphicsClear($hGraphic, 0xFFE8FFE8)

	$hPen = _GDIPlus_PenCreate(0xFFFF0000, 3)

	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage1, 0, 0, $ImageSizeX, $ImageSizeY)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage2, 3, 3, $FAVImageSizeX, $FAVImageSizeY)

	_GDIPlus_GraphicsDrawRect($hGraphic, 1, 1, 80 + 3, 60 + 3, $hPen)

	GUIRegisterMsg(0xF, "MY_PAINT")
	GUIRegisterMsg(0x85, "MY_PAINT")

	;Save
	Local $sNewName = $Icons & "460x215\" & $Check_Filename
	Local $NewIcon_Path = $sNewName

	_GDIPlus_ImageSaveToFile($hBMPBuff, $NewIcon_Path)

	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()

	_Quit_PO_Image_2_Image()
EndFunc

Func MY_PAINT($hWnd, $msg, $wParam, $lParam)
	Return $GUI_RUNDEFMSG
EndFunc

Func _Quit_PO_Image_2_Image()
	If FileExists(@ScriptDir & "\Icon_NR_Background" & ".jpg") Then FileDelete(@ScriptDir & "\Icon_NR_Background" & ".jpg")
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()
EndFunc

Func _Get_AD_SS_Values_to_Icons()
	Local $FileList = _FileListToArray($Icons & "460x215\", "*.jpg", 1)

	If $FileList <> "" Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start adding SS values to icons: " & "<.jpg Files found = " & $FileList[0] & ">")

		For $NR = 1 To $FileList[0]
			$Check_AppId = StringReplace($FileList[$NR], 'steam.app.', '')
			$Check_AppId = StringReplace($Check_AppId, '.jpg', '')

			Local $SS_Value_Check = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "resolutionScale", "")
			Global $Value_for_Image = $SS_Value_Check

			If $Value_for_Image <> "" Then
				_Write_SS_TEXT_2_Image()
				_Write_SS_Image_2_Image()
			EndIf

			$SS_Value_Check = ""
			$Value_for_Image = ""
			$Check_AppId = ""
		Next
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End adding SS values to icons: " & "<.jpg Files found = " & $FileList[0] & ">")
	EndIf
EndFunc

Func _Write_SS_TEXT_2_Image()
	_GDIPlus_Startup()
	Global $hImage = _GDIPlus_WTOB($gfx & "Icon_NR_Background.jpg", $Value_for_Image & "%", "Arial", 45, -1, 3, 0, 0, 0x00CCFF, 1, 1)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()

	If FileExists(@ScriptDir & "\" & "WTOB.png") Then
		FileCopy(@ScriptDir & "\" & "WTOB.png", @ScriptDir & "\Icon_NR_Background" & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		FileDelete(@ScriptDir & "\" & "WTOB.png")
	EndIf
EndFunc

Func _Write_SS_Image_2_Image()
	Global $ImageSizeX = 460, $ImageSizeY = 215
	Global $FAVImageSizeX = 80, $FAVImageSizeY = 60

	Local $hImage1_Path = $Icons & "460x215\" & "steam.app." & $Check_AppId & ".jpg"
	Local $hImage2_Path = @ScriptDir & "\" & "Icon_NR_Background.jpg"

	Local $Check_StringSplit_NR = StringInStr($hImage1_Path, "/", "", -1)
	If $Check_StringSplit_NR = "0" Then $Check_StringSplit_NR = StringInStr($hImage1_Path, "\", "", -1)
	Local $Check_Filename_1 = StringTrimLeft($hImage1_Path, $Check_StringSplit_NR)
	Local $Check_Filename_2 = StringRight($Check_Filename_1, 11)
	Local $Check_Filename = $Check_Filename_1

	GUISetState()

	_GDIPlus_Startup()
	$hImage1 = _GDIPlus_ImageLoadFromFile($hImage1_Path)
	$hImage2 = _GDIPlus_ImageLoadFromFile($hImage2_Path)

	$hBMPBuff = _GDIPlus_ImageLoadFromFile($hImage1_Path)
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hBMPBuff)

	;Graphics
	_GDIPlus_GraphicsClear($hGraphic, 0xFFE8FFE8)

	$hPen = _GDIPlus_PenCreate(0xFFFF0000, 3)

	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage1, 0, 0, $ImageSizeX, $ImageSizeY)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage2, 377, 152, $FAVImageSizeX, $FAVImageSizeY)

	_GDIPlus_GraphicsDrawRect($hGraphic, 375, 150, 80 + 3, 60 + 3, $hPen)

	GUIRegisterMsg(0xF, "MY_PAINT")
	GUIRegisterMsg(0x85, "MY_PAINT")

	;Save composite image
	Local $sNewName = $Icons & "460x215\SS_Values\" & $Check_Filename
	Local $NewIcon_Path = $sNewName
	_GDIPlus_ImageSaveToFile($hBMPBuff, $NewIcon_Path)

	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()

	_Quit_SS_Image_2_Image()
EndFunc

Func _Quit_SS_Image_2_Image()
	If FileExists(@ScriptDir & "\Icon_NR_Background" & ".jpg") Then FileDelete(@ScriptDir & "\Icon_NR_Background" & ".jpg")
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()
EndFunc

Func _Get_SteamGame_Icon_32x32()
	Global $Check_AppId = $appid
	If $Check_AppId <> "" Then
		Local $URL = "https://steamdb.info/app/" & $appid & "/info/"
		_INetGetSource($URL)
		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $URL, false)
			$WinHttpReq.Send()
			Local $Data = $WinHttpReq.ResponseText

			Local $iPosition_1 = StringInStr($Data, 'clienttga</td>', $STR_CASESENSE, 1, 1000)
			Local $iPosition_2 = StringInStr($Data, '.jpg" rel="nofollow">', $STR_CASESENSE, 1, 1000)
			Local $iPosition_3 = $iPosition_2 - $iPosition_1
			Local $sString = StringMid($Data, $iPosition_1, $iPosition_3)

			Local $iPosition_1_2 = StringInStr($sString, '<td class="span3">icon</td>', $STR_CASESENSE, 1, 1)
			Local $iPosition_2_2 = StringLen($sString) + 1
			Local $iPosition_3_2 = $iPosition_2_2 - $iPosition_1_2
			Local $sString_2 = StringMid($sString, $iPosition_1_2, $iPosition_3_2)

			Global $HTML_IconLink = StringReplace($sString_2, '<td class="span3">icon</td>', '')
			$HTML_IconLink = StringReplace($HTML_IconLink, '<td><a href="', '')

			If $HTML_IconLink <> "" Then
				Local $URL = $HTML_IconLink & ".jpg"
				Local $Download = InetGet($URL, $Icons & "32x32\" & "steam.app." & $appid & ".jpg", 16, 0)
				If $Download = 0 Then FileCopy($Icons & "32x32\" & "default.bmp", $Icons & "32x32\" & "steam.app." & $appid & ".bmp", $FC_OVERWRITE)
				If $Download <> 0 Then _Convert_Icon_32x32()
				FileDelete($Icons & "32x32\" & "steam.app." & $appid & ".jpg")
			EndIf

			Local $ImageList_Icon = $Icons & "32x32\" & "steam.app." & $appid & ".bmp"
			If Not FileExists($ImageList_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.jpg", $ImageList_Icon)
			EndIf
		Else
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Get_SteamGame_Icon_32x32]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
		EndIf
	EndIf
EndFunc

Func _Get_SteamGame_Icon_256x256()
	Global $Check_AppId = $appid
	If $Check_AppId <> "" Then
		Global $Steam_AppId = $appid
		Local $URL = "https://steamdb.info/app/" & $appid & "/info/"
		_INetGetSource($URL)
		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $URL, false)
			$WinHttpReq.Send()
			Local $Data = $WinHttpReq.ResponseText

			Local $iPosition_1 = StringInStr($Data, 'clienticon</td>')
			Local $iPosition_2 = StringInStr($Data, '.ico" rel="nofollow')
			Local $iPosition_3 = $iPosition_2 - $iPosition_1

			Local $sString = StringMid($Data, $iPosition_1, $iPosition_3)

			Global $HTML_IconLink = StringReplace($sString, 'clienticon</td>', '')
			$HTML_IconLink = StringReplace($HTML_IconLink, '<td><a href="', '')

			If $HTML_IconLink <> "" Then
				Local $URL = $HTML_IconLink & ".ico"
				InetGet($URL, $Icons & "256x256\" & "steam.app." & $Steam_AppId & ".ico", 16, 0)
			EndIf
		Else
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Get_SteamGame_Icon_256x256]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
		EndIf
	EndIf
EndFunc

Func _Convert_Icon_32x32()
	Global $Check_AppId = $appid
	_GDIPlus_Startup()
	Local $sFile = $Icons & "32x32\" & "steam.app." & $Check_AppId & ".jpg"
    If @error Or Not FileExists($sFile) Then Return
    Local $hImage = _GDIPlus_ImageLoadFromFile($sFile)
    Local $iWidth = 600
    Local $iHeight = _GDIPlus_ImageGetHeight($hImage) * 600 / _GDIPlus_ImageGetWidth($hImage)
    Local $tPalette = _GDIPlus_PaletteInitialize(16, $GDIP_PaletteTypeFixedHalftone27, 16, False, $hImage)
    _GDIPlus_BitmapConvertFormat($hImage, "", $GDIP_DitherTypeDualSpiral8x8, $GDIP_PaletteTypeFixedHalftone27, $tPalette)
	_GDIPlus_ImageSaveToFile($hImage, $Icons & "32x32\" & "steam.app." & $Check_AppId & ".bmp")
    _GDIPlus_ImageDispose($hImage)
    _GDIPlus_Shutdown()
EndFunc

Func _Download_Icon_for_SteamGameID()
	Local $Application_appid = $appid
	Local $Download_Icon_path_1_jpg = $Icons & "steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_2_jpg = $Icons & "460x215\steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_3_jpg = $Icon_Folder_1 & "steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_4_jpg = $Icon_Folder_2 & "steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_5_jpg = $Icon_Folder_3 & "steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_6_jpg = $Icon_Folder_4 & "steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_7_jpg = $Icon_Folder_5 & "steam.app." & $Application_appid & ".jpg"

	Local $URL = "http://cdn.akamai.steamstatic.com/steam/apps/" & $Application_appid & "/header.jpg"

	If $Application_appid <> "" Then
		If FileExists($Download_Icon_path_1_jpg) Then FileDelete($Download_Icon_path_1_jpg)
		If Not FileExists($Download_Icon_path_1_jpg) Then InetGet($URL, $Download_Icon_path_1_jpg, 16, 0)
		If Not FileExists($Download_Icon_path_1_jpg) Then FileCopy($gfx & "Icon_Preview.jpg", $Download_Icon_path_1_jpg)
		If Not FileExists($Download_Icon_path_2_jpg) Then InetGet($URL, $Download_Icon_path_2_jpg, 16, 0)
		If Not FileExists($Download_Icon_path_2_jpg) Then FileCopy($gfx & "Icon_Preview.jpg", $Download_Icon_path_2_jpg)
	EndIf
EndFunc

Func _Sync_Icons()
	Local $FileList = _FileListToArray($Icons & "460x215\" , "*.jpg" , 1)
	For $LOOP_1 = 1 To $FileList[0]
		For $LOOP_2 = 1 To 5
			Local $Icon_Folder_Sync = IniRead($Config_INI, "Folders", "Icon_Folder_" & $LOOP_2, "")
			If $Icon_Folder_Sync <> "" Then
				If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icon_Folder_Sync & $FileList[$LOOP_1])
				If FileExists($Icons & "460x215\SS_Values\" & $FileList[$LOOP_1]) Then FileCopy($Icons & "460x215\SS_Values\" & $FileList[$LOOP_1], $Icon_Folder_Sync & $FileList[$LOOP_1], $FC_OVERWRITE + $FC_CREATEPATH)
				If Not FileExists($Icons & "460x215\SS_Values\" & $FileList[$LOOP_1]) Then FileCopy($Icons & "460x215\" & $FileList[$LOOP_1], $Icon_Folder_Sync & $FileList[$LOOP_1], $FC_OVERWRITE + $FC_CREATEPATH)
				If Not FileExists($Icons & "460x215\" & $FileList[$LOOP_1]) Then FileCopy($Icons & $FileList[$LOOP_1], $Icon_Folder_Sync & $FileList[$LOOP_1], $FC_OVERWRITE + $FC_CREATEPATH)
				If Not FileExists($Icon_Folder_Sync & $FileList[$LOOP_1]) Then FileCopy($gfx & "Icon_Preview.jpg", $Icon_Folder_Sync & $FileList[$LOOP_1])
			EndIf
		Next
	Next
EndFunc

#endregion

#Region Func MAIN GUI
Func _Create_ListView_1()
	$listview = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview, "NR", 60)
	_GUICtrlListView_AddColumn($listview, "App ID", 105)
	_GUICtrlListView_AddColumn($listview, "Name", 320)
	_GUICtrlListView_AddColumn($listview, "Online", 78, 2)
	_GUICtrlListView_AddColumn($listview, "24h peak", 100, 2)
	_GUICtrlListView_AddColumn($listview, "Res. Scale", 116, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenu("Resolution Scale", $contextmenu)
		$RM_Item_RS_0 = GUICtrlCreateMenuItem("Customize", $RM_Item5)
		GUICtrlCreateMenuItem("", $RM_Item5)
		$RM_Item_RS_1 = GUICtrlCreateMenuItem("40%", $RM_Item5)
		$RM_Item_RS_2 = GUICtrlCreateMenuItem("60%", $RM_Item5)
		$RM_Item_RS_3 = GUICtrlCreateMenuItem("80%", $RM_Item5)
		$RM_Item_RS_4 = GUICtrlCreateMenuItem("100%", $RM_Item5)
		$RM_Item_RS_5 = GUICtrlCreateMenuItem("120%", $RM_Item5)
		$RM_Item_RS_6 = GUICtrlCreateMenuItem("140%", $RM_Item5)
		$RM_Item_RS_7 = GUICtrlCreateMenuItem("160%", $RM_Item5)
		$RM_Item_RS_8 = GUICtrlCreateMenuItem("180%", $RM_Item5)
		$RM_Item_RS_9 = GUICtrlCreateMenuItem("200%", $RM_Item5)
		$RM_Item_RS_10 = GUICtrlCreateMenuItem("220%", $RM_Item5)
		$RM_Item_RS_11 = GUICtrlCreateMenuItem("240%", $RM_Item5)
		$RM_Item_RS_12 = GUICtrlCreateMenuItem("260%", $RM_Item5)
		$RM_Item_RS_13 = GUICtrlCreateMenuItem("280%", $RM_Item5)
		$RM_Item_RS_14 = GUICtrlCreateMenuItem("300%", $RM_Item5)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5_1 = GUICtrlCreateMenuItem("Add to Autostart List", $contextmenu)
	$RM_Item5_2 = GUICtrlCreateMenuItem("Remove from Autostart List", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_SS_GUI")

	GUICtrlSetOnEvent($RM_Item_RS_0, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item_RS_1, "_RM_Item_RS_1")
	GUICtrlSetOnEvent($RM_Item_RS_2, "_RM_Item_RS_2")
	GUICtrlSetOnEvent($RM_Item_RS_3, "_RM_Item_RS_3")
	GUICtrlSetOnEvent($RM_Item_RS_4, "_RM_Item_RS_4")
	GUICtrlSetOnEvent($RM_Item_RS_5, "_RM_Item_RS_5")
	GUICtrlSetOnEvent($RM_Item_RS_6, "_RM_Item_RS_6")
	GUICtrlSetOnEvent($RM_Item_RS_7, "_RM_Item_RS_7")
	GUICtrlSetOnEvent($RM_Item_RS_8, "_RM_Item_RS_8")
	GUICtrlSetOnEvent($RM_Item_RS_9, "_RM_Item_RS_9")
	GUICtrlSetOnEvent($RM_Item_RS_10, "_RM_Item_RS_10")
	GUICtrlSetOnEvent($RM_Item_RS_11, "_RM_Item_RS_11")
	GUICtrlSetOnEvent($RM_Item_RS_12, "_RM_Item_RS_12")
	GUICtrlSetOnEvent($RM_Item_RS_13, "_RM_Item_RS_13")
	GUICtrlSetOnEvent($RM_Item_RS_14, "_RM_Item_RS_14")



	GUICtrlSetOnEvent($RM_Item5_1, "_RM_Menu_Item_5_1")
	GUICtrlSetOnEvent($RM_Item5_2, "_RM_Menu_Item_5_2")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc

Func _Create_ListView_2()
	$listview_2 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_2, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_2, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_2 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_2, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_2, "NR", 60)
	_GUICtrlListView_AddColumn($listview_2, "App ID", 105)
	_GUICtrlListView_AddColumn($listview_2, "Name", 320)
	_GUICtrlListView_AddColumn($listview_2, "Online", 78, 2)
	_GUICtrlListView_AddColumn($listview_2, "24h peak", 100, 2)
	_GUICtrlListView_AddColumn($listview_2, "Res. Scale", 116, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_2)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenu("Resolution Scale", $contextmenu)
		$RM_Item_RS_1 = GUICtrlCreateMenuItem("40%", $RM_Item5)
		$RM_Item_RS_2 = GUICtrlCreateMenuItem("60%", $RM_Item5)
		$RM_Item_RS_3 = GUICtrlCreateMenuItem("80%", $RM_Item5)
		$RM_Item_RS_4 = GUICtrlCreateMenuItem("100%", $RM_Item5)
		$RM_Item_RS_5 = GUICtrlCreateMenuItem("120%", $RM_Item5)
		$RM_Item_RS_6 = GUICtrlCreateMenuItem("140%", $RM_Item5)
		$RM_Item_RS_7 = GUICtrlCreateMenuItem("160%", $RM_Item5)
		$RM_Item_RS_8 = GUICtrlCreateMenuItem("180%", $RM_Item5)
		$RM_Item_RS_9 = GUICtrlCreateMenuItem("200%", $RM_Item5)
		$RM_Item_RS_10 = GUICtrlCreateMenuItem("220%", $RM_Item5)
		$RM_Item_RS_11 = GUICtrlCreateMenuItem("240%", $RM_Item5)
		$RM_Item_RS_12 = GUICtrlCreateMenuItem("260%", $RM_Item5)
		$RM_Item_RS_13 = GUICtrlCreateMenuItem("280%", $RM_Item5)
		$RM_Item_RS_14 = GUICtrlCreateMenuItem("300%", $RM_Item5)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5_1 = GUICtrlCreateMenuItem("Add to Autostart List", $contextmenu)
	$RM_Item5_2 = GUICtrlCreateMenuItem("Remove from Autostart List", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5_1, "_RM_Menu_Item_5_1")
	GUICtrlSetOnEvent($RM_Item5_2, "_RM_Menu_Item_5_2")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc

Func _Create_ListView_3()
	$listview_3 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_3, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_3, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_3 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_3, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_3, "NR", 60)
	_GUICtrlListView_AddColumn($listview_3, "App ID", 105)
	_GUICtrlListView_AddColumn($listview_3, "Name", 320)
	_GUICtrlListView_AddColumn($listview_3, "Online", 78, 2)
	_GUICtrlListView_AddColumn($listview_3, "24h peak", 100, 2)
	_GUICtrlListView_AddColumn($listview_3, "Res. Scale", 116, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_3)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenu("Resolution Scale", $contextmenu)
		$RM_Item_RS_1 = GUICtrlCreateMenuItem("40%", $RM_Item5)
		$RM_Item_RS_2 = GUICtrlCreateMenuItem("60%", $RM_Item5)
		$RM_Item_RS_3 = GUICtrlCreateMenuItem("80%", $RM_Item5)
		$RM_Item_RS_4 = GUICtrlCreateMenuItem("100%", $RM_Item5)
		$RM_Item_RS_5 = GUICtrlCreateMenuItem("120%", $RM_Item5)
		$RM_Item_RS_6 = GUICtrlCreateMenuItem("140%", $RM_Item5)
		$RM_Item_RS_7 = GUICtrlCreateMenuItem("160%", $RM_Item5)
		$RM_Item_RS_8 = GUICtrlCreateMenuItem("180%", $RM_Item5)
		$RM_Item_RS_9 = GUICtrlCreateMenuItem("200%", $RM_Item5)
		$RM_Item_RS_10 = GUICtrlCreateMenuItem("220%", $RM_Item5)
		$RM_Item_RS_11 = GUICtrlCreateMenuItem("240%", $RM_Item5)
		$RM_Item_RS_12 = GUICtrlCreateMenuItem("260%", $RM_Item5)
		$RM_Item_RS_13 = GUICtrlCreateMenuItem("280%", $RM_Item5)
		$RM_Item_RS_14 = GUICtrlCreateMenuItem("300%", $RM_Item5)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5_1 = GUICtrlCreateMenuItem("Add to Autostart List", $contextmenu)
	$RM_Item5_2 = GUICtrlCreateMenuItem("Remove from Autostart List", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5_1, "_RM_Menu_Item_5_1")
	GUICtrlSetOnEvent($RM_Item5_2, "_RM_Menu_Item_5_2")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc

Func _Create_ListView_4()
	$listview_4 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_4, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_4, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_4 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_4, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_4, "NR", 60)
	_GUICtrlListView_AddColumn($listview_4, "App ID", 105)
	_GUICtrlListView_AddColumn($listview_4, "Name", 320)
	_GUICtrlListView_AddColumn($listview_4, "Online", 78, 2)
	_GUICtrlListView_AddColumn($listview_4, "24h peak", 100, 2)
	_GUICtrlListView_AddColumn($listview_4, "Res. Scale", 116, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_4)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenu("Resolution Scale", $contextmenu)
		$RM_Item_RS_1 = GUICtrlCreateMenuItem("40%", $RM_Item5)
		$RM_Item_RS_2 = GUICtrlCreateMenuItem("60%", $RM_Item5)
		$RM_Item_RS_3 = GUICtrlCreateMenuItem("80%", $RM_Item5)
		$RM_Item_RS_4 = GUICtrlCreateMenuItem("100%", $RM_Item5)
		$RM_Item_RS_5 = GUICtrlCreateMenuItem("120%", $RM_Item5)
		$RM_Item_RS_6 = GUICtrlCreateMenuItem("140%", $RM_Item5)
		$RM_Item_RS_7 = GUICtrlCreateMenuItem("160%", $RM_Item5)
		$RM_Item_RS_8 = GUICtrlCreateMenuItem("180%", $RM_Item5)
		$RM_Item_RS_9 = GUICtrlCreateMenuItem("200%", $RM_Item5)
		$RM_Item_RS_10 = GUICtrlCreateMenuItem("220%", $RM_Item5)
		$RM_Item_RS_11 = GUICtrlCreateMenuItem("240%", $RM_Item5)
		$RM_Item_RS_12 = GUICtrlCreateMenuItem("260%", $RM_Item5)
		$RM_Item_RS_13 = GUICtrlCreateMenuItem("280%", $RM_Item5)
		$RM_Item_RS_14 = GUICtrlCreateMenuItem("300%", $RM_Item5)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5_1 = GUICtrlCreateMenuItem("Add to Autostart List", $contextmenu)
	$RM_Item5_2 = GUICtrlCreateMenuItem("Remove from Autostart List", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5_1, "_RM_Menu_Item_5_1")
	GUICtrlSetOnEvent($RM_Item5_2, "_RM_Menu_Item_5_2")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc

Func _Create_ListView_5()
	$listview_5 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_5, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_5, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_5 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_5, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_5, "NR", 60)
	_GUICtrlListView_AddColumn($listview_5, "App ID", 105)
	_GUICtrlListView_AddColumn($listview_5, "Name", 320)
	_GUICtrlListView_AddColumn($listview_5, "Online", 78, 2)
	_GUICtrlListView_AddColumn($listview_5, "24h peak", 100, 2)
	_GUICtrlListView_AddColumn($listview_5, "Res. Scale", 116, 2)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	$contextmenu = GUICtrlCreateContextMenu($listview_5)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenu("Resolution Scale", $contextmenu)
		$RM_Item_RS_1 = GUICtrlCreateMenuItem("40%", $RM_Item5)
		$RM_Item_RS_2 = GUICtrlCreateMenuItem("60%", $RM_Item5)
		$RM_Item_RS_3 = GUICtrlCreateMenuItem("80%", $RM_Item5)
		$RM_Item_RS_4 = GUICtrlCreateMenuItem("100%", $RM_Item5)
		$RM_Item_RS_5 = GUICtrlCreateMenuItem("120%", $RM_Item5)
		$RM_Item_RS_6 = GUICtrlCreateMenuItem("140%", $RM_Item5)
		$RM_Item_RS_7 = GUICtrlCreateMenuItem("160%", $RM_Item5)
		$RM_Item_RS_8 = GUICtrlCreateMenuItem("180%", $RM_Item5)
		$RM_Item_RS_9 = GUICtrlCreateMenuItem("200%", $RM_Item5)
		$RM_Item_RS_10 = GUICtrlCreateMenuItem("220%", $RM_Item5)
		$RM_Item_RS_11 = GUICtrlCreateMenuItem("240%", $RM_Item5)
		$RM_Item_RS_12 = GUICtrlCreateMenuItem("260%", $RM_Item5)
		$RM_Item_RS_13 = GUICtrlCreateMenuItem("280%", $RM_Item5)
		$RM_Item_RS_14 = GUICtrlCreateMenuItem("300%", $RM_Item5)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5_1 = GUICtrlCreateMenuItem("Add to Autostart List", $contextmenu)
	$RM_Item5_2 = GUICtrlCreateMenuItem("Remove from Autostart List", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5_1, "_RM_Menu_Item_5_1")
	GUICtrlSetOnEvent($RM_Item5_2, "_RM_Menu_Item_5_2")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc

Func _Create_ListView_6()
	$listview_6 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_6, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_6, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_6 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_6, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_6, "NR", 60)
	_GUICtrlListView_AddColumn($listview_6, "App ID", 105)
	_GUICtrlListView_AddColumn($listview_6, "Name", 320)
	_GUICtrlListView_AddColumn($listview_6, "Online", 78, 2)
	_GUICtrlListView_AddColumn($listview_6, "24h peak", 100, 2)
	_GUICtrlListView_AddColumn($listview_6, "Res. Scale", 116, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_6)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenu("Resolution Scale", $contextmenu)
		$RM_Item_RS_1 = GUICtrlCreateMenuItem("40%", $RM_Item5)
		$RM_Item_RS_2 = GUICtrlCreateMenuItem("60%", $RM_Item5)
		$RM_Item_RS_3 = GUICtrlCreateMenuItem("80%", $RM_Item5)
		$RM_Item_RS_4 = GUICtrlCreateMenuItem("100%", $RM_Item5)
		$RM_Item_RS_5 = GUICtrlCreateMenuItem("120%", $RM_Item5)
		$RM_Item_RS_6 = GUICtrlCreateMenuItem("140%", $RM_Item5)
		$RM_Item_RS_7 = GUICtrlCreateMenuItem("160%", $RM_Item5)
		$RM_Item_RS_8 = GUICtrlCreateMenuItem("180%", $RM_Item5)
		$RM_Item_RS_9 = GUICtrlCreateMenuItem("200%", $RM_Item5)
		$RM_Item_RS_10 = GUICtrlCreateMenuItem("220%", $RM_Item5)
		$RM_Item_RS_11 = GUICtrlCreateMenuItem("240%", $RM_Item5)
		$RM_Item_RS_12 = GUICtrlCreateMenuItem("260%", $RM_Item5)
		$RM_Item_RS_13 = GUICtrlCreateMenuItem("280%", $RM_Item5)
		$RM_Item_RS_14 = GUICtrlCreateMenuItem("300%", $RM_Item5)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5_1 = GUICtrlCreateMenuItem("Add to Autostart List", $contextmenu)
	$RM_Item5_2 = GUICtrlCreateMenuItem("Remove from Autostart List", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5_1, "_RM_Menu_Item_5_1")
	GUICtrlSetOnEvent($RM_Item5_2, "_RM_Menu_Item_5_2")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc

Func _Read_from_INI_ADD_2_ListView()
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6

	$ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "1" Then $ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "2" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_2
	If $ButtonTAB_State = "3" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_3
	If $ButtonTAB_State = "4" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_4
	If $ButtonTAB_State = "5" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_5
	If $ButtonTAB_State = "6" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_6

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	_GUICtrlListView_BeginUpdate($listview_Temp)
	_GUICtrlListView_DeleteAllItems($listview_Temp)
	For $NR = 0 To $NR_Applications + 1
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "appid", "")
		Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "name", "")
		Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "installdir", "")
		Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "IconPath", "")
		Global $Application_right_now = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "right_now", "")
		Global $Application_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "24h_peak", "")
		Global $Application_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "all_time_peak", "")
		Global $Application_resolutionScale = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "resolutionScale", "")
		If $Application_resolutionScale <> "" Then $Application_resolutionScale = $Application_resolutionScale & "%"

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR; - 1

			Local $ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"

			If Not FileExists($ImageList_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon)
			EndIf

			Local $ListView_Icon = $ImageList_Icon
			_GUIImageList_AddBitmap($ListView_ImageList_Temp, $ListView_Icon)
			_GUICtrlListView_SetImageList($listview_Temp, $ListView_ImageList_Temp, 1)
			_GUICtrlListView_AddItem($listview_Temp, "", $Application_NR)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_appid, 1)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_name, 2)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_right_now, 3)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_24h_peak, 4)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_resolutionScale, 5)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_Temp)

	For $NR2 = 0 To $NR_Applications - 1
		Local $Application_appid_last = IniRead($ApplicationList_TEMP, "Application_" & $NR2 + 1, "appid", "")
		If $Application_appid_last <> "" Then
			$ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_last & ".bmp"
			If Not FileExists($ListView_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ListView_Icon)
			EndIf
		EndIf
		_GUICtrlListView_SetItemImage($listview_Temp, $NR2, $NR2)
	Next

	_GUICtrlListView_EndUpdate($listview_Temp)
	_GUICtrlStatusBar_SetText($Statusbar, "Application added to other section" & @TAB & @TAB & "'Version " & $Version & "'")
EndFunc

Func _Update_ListView_Icons()
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')
	_GUICtrlListView_BeginUpdate($ListView)
	_GUICtrlListView_DeleteAllItems($ListView)

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6

	$ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "1" Then $ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "2" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_2
	If $ButtonTAB_State = "3" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_3
	If $ButtonTAB_State = "4" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_4
	If $ButtonTAB_State = "5" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_5
	If $ButtonTAB_State = "6" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_6

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	_GUICtrlListView_BeginUpdate($listview_Temp)
	_GUICtrlListView_DeleteAllItems($listview_Temp)
	For $NR = 0 To $NR_Applications - 1
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "appid", "")
		Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "name", "")
		Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "installdir", "")
		Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "IconPath", "")
		Global $Application_right_now = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "right_now", "")
		Global $Application_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "24h_peak", "")
		Global $Application_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "all_time_peak", "")
		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR
			Local $ImageList_Icon_new = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"

			If Not FileExists($ImageList_Icon_new) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon_new)
			EndIf

			Local $ListView_Icon = $ImageList_Icon_new
			_GUIImageList_AddBitmap($ListView_ImageList_Temp, $ListView_Icon)
			_GUICtrlListView_SetImageList($listview_Temp, $ListView_ImageList_Temp, 1)
			_GUICtrlListView_AddItem($listview_Temp, "", $Application_NR)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_appid, 1)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_name, 2)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_installdir, 3)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_right_now, 4)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_Temp)
EndFunc

Func _ADD_Icons_32x32_to_ListView()
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')
	_GUICtrlListView_BeginUpdate($ListView)
	_GUICtrlListView_DeleteAllItems($ListView)

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	For $NR = 0 To $NR_Applications - 1
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "appid", "")

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR; - 1

			Local $ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"

			If Not FileExists($ImageList_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon)
			EndIf

			Local $ListView_Icon = $ImageList_Icon
			_GUIImageList_AddBitmap($ListView_Favorite_Image, $ListView_Icon)
			_GUICtrlListView_SetImageList($ListView, $ListView_Favorite_Image, 1)
		EndIf
	Next

	For $NR2 = 0 To $NR_Applications - 1
		Local $Application_appid_last = IniRead($ApplicationList_TEMP, "Application_" & $NR2 + 1, "appid", "")
		If $Application_appid_last <> "" Then
			$ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_last & ".bmp"
			If Not FileExists($ListView_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ListView_Icon)
			EndIf
		EndIf
		_GUICtrlListView_SetItemImage($listview, $NR2, $NR2)
	Next
	_GUICtrlListView_EndUpdate($ListView)
EndFunc

#Region Func RM_Menu
Func _RM_Item_RS_1() ; Resolution Scale 40%
	$ResolutionScale_TEMP = "40"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_2() ; Resolution Scale 60%
	$ResolutionScale_TEMP = "60"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_3() ; Resolution Scale 80%
	$ResolutionScale_TEMP = "80"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_4() ; Resolution Scale 100%
	$ResolutionScale_TEMP = "100"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_5() ; Resolution Scale 120%
	$ResolutionScale_TEMP = "120"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_6() ; Resolution Scale 140%
	$ResolutionScale_TEMP = "140"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_7() ; Resolution Scale 160%
	$ResolutionScale_TEMP = "160"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_8() ; Resolution Scale 180%
	$ResolutionScale_TEMP = "180"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_9() ; Resolution Scale 200%
	$ResolutionScale_TEMP = "200"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_10() ; Resolution Scale 220%
	$ResolutionScale_TEMP = "220"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_11() ; Resolution Scale 240%
	$ResolutionScale_TEMP = "240"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_12() ; Resolution Scale 260%
	$ResolutionScale_TEMP = "260"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_13() ; Resolution Scale 280%
	$ResolutionScale_TEMP = "280"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Item_RS_14() ; Resolution Scale 300%
	$ResolutionScale_TEMP = "300"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc

Func _RM_Menu_Item_5_1() ; Add to Autostart List
	$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
	Local  $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppID = _GUICtrlListView_GetItemText($ListView, $ListView_Selected_Row_Nr - 1, 1)
	Local $Check_AppName = IniRead($ApplicationList_TEMP, "Application_" & $Check_AppID, "name", "")
	Local $Check_AppStartPath = "steam://rungameid/" & $Check_AppID

	If $Check_AppID <> "" Then
		For $LOOP = 1 To 9
		Local $Autostart_App_Name = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_Name", "")
		Local $Autostart_App_Path = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_Path", "")
		Local $Autostart_App_State = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_State", "")

		If $Autostart_App_Name = "" Then
			$Autostart_App_Name = IniWrite($Config_INI, "Autostart", "App_" & $LOOP & "_Name", $Check_AppName)
			$Autostart_App_Path = IniWrite($Config_INI, "Autostart", "App_" & $LOOP & "_Path", $Check_AppStartPath)
			$Autostart_App_State = IniWrite($Config_INI, "Autostart", "App_" & $LOOP & "_State", "false")
			ExitLoop
		EndIf
	Next
	EndIf
EndFunc

Func _RM_Menu_Item_5_2() ; Remove to Autostart List
	$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
	Local  $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppID = _GUICtrlListView_GetItemText($ListView, $ListView_Selected_Row_Nr - 1, 1)
	Local $Check_AppName = IniRead($ApplicationList_TEMP, "Application_" & $Check_AppID, "name", "")
	Local $Check_AppStartPath = "steam://rungameid/" & $Check_AppID

	If $Check_AppID <> "" Then
		For $LOOP = 1 To 9
		Local $Autostart_App_Name = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_Name", "")
		Local $Autostart_App_Path = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_Path", "")
		Local $Autostart_App_State = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_State", "")

		If $Check_AppName = $Autostart_App_Name Then
			$Autostart_App_Name = IniWrite($Config_INI, "Autostart", "App_" & $LOOP & "_Name", "")
			$Autostart_App_Path = IniWrite($Config_INI, "Autostart", "App_" & $LOOP & "_Path", "")
			$Autostart_App_State = IniWrite($Config_INI, "Autostart", "App_" & $LOOP & "_State", "false")
			ExitLoop
		EndIf
	Next
	EndIf
EndFunc

Func _RM_Menu_Item_8() ; RM_UP
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_Temp)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_Temp, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	Local $GameNR = $ListView_Selected_Row_Nr

	Local $GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	Local $GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	Local $GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	Local $GetItem_Playtime_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "Playtime", "")
	Local $GetItem_renderTargetMultiplier_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
	Local $GetItem_supersampleScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", "")
	Local $GetItem_allowSupersampleFiltering_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

	Local $GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "NR", "")
	Local $GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "name", "")
	Local $GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "appid", "")
	Local $GetItem_Playtime_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "Playtime", "")
	Local $GetItem_renderTargetMultiplier_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "renderTargetMultiplier", "")
	Local $GetItem_supersampleScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "supersampleScale", "")
	Local $GetItem_allowSupersampleFiltering_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "allowSupersampleFiltering", "")

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "Playtime", $GetItem_Playtime_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "Playtime", $GetItem_Playtime_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "supersampleScale", $GetItem_supersampleScale_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_2)

	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _RM_Menu_Item_9() ; RM_DOWN
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_Temp)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_Temp, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	Local $GameNR = $ListView_Selected_Row_Nr

	Local $GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	Local $GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	Local $GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	Local $GetItem_Playtime_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "Playtime", "")
	Local $GetItem_renderTargetMultiplier_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
	Local $GetItem_supersampleScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", "")
	Local $GetItem_allowSupersampleFiltering_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

	Local $GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "NR", "")
	Local $GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "name", "")
	Local $GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "appid", "")
	Local $GetItem_Playtime_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "Playtime", "")
	Local $GetItem_renderTargetMultiplier_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "renderTargetMultiplier", "")
	Local $GetItem_supersampleScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "supersampleScale", "")
	Local $GetItem_allowSupersampleFiltering_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "allowSupersampleFiltering", "")

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "Playtime", $GetItem_Playtime_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "Playtime", $GetItem_Playtime_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "supersampleScale", $GetItem_supersampleScale_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_2)

	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _RM_Menu_Item11() ; Delete ListView item
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_Temp)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	Local $GameNR = $ListView_Selected_Row_Nr
	Local $GameNR_next = $ListView_Selected_Row_Nr + 1
	Local $GetItem_appid_delete = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")

	Local $ApplicationList_NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	Local $GetItem_NR_1 = ""
	Local $GetItem_appid_1 = ""
	Local $GetItem_name_1 = ""
	Local $GetItem_installdir_1 = ""
	Local $GetItem_IconPath_1 = ""
	Local $GetItem_right_now_1 = ""
	Local $GetItem_24h_peak_1 = ""
	Local $GetItem_all_time_peak_1 = ""
	Local $GetItem_renderTargetMultiplier_1 = ""
	Local $GetItem_supersampleScale_1 = ""
	Local $GetItem_allowSupersampleFiltering_1 = ""

	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "installdir", $GetItem_installdir_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "IconPath", $GetItem_IconPath_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "right_now", $GetItem_right_now_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "24h_peak", $GetItem_24h_peak_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "all_time_peak", $GetItem_all_time_peak_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($ApplicationList_TEMP, "ApplicationList", "NR_Applications", $ApplicationList_NR_Applications - 1)

	For $Loop_Temp = $GameNR_next To $ApplicationList_NR_Applications
		Local $GameName_before = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "name", "")
		Local $GameName_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "name", "")
		If $GameName_next <> "" Then
			Local $GetItem_NR_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "NR", "")
			Local $GetItem_appid_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "appid", "")
			Local $GetItem_name_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "name", "")
			Local $GetItem_installdir_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "installdir", "")
			Local $GetItem_IconPath_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "IconPath", "")
			Local $GetItem_right_now_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "right_now", "")
			Local $GetItem_24h_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "24h_peak", "")
			Local $GetItem_all_time_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "all_time_peak", "")
			$GetItem_24h_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "24h_peak", "")
			Local $GetItem_renderTargetMultiplier_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "renderTargetMultiplier", "")
			Local $GetItem_supersampleScale_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "supersampleScale", "")
			Local $GetItem_allowSupersampleFiltering_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "allowSupersampleFiltering", "")

			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "NR", $Loop_Temp - 1)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "appid", $GetItem_appid_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "name", $GetItem_name_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "installdir", $GetItem_installdir_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "IconPath", $GetItem_IconPath_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "right_now", $GetItem_right_now_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "24h_peak", $GetItem_24h_peak_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "all_time_peak", $GetItem_24h_peak_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "supersampleScale", $GetItem_supersampleScale_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_next)
		EndIf
		If $Loop_Temp = $ApplicationList_NR_Applications Then
			IniDelete($ApplicationList_TEMP, "Application_" & $GetItem_appid_delete)
			IniDelete($ApplicationList_TEMP, "Application_" & $Loop_Temp)
		EndIf
	Next
	_Update_ListView_Icons()
	_Read_from_INI_ADD_2_ListView()
EndFunc
#endregion

Func _ClickOnListView($hWndGUI, $MsgID, $wParam, $lParam)
    Local $tagNMHDR, $event, $hwndFrom, $code
    $tagNMHDR = DllStructCreate("int;int;int", $lParam)
    If @error Then Return
    $event = DllStructGetData($tagNMHDR, 3)
    If $wParam = $ListView Then
        If $event = $NM_CLICK Then
			_Change_Preview_Icon_ListView()
			If WinExists("Resolution Scale Menu") Then _Update_VRSettings_GUI_Items()
			_Update_StatusBar()
        EndIf

        If $event = $NM_DBLCLK Then
			_DB_Click_Listview()
        EndIf
    EndIf

    $tagNMHDR = 0
    $event = 0
    $lParam = 0
EndFunc

Func _DB_Click_Listview()
	Sleep(200)
	_Start_ListView_Selected()
	Sleep(200)
EndFunc

Func _Change_Preview_Icon_ListView()
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	Local  $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppID = _GUICtrlListView_GetItemText($ListView, $ListView_Selected_Row_Nr - 1, 1)
	Local $CheckImagePath = $Icons & "steam.app." & $Check_AppID & ".jpg"

	$CheckImagePath = $Icons & "460x215\SS_Values\steam.app." & $Check_AppID & ".jpg"
	If Not FileExists($CheckImagePath) Then $CheckImagePath = $Icons & "460x215\steam.app." & $Check_AppID & ".jpg"
	If Not FileExists($CheckImagePath) Then $CheckImagePath = $Icons & "steam.app." & $Check_AppID & ".jpg"

	If Not FileExists($CheckImagePath) Then
		If $ButtonTAB_State = 1 Then
			$CheckImagePath = $Icons & "steam.app." & $Check_AppID & ".jpg"
		EndIf

		If $ButtonTAB_State = 2 Then
			$CheckImagePath = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Check_AppID, "IconPath", "")
		EndIf

		If $ButtonTAB_State = 3 Then
			$CheckImagePath = IniRead($ApplicationList_Custom_1_INI, "Application_" & $Check_AppID, "IconPath", "")
		EndIf

		If $ButtonTAB_State = 4 Then
			$CheckImagePath = IniRead($ApplicationList_Custom_2_INI, "Application_" & $Check_AppID, "IconPath", "")
		EndIf
	EndIf

	If $CheckImagePath = "" or $CheckImagePath = $Icons & "" & ".jpg" or Not FileExists($CheckImagePath) Then $CheckImagePath = $gfx & "Icon_Preview2.jpg"
	GUICtrlSetImage($Icon_Preview_Image, $CheckImagePath)
EndFunc

Func _Update_VRSettings_GUI_Items()
	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Steam_app_Name_RS = StringLeft($Steam_app_Name, 18)
	If StringLen($Steam_app_Name) > 18 Then $Steam_app_Name_RS = $Steam_app_Name_RS & "."
	Local $Game_ID = $ListView_Item_Array[2]

	Local $renderTargetMultiplier_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "renderTargetMultiplier", "1.0")
	Local $rTM_1 = StringLeft($renderTargetMultiplier_value, 1)
	Local $rTM_2 = StringRight($renderTargetMultiplier_value, 1)
	Local $rTM_value = $rTM_1 & $rTM_2
	Local $rTM_Input_value = $rTM_1 & "." & $rTM_2
	If $rTM_1 = "0" Then $rTM_value = $rTM_2
	If $rTM_1 = "0" Then $rTM_Input_value = "0." & $rTM_2
	Local $supersampleScale_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "supersampleScale", "1.0")
	Local $ssS_1 = StringLeft($supersampleScale_value, 1)
	Local $ssS_2 = StringRight($supersampleScale_value, 1)
	Local $ssS_value = $ssS_1 & $ssS_2
	Local $ssS_Input_value = $ssS_1 & "." & $ssS_2
	If $ssS_1 = "0" Then $ssS_value = $ssS_2
	If $ssS_1 = "0" Then $ssS_Input_value = "0." & $ssS_2
	Local $allowSupersampleFiltering_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "allowSupersampleFiltering", "true")
	If $allowSupersampleFiltering_value = "true" Then Local $aSsF_value = 0
	If $allowSupersampleFiltering_value = "false" Then Local $aSsF_value = 1

	Local $ResolutionScale_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "ResolutionScale", "100")

	GUICtrlSetData($ComboBox_3, "", "")
	GUICtrlSetData($ResolutionScale_Group, "Scale [%] for: " & $Steam_app_Name_RS)
	;GUICtrlSetData($VRSettings_Group, "VR Settings - " & $Steam_app_Name)
	GUICtrlSetData($Slider_0, $ResolutionScale_value)
	GUICtrlSetData($Input_ResolutionScale, $ResolutionScale_value)
	GUICtrlSetData($Slider_1, $rTM_value)
	GUICtrlSetData($Input_renderTargetMultiplier, $rTM_Input_value)
	GUICtrlSetData($Slider_2, $ssS_value)
	GUICtrlSetData($Input_supersampleScale, $ssS_Input_value)
	GUICtrlSetData($Slider_3, $aSsF_value)
	GUICtrlSetData($ComboBox_3, "true|false", $allowSupersampleFiltering_value)
EndFunc

Func _Create_HTMLView_GUI()
	Local $Button_Exit_HTML_GUI, $TreeView_Steam_app_PO_right_now, $TreeView_Steam_app_PO_24h_peak, $TreeView_Steam_app_PO_all_time_peak, $Text_SplitNR
	Local $Handle_2, $Text_2

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $oIE = ObjCreate("Shell.Explorer.2")
	If Not @error Then
		Global $HTML_GUI = GUICreate($Steam_app_Name & " - " & "steam.app." & $Game_ID, 980, 600, (@DesktopWidth - 980) / 2, (@DesktopHeight - 600) / 2, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
		GUICtrlCreateObj($oIE, 0, 0, 979, 550)

		Global $Button_Exit_HTML_GUI = GUICtrlCreateButton("Exit", 940, 560, 35, 35, $BS_BITMAP)
		GUICtrlSetOnEvent(- 1, "_Button_Exit_HTML_GUI")
		_GUICtrlButton_SetImage(- 1, $gfx & "Close_small.bmp")
		GuiCtrlSetTip(-1, "Closes HTML GUI.")

		Local $IE_Adresse = "https://steamdb.info/app/" & $Game_ID & "/graphs/"
		$oIE.navigate($IE_Adresse)

		GUISetState()
		$Game_ID = ""
	Else
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Create_HTMLView_GUI]: " & "ObjCreate 'Shell.Explorer.2'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
	EndIf
EndFunc

Func _Button_Exit_HTML_GUI()
	GUIDelete($HTML_GUI)
EndFunc

Func _Show_HTML_GamePage_GUI()
	Local $GamePage_URL = $Install_DIR & "WebPage\GamePage_ALL.html"
	If $ButtonTAB_State = "1" Then $GamePage_URL = $Install_DIR & "WebPage\GamePage_ALL.html"
	If $ButtonTAB_State = "2" Then $GamePage_URL = $Install_DIR & "WebPage\GamePage_Non-Steam_Appl.html"
	If $ButtonTAB_State = "3" Then $GamePage_URL = $Install_DIR & "WebPage\GamePage_Custom_1.html"
	If $ButtonTAB_State = "4" Then $GamePage_URL = $Install_DIR & "WebPage\GamePage_Custom_2.html"
	If $ButtonTAB_State = "5" Then $GamePage_URL = $Install_DIR & "WebPage\GamePage_Custom_3.html"
	If $ButtonTAB_State = "6" Then $GamePage_URL = $Install_DIR & "WebPage\GamePage_Custom_4.html"

	If FileExists($GamePage_URL) Then
		ShellExecute($GamePage_URL)
	Else
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Game Page missing.", "Game Page does not exist." & @CRLF & _
																		"'" & $GamePage_URL & "'" & @CRLF & @CRLF & _
																		"Create a new Game Page first using the 'Create Game Page' Button.")
	EndIf

EndFunc

Func _Checkbox_all()
	Local $CheckBox = GUICtrlRead($Checkbox_CreatePage)
	If $CheckBox = "" Then
		GUICtrlSetData($Checkbox_CreatePage, "a")
	Else
		GUICtrlSetData($Checkbox_CreatePage, "")
	EndIf
	_Checkbox_CheckUncheck()
EndFunc

Func _Checkbox_CheckUncheck()
	Local $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	If $ButtonTAB_State = "1" Then $listview_Temp = $ListView
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $ListView_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $ListView_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $ListView_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $ListView_6

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

	Local $Status_Checkbox = GUICtrlRead($Checkbox_CreatePage)

	If $Status_Checkbox = "a" Then
		_GUICtrlListView_SetItemChecked($listview_Temp, -1)
	EndIf

	If $Status_Checkbox <> "a" Then
		Local $NR_GameNames = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
		For $LOOP_Checkbox = 0 To $NR_GameNames
			_GUICtrlListView_SetItemChecked($listview_Temp, $LOOP_Checkbox, false)
		Next
	EndIf
EndFunc

Func _Button_Create_GamePage_all()
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
	If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
	If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
	If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
	If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	If FileExists($GamePage_path) Then FileDelete($GamePage_path)

	FileWrite($GamePage_path, '<html>' & @CRLF & _
								'<head>' & @CRLF & _
								'  <title>LightVR Start Page</title>' & @CRLF & _
								'  <link href="css/lightvr.css" rel="stylesheet" type="text/css">' & @CRLF & _
								"  <link href='http://fonts.googleapis.com/css?family=Josefin+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>" & @CRLF & _
								'</head>' & @CRLF & _
								'<body>' & @CRLF & _
								'<script>' & @CRLF & _
								'function LightVROpen() {' & @CRLF & _
								'	var addr = document.getElementById("URL").value;' & @CRLF & _
								'	if (addr.includes("://") || addr.includes("www")) {' & @CRLF & _
								'		window.location.href = addr;' & @CRLF & _
								'	} else {' & @CRLF & _
								'		window.location.href = "https://www.google.com/search?hl=en&q=" + addr;' & @CRLF & _
								'	}' & @CRLF & _
								'}' & @CRLF & _
								' ' & @CRLF & _
								'function LightVRKeyDown() {' & @CRLF & _
								'	if (event.keyCode == 13) {' & @CRLF & _
								'		LightVROpen();' & @CRLF & _
								'	}' & @CRLF & _
								'}' & @CRLF & _
								'</script>' & @CRLF & _
								'  <div class="navigation-bar w-container">' & @CRLF & _
								'	  <a href="http://lightvr.co/"><img src="images/toolbox_logo_black.png" width="300" /></a>' & @CRLF & _
								'  </div>' & @CRLF & _
								'  <div class="content w-container">' & @CRLF & _
								'	<div class="content-wrapper" style="background-attachment: fixed;">' & @CRLF & _
								'	  <div class="url-field w-row">' & @CRLF & _
								'		<div class="w-col w-col-11">' & @CRLF & _
								'		  <input class="url-field w-input" id="URL" maxlength="256" placeholder="Enter Address or Search String..." type="text" onkeydown="LightVRKeyDown()"/>' & @CRLF & _
								'		</div>' & @CRLF & _
								'		<div class="w-col w-col-1">' & @CRLF & _
								'		  <input class="w-button yellow-button" style="margin-top: 0px" type="submit" value="GO" onclick="LightVROpen();"/>' & @CRLF & _
								'		</div>' & @CRLF & _
								'	  </div>' & @CRLF & _
								'	  <br />' & @CRLF & _
								'	  <br />' & @CRLF & _
								'	</div>' & @CRLF & _
								'  </div>' & @CRLF & _
								'  <div class="icons">')

	For $NR = 1 To $NR_Applications
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
		Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
		Global $Application_StateFlags = IniRead($ApplicationList_TEMP, "Application_" & $NR, "StateFlags", "")
		Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
		Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR, "IconPath", "")
		Global $Application_right_now = IniRead($ApplicationList_TEMP, "Application_" & $NR, "right_now", "")
		Global $Application_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR, "24h_peak", "")
		Global $Application_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR, "all_time_peak", "")

		If Not FileExists($Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg") Then
			FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		EndIf

		If Not FileExists($Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg") Then
			FileCopy($gfx & "steam.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		EndIf

		FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" />                       <span class="tooltiptext">' & $Application_name & '</span></a></div>')
	Next

	FileWriteLine($GamePage_path, '  </div>')
	FileWriteLine($GamePage_path, '</body>')
	FileWriteLine($GamePage_path, '</html>')
EndFunc

Func _Button_Create_GamePage_selected()
	_GUICtrlStatusBar_SetText($Statusbar, "Creating Game Page..." & @TAB & @TAB & "'Version " & $Version & "'")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "" Then $ButtonTAB_State = "1"
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_ALL.html"
		If $Combo = "Steam Library 1" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_1.html"
		If $Combo = "Steam Library 2" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_2.html"
		If $Combo = "Steam Library 3" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_3.html"
		If $Combo = "Steam Library 4" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_4.html"
		If $Combo = "Steam Library 5" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_5.html"
	EndIf

	If $ButtonTAB_State = "2" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Non-Steam_Appl.html"
	If $ButtonTAB_State = "3" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_1.html"
	If $ButtonTAB_State = "4" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_2.html"
	If $ButtonTAB_State = "5" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_3.html"
	If $ButtonTAB_State = "6" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_4.html"

	If $ButtonTAB_State = "1" Then $listview_Temp = $ListView
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $ListView_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $ListView_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $ListView_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $ListView_6

	GUICtrlSetData($Anzeige_Fortschrittbalken, 20)

	Local $TEMP_NR_selected = "false"
	For $NR = 1 To $NR_Applications
		GUICtrlSetData($Anzeige_Fortschrittbalken, 10)
		Local $TEMP_selected = _GUICtrlListView_GetItemChecked($listview_Temp, $NR - 1)
		If $TEMP_selected = "true" Then $TEMP_NR_selected = "true"
	Next

	If $TEMP_NR_selected = "true" Then
		If FileExists($GamePage_path) Then FileDelete($GamePage_path)

		FileWrite($GamePage_path, '<html>' & @CRLF & _
									'<head>' & @CRLF & _
									'    <title>GamesPage 1</title>' & @CRLF & _
									'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
									'</head>' & @CRLF & _
									'<body>' & @CRLF & _
									'<script>' & @CRLF & _
									'    function VRTStartCommand(cmd) {' & @CRLF & _
									"      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';" & @CRLF & _
									'      console.log(s);' & @CRLF & _
									'    }' & @CRLF & _
									'</script>' & @CRLF & _
									'<div class="icons">' & @CRLF)


		For $NR = 1 To $NR_Applications
			GUICtrlSetData($Anzeige_Fortschrittbalken, $NR * 100 / $NR_Applications)
			If _GUICtrlListView_GetItemChecked($listview_Temp, $NR - 1) Then
				Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
				Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
				Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
				Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
				Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $Application_appid, "IconPath", "")
				Global $WebPage_IconPath = $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg"

				Local $StringLeft_Application_appid = StringLeft($Application_appid, 9)
				Local $StringTrimLeft_Application_appid = StringTrimLeft($Application_appid, 9)

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileCopy($gfx & "steamVR.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					If $StringLeft_Application_appid = "vive.htc." Then FileCopy($gfx & "Viveport.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If $HomeApp = "VR Toolbox" Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'steam://rungameid/" & $Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'vive://runapp/" & $StringTrimLeft_Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf

				If $HomeApp <> "VR Toolbox" Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="vive://runapp/' & $StringTrimLeft_Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf
			Else

			EndIf
		Next
		Sleep(100)
		FileWriteLine($GamePage_path, ' </div>')
		FileWriteLine($GamePage_path, '</body>')
		FileWriteLine($GamePage_path, '</html>')
		Sleep(100)
	Else
		MsgBox($MB_ICONWARNING, "No Application selected", "You need to select at least one Application to be able to create the HTML page.")
	EndIf
	_GUICtrlStatusBar_SetText($Statusbar, "Game Page created." & @TAB & @TAB & "'Version " & $Version & "'")
	Sleep(100)
	GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
	Sleep(600)
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "'Rescan Steam Library' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & @TAB & "'Version " & $Version & "'")
EndFunc

Func _Button_Create_SinglePage_selected()
	_GUICtrlStatusBar_SetText($Statusbar, "Creating Single Page..." & @TAB & @TAB & "'Version " & $Version & "'")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "" Then $ButtonTAB_State = "1"
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	$GamePage_path = $Install_DIR & "WebPage\GamesPage.html"

	If $ButtonTAB_State = "2" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Non-Steam_Appl.html"
	If $ButtonTAB_State = "3" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_1.html"
	If $ButtonTAB_State = "4" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_2.html"
	If $ButtonTAB_State = "5" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_3.html"
	If $ButtonTAB_State = "6" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_4.html"

	If $ButtonTAB_State = "1" Then $listview_Temp = $ListView
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $ListView_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $ListView_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $ListView_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $ListView_6

	GUICtrlSetData($Anzeige_Fortschrittbalken, 20)

	Local $TEMP_NR_selected = "false"
	For $NR = 1 To $NR_Applications
		GUICtrlSetData($Anzeige_Fortschrittbalken, 10)
		Local $TEMP_selected = _GUICtrlListView_GetItemChecked($listview_Temp, $NR - 1)
		If $TEMP_selected = "true" Then $TEMP_NR_selected = "true"
	Next

	If $TEMP_NR_selected = "true" Then
		If FileExists($GamePage_path) Then FileDelete($GamePage_path)

		FileWrite($GamePage_path, '<html>' & @CRLF & _
									'<head>' & @CRLF & _
									'    <title>Games</title>' & @CRLF & _
									'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
									'</head>' & @CRLF & _
									'<body>' & @CRLF & _
									'<script>' & @CRLF & _
									' ' & @CRLF & _
									'</script>' & @CRLF & _
									'<br><br><br>' & @CRLF & _
									'<div class="icons">' & @CRLF)


		For $NR = 1 To $NR_Applications
			GUICtrlSetData($Anzeige_Fortschrittbalken, $NR * 100 / $NR_Applications)
			If _GUICtrlListView_GetItemChecked($listview_Temp, $NR - 1) Then
				Local $Install_DIR_TEMP = StringReplace($Install_DIR, '\','/')
				Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
				Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
				Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
				Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
				Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $Application_appid, "IconPath", "")
				Global $WebPage_IconPath = $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg"
				Local $HTMLSinglePage_Path = $Install_DIR & "WebPage\steam.app." & $Application_appid & ".html"
				If FileExists($HTMLSinglePage_Path) Then FileDelete($HTMLSinglePage_Path)

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($gfx & "steam.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="file:///' & $Install_DIR_TEMP & 'WebPage/' & 'steam.app.' & $Application_appid & '.html' & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')

				FileWriteLine($HTMLSinglePage_Path, '<html>')
				FileWriteLine($HTMLSinglePage_Path, '<head>')
				FileWriteLine($HTMLSinglePage_Path, '    <title>Game</title>')
				FileWriteLine($HTMLSinglePage_Path, '    <link href="css/games.css" rel="stylesheet" type="text/css">')
				FileWriteLine($HTMLSinglePage_Path, '</head>')
				FileWriteLine($HTMLSinglePage_Path, '<body>')
				FileWriteLine($HTMLSinglePage_Path, '<script>')
				FileWriteLine($HTMLSinglePage_Path, '    function VRTStartCommand(cmd) {')
				FileWriteLine($HTMLSinglePage_Path, "      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';")
				FileWriteLine($HTMLSinglePage_Path, '      console.log(s);')
				FileWriteLine($HTMLSinglePage_Path, '    }')
				FileWriteLine($HTMLSinglePage_Path, '</script>')
				FileWriteLine($HTMLSinglePage_Path, '<div class="icons">')
				FileWriteLine($HTMLSinglePage_Path, '	<br><br><br><br>')
				If $WinName = "VR Toolbox" Then
					FileWriteLine($HTMLSinglePage_Path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'steam://rungameid/" & $Application_appid & "');" & '">         <img class="icon2" src="images/steam.app.' & $Application_appid & '.jpg" width="1620" height="980" /></a></div>')
				Else
					FileWriteLine($HTMLSinglePage_Path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' ">         <img class="icon2" src="images/steam.app.' & $Application_appid & '.jpg" width="1620" height="980" /></a></div>')
				EndIf
				FileWriteLine($HTMLSinglePage_Path, ' </div>')
				FileWriteLine($HTMLSinglePage_Path, '</body>')
				FileWriteLine($HTMLSinglePage_Path, '</html>')
			Else

			EndIf
		Next
		Sleep(100)
		FileWriteLine($GamePage_path, ' </div>')
		FileWriteLine($GamePage_path, '</body>')
		FileWriteLine($GamePage_path, '</html>')
		Sleep(100)
	Else
		MsgBox($MB_ICONWARNING, "No Application selected", "You need to select at least one Application to be able to create the HTML page.")
	EndIf
	_GUICtrlStatusBar_SetText($Statusbar, "Game Page created." & @TAB & @TAB & "'Version " & $Version & "'")
	Sleep(100)
	GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
	Sleep(600)
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "'Rescan Steam Library' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & @TAB & "'Version " & $Version & "'")
EndFunc

Func _Button_Add_to_Custom()
	Local $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	Local $Status_Combo_Add_to_Custom = GUICtrlRead($Combo_Add_to_Custom)
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"

	If $ButtonTAB_State = "1" Then $listview_Temp = $ListView
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $ListView_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $ListView_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $ListView_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $ListView_6

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"


	If $Status_Combo_Add_to_Custom <> "Choose TAB" Then
		Local $ButtonTAB_State_1 = GUICtrlRead($ButtonTAB_Custom_1)
		Local $ButtonTAB_State_2 = GUICtrlRead($ButtonTAB_Custom_2)
		Local $ButtonTAB_State_3 = GUICtrlRead($ButtonTAB_Custom_3)
		Local $ButtonTAB_State_4 = GUICtrlRead($ButtonTAB_Custom_4)

		Local $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"

		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_1 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_2 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_3 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_4 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"


		Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
		Local $LastAppNR = IniRead($ApplicationList_target, "ApplicationList", "NR_Applications", "")
		Local $NewAppNR = $LastAppNR + 1

		For $NR = 1 To $NR_Applications
			If _GUICtrlListView_GetItemChecked($listview_Temp, $NR - 1) Then
					Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
					Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
					Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
					Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
					Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR, "IconPath", "")

					IniWrite($ApplicationList_target, "ApplicationList", "NR_Applications", $NewAppNR)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "NR", $NewAppNR)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "appid", $Application_appid)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "name", $Application_name)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "installdir", $Application_installdir)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "IconPath", $Application_IconPath)
					$NewAppNR = $NewAppNR + 1
			Else

			EndIf
		Next
	EndIf
EndFunc

Func _Button_HomeLoaderSettings()
	If FileExists($System_DIR & "Settings.exe") Then
		ShellExecute($System_DIR & "Settings.exe")
	Else
		ShellExecute($System_DIR & "Settings.au3")
	EndIf
	Exit
EndFunc

Func _Start_ListView_Selected()
	Local  $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppID = _GUICtrlListView_GetItemText($ListView, $ListView_Selected_Row_Nr - 1, 1)
	Local $StringLeft_Check_AppID = StringLeft($Check_AppID, 9)
	Local $StringTrimLeft_Check_AppID = StringTrimLeft($Check_AppID, 9)

	If $Check_AppID <> "" Then
		If $StringLeft_Check_AppID = "vive.htc." Then
			ShellExecute("vive://runapp/" & $StringTrimLeft_Check_AppID)
		Else
			ShellExecute("steam://rungameid/" & $Check_AppID)
		EndIf

		Sleep(200)
		;_Beenden()
	EndIf
EndFunc

Func _Combo_SteamLibrary()
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	IniWrite($config_ini, "Settings", "Steam_Library", $Combo)
	FileDelete($ApplicationList_INI)

	If $Combo = "Steam Library 1" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini") Then
		$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
		If $Install_Folder_Steam_1 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 1 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 1")
			GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 2" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini") Then
		$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
		If $Install_Folder_Steam_2 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 2 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 2")
			GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 3" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini") Then
		$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
		If $Install_Folder_Steam_3 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 3 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 3.")
			GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 4" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini") Then
		$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
		If $Install_Folder_Steam_4 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 4 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 4")
			GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 5" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini") Then
		$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
		If $Install_Folder_Steam_5 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 5 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 5.ini")
			GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_Settings_GUI()
		EndIf
	EndIf
	_Read_from_INI_ADD_2_ListView()
	GUICtrlSetData($Checkbox_CreatePage, "")
EndFunc

Func _ButtonTAB_Steam_Library()
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_SHOW)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "1")
	FileDelete($ApplicationList_INI)
	_GUICtrlListView_DeleteAllItems($ListView)
	GUICtrlSetState($listview, $GUI_SHOW)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _ButtonTAB_Non_Steam_Appl()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Non_Steam_Appl)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "2")
	_GUICtrlListView_DeleteAllItems($listview_2)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_SHOW)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _ButtonTAB_Custom_1()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_1)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "3")
	_GUICtrlListView_DeleteAllItems($ListView_3)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_SHOW)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _ButtonTAB_Custom_2()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_2)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "4")
	_GUICtrlListView_DeleteAllItems($ListView_4)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_SHOW)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _ButtonTAB_Custom_3()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_3)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "5")
	_GUICtrlListView_DeleteAllItems($ListView_5)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_SHOW)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _ButtonTAB_Custom_4()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_4)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_DISABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "6")
	_GUICtrlListView_DeleteAllItems($ListView_6)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_SHOW)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _Button_AddGame2Library()
	_AddGame2Library_GUI()
EndFunc

Func _Button_ReScan_Steam_Library()
	Local $Combo = GUICtrlRead($Combo_SteamLibrary)

	If $Combo = "ALL" Then
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)

		If $Install_Folder_Steam_1 <> "" Then $NR_temp3 = 1
		If $Install_Folder_Steam_2 <> "" Then $NR_temp3 = 2
		If $Install_Folder_Steam_3 <> "" Then $NR_temp3 = 3
		If $Install_Folder_Steam_4 <> "" Then $NR_temp3 = 4
		If $Install_Folder_Steam_5 <> "" Then $NR_temp3 = 5
		If $NR_temp3 = "" Then $NR_temp3 = 1

		For $NR_Library = 1 To $NR_temp3
			$NR_Library_temp = $NR_Library
			_Search_Files()
			Sleep(500)
			GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
			GUICtrlSetData($Anzeige_Fortschrittbalken_2, $NR_Library * 100 / $NR_temp3)
		Next
		$NR_Library_temp = ""
		_GUICtrlListView_DeleteAllItems($listview)
		Local $SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini")
		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(500)
		GUICtrlSetData($Anzeige_Fortschrittbalken_2, 0)
	EndIf

	If $Combo <> "ALL" Then
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini")
		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(500)
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	EndIf


	If $ScanVIVEApps = "true" Then
		If FileExists($Steam_AppConfig_Json) Then
			_ScanViveData()
		EndIf
	EndIf

	_Read_SteamVR_VRSettings()
	If $Add_SS_to_Icons = "true" Then _Get_AD_SS_Values_to_Icons()
	_Read_from_INI_ADD_2_ListView()
	_Sync_Icons()
	_GUICtrlStatusBar_SetText($Statusbar, "Rescan of Steam Library finished." & @TAB & "Apps: " & $NR_Applications & @TAB & "'Version " & $Version & "'")
EndFunc

Func _ScanViveData()
	Local $NR_LINES_TEMP = _FileCountLines($Steam_AppConfig_Json)

	For $Loop = 3 To $NR_LINES_TEMP
		Local $Value = FileReadLine($Steam_AppConfig_Json, $Loop)
		Local $Value_1 = StringReplace($Value, '"', '')
		Local $Value_2 = StringReplace($Value_1, ',', '')
		Local $Value_3 = StringRight($Value_2, 15)
		Local $Value_Path = StringLeft($Value_2, StringLen($Value_2) - 15)
		Local $Value_Path_StringReplace_temp = StringReplace($Value_Path, '\\', '\')
		Local $Value_Path_StringReplace = StringReplace($Value_Path_StringReplace_temp, ' ', '')

		If $Value_3 = "app.vrmanifest" Or $Value_3 = "\app.vrmanifest" Then
			Local $Value_2_1 = StringReplace($Value_2, '\\', '\')
			Local $Value_2_2 = StringReplace($Value_2_1, ' ', '')
			Local $Value_AppVRmanifest_1 = FileRead($Value_2_2)
			Local $Value_AppVRmanifest_2 = StringTrimLeft($Value_AppVRmanifest_1, 35)

			Local $StringSplit_Value = StringSplit($Value_AppVRmanifest_2, ",")
			Local $Application_NR_new = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "") + 1

			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR_new, "NR", $Application_NR_new)

			For $i = 1 To $StringSplit_Value[0]
				Local $StringSplit_Value_2 = StringSplit($StringSplit_Value[$i], ":")
				Local $StringSplit_Value_2_1 = StringReplace($StringSplit_Value_2[1], '"', '')
				Local $StringSplit_Value_2_1_1 = StringReplace($StringSplit_Value_2_1, '[', '')
				Local $StringSplit_Value_2_1_2 = StringReplace($StringSplit_Value_2_1_1, '{', '')

				If $StringSplit_Value_2_1_2 = "url" Then
					Local $StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
					Local $StringSplit_Value_2_3 = StringReplace($StringSplit_Value_2[3], '"', '')
					Local $StringSplit_Value_2_4 = $StringSplit_Value_2_2 & ":" & $StringSplit_Value_2_3
					IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR_new, "url", $StringSplit_Value_2_4)
				EndIf

				If $StringSplit_Value_2_1_2 = "app_key" Then ; appid
					Local $StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
					Local $Application_appid_TEMP = $StringSplit_Value_2_2
					IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR_new, "appid", $StringSplit_Value_2_2)
				EndIf

				If $StringSplit_Value_2_1_2 = "strings" Then ; NAME
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[4], '"', '')
					IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR_new, "name", $StringSplit_Value_2_2)
				EndIf

				If $StringSplit_Value_2_1_2 = "launch_type" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
				EndIf

				If $StringSplit_Value_2_1_2 = "image_path" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
					Local $Value_image_path = $Value_Path_StringReplace & $StringSplit_Value_2_2
					IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR_new, "IconPath", $Value_image_path)
					If Not FileExists($Icons & "steam.app." & $Application_appid_TEMP & ".jpg") Or $DeleteHomeLoaderLibraryData = "true" Then
						Local $Download_Icon_path_1_jpg = $Icons & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_2_jpg = $Icons & "460x215\steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_3_jpg = $Icon_Folder_1 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_4_jpg = $Icon_Folder_2 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_5_jpg = $Icon_Folder_3 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_6_jpg = $Icon_Folder_4 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_7_jpg = $Icon_Folder_5 & "steam.app." & $Application_appid_TEMP & ".jpg"

						FileCopy($Value_image_path, $Download_Icon_path_1_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
						FileCopy($Value_image_path, $Download_Icon_path_2_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
						FileCopy($Value_image_path, $Download_Icon_path_3_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
						FileCopy($Value_image_path, $Download_Icon_path_4_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
						FileCopy($Value_image_path, $Download_Icon_path_5_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
						FileCopy($Value_image_path, $Download_Icon_path_6_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
						FileCopy($Value_image_path, $Download_Icon_path_7_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf
					Local $ListView_Icon_Path = $Icons & "32x32\" & "steam.app." & $Application_appid_TEMP & ".bmp"
					If Not FileExists($ListView_Icon_Path) Or $DeleteHomeLoaderLibraryData = "true" Then
						FileCopy($gfx & "Icon_Preview_Viveport_32x32.bmp", $ListView_Icon_Path, $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf
				EndIf

				If $StringSplit_Value_2_1_2 = "is_dashboard_overlay" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
				EndIf

				If $StringSplit_Value_2_1_2 = "arguments" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
				EndIf

				If $StringSplit_Value_2_1_2 = "binary_path_windows" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
					Local $StringSplit_Value_2_2_1 = StringReplace($StringSplit_Value_2_2, ']', '')
					Local $StringSplit_Value_2_2_2 = StringReplace($StringSplit_Value_2_2_1, '}', '')
					Local $StringSplit_Value_2_2_3 = $Value_Path_StringReplace & $StringSplit_Value_2_2_2
					IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR_new, "binary_path_windows", $StringSplit_Value_2_2_3)
				EndIf
			Next

			Local $NR_TEMP = $Application_NR_new
			Local $url_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR_new, "url", "")
			Local $appid_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR_new, "appid", "")
			Local $name_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR_new, "name", "")
			Local $IconPath_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR_new, "IconPath", "")
			Local $binary_path_windows_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR_new, "binary_path_windows", "")

			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $appid_TEMP, "NR", $NR_TEMP)
			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $appid_TEMP, "url", $url_TEMP)
			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $appid_TEMP, "appid", $appid_TEMP)
			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $appid_TEMP, "name", $name_TEMP)
			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $appid_TEMP, "IconPath", $IconPath_TEMP)
			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $appid_TEMP, "binary_path_windows", $binary_path_windows_TEMP)

			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", $Application_NR_new)
		EndIf
	Next
EndFunc

Func _Checkbox_ScanViveData()
	Local $CheckBox = GUICtrlRead($Checkbox_ScanVIVEData)
	If $CheckBox = "" Then
		GUICtrlSetData($Checkbox_ScanVIVEData, "a")
		IniWrite($Config_INI, "Settings", "ScanVIVEApps", "true")
	Else
		GUICtrlSetData($Checkbox_ScanVIVEData, "")
		IniWrite($Config_INI, "Settings", "ScanVIVEApps", "false")
	EndIf
	$ScanVIVEApps = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
EndFunc

Func _Checkbox_DeleteData()
	Local $CheckBox = GUICtrlRead($Checkbox_DeleteData)
	If $CheckBox = "" Then
		GUICtrlSetData($Checkbox_DeleteData, "a")
		IniWrite($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "true")
	Else
		GUICtrlSetData($Checkbox_DeleteData, "")
		IniWrite($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "false")
	EndIf
	$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
EndFunc

#endregion

#Region Func Add to Library GUI
Func _DROPDOWN_Library()
	Local $DROPDOWN = GUICtrlRead($DROPDOWN_Library)
	If $DROPDOWN <> "" Then
		Local $Value_DROPDOWN_Library = $DROPDOWN
		IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", $Value_DROPDOWN_Library)
	EndIf
EndFunc

Func _BUTTON_GamePath_Folder()
	Local $FileSelect = FileOpenDialog("Choose File.", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
	If $FileSelect <> "" Then
		Local $Value_GamePath_Folder = $FileSelect
		GUICtrlSetData($Input_GamePath_Folder, $FileSelect)
		IniWrite($config_ini, "TEMP", "Value_GamePath_Folder", $FileSelect)
		Local $HL_ID = "HL" & StringReplace(StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2), '.', '')
		IniWrite($config_ini, "TEMP", "Value_Use_SteamID", $HL_ID)
		GUICtrlSetState($Input_GamePath_Folder, $GUI_SHOW)
		GUICtrlSetState($Input_Name, $GUI_SHOW)
		GUICtrlSetState($Button_SAVE_APP, $GUI_SHOW)
		GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_SHOW)
		GUICtrlSetState($Frame_up, $GUI_SHOW)
		GUICtrlSetState($Frame_down, $GUI_SHOW)
		GUICtrlSetState($Frame_right, $GUI_SHOW)
		GUICtrlSetState($Frame_left, $GUI_SHOW)
		GUICtrlSetState($Icon_Preview, $GUI_SHOW)
		GUICtrlSetImage($Icon_Preview, $gfx & "Icon_Preview.jpg")
		IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", $gfx & "Icon_Preview.jpg")
		Local $Value_FileName = StringInStr($Value_GamePath_Folder, "\", "", -1)
		$Value_FileName = StringTrimLeft($Value_GamePath_Folder, $Value_FileName)
		Local $Value_NamefromFile = StringInStr($Value_FileName, ".", "", -1)
		Local $StringCut_NR = StringLen($Value_FileName) - $Value_NamefromFile + 1
		$Value_NamefromFile = StringTrimRight($Value_FileName, $StringCut_NR)
		IniWrite($config_ini, "TEMP", "Value_Input_Name", $Value_NamefromFile)
		GUICtrlSetData($Input_Name, $Value_NamefromFile)
	EndIf
EndFunc

Func _BUTTON_Use_SteamID()
	Local $InputBox = InputBox("Enter Steam Game ID", " ", "", "", - 1, 1)
	If $InputBox <> "" Then
		Local $Value_Use_SteamID = $InputBox
		GUICtrlSetData($Input_GamePath_Folder, "steam://rungameid/" & $Value_Use_SteamID)
		IniWrite($config_ini, "TEMP", "Value_Use_SteamID", $Value_Use_SteamID)
		GUICtrlSetState($Input_GamePath_Folder, $GUI_SHOW)
		GUICtrlSetState($Input_Name, $GUI_SHOW)
		GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_SHOW)
		GUICtrlSetState($Button_SAVE_APP, $GUI_SHOW)
		GUICtrlSetState($Frame_up, $GUI_SHOW)
		GUICtrlSetState($Frame_down, $GUI_SHOW)
		GUICtrlSetState($Frame_right, $GUI_SHOW)
		GUICtrlSetState($Frame_left, $GUI_SHOW)
		GUICtrlSetState($Icon_Preview, $GUI_SHOW)
		GUICtrlSetImage($Icon_Preview, $gfx & "Icon_Preview.jpg")
		IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", $gfx & "Icon_Preview.jpg")
		Local $Value_FileName = "SteamGameID " & $Value_Use_SteamID
		IniWrite($config_ini, "TEMP", "Value_Input_Name", $Value_FileName)
		GUICtrlSetData($Input_Name, $Value_FileName)
	EndIf
EndFunc

Func _Input_Name()
	Local $Input_Input_Name = GUICtrlRead($Input_Name)
	If $Input_Input_Name <> "" Then
		Local $Value_Input_Name = $Input_Input_Name
		IniWrite($config_ini, "TEMP", "Value_Input_Name", $Input_Input_Name)
	EndIf
EndFunc

Func _BUTTON_IconPath_Folder()
	Local $FileSelect = FileOpenDialog("Choose Icon File.", $Icons, "All (*.*)", $FD_FILEMUSTEXIST)
	If $FileSelect <> "" Then
		Local $Value_IconPath_Folder = $FileSelect
		GUICtrlSetImage($Icon_Preview, $Value_IconPath_Folder)
		IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", $Value_IconPath_Folder)
		GUICtrlSetState($Frame_up, $GUI_SHOW)
		GUICtrlSetState($Frame_down, $GUI_SHOW)
		GUICtrlSetState($Frame_right, $GUI_SHOW)
		GUICtrlSetState($Frame_left, $GUI_SHOW)
		GUICtrlSetState($Icon_Preview, $GUI_SHOW)
	EndIf
EndFunc

Func _Button_SAVE_APP()
	Local $Value_DROPDOWN_Library = IniRead($config_ini, "TEMP", "Value_DROPDOWN_Library", "")
	Local $Value_GamePath_Folder = IniRead($config_ini, "TEMP", "Value_GamePath_Folder", "")
	Local $Value_Use_SteamID = IniRead($config_ini, "TEMP", "Value_Use_SteamID", "")
	Local $Value_Input_Name = IniRead($config_ini, "TEMP", "Value_Input_Name", "")
	Local $Value_IconPath_Folder = IniRead($config_ini, "TEMP", "Value_IconPath_Folder", "")

	Local $LastAppNR = IniRead($ApplicationList_Non_Steam_Appl_INI, "ApplicationList", "NR_Applications", "")
	Local $NewAppNR = $LastAppNR + 1

	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "appid", $Value_Use_SteamID)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "name", $Value_Input_Name)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "installdir", $Value_GamePath_Folder)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "IconPath", $Value_IconPath_Folder)

	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "appid", $Value_Use_SteamID)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "name", $Value_Input_Name)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "installdir", $Value_GamePath_Folder)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "IconPath", $Value_IconPath_Folder)

	IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", "")
	IniWrite($config_ini, "TEMP", "Value_GamePath_Folder", "")
	IniWrite($config_ini, "TEMP", "Value_Use_SteamID", "")
	IniWrite($config_ini, "TEMP", "Value_Input_Name", "")
	IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", "")

	IniWrite($ApplicationList_Non_Steam_Appl_INI, "ApplicationList", "NR_Applications", $NewAppNR)
	_Read_from_INI_ADD_2_ListView()

	GUICtrlSetData($Input_GamePath_Folder, "")
	GUICtrlSetData($Input_Name, "")

	GUICtrlSetState($Input_GamePath_Folder, $GUI_HIDE)
	GUICtrlSetState($Input_Name, $GUI_HIDE)
	GUICtrlSetState($Button_SAVE_APP, $GUI_HIDE)
	GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_HIDE)
	GUICtrlSetState($Frame_up, $GUI_HIDE)
	GUICtrlSetState($Frame_down, $GUI_HIDE)
	GUICtrlSetState($Frame_right, $GUI_HIDE)
	GUICtrlSetState($Frame_left, $GUI_HIDE)
	GUICtrlSetState($Icon_Preview, $GUI_HIDE)

	MsgBox($MB_ICONINFORMATION, "Finished", "New Application added", 3)
EndFunc

Func _Button_Exit_AddGame2Library_GUI()
	IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", "")
	IniWrite($config_ini, "TEMP", "Value_GamePath_Folder", "")
	IniWrite($config_ini, "TEMP", "Value_Use_SteamID", "")
	IniWrite($config_ini, "TEMP", "Value_Input_Name", "")
	IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", "")
	GUIDelete($AddGame2Library_GUI)
EndFunc
#endregion

#Region Func Settings GUI
Func _Button_Exit_Settings_GUI()
	GUIDelete($Settings_GUI)
	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
	If $First_Start = "true" Then
		IniWrite($Config_INI, "Settings", "First_Start", "Settings")
		If FileExists($System_DIR & "Settings.exe") Then
			ShellExecute($System_DIR & "Settings.exe")
		Else
			ShellExecute($System_DIR & "Settings.au3")
		EndIf
		Exit
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_1()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If FileExists($FileSelectFolder & "\Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_1, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_1", $FileSelectFolder & "\")
	Else
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
		IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_2()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If FileExists($FileSelectFolder & "\Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_2, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_2", $FileSelectFolder & "\")
	Else
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
		IniWrite($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_3()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If FileExists($FileSelectFolder & "\Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_3, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_3", $FileSelectFolder & "\")
	Else
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
		IniWrite($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_4()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If FileExists($FileSelectFolder & "\Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_4, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_4", $FileSelectFolder & "\")
	Else
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
		IniWrite($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_5()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If FileExists($FileSelectFolder & "\Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_5, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_5", $FileSelectFolder & "\")
	Else
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
		IniWrite($Config_INI, "Folders", "Install_Folder_Steam_5", "")
	EndIf
EndFunc


Func _Button_Install_Folder_Steam_1_open()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_1)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_2_open()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_2)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_3_open()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_3)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_4_open()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_4)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_5_open()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_5)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc


Func _Button_Install_Folder_Steam_1_save()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_1)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If FileExists($Value_Input & "Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_1, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_1", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", "")
		EndIf
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_2_save()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_2)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If FileExists($Value_Input & "Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_2, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_2", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_2", "")
		EndIf
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_3_save()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_3)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If FileExists($Value_Input & "Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_3, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_3", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_3", "")
		EndIf
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_4_save()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_4)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If FileExists($Value_Input & "Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_4, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_4", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_4", "")
		EndIf
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_5_save()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_5)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If FileExists($Value_Input & "Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_5, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_5", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_5", "")
		EndIf
	EndIf
EndFunc


Func _Button_Icon_Folder_1()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_Icon_Folder_1, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Icon_Folder_1", $FileSelectFolder & "\")
	Else
		IniWrite($Config_INI, "Folders", "Icon_Folder_1", "")
	EndIf
EndFunc

Func _Button_Icon_Folder_2()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_Icon_Folder_2, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Icon_Folder_2", $FileSelectFolder & "\")
	Else
		IniWrite($Config_INI, "Folders", "Icon_Folder_2", "")
	EndIf
EndFunc

Func _Button_Icon_Folder_3()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_Icon_Folder_3, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Icon_Folder_3", $FileSelectFolder & "\")
	Else
		IniWrite($Config_INI, "Folders", "Icon_Folder_3", "")
	EndIf
EndFunc

Func _Button_Icon_Folder_4()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_Icon_Folder_4, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Icon_Folder_4", $FileSelectFolder & "\")
	Else
		IniWrite($Config_INI, "Folders", "Icon_Folder_4", "")
	EndIf
EndFunc

Func _Button_Icon_Folder_5()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_Icon_Folder_5, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Icon_Folder_5", $FileSelectFolder & "\")
	Else
		IniWrite($Config_INI, "Folders", "Icon_Folder_5", "")
	EndIf
EndFunc


Func _Button_Icon_Folder_1_open()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_1)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Icon_Folder_2_open()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_2)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Icon_Folder_3_open()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_3)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Icon_Folder_4_open()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_4)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Icon_Folder_5_open()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_5)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc


Func _Button_Icon_Folder_1_save()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_1)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If $Value_Input <> "" Then
		GUICtrlSetData($Input_Icon_Folder_1, $Value_Input)
		IniWrite($config_ini, "Folders", "Icon_Folder_1", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			IniWrite($Config_INI, "Folders", "Icon_Folder_1", "")
		EndIf
	EndIf
EndFunc

Func _Button_Icon_Folder_2_save()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_2)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If $Value_Input <> "" Then
		GUICtrlSetData($Input_Icon_Folder_2, $Value_Input)
		IniWrite($config_ini, "Folders", "Icon_Folder_2", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			IniWrite($Config_INI, "Folders", "Icon_Folder_2", "")
		EndIf
	EndIf
EndFunc

Func _Button_Icon_Folder_3_save()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_3)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If $Value_Input <> "" Then
		GUICtrlSetData($Input_Icon_Folder_3, $Value_Input)
		IniWrite($config_ini, "Folders", "Icon_Folder_3", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			IniWrite($Config_INI, "Folders", "Icon_Folder_3", "")
		EndIf
	EndIf
EndFunc

Func _Button_Icon_Folder_4_save()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_4)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If $Value_Input <> "" Then
		GUICtrlSetData($Input_Icon_Folder_4, $Value_Input)
		IniWrite($config_ini, "Folders", "Icon_Folder_4", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			IniWrite($Config_INI, "Folders", "Icon_Folder_4", "")
		EndIf
	EndIf
EndFunc

Func _Button_Icon_Folder_5_save()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_5)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If $Value_Input <> "" Then
		GUICtrlSetData($Input_Icon_Folder_5, $Value_Input)
		IniWrite($config_ini, "Folders", "Icon_Folder_5", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			IniWrite($Config_INI, "Folders", "Icon_Folder_5", "")
		EndIf
	EndIf
EndFunc
#endregion

#Region Func SS_Settings GUI
Func _Slider_0()
	Local $Value_Slider = GUICtrlRead($Slider_0)
	GUICtrlSetData($Input_ResolutionScale, $Value_Slider)
EndFunc

Func _Slider_1()
	Local $Value_Slider_1 = GUICtrlRead($Slider_1)
	Local $rTM_1 = StringLeft($Value_Slider_1, 1)
	Local $rTM_2 = StringRight($Value_Slider_1, 1)
	Local $rTM_value = $rTM_1 & $rTM_2
	Local $rTM_Input_value = $rTM_1 & "." & $rTM_2
	If StringLen($Value_Slider_1) = 1 Then $rTM_value = $rTM_2
	If StringLen($Value_Slider_1) = 1 Then $rTM_Input_value = "0." & $rTM_2
	GUICtrlSetData($Input_renderTargetMultiplier, $rTM_Input_value)
EndFunc

Func _Slider_2()
	Local $Value_Slider_2 = GUICtrlRead($Slider_2)
	Local $ssS_1 = StringLeft($Value_Slider_2, 1)
	Local $ssS_2 = StringRight($Value_Slider_2, 1)
	Local $ssS_value = $ssS_1 & $ssS_2
	Local $ssS_Input_value = $ssS_1 & "." & $ssS_2
	If StringLen($Value_Slider_2) = 1 Then $ssS_value = $ssS_2
	If StringLen($Value_Slider_2) = 1 Then $ssS_Input_value = "0." & $ssS_2
	GUICtrlSetData($Input_supersampleScale, $ssS_Input_value)
EndFunc

Func _Slider_3()
	Local $Value_Slider_3 = GUICtrlRead($Slider_3)
	If $Value_Slider_3 = 0 Then $Value_Slider_3 = "true"
	If $Value_Slider_3 = 1 Then $Value_Slider_3 = "false"
	GUICtrlSetData($ComboBox_3, "", "")
	GUICtrlSetData($ComboBox_3, "true|false", $Value_Slider_3)
EndFunc

Func _UpDown_ResolutionScale()
	Local $Value_UpDown = GUICtrlRead($Input_ResolutionScale)
	If $Value_UpDown < 20 Then $Value_UpDown = "20"
	If $Value_UpDown > 500 Then $Value_UpDown = "500"
	GUICtrlSetData($Input_ResolutionScale, $Value_UpDown)
	GUICtrlSetData($Slider_0, $Value_UpDown)
EndFunc

Func _UpDown_renderTargetMultiplier()
	Local $Value_UpDown = GUICtrlRead($Input_renderTargetMultiplier)
	Local $rTM_1 = StringLeft($Value_UpDown, 1)
	Local $rTM_2 = StringRight($Value_UpDown, 1)
	Local $rTM_value = $rTM_1 & $rTM_2
	Local $rTM_Input_value = $rTM_1 & "." & $rTM_2
	If StringLen($Value_UpDown) = 1 Then $rTM_value = $rTM_2
	If StringLen($Value_UpDown) = 1 Then $rTM_Input_value = "0." & $rTM_2
	If $Value_UpDown < 5 Then $rTM_Input_value = "0.5"
	If $Value_UpDown > 25 Then $rTM_Input_value = "2.5"
	GUICtrlSetData($Input_renderTargetMultiplier, $rTM_Input_value)
	GUICtrlSetData($Slider_1, $Value_UpDown)
EndFunc

Func _UpDown_supersampleScale()
	Local $Value_UpDown = GUICtrlRead($Input_supersampleScale)
	Local $ssS_1 = StringLeft($Value_UpDown, 1)
	Local $ssS_2 = StringRight($Value_UpDown, 1)
	Local $ssS_value = $ssS_1 & $ssS_2
	Local $ssS_Input_value = $ssS_1 & "." & $ssS_2
	If StringLen($Value_UpDown) = 1 Then $ssS_value = $ssS_2
	If StringLen($Value_UpDown) = 1 Then $ssS_Input_value = "0." & $ssS_2
	If $Value_UpDown < 5 Then $ssS_Input_value = "0.5"
	If $Value_UpDown > 25 Then $ssS_Input_value = "2.5"
	GUICtrlSetData($Input_supersampleScale, $ssS_Input_value)
	GUICtrlSetData($Slider_2, $Value_UpDown)
EndFunc

Func _ComboBox_3()
	Local $Value_ComboBox = GUICtrlRead($ComboBox_3)
	If $Value_ComboBox = "true" Then Local $Value_Slider_3 = 0
	If $Value_ComboBox = "false" Then Local $Value_Slider_3 = 1
	GUICtrlSetData($Slider_3, $Value_Slider_3)
EndFunc


Func _Button_Save_Settings_GUI()
	$Input_ResolutionScale = GUICtrlRead($Input_ResolutionScale)
	$Input_renderTargetMultiplier = GUICtrlRead($Input_renderTargetMultiplier)
	$Input_supersampleScale = GUICtrlRead($Input_supersampleScale)
	Local $Input_allowSupersampleFiltering = GUICtrlRead($ComboBox_3)

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $App_NR = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "NR", "")
	Local $AppName = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "appName", "")

	;IniWrite($SteamVR_VRSettings_INI, "steam.app." & $Game_ID, "resolutionScale", $Input_ResolutionScale)
	IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "resolutionScale", $Input_ResolutionScale)
	IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $App_NR, "resolutionScale", $Input_ResolutionScale)
	IniWrite($Config_INI, "SteamVR_Status", "renderTargetMultiplier", $Input_renderTargetMultiplier)
	IniWrite($Config_INI, "SteamVR_Status", "supersampleScale", $Input_supersampleScale)
	IniWrite($Config_INI, "SteamVR_Status", "allowSupersampleFiltering", $Input_allowSupersampleFiltering)
EndFunc

Func _Button_Add2Steam_Settings_GUI()
	_Button_Save_Settings_GUI()

	If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK, $FC_OVERWRITE)

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $FileLines = _FileCountLines($default_vrsettings_File)

	Local $renderTargetMultiplier_value = GUICtrlRead($Input_renderTargetMultiplier)
	Local $supersampleScale_value = GUICtrlRead($Input_supersampleScale)
	Local $allowSupersampleFiltering_value = GUICtrlRead($ComboBox_3)

	FileWriteLine($default_vrsettings_File_new, '{')
	FileWriteLine($default_vrsettings_File_new, '	"steamvr" : {')

	For $LOOP_vrsettings = 3 To $FileLines
		$ReadLine = FileReadLine($default_vrsettings_File, $LOOP_vrsettings)
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
EndFunc

Func _Button_StartGame_Settings_GUI()
	_Button_Add2Steam_Settings_GUI()

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	ShellExecute("steam://launch/" & $Game_ID & "/VR\")
EndFunc

Func _Button_Exit_SS_Settings_GUI()
	GUIDelete($SS_Settings_GUI)
EndFunc
#endregion

#Region Func Home Loader
Func _FirstStart_Restart()
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	Exit
EndFunc

Func _Restart()
	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe")
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3")
	EndIf
	Sleep(500)
	Exit
EndFunc

Func _Exit_Check()
	If Not ProcessExists("vrmonitor.exe") Then
		FileWrite($stats_log_FILE, @CRLF & "----- [" & _Now() & "]" & " Exit Check: SteamVR is not running --> Exit [HomeLoaderLibrary] -----" & _Now() & "]")
		Exit
	EndIf
EndFunc

Func _Beenden()
	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
	Exit
EndFunc
#endregion

#Region Func OVERLAY
Func _Overlay_ReScan_Steam_Library()
	$ApplicationList_INI = $ApplicationList_SteamLibrary_ALL_INI
	Local $NR_temp4
	Local $Combo = "ALL"

	If $Combo = "ALL" Then
		If $Install_Folder_Steam_1 <> "" Then $NR_temp4 = 1
		If $Install_Folder_Steam_2 <> "" Then $NR_temp4 = 2
		If $Install_Folder_Steam_3 <> "" Then $NR_temp4 = 3
		If $Install_Folder_Steam_4 <> "" Then $NR_temp4 = 4
		If $Install_Folder_Steam_5 <> "" Then $NR_temp4 = 5
		If $NR_temp4 = "" Then $NR_temp4 = 1

		For $NR_Library = 1 To $NR_temp4
			$NR_Library_temp = $NR_Library
			_Overlay_Search_Files()
			Sleep(500)
		Next
		$NR_Library_temp = ""

		If $ScanVIVEApps = "true" Then
			If FileExists($Steam_AppConfig_Json) Then
				_ScanViveData()
			EndIf
		EndIf
		Sleep(500)
	EndIf
	_Read_SteamVR_VRSettings()
	;If $Add_PlayersOnline_to_Icons = "true" Then _Get_ADD_PlayersOnline_DATA()
	_Exit_Check()
	If $Add_SS_to_Icons = "true" Then _Get_AD_SS_Values_to_Icons()
	_Sync_Icons()
	_Exit_Check()
EndFunc

Func _Overlay_Search_Files()
	$ApplicationList_INI = $ApplicationList_SteamLibrary_ALL_INI
	Local $Combo = "ALL"
	If $Combo = "ALL" Then Local $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"

	If $Combo = "ALL" Then
			If $NR_Library_temp = 1 Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
			If $NR_Library_temp = 2 Then $s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
			If $NR_Library_temp = 3 Then $s_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
			If $NR_Library_temp = 4 Then $s_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
			If $NR_Library_temp = 5 Then $s_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"

			Local $FileList = _FileListToArray($s_LocalFolder , "*.acf" , 1)
			Global $Application_NR
			If $NR_Library_temp = 1 Then $Application_NR = 1

			If $FileList <> "" Then
				For $NR_temp2 = 1 To $FileList[0]
					Global $FileList_NR = $FileList[0]
					Global $File_Name = $FileList[$NR_temp2]
					Global $File_Path = $s_LocalFolder & $File_Name
					If StringLeft(FileRead($File_Path), 3) <> "0x0" Then
						_Overlay_ApplicationList_Update()
						$Application_NR = $Application_NR + 1
					EndIf
					$File_Path =  ""
				Next
				Sleep(500)
			EndIf
			$FileList = ""
	EndIf
EndFunc

Func _Overlay_ApplicationList_Update()
	$ApplicationList_INI = $ApplicationList_SteamLibrary_ALL_INI
	Global $File = $File_Path
	Global $Wert_Zeile = ""

	If $File <> "" Then
			For $iCount_1 = 1 To 7
				Local $Wert_Zeile_komplett = FileReadLine($File, $iCount_1)

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "appid")
				If $iPosition <> 0 Then
					Global $appid = StringReplace($Wert_Zeile_komplett, '	"appid"		"', '')
					$appid = StringReplace($appid, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "Universe")
				If $iPosition <> 0 Then
					Global $Universe = StringReplace($Wert_Zeile_komplett, '	"Universe"		"', '')
					$Universe = StringReplace($Universe, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "name")
				If $iPosition <> 0 Then
					$name = StringReplace($Wert_Zeile_komplett, '	"name"		"', '')
					$name = StringReplace($name, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "StateFlags")
				If $iPosition <> 0 Then
					Global $StateFlags = StringReplace($Wert_Zeile_komplett, '	"StateFlags"		"', '')
					$StateFlags = StringReplace($StateFlags, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "installdir")
				If $iPosition <> 0 Then
					Global $installdir = StringReplace($Wert_Zeile_komplett, '	"installdir"		"', '')
					$installdir = StringReplace($installdir, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "LastUpdated")
				If $iPosition <> 0 Then
					Global $LastUpdated = StringReplace($Wert_Zeile_komplett, '	"LastUpdated"		"', '')
					$LastUpdated = StringReplace($LastUpdated, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "UpdateResult")
				If $iPosition <> 0 Then
					Global $UpdateResult = StringReplace($Wert_Zeile_komplett, '	"UpdateResult"		"', '')
					$UpdateResult = StringReplace($UpdateResult, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "SizeOnDisk")
				If $iPosition <> 0 Then
					Global $SizeOnDisk = StringReplace($Wert_Zeile_komplett, '	"SizeOnDisk"		"', '')
					$SizeOnDisk = StringReplace($SizeOnDisk, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "buildid")
				If $iPosition <> 0 Then
					Global $buildid = StringReplace($Wert_Zeile_komplett, '	"buildid"		"', '')
					$buildid = StringReplace($buildid, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "LastOwner")
				If $iPosition <> 0 Then
					Global $LastOwner = StringReplace($Wert_Zeile_komplett, '	"LastOwner"		"', '')
					$LastOwner = StringReplace($LastOwner, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "BytesToDownload")
				If $iPosition <> 0 Then
					Global $BytesToDownload = StringReplace($Wert_Zeile_komplett, '	"BytesToDownload"		"', '')
					$BytesToDownload = StringReplace($BytesToDownload, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "BytesDownloaded")
				If $iPosition <> 0 Then
					Global $BytesDownloaded = StringReplace($Wert_Zeile_komplett, '	"BytesDownloaded"		"', '')
					$BytesDownloaded = StringReplace($BytesDownloaded, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "AutoUpdateBehavior")
				If $iPosition <> 0 Then
					Global $AutoUpdateBehavior = StringReplace($Wert_Zeile_komplett, '	"AutoUpdateBehavior"		"', '')
					$AutoUpdateBehavior = StringReplace($AutoUpdateBehavior, '"', '')
				EndIf

				Local $iPosition = StringInStr($Wert_Zeile_komplett, "AllowOtherDownloadsWhileRunning")
				If $iPosition <> 0 Then
					Global $AllowOtherDownloadsWhileRunning = StringReplace($Wert_Zeile_komplett, '	"AllowOtherDownloadsWhileRunning"		"', '')
					$AllowOtherDownloadsWhileRunning = StringReplace($AllowOtherDownloadsWhileRunning, '"', '')
				EndIf
			Next

			IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "NR", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "appid", $appid)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "name", $name)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "installdir", $installdir)

			IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "NR", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "appid", $appid)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "name", $name)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "installdir", $installdir)

			If $appid <> "" Then
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", $Icons & "steam.app." & $appid & ".jpg")
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", $Icons & "steam.app." & $appid & ".jpg")
			Else
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", "")
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", "")
			EndIf

			_Download_Icon_for_SteamGameID()

			If Not FileExists($Icons & "32x32\" & "steam.app." & $appid & ".bmp") Then
				_Get_SteamGame_Icon_32x32()
			EndIf

			If Not FileExists($Icons & "256x256\" & "steam.app." & $appid & ".bmp") Then
				_Get_SteamGame_Icon_256x256()
			EndIf

			If $appid <> "" Then
				_Get_ADD_PlayersOnline_DATA()
			EndIf
	EndIf
EndFunc
#endregion

#Region Func VR ToolBox
Func _Create_VRToolBox_StartPage()
	Local $Array_StartPageTemplate_Value

	Local $StartPage_path = $Install_DIR & "WebPage\VRToolBox_StartPage.html"
	If FileExists($StartPage_path) Then FileDelete($StartPage_path)
	Local $StartPageTemplate = $Install_DIR & "WebPage\VRToolBox.html"
	_FileReadToArray($StartPageTemplate, $Array_StartPageTemplate_Value, $FRTA_COUNT)

	If FileExists($StartPage_path) Then FileDelete($StartPage_path)

	Local $StartPage_NR_3 = IniRead($Config_INI, "TEMP", "StartPage_NR_3", "3")
	For $Loop_NR3 = 1 To $Array_StartPageTemplate_Value[0] - $StartPage_NR_3
		FileWriteLine($StartPage_path, $Array_StartPageTemplate_Value[$Loop_NR3])
	Next

	Local $Install_DIR_Replaced = StringReplace($Install_DIR, '\', '/')

	FileWriteLine($StartPage_path, '    <br><br><br><br>')
	FileWriteLine($StartPage_path, '    <div class="tooltip"><a href="file:///' & $Install_DIR_Replaced & 'WebPage/GamePage_ALL.html' & '">         <img class="icon" src="images/GamePageAllGames.png" width="190" />                    <span class="tooltiptext">All Games</span></a></div>')
	FileWriteLine($StartPage_path, '    <div class="tooltip"><a href="file:///' & $Install_DIR_Replaced & 'WebPage/GamePage_Non-Steam_Appl' & '">         <img class="icon" src="images/GamePage_NonSteamAppl.png" width="190" />                    <span class="tooltiptext">Non-Steam Appl.</span></a></div>')
	FileWriteLine($StartPage_path, '    <div class="tooltip"><a href="file:///' & $Install_DIR_Replaced & 'WebPage/GamePage_Custom_1.html' & '">         <img class="icon" src="images/GamePage1.png" width="190" />                    <span class="tooltiptext">Game Page 1</span></a></div>')
	FileWriteLine($StartPage_path, '    <div class="tooltip"><a href="file:///' & $Install_DIR_Replaced & 'WebPage/GamePage_Custom_2.html' & '">         <img class="icon" src="images/GamePage2.png" width="190" />                    <span class="tooltiptext">Game Page 2</span></a></div>')
	FileWriteLine($StartPage_path, '    <div class="tooltip"><a href="file:///' & $Install_DIR_Replaced & 'WebPage/GamePage_Custom_3.html' & '">         <img class="icon" src="images/GamePage3.png" width="190" />                    <span class="tooltiptext">Game Page 3</span></a></div>')
	FileWriteLine($StartPage_path, '    <div class="tooltip"><a href="file:///' & $Install_DIR_Replaced & 'WebPage/GamePage_Custom_4.html' & '">         <img class="icon" src="images/GamePage4.png" width="190" />                    <span class="tooltiptext">Game Page 4</span></a></div>')
	FileWriteLine($StartPage_path, '    <br><br><br><br>')
	FileWriteLine($StartPage_path, '    <div class="tooltip"><a href="file:///' & $Install_DIR_Replaced & 'WebPage/GamesPage.html' & '">         <img class="icon" src="images/Game.png" width="300" />                    <span class="tooltiptext">Game</span></a></div>')
	FileWriteLine($StartPage_path, '    <br><br><br><br>')
	FileWriteLine($StartPage_path, '  </div>')
	FileWriteLine($StartPage_path, '</body>')
	FileWriteLine($StartPage_path, '</html>')
EndFunc

Func _Copy_2_VRToolBox()
	Local $VRToolBox_path = $VRToolBox_Steam_Folder & "utils\StartPage.html"
	Local $VRToolBox_image_path = $VRToolBox_Steam_Folder & "utils\images\"
	Local $VRToolBox_StartPage_Template_path = $Install_DIR & "WebPage\VRToolBox_StartPage.html"
	Local $PageImageAll = $Install_DIR & "WebPage\images\GamePageAllGames.png"
	Local $PageImageNonSteamAppl = $Install_DIR & "WebPage\images\GamePage_NonSteamAppl.png"
	Local $PageImage1 = $Install_DIR & "WebPage\images\GamePage1.png"
	Local $PageImage2 = $Install_DIR & "WebPage\images\GamePage2.png"
	Local $PageImage3 = $Install_DIR & "WebPage\images\GamePage3.png"
	Local $PageImage4 = $Install_DIR & "WebPage\images\GamePage4.png"
	Local $PageImage5 = $Install_DIR & "WebPage\images\GamePage5.png"
	Local $PageImageGame = $Install_DIR & "WebPage\images\Game.png"

	If Not FileExists($VRToolBox_path & ".bak") Then FileCopy($VRToolBox_path, $VRToolBox_path & ".bak", $FC_OVERWRITE + $FC_CREATEPATH)

	If FileExists($PageImageAll) Then FileCopy($PageImageAll, $VRToolBox_image_path & "GamePageAllGames.png", $FC_OVERWRITE + $FC_CREATEPATH)
	If FileExists($PageImageNonSteamAppl) Then FileCopy($PageImageNonSteamAppl, $VRToolBox_image_path & "GamePage_NonSteamAppl.png", $FC_OVERWRITE + $FC_CREATEPATH)
	If FileExists($PageImage1) Then FileCopy($PageImage1, $VRToolBox_image_path & "GamePage1.png", $FC_OVERWRITE + $FC_CREATEPATH)
	If FileExists($PageImage2) Then FileCopy($PageImage2, $VRToolBox_image_path & "GamePage2.png", $FC_OVERWRITE + $FC_CREATEPATH)
	If FileExists($PageImage3) Then FileCopy($PageImage3, $VRToolBox_image_path & "GamePage3.png", $FC_OVERWRITE + $FC_CREATEPATH)
	If FileExists($PageImage4) Then FileCopy($PageImage4, $VRToolBox_image_path & "GamePage4.png", $FC_OVERWRITE + $FC_CREATEPATH)
	If FileExists($PageImage5) Then FileCopy($PageImage4, $VRToolBox_image_path & "GamePage5.png", $FC_OVERWRITE + $FC_CREATEPATH)
	If FileExists($PageImageGame) Then FileCopy($PageImageGame, $VRToolBox_image_path & "Game.png", $FC_OVERWRITE + $FC_CREATEPATH)

	If FileExists($VRToolBox_StartPage_Template_path) Then FileCopy($VRToolBox_StartPage_Template_path, $VRToolBox_path, $FC_OVERWRITE + $FC_CREATEPATH)
EndFunc
#endregion

#Region Func Create Game Pages
Func _Create_GamePages()
	Local $ApplicationList_TEMP, $GamePage_path, $NR_Applications, $PageName

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Creating Game Pages.")

	For $Loop_Temp = 1 To 6
		If $Loop_Temp = 1 Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Loop_Temp = 2 Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
		If $Loop_Temp = 3 Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
		If $Loop_Temp = 4 Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
		If $Loop_Temp = 5 Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
		If $Loop_Temp = 6 Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

		If $Loop_Temp = 1 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_ALL.html"
		If $Loop_Temp = 2 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Non-Steam_Appl.html"
		If $Loop_Temp = 3 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_1.html"
		If $Loop_Temp = 4 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_2.html"
		If $Loop_Temp = 5 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_3.html"
		If $Loop_Temp = 6 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_4.html"

		If $Loop_Temp = 1 Then $PageName = IniRead($Config_INI, "Settings", "TAB1_Name", "Steam Library")
		If $Loop_Temp = 2 Then $PageName = IniRead($Config_INI, "Settings", "TAB2_Name", "Non-Steam_Appl")
		If $Loop_Temp = 3 Then $PageName = IniRead($Config_INI, "Settings", "TAB3_Name", "Custom 1")
		If $Loop_Temp = 4 Then $PageName = IniRead($Config_INI, "Settings", "TAB4_Name", "Custom 2")
		If $Loop_Temp = 5 Then $PageName = IniRead($Config_INI, "Settings", "TAB5_Name", "Custom 3")
		If $Loop_Temp = 6 Then $PageName = IniRead($Config_INI, "Settings", "TAB6_Name", "Custom 4")


		If FileExists($ApplicationList_TEMP) Then
			$NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")


			If FileExists($GamePage_path) Then FileDelete($GamePage_path)

			FileWrite($GamePage_path, '<html>' & @CRLF & _
										'<head>' & @CRLF & _
										'    <title>GamesPage 1</title>' & @CRLF & _
										'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
										'</head>' & @CRLF & _
										'<body>' & @CRLF & _
										'<script>' & @CRLF & _
										'    function VRTStartCommand(cmd) {' & @CRLF & _
										"      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';" & @CRLF & _
										'      console.log(s);' & @CRLF & _
										'    }' & @CRLF & _
										'</script>' & @CRLF & _
										'<h1>' & $PageName & '</h1>' & @CRLF & _
										'<div class="icons">' & @CRLF)


			For $NR = 1 To $NR_Applications
				Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
				Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
				Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
				Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
				Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $Application_appid, "IconPath", "")
				Global $WebPage_IconPath = $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg"

				Local $StringLeft_Application_appid = StringLeft($Application_appid, 9)
				Local $StringTrimLeft_Application_appid = StringTrimLeft($Application_appid, 9)

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileCopy($gfx & "steamVR.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					If $StringLeft_Application_appid = "vive.htc." Then FileCopy($gfx & "Viveport.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If $HomeApp = "VR Toolbox" Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'steam://rungameid/" & $Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'vive://runapp/" & $StringTrimLeft_Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf

				If $HomeApp <> "VR Toolbox" Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="vive://runapp/' & $StringTrimLeft_Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf
			Next
			Sleep(100)
			FileWriteLine($GamePage_path, ' </div>')
			FileWriteLine($GamePage_path, '</body>')
			FileWriteLine($GamePage_path, '</html>')
			Sleep(100)
		EndIf
	Next
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating Game Pages. [NR of Games = " & $NR_Applications & ".")
EndFunc

Func _Create_SinglePages()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start creating Single Pages... ")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "" Then $ButtonTAB_State = "1"
	$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
	$GamePage_path = $Install_DIR & "WebPage\GamesPage.html"

	If FileExists($GamePage_path) Then FileDelete($GamePage_path)

	FileWrite($GamePage_path, '<html>' & @CRLF & _
								'<head>' & @CRLF & _
								'    <title>Games</title>' & @CRLF & _
								'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
								'</head>' & @CRLF & _
								'<body>' & @CRLF & _
								'<script>' & @CRLF & _
								' ' & @CRLF & _
								'</script>' & @CRLF & _
								'<br><br><br>' & @CRLF & _
								'<div class="icons">' & @CRLF)


	For $NR = 1 To $NR_Applications
		Local $Install_DIR_TEMP = StringReplace($Install_DIR, '\','/')
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
		Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
		Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
		Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $Application_appid, "IconPath", "")
		Global $WebPage_IconPath = $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg"
		Local $HTMLSinglePage_Path = $Install_DIR & "WebPage\steam.app." & $Application_appid & ".html"
		If FileExists($HTMLSinglePage_Path) Then FileDelete($HTMLSinglePage_Path)

		Local $StringLeft_Application_appid = StringLeft($Application_appid, 9)
		Local $StringTrimLeft_Application_appid = StringTrimLeft($Application_appid, 9)

		If Not FileExists($WebPage_IconPath) Then
			FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		EndIf

		If Not FileExists($WebPage_IconPath) Then
			FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		EndIf

		If Not FileExists($WebPage_IconPath) Then
			If $StringLeft_Application_appid <> "vive.htc." Then FileCopy($gfx & "steamVR.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
			If $StringLeft_Application_appid = "vive.htc." Then FileCopy($gfx & "Viveport.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		EndIf

		FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="file:///' & $Install_DIR_TEMP & 'WebPage/' & 'steam.app.' & $Application_appid & '.html' & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')

		FileWriteLine($HTMLSinglePage_Path, '<html>')
		FileWriteLine($HTMLSinglePage_Path, '<head>')
		FileWriteLine($HTMLSinglePage_Path, '    <title>Game</title>')
		FileWriteLine($HTMLSinglePage_Path, '    <link href="css/games.css" rel="stylesheet" type="text/css">')
		FileWriteLine($HTMLSinglePage_Path, '</head>')
		FileWriteLine($HTMLSinglePage_Path, '<body>')
		FileWriteLine($HTMLSinglePage_Path, '<script>')
		FileWriteLine($HTMLSinglePage_Path, '    function VRTStartCommand(cmd) {')
		FileWriteLine($HTMLSinglePage_Path, "      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';")
		FileWriteLine($HTMLSinglePage_Path, '      console.log(s);')
		FileWriteLine($HTMLSinglePage_Path, '    }')
		FileWriteLine($HTMLSinglePage_Path, '</script>')
		FileWriteLine($HTMLSinglePage_Path, '<div class="icons">')
		FileWriteLine($HTMLSinglePage_Path, '	<br><br><br><br>')
		If $HomeApp = "VR Toolbox" Then
			If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($HTMLSinglePage_Path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'steam://rungameid/" & $Application_appid & "');" & '">         <img class="icon2" src="images/steam.app.' & $Application_appid & '.jpg" width="1620" height="980" /></a></div>')
			If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($HTMLSinglePage_Path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'vive://runapp/" & $Application_appid & "');" & '">         <img class="icon2" src="images/steam.app.' & $Application_appid & '.jpg" width="1620" height="980" /></a></div>')
		Else
			FileWriteLine($HTMLSinglePage_Path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' ">         <img class="icon2" src="images/steam.app.' & $Application_appid & '.jpg" width="1620" height="980" /></a></div>')
		EndIf
		FileWriteLine($HTMLSinglePage_Path, ' </div>')
		FileWriteLine($HTMLSinglePage_Path, '</body>')
		FileWriteLine($HTMLSinglePage_Path, '</html>')
	Next

	Sleep(100)
	FileWriteLine($GamePage_path, ' </div>')
	FileWriteLine($GamePage_path, '</body>')
	FileWriteLine($GamePage_path, '</html>')
	Sleep(100)

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End Updating Single Game Pages. [NR of Game Pages created = " & $NR_Applications & ".")
EndFunc
#endregion

#Region Read/Write Steam Files
Func _Read_SteamVR_VRSettings()
	Local $FileLines = _FileCountLines($Steamvr_vrsettings_FilePath)
	_FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)

	$Loop_End_1 = $Steamvr_vrsettings_Array[0]

	For $LOOP = 1 to $Loop_End_1
		$Steamvr_vrsettings_aArray = _StringBetween($Steamvr_vrsettings_Array[$LOOP], '"', '"', $STR_ENDNOTSTART)

		If $Steamvr_vrsettings_aArray <> 0 Then

			If $Steamvr_vrsettings_aArray[0] <> "" Then
				Local $Check_Left = StringLeft($Steamvr_vrsettings_aArray[0], 10)
				Local $Check_Right = StringTrimLeft($Steamvr_vrsettings_aArray[0], 10)

				If $Check_Left = "steam.app." Then
					$Steam_app_Name_TEMP = _StringBetween($Steamvr_vrsettings_Array[$LOOP + 1], '"', '"', $STR_ENDNOTSTART)
					$ResolutionScale_TEMP = StringRight($Steamvr_vrsettings_Array[$LOOP + 2], 3)
					$ResolutionScale_TEMP = StringReplace($ResolutionScale_TEMP, ' ', '')
					Local $SteamAppID_TEMP = $Check_Right
					Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "NR", "")

					IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "name", $Steam_app_Name_TEMP[1])
					IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "name", $Steam_app_Name_TEMP[1])
					IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
					IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
				EndIf
			EndIf
		EndIf
	Next
EndFunc

Func _Write_to_SteamVR_VRSettings()
	$Add_SS_per_game = IniRead($config_ini,"Settings", "Add_SS_per_game", "")
	If $Add_SS_per_game = "true" Then
		If FileExists($Steamvr_vrsettings_FilePath & ".new") Then FileDelete($Steamvr_vrsettings_FilePath & ".new")
		Local $SteamAppExist = "false"
		Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
		$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
		Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

		Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
		Local $Steam_app_Name = $ListView_Item_Array[3]
		$Game_ID = $ListView_Item_Array[2]

		Local $FileLines = _FileCountLines($Steamvr_vrsettings_FilePath)
		_FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)
		$Loop_End_1 = $Steamvr_vrsettings_Array[0]

		For $LOOP = 1 to $Loop_End_1
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
							$ResolutionScale_TEMP = GUICtrlRead($Input_ResolutionScale)
							Local $SteamAppID_TEMP = $Check_Right
							Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "NR", "")

							;IniWrite($SteamVR_VRSettings_INI, "steam.app." & $SteamAppID_TEMP, "appName", $Steam_app_Name_TEMP[1])
							IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "name", $Steam_app_Name_TEMP[1])
							IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])

							;IniWrite($SteamVR_VRSettings_INI, "steam.app." & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
							IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
							IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)

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
			Local $ResolutionScale_TEMP = GUICtrlRead($Input_ResolutionScale)

			For $LOOP = 1 to $Loop_End_1 - 2
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$LOOP])
			Next

			Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "NR", "")

			;IniWrite($SteamVR_VRSettings_INI, "steam.app." & $SteamAppID_TEMP, "appName", $Steam_app_Name_TEMP)
			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "name", $Steam_app_Name_TEMP)
			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP)

			;IniWrite($SteamVR_VRSettings_INI, "steam.app." & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)

			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   },')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   "steam.app.' & $SteamAppID_TEMP & '" : {')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "appName" : "' & $Steam_app_Name_TEMP & '",')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "resolutionScale" : ' & $ResolutionScale_TEMP & '')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   }')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '}')
		EndIf
		If FileExists($Steamvr_vrsettings_FilePath) Then FileDelete($Steamvr_vrsettings_FilePath)
		FileMove($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_FilePath)
		_Read_from_INI_ADD_2_ListView()
	Else
		MsgBox($MB_ICONINFORMATION, "Attention!", "Read/Write Resolution Scale is disabled." & @CRLF & _
													"Enable it in the Settings to be able to use this function.")
	EndIf
EndFunc

Func _RM_Write_to_SteamVR_VRSettings()
	$Add_SS_per_game = IniRead($config_ini,"Settings", "Add_SS_per_game", "")
	If $Add_SS_per_game = "true" Then
		If FileExists($Steamvr_vrsettings_FilePath & ".new") Then FileDelete($Steamvr_vrsettings_FilePath & ".new")
		Local $SteamAppExist = "false"
		Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
		$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
		Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

		Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
		Local $Steam_app_Name = $ListView_Item_Array[3]
		$Game_ID = $ListView_Item_Array[2]

		Local $FileLines = _FileCountLines($Steamvr_vrsettings_FilePath)
		_FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)
		$Loop_End_1 = $Steamvr_vrsettings_Array[0]

		For $LOOP = 1 to $Loop_End_1
			$Steamvr_vrsettings_aArray = _StringBetween($Steamvr_vrsettings_Array[$LOOP], '"', '"', $STR_ENDNOTSTART)
			If $Steamvr_vrsettings_aArray <> "" Then
				If $Steamvr_vrsettings_aArray <> 0 Then
					If $Steamvr_vrsettings_aArray[0] <> "" Then
						Local $Check_Left = StringLeft($Steamvr_vrsettings_aArray[0], 10)
						Local $Check_Right = $Game_ID

						If $Steamvr_vrsettings_aArray[0] = "steam.app." & $Check_Right Then
							$SteamAppExist = "true"
							$Steam_app_Name_TEMP = _StringBetween($Steamvr_vrsettings_Array[$LOOP + 1], '"', '"', $STR_ENDNOTSTART)
							Local $SteamAppID_TEMP = $Check_Right
							Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "NR", "")

							IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "name", $Steam_app_Name_TEMP[1])
							IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])

							IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
							IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)

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

			For $LOOP = 1 to $Loop_End_1 - 2
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$LOOP])
			Next

			Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "NR", "")

			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "name", $Steam_app_Name_TEMP)
			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP)

			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
			IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)

			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   },')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   "steam.app.' & $SteamAppID_TEMP & '" : {')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "appName" : "' & $Steam_app_Name_TEMP & '",')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "resolutionScale" : ' & $ResolutionScale_TEMP & '')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   }')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '}')
		EndIf
		If FileExists($Steamvr_vrsettings_FilePath) Then FileDelete($Steamvr_vrsettings_FilePath)
		FileMove($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_FilePath)
		_Read_from_INI_ADD_2_ListView()
	Else
		MsgBox($MB_ICONINFORMATION, "Attention!", "Read/Write Resolution Scale is disabled." & @CRLF & _
													"Enable it in the Settings to be able to use this function.")
	EndIf
EndFunc

#endregion


