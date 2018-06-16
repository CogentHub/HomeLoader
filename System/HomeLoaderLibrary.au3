
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
#include <IE.au3>
#include <Process.au3>
#include <Misc.au3>
#EndRegion Includes


Opt("GUIOnEventMode", 1)

#Region Set Global
Global $HLL_GUI, $HLL_Settings_GUI
Global $GUI_Loading, $AddGame2Library_GUI, $HomeLoaderLibrary_GUI, $Button_Exit_Settings_GUI, $HTML_GUI, $NR_Applications
Global $appid, $name, $installdir, $NR_temp1, $NR_temp2, $NR_temp3, $NR_Library, $NR_Library_temp
Global $listview, $listview_2, $listview_3, $listview_4, $listview_5, $listview_6, $iStylesEx, $CheckBox_Restart, $Icon_Preview, $ApplicationList_TEMP
Global $ListView_ImageList_Temp, $SS_Settings_GUI, $VRSettings_Group, $ApplicationList_INI_TEMP
Global $TAB_NR, $listview_7, $listview_8, $listview_9, $listview_10, $listview_11, $listview_TEMP
Global $contextmenu, $RM_Item0, $RM_Item1, $RM_Item2, $RM_Item3, $RM_Item4, $RM_Item5, $RM_Item5_1, $RM_Item5_2
Global $RM_Item6, $RM_Item7, $RM_Item8, $RM_Item9, $RM_Item10, $RM_Item11, $RM_Item12
Global $RM_Item_RS_0, $RM_Item_RS_1, $RM_Item_RS_2, $RM_Item_RS_3, $RM_Item_RS_4, $RM_Item_RS_5, $RM_Item_RS_6, $RM_Item_RS_7, $RM_Item_RS_8
Global $RM_Item_RS_9, $RM_Item_RS_10, $RM_Item_RS_11, $RM_Item_RS_12, $RM_Item_RS_13, $RM_Item_RS_14
Global $GUI, $UpdateOverlay_SettingValue, $ScanLibrary_OnStart_SettingValue, $LOOP_NR_TEMP, $SteamAppID_TEMP, $NR_LOOP_TO_TEMP
Global $Key_Name_TEMP, $ReadLine_SteamAppCheck, $ResolutionScale_Group, $ReadLine, $Steam_app_Name_TEMP, $ResolutionScale_TEMP
Global $Game_ID, $hImage1, $hImage2, $hBMPBuff, $hImage1_Path, $hImage2_Path, $hGraphic, $hPen, $Statusbar
Global $Steamvr_vrsettings_Array, $Steamvr_vrsettings_aArray, $Loop_End_1, $Application_NR, $Anzeige_Fortschrittbalken
Global $Steamapps_vrmanifest_Array, $Steamapps_vrmanifest_aArray, $Array_Sorted[1][4], $ApplicationList_TEMP_RS
Global $TAB_Label, $Revive_revive_vrmanifest_Array, $Revive_support_vrmanifest_Array, $Anzeige_Fortschrittbalken_2
Global $Status_Combo_ApplicationList, $Parameter_Temp, $DataResponse, $Array_Library
Global $ButtonTAB_Steam_Library, $ButtonTAB_Custom_1, $ButtonTAB_Custom_2, $ButtonTAB_Custom_3, $ButtonTAB_Custom_4
Global $Added_to_Custom_Page, $Added_to_Custom_1, $Added_to_Custom_2, $Added_to_Custom_3, $Added_to_Custom_4
Global $Checkbox_ScanVIVEApps_Value, $Checkbox_ScanOculusApps_Value, $Checkbox_Sort_Alphabetical_order_Value, $Checkbox_Allow_Multiple_Tag_Assignments_Value
Global $Checkbox_Add_PlayersOnline_to_Icons_Value, $Checkbox_Add_SS_to_Icons_Value, $Checkbox_Add_SS_per_game_Value
Global $Checkbox_Add_SS_per_game_Value, $Checkbox_Create_HTML_GamePage_Value, $Checkbox_DeleteHomeLoaderLibraryData_Value
Global $Checkbox_Add_Apps_Tags_to_categories_Value, $Checkbox_Settings_1, $Checkbox_Settings_2, $Checkbox_Settings_3
Global $Checkbox_Settings_4, $Checkbox_Settings_5, $Checkbox_Settings_6, $Checkbox_Settings_7, $Checkbox_Settings_8, $Checkbox_Settings_9
Global $Checkbox_Settings_10, $Checkbox_Settings_11, $Checkbox_Settings_12, $Checkbox_Settings_13, $Checkbox_Settings_1_Label, $Checkbox_Settings_2_Label
Global $Checkbox_Settings_3_Label, $Checkbox_Settings_4_Label, $Checkbox_Settings_5_Label, $Checkbox_Settings_6_Label, $Checkbox_Settings_7_Label, $Checkbox_Settings_8_Label
Global $Checkbox_Settings_9_Label, $Checkbox_Settings_10_Label, $Checkbox_Settings_11_Label, $Checkbox_Settings_12_Label, $Checkbox_Settings_13_Label
Global $font = "arial"
Global $font_arial = "arial"

Global $DesktopWidth = "855"
Global $DesktopHeight = @DesktopHeight - 75
Global $POS_X_GUI = 4

Global $oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")
#EndRegion Set Global

#Region Declare Variables/Const 1
Global $Version = "0.72"
Global $Install_DIR = @ScriptDir & "\"
Global $System_DIR = $Install_DIR & "System\"
;Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
;If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
;Global $Config_INI = @ScriptDir & "\config.ini"
Global $Config_INI = $System_DIR & "config.ini"
Global $SteamVR_VRSettings_INI = _PathFull("HomeLoader\SteamVR_VRSettings.ini", @AppDataDir)
If Not FileExists($SteamVR_VRSettings_INI) Then FileCopy(@ScriptDir & "\SteamVR_VRSettings.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
;Global $System_DIR = $Install_DIR & "System\"
;Global $System_DIR = $Install_DIR & "\System\"
Global $MainCategory_ApplicationList = IniRead($Config_INI, "Settings", "MainCategory", "")
Global $MainCategory_ApplicationList_Folder = $Install_DIR & "ApplicationList\Tags\"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $ApplicationList_INI = $Install_DIR & "ApplicationList.ini"
Global $GamePage_path = $Install_DIR & "WebPage\StartPage.html"
Global $Steam_Library = IniRead($Config_INI, "Settings", "Steam_Library", "")
Global $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
Global $Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "")
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")
Global $Use_Local_Icons = IniRead($Config_INI, "Settings", "Use_Local_Icons", "")
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
Global $Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "false")
Global $Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "false")
Global $Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
Global $Tags_TXT = $Install_DIR & "System\Tags.txt"

Global $Path_GamePage_Tags = $Install_DIR & "WebPage\GamePage_Tags.html"

Global $gfx = $Install_DIR & "System\gfx\"
Global $Icons = $Install_DIR & "Icons\"

Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")

Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
Global $Steam_Path = StringReplace($Steam_Path_REG, '/', '\') & "\"
Global $SteamVR_Path = $Steam_Path & "SteamApps\common\SteamVR\"
Global $libraryfolders_vdf = $Steam_Path & "steamapps\libraryfolders.vdf"

Global $default_vrsettings_File = $SteamVR_Path & "resources\settings\default.vrsettings"
If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
Global $default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
Global $default_vrsettings_File_new = $default_vrsettings_File & ".new"

Global $Steam_AppConfig_Json = $Steam_Path & "config\appconfig.json"

Global $HomeLoader_Overlay_Folder = $Steam_Path & "steamapps\common\VRUtilityBelt\addons\custom\HomeLoader\overlays\HomeLoader\"

Global $VRToolBox_Steam_Folder = $Steam_Path & "steamapps\common\VRToolbox\"

Global $HTCVive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\HTC\HTC Vive\', "ViveHelperPath")
Global $HTCVive_Path_StringReplace_1 = StringReplace($HTCVive_Path_REG, 'PCClient\ViveportDesktopHelper.exe', '')
Global $HTCVive_Path = StringReplace($HTCVive_Path_StringReplace_1, '/', '\')

Global $Oculus_Default_Library_REG = RegRead('HKEY_CURRENT_USER\Software\Oculus VR, LLC\Oculus\Libraries\', "DefaultLibrary")
Global $Oculus_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Oculus VR, LLC\Oculus\Libraries\' & $Oculus_Default_Library_REG, "Path")
Global $Oculus_Path_Position = StringInStr($Oculus_Path_REG, "}")
Global $Oculus_Path_StringReplace = StringTrimLeft($Oculus_Path_REG, $Oculus_Path_Position)
Global $Oculus_Path

For $Loop = Asc("A") To Asc("Z")
	Global $Check_Oculus_Path = Chr($Loop) & ':' & $Oculus_Path_StringReplace
	If FileExists($Check_Oculus_Path) Then $Oculus_Path = $Check_Oculus_Path
	If FileExists($Check_Oculus_Path) Then ExitLoop
Next

Global $Revive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Revive\', "")
Global $Revive_Path = StringReplace($Revive_Path_REG, '/', '\')
If StringRight($Revive_Path, 1) <> "\" Then $Revive_Path = $Revive_Path & "\"

Global $Revive_revive_vrmanifest_FilePath = $Revive_Path & "revive.vrmanifest"
Global $Revive_support_vrmanifest_FilePath = $Revive_Path & "support.vrmanifest"

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


Global $Steam_tools_vrmanifest_File = $SteamVR_Path & "tools\tools.vrmanifest"
If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
Global $Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"

Global $Steamvr_vrsettings_FilePath = $Steam_Path & "config\steamvr.vrsettings"
If Not FileExists($Steamvr_vrsettings_FilePath & ".bak") Then FileCopy($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_FilePath & ".bak", $FC_CREATEPATH + $FC_OVERWRITE)
If Not FileExists($Install_DIR & "Backups\steamvr.vrsettings") Then FileCopy($Steamvr_vrsettings_FilePath, $Install_DIR & "Backups\steamvr.vrsettings")

Global $Steamapps_vrmanifest_FilePath = $Steam_Path & "config\steamapps.vrmanifest"
If Not FileExists($Steamapps_vrmanifest_FilePath & ".bak") Then FileCopy($Steamapps_vrmanifest_FilePath, $Steamapps_vrmanifest_FilePath & ".bak", $FC_CREATEPATH + $FC_OVERWRITE)
If Not FileExists($Install_DIR & "Backups\steamapps.vrmanifest") Then FileCopy($Steamapps_vrmanifest_FilePath, $Install_DIR & "Backups\steamapps.vrmanifest")

Global $ApplicationList_SteamVRLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
Global $ApplicationList_Non_Steam_Appl_INI = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
Global $ApplicationList_Custom_1_INI = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
Global $ApplicationList_Custom_2_INI = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
Global $ApplicationList_Custom_3_INI = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
Global $ApplicationList_Custom_4_INI = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

Global $ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")

Global $stats_log_FILE = $System_DIR & "Logs\stats_log.txt"

IniWrite($Config_INI, "Settings", "Version", $Version)
#EndRegion Declare Variables/Const 1

;MsgBox(0, "HLL 1", $First_Start & @CRLF & _
;					$Config_INI & @CRLF & _
;					$Install_DIR & @CRLF & _
;					$System_DIR & @CRLF & _
;					$Steam_Path & @CRLF & _
;					$SteamVR_Path & @CRLF)

#Region First Start and Update performed Check
_First_Start_Empty_Check_1()
;_First_Start_Check()

If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK, $FC_OVERWRITE)
If $default_vrsettings_File = "" Then MsgBox($MB_ICONWARNING, "Attention!", "Default.vrsettings File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")

If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK, $FC_OVERWRITE)
If $Steam_tools_vrmanifest_File = "" Then MsgBox($MB_ICONWARNING, "Attention!", "Tools.vrmanifest File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")

#EndRegion First Start and Update performed Check

#Region Declare Names
Global $TAB1_Label = IniRead($Config_INI, "Settings", "TAB1_Name", "")
Global $TAB2_Label = IniRead($Config_INI, "Settings", "TAB2_Name", "")
Global $TAB3_Label = IniRead($Config_INI, "Settings", "TAB3_Name", "")
Global $TAB4_Label = IniRead($Config_INI, "Settings", "TAB4_Name", "")
Global $TAB5_Label = IniRead($Config_INI, "Settings", "TAB5_Name", "")
Global $TAB6_Label = IniRead($Config_INI, "Settings", "TAB6_Name", "")
If $TAB1_Label = "" Then $TAB1_Label = "Library"
If $TAB2_Label = "" Then $TAB2_Label = "Non-Library Appl."
If $TAB3_Label = "" Then $TAB3_Label = "Custom 1"
If $TAB4_Label = "" Then $TAB4_Label = "Custom 2"
If $TAB5_Label = "" Then $TAB5_Label = "Custom 3"
If $TAB6_Label = "" Then $TAB6_Label = "Custom 4"
#EndRegion Declare Names

#Region Start Check
Local $Parameter_1 = ""
If $CmdLine[0] Then
	$Parameter_1 = $CmdLine[1]
EndIf

If $Parameter_1 = "GUI - HomeLoaderLibrary ListViewMode" Then
	_Create_HLL_GUI()
EndIf

If $Parameter_1 = "GamePageMode" Then
	_Create_HTMLGamePage_GUI()
EndIf

If $Autostart_VRUB = "true" Then
	Local $Parameter_1 = ""
	If $CmdLine[0] Then
		$Parameter_1 = $CmdLine[1]
	EndIf

	If $Parameter_1 = "UpdateOverlay" Then
		$Parameter_Temp = "Update"
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Scan/Updating Overlay:")
		If $HomeApp = "VR Toolbox" Then _Create_VRToolBox_VideoPage()
		$UpdateOverlay_SettingValue = IniRead($Config_INI, "Settings", "UpdateOverlay", "")
		$ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
		;_Exit_Check()

		If $ScanLibrary_OnStart_SettingValue = "true" Then
			_Button_ReScan_Steam_Library_AutoUpdate()
		EndIf
		MsgBox(0, "1", "UpdateOverlay fertig")
		Exit
	EndIf

	If $Parameter_1 = "UpdateStartPage" Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start creating VRToolBox StartPage:")
		_Create_VRToolBox_StartPage()
		_Create_VRToolBox_HL_StartPage()
		_Create_VRToolBox_VideoPage()
		_Copy_2_VRToolBox()
		;_Exit_Check()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating VRToolBox StartPage:")
		Exit
	EndIf
Else
	Local $Parameter_1 = ""
	If $CmdLine[0] Then
		$Parameter_1 = $CmdLine[1]
	EndIf

	If $Parameter_1 = "Update" Then
		$Parameter_Temp = "Update"
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Scan/Updating:")
		$UpdateOverlay_SettingValue = IniRead($Config_INI, "Settings", "UpdateOverlay", "")
		$ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
		If $HomeApp = "VR Toolbox" Then _Create_VRToolBox_VideoPage()
		;_Exit_Check()

		If $ScanLibrary_OnStart_SettingValue = "true" Then
			_Button_ReScan_Steam_Library_AutoUpdate()
		EndIf
		Exit
	EndIf

	If $Parameter_1 = "UpdateStartPage" Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start creating VRToolBox StartPage:")
		_Create_VRToolBox_StartPage()
		_Create_VRToolBox_HL_StartPage()
		_Create_VRToolBox_VideoPage()
		_Copy_2_VRToolBox()
		;_Exit_Check()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating VRToolBox StartPage:")
		Exit
	EndIf
EndIf
#EndRegion Start Check

Local $Parameter_1 = ""
If $CmdLine[0] Then
	$Parameter_1 = $CmdLine[1]
EndIf

If $Parameter_1 = "Read_SteamVR_VRSettings_IN" Then
	_Read_SteamVR_VRSettings()
	;Exit
EndIf

#Region GUI
If $First_Start <> "true" Then
	;_Create_HLL_GUI()
EndIf

#EndRegion GUI

#Region Load Data
;_Set_States()
;_RM_Buttons()
#EndRegion Load Data

If $Parameter_1 = "Show_SS_Menu" Then
	_SS_GUI()
EndIf


#Region While 1
;While 1
;	Sleep(100)
;	Global $nMsg = GUIGetMsg()
;
;	Switch $nMsg
;
;		Case $GUI_EVENT_CLOSE
;			Exit
;
;	EndSwitch
;WEnd
#EndRegion While 1


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

			Local $FileSelect = FileOpenDialog("Default.vrsettings File", $Install_DIR, "All (*.*)", $FD_FILEMUSTEXIST)
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

			Local $FileSelect = FileOpenDialog("Tools.vrmanifest File", $Install_DIR, "All (*.*)", $FD_FILEMUSTEXIST)
			If $FileSelect <> "" Then
				IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $FileSelect)
			Else
				MsgBox($MB_ICONWARNING, "Attention!", "Tools.vrmanifest File" & @CRLF & @CRLF & "Search the File and write the path manually to the config.igi File or try again.")
				IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
				_Restart()
			EndIf
		EndIf
	EndIf
	_HLL_Detect_SteamVR_Files()

	If FileExists(@DesktopDir & "\HomeLoaderOverlay.url") Then
		Local $HomeLoaderOverlay_url = IniRead(@DesktopDir & "\HomeLoaderOverlay.url", "InternetShortcut", "URL", "ERROR")
		Local $StringReplace_SteamID = StringReplace($HomeLoaderOverlay_url, 'http://"steam://rungameid/', '')
		Local $HomeLoaderOverlaySteamID = StringReplace($StringReplace_SteamID, '"', '')
		IniWrite($Config_INI, "Settings", "HomeLoaderOverlaySteamID", $HomeLoaderOverlaySteamID)
		FileDelete(@DesktopDir & "\HomeLoaderOverlay.url")
	EndIf

EndFunc   ;==>_First_Start_Empty_Check_1

Func _HLL_Detect_SteamVR_Files()
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
EndFunc   ;==>_Detect_SteamVR_Files
#EndRegion First Start And Update / Empty Check

#Region Func MAIN
Func _Loading_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	Local $POS_X_Loading_GUI = ($DesktopWidth / 2) - 152

	$GUI_Loading = GUICreate("Loading...please wait...", 250, 65, $POS_X_Loading_GUI, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
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
EndFunc   ;==>_Loading_GUI

Func _Create_HLL_GUI()
	Local $hGUI, $hGraphic, $hPen
	Local $HLL_GUI, $aSize, $aStrings[5]
	Local $btn, $chk, $rdo, $Msg
	Local $GUI_List_Auswahl, $tu_Button0, $to_button1, $to_button2, $to_button3, $to_button4
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sPath = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\Advanced\Images"

	$HLL_GUI = GUICreate("HomeLoader - Library", 800, $DesktopHeight, $POS_X_GUI, 4, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
	Global $HLL_GUI_Handle = $HLL_GUI

	; PROGRESS
	Global $Anzeige_Fortschrittbalken_2 = GUICtrlCreateProgress(0, $DesktopHeight - 25, $DesktopWidth, 5)
	Global $Anzeige_Fortschrittbalken = GUICtrlCreateProgress(0, $DesktopHeight - 121, $DesktopWidth, 5)

	;MsgBox(0, $HLL_GUI, $HLL_GUI)

	$Statusbar = _GUICtrlStatusBar_Create($HLL_GUI)
	_GUICtrlStatusBar_SetSimple($Statusbar, True)
	_GUICtrlStatusBar_SetText($Statusbar, "Loading, please wait." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	;GUISetState()

	;MsgBox(0, $Statusbar, _GUICtrlStatusBar_IsSimple($Statusbar))

	; Rahmen
	Global $Linie_oben = GUICtrlCreatePic($gfx & "Frame.jpg", 629, 4, 165, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_unten = GUICtrlCreatePic($gfx & "Frame.jpg", 629, 82, 165, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_rechts = GUICtrlCreatePic($gfx & "Frame.jpg", 791, 4, 3, 81, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_links = GUICtrlCreatePic($gfx & "Frame.jpg", 628, 4, 3, 81, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))

	; Icon Preview
	Global $Icon_Preview_Image = GUICtrlCreatePic($gfx & "Icon_Preview.jpg", 631, 7, 160, 75)

	Global $Button_AddGame2Library = GUICtrlCreateButton("Add Game to Library", 220, $DesktopHeight - 107, 100, 80, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_AddGame2Library, $gfx & "AddGame2Library.bmp")
	GUICtrlSetTip(-1, "Add Game to the Home Loader Library." & @CRLF & "It will show up in the Non-Library Appl. category.")

	Global $Button_ReScan_Steam_Library = GUICtrlCreateButton("Rescan Library", 4, 5, 207, 42, $BS_BITMAP) ; 155, 80 --> 174, 71
	_GUICtrlButton_SetImage($Button_ReScan_Steam_Library, $gfx & "ReScan_SteamLibrary.bmp")
	GUICtrlSetTip(-1, "Scans for all data." & @CRLF & @CRLF & _
			"This includes:" & @CRLF & _
			"- Scan for new games" & @CRLF & _
			"- Download Icons [If Delete Library Data is activated and/or if the app is new]" & @CRLF & _
			"- Search Steamdb Info and Add Player count" & @CRLF & _
			"- Check and Add Resolution Scale" & @CRLF & _
			"- Search Steamdb Info and Add Apps based on their Tags to Categories" & @CRLF & _
			"- Create HTML Game Pages" & @CRLF & _
			"- Syncs Data with VRUB Overlay [If activated]" & @CRLF & @CRLF & _
			"Scan Settings can be changed using the Scan Options.")

	_RM_Button_Scan()

	If $MainCategory_ApplicationList = "" Then $MainCategory_ApplicationList = "Choose Category"
	Global $Combo_ApplicationList = GUICtrlCreateCombo($MainCategory_ApplicationList, 5, 52, 205, 32, $CBS_DROPDOWNLIST)
	Local $Combo_ApplicationList_Data = "ALL Categories" & "|" & "------------"
	For $Loop_Temp = 1 To 30
		$Combo_ApplicationList_Data = $Combo_ApplicationList_Data & "|" & FileReadLine($Tags_TXT, $Loop_Temp)
	Next
	GUICtrlSetData(-1, $Combo_ApplicationList_Data, "")
	GUICtrlSetFont(-1, 14, 400, 2, "arial")

	GUICtrlCreateLabel("", 220, 18, 21, 22)
	GUICtrlSetBkColor(-1, 0)
	GUICtrlSetState(-1, $GUI_DISABLE)
	Local $State_Checkbox_ScanOnlyVR = "", $Checkbox_ScanOnlyVR_Label = ""
	If $ScanOnlyVR = "true" Then $State_Checkbox_ScanOnlyVR = "X"
	If $ScanOnlyVR <> "true" Then $State_Checkbox_ScanOnlyVR = ""
	Global $Checkbox_ScanOnlyVR = GUICtrlCreateLabel($State_Checkbox_ScanOnlyVR, 160 + 61, 18 + 1, 19, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 19)
	Global $Checkbox_ScanOnlyVR_Label = GUICtrlCreateLabel("Only VR Apps", 153 + 93, 15, 160, 30) ; ; +26
	GUICtrlSetFont(-1, 19, 400, 1, "arial")
	GUICtrlSetOnEvent($Checkbox_ScanOnlyVR, "_Checkbox_Show_OnlyVR_Apps")
	GUICtrlSetOnEvent($Checkbox_ScanOnlyVR_Label, "_Checkbox_Show_OnlyVR_Apps")
	GUICtrlSetTip($Checkbox_ScanOnlyVR, "Shows only VR Apps" & @CRLF & "[and with an new Scan it scans only for VR Apps]." & @CRLF)
	GUICtrlSetTip($Checkbox_ScanOnlyVR_Label, "Shows only VR Apps" & @CRLF & "[and with an new Scan it scans only for VR Apps]." & @CRLF)

	GUICtrlCreateLabel("", 220, 48, 21, 22)
	GUICtrlSetBkColor(-1, 0)
	GUICtrlSetState(-1, $GUI_DISABLE)
	Local $State_Checkbox_ScanAll = "", $Checkbox_ScanOAll_Label = ""
	If $ScanOnlyVR = "false" Then $State_Checkbox_ScanAll = "X"
	If $ScanOnlyVR <> "false" Then $State_Checkbox_ScanAll = ""
	Global $Checkbox_ScanAll = GUICtrlCreateLabel($State_Checkbox_ScanAll, 160 + 61, 48 + 1, 19, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 19)
	Global $Checkbox_ScanAll_Label = GUICtrlCreateLabel("All Apps", 153 + 93, 46, 95, 30) ; ; +26
	GUICtrlSetFont(-1, 19, 400, 1, "arial")
	GUICtrlSetOnEvent($Checkbox_ScanAll, "_Checkbox_Show_All_Apps")
	GUICtrlSetOnEvent($Checkbox_ScanAll_Label, "_Checkbox_Show_All_Apps")
	GUICtrlSetTip($Checkbox_ScanAll, "Shows All VR Apps" & @CRLF & "[and with an new scan it scans for All Apps]." & @CRLF)
	GUICtrlSetTip($Checkbox_ScanAll_Label, "Shows All VR Apps" & @CRLF & "[and with an new scan it scans for All Apps]." & @CRLF)


	Global $Checkbox_ScanLibrary_OnStart_Value = ""
	If $ScanLibrary_OnStart_SettingValue = "true" Then $Checkbox_ScanLibrary_OnStart_Value = "a"
	Global $Checkbox_ScanLibrary_OnStart = GUICtrlCreateLabel($Checkbox_ScanLibrary_OnStart_Value, 440, 05, 15, 15, 0x1201)
	GUICtrlSetTip(-1, "Scans for all data everytime the HomeApp is started." & @CRLF & @CRLF & _
			"This includes:" & @CRLF & _
			"- Scan for new games" & @CRLF & _
			"- Download Icons [If Delete Library Data is activated]" & @CRLF & _
			"- Search and Add Player count" & @CRLF & _
			"- Check and Add Resolution Scale" & @CRLF & _
			"- Syncs Data with VRUB Overlay [If activated]")
	GUICtrlSetFont(-1, 18, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	Global $Checkbox_ScanLibrary_OnStart_Label = GUICtrlCreateLabel("Scan with HomeApp Start", 460, 04, 165, 20)
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GUICtrlSetTip(-1, "Scans for all data everytime the HomeApp is started." & @CRLF & @CRLF & _
			"This includes:" & @CRLF & _
			"- Scan for new games" & @CRLF & _
			"- Download Icons [If Delete Library Data is activated and/or if the app is new]" & @CRLF & _
			"- Search Steamdb Info and Add Player count" & @CRLF & _
			"- Check and Add Resolution Scale" & @CRLF & _
			"- Search Steamdb Info and Add Apps based on their Tags to Categories" & @CRLF & _
			"- Create HTML Game Pages" & @CRLF & _
			"- Syncs Data with VRUB Overlay [If activated]" & @CRLF & @CRLF & _
			"Scan Settings can be changed using the Scan Options.")


	Global $Checkbox_Request_Steamdb_info_Value = ""
	If $Request_Steamdb_info = "true" Then $Checkbox_Request_Steamdb_info_Value = "a"
	Global $Checkbox_Request_Steamdb_info = GUICtrlCreateLabel($Checkbox_Request_Steamdb_info_Value, 440, 25, 15, 15, 0x1201)
	GUICtrlSetTip(-1, "Delete the old HomeLoader Library Data first before/with an new Scan." & @CRLF)
	GUICtrlSetFont(-1, 18, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	Global $Checkbox_Request_Steamdb_info_Label = GUICtrlCreateLabel("Request Steamdb Info", 460, 24, 165, 17)
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GUICtrlSetTip(-1, "Requests Steamdb Info from 'https://steamdb.info/...'" & @CRLF & "and adds it to the HomeLoader Library during the Scan." & @CRLF)

	Global $Checkbox_Use_Steam_Tags_Value = ""
	If $Use_Steam_Tags = "true" Then $Checkbox_Use_Steam_Tags_Value = "a"
	Global $Checkbox_Use_Steam_Tags = GUICtrlCreateLabel($Checkbox_Use_Steam_Tags_Value, 440, 45, 15, 15, 0x1201)
	GUICtrlSetTip(-1, "Sort Apps in Alphabetical order after/with an new Scan." & @CRLF)
	GUICtrlSetFont(-1, 18, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	Global $Checkbox_Use_Steam_Tags_Label = GUICtrlCreateLabel("Request Steamdb Tags", 460, 44, 165, 17)
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GUICtrlSetTip(-1, "Requests Tags from the Steamdb Info database 'https://steamdb.info/...'" & @CRLF & "and adds all Games to the matching categorie during the Scan." & @CRLF)

	Global $Button_More_Scan_Options = GUICtrlCreateButton("More Scan Options", 439, 62, 185, 24, $BS_BITMAP)
	GUICtrlSetColor(-1, "0x0000CD")
	GUICtrlSetFont(-1, 10, 600, 2, "arial")
	_RM_More_Scan_Options()


	Global $Button_ResolutionScale = GUICtrlCreateButton("Resolution Scale", 430, $DesktopHeight - 107, 96, 37, $BS_BITMAP) ; 440, $DesktopHeight - 100, 96, 42
	_GUICtrlButton_SetImage($Button_ResolutionScale, $gfx & "ResolutionScale.bmp")
	GUICtrlSetTip(-1, "Shows the HomeLoader Resolution Scale Window.")

	Global $Button_HomeLoaderSettings = GUICtrlCreateButton("Home Loader settings", 430, $DesktopHeight - 65, 96, 37, $BS_BITMAP) ; 440, $DesktopHeight - 100, 96, 42
	_GUICtrlButton_SetImage($Button_HomeLoaderSettings, $gfx & "HomeLoaderSettings.bmp")
	GUICtrlSetTip(-1, "Shows the HomeLoader Settings Window where it is possible to change the Home App.")

	Global $Button_Settings = GUICtrlCreateButton("Settings", 590, $DesktopHeight - 100, 65, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Settings, $gfx & "Settings.bmp")
	GUICtrlSetTip(-1, "Settings." & @CRLF & @CRLF & "Includes:" & @CRLF & "- Steam Library Folders" & @CRLF & "- Icon Folders")

	Global $Button_Restart = GUICtrlCreateButton("Restart", 660, $DesktopHeight - 100, 65, 65, $BS_BITMAP) ;
	_GUICtrlButton_SetImage($Button_Restart, $gfx & "Restart.bmp")
	GUICtrlSetTip(-1, "Restart.")

	Global $Button_Exit = GUICtrlCreateButton("Exit", 730, $DesktopHeight - 100, 65, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Exit, $gfx & "Exit.bmp")
	GUICtrlSetTip(-1, "Close.")


	Global $ButtonTAB_Steam_Library = GUICtrlCreateButton($TAB1_Label, 3, 90, 130)
	Global $ButtonTAB_Non_Steam_Appl = GUICtrlCreateButton($TAB2_Label, 133, 90, 130)
	Global $ButtonTAB_Custom_1 = GUICtrlCreateButton($TAB3_Label, 278, 90, 130)
	Global $ButtonTAB_Custom_2 = GUICtrlCreateButton($TAB4_Label, 408, 90, 130)
	Global $ButtonTAB_Custom_3 = GUICtrlCreateButton($TAB5_Label, 538, 90, 130)
	Global $ButtonTAB_Custom_4 = GUICtrlCreateButton($TAB6_Label, 668, 90, 130)

	GUICtrlSetTip($ButtonTAB_Steam_Library, "Shows the '" & $TAB1_Label & "' Category.")
	GUICtrlSetTip($ButtonTAB_Non_Steam_Appl, "Shows the '" & $TAB2_Label & "' Category.")
	GUICtrlSetTip($ButtonTAB_Custom_1, "Shows the '" & $TAB3_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags it.")
	GUICtrlSetTip($ButtonTAB_Custom_2, "Shows the '" & $TAB4_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags it.")
	GUICtrlSetTip($ButtonTAB_Custom_3, "Shows the '" & $TAB5_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags it.")
	GUICtrlSetTip($ButtonTAB_Custom_4, "Shows the '" & $TAB6_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags it.")


	If $ButtonTAB_State = "1" Then

	EndIf

	If $ButtonTAB_State = "2" Then

	EndIf

	If $ButtonTAB_State = "3" Then

	EndIf

	If $ButtonTAB_State = "4" Then

	EndIf

	If $ButtonTAB_State = "5" Then

	EndIf

	If $ButtonTAB_State = "6" Then

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


	Global $Checkbox_CreatePage = GUICtrlCreateLabel("", 4, $DesktopHeight - 77, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 22, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	Global $Checkbox_CreatePage_Label = GUICtrlCreateLabel("All", 30, $DesktopHeight - 78, 35, 20)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")


	Global $Button_ShowGamePage_1 = GUICtrlCreateButton("Show Game Page", 325, $DesktopHeight - 107, 100, 80, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_ShowGamePage_1, $gfx & "GamePageMode.bmp")
	GUICtrlSetTip(-1, "Opens the Game Page with all Games for the current Category." & @CRLF)

	;Global $Button_ShowGamePage_2 = GUICtrlCreateButton("Show Game Page", 325, $DesktopHeight - 65, 80, 38, $BS_BITMAP)
	;_GUICtrlButton_SetImage($Button_ShowGamePage_2, $gfx & "GamePage.bmp")
	;GUICtrlSetTip(-1, "Opens the Game Page for the current selection in the List View." & @CRLF)


	Global $ElementeUntenGroup = GUICtrlCreateGroup("Add Game to TAB", 70, $DesktopHeight - 114, 143, 88)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

	Global $Combo_Add_to_Custom = GUICtrlCreateCombo("Choose TAB", 76, $DesktopHeight - 95, 130, 32, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, $TAB3_Label & "|" & $TAB4_Label & "|" & $TAB5_Label & "|" & $TAB6_Label, "")
	GUICtrlSetFont(-1, 14, 400, 2, "arial")
	GUICtrlSetTip(-1, "Choose the TAB where you want to add the games.")

	Global $Button_Add_to_Custom = GUICtrlCreateButton("Add to Custom", 75, $DesktopHeight - 63, 133, 32, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Add_to_Custom, $gfx & "Add_to_Custom.bmp")
	GUICtrlSetTip(-1, "Add selected games to chosen TAB.")


	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")

	If $ButtonTAB_State = "1" Then
		$ApplicationList_INI_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		If $ScanOnlyVR = "true" Then $ApplicationList_INI_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_INI_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_INI_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_INI_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_INI_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_INI_TEMP = $ApplicationList_Custom_4_INI

	Global $NR_ApplicationsCheck = IniRead($ApplicationList_INI_TEMP, "ApplicationList", "NR_Applications", "")

	If $NR_ApplicationsCheck = "" Or $NR_ApplicationsCheck = "0" Then

		Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Scan Library", "The Game Library is emtpty." & @CRLF & @CRLF & _
				"Do you want to scan your Steam and if available also your" & @CRLF & _
				"Viveport Library?" & @CRLF & @CRLF & _
				'This can also be done manually by using the "Rescan" Button.' & @CRLF)

		If $Abfrage = 6 Then
			GUISetState()
			_Button_ReScan_Steam_Library()
			;_Restart()
		EndIf
	EndIf

	_Read_from_INI_ADD_2_ListView()

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "1" Then _ButtonTAB_Steam_Library()
	If $ButtonTAB_State = "2" Then _ButtonTAB_Non_Steam_Appl()
	If $ButtonTAB_State = "3" Then _ButtonTAB_Custom_1()
	If $ButtonTAB_State = "4" Then _ButtonTAB_Custom_2()
	If $ButtonTAB_State = "5" Then _ButtonTAB_Custom_3()
	If $ButtonTAB_State = "6" Then _ButtonTAB_Custom_4()
	GUISetState()

	_Set_States()
	_RM_Buttons()

	#Region Funktionen Verknüpfen
	GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")
	GUICtrlSetOnEvent($Button_Restart, "_Restart")
	GUICtrlSetOnEvent($Button_Exit, "_Exit")
	GUICtrlSetOnEvent($Button_Settings, "_HLL_Settings_GUI")
	GUICtrlSetOnEvent($Button_Exit_Settings_GUI, "_Button_Exit_Settings_GUI")

	;GUICtrlSetOnEvent($Combo_SteamLibrary, "_Combo_SteamLibrary")
	GUICtrlSetOnEvent($Combo_ApplicationList, "_Combo_ApplicationList")

	GUICtrlSetOnEvent($Button_ShowGamePage_1, "_Button_HTMLGamePage_GUI") ; _Show_HTML_GamePage_GUI_1
	GUICtrlSetOnEvent($Button_AddGame2Library, "_Button_AddGame2Library")
	GUICtrlSetOnEvent($Button_ReScan_Steam_Library, "_Button_ReScan_Steam_Library")
	GUICtrlSetOnEvent($Button_More_Scan_Options, "_Button_More_Scan_Options")

	GUICtrlSetOnEvent($Checkbox_ScanLibrary_OnStart, "_Checkbox_ScanLibrary_OnStart")
	GUICtrlSetOnEvent($Checkbox_Request_Steamdb_info, "_Checkbox_Request_Steamdb_info")
	GUICtrlSetOnEvent($Checkbox_Use_Steam_Tags, "_Checkbox_Use_Steam_Tags")
	GUICtrlSetOnEvent($Checkbox_ScanLibrary_OnStart_Label, "_Checkbox_ScanLibrary_OnStart")
	GUICtrlSetOnEvent($Checkbox_Request_Steamdb_info_Label, "_Checkbox_Request_Steamdb_info")
	GUICtrlSetOnEvent($Checkbox_Use_Steam_Tags_Label, "_Checkbox_Use_Steam_Tags")

	GUICtrlSetOnEvent($ButtonTAB_Steam_Library, "_ButtonTAB_Steam_Library")
	GUICtrlSetOnEvent($ButtonTAB_Non_Steam_Appl, "_ButtonTAB_Non_Steam_Appl")
	GUICtrlSetOnEvent($ButtonTAB_Custom_1, "_ButtonTAB_Custom_1")
	GUICtrlSetOnEvent($ButtonTAB_Custom_2, "_ButtonTAB_Custom_2")
	GUICtrlSetOnEvent($ButtonTAB_Custom_3, "_ButtonTAB_Custom_3")
	GUICtrlSetOnEvent($ButtonTAB_Custom_4, "_ButtonTAB_Custom_4")

	GUICtrlSetOnEvent($Button_ResolutionScale, "_SS_GUI")
	GUICtrlSetOnEvent($Button_HomeLoaderSettings, "_Button_HomeLoaderSettings")

	GUICtrlSetOnEvent($Checkbox_CreatePage, "_Checkbox_all")
	GUICtrlSetOnEvent($Checkbox_CreatePage_Label, "_Checkbox_all")

	GUICtrlSetOnEvent($Button_Add_to_Custom, "_Button_Add_to_Custom")

	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5_1, "_RM_Menu_Item_5_1")
	GUICtrlSetOnEvent($RM_Item5_2, "_RM_Menu_Item_5_2")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	#EndRegion Funktionen Verknüpfen

	GUIRegisterMsg($WM_notify, "_ClickOnListView")

	$NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	_GUICtrlStatusBar_SetText($Statusbar, "'Rescan Libraries' if a game was added or removed." & @TAB & "Apps: " & $NR_ApplicationsCheck & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
EndFunc

Func _HLL_Settings_GUI()
	Global $HEIGHT_GUI = 475
	Global $POS_X = 5
	Global $POS_Y_SteamLibraryFolders_Group = 5
	Global $POS_Y_IconFolders_Group = 335

	Global $POS_Y_Button_Exit_Settings_GUI = 435


	$Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
	$Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
	$Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")

	$HLL_Settings_GUI = GUICreate("Settings", 540, $HEIGHT_GUI, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))


	GUICtrlCreateGroup("Scan Options", 5, $POS_Y_SteamLibraryFolders_Group, 531, 425)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	If $ScanLibrary_OnStart_SettingValue = "true" Then $Checkbox_ScanLibrary_OnStart_Value = "a"
	Global $Checkbox_Settings_1 = GUICtrlCreateLabel($Checkbox_ScanLibrary_OnStart_Value, 10, 40, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_Checkbox_ScanLibrary_OnStart")
	Global $Checkbox_Settings_1_Label = GUICtrlCreateLabel("Scan with HomeApp Start", 38, 38, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_Checkbox_ScanLibrary_OnStart")

	If $Request_Steamdb_info = "true" Then $Checkbox_Request_Steamdb_info_Value = "a"
	Global $Checkbox_Settings_2 = GUICtrlCreateLabel($Checkbox_Request_Steamdb_info_Value, 10, 70, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_Checkbox_Request_Steamdb_info")
	Global $Checkbox_Settings_2_Label = GUICtrlCreateLabel("Request Steamdb Info", 38, 68, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_Checkbox_Request_Steamdb_info")

	If $Use_Steam_Tags = "true" Then $Checkbox_Use_Steam_Tags_Value = "a"
	Global $Checkbox_Settings_3 = GUICtrlCreateLabel($Checkbox_Use_Steam_Tags_Value, 10, 100, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_Checkbox_Use_Steam_Tags")
	Global $Checkbox_Settings_3_Label = GUICtrlCreateLabel("Request Steamdb Tags", 38, 98, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_Checkbox_Use_Steam_Tags")

	If $ScanVIVEApps = "true" Then $Checkbox_ScanVIVEApps_Value = "a"
	Global $Checkbox_Settings_4 = GUICtrlCreateLabel($Checkbox_ScanVIVEApps_Value, 10, 130, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanViveData")
	Global $Checkbox_Settings_4_Label = GUICtrlCreateLabel("Scan for Viveport Apps", 38, 128, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanViveData")

	If $ScanOculusApps = "true" Then $Checkbox_ScanOculusApps_Value = "a"
	Global $Checkbox_Settings_5 = GUICtrlCreateLabel($Checkbox_ScanOculusApps_Value, 10, 160, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanOculusData")
	Global $Checkbox_Settings_5_Label = GUICtrlCreateLabel("Scan for Oculus Apps", 38, 158, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanOculusData")

	If $Sort_Alphabetical_order = "true" Then $Checkbox_Sort_Alphabetical_order_Value = "a"
	Global $Checkbox_Settings_6 = GUICtrlCreateLabel($Checkbox_Sort_Alphabetical_order_Value, 10, 190, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Sort_Alphabetical_order")
	Global $Checkbox_Settings_6_Label = GUICtrlCreateLabel("Sort Apps in Alphabetical order", 38, 188, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Sort_Alphabetical_order")

	If $Add_Apps_Tags_to_categories = "true" Then $Checkbox_Add_Apps_Tags_to_categories_Value = "a"
	Global $Checkbox_Settings_7 = GUICtrlCreateLabel($Checkbox_Add_Apps_Tags_to_categories_Value, 10, 220, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Add_Apps_Tags_to_categories")
	Global $Checkbox_Settings_7_Label = GUICtrlCreateLabel("Add Apps based on their tags to the categories", 38, 218, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Add_Apps_Tags_to_categories")

	If $Allow_Multiple_Tag_Assignments = "true" Then $Checkbox_Allow_Multiple_Tag_Assignments_Value = "a"
	Global $Checkbox_Settings_8 = GUICtrlCreateLabel($Checkbox_Allow_Multiple_Tag_Assignments_Value, 10, 250, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Allow_Multiple_Tag_Assignments")
	Global $Checkbox_Settings_8_Label = GUICtrlCreateLabel("Allow multiple Tag assigments", 38, 248, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Allow_Multiple_Tag_Assignments")

	If $Add_PlayersOnline_to_Icons = "true" Then $Checkbox_Add_PlayersOnline_to_Icons_Value = "a"
	Global $Checkbox_Settings_9 = GUICtrlCreateLabel($Checkbox_Add_PlayersOnline_to_Icons_Value, 10, 280, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_PlayersOnline_to_Icons")
	Global $Checkbox_Settings_9_Label = GUICtrlCreateLabel("Add number of current Players to the game Icons", 38, 278, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_PlayersOnline_to_Icons")

	If $Add_SS_to_Icons = "true" Then $Checkbox_Add_SS_to_Icons_Value = "a"
	Global $Checkbox_Settings_10 = GUICtrlCreateLabel($Checkbox_Add_SS_to_Icons_Value, 10, 310, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_SS_to_Icons")
	Global $Checkbox_Settings_10_Label = GUICtrlCreateLabel("Add the Resolution Scale Value to the game Icons", 38, 308, 490, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_SS_to_Icons")

	If $Add_SS_per_game = "true" Then $Checkbox_Add_SS_per_game_Value = "a"
	Global $Checkbox_Settings_11 = GUICtrlCreateLabel($Checkbox_Add_SS_per_game_Value, 10, 340, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_SS_per_game")
	Global $Checkbox_Settings_11_Label = GUICtrlCreateLabel("Allow Read/Write of the Resolution Scale Value", 38, 338, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_SS_per_game")

	If $Create_HTML_GamePage = "true" Then $Checkbox_Create_HTML_GamePage_Value = "a"
	Global $Checkbox_Settings_12 = GUICtrlCreateLabel($Checkbox_Create_HTML_GamePage_Value, 10, 370, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Create_HTML_GamePage")
	Global $Checkbox_Settings_12_Label = GUICtrlCreateLabel("Create HTML Game Pages", 38, 368, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Create_HTML_GamePage")

	If $DeleteHomeLoaderLibraryData = "true" Then $Checkbox_DeleteHomeLoaderLibraryData_Value = "a"
	Global $Checkbox_Settings_13 = GUICtrlCreateLabel($Checkbox_DeleteHomeLoaderLibraryData_Value, 10, 400, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_DeleteHomeLoaderLibraryData")
	Global $Checkbox_Settings_13_Label = GUICtrlCreateLabel("Delete old HomeLoader Library Data first", 38, 398, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_DeleteHomeLoaderLibraryData")


	Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", 500, $POS_Y_Button_Exit_Settings_GUI, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(-1, "_Button_Exit_Settings_GUI")
	_GUICtrlButton_SetImage(-1, $gfx & "Exit_small.bmp")
	GUICtrlSetTip(-1, "Closes GUI Window.")

	GUISetState()
	$Game_ID = ""
EndFunc   ;==>_Settings_GUI

Func _AddGame2Library_GUI()
	$AddGame2Library_GUI = GUICreate("Add Game to Library", 349, 305, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

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
	GUICtrlSetOnEvent(-1, "_DROPDOWN_Library")
	GUICtrlSetData(-1, "Non_Steam_Appl", "Non_Steam_Appl")
	GUICtrlSetFont(-1, 12, 400, 2, "arial")

	GUICtrlCreateLabel("Game Path:", 10, 80, 115, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $BUTTON_GamePath_Folder = GUICtrlCreateButton("Select File", 130, 76, 99, 30, 0)
	GUICtrlSetOnEvent(-1, "_BUTTON_GamePath_Folder")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GUICtrlSetTip(-1, "Select File.")
	Global $BUTTON_Use_SteamID = GUICtrlCreateButton("Use Steam ID", 234, 76, 100, 30, 0)
	GUICtrlSetOnEvent(-1, "_BUTTON_Use_SteamID")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GUICtrlSetTip(-1, "Enter Steam ID.")
	Global $Input_GamePath_Folder = GUICtrlCreateInput("", 130, 108, 203, 30)
	GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
	GUICtrlSetTip(-1, "Enter Folder path.")

	GUICtrlCreateLabel("Appl. Name:", 10, 153, 150, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Name = GUICtrlCreateInput("", 130, 149, 203, 30)
	GUICtrlSetOnEvent(-1, "_Input_Name")
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GUICtrlSetTip(-1, "Enter Folder path.")

	GUICtrlCreateLabel("Icon Path:", 10, 207, 115, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $BUTTON_IconPath_Folder = GUICtrlCreateButton("Select Icon", 130, 203, 85, 30, 0)
	GUICtrlSetOnEvent(-1, "_BUTTON_IconPath_Folder")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GUICtrlSetTip(-1, "Select File.")

	GUICtrlCreateGroup("Drop Field", 350, 5, 130, 255)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	Global $Button_SAVE_APP = GUICtrlCreateButton("Save", 5, 265, 300, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(-1, "_Button_SAVE_APP")
	_GUICtrlButton_SetImage(-1, $gfx & "Create_small.bmp")
	GUICtrlSetTip(-1, "Closes GUI Window.")

	Global $Button_Exit_AddGame2Library_GUI = GUICtrlCreateButton("Exit", 310, 265, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(-1, "_Button_Exit_AddGame2Library_GUI")
	_GUICtrlButton_SetImage(-1, $gfx & "Exit_small.bmp")
	GUICtrlSetTip(-1, "Closes GUI Window.")
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
EndFunc   ;==>_AddGame2Library_GUI

Func _SS_GUI()

	If $ScanOnlyVR <> "true" Then
		$ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
	Else
		$ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
	EndIf

	$SS_Settings_GUI = GUICreate("Resolution Scale Menu", 285, 155, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $ResolutionScale_value = IniRead($ApplicationList_TEMP, "Application_" & $Game_ID, "ResolutionScale", "100")

	; Group 1
	Local $Steam_app_Name_RS = StringLeft($Steam_app_Name, 16)
	If StringLen($Steam_app_Name) > 16 Then $Steam_app_Name_RS = $Steam_app_Name_RS & "..."
	$ResolutionScale_Group = GUICtrlCreateGroup("Scale [%] for: " & $Steam_app_Name_RS, 5, 5, 275, 105)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 12, 400, 6, $font_arial)

	Global $Slider_0 = GUICtrlCreateSlider(8, 35, 200, 30, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUICtrlSetLimit($Slider_0, 500, 20)
	GUICtrlSetData($Slider_0, $ResolutionScale_value)
	GUICtrlSetOnEvent(-1, "_Slider_0")

	Global $Input_ResolutionScale = GUICtrlCreateInput($ResolutionScale_value, 208, 35, 65, 30)
	GUICtrlSetFont(-1, 14, $FW_NORMAL, "", $font_arial)
	Global $UpDown_ResolutionScale = GUICtrlCreateUpdown($Input_ResolutionScale)
	GUICtrlSetOnEvent(-1, "_UpDown_ResolutionScale")

	Global $SAVE_Button_Group_1 = GUICtrlCreateButton("SAVE", 10, 70, 264, 30)
	GUICtrlSetTip(-1, "Closes Settings Window.")
	GUICtrlSetFont(-1, 14, 600, 2, $font_arial)
	GUICtrlSetColor(-1, "0x006600")
	GUICtrlSetOnEvent($SAVE_Button_Group_1, "_Write_to_SteamVR_VRSettings")




	Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", 245, 115, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(-1, "_Button_Exit_SS_Settings_GUI")
	_GUICtrlButton_SetImage(-1, $gfx & "Exit_small.bmp")
	GUICtrlSetTip(-1, "Closes GUI Window.")


	GUICtrlSetData($ResolutionScale_Group, "Scale [%] for: " & $Steam_app_Name_RS)
	;GUICtrlSetData($VRSettings_Group, "VR Settings - " & $Steam_app_Name)
	GUICtrlSetData($Slider_0, $ResolutionScale_value)
	GUICtrlSetData($Input_ResolutionScale, $ResolutionScale_value)


	GUISetState()
EndFunc   ;==>_SS_GUI

Func _Update_StatusBar()
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $all_time_peak_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "all_time_peak", "")

	;_GUICtrlStatusBar_SetText($Statusbar, $Steam_app_Name & " [" & $Game_ID & "] " & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	_GUICtrlStatusBar_SetText($Statusbar, $Steam_app_Name & " [" & $Game_ID & "] " & @TAB & "" & @TAB & "")
EndFunc   ;==>_Update_StatusBar

Func _Search_Files()
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	If $Combo = "ALL" Then Local $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"

	If $Combo <> "ALL" Then
		If $Combo = "Steam Library 1" Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		If $Combo = "Steam Library 2" Then $s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
		If $Combo = "Steam Library 3" Then $s_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
		If $Combo = "Steam Library 4" Then $s_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
		If $Combo = "Steam Library 5" Then $s_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"
		If $Combo = "" Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		Local $FileList = _FileListToArray($s_LocalFolder, "*.acf", 1)
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
				$File_Path = ""
			Next
			;Sleep(500)
		EndIf
	EndIf

	If $Combo = "ALL" Then
		If $NR_Library_temp = 1 Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		If $NR_Library_temp = 2 Then $s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
		If $NR_Library_temp = 3 Then $s_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
		If $NR_Library_temp = 4 Then $s_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
		If $NR_Library_temp = 5 Then $s_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"

		Local $FileList = _FileListToArray($s_LocalFolder, "*.acf", 1)
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
				$File_Path = ""
			Next
			;Sleep(500)
		EndIf
		$FileList = ""
	EndIf
	;_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_Search_Files

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

		_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan SteamLibrary: " & "Nr: " & $Application_NR & ". " & $name & " - " & $appid & @TAB & "" & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")

		_Download_Icon_for_SteamGameID()

		$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
		If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icons & "32x32\" & "steam.app." & $appid & ".bmp")
		If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icons & "256x256\" & "steam.app." & $appid & ".bmp")

		If Not FileExists($Icons & "32x32\" & "steam.app." & $appid & ".bmp") Then
			_Get_SteamGame_Icon_32x32()
		EndIf

		If Not FileExists($Icons & "256x256\" & "steam.app." & $appid & ".ico") Then
			_Get_SteamGame_Icon_256x256()
		EndIf
	EndIf
EndFunc   ;==>_ApplicationList_Update

Func _Get_ADD_PlayersOnline_DATA()
	If $ScanOnlyVR <> "true" Then
		$ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
	Else
		$ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
	EndIf

	Global $Check_AppId = $appid
	Global $Check_NR = IniRead($ApplicationList_TEMP, "Application_" & $appid, "NR", "")
	Global $Check_name = IniRead($ApplicationList_TEMP, "Application_" & $appid, "name", "")
	Global $Check_AppId = IniRead($ApplicationList_TEMP, "Application_" & $appid, "appid", "")
	Global $Check_right_now = IniRead($ApplicationList_TEMP, "Application_" & $appid, "right_now", "")
	Global $Check_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $appid, "24h_peak", "")
	Global $Check_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $appid, "all_time_peak", "")
	Global $Check_resolutionScale = IniRead($ApplicationList_TEMP, "Application_" & $appid, "resolutionScale", "")

	If $Check_AppId <> "" Then
		Local $URL = "https://steamdb.info/app/" & $appid & "/graphs/"
		If WinExists("HomeLoader - Library") Then _GUICtrlStatusBar_SetText($Statusbar, "" & "Steamdb Info: Retrieving Data - " & "Nr: " & $Check_NR & " - " & "" & $Check_name & "" & "" & @TAB & "" & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		_INetGetSource($URL)

		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $URL, False)
			$WinHttpReq.SetTimeouts(50, 50, 50, 50)
			If WinExists("HomeLoader - Library") Then _GUICtrlStatusBar_SetText($Statusbar, "" & "Steamdb Info: Retrieving URL... " & $URL & " - " & "   " & "Nr: " & $Check_NR & " - " & "" & $Check_name & "" & "" & @TAB & "" & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
			$WinHttpReq.Send()

			If @error Then
				MyErrFunc()
			Else
				If $WinHttpReq.Status <> 404 Then
					$DataResponse = $WinHttpReq.ResponseText

					Local $iPosition_1 = StringInStr($DataResponse, '<li><strong>')
					Local $iPosition_2 = StringInStr($DataResponse, '</strong><em>all-time peak')
					Local $iPosition_3 = $iPosition_2 - $iPosition_1

					Local $sString = StringMid($DataResponse, $iPosition_1, $iPosition_3)
					Global $aArray = StringSplit($sString, '<li><strong>', $STR_ENTIRESPLIT)

					If $aArray[0] > 1 Then
						Global $PlayersOnline_right_now = StringSplit($aArray[2], '<')
						$PlayersOnline_right_now = $PlayersOnline_right_now[1]
						Global $PlayersOnline_24h_peak = StringSplit($aArray[3], '<')
						$PlayersOnline_24h_peak = $PlayersOnline_24h_peak[1]
						Global $PlayersOnline_all_time_peak = StringSplit($aArray[4], '<')
						$PlayersOnline_all_time_peak = $PlayersOnline_all_time_peak[1]

						$PlayersOnline_right_now = StringReplace($PlayersOnline_right_now, ',', '.')
						$PlayersOnline_24h_peak = StringReplace($PlayersOnline_24h_peak, ',', '.')
						$PlayersOnline_all_time_peak = StringReplace($PlayersOnline_all_time_peak, ',', '.')


						$ApplicationList_INI_TEMP = $ApplicationList_TEMP
						If $ScanOnlyVR = "true" Then $ApplicationList_INI_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI

						IniWrite($ApplicationList_INI_TEMP, "Application_" & $Application_NR, "right_now", $PlayersOnline_right_now)
						IniWrite($ApplicationList_INI_TEMP, "Application_" & $Application_NR, "24h_peak", $PlayersOnline_24h_peak)
						IniWrite($ApplicationList_INI_TEMP, "Application_" & $Application_NR, "all_time_peak", $PlayersOnline_all_time_peak)
						IniWrite($ApplicationList_INI_TEMP, "Application_" & $Check_AppId, "right_now", $PlayersOnline_right_now)
						IniWrite($ApplicationList_INI_TEMP, "Application_" & $Check_AppId, "24h_peak", $PlayersOnline_24h_peak)
						IniWrite($ApplicationList_INI_TEMP, "Application_" & $Check_AppId, "all_time_peak", $PlayersOnline_all_time_peak)

						Local $Check_Custom_1_NR_Exist = IniRead($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "NR", "")
						Local $Check_Custom_2_NR_Exist = IniRead($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "NR", "")
						Local $Check_Custom_3_NR_Exist = IniRead($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "NR", "")
						Local $Check_Custom_4_NR_Exist = IniRead($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "NR", "")

						If $Check_Custom_1_NR_Exist <> "" Then
							IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_Custom_1_NR_Exist, "right_now", $PlayersOnline_right_now)
							IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_Custom_1_NR_Exist, "24h_peak", $PlayersOnline_24h_peak)
							IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_Custom_1_NR_Exist, "all_time_peak", $PlayersOnline_all_time_peak)
							IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "right_now", $PlayersOnline_right_now)
							IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "24h_peak", $PlayersOnline_24h_peak)
							IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "all_time_peak", $PlayersOnline_all_time_peak)
						EndIf

						If $Check_Custom_2_NR_Exist <> "" Then
							IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_Custom_2_NR_Exist, "right_now", $PlayersOnline_right_now)
							IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_Custom_2_NR_Exist, "24h_peak", $PlayersOnline_24h_peak)
							IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_Custom_2_NR_Exist, "all_time_peak", $PlayersOnline_all_time_peak)
							IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "right_now", $PlayersOnline_right_now)
							IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "24h_peak", $PlayersOnline_24h_peak)
							IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "all_time_peak", $PlayersOnline_all_time_peak)
						EndIf

						If $Check_Custom_3_NR_Exist <> "" Then
							IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_Custom_3_NR_Exist, "right_now", $PlayersOnline_right_now)
							IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_Custom_3_NR_Exist, "24h_peak", $PlayersOnline_24h_peak)
							IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_Custom_3_NR_Exist, "all_time_peak", $PlayersOnline_all_time_peak)
							IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "right_now", $PlayersOnline_right_now)
							IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "24h_peak", $PlayersOnline_24h_peak)
							IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "all_time_peak", $PlayersOnline_all_time_peak)
						EndIf

						If $Check_Custom_4_NR_Exist <> "" Then
							IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_Custom_4_NR_Exist, "right_now", $PlayersOnline_right_now)
							IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_Custom_4_NR_Exist, "24h_peak", $PlayersOnline_24h_peak)
							IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_Custom_4_NR_Exist, "all_time_peak", $PlayersOnline_all_time_peak)
							IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "right_now", $PlayersOnline_right_now)
							IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "24h_peak", $PlayersOnline_24h_peak)
							IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "all_time_peak", $PlayersOnline_all_time_peak)
						EndIf

						If $Add_PlayersOnline_to_Icons = "true" Then
							If $PlayersOnline_right_now <> "" And $PlayersOnline_right_now <> "0" Then
								_Write_PO_TEXT_2_Image()
								_Write_PO_Image_2_Image()
							EndIf
						EndIf

						$PlayersOnline_right_now = ""
						$PlayersOnline_24h_peak = ""
						$PlayersOnline_all_time_peak = ""

						Local $Non_Steam_App = "false"
						If StringLeft($Check_AppId, 9) = "vive.htc." Then $Non_Steam_App = "true"
						If StringLeft($Check_AppId, 11) = "revive.app." Then $Non_Steam_App = "true"

						If $Use_Steam_Tags = "true" And $Non_Steam_App <> "true" Then
							Local $App_in_Library = "false"
							If $DeleteHomeLoaderLibraryData <> "true" Then
								For $Loop_Library = 1 To UBound($Array_Library) - 1
									If $Check_AppId = $Array_Library[$Loop_Library][0] Then $App_in_Library = "true"
								Next
							EndIf
							If $App_in_Library <> "true" Then _Get_SteamGame_Tags_for_SteamID()
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Get_ADD_PlayersOnline_DATA()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
		EndIf
	EndIf
EndFunc   ;==>_Get_ADD_PlayersOnline_DATA


Func _Get_SteamGame_Tags()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start adding Tags:")
	If $ScanOnlyVR = "true" Then
		$ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
		Local $NR_ApplicationsCheck = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
	Else
		$ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		Local $NR_ApplicationsCheck = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
	EndIf

	If $NR_ApplicationsCheck <> "" Then
		For $Loop = 1 To $NR_ApplicationsCheck
			Local $Added_to_Custom_Page = "false"
			Local $Added_to_Custom_1 = "false"
			Local $Added_to_Custom_2 = "false"
			Local $Added_to_Custom_3 = "false"
			Local $Added_to_Custom_4 = "false"

			If WinExists("HomeLoader - Library") Then
				GUICtrlSetData($Anzeige_Fortschrittbalken, $Loop * 100 / $NR_ApplicationsCheck)
			EndIf

			Local $Check_NR = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "NR", "")
			Local $Check_name = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "name", "")
			Local $Check_AppId = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "appid", "")
			Local $Check_right_now = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "right_now", "")
			Local $Check_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "24h_peak", "")
			Local $Check_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "all_time_peak", "")
			Local $Check_resolutionScale = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "resolutionScale", "")

			If $Check_AppId <> "" Then
				Local $URL = "https://steamdb.info/app/" & $Check_AppId & "/info/"
				_INetGetSource($URL)
				Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
				If Not @error Then
					$WinHttpReq.Open("GET", $URL, False)
					$WinHttpReq.SetTimeouts(50, 50, 50, 50)
					_GUICtrlStatusBar_SetText($Statusbar, "" & "Steam Tags: " & "Retrieving URL... " & $URL & " - " & "   " & "Nr: " & $Loop & " - " & "" & $Check_name & "" & "" & @TAB & "" & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
					$WinHttpReq.Send()

					If @error Then
						MyErrFunc()
					Else
						If $WinHttpReq.Status <> 404 Then
							Local $Data = $WinHttpReq.ResponseText

							Local $iPosition_1 = StringInStr($Data, 'store_tags</td>')
							Local $iPosition_2 = StringInStr($Data, '/a></li></ul></td>', 0, 1, $iPosition_1)
							Local $iPosition_3 = $iPosition_2 - $iPosition_1

							Local $sString = StringMid($Data, $iPosition_1, $iPosition_3)
							$sString = StringReplace($sString, 'store_tags</td>', '')
							$sString = StringReplace($sString, '<td><ul><li><b>', '')
							$sString = StringReplace($sString, '</b>: <a href="/tags/?tagid=', '')
							$sString = StringReplace($sString, '/a></li><li><b>', '')

							Local $Game_Tags = _StringBetween($sString, '>', '<', $STR_ENDNOTSTART)

							Local $NR_Game_Tags = UBound($Game_Tags) - 1

							For $Loop_1 = 0 To $NR_Game_Tags
								For $Loop_2 = 1 To 10
									Local $Check_ID_Exist = IniRead($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "appid", "")
									If $Added_to_Custom_1 = "true" Or $Added_to_Custom_2 = "true" Or $Added_to_Custom_3 = "true" Or $Added_to_Custom_4 = "true" And $Allow_Multiple_Tag_Assignments = "false" Then $Added_to_Custom_Page = "true"
									If $Added_to_Custom_Page <> "true" And $Added_to_Custom_1 <> "true" And $Check_ID_Exist = "" Then
										If $Game_Tags[$Loop_1] = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_2, "") Then
											Local $NR_Current_Apps = IniRead($ApplicationList_Custom_1_INI, "ApplicationList", "NR_Applications", "")
											IniWrite($ApplicationList_Custom_1_INI, "ApplicationList", "NR_Applications", $NR_Current_Apps + 1)

											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "NR", $NR_Current_Apps + 1)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "name", $Check_name)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "appid", $Check_AppId)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "right_now", $Check_right_now)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "24h_peak", $Check_24h_peak)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "all_time_peak", $Check_all_time_peak)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "resolutionScale", $Check_resolutionScale)

											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "NR", $NR_Current_Apps + 1)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "name", $Check_name)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "appid", $Check_AppId)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "right_now", $Check_right_now)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "24h_peak", $Check_24h_peak)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "all_time_peak", $Check_all_time_peak)
											IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "resolutionScale", $Check_resolutionScale)

											$Added_to_Custom_1 = "true"
											ExitLoop
										EndIf
									EndIf

									Local $Check_ID_Exist = IniRead($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "appid", "")
									If $Added_to_Custom_1 = "true" Or $Added_to_Custom_2 = "true" Or $Added_to_Custom_3 = "true" Or $Added_to_Custom_4 = "true" And $Allow_Multiple_Tag_Assignments = "false" Then $Added_to_Custom_Page = "true"
									If $Added_to_Custom_Page <> "true" And $Added_to_Custom_2 <> "true" And $Check_ID_Exist = "" Then
										If $Game_Tags[$Loop_1] = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_2, "") Then
											Local $NR_Current_Apps = IniRead($ApplicationList_Custom_2_INI, "ApplicationList", "NR_Applications", "")
											IniWrite($ApplicationList_Custom_2_INI, "ApplicationList", "NR_Applications", $NR_Current_Apps + 1)

											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "NR", $NR_Current_Apps + 1)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "name", $Check_name)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "appid", $Check_AppId)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "right_now", $Check_right_now)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "24h_peak", $Check_24h_peak)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "all_time_peak", $Check_all_time_peak)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "resolutionScale", $Check_resolutionScale)

											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "NR", $NR_Current_Apps + 1)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "name", $Check_name)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "appid", $Check_AppId)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "right_now", $Check_right_now)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "24h_peak", $Check_24h_peak)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "all_time_peak", $Check_all_time_peak)
											IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "resolutionScale", $Check_resolutionScale)

											$Added_to_Custom_2 = "true"
											ExitLoop
										EndIf
									EndIf

									Local $Check_ID_Exist = IniRead($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "appid", "")
									If $Added_to_Custom_1 = "true" Or $Added_to_Custom_2 = "true" Or $Added_to_Custom_3 = "true" Or $Added_to_Custom_4 = "true" And $Allow_Multiple_Tag_Assignments = "false" Then $Added_to_Custom_Page = "true"
									If $Added_to_Custom_Page <> "true" And $Added_to_Custom_3 <> "true" And $Check_ID_Exist = "" Then
										If $Game_Tags[$Loop_1] = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_2, "") Then
											Local $NR_Current_Apps = IniRead($ApplicationList_Custom_3_INI, "ApplicationList", "NR_Applications", "")
											IniWrite($ApplicationList_Custom_3_INI, "ApplicationList", "NR_Applications", $NR_Current_Apps + 1)

											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "NR", $NR_Current_Apps + 1)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "name", $Check_name)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "appid", $Check_AppId)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "right_now", $Check_right_now)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "24h_peak", $Check_24h_peak)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "all_time_peak", $Check_all_time_peak)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "resolutionScale", $Check_resolutionScale)

											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "NR", $NR_Current_Apps + 1)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "name", $Check_name)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "appid", $Check_AppId)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "right_now", $Check_right_now)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "24h_peak", $Check_24h_peak)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "all_time_peak", $Check_all_time_peak)
											IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "resolutionScale", $Check_resolutionScale)

											$Added_to_Custom_3 = "true"
											ExitLoop
										EndIf
									EndIf

									Local $Check_ID_Exist = IniRead($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "appid", "")
									If $Added_to_Custom_1 = "true" Or $Added_to_Custom_2 = "true" Or $Added_to_Custom_3 = "true" Or $Added_to_Custom_4 = "true" And $Allow_Multiple_Tag_Assignments = "false" Then $Added_to_Custom_Page = "true"
									If $Added_to_Custom_Page <> "true" And $Added_to_Custom_4 <> "true" And $Check_ID_Exist = "" Then
										If $Game_Tags[$Loop_1] = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_2, "") Then
											Local $NR_Current_Apps = IniRead($ApplicationList_Custom_4_INI, "ApplicationList", "NR_Applications", "")
											IniWrite($ApplicationList_Custom_4_INI, "ApplicationList", "NR_Applications", $NR_Current_Apps + 1)

											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "NR", $NR_Current_Apps + 1)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "name", $Check_name)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "appid", $Check_AppId)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "right_now", $Check_right_now)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "24h_peak", $Check_24h_peak)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "all_time_peak", $Check_all_time_peak)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "resolutionScale", $Check_resolutionScale)

											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "NR", $NR_Current_Apps + 1)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "name", $Check_name)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "appid", $Check_AppId)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "right_now", $Check_right_now)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "24h_peak", $Check_24h_peak)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "all_time_peak", $Check_all_time_peak)
											IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "resolutionScale", $Check_resolutionScale)

											$Added_to_Custom_4 = "true"
											ExitLoop
										EndIf
									EndIf
								Next
								;MsgBox(0, $Loop_1, $ApplicationList_Folder & "Tags\" & $NR_Game_Tags[$Loop_1] & ".ini")
								;Local $NR_Current_Apps = IniRead($ApplicationList_Custom_1_INI, "ApplicationList", "NR_Applications", "")
								Local $ApplicationList_Tag_INI = $ApplicationList_Folder & "Tags\" & $Game_Tags[$Loop_1] & ".ini"
								Local $NR_Current_Apps = IniRead($ApplicationList_Tag_INI, "ApplicationList", "NR_Applications", "")
								Local $Current_App_Exist_Check = IniRead($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "name", "")
								If $Current_App_Exist_Check = $Check_name Then $NR_Current_Apps = IniRead($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "NR", "") - 1

								If $Current_App_Exist_Check <> $Check_name Then IniWrite($ApplicationList_Tag_INI, "ApplicationList", "NR_Applications", $NR_Current_Apps + 1)

								IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "NR", $NR_Current_Apps + 1)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "name", $Check_name)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "appid", $Check_AppId)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "right_now", $Check_right_now)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "24h_peak", $Check_24h_peak)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "all_time_peak", $Check_all_time_peak)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "resolutionScale", $Check_resolutionScale)

								IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "NR", $NR_Current_Apps + 1)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "name", $Check_name)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "appid", $Check_AppId)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "right_now", $Check_right_now)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "24h_peak", $Check_24h_peak)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "all_time_peak", $Check_all_time_peak)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "resolutionScale", $Check_resolutionScale)
							Next
						Else
							FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Get_SteamGame_Tags()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
						EndIf
					EndIf
				EndIf
			EndIf

		Next

		If WinExists("HomeLoader - Library") Then
			_GUICtrlStatusBar_SetText($Statusbar, "" & "Retrieving Steamdb Tags finished" & @TAB & "" & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
			GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
		EndIf
	EndIf
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End adding Tags:" & " [NR of Apps: " & $NR_ApplicationsCheck & "]")
EndFunc   ;==>_Get_SteamGame_Tags

Func _Get_SteamGame_Tags_for_SteamID()
	Global $Check_AppId = $appid
	Global $Check_NR = IniRead($ApplicationList_TEMP, "Application_" & $appid, "NR", "")
	Global $Check_name = IniRead($ApplicationList_TEMP, "Application_" & $appid, "name", "")
	Global $Check_AppId = IniRead($ApplicationList_TEMP, "Application_" & $appid, "appid", "")
	Global $Check_right_now = IniRead($ApplicationList_TEMP, "Application_" & $appid, "right_now", "")
	Global $Check_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $appid, "24h_peak", "")
	Global $Check_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $appid, "all_time_peak", "")
	Global $Check_resolutionScale = IniRead($ApplicationList_TEMP, "Application_" & $appid, "resolutionScale", "")

	Local $iPosition_1 = StringInStr($DataResponse, 'store_tags</td>')
	Local $iPosition_2 = StringInStr($DataResponse, '/a></li></ul></td>', 0, 1, $iPosition_1)
	Local $iPosition_3 = $iPosition_2 - $iPosition_1

	Local $sString = StringMid($DataResponse, $iPosition_1, $iPosition_3)
	$sString = StringReplace($sString, 'store_tags</td>', '')
	$sString = StringReplace($sString, '<td><ul><li><b>', '')
	$sString = StringReplace($sString, '</b>: <a href="/tags/?tagid=', '')
	$sString = StringReplace($sString, '/a></li><li><b>', '')

	Local $Game_Tags = _StringBetween($sString, '>', '<', $STR_ENDNOTSTART)

	Local $NR_Game_Tags = UBound($Game_Tags) - 1

	Global $Added_to_Custom_Page = "false"
	Global $Added_to_Custom_1 = "false"
	Global $Added_to_Custom_2 = "false"
	Global $Added_to_Custom_3 = "false"
	Global $Added_to_Custom_4 = "false"

	For $Loop_1 = 0 To $NR_Game_Tags
		For $Loop_2 = 1 To 10
			Local $Check_ID_Exist = IniRead($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "appid", "")
			If $Added_to_Custom_1 = "true" Or $Added_to_Custom_2 = "true" Or $Added_to_Custom_3 = "true" Or $Added_to_Custom_4 = "true" And $Allow_Multiple_Tag_Assignments = "false" Then $Added_to_Custom_Page = "true"
			If $Added_to_Custom_Page <> "true" And $Added_to_Custom_1 <> "true" And $Check_ID_Exist = "" Then
				If $Game_Tags[$Loop_1] = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_2, "") Then
					Local $NR_Current_Apps = IniRead($ApplicationList_Custom_1_INI, "ApplicationList", "NR_Applications", "")
					IniWrite($ApplicationList_Custom_1_INI, "ApplicationList", "NR_Applications", $NR_Current_Apps + 1)

					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "NR", $NR_Current_Apps + 1)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "name", $Check_name)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "appid", $Check_AppId)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "right_now", $Check_right_now)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "24h_peak", $Check_24h_peak)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "all_time_peak", $Check_all_time_peak)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $NR_Current_Apps + 1, "resolutionScale", $Check_resolutionScale)

					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "NR", $NR_Current_Apps + 1)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "name", $Check_name)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "appid", $Check_AppId)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "right_now", $Check_right_now)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "24h_peak", $Check_24h_peak)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "all_time_peak", $Check_all_time_peak)
					IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "resolutionScale", $Check_resolutionScale)

					If $Allow_Multiple_Tag_Assignments = "false" Then
						$Added_to_Custom_1 = "true"
						ExitLoop
					EndIf
				EndIf
			EndIf

			Local $Check_ID_Exist = IniRead($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "appid", "")
			If $Added_to_Custom_1 = "true" Or $Added_to_Custom_2 = "true" Or $Added_to_Custom_3 = "true" Or $Added_to_Custom_4 = "true" And $Allow_Multiple_Tag_Assignments = "false" Then $Added_to_Custom_Page = "true"
			If $Added_to_Custom_Page <> "true" And $Added_to_Custom_2 <> "true" And $Check_ID_Exist = "" Then
				If $Game_Tags[$Loop_1] = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_2, "") Then
					Local $NR_Current_Apps = IniRead($ApplicationList_Custom_2_INI, "ApplicationList", "NR_Applications", "")
					IniWrite($ApplicationList_Custom_2_INI, "ApplicationList", "NR_Applications", $NR_Current_Apps + 1)

					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "NR", $NR_Current_Apps + 1)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "name", $Check_name)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "appid", $Check_AppId)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "right_now", $Check_right_now)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "24h_peak", $Check_24h_peak)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "all_time_peak", $Check_all_time_peak)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $NR_Current_Apps + 1, "resolutionScale", $Check_resolutionScale)

					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "NR", $NR_Current_Apps + 1)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "name", $Check_name)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "appid", $Check_AppId)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "right_now", $Check_right_now)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "24h_peak", $Check_24h_peak)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "all_time_peak", $Check_all_time_peak)
					IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "resolutionScale", $Check_resolutionScale)

					If $Allow_Multiple_Tag_Assignments = "false" Then
						$Added_to_Custom_2 = "true"
						ExitLoop
					EndIf
				EndIf
			EndIf

			Local $Check_ID_Exist = IniRead($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "appid", "")
			If $Added_to_Custom_1 = "true" Or $Added_to_Custom_2 = "true" Or $Added_to_Custom_3 = "true" Or $Added_to_Custom_4 = "true" And $Allow_Multiple_Tag_Assignments = "false" Then $Added_to_Custom_Page = "true"
			If $Added_to_Custom_Page <> "true" And $Added_to_Custom_3 <> "true" And $Check_ID_Exist = "" Then
				If $Game_Tags[$Loop_1] = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_2, "") Then
					Local $NR_Current_Apps = IniRead($ApplicationList_Custom_3_INI, "ApplicationList", "NR_Applications", "")
					IniWrite($ApplicationList_Custom_3_INI, "ApplicationList", "NR_Applications", $NR_Current_Apps + 1)

					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "NR", $NR_Current_Apps + 1)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "name", $Check_name)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "appid", $Check_AppId)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "right_now", $Check_right_now)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "24h_peak", $Check_24h_peak)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "all_time_peak", $Check_all_time_peak)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $NR_Current_Apps + 1, "resolutionScale", $Check_resolutionScale)

					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "NR", $NR_Current_Apps + 1)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "name", $Check_name)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "appid", $Check_AppId)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "right_now", $Check_right_now)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "24h_peak", $Check_24h_peak)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "all_time_peak", $Check_all_time_peak)
					IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "resolutionScale", $Check_resolutionScale)

					If $Allow_Multiple_Tag_Assignments = "false" Then
						$Added_to_Custom_3 = "true"
						ExitLoop
					EndIf
				EndIf
			EndIf

			Local $Check_ID_Exist = IniRead($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "appid", "")
			If $Added_to_Custom_1 = "true" Or $Added_to_Custom_2 = "true" Or $Added_to_Custom_3 = "true" Or $Added_to_Custom_4 = "true" And $Allow_Multiple_Tag_Assignments = "false" Then $Added_to_Custom_Page = "true"
			If $Added_to_Custom_Page <> "true" And $Added_to_Custom_4 <> "true" And $Check_ID_Exist = "" Then
				If $Game_Tags[$Loop_1] = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_2, "") Then
					Local $NR_Current_Apps = IniRead($ApplicationList_Custom_4_INI, "ApplicationList", "NR_Applications", "")
					IniWrite($ApplicationList_Custom_4_INI, "ApplicationList", "NR_Applications", $NR_Current_Apps + 1)

					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "NR", $NR_Current_Apps + 1)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "name", $Check_name)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "appid", $Check_AppId)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "right_now", $Check_right_now)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "24h_peak", $Check_24h_peak)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "all_time_peak", $Check_all_time_peak)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $NR_Current_Apps + 1, "resolutionScale", $Check_resolutionScale)

					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "NR", $NR_Current_Apps + 1)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "name", $Check_name)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "appid", $Check_AppId)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "right_now", $Check_right_now)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "24h_peak", $Check_24h_peak)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "all_time_peak", $Check_all_time_peak)
					IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "resolutionScale", $Check_resolutionScale)

					If $Allow_Multiple_Tag_Assignments = "false" Then
						$Added_to_Custom_4 = "true"
						ExitLoop
					EndIf
				EndIf
			EndIf
		Next

		;MsgBox(0, $Loop_1, $ApplicationList_Folder & "Tags\" & $NR_Game_Tags[$Loop_1] & ".ini")
		;Local $NR_Current_Apps = IniRead($ApplicationList_Custom_1_INI, "ApplicationList", "NR_Applications", "")
		Local $ApplicationList_Tag_INI = $ApplicationList_Folder & "Tags\" & $Game_Tags[$Loop_1] & ".ini"
		Local $NR_Current_Apps = IniRead($ApplicationList_Tag_INI, "ApplicationList", "NR_Applications", "")
		Local $Current_App_Exist_Check = IniRead($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "name", "")
		If $Current_App_Exist_Check = $Check_name Then $NR_Current_Apps = IniRead($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "NR", "") - 1

		If $Current_App_Exist_Check <> $Check_name Then IniWrite($ApplicationList_Tag_INI, "ApplicationList", "NR_Applications", $NR_Current_Apps + 1)

		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "NR", $NR_Current_Apps + 1)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "name", $Check_name)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "appid", $Check_AppId)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "right_now", $Check_right_now)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "24h_peak", $Check_24h_peak)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "all_time_peak", $Check_all_time_peak)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "resolutionScale", $Check_resolutionScale)

		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "NR", $NR_Current_Apps + 1)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "name", $Check_name)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "appid", $Check_AppId)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "right_now", $Check_right_now)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "24h_peak", $Check_24h_peak)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "all_time_peak", $Check_all_time_peak)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "resolutionScale", $Check_resolutionScale)
	Next
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Added Tags for '" & $Check_name & " [" & $Check_AppId & "]")
EndFunc   ;==>_Get_SteamGame_Tags


Func _Write_PO_TEXT_2_Image()
	_GDIPlus_Startup()
	Global $hImage = _GDIPlus_WTOB($gfx & "Icon_NR_Background.jpg", $PlayersOnline_right_now, "Arial", 45, -1, 3, 0, 0, 0x00CCFF, 1, 1)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()

	If FileExists(@ScriptDir & "\" & "WTOB.png") Then
		FileCopy(@ScriptDir & "\" & "WTOB.png", @ScriptDir & "\Icon_NR_Background" & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		FileDelete(@ScriptDir & "\" & "WTOB.png")
	EndIf
EndFunc   ;==>_Write_PO_TEXT_2_Image

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
EndFunc   ;==>_Write_PO_Image_2_Image

Func MY_PAINT($hWnd, $Msg, $wParam, $lParam)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>MY_PAINT

Func _Quit_PO_Image_2_Image()
	If FileExists(@ScriptDir & "\Icon_NR_Background" & ".jpg") Then FileDelete(@ScriptDir & "\Icon_NR_Background" & ".jpg")
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()
EndFunc   ;==>_Quit_PO_Image_2_Image

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
EndFunc   ;==>_Get_AD_SS_Values_to_Icons

Func _Write_SS_TEXT_2_Image()
	_GDIPlus_Startup()
	Global $hImage = _GDIPlus_WTOB($gfx & "Icon_NR_Background.jpg", $Value_for_Image & "%", "Arial", 45, -1, 3, 0, 0, 0x00CCFF, 1, 1)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()

	If FileExists(@ScriptDir & "\" & "WTOB.png") Then
		FileCopy(@ScriptDir & "\" & "WTOB.png", @ScriptDir & "\Icon_NR_Background" & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		FileDelete(@ScriptDir & "\" & "WTOB.png")
	EndIf
EndFunc   ;==>_Write_SS_TEXT_2_Image

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
EndFunc   ;==>_Write_SS_Image_2_Image

Func _Quit_SS_Image_2_Image()
	If FileExists(@ScriptDir & "\Icon_NR_Background" & ".jpg") Then FileDelete(@ScriptDir & "\Icon_NR_Background" & ".jpg")
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()
EndFunc   ;==>_Quit_SS_Image_2_Image

Func _Get_SteamGame_Icon_32x32()
	Global $Check_AppId = $appid
	If $Check_AppId <> "" Then
		Local $URL = "https://steamdb.info/app/" & $appid & "/info/"
		_INetGetSource($URL)
		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $URL, False)
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
				If StringLeft($appid, 14) = 'steam.overlay.' Then
					Local $Icon_32x32 = $gfx & "Icon_Overlay_Preview_32x32.bmp"
				Else
					Local $Icon_32x32 = $gfx & "Icon_Preview_32x32.bmp"
				EndIf
				FileCopy($Icon_32x32, $ImageList_Icon)
			EndIf
		Else
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Get_SteamGame_Icon_32x32()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
		EndIf
	EndIf
EndFunc   ;==>_Get_SteamGame_Icon_32x32

Func _Get_SteamGame_Icon_256x256()
	Global $Check_AppId = $appid
	If $Check_AppId <> "" Then
		Global $Steam_AppId = $appid
		Local $URL = "https://steamdb.info/app/" & $appid & "/info/"
		_INetGetSource($URL)
		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $URL, False)
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
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Get_SteamGame_Icon_256x256()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
		EndIf
	EndIf
EndFunc   ;==>_Get_SteamGame_Icon_256x256

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
EndFunc   ;==>_Convert_Icon_32x32

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
		;If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Download_Icon_path_1_jpg)
		If Not FileExists($Download_Icon_path_1_jpg) Then InetGet($URL, $Download_Icon_path_1_jpg, 16, 0)
		If Not FileExists($Download_Icon_path_1_jpg) Then FileCopy($gfx & "Icon_Preview.jpg", $Download_Icon_path_1_jpg)
		If Not FileExists($Download_Icon_path_2_jpg) Then FileCopy($Download_Icon_path_1_jpg, $Download_Icon_path_2_jpg)
	EndIf
EndFunc   ;==>_Download_Icon_for_SteamGameID

Func _Sync_Icons()
	Local $FileList = _FileListToArray($Icons & "460x215\", "*.jpg", 1)
	For $Loop_1 = 1 To $FileList[0]
		For $Loop_2 = 1 To 5
			Local $Icon_Folder_Sync = IniRead($Config_INI, "Folders", "Icon_Folder_" & $Loop_2, "")
			If $Icon_Folder_Sync <> "" Then
				If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icon_Folder_Sync & $FileList[$Loop_1])
				If FileExists($Icons & "460x215\SS_Values\" & $FileList[$Loop_1]) Then FileCopy($Icons & "460x215\SS_Values\" & $FileList[$Loop_1], $Icon_Folder_Sync & $FileList[$Loop_1], $FC_OVERWRITE + $FC_CREATEPATH)
				If Not FileExists($Icons & "460x215\SS_Values\" & $FileList[$Loop_1]) Then FileCopy($Icons & "460x215\" & $FileList[$Loop_1], $Icon_Folder_Sync & $FileList[$Loop_1], $FC_OVERWRITE + $FC_CREATEPATH)
				If Not FileExists($Icons & "460x215\" & $FileList[$Loop_1]) Then FileCopy($Icons & $FileList[$Loop_1], $Icon_Folder_Sync & $FileList[$Loop_1], $FC_OVERWRITE + $FC_CREATEPATH)
				If Not FileExists($Icon_Folder_Sync & $FileList[$Loop_1]) Then FileCopy($gfx & "Icon_Preview.jpg", $Icon_Folder_Sync & $FileList[$Loop_1])
			EndIf
		Next
	Next
EndFunc   ;==>_Sync_Icons

#EndRegion Func MAIN

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
EndFunc   ;==>_Create_ListView_1

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
EndFunc   ;==>_Create_ListView_2

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
EndFunc   ;==>_Create_ListView_3

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
EndFunc   ;==>_Create_ListView_4

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
EndFunc   ;==>_Create_ListView_5

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
EndFunc   ;==>_Create_ListView_6

Func _Read_from_INI_ADD_2_ListView()
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')
	$Status_Combo_ApplicationList = IniRead($Config_INI, "Settings", "MainCategory", "")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $Parameter_Temp = "Update" Then $Status_Combo_ApplicationList = "ALL Categories"

	If $ButtonTAB_State = "1" Then
		If $Status_Combo_ApplicationList = "ALL Categories" Then
			If $ScanOnlyVR = "true" Then
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
			Else
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
			EndIf
		Else
			$ApplicationList_TEMP = $MainCategory_ApplicationList_Folder & $Status_Combo_ApplicationList & ".ini"
		EndIf
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_TEMP = $listview
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6


	$ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "1" Then $ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "2" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_2
	If $ButtonTAB_State = "3" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_3
	If $ButtonTAB_State = "4" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_4
	If $ButtonTAB_State = "5" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_5
	If $ButtonTAB_State = "6" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_6

	If $ButtonTAB_State = "1" Then $TAB_Label = $TAB1_Label
	If $ButtonTAB_State = "2" Then $TAB_Label = $TAB2_Label
	If $ButtonTAB_State = "3" Then $TAB_Label = $TAB3_Label
	If $ButtonTAB_State = "4" Then $TAB_Label = $TAB4_Label
	If $ButtonTAB_State = "5" Then $TAB_Label = $TAB5_Label
	If $ButtonTAB_State = "6" Then $TAB_Label = $TAB6_Label

	$NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	_GUICtrlListView_BeginUpdate($listview_TEMP)
	_GUICtrlListView_DeleteAllItems($listview_TEMP)
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
			Local $ListView_RowNR = $NR ; - 1

			If StringLeft($Application_appid, 14) = 'steam.overlay.' Then
				Local $Application_appid_Icon = StringReplace($Application_appid, 'steam.overlay.', '')
				Local $ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"
				;MsgBox(0, "1", $ImageList_Icon)
			Else
				Local $ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"
				;MsgBox(0, "2", $ImageList_Icon)
			EndIf

			Local $ListView_Icon = $ImageList_Icon
			_GUIImageList_AddBitmap($ListView_ImageList_Temp, $ListView_Icon)
			_GUICtrlListView_SetImageList($listview_TEMP, $ListView_ImageList_Temp, 1)
			_GUICtrlListView_AddItem($listview_TEMP, "", $Application_NR)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_appid, 1)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_name, 2)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_right_now, 3)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_24h_peak, 4)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_resolutionScale, 5)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_TEMP)

	For $NR2 = 0 To $NR_Applications - 1
		Local $Application_appid_last = IniRead($ApplicationList_TEMP, "Application_" & $NR2 + 1, "appid", "")
		If $Application_appid_last <> "" Then
			$ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_last & ".bmp"
			If StringLeft($Application_appid_last, 14) = 'steam.overlay.' Then
				Local $Application_appid_Icon = StringReplace($Application_appid_last, 'steam.overlay.', '')
				Local $ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_Icon & ".bmp"
				If Not FileExists($ListView_Icon) Then
					$ListView_Icon = $System_DIR & "gfx\" & "Icon_Overlay_Preview_32x32.bmp"
				EndIf
			Else
				Local $ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_last & ".bmp"
			EndIf
		EndIf
		_GUICtrlListView_SetItemImage($listview_TEMP, $NR2, $NR2)
	Next

	_GUICtrlListView_EndUpdate($listview_TEMP)
	;_GUICtrlStatusBar_SetText($Statusbar, $TAB_Label & @TAB & "Apps: " & $NR_ApplicationsCheck & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	_GUICtrlStatusBar_SetText($Statusbar, $TAB_Label & @TAB & "Apps: " & $NR_Applications & @TAB & "")
EndFunc   ;==>_Read_from_INI_ADD_2_ListView

Func _Update_ListView_Icons()
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	$Status_Combo_ApplicationList = GUICtrlRead($Combo_ApplicationList)
	_GUICtrlListView_BeginUpdate($listview)
	_GUICtrlListView_DeleteAllItems($listview)

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Status_Combo_ApplicationList = "ALL Categories" Then
			If $ScanOnlyVR = "true" Then
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
			Else
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
			EndIf
		Else
			$ApplicationList_TEMP = $MainCategory_ApplicationList_Folder & $Status_Combo_ApplicationList & ".ini"
		EndIf
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_TEMP = $listview
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	$ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "1" Then $ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "2" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_2
	If $ButtonTAB_State = "3" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_3
	If $ButtonTAB_State = "4" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_4
	If $ButtonTAB_State = "5" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_5
	If $ButtonTAB_State = "6" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_6

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	_GUICtrlListView_BeginUpdate($listview_TEMP)
	_GUICtrlListView_DeleteAllItems($listview_TEMP)
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
			_GUICtrlListView_SetImageList($listview_TEMP, $ListView_ImageList_Temp, 1)
			_GUICtrlListView_AddItem($listview_TEMP, "", $Application_NR)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_appid, 1)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_name, 2)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_installdir, 3)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_right_now, 4)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_TEMP)
EndFunc   ;==>_Update_ListView_Icons

Func _ADD_Icons_32x32_to_ListView()
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')
	_GUICtrlListView_BeginUpdate($listview)
	_GUICtrlListView_DeleteAllItems($listview)

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
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
			Local $ListView_RowNR = $NR ; - 1

			Local $ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"

			If Not FileExists($ImageList_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon)
			EndIf

			Local $ListView_Icon = $ImageList_Icon
			_GUIImageList_AddBitmap($ListView_Favorite_Image, $ListView_Icon)
			_GUICtrlListView_SetImageList($listview, $ListView_Favorite_Image, 1)
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
	_GUICtrlListView_EndUpdate($listview)
EndFunc   ;==>_ADD_Icons_32x32_to_ListView

Func _Set_States()
	Global $RM_More_Scan_Options_Item_3, $RM_More_Scan_Options_Item_4, $RM_More_Scan_Options_Item_5, $RM_More_Scan_Options_Item_6, $RM_More_Scan_Options_Item_7

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
	$Request_Steamdb_info = IniRead($Config_INI, "Settings", "Request_Steamdb_info", "")
	$ScanOnlyVR = IniRead($Config_INI, "Settings", "ScanOnlyVR", "")
	$ScanVIVEApps = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
	$ScanOculusApps = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
	$Sort_Alphabetical_order = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
	$Use_Steam_Tags = IniRead($Config_INI, "Settings", "Use_Steam_Tags", "")
	$Allow_Multiple_Tag_Assignments = IniRead($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "")
	$Add_Apps_Tags_to_categories = IniRead($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "")
	$Create_HTML_GamePage = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
	$Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "false")
	$Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "false")
	$Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")

	If $Request_Steamdb_info = "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_5, $GUI_ENABLE)
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_5, $GUI_DISABLE)
	EndIf

	If $Use_Steam_Tags = "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_3, $GUI_ENABLE)
		GUICtrlSetState($RM_More_Scan_Options_Item_4, $GUI_ENABLE)
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_3, $GUI_DISABLE)
		GUICtrlSetState($RM_More_Scan_Options_Item_4, $GUI_DISABLE)
	EndIf

	If $Add_SS_per_game = "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_6, $GUI_ENABLE)
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_6, $GUI_DISABLE)
	EndIf

EndFunc


#Region Func RM_Menu

Func _RM_Button_Scan()
	Global $contextmenu_Button_Scan = GUICtrlCreateContextMenu($Button_ReScan_Steam_Library)
	Global $RM_Button_Scan_Item_1_1 = GUICtrlCreateMenuItem("Scan", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_Button_ReScan_Steam_Library")
	Global $RM_Button_Scan_Item_1_2 = GUICtrlCreateMenuItem("Scan Viveport Apps", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_ScanViveData")
	Global $RM_Button_Scan_Item_1_3 = GUICtrlCreateMenuItem("Scan Oculus Apps", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_ScanOculusData")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
	Global $RM_Button_Scan_Item_2 = GUICtrlCreateMenuItem("Fetch Steamdb Info", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Button_Scan_Get_PO_Data")
	Global $RM_Button_Scan_Item_3 = GUICtrlCreateMenuItem("Fetch Steamdb Tags", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Scan_Fetch_Steamdb_Tags")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
	Global $RM_Button_Scan_Item_4 = GUICtrlCreateMenuItem("Create HTML Game Pages [All Apps]", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Create_HTML_GamePages_All")
	Global $RM_Button_Scan_Item_5 = GUICtrlCreateMenuItem("Create HTML Game Pages [Selected Apps]", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Create_HTML_GamePages_Selected")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
	Global $RM_Button_Scan_Item_6 = GUICtrlCreateMenuItem("Delete Category Pages", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Delete_Category_Pages")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
EndFunc   ;==>_RM_Button_Scan

Func _RM_Button_Scan_Get_PO_Data()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start adding Steamdb.Info:")
	If $ScanOnlyVR = "true" Then
		$ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
		Local $NR_ApplicationsCheck = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
	Else
		$ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		Local $NR_ApplicationsCheck = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
	EndIf

	If $NR_ApplicationsCheck <> "" Then
		For $Loop = 1 To $NR_ApplicationsCheck
			$Application_NR = $Loop
			Local $Check_NR = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "NR", "")
			Local $Check_name = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "name", "")
			Local $Check_AppId = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "appid", "")
			Local $Check_right_now = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "right_now", "")
			Local $Check_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "24h_peak", "")
			Local $Check_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "all_time_peak", "")
			Local $Check_resolutionScale = IniRead($ApplicationList_TEMP, "Application_" & $Loop, "resolutionScale", "")

			If $Check_AppId <> "" Then
				If WinExists("HomeLoader - Library") Then
					_GUICtrlStatusBar_SetText($Statusbar, "" & "Retrieving Steamdb Info... " & "Nr: " & $Loop & " - " & "Name: " & $Check_name & " - " & "SteamAppID: " & $Check_AppId & @TAB & "" & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
					GUICtrlSetData($Anzeige_Fortschrittbalken, $Loop * 100 / $NR_ApplicationsCheck)
				EndIf
				$appid = $Check_AppId
				Local $Non_Steam_App = "false"
				If StringLeft($appid, 9) = "vive.htc." Then $Non_Steam_App = "true"
				If StringLeft($appid, 11) = "revive.app." Then $Non_Steam_App = "true"
				If $Non_Steam_App <> "true" Then _Get_ADD_PlayersOnline_DATA()
			EndIf

		Next

		If WinExists("HomeLoader - Library") Then
			_GUICtrlStatusBar_SetText($Statusbar, "" & "Retrieving Steamdb Info finished" & @TAB & "" & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
			GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
			;GUICtrlSetData($Anzeige_Fortschrittbalken_2, 0)
		EndIf
	EndIf
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End adding Steamdb.Info:" & " [NR of Apps: " & $NR_ApplicationsCheck & "]")
EndFunc   ;==>_RM_Button_Scan_Get_PO_Data

Func _RM_More_Scan_Options()
	Global $contextmenu_More_Scan_Options = GUICtrlCreateContextMenu($Button_More_Scan_Options)
	Global $RM_More_Scan_Options_Item_1_1 = GUICtrlCreateMenuItem("Scan for Viveport Apps", $contextmenu_More_Scan_Options)
	If $ScanVIVEApps = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Autostart_VRUB = "true" Then GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanViveData")
	Global $RM_More_Scan_Options_Item_1_2 = GUICtrlCreateMenuItem("Scan for Oculus Apps", $contextmenu_More_Scan_Options)
	If $ScanOculusApps = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Autostart_VRUB = "true" Then GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanOculusData")
	Global $RM_More_Scan_Options_Item_2 = GUICtrlCreateMenuItem("Sort Apps in Alphabetical order", $contextmenu_More_Scan_Options)
	If $Sort_Alphabetical_order = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Autostart_VRUB = "true" Then GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Sort_Alphabetical_order")

	Global $RM_More_Scan_Options_Item_3 = GUICtrlCreateMenuItem("Add Apps based on their tags to the categories", $contextmenu_More_Scan_Options)
	If $Add_Apps_Tags_to_categories = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Autostart_VRUB = "true" Then GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetOnEvent(-1, "_RM_Add_Apps_Tags_to_categories")

	Global $RM_More_Scan_Options_Item_4 = GUICtrlCreateMenuItem("Allow multiple Tag assignments", $contextmenu_More_Scan_Options)
	If $Allow_Multiple_Tag_Assignments = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Autostart_VRUB = "true" Then GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Allow_Multiple_Tag_Assignments")

	Global $RM_More_Scan_Options_Item_5 = GUICtrlCreateMenuItem("Add number of current Players to the game Icons", $contextmenu_More_Scan_Options)
	If $Add_PlayersOnline_to_Icons = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Autostart_VRUB = "true" Then GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_PlayersOnline_to_Icons")

	Global $RM_More_Scan_Options_Item_6 = GUICtrlCreateMenuItem("Add the Resolution Scale Value to the game Icons", $contextmenu_More_Scan_Options)
	If $Add_SS_to_Icons = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Autostart_VRUB = "true" Then GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_SS_to_Icons")

	Global $RM_More_Scan_Options_Item_7 = GUICtrlCreateMenuItem("Allow Read/Edit of the Resolution Scale Value", $contextmenu_More_Scan_Options)
	If $Add_SS_per_game = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Autostart_VRUB = "true" Then GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_SS_per_game")

	Global $RM_More_Scan_Options_Item_8 = GUICtrlCreateMenuItem("Create HTML Game Pages", $contextmenu_More_Scan_Options)
	If $Create_HTML_GamePage = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Autostart_VRUB = "true" Then GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Create_HTML_GamePage")

	Global $RM_More_Scan_Options_Item_9 = GUICtrlCreateMenuItem("Delete old HomeLoader Library Data first", $contextmenu_More_Scan_Options)
	If $DeleteHomeLoaderLibraryData = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Autostart_VRUB = "true" Then GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_DeleteHomeLoaderLibraryData")
	GUICtrlCreateMenuItem("", $Button_More_Scan_Options)
EndFunc   ;==>_RM_More_Scan_Options

Func _RM_Buttons()
	Global $contextmenu_1 = GUICtrlCreateContextMenu($ButtonTAB_Steam_Library)
	;Global $RM_Button_Item_1_1 = GUICtrlCreateMenuItem("Categorize games based on their tags", $contextmenu_1)
	;Global $contextmenu_2 = GUICtrlCreateContextMenu($ButtonTAB_Non_Steam_Appl)
	;Global $RM_Button_Item_2_1 = GUICtrlCreateMenuItem("Change Section Name", $contextmenu_2)
	Global $contextmenu_3 = GUICtrlCreateContextMenu($ButtonTAB_Custom_1)
	Global $RM_Button_Item_3_1 = GUICtrlCreateMenuItem("Change Category Name", $contextmenu_3)
	GUICtrlCreateMenuItem("", $contextmenu_3)
	Global $contextmenu_4 = GUICtrlCreateContextMenu($ButtonTAB_Custom_2)
	Global $RM_Button_Item_4_1 = GUICtrlCreateMenuItem("Change Category Name", $contextmenu_4)
	GUICtrlCreateMenuItem("", $contextmenu_4)
	Global $contextmenu_5 = GUICtrlCreateContextMenu($ButtonTAB_Custom_3)
	Global $RM_Button_Item_5_1 = GUICtrlCreateMenuItem("Change Category Name", $contextmenu_5)
	GUICtrlCreateMenuItem("", $contextmenu_5)
	Global $contextmenu_6 = GUICtrlCreateContextMenu($ButtonTAB_Custom_4)
	Global $RM_Button_Item_6_1 = GUICtrlCreateMenuItem("Change Category Name", $contextmenu_6)
	GUICtrlCreateMenuItem("", $contextmenu_6)

	GUICtrlSetOnEvent($RM_Button_Item_3_1, "_Get_SteamGame_Tags")

	GUICtrlSetOnEvent($RM_Button_Item_3_1, "_RM_Button_Item_3_1")
	GUICtrlSetOnEvent($RM_Button_Item_4_1, "_RM_Button_Item_4_1")
	GUICtrlSetOnEvent($RM_Button_Item_5_1, "_RM_Button_Item_5_1")
	GUICtrlSetOnEvent($RM_Button_Item_6_1, "_RM_Button_Item_6_1")


	Global $Category_INI_Array_3[1], $Category_INI_Array_4[1], $Category_INI_Array_5[1], $Category_INI_Array_6[1]

	For $Loop = 1 To 10
		Global $Fill_Category_INI_Array_3 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop, "")
		Global $Fill_Category_INI_Array_4 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop, "")
		Global $Fill_Category_INI_Array_5 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop, "")
		Global $Fill_Category_INI_Array_6 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop, "")
		_ArrayAdd($Category_INI_Array_3, $Fill_Category_INI_Array_3)
		_ArrayAdd($Category_INI_Array_4, $Fill_Category_INI_Array_4)
		_ArrayAdd($Category_INI_Array_5, $Fill_Category_INI_Array_5)
		_ArrayAdd($Category_INI_Array_6, $Fill_Category_INI_Array_6)
	Next

	Global $RM_Category_3_1 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 1), $contextmenu_3)
	If FileReadLine($Tags_TXT, 1) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 1) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 1) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 1) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 1) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 1) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 1) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 1) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 1) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 1) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_1")

	Global $RM_Category_3_2 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 2), $contextmenu_3)
	If FileReadLine($Tags_TXT, 2) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 2) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 2) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 2) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 2) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 2) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 2) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 2) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 2) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 2) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_2")

	Global $RM_Category_3_3 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 3), $contextmenu_3)
	If FileReadLine($Tags_TXT, 3) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 3) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 3) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 3) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 3) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 3) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 3) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 3) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 3) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 3) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_3")

	Global $RM_Category_3_4 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 4), $contextmenu_3)
	If FileReadLine($Tags_TXT, 4) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 4) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 4) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 4) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 4) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 4) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 4) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 4) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 4) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 4) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_4")

	Global $RM_Category_3_5 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 5), $contextmenu_3)
	If FileReadLine($Tags_TXT, 5) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 5) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 5) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 5) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 5) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 5) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 5) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 5) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 5) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 5) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_5")

	Global $RM_Category_3_6 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 6), $contextmenu_3)
	If FileReadLine($Tags_TXT, 6) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 6) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 6) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 6) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 6) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 6) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 6) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 6) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 6) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 6) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_6")

	Global $RM_Category_3_7 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 7), $contextmenu_3)
	If FileReadLine($Tags_TXT, 7) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 7) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 7) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 7) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 7) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 7) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 7) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 7) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 7) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 7) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_7")

	Global $RM_Category_3_8 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 8), $contextmenu_3)
	If FileReadLine($Tags_TXT, 8) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 8) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 8) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 8) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 8) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 8) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 8) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 8) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 8) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 8) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_8")

	Global $RM_Category_3_9 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 9), $contextmenu_3)
	If FileReadLine($Tags_TXT, 9) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 9) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 9) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 9) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 9) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 9) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 9) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 9) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 9) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 9) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_9")

	Global $RM_Category_3_10 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 10), $contextmenu_3)
	If FileReadLine($Tags_TXT, 10) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 10) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 10) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 10) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 10) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 10) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 10) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 10) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 10) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 10) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_10")

	Global $RM_Category_3_11 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 11), $contextmenu_3)
	If FileReadLine($Tags_TXT, 11) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 11) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 11) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 11) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 11) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 11) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 11) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 11) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 11) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 11) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_11")

	Global $RM_Category_3_12 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 12), $contextmenu_3)
	If FileReadLine($Tags_TXT, 12) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 12) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 12) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 12) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 12) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 12) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 12) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 12) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 12) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 12) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_12")

	Global $RM_Category_3_13 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 13), $contextmenu_3)
	If FileReadLine($Tags_TXT, 13) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 13) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 13) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 13) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 13) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 13) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 13) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 13) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 13) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 13) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_13")

	Global $RM_Category_3_14 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 14), $contextmenu_3)
	If FileReadLine($Tags_TXT, 14) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 14) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 14) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 14) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 14) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 14) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 14) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 14) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 14) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 14) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_14")

	Global $RM_Category_3_15 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 15), $contextmenu_3)
	If FileReadLine($Tags_TXT, 15) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 15) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 15) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 15) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 15) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 15) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 15) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 15) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 15) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 15) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_15")

	Global $RM_Category_3_16 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 16), $contextmenu_3)
	If FileReadLine($Tags_TXT, 16) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 16) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 16) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 16) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 16) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 16) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 16) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 16) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 16) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 16) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_16")

	Global $RM_Category_3_17 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 17), $contextmenu_3)
	If FileReadLine($Tags_TXT, 17) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 17) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 17) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 17) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 17) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 17) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 17) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 17) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 17) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 17) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_17")

	Global $RM_Category_3_18 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 18), $contextmenu_3)
	If FileReadLine($Tags_TXT, 18) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 18) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 18) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 18) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 18) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 18) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 18) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 18) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 18) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 18) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_18")

	Global $RM_Category_3_19 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 19), $contextmenu_3)
	If FileReadLine($Tags_TXT, 19) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 19) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 19) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 19) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 19) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 19) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 19) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 19) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 19) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 19) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_19")

	Global $RM_Category_3_20 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 20), $contextmenu_3)
	If FileReadLine($Tags_TXT, 20) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 20) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 20) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 20) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 20) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 20) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 20) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 20) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 20) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 20) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_20")

	Global $RM_Category_3_21 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 21), $contextmenu_3)
	If FileReadLine($Tags_TXT, 21) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 21) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 21) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 21) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 21) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 21) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 21) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 21) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 21) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 21) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_21")

	Global $RM_Category_3_22 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 22), $contextmenu_3)
	If FileReadLine($Tags_TXT, 22) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 22) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 22) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 22) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 22) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 22) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 22) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 22) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 22) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 22) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_22")

	Global $RM_Category_3_23 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 23), $contextmenu_3)
	If FileReadLine($Tags_TXT, 23) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 23) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 23) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 23) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 23) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 23) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 23) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 23) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 23) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 23) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_23")

	Global $RM_Category_3_24 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 24), $contextmenu_3)
	If FileReadLine($Tags_TXT, 24) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 24) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 24) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 24) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 24) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 24) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 24) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 24) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 24) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 24) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_24")

	Global $RM_Category_3_25 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 25), $contextmenu_3)
	If FileReadLine($Tags_TXT, 25) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 25) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 25) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 25) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 25) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 25) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 25) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 25) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 25) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 25) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_25")

	Global $RM_Category_3_26 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 26), $contextmenu_3)
	If FileReadLine($Tags_TXT, 26) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 26) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 26) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 26) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 26) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 26) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 26) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 26) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 26) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 26) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_26")

	Global $RM_Category_3_27 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 27), $contextmenu_3)
	If FileReadLine($Tags_TXT, 27) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 27) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 27) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 27) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 27) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 27) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 27) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 27) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 27) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 27) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_27")

	Global $RM_Category_3_28 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 28), $contextmenu_3)
	If FileReadLine($Tags_TXT, 28) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 28) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 28) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 28) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 28) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 28) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 28) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 28) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 28) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 28) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_28")

	Global $RM_Category_3_29 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 29), $contextmenu_3)
	If FileReadLine($Tags_TXT, 29) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 29) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 29) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 29) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 29) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 29) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 29) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 29) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 29) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 29) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_29")

	Global $RM_Category_3_30 = GUICtrlCreateMenuItem(FileReadLine($Tags_TXT, 30), $contextmenu_3)
	If FileReadLine($Tags_TXT, 30) = $Category_INI_Array_3[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 30) = $Category_INI_Array_3[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 30) = $Category_INI_Array_3[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 30) = $Category_INI_Array_3[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 30) = $Category_INI_Array_3[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 30) = $Category_INI_Array_3[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 30) = $Category_INI_Array_3[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 30) = $Category_INI_Array_3[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 30) = $Category_INI_Array_3[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If FileReadLine($Tags_TXT, 30) = $Category_INI_Array_3[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_3_30")


	Global $Category_Name_INI = FileReadLine($Tags_TXT, 1)
	Global $RM_Category_4_1 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_1")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 2)
	Global $RM_Category_4_2 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_2")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 3)
	Global $RM_Category_4_3 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_3")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 4)
	Global $RM_Category_4_4 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_4")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 5)
	Global $RM_Category_4_5 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_5")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 6)
	Global $RM_Category_4_6 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_6")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 7)
	Global $RM_Category_4_7 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_7")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 8)
	Global $RM_Category_4_8 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_8")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 9)
	Global $RM_Category_4_9 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_9")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 10)
	Global $RM_Category_4_10 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_10")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 11)
	Global $RM_Category_4_11 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_11")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 12)
	Global $RM_Category_4_12 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_12")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 13)
	Global $RM_Category_4_13 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_13")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 14)
	Global $RM_Category_4_14 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_14")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 15)
	Global $RM_Category_4_15 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_15")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 16)
	Global $RM_Category_4_16 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_16")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 17)
	Global $RM_Category_4_17 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_17")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 18)
	Global $RM_Category_4_18 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_18")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 19)
	Global $RM_Category_4_19 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_19")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 20)
	Global $RM_Category_4_20 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_20")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 21)
	Global $RM_Category_4_21 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_21")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 22)
	Global $RM_Category_4_22 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_22")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 23)
	Global $RM_Category_4_23 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_23")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 24)
	Global $RM_Category_4_24 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_24")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 25)
	Global $RM_Category_4_25 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_25")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 26)
	Global $RM_Category_4_26 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_26")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 27)
	Global $RM_Category_4_27 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_27")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 28)
	Global $RM_Category_4_28 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_28")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 29)
	Global $RM_Category_4_29 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_29")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 30)
	Global $RM_Category_4_30 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_4)
	If $Category_Name_INI = $Category_INI_Array_4[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_4[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_4_30")


	Global $Category_Name_INI = FileReadLine($Tags_TXT, 1)
	Global $RM_Category_5_1 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_1")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 2)
	Global $RM_Category_5_2 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_2")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 3)
	Global $RM_Category_5_3 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_3")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 4)
	Global $RM_Category_5_4 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_4")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 5)
	Global $RM_Category_5_5 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_5")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 6)
	Global $RM_Category_5_6 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_6")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 7)
	Global $RM_Category_5_7 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_7")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 8)
	Global $RM_Category_5_8 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_8")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 9)
	Global $RM_Category_5_9 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_9")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 10)
	Global $RM_Category_5_10 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_10")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 11)
	Global $RM_Category_5_11 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_11")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 12)
	Global $RM_Category_5_12 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_12")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 13)
	Global $RM_Category_5_13 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_13")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 14)
	Global $RM_Category_5_14 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_14")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 15)
	Global $RM_Category_5_15 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_15")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 16)
	Global $RM_Category_5_16 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_16")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 17)
	Global $RM_Category_5_17 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_17")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 18)
	Global $RM_Category_5_18 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_18")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 19)
	Global $RM_Category_5_19 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_19")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 20)
	Global $RM_Category_5_20 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_20")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 21)
	Global $RM_Category_5_21 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_21")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 22)
	Global $RM_Category_5_22 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_22")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 23)
	Global $RM_Category_5_23 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_23")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 24)
	Global $RM_Category_5_24 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_24")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 25)
	Global $RM_Category_5_25 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_25")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 26)
	Global $RM_Category_5_26 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_26")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 27)
	Global $RM_Category_5_27 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_27")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 28)
	Global $RM_Category_5_28 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_28")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 29)
	Global $RM_Category_5_29 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_29")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 30)
	Global $RM_Category_5_30 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_5)
	If $Category_Name_INI = $Category_INI_Array_5[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_5[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_5_30")


	Global $Category_Name_INI = FileReadLine($Tags_TXT, 1)
	Global $RM_Category_6_1 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_1")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 2)
	Global $RM_Category_6_2 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_2")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 3)
	Global $RM_Category_6_3 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_3")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 4)
	Global $RM_Category_6_4 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_4")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 5)
	Global $RM_Category_6_5 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_5")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 6)
	Global $RM_Category_6_6 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_6")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 7)
	Global $RM_Category_6_7 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_7")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 8)
	Global $RM_Category_6_8 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_8")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 9)
	Global $RM_Category_6_9 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_9")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 10)
	Global $RM_Category_6_10 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_10")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 11)
	Global $RM_Category_6_11 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_11")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 12)
	Global $RM_Category_6_12 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_12")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 13)
	Global $RM_Category_6_13 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_13")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 14)
	Global $RM_Category_6_14 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_14")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 15)
	Global $RM_Category_6_15 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_15")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 16)
	Global $RM_Category_6_16 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_16")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 17)
	Global $RM_Category_6_17 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_17")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 18)
	Global $RM_Category_6_18 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_18")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 19)
	Global $RM_Category_6_19 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_19")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 20)
	Global $RM_Category_6_20 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_20")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 21)
	Global $RM_Category_6_21 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_21")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 22)
	Global $RM_Category_6_22 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_22")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 23)
	Global $RM_Category_6_23 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_23")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 24)
	Global $RM_Category_6_24 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_24")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 25)
	Global $RM_Category_6_25 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_25")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 26)
	Global $RM_Category_6_26 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_26")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 27)
	Global $RM_Category_6_27 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_27")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 28)
	Global $RM_Category_6_28 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_28")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 29)
	Global $RM_Category_6_29 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_29")
	Global $Category_Name_INI = FileReadLine($Tags_TXT, 30)
	Global $RM_Category_6_30 = GUICtrlCreateMenuItem($Category_Name_INI, $contextmenu_6)
	If $Category_Name_INI = $Category_INI_Array_6[0] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[1] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[2] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[3] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[4] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[5] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[6] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[7] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[8] Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Category_Name_INI = $Category_INI_Array_6[9] Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Category_6_30")

	GUICtrlCreateMenuItem("", $contextmenu_3)
	GUICtrlCreateMenuItem("", $contextmenu_4)
	GUICtrlCreateMenuItem("", $contextmenu_5)
	GUICtrlCreateMenuItem("", $contextmenu_6)
EndFunc   ;==>_RM_Buttons

Func _RM_Button_Item_3_1()
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_1)
	Local $InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB3_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_1, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB3_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_1, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB3_Name", $InputBox)
	EndIf
EndFunc   ;==>_RM_Button_Item_3_1

Func _RM_Button_Item_4_1()
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_2)
	Local $InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB4_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_2, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB4_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_2, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB4_Name", $InputBox)
	EndIf
EndFunc   ;==>_RM_Button_Item_4_1

Func _RM_Button_Item_5_1()
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_3)
	Local $InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB5_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_3, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB5_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_3, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB5_Name", $InputBox)
	EndIf
EndFunc   ;==>_RM_Button_Item_5_1

Func _RM_Button_Item_6_1()
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_4)
	Local $InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB6_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_4, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB6_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_4, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB6_Name", $InputBox)
	EndIf
EndFunc   ;==>_RM_Button_Item_6_1

#Region RM TAGS
Func _RM_Checkbox_Category_3_1()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 1)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_1, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_1, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_1

Func _RM_Checkbox_Category_3_2()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 2)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_2, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_2, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_2

Func _RM_Checkbox_Category_3_3()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 3)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_3, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_3, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_3

Func _RM_Checkbox_Category_3_4()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 4)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_4, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_4, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_4

Func _RM_Checkbox_Category_3_5()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 5)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_5, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_5, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_5

Func _RM_Checkbox_Category_3_6()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 6)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_6, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_6, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_6

Func _RM_Checkbox_Category_3_7()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 7)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_7, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_7, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_7

Func _RM_Checkbox_Category_3_8()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 8)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_8, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_8, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_8

Func _RM_Checkbox_Category_3_9()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 9)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_9, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_9, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_9

Func _RM_Checkbox_Category_3_10()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 10)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_10, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_10, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_10

Func _RM_Checkbox_Category_3_11()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 11)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_11, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_11, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_11

Func _RM_Checkbox_Category_3_12()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 12)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_12, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_12, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_12

Func _RM_Checkbox_Category_3_13()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 13)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_13, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_13, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_13

Func _RM_Checkbox_Category_3_14()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 14)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_14, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_14, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_14

Func _RM_Checkbox_Category_3_15()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 15)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_15, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_15, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_15

Func _RM_Checkbox_Category_3_16()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 16)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_16, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_16, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_16

Func _RM_Checkbox_Category_3_17()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 1)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_17, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_17, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_17

Func _RM_Checkbox_Category_3_18()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 18)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_18, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_18, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_18

Func _RM_Checkbox_Category_3_19()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 1)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_19, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_19, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_19

Func _RM_Checkbox_Category_3_20()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 20)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_20, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_20, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_20

Func _RM_Checkbox_Category_3_21()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 21)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_21, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_21, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_21

Func _RM_Checkbox_Category_3_22()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 22)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_22, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_22, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_22

Func _RM_Checkbox_Category_3_23()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 23)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_23, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_23, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_23

Func _RM_Checkbox_Category_3_24()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 24)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_24, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_24, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_24

Func _RM_Checkbox_Category_3_25()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 25)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_25, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_25, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_25

Func _RM_Checkbox_Category_3_26()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 26)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_26, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_26, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_26

Func _RM_Checkbox_Category_3_27()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 27)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_27, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_27, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_27

Func _RM_Checkbox_Category_3_28()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 28)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_28, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_28, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_28

Func _RM_Checkbox_Category_3_29()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 29)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_29, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_29, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_29

Func _RM_Checkbox_Category_3_30()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 30)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_3_30, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_1.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_3_30, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_3_30


Func _RM_Checkbox_Category_4_1()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 1)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_1, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_1, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_1

Func _RM_Checkbox_Category_4_2()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 2)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_2, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_2, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_2

Func _RM_Checkbox_Category_4_3()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 3)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_3, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_3, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_3

Func _RM_Checkbox_Category_4_4()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 4)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_4, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_4, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_4

Func _RM_Checkbox_Category_4_5()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 5)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_5, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_5, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_5

Func _RM_Checkbox_Category_4_6()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 6)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_6, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_6, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_6

Func _RM_Checkbox_Category_4_7()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 7)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_7, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_7, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_7

Func _RM_Checkbox_Category_4_8()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 8)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_8, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_8, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_8

Func _RM_Checkbox_Category_4_9()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 9)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_9, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_9, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_9

Func _RM_Checkbox_Category_4_10()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 10)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_10, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_10, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_10

Func _RM_Checkbox_Category_4_11()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 11)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_11, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_11, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_11

Func _RM_Checkbox_Category_4_12()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 12)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_12, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_12, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_12

Func _RM_Checkbox_Category_4_13()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 13)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_13, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_13, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_13

Func _RM_Checkbox_Category_4_14()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 14)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_14, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_14, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_14

Func _RM_Checkbox_Category_4_15()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 15)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_15, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_15, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_15

Func _RM_Checkbox_Category_4_16()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 16)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_16, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_16, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_16

Func _RM_Checkbox_Category_4_17()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 17)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_17, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_17, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_17

Func _RM_Checkbox_Category_4_18()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 18)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_18, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_18, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_18

Func _RM_Checkbox_Category_4_19()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 19)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_19, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_19, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_19

Func _RM_Checkbox_Category_4_20()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 20)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_20, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_20, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_20

Func _RM_Checkbox_Category_4_21()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 21)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_21, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_21, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_21

Func _RM_Checkbox_Category_4_22()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 22)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_22, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_22, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_22

Func _RM_Checkbox_Category_4_23()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 23)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_23, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_23, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_23

Func _RM_Checkbox_Category_4_24()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 24)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_24, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_24, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_24

Func _RM_Checkbox_Category_4_25()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 25)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_25, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_25, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_25

Func _RM_Checkbox_Category_4_26()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 26)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_26, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_26, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_26

Func _RM_Checkbox_Category_4_27()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 27)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_27, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_27, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_27

Func _RM_Checkbox_Category_4_28()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 28)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_28, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_28, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_28

Func _RM_Checkbox_Category_4_29()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 29)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_29, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_29, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_29

Func _RM_Checkbox_Category_4_30()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 30)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_4_30, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_2.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_4_30, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_4_30



Func _RM_Checkbox_Category_5_1()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 1)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_1, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_1, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_1

Func _RM_Checkbox_Category_5_2()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 2)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_2, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_2, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_2

Func _RM_Checkbox_Category_5_3()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 3)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_3, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_3, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_3

Func _RM_Checkbox_Category_5_4()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 4)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_4, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_4, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_4

Func _RM_Checkbox_Category_5_5()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 5)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_5, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_5, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_5

Func _RM_Checkbox_Category_5_6()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 6)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_6, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_6, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_6

Func _RM_Checkbox_Category_5_7()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 7)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_7, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_7, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_7

Func _RM_Checkbox_Category_5_8()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 8)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_8, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_8, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_8

Func _RM_Checkbox_Category_5_9()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 9)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_9, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_9, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_9

Func _RM_Checkbox_Category_5_10()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 10)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_10, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_10, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_10

Func _RM_Checkbox_Category_5_11()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 11)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_11, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_11, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_11

Func _RM_Checkbox_Category_5_12()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 12)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_12, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_12, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_12

Func _RM_Checkbox_Category_5_13()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 13)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_13, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_13, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_13

Func _RM_Checkbox_Category_5_14()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 14)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_14, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_14, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_14

Func _RM_Checkbox_Category_5_15()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 15)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_15, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_15, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_15

Func _RM_Checkbox_Category_5_16()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 16)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_16, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_16, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_16

Func _RM_Checkbox_Category_5_17()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 17)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_17, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_17, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_17

Func _RM_Checkbox_Category_5_18()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 18)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_18, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_18, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_18

Func _RM_Checkbox_Category_5_19()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 19)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_19, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_19, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_19

Func _RM_Checkbox_Category_5_20()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 02)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_20, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_20, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_20

Func _RM_Checkbox_Category_5_21()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 21)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_21, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_21, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_21

Func _RM_Checkbox_Category_5_22()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 22)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_22, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_22, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_22

Func _RM_Checkbox_Category_5_23()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 23)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_23, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_23, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_23

Func _RM_Checkbox_Category_5_24()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 24)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_24, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_24, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_24

Func _RM_Checkbox_Category_5_25()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 25)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_25, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_25, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_25

Func _RM_Checkbox_Category_5_26()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 26)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_26, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_26, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_26

Func _RM_Checkbox_Category_5_27()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 27)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_27, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_27, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_27

Func _RM_Checkbox_Category_5_28()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 28)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_28, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_28, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_28

Func _RM_Checkbox_Category_5_29()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 29)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_29, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_29, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_29

Func _RM_Checkbox_Category_5_30()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 30)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_5_30, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_3.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_5_30, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_5_30

Func _RM_Checkbox_Category_6_1()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 1)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_1, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_1, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_1

Func _RM_Checkbox_Category_6_2()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 2)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_2, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_2, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_2

Func _RM_Checkbox_Category_6_3()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 3)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_3, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_13, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_3

Func _RM_Checkbox_Category_6_4()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 4)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_4, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_4, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_4

Func _RM_Checkbox_Category_6_5()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 5)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_5, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_5, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_5

Func _RM_Checkbox_Category_6_6()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 6)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_6, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_6, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_6

Func _RM_Checkbox_Category_6_7()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 7)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_7, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_7, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_7

Func _RM_Checkbox_Category_6_8()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 8)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_8, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_8, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_8

Func _RM_Checkbox_Category_6_9()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 9)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_9, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_9, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_9

Func _RM_Checkbox_Category_6_10()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 10)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_10, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_10, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_10

Func _RM_Checkbox_Category_6_11()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 11)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_11, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_11, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_11

Func _RM_Checkbox_Category_6_12()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 12)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_12, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_12, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_12

Func _RM_Checkbox_Category_6_13()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 13)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_13, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_13, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_13

Func _RM_Checkbox_Category_6_14()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 14)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_14, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_14, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_14

Func _RM_Checkbox_Category_6_15()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 15)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_15, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_15, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_15

Func _RM_Checkbox_Category_6_16()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 16)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_16, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_16, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_16

Func _RM_Checkbox_Category_6_17()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 17)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_17, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_17, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_17

Func _RM_Checkbox_Category_6_18()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 18)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_18, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_18, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_18

Func _RM_Checkbox_Category_6_19()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 19)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_19, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_19, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_19

Func _RM_Checkbox_Category_6_20()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 20)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_20, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_20, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_20

Func _RM_Checkbox_Category_6_21()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 21)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_21, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_21, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_21

Func _RM_Checkbox_Category_6_22()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 22)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_22, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_22, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_22

Func _RM_Checkbox_Category_6_23()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 23)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_23, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_23, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_23

Func _RM_Checkbox_Category_6_24()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 24)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_24, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_24, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_24

Func _RM_Checkbox_Category_6_25()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 25)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_25, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_25, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_25

Func _RM_Checkbox_Category_6_26()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 26)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_26, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_26, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_26

Func _RM_Checkbox_Category_6_27()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 27)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_27, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_27, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_27

Func _RM_Checkbox_Category_6_28()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 28)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_28, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_28, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_28

Func _RM_Checkbox_Category_6_29()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 29)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_29, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_29, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_29

Func _RM_Checkbox_Category_6_30()
	For $Loop_Temp = 1 To 10
		Local $Check_name = FileReadLine($Tags_TXT, 30)
		Local $Read_Temp = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
		If $Check_name = $Read_Temp Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, "")
			For $Loop_Temp_2 = $Loop_Temp To 10
				Local $Read_Temp_2 = IniRead($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2 + 1, "")
				If $Loop_Temp_2 <> 0 Then IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp_2, $Read_Temp_2)
			Next
			GUICtrlSetState($RM_Category_6_30, $GUI_UNCHECKED)
			ExitLoop
		EndIf
		If $Read_Temp = "" Then
			IniWrite($Install_DIR & "ApplicationList\Tags_Custom_4.ini", "Tags", "Tag_" & $Loop_Temp, $Check_name)
			GUICtrlSetState($RM_Category_6_30, $GUI_CHECKED)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>_RM_Checkbox_Category_6_30
#EndRegion RM TAGS

#Region RM_Resolution Scale
Func _RM_Item_RS_1() ; Resolution Scale 40%
	$ResolutionScale_TEMP = "40"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_1

Func _RM_Item_RS_2() ; Resolution Scale 60%
	$ResolutionScale_TEMP = "60"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_2

Func _RM_Item_RS_3() ; Resolution Scale 80%
	$ResolutionScale_TEMP = "80"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_3

Func _RM_Item_RS_4() ; Resolution Scale 100%
	$ResolutionScale_TEMP = "100"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_4

Func _RM_Item_RS_5() ; Resolution Scale 120%
	$ResolutionScale_TEMP = "120"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_5

Func _RM_Item_RS_6() ; Resolution Scale 140%
	$ResolutionScale_TEMP = "140"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_6

Func _RM_Item_RS_7() ; Resolution Scale 160%
	$ResolutionScale_TEMP = "160"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_7

Func _RM_Item_RS_8() ; Resolution Scale 180%
	$ResolutionScale_TEMP = "180"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_8

Func _RM_Item_RS_9() ; Resolution Scale 200%
	$ResolutionScale_TEMP = "200"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_9

Func _RM_Item_RS_10() ; Resolution Scale 220%
	$ResolutionScale_TEMP = "220"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_10

Func _RM_Item_RS_11() ; Resolution Scale 240%
	$ResolutionScale_TEMP = "240"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_11

Func _RM_Item_RS_12() ; Resolution Scale 260%
	$ResolutionScale_TEMP = "260"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_12

Func _RM_Item_RS_13() ; Resolution Scale 280%
	$ResolutionScale_TEMP = "280"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_13

Func _RM_Item_RS_14() ; Resolution Scale 300%
	$ResolutionScale_TEMP = "300"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_14
#EndRegion RM_Resolution Scale

Func _RM_Menu_Item_5_1() ; Add to Autostart List
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "1" Then $listview = $listview
	If $ButtonTAB_State = "2" Then $listview = $listview_2
	If $ButtonTAB_State = "3" Then $listview = $listview_3
	If $ButtonTAB_State = "4" Then $listview = $listview_4
	If $ButtonTAB_State = "5" Then $listview = $listview_5
	If $ButtonTAB_State = "6" Then $listview = $listview_6

	If $ButtonTAB_State = "1" Then
		If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
		If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppId = _GUICtrlListView_GetItemText($listview, $ListView_Selected_Row_Nr - 1, 1)
	Local $Check_AppName = IniRead($ApplicationList_TEMP, "Application_" & $Check_AppId, "name", "")
	Local $Check_AppStartPath = "steam://rungameid/" & $Check_AppId

	If $Check_AppId <> "" Then
		For $Loop = 1 To 9
			Local $Autostart_App_Name = IniRead($Config_INI, "Autostart", "App_" & $Loop & "_Name", "")
			Local $Autostart_App_Path = IniRead($Config_INI, "Autostart", "App_" & $Loop & "_Path", "")
			Local $Autostart_App_State = IniRead($Config_INI, "Autostart", "App_" & $Loop & "_State", "")

			If $Autostart_App_Name = "" Then
				$Autostart_App_Name = IniWrite($Config_INI, "Autostart", "App_" & $Loop & "_Name", $Check_AppName)
				$Autostart_App_Path = IniWrite($Config_INI, "Autostart", "App_" & $Loop & "_Path", $Check_AppStartPath)
				$Autostart_App_State = IniWrite($Config_INI, "Autostart", "App_" & $Loop & "_State", "false")
				ExitLoop
			EndIf
		Next
	EndIf
EndFunc   ;==>_RM_Menu_Item_5_1

Func _RM_Menu_Item_5_2() ; Remove to Autostart List
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "1" Then $listview = $listview
	If $ButtonTAB_State = "2" Then $listview = $listview_2
	If $ButtonTAB_State = "3" Then $listview = $listview_3
	If $ButtonTAB_State = "4" Then $listview = $listview_4
	If $ButtonTAB_State = "5" Then $listview = $listview_5
	If $ButtonTAB_State = "6" Then $listview = $listview_6

	If $ButtonTAB_State = "1" Then
		If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
		If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppId = _GUICtrlListView_GetItemText($listview, $ListView_Selected_Row_Nr - 1, 1)
	Local $Check_AppName = IniRead($ApplicationList_TEMP, "Application_" & $Check_AppId, "name", "")
	Local $Check_AppStartPath = "steam://rungameid/" & $Check_AppId

	If $Check_AppId <> "" Then
		For $Loop = 1 To 9
			Local $Autostart_App_Name = IniRead($Config_INI, "Autostart", "App_" & $Loop & "_Name", "")
			Local $Autostart_App_Path = IniRead($Config_INI, "Autostart", "App_" & $Loop & "_Path", "")
			Local $Autostart_App_State = IniRead($Config_INI, "Autostart", "App_" & $Loop & "_State", "")

			If $Check_AppName = $Autostart_App_Name Then
				$Autostart_App_Name = IniWrite($Config_INI, "Autostart", "App_" & $Loop & "_Name", "")
				$Autostart_App_Path = IniWrite($Config_INI, "Autostart", "App_" & $Loop & "_Path", "")
				$Autostart_App_State = IniWrite($Config_INI, "Autostart", "App_" & $Loop & "_State", "false")
				ExitLoop
			EndIf
		Next
	EndIf
EndFunc   ;==>_RM_Menu_Item_5_2

Func _RM_Menu_Item_8() ; RM_UP
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
		If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
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

	$listview_TEMP = $listview
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	Local $GameNR = $ListView_Selected_Row_Nr

	Local $GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	Local $GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	Local $GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	Local $GetItem_right_now_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "right_now", "")
	Local $GetItem_24h_peak_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "24h_peak", "")
	Local $GetItem_all_time_peak_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "all_time_peak", "")
	Local $GetItem_resolutionScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "resolutionScale", "")
	Local $GetItem_url_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "url", "")
	Local $GetItem_IconPath_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "IconPath", "")
	Local $GetItem_binary_path_windows_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "binary_path_windows", "")
	Local $GetItem_arguments_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "arguments", "")
	Local $GetItem_image_path_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "image_path", "")
	Local $GetItem_launch_type_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "launch_type", "")
	Local $GetItem_installdir_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "installdir", "")

	Local $GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "NR", "")
	Local $GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "name", "")
	Local $GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "appid", "")
	Local $GetItem_right_now_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "right_now", "")
	Local $GetItem_24h_peak_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "24h_peak", "")
	Local $GetItem_all_time_peak_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "all_time_peak", "")
	Local $GetItem_resolutionScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "resolutionScale", "")
	Local $GetItem_url_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "url", "")
	Local $GetItem_IconPath_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "IconPath", "")
	Local $GetItem_binary_path_windows_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "binary_path_windows", "")
	Local $GetItem_arguments_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "arguments", "")
	Local $GetItem_image_path_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "image_path", "")
	Local $GetItem_launch_type_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "launch_type", "")
	Local $GetItem_installdir_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "installdir", "")

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	If $GetItem_right_now_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "right_now", $GetItem_right_now_1)
	If $GetItem_24h_peak_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "24h_peak", $GetItem_24h_peak_1)
	If $GetItem_all_time_peak_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "all_time_peak", $GetItem_all_time_peak_1)
	If $GetItem_resolutionScale_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "resolutionScale", $GetItem_resolutionScale_1)
	If $GetItem_url_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "url", $GetItem_url_1)
	If $GetItem_IconPath_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "IconPath", $GetItem_IconPath_1)
	If $GetItem_binary_path_windows_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "binary_path_windows", $GetItem_binary_path_windows_1)
	If $GetItem_arguments_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "arguments", $GetItem_arguments_1)
	If $GetItem_image_path_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "image_path", $GetItem_image_path_1)
	If $GetItem_launch_type_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "launch_type", $GetItem_launch_type_1)
	If $GetItem_installdir_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "installdir", $GetItem_installdir_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	If $GetItem_right_now_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "right_now", $GetItem_right_now_2)
	If $GetItem_24h_peak_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "24h_peak", $GetItem_24h_peak_2)
	If $GetItem_all_time_peak_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "all_time_peak", $GetItem_all_time_peak_2)
	If $GetItem_resolutionScale_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "resolutionScale", $GetItem_resolutionScale_2)
	If $GetItem_url_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "url", $GetItem_url_2)
	If $GetItem_IconPath_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "IconPath", $GetItem_IconPath_2)
	If $GetItem_binary_path_windows_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "binary_path_windows", $GetItem_binary_path_windows_2)
	If $GetItem_arguments_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "arguments", $GetItem_arguments_2)
	If $GetItem_image_path_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "image_path", $GetItem_image_path_2)
	If $GetItem_launch_type_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "launch_type", $GetItem_launch_type_2)
	If $GetItem_installdir_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "installdir", $GetItem_installdir_2)

	_Read_from_INI_ADD_2_ListView()
	;_Restart()
EndFunc   ;==>_RM_Menu_Item_8

Func _RM_Menu_Item_9() ; RM_DOWN
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
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

	$listview_TEMP = $listview
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	Local $GameNR = $ListView_Selected_Row_Nr

	Local $GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	Local $GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	Local $GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	Local $GetItem_right_now_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "right_now", "")
	Local $GetItem_24h_peak_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "24h_peak", "")
	Local $GetItem_all_time_peak_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "all_time_peak", "")
	Local $GetItem_resolutionScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "resolutionScale", "")
	Local $GetItem_url_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "url", "")
	Local $GetItem_IconPath_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "IconPath", "")
	Local $GetItem_binary_path_windows_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "binary_path_windows", "")
	Local $GetItem_arguments_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "arguments", "")
	Local $GetItem_image_path_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "image_path", "")
	Local $GetItem_launch_type_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "launch_type", "")
	Local $GetItem_installdir_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "installdir", "")

	Local $GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "NR", "")
	Local $GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "name", "")
	Local $GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "appid", "")
	Local $GetItem_right_now_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "right_now", "")
	Local $GetItem_24h_peak_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "24h_peak", "")
	Local $GetItem_all_time_peak_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "all_time_peak", "")
	Local $GetItem_resolutionScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "resolutionScale", "")
	Local $GetItem_url_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "url", "")
	Local $GetItem_IconPath_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "IconPath", "")
	Local $GetItem_binary_path_windows_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "binary_path_windows", "")
	Local $GetItem_arguments_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "arguments", "")
	Local $GetItem_image_path_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "image_path", "")
	Local $GetItem_launch_type_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "launch_type", "")
	Local $GetItem_installdir_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "installdir", "")

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	If $GetItem_right_now_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "right_now", $GetItem_right_now_1)
	If $GetItem_24h_peak_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "24h_peak", $GetItem_24h_peak_1)
	If $GetItem_all_time_peak_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "all_time_peak", $GetItem_all_time_peak_1)
	If $GetItem_resolutionScale_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "resolutionScale", $GetItem_resolutionScale_1)
	If $GetItem_url_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "url", $GetItem_url_1)
	If $GetItem_IconPath_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "IconPath", $GetItem_IconPath_1)
	If $GetItem_binary_path_windows_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "binary_path_windows", $GetItem_binary_path_windows_1)
	If $GetItem_arguments_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "arguments", $GetItem_arguments_1)
	If $GetItem_image_path_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "image_path", $GetItem_image_path_1)
	If $GetItem_launch_type_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "launch_type", $GetItem_launch_type_1)
	If $GetItem_installdir_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "installdir", $GetItem_installdir_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	If $GetItem_right_now_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "right_now", $GetItem_right_now_2)
	If $GetItem_24h_peak_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "24h_peak", $GetItem_24h_peak_2)
	If $GetItem_all_time_peak_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "all_time_peak", $GetItem_all_time_peak_2)
	If $GetItem_resolutionScale_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "resolutionScale", $GetItem_resolutionScale_2)
	If $GetItem_url_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "url", $GetItem_url_2)
	If $GetItem_IconPath_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "IconPath", $GetItem_IconPath_2)
	If $GetItem_binary_path_windows_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "binary_path_windows", $GetItem_binary_path_windows_2)
	If $GetItem_arguments_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "arguments", $GetItem_arguments_2)
	If $GetItem_image_path_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "image_path", $GetItem_image_path_2)
	If $GetItem_launch_type_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "launch_type", $GetItem_launch_type_2)
	If $GetItem_installdir_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "installdir", $GetItem_installdir_2)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_RM_Menu_Item_9

Func _RM_Menu_Item11() ; Delete ListView item
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
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

	$listview_TEMP = $listview
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview, $ListView_Selected_Row_Index)
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

	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "installdir", $GetItem_installdir_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "IconPath", $GetItem_IconPath_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "right_now", $GetItem_right_now_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "24h_peak", $GetItem_24h_peak_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "all_time_peak", $GetItem_all_time_peak_1)



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

			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "NR", $Loop_Temp - 1)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "appid", $GetItem_appid_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "name", $GetItem_name_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "installdir", $GetItem_installdir_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "IconPath", $GetItem_IconPath_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "right_now", $GetItem_right_now_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "24h_peak", $GetItem_24h_peak_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "all_time_peak", $GetItem_24h_peak_next)
		EndIf
		If $Loop_Temp = $ApplicationList_NR_Applications Then
			IniDelete($ApplicationList_TEMP, "Application_" & $GetItem_appid_delete)
			IniDelete($ApplicationList_TEMP, "Application_" & $Loop_Temp)
		EndIf
	Next
	_Update_ListView_Icons()
	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_RM_Menu_Item11
#EndRegion Func RM_Menu

Func _ClickOnListView($hWndGUI, $MsgID, $wParam, $lParam)
	Local $tagNMHDR, $event, $hwndFrom, $code
	$tagNMHDR = DllStructCreate("int;int;int", $lParam)
	If @error Then Return
	$event = DllStructGetData($tagNMHDR, 3)
	If $wParam = $listview Or $wParam = $listview_2 Or $wParam = $listview_3 Or $wParam = $listview_4 Or $wParam = $listview_5 Or $wParam = $listview_6 Then
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
EndFunc   ;==>_ClickOnListView

Func _DB_Click_Listview()
	Sleep(100)
	_Start_ListView_Selected()
	Sleep(100)
EndFunc   ;==>_DB_Click_Listview

Func _Change_Preview_Icon_ListView()
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppId = _GUICtrlListView_GetItemText($listview_TEMP, $ListView_Selected_Row_Nr - 1, 1)
	Local $CheckImagePath = $Icons & "steam.app." & $Check_AppId & ".jpg"

	$CheckImagePath = $Icons & "460x215\SS_Values\steam.app." & $Check_AppId & ".jpg"
	If Not FileExists($CheckImagePath) Then $CheckImagePath = $Icons & "460x215\steam.app." & $Check_AppId & ".jpg"
	If Not FileExists($CheckImagePath) Then $CheckImagePath = $Icons & "steam.app." & $Check_AppId & ".jpg"



	If Not FileExists($CheckImagePath) Then
		If $ButtonTAB_State = 1 Then
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_TEMP, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_TEMP, "Application_" & $Check_AppId, "image_path", "")
		EndIf

		If $ButtonTAB_State = 2 Then
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Check_AppId, "image_path", "")
		EndIf

		If $ButtonTAB_State = 3 Then
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "image_path", "")
		EndIf

		If $ButtonTAB_State = 4 Then
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "image_path", "")
		EndIf
		If $ButtonTAB_State = 5 Then
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "image_path", "")
		EndIf

		If $ButtonTAB_State = 6 Then
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "image_path", "")
		EndIf
	EndIf

	;MsgBox(0, "", $CheckImagePath)

	If $CheckImagePath = "" Or $CheckImagePath = $Icons & "" & ".jpg" Or Not FileExists($CheckImagePath) Then $CheckImagePath = $gfx & "Icon_Preview2.jpg"
	GUICtrlSetImage($Icon_Preview_Image, $CheckImagePath)
EndFunc   ;==>_Change_Preview_Icon_ListView

Func _Update_VRSettings_GUI_Items()
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")

	If $ButtonTAB_State = "1" Then
		If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
		If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
	EndIf
	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Steam_app_Name_RS = StringLeft($Steam_app_Name, 18)
	If StringLen($Steam_app_Name) > 18 Then $Steam_app_Name_RS = $Steam_app_Name_RS & "."
	Local $Game_ID = $ListView_Item_Array[2]

	Local $ResolutionScale_value = IniRead($ApplicationList_TEMP, "Application_" & $Game_ID, "ResolutionScale", "100")

	GUICtrlSetData($ResolutionScale_Group, "Scale [%] for: " & $Steam_app_Name_RS)
	GUICtrlSetData($Slider_0, $ResolutionScale_value)
	GUICtrlSetData($Input_ResolutionScale, $ResolutionScale_value)

EndFunc   ;==>_Update_VRSettings_GUI_Items

Func _Create_HTMLView_GUI()
	Local $Button_Exit_HTML_GUI

	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	Local $regValue = "0x2AF8"
	; IE11 edge mode: 11001 (0x2AF9)
	; IE11: 11000 (0x2AF8)
	; IE10: 10001 (0x2711)
	; IE10: 10000 (0x02710)
	; IE 9: 9999 (0x270F)
	; IE 9: 9000 (0x2328)
	; IE 8: 8888 (0x22B8)
	; IE 8: 8000 (0x1F40)
	; IE 7: 7000 (0x1B58)

	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION", _ProcessGetName(@AutoItPID), "REG_DWORD", $regValue)
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION", _ProcessGetName(@AutoItPID), "REG_DWORD", $regValue)
;~ RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION", @ScriptName, "REG_DWORD", $regValue)
;~ RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION",@ScriptName, "REG_DWORD", $regValue)


	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "1" Then $listview = $listview
	If $ButtonTAB_State = "2" Then $listview = $listview_2
	If $ButtonTAB_State = "3" Then $listview = $listview_3
	If $ButtonTAB_State = "4" Then $listview = $listview_4
	If $ButtonTAB_State = "5" Then $listview = $listview_5
	If $ButtonTAB_State = "6" Then $listview = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $oIE = ObjCreate("Shell.Explorer.2")
	If Not @error Then
		Global $HTML_GUI = GUICreate($Steam_app_Name & " - " & "steam.app." & $Game_ID, 980, 600, (@DesktopWidth - 980) / 2, (@DesktopHeight - 600) / 2, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
		GUICtrlCreateObj($oIE, 0, 0, 979, 550)

		Global $Button_Exit_HTML_GUI = GUICtrlCreateButton("Exit", 940, 560, 35, 35, $BS_BITMAP)
		GUICtrlSetOnEvent(-1, "_Button_Exit_HTML_GUI")
		_GUICtrlButton_SetImage(-1, $gfx & "Close_small.bmp")
		GUICtrlSetTip(-1, "Closes HTML GUI.")

		Local $IE_Adresse = "https://steamdb.info/app/" & $Game_ID & "/graphs/"
		$oIE.navigate($IE_Adresse)

		GUISetState()
		$Game_ID = ""
	Else
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Create_HTMLView_GUI()]: " & "ObjCreate 'Shell.Explorer.2'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
	EndIf
EndFunc   ;==>_Create_HTMLView_GUI

Func _Create_HTMLGamePage_GUI_Backup()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	Local $regValue = "0x2AF8"
	; IE11 edge mode: 11001 (0x2AF9)
	; IE11: 11000 (0x2AF8)
	; IE10: 10001 (0x2711)
	; IE10: 10000 (0x02710)
	; IE 9: 9999 (0x270F)
	; IE 9: 9000 (0x2328)
	; IE 8: 8888 (0x22B8)
	; IE 8: 8000 (0x1F40)
	; IE 7: 7000 (0x1B58)

	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION", _ProcessGetName(@AutoItPID), "REG_DWORD", $regValue)
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION", _ProcessGetName(@AutoItPID), "REG_DWORD", $regValue)
;~ RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION", @ScriptName, "REG_DWORD", $regValue)
;~ RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION",@ScriptName, "REG_DWORD", $regValue)

	Local $Button_Exit_HTML_GUI

	Global $oIE = ObjCreate("Shell.Explorer.2")
	If Not @error Then
		;Global $HTML_HTMLGamePage_GUI = GUICreate("" & " - " & "steam.app." & "", 980, 600, (@DesktopWidth - 980) / 2, (@DesktopHeight - 600) / 2, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
		Global $HTML_HTMLGamePage_GUI = GUICreate("Game Page Menu", @DesktopWidth, @DesktopHeight, 0, 0, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
		GUISetBkColor("0x00BFFF")
		GUICtrlCreateObj($oIE, 0, 0, @DesktopWidth, @DesktopHeight - 42)

		Global $Button_Exit_HTML_GUI = GUICtrlCreateButton("Exit", @DesktopWidth - 40, @DesktopHeight - 40, 35, 35, $BS_BITMAP)
		GUICtrlSetOnEvent(-1, "_Button_Exit_HTMLGamePage_GUI")
		_GUICtrlButton_SetImage(-1, $gfx & "Close_small.bmp")
		GUICtrlSetTip(-1, "Closes HTML GamePage GUI.")

		Local $Install_DIR_Replaced = StringReplace($Install_DIR, '\', '/')
		Local $IE_Adresse = "file:///" & $Install_DIR_Replaced & "WebPage/GamePage_Menu.html"
		$oIE.navigate($IE_Adresse)

		;_IENavigate($object, $IE_Adresse)

		GUISetState()
		Sleep(100)
		GUISetState()
		Sleep(100)

	Else
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Create_HTMLView_GUI()]: " & "ObjCreate 'Shell.Explorer.2'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
	EndIf




	Local $locationurl_old = _IEPropertyGet($oIE, "uniqueid")

	Do
		;GUICtrlSetOnEvent($Button_Exit_HTML_GUI, "_Button_Exit_HTMLGamePage_GUI")
		Sleep(100)

		;If WinExists("Game Page Menu") Then

		If _IsPressed("1B") Then
			_Button_Exit_HTMLGamePage_GUI()
		EndIf

		GUICtrlSetOnEvent($Button_Exit_HTML_GUI, "_Button_Exit_HTMLGamePage_GUI")

		Local $locationurl_new = _IEPropertyGet($oIE, "uniqueid")

		If $locationurl_new <> "" Then
			If $locationurl_new <> $locationurl_old Then
				MsgBox(0, "", $locationurl_new, 3)
				$locationurl_old = $locationurl_new
			EndIf
		EndIf
		;_Get_Started_HTML_Game()

		;EndIf

	Until WinExists("Game Page Menu") = 0

EndFunc   ;==>_Create_HTMLGamePage_GUI_Backup

Func _Button_HTMLGamePage_GUI()
	GUIDelete($HLL_GUI_Handle)
	GUIDelete($HLL_GUI)
	_Create_HTMLGamePage_GUI()
EndFunc

Func _Create_HTMLGamePage_GUI() ; GamePageMode
	IniWrite($Config_INI, "TEMP", "GamePageMenu", "")

	Global $locationurl_new
	Local $Pin_Image
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	Local $regValue = "0x2AF8"
	; IE11 edge mode: 11001 (0x2AF9)
	; IE11: 11000 (0x2AF8)
	; IE10: 10001 (0x2711)
	; IE10: 10000 (0x02710)
	; IE 9: 9999 (0x270F)
	; IE 9: 9000 (0x2328)
	; IE 8: 8888 (0x22B8)
	; IE 8: 8000 (0x1F40)
	; IE 7: 7000 (0x1B58)

	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION", _ProcessGetName(@AutoItPID), "REG_DWORD", $regValue)
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION", _ProcessGetName(@AutoItPID), "REG_DWORD", $regValue)
;~ RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION", @ScriptName, "REG_DWORD", $regValue)
;~ RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION",@ScriptName, "REG_DWORD", $regValue)

	Local $Button_Exit_HTML_GUI

	Global $oIE = ObjCreate("Shell.Explorer.2")
	If Not @error Then
		;Global $HTML_HTMLGamePage_GUI = GUICreate("" & " - " & "steam.app." & "", 980, 600, (@DesktopWidth - 980) / 2, (@DesktopHeight - 600) / 2, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
		Global $HTML_HTMLGamePage_GUI = GUICreate("Game Page Menu", @DesktopWidth - 6, @DesktopHeight - 5, 0, 0, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
		GUISetBkColor("0x00BFFF")
		GUICtrlCreateObj($oIE, 0, 0, @DesktopWidth, @DesktopHeight)

		Global $Button_Exit_HTML_GUI = GUICtrlCreateButton("Exit", @DesktopWidth - 40, @DesktopHeight - 40, 35, 35, $BS_BITMAP)
		GUICtrlSetOnEvent(-1, "_Button_Exit_HTMLGamePage_GUI")
		_GUICtrlButton_SetImage(-1, $gfx & "Close_small.bmp")
		GUICtrlSetTip(-1, "Closes HTML GamePage GUI.")



		Local $Install_DIR_Replaced = StringReplace($Install_DIR, '\', '/')
		Local $IE_Adresse = "file:///" & $Install_DIR_Replaced & "WebPage/GamePage_Menu.html"
		If $locationurl_new <> "" Then $IE_Adresse = $locationurl_new
		$oIE.navigate($IE_Adresse)

		;_IENavigate($object, $IE_Adresse)

		GUISetState()
		Sleep(100)

		Local $Exit_Image = StringReplace($Install_DIR & "System/gfx/Exit_small.bmp", '\', '/')
		Local $Minimize_Image = StringReplace($Install_DIR & "System/gfx/Minimize.bmp", '\', '/')

		Local $PIN_HTML_GamePage_Value = IniRead($Config_INI, "Settings", "PIN_HTML_GamePage", "")
		Local $Exit_Image = StringReplace($Install_DIR & "System/gfx/Exit_small.bmp", '\', '/')
		Local $Minimize_Image = StringReplace($Install_DIR & "System/gfx/Minimize.bmp", '\', '/')
		Local $HomeLoaderLibrary_Image = StringReplace($Install_DIR & "System/gfx/HomeLoaderLibrary.bmp", '\', '/')
		Local $WindowTab_Image = StringReplace($Install_DIR & "System/gfx/WindowTab.bmp", '\', '/')
		Local $Pin_Image_1 = StringReplace($Install_DIR & "System/gfx/Pin_1.bmp", '\', '/')
		Local $Pin_Image_2 = StringReplace($Install_DIR & "System/gfx/Pin_2.bmp", '\', '/')
		If $PIN_HTML_GamePage_Value = "true" Then $Pin_Image = $Pin_Image_1
		If $PIN_HTML_GamePage_Value <> "true" Then $Pin_Image = $Pin_Image_2

		Local $InsertHTML_1 = '<div class="tooltip"><a href="EXIT">			<img src="file:///' & $Exit_Image & '" height="50px" width="50px"><span class="tooltiptext">Exit</span></a></div>&nbsp;' & @CRLF & _
										'<div class="tooltip"><a href="PIN">			<img src="file:///' & $Pin_Image & '" height="50px" width="50px"><span class="tooltiptext">PIN</span></a></div>&nbsp;' & @CRLF & _
										'<div class="tooltip"><a href="MINIMIZE">			<img src="file:///' & $Minimize_Image & '" height="50px" width="50px"><span class="tooltiptext">MINIMIZE</span></a></div>' & @CRLF & _
										'<div class="tooltip"><a href="HomeLoaderLibrary">			<img src="file:///' & $HomeLoaderLibrary_Image & '" height="50px" width="50px"></a><span class="tooltiptext">HomeLoader Library</span></a></div>&nbsp;&nbsp;&nbsp;&nbsp;' & @CRLF & _
										'<div class="tooltip"><a href="WindowTab">			<img src="file:///' & $WindowTab_Image & '" height="50px" width="50px"><span class="tooltiptext">WindowTab</span></a></div>'

        Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
        _IEDocInsertHTML($oBody, "<div id='EXIT'></div>", "afterbegin")
        Local $oEXIT = _IEGetObjById($oIE, "EXIT")
		_IEPropertySet($oEXIT, "innerhtml", $InsertHTML_1)

		GUISetState()
		Sleep(100)

		Global $locationurl_old = _IEPropertyGet($oIE, "locationname")
		Global $locationurl_new, $Link_old, $Link_new

		Local $Install_DIR_Replaced = StringReplace($Install_DIR, '\', '/')
		Local $IE_Adresse_Back = "file:///" & $Install_DIR_Replaced & "WebPage/GamePage_Menu.html"

		Do
			;GUICtrlSetOnEvent($Button_Exit_HTML_GUI, "_Button_Exit_HTMLGamePage_GUI")
			Sleep(100)

			If _IsPressed("1B") Then
				_Button_Exit_HTMLGamePage_GUI()
				;_Restart()
				Exit
			EndIf

			GUICtrlSetOnEvent($Button_Exit_HTML_GUI, "_Button_Exit_HTMLGamePage_GUI")

			Local $locationurl_new = _IEPropertyGet($oIE, "locationname")
			;MsgBox(0, "$locationurl_new", $locationurl_new)

			Local $PIN_HTML_GamePage_Value = IniRead($Config_INI, "Settings", "PIN_HTML_GamePage", "")
			Local $Exit_Image = StringReplace($Install_DIR & "System/gfx/Exit_small.bmp", '\', '/')
			Local $Minimize_Image = StringReplace($Install_DIR & "System/gfx/Minimize.bmp", '\', '/')
			Local $HomeLoaderLibrary_Image = StringReplace($Install_DIR & "System/gfx/HomeLoaderLibrary.bmp", '\', '/')
			Local $WindowTab_Image = StringReplace($Install_DIR & "System/gfx/WindowTab.bmp", '\', '/')
			Local $Pin_Image_1 = StringReplace($Install_DIR & "System/gfx/Pin_1.bmp", '\', '/')
			Local $Pin_Image_2 = StringReplace($Install_DIR & "System/gfx/Pin_2.bmp", '\', '/')
			If $PIN_HTML_GamePage_Value = "true" Then $Pin_Image = $Pin_Image_1
			If $PIN_HTML_GamePage_Value <> "true" Then $Pin_Image = $Pin_Image_2


			If $locationurl_new = "GamePage_Menu.html" And $locationurl_old <> "GamePage_Menu.html" Then
				Local $InsertHTML_1 = '<div class="tooltip"><a href="EXIT">			<img src="file:///' & $Exit_Image & '" height="50px" width="50px"><span class="tooltiptext">Exit</span></a></div>&nbsp;' & @CRLF & _
										'<div class="tooltip"><a href="PIN">			<img src="file:///' & $Pin_Image & '" height="50px" width="50px"><span class="tooltiptext">PIN</span></a></div>&nbsp;' & @CRLF & _
										'<div class="tooltip"><a href="MINIMIZE">			<img src="file:///' & $Minimize_Image & '" height="50px" width="50px"><span class="tooltiptext">MINIMIZE</span></a></div>' & @CRLF & _
										'<div class="tooltip"><a href="HomeLoaderLibrary">			<img src="file:///' & $HomeLoaderLibrary_Image & '" height="50px" width="50px"><span class="tooltiptext">HomeLoader Library</span></a></div>&nbsp;&nbsp;' & @CRLF & _
										'<div class="tooltip"><a href="WindowTab">			<img src="file:///' & $WindowTab_Image & '" height="50px" width="50px"><span class="tooltiptext">WindowTab</span></a></div>'


				Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
				_IEDocInsertHTML($oBody, "<div id='EXIT'></div>", "afterbegin")
				Local $oEXIT = _IEGetObjById($oIE, "EXIT")
				_IEPropertySet($oEXIT, "innerhtml", $InsertHTML_1)
					EndIf

			If $locationurl_new = "EXIT" And $locationurl_old <> "EXIT" Then
				Exit
			EndIf

			If $locationurl_new = "PIN" And $locationurl_old <> "PIN" Then
				$PIN_HTML_GamePage_Value = IniRead($Config_INI, "Settings", "PIN_HTML_GamePage", "")
				$oIE.navigate($IE_Adresse)
				If $PIN_HTML_GamePage_Value <> "true" Then
					IniWrite($Config_INI, "Settings", "PIN_HTML_GamePage", "true")
					WinSetOnTop("Game Page Menu", "", $WINDOWS_ONTOP)
				Else
					IniWrite($Config_INI, "Settings", "PIN_HTML_GamePage", "false")
					WinSetOnTop("Game Page Menu", "", $WINDOWS_NOONTOP)
				EndIf
			EndIf

			If $locationurl_new = "MINIMIZE" And $locationurl_old <> "MINIMIZE" Then
				$oIE.navigate($IE_Adresse)
				WinSetState("Game Page Menu", "", @SW_MINIMIZE)
			EndIf

			If $locationurl_new = "WindowTab" And $locationurl_old <> "MINIMIZE" Then
				$oIE.navigate($IE_Adresse)
				IniWrite($Config_INI, "Settings", "PIN_HTML_GamePage", "false")
				WinSetOnTop("Game Page Menu", "", $WINDOWS_NOONTOP)
				Send("{LWINDOWN}")
				Send("{TAB}")
				Sleep(100)
				Send("{LWINUP}")
			EndIf

			If $locationurl_new = "HomeLoaderLibrary" And $locationurl_old <> "HomeLoaderLibrary" Then
				_Button_Exit_HTMLGamePage_GUI()
				_Restart()
			EndIf

			If $locationurl_new <> "" Then
				;If $locationurl_new <> "GamePage_Menu.html" Then
					If $locationurl_new <> $locationurl_old Then
						;MsgBox(0, "$locationurl_new", $locationurl_new)
						Local $oLinks = _IELinkGetCollection($oIE)
						For $oLink In $oLinks
							Local $sLinkId = _IEPropertyGet($oLink, "uniqueid")
							;If @error Then Exit
							;_IEHeadInsertEventScript($oIE, $sLinkId, "onclick", "return false;")
							;If @error Then Exit
							ObjEvent($oLink, "_Evt_")
						Next
						$locationurl_old = $locationurl_new
					EndIf
				;EndIf
			EndIf

			Local $GamePageMenu_Parameter = IniRead($Config_INI, "TEMP", "GamePageMenu", "")
			If $GamePageMenu_Parameter = "Exit" Then
				If $HomeApp <> "Virtual Desktop" Then
					IniWrite($Config_INI, "TEMP", "GamePageMenu", "")
					Exit
				EndIf
			EndIf

		Until WinExists("Game Page Menu") = 0
	Else
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Create_HTMLView_GUI()]: " & "ObjCreate 'Shell.Explorer.2'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
	EndIf

EndFunc   ;==>_Create_HTMLGamePage_GUI

Func _Evt_onClick()
	Local $Install_DIR_Replaced = StringReplace($Install_DIR, '\', '/')
	Local $IE_Adresse_Back = "file:///" & $Install_DIR_Replaced & "WebPage/GamePage_Menu.html"
	Local $o_Link = @COM_EventObj
	$Link_new = $o_Link.href
	;MsgBox(0, "", $Link_new)

	If $Link_new = $IE_Adresse_Back Then
		;MsgBox(0, "", "Back")
		$oIE.navigate($IE_Adresse_Back)
		;_Button_Exit_HTMLGamePage_GUI()
		;_Create_HTMLGamePage_GUI()
	EndIf

	If $Link_new <> $Link_old Then
		;ConsoleWrite($o_Link.href & @CRLF)
		;MsgBox(0, "Start _HTML_GamePage_Start_Game()", $Link_new)
		$locationurl_old = $locationurl_new
		$Link_old = $Link_new
		_HTML_GamePage_Start_Game()
	EndIf
EndFunc   ;==>_Evt_onClick

Func _HTML_GamePage_Start_Game()
	$ApplicationList_TEMP = ""
	Local $NR_ApplicationsCheck = ""
	Local $Link_Check, $OculusApp_Path

	For $Loop_1 = 1 To 1
		$Link_Check = StringLeft($Link_new, 29)
		If $Link_Check = "steam://rungameid/revive.app." Then
			;MsgBox(0, "1", "Oculus Rift APP")
			$OculusApp_Path = StringReplace($Link_new, 'steam://rungameid/', '') & ".bat"
			If FileExists($OculusApp_Path) Then
				ShellExecute($Install_DIR & "WebPage\Revive\" & $OculusApp_Path)
				If $HomeApp <> "Virtual Desktop" Then Exit
			Else
				ExitLoop
			EndIf
			ExitLoop
		EndIf

		$Link_Check = StringLeft($Link_new, 18)
		If $Link_Check = "steam://rungameid/" Then
			;MsgBox(0, "2", "SteamVR APP")
			ShellExecute($Link_new)
			If $HomeApp <> "Virtual Desktop" Then Exit
		EndIf

		$Link_Check = StringLeft($Link_new, 14)
		If $Link_Check = "vive://runapp/" Then
			;MsgBox(0, "3", "Viveport APP")
			ShellExecute($Link_new)
			If $HomeApp <> "Virtual Desktop" Then Exit
		EndIf
	Next
EndFunc   ;==>_HTML_GamePage_Start_Game

Func _Get_Started_HTML_Game()

	;Local $oIE = _IE_Example("basic")
	If _IEPropertyGet($oIE, "uniqueid") Then
		MsgBox($MB_SYSTEMMODAL, "AddressBar Status", "AddressBar Visible, turning it off" & @CRLF & @CRLF & _IEPropertyGet($oIE, "uniqueid"))
		;_IEPropertySet($oIE, "addressbar", False)
	Else
		MsgBox($MB_SYSTEMMODAL, "AddressBar Status", "AddressBar Invisible, turning it on" & @CRLF & @CRLF & _IEPropertyGet($oIE, "uniqueid"))
		;_IEPropertySet($oIE, "addressbar", True)
	EndIf



EndFunc   ;==>_Get_Started_HTML_Game

Func _Button_Exit_HTML_GUI()
	GUIDelete($HTML_GUI)
EndFunc   ;==>_Button_Exit_HTML_GUI

Func _Button_Exit_HTMLGamePage_GUI()
	GUIDelete($HTML_HTMLGamePage_GUI)
EndFunc   ;==>_Button_Exit_HTMLGamePage_GUI

Func _Show_HTML_GamePage_GUI_1()
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
EndFunc   ;==>_Show_HTML_GamePage_GUI_1

Func _Checkbox_all()
	Local $CheckBox = GUICtrlRead($Checkbox_CreatePage)
	If $CheckBox = "" Then
		GUICtrlSetData($Checkbox_CreatePage, "a")
	Else
		GUICtrlSetData($Checkbox_CreatePage, "")
	EndIf
	_Checkbox_CheckUncheck()
EndFunc   ;==>_Checkbox_all

Func _Checkbox_CheckUncheck()
	Local $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
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
		_GUICtrlListView_SetItemChecked($listview_TEMP, -1)
	EndIf

	If $Status_Checkbox <> "a" Then
		Local $NR_GameNames = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
		For $LOOP_Checkbox = 0 To $NR_GameNames
			_GUICtrlListView_SetItemChecked($listview_TEMP, $LOOP_Checkbox, False)
		Next
	EndIf
EndFunc   ;==>_Checkbox_CheckUncheck

Func _Button_Create_GamePage_selected()
	_GUICtrlStatusBar_SetText($Statusbar, "Creating Game Page..." & @TAB & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "" Then $ButtonTAB_State = "1"
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
		If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
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

	If $ButtonTAB_State = "1" Then Local $PageName = IniRead($Config_INI, "Settings", "TAB1_Name", "Steam Library")
	If $ButtonTAB_State = "2" Then Local $PageName = IniRead($Config_INI, "Settings", "TAB2_Name", "Non-Steam_Appl")
	If $ButtonTAB_State = "3" Then Local $PageName = IniRead($Config_INI, "Settings", "TAB3_Name", "Custom 1")
	If $ButtonTAB_State = "4" Then Local $PageName = IniRead($Config_INI, "Settings", "TAB4_Name", "Custom 2")
	If $ButtonTAB_State = "5" Then Local $PageName = IniRead($Config_INI, "Settings", "TAB5_Name", "Custom 3")
	If $ButtonTAB_State = "6" Then Local $PageName = IniRead($Config_INI, "Settings", "TAB6_Name", "Custom 4")

	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	GUICtrlSetData($Anzeige_Fortschrittbalken, 20)

	Local $TEMP_NR_selected = "false"
	For $NR = 1 To $NR_Applications
		GUICtrlSetData($Anzeige_Fortschrittbalken, 10)
		Local $TEMP_selected = _GUICtrlListView_GetItemChecked($listview_TEMP, $NR - 1)
		If $TEMP_selected = "true" Then $TEMP_NR_selected = "true"
	Next

	If $TEMP_NR_selected = "true" Then
		If FileExists($GamePage_path) Then FileDelete($GamePage_path)

		Local $HTML_Content = '<html>' & @CRLF & _
				'<head>' & @CRLF & _
				'    <title>GamePage</title>' & @CRLF & _
				'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
				'</head>' & @CRLF & _
				'<body>' & @CRLF & _
				'<script>' & @CRLF & _
				' ' & @CRLF & _
				'</script>' & @CRLF & _
				'<h1>' & $PageName & '</h1>' & @CRLF & _
				'<div class="icons">' & @CRLF

		If $HomeApp = "VR Toolbox" Then
			$HTML_Content = '<html>' & @CRLF & _
					'<head>' & @CRLF & _
					'    <title>GamePage</title>' & @CRLF & _
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
					'<div class="icons">' & @CRLF
		EndIf

		FileWrite($GamePage_path, $HTML_Content)


		For $NR = 1 To $NR_Applications
			GUICtrlSetData($Anzeige_Fortschrittbalken, $NR * 100 / $NR_Applications)
			If _GUICtrlListView_GetItemChecked($listview_TEMP, $NR - 1) Then
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
	_GUICtrlStatusBar_SetText($Statusbar, "Game Page created." & @TAB & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	Sleep(100)
	GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
	Sleep(600)
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "'Rescan Libraries' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
EndFunc   ;==>_Button_Create_GamePage_selected

Func _Button_Create_SinglePage_selected()
	_GUICtrlStatusBar_SetText($Statusbar, "Creating Single Page..." & @TAB & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "" Then $ButtonTAB_State = "1"
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
		If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
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

	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	GUICtrlSetData($Anzeige_Fortschrittbalken, 20)

	Local $TEMP_NR_selected = "false"
	For $NR = 1 To $NR_Applications
		GUICtrlSetData($Anzeige_Fortschrittbalken, 10)
		Local $TEMP_selected = _GUICtrlListView_GetItemChecked($listview_TEMP, $NR - 1)
		If $TEMP_selected = "true" Then $TEMP_NR_selected = "true"
	Next

	If $TEMP_NR_selected = "true" Then
		If FileExists($GamePage_path) Then FileDelete($GamePage_path)

		FileWrite($GamePage_path, '<html>' & @CRLF & _
				'<head>' & @CRLF & _
				'    <title>Game Shortcuts</title>' & @CRLF & _
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
			If _GUICtrlListView_GetItemChecked($listview_TEMP, $NR - 1) Then
				Local $Install_DIR_TEMP = StringReplace($Install_DIR, '\', '/')
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
				If $HomeApp = "VR Toolbox" Then FileWriteLine($HTMLSinglePage_Path, '    function VRTStartCommand(cmd) {')
				If $HomeApp = "VR Toolbox" Then FileWriteLine($HTMLSinglePage_Path, "      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';")
				If $HomeApp = "VR Toolbox" Then FileWriteLine($HTMLSinglePage_Path, '      console.log(s);')
				If $HomeApp = "VR Toolbox" Then FileWriteLine($HTMLSinglePage_Path, '    }')
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
	_GUICtrlStatusBar_SetText($Statusbar, "Game Page created." & @TAB & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	Sleep(100)
	GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
	Sleep(600)
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "'Rescan Libraries' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
EndFunc   ;==>_Button_Create_SinglePage_selected

Func _Button_Add_to_Custom()
	Local $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	Local $Status_Combo_Add_to_Custom = GUICtrlRead($Combo_Add_to_Custom)
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"

	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
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
			If _GUICtrlListView_GetItemChecked($listview_TEMP, $NR - 1) Then
				Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
				Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
				Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
				Global $Application_right_now = IniRead($ApplicationList_TEMP, "Application_" & $NR, "right_now", "")
				Global $Application_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR, "24h_peak", "")
				Global $Application_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR, "all_time_peak", "")
				Global $Application_resolutionScale = IniRead($ApplicationList_TEMP, "Application_" & $NR, "resolutionScale", "")

				IniWrite($ApplicationList_target, "ApplicationList", "NR_Applications", $NewAppNR)
				IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "NR", $NewAppNR)
				IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "name", $Application_name)
				IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "appid", $Application_appid)
				IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "right_now", $Application_right_now)
				IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "24h_peak", $Application_24h_peak)
				IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "all_time_peak", $Application_all_time_peak)
				IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "resolutionScale", $Application_resolutionScale)
				IniWrite($ApplicationList_target, "ApplicationList", "NR_Applications", $NewAppNR)
				IniWrite($ApplicationList_target, "Application_" & $Application_appid, "NR", $NewAppNR)
				IniWrite($ApplicationList_target, "Application_" & $Application_appid, "name", $Application_name)
				IniWrite($ApplicationList_target, "Application_" & $Application_appid, "appid", $Application_appid)
				IniWrite($ApplicationList_target, "Application_" & $Application_appid, "right_now", $Application_right_now)
				IniWrite($ApplicationList_target, "Application_" & $Application_appid, "24h_peak", $Application_24h_peak)
				IniWrite($ApplicationList_target, "Application_" & $Application_appid, "all_time_peak", $Application_all_time_peak)
				IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "resolutionScale", $Application_resolutionScale)
				$NewAppNR = $NewAppNR + 1
			Else

			EndIf
		Next
	EndIf
EndFunc   ;==>_Button_Add_to_Custom

Func _Button_HomeLoaderSettings()
	_Settings_GUI()
EndFunc   ;==>_Button_HomeLoaderSettings

Func _Start_ListView_Selected()
	$listview_TEMP = $listview
	If $ButtonTAB_State = 1 Then $listview_TEMP = $listview
	If $ButtonTAB_State = 2 Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = 3 Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = 4 Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = 5 Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = 6 Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppId = _GUICtrlListView_GetItemText($listview_TEMP, $ListView_Selected_Row_Nr - 1, 1)
	Local $StringLeft_Check_AppID = StringLeft($Check_AppId, 9)
	Local $StringTrimLeft_Check_AppID = StringTrimLeft($Check_AppId, 9)
	Local $StringLeft_Check_HL = StringLeft($Check_AppId, 5)
	Local $StringLeft_Check_Revive = StringLeft($Check_AppId, 11)

	Local $Revive_ShellExecute = $Revive_Path & "Revive\ReviveInjector_x64.exe"

	If $Check_AppId <> "" Then
		If $StringLeft_Check_AppID = "vive.htc." Then
			ShellExecute("vive://runapp/" & $StringTrimLeft_Check_AppID)
		Else
			$StringLeft_Check_AppID = StringLeft($Check_AppId, 11)
			$StringTrimLeft_Check_AppID = StringTrimLeft($Check_AppId, 11)
			If $StringLeft_Check_AppID = "revive.app." Then
				If $ScanOnlyVR = "true" Then $ApplicationList_INI_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
				If $ScanOnlyVR <> "true" Then $ApplicationList_INI_TEMP = $ApplicationList_SteamLibrary_ALL_INI

				Local $App_binary_path = IniRead($ApplicationList_INI_TEMP, "Application_" & $Check_AppId, "binary_path_windows", "")
				$App_binary_path = StringReplace($App_binary_path, '/', '\')
				Local $App_arguments = IniRead($ApplicationList_INI_TEMP, "Application_" & $Check_AppId, "arguments", "")
				Local $Check_Left_1_App_arguments = StringLeft($App_arguments, 7)
				Local $Check_Left_2_App_arguments = StringLeft($App_arguments, 10)
				If $Check_Left_1_App_arguments = '/base \' Then $App_arguments = StringTrimLeft($App_arguments, 7)
				If $Check_Left_2_App_arguments = '/library \' Then $App_arguments = StringTrimLeft($App_arguments, 10)
				$App_arguments = StringReplace($App_arguments, '/', '\')
				$App_arguments = StringReplace($App_arguments, '\\', '\')
				$App_arguments = StringReplace($App_arguments, '"', '')
				If StringRight($App_arguments, 1) = "\" Then $App_arguments = StringTrimRight($App_arguments, 1)

				Local $Oculus_App_Path = "C:\Program Files\Oculus\Software\" & $App_arguments

				If $Check_Left_1_App_arguments = '/base \' Then $Oculus_App_Path = "C:\Program Files\Oculus\Support\" & $App_arguments
				If $Check_Left_2_App_arguments = '/library \' Then $Oculus_App_Path = "C:\Program Files\Oculus\Software\" & $App_arguments

				;ShellExecute($Revive_Path & $App_binary_path, $Oculus_App_Path)
				RunWait($Revive_Path & $App_binary_path & " " & $Oculus_App_Path, "", @SW_HIDE)
			Else
				ShellExecute("steam://rungameid/" & $Check_AppId)
			EndIf
		EndIf

		If $StringLeft_Check_HL = "HLNSG" Then
			Local $HLNSG_installdir = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Check_AppId, "installdir", "")
			ShellExecute($HLNSG_installdir)
		EndIf

		If $StringLeft_Check_Revive = "revive.app." Then
			ShellExecute($Install_DIR & "WebPage\Revive\" & $Check_AppId & ".bat")
		EndIf

		Sleep(200)
		;_Beenden()
	EndIf
EndFunc   ;==>_Start_ListView_Selected

Func _Combo_SteamLibrary()
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	IniWrite($Config_INI, "Settings", "Steam_Library", $Combo)
	FileDelete($ApplicationList_INI)

	If $Combo = "Steam Library 1" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini") Then
		$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
		If $Install_Folder_Steam_1 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 1 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 1")
			;GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_HLL_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 2" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini") Then
		$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
		If $Install_Folder_Steam_2 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 2 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 2")
			;GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_HLL_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 3" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini") Then
		$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
		If $Install_Folder_Steam_3 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 3 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 3.")
			;GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_HLL_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 4" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini") Then
		$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
		If $Install_Folder_Steam_4 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 4 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 4")
			;GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_HLL_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 5" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini") Then
		$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
		If $Install_Folder_Steam_5 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 5 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 5.ini")
			;GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_HLL_Settings_GUI()
		EndIf
	EndIf
	_Read_from_INI_ADD_2_ListView()
	GUICtrlSetData($Checkbox_CreatePage, "")
EndFunc   ;==>_Combo_SteamLibrary

Func _Combo_ApplicationList()
	Local $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	Local $Status_Combo = GUICtrlRead($Combo_ApplicationList)
	IniWrite($Config_INI, "Settings", "MainCategory", $Status_Combo)
	$MainCategory_ApplicationList = IniRead($Config_INI, "Settings", "MainCategory", "")
	_Restart()
EndFunc   ;==>_Combo_ApplicationList


Func _ButtonTAB_Steam_Library()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Non_Steam_Appl)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "1")
	FileDelete($ApplicationList_INI)
	_GUICtrlListView_DeleteAllItems($listview)
	GUICtrlSetState($listview, $GUI_SHOW)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)

	GUICtrlSetStyle($ButtonTAB_Non_Steam_Appl, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_1, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_2, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_3, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_4, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Steam_Library, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Steam_Library, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Steam_Library

Func _ButtonTAB_Non_Steam_Appl()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Non_Steam_Appl)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "2")
	_GUICtrlListView_DeleteAllItems($listview_2)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_SHOW)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)

	GUICtrlSetStyle($ButtonTAB_Steam_Library, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_1, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_2, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_3, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_4, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Non_Steam_Appl, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Non_Steam_Appl

Func _ButtonTAB_Custom_1()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_1)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "3")
	_GUICtrlListView_DeleteAllItems($listview_3)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_SHOW)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)

	GUICtrlSetStyle($ButtonTAB_Steam_Library, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Non_Steam_Appl, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_2, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_3, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_4, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Custom_1, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Custom_1

Func _ButtonTAB_Custom_2()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_2)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "4")
	_GUICtrlListView_DeleteAllItems($listview_4)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_SHOW)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)

	GUICtrlSetStyle($ButtonTAB_Steam_Library, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Non_Steam_Appl, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_1, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_3, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_4, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Custom_2, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Custom_2

Func _ButtonTAB_Custom_3()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_3)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "5")
	_GUICtrlListView_DeleteAllItems($listview_5)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_SHOW)
	GUICtrlSetState($listview_6, $GUI_HIDE)

	GUICtrlSetStyle($ButtonTAB_Steam_Library, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Non_Steam_Appl, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_1, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_2, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_4, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Custom_3, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Custom_3

Func _ButtonTAB_Custom_4()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_4)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "6")
	_GUICtrlListView_DeleteAllItems($listview_6)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_SHOW)

	GUICtrlSetStyle($ButtonTAB_Steam_Library, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Non_Steam_Appl, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_1, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_2, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_3, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Custom_4, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Custom_4

Func _Button_AddGame2Library()
	_AddGame2Library_GUI()
EndFunc   ;==>_Button_AddGame2Library


Func _Button_ReScan_Steam_Library() ; Scan Button
	Local $Timer = TimerInit()

	If WinExists("HomeLoader - Library") Then _Loading_GUI()
	If $ScanOnlyVR <> "true" Then

		Global $Array_Library[1][1] = [["appid"]]
		Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		For $Loop_Library = 1 To $NR_Applications
			Local $appid_Library_Array = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_Library, "appid", "")
			_ArrayAdd($Array_Library, $appid_Library_Array)
		Next

		_Scan_SteamLibrary_ALL()
		GUICtrlSetData($Anzeige_Fortschrittbalken_2, 25)
		If $Request_Steamdb_info = "true" And $appid <> "" Then
			If $DeleteHomeLoaderLibraryData = "true" Then _RM_Delete_Category_Pages()
			_RM_Button_Scan_Get_PO_Data()
		EndIf
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 50)
		Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		_GUICtrlStatusBar_SetText($Statusbar, "Rescan of all Libraries finished." & @TAB & "Apps: " & $ApplicationList_NR_TEMP & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	Else
		Global $Array_Library[1][1] = [["appid"]]
		Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		For $Loop_Library = 1 To $NR_Applications
			Local $appid_Library_Array = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_Library, "appid", "")
			_ArrayAdd($Array_Library, $appid_Library_Array)
		Next

		_Read_steamapps_vrmanifest()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 25)
		If $Request_Steamdb_info = "true" And $appid <> "" Then
			If $DeleteHomeLoaderLibraryData = "true" Then _RM_Delete_Category_Pages()
			_RM_Button_Scan_Get_PO_Data()
		EndIf
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 50)
		Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		_GUICtrlStatusBar_SetText($Statusbar, "Rescan of the VR Libraries finished." & @TAB & "Apps: " & $ApplicationList_NR_TEMP & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	EndIf

	If $ScanVIVEApps = "true" Then
		If FileExists($Steam_AppConfig_Json) Then
			_ScanViveData()
		EndIf
	EndIf

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 60)

	If $ScanOculusApps = "true" Then
		If FileExists($Revive_revive_vrmanifest_FilePath) Then
			_ScanOculusData()
		EndIf
	EndIf

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 65)

	If $Add_SS_per_game = "true" Then
		_Read_SteamVR_VRSettings()
	EndIf

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 70)

	If $Add_SS_to_Icons = "true" Then _Get_AD_SS_Values_to_Icons()

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 75)

	If $Create_HTML_GamePage = "true" Then
		If WinExists("HomeLoader - Library") Then
			_GUICtrlStatusBar_SetText($Statusbar, "" & "Creating HTML Game Pages..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		EndIf
		_Create_GamePage_Menu_Page()
		_Create_GamePages()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 80)
		_Create_SinglePages()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 85)
		_Create_Game_Tags_Page()
	EndIf

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 95)

	If WinExists("HomeLoader - Library") Then
		_GUICtrlStatusBar_SetText($Statusbar, "" & "Synchronizing Icons..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	EndIf
	_Sync_Icons()

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 100)

	Local $TimerDiff = TimerDiff($Timer)
	Local $sec = Round(($TimerDiff / 1000), 2)

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken_2, 100)
		;_Read_from_INI_ADD_2_ListView()
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Scan finished in " & $sec & " " & "seconds")
		_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan finished in " & $sec & " " & "seconds" & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
		GUICtrlSetData($Anzeige_Fortschrittbalken_2, 0)
		GUIDelete($GUI_Loading)
		_Restart()
		;MsgBox(0, "$HLL_GUI", $HLL_GUI_Handle)
		;GUIDelete($HLL_GUI_Handle)
		;_Create_HLL_GUI()
	EndIf
EndFunc   ;==>_Button_ReScan_Steam_Library

Func _Button_ReScan_Steam_Library_AutoUpdate()
	Local $Timer = TimerInit()
	If $ScanOnlyVR <> "true" Then
		Global $Array_Library[1][1] = [["appid"]]
		Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		For $Loop_Library = 1 To $NR_Applications
			Local $appid_Library_Array = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_Library, "appid", "")
			_ArrayAdd($Array_Library, $appid_Library_Array)
		Next

		_Scan_SteamLibrary_ALL()
		If $Request_Steamdb_info = "true" And $appid <> "" Then
			If $DeleteHomeLoaderLibraryData = "true" Then _RM_Delete_Category_Pages()
			_RM_Button_Scan_Get_PO_Data()
		EndIf
		Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	Else
		Global $Array_Library[1][1] = [["appid"]]
		Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		For $Loop_Library = 1 To $NR_Applications
			Local $appid_Library_Array = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_Library, "appid", "")
			_ArrayAdd($Array_Library, $appid_Library_Array)
		Next

		_Read_steamapps_vrmanifest()
		If $Request_Steamdb_info = "true" And $appid <> "" Then
			If $DeleteHomeLoaderLibraryData = "true" Then _RM_Delete_Category_Pages()
			_RM_Button_Scan_Get_PO_Data()
		EndIf
	EndIf

	If $ScanVIVEApps = "true" Then
		If FileExists($Steam_AppConfig_Json) Then
			_ScanViveData()
		EndIf
	EndIf

	If $ScanOculusApps = "true" Then
		If FileExists($Revive_revive_vrmanifest_FilePath) Then
			_ScanOculusData()
		EndIf
	EndIf

	If $Add_SS_per_game = "true" Then
		_Read_SteamVR_VRSettings()
	EndIf

	If $Add_SS_to_Icons = "true" Then _Get_AD_SS_Values_to_Icons()

	If $Create_HTML_GamePage = "true" Then
		_Create_GamePage_Menu_Page()
		_Create_GamePages()
		_Create_SinglePages()
		_Create_Game_Tags_Page()
	EndIf

	_Sync_Icons()
	Local $TimerDiff = TimerDiff($Timer)
	Local $sec = Round(($TimerDiff / 1000), 2)
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Scan finished in " & $sec & " " & "seconds")
EndFunc   ;==>_Button_ReScan_Steam_Library_AutoUpdate

Func _Button_More_Scan_Options()
	MouseClick($MOUSE_CLICK_RIGHT)
EndFunc   ;==>_Button_More_Scan_Options


Func _Scan_SteamLibrary_ALL()
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"

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
			;Sleep(500)
			GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
			;GUICtrlSetData($Anzeige_Fortschrittbalken_2, $NR_Library * 100 / $NR_temp3)
		Next
		$NR_Library_temp = ""
		_GUICtrlListView_DeleteAllItems($listview)
		Local $SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini")

		If $Sort_Alphabetical_order = "true" Then
			_Sort_ApplicationList_ALL()
		Else
			FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		EndIf

		;Sleep(500)
		;GUICtrlSetData($Anzeige_Fortschrittbalken_2, 0)
	EndIf

	If $Combo <> "ALL" Then
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini")

		If $Sort_Alphabetical_order = "true" Then
			_Sort_ApplicationList_ALL()
		Else
			FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		EndIf
		;Sleep(500)
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	EndIf

	_GUICtrlStatusBar_SetText($Statusbar, "Rescan of the Libraries finished." & @TAB & "Apps: " & $NR_Applications & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
EndFunc   ;==>_Scan_SteamLibrary_ALL

Func _Sort_ApplicationList_ALL()
	Global $Array_Sorted[1][6] = [["name", "appid", "right_now", "24h_peak", "all_time_peak", "resolutionScale"]]
	Local $NR_Applications = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")

	For $Loop_1 = 1 To $NR_Applications
		Local $appid = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "appid", "")
		Local $name = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "name", "")
		Local $right_now = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "right_now", "")
		Local $24h_peak = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "24h_peak", "")
		Local $all_time_peak = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "all_time_peak", "")
		Local $resolutionScale = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "resolutionScale", "")

		Local $sFill = $name & "|" & $appid & "|" & $right_now & "|" & $24h_peak & "|" & $all_time_peak & "|" & $resolutionScale
		_ArrayAdd($Array_Sorted, $sFill)
	Next

	_ArraySort($Array_Sorted, 0, 1, 0, 0)
	If FileExists($ApplicationList_SteamLibrary_ALL_INI) Then FileDelete($ApplicationList_SteamLibrary_ALL_INI)

	For $Loop_2 = 1 To $NR_Applications
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", $Loop_2)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "NR", $Loop_2)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "name", $Array_Sorted[$Loop_2][0])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "appid", $Array_Sorted[$Loop_2][1])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "right_now", $Array_Sorted[$Loop_2][2])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "24h_peak", $Array_Sorted[$Loop_2][3])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "all_time_peak", $Array_Sorted[$Loop_2][4])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "resolutionScale", $Array_Sorted[$Loop_2][5])

		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "NR", $Loop_2)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "name", $Array_Sorted[$Loop_2][0])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "appid", $Array_Sorted[$Loop_2][1])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "right_now", $Array_Sorted[$Loop_2][2])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "24h_peak", $Array_Sorted[$Loop_2][3])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "all_time_peak", $Array_Sorted[$Loop_2][4])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "resolutionScale", $Array_Sorted[$Loop_2][5])
	Next
EndFunc   ;==>_Sort_ApplicationList_ALL

Func _ScanViveData()
	Global $Viveport_Array_Sorted[1][6] = [["name", "NR", "url", "appid", "IconPath", "binary_path_windows"]]

	Local $NR_LINES_TEMP = _FileCountLines($Steam_AppConfig_Json)

	If $ScanOnlyVR = "true" Then
		$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
	Else
		$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
	EndIf

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
			Local $Application_NR_new = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "") + 1

			Local $NR_TEMP = $Application_NR_new

			For $i = 1 To $StringSplit_Value[0]
				Local $StringSplit_Value_2 = StringSplit($StringSplit_Value[$i], ":")
				Local $StringSplit_Value_2_1 = StringReplace($StringSplit_Value_2[1], '"', '')
				Local $StringSplit_Value_2_1_1 = StringReplace($StringSplit_Value_2_1, '[', '')
				Local $StringSplit_Value_2_1_2 = StringReplace($StringSplit_Value_2_1_1, '{', '')

				If $StringSplit_Value_2_1_2 = "url" Then
					Local $StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
					Local $StringSplit_Value_2_3 = StringReplace($StringSplit_Value_2[3], '"', '')
					Local $StringSplit_Value_2_4 = $StringSplit_Value_2_2 & ":" & $StringSplit_Value_2_3
					Local $url_TEMP = $StringSplit_Value_2_4
				EndIf

				If $StringSplit_Value_2_1_2 = "app_key" Then ; appid
					Local $StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
					Local $Application_appid_TEMP = $StringSplit_Value_2_2
					Local $appid_TEMP = $StringSplit_Value_2_2
				EndIf

				If $StringSplit_Value_2_1_2 = "strings" Then ; NAME
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[4], '"', '')
					Local $name_TEMP = $StringSplit_Value_2_2
				EndIf

				If $StringSplit_Value_2_1_2 = "launch_type" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
				EndIf

				If $StringSplit_Value_2_1_2 = "image_path" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
					Local $Value_image_path = $Value_Path_StringReplace & $StringSplit_Value_2_2
					Local $IconPath_TEMP = $Value_image_path
					If Not FileExists($Icons & "steam.app." & $Application_appid_TEMP & ".jpg") Or $DeleteHomeLoaderLibraryData = "true" Then
						Local $Download_Icon_path_1_jpg = $Icons & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_2_jpg = $Icons & "460x215\steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_3_jpg = $Icon_Folder_1 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_4_jpg = $Icon_Folder_2 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_5_jpg = $Icon_Folder_3 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_6_jpg = $Icon_Folder_4 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_7_jpg = $Icon_Folder_5 & "steam.app." & $Application_appid_TEMP & ".jpg"

						If Not FileExists($Download_Icon_path_1_jpg) Or $DeleteHomeLoaderLibraryData = "true" Then
							FileCopy($Value_image_path, $Download_Icon_path_1_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
						EndIf
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
					Local $binary_path_windows_TEMP = $StringSplit_Value_2_2_3
				EndIf
			Next

			Local $sFill = $name_TEMP & "|" & $NR_TEMP & "|" & $url_TEMP & "|" & $appid_TEMP & "|" & $IconPath_TEMP & "|" & $binary_path_windows_TEMP
			If $appid_TEMP <> "" Then _ArrayAdd($Viveport_Array_Sorted, $sFill)
			GUICtrlSetData($Anzeige_Fortschrittbalken, $Loop * 100 / $NR_LINES_TEMP)

			If WinExists("HomeLoader - Library") Then
				_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan Viveport: " & "Nr: " & $NR_TEMP & " - " & "Name: " & $name_TEMP & " - " & "SteamAppID: " & $appid_TEMP & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
			EndIf

			$NR_TEMP = $NR_TEMP + 1
			$name_TEMP = ""
			$NR_TEMP = ""
			$url_TEMP = ""
			$appid_TEMP = ""
			$IconPath_TEMP = ""
			$binary_path_windows_TEMP = ""
		EndIf

	Next

	;_ArrayDisplay($Viveport_Array_Sorted)

	If $Sort_Alphabetical_order = "true" Then
		_ArraySort($Viveport_Array_Sorted, 0, 1, 0, 0)
	EndIf

	Local $NR_Game = UBound($Viveport_Array_Sorted) - 1
	;MsgBox(0, "$NR_Game", $NR_Game)

	For $Loop_1 = 1 To $NR_Game
		Local $Application_NR_new = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "") + 1

		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "NR", $Application_NR_new)
		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "url", $Viveport_Array_Sorted[$Loop_1][2])
		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "appid", $Viveport_Array_Sorted[$Loop_1][3])
		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "name", $Viveport_Array_Sorted[$Loop_1][0])
		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "IconPath", $Viveport_Array_Sorted[$Loop_1][4])
		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "binary_path_windows", $Viveport_Array_Sorted[$Loop_1][5])

		IniWrite($ApplicationList_TEMP, "Application_" & $appid_TEMP, "NR", $Application_NR_new)
		IniWrite($ApplicationList_TEMP, "Application_" & $appid_TEMP, "url", $Viveport_Array_Sorted[$Loop_1][2])
		IniWrite($ApplicationList_TEMP, "Application_" & $appid_TEMP, "appid", $Viveport_Array_Sorted[$Loop_1][3])
		IniWrite($ApplicationList_TEMP, "Application_" & $appid_TEMP, "name", $Viveport_Array_Sorted[$Loop_1][0])
		IniWrite($ApplicationList_TEMP, "Application_" & $appid_TEMP, "IconPath", $Viveport_Array_Sorted[$Loop_1][4])
		IniWrite($ApplicationList_TEMP, "Application_" & $appid_TEMP, "binary_path_windows", $Viveport_Array_Sorted[$Loop_1][5])

		IniWrite($ApplicationList_TEMP, "ApplicationList", "NR_Applications", $Application_NR_new)
	Next
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
EndFunc   ;==>_ScanViveData

Func _ScanOculusData()
	If FileExists($Revive_revive_vrmanifest_FilePath) Then
		Global $OculusData_Array_Sorted[1][6] = [["name", "app_key", "arguments", "binary_path_windows", "image_path", "launch_type"]]

		Local $NR_LINES_TEMP = _FileCountLines($Revive_revive_vrmanifest_FilePath)

		If $ScanOnlyVR = "true" Then
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
		Else
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		EndIf

		_FileReadToArray($Revive_revive_vrmanifest_FilePath, $Revive_revive_vrmanifest_Array)
		Local $Loop_End_1 = $Revive_revive_vrmanifest_Array[0]
		_FileReadToArray($Revive_support_vrmanifest_FilePath, $Revive_support_vrmanifest_Array)
		Local $Loop_End_2 = $Revive_support_vrmanifest_Array[0]

		GUICtrlSetData($Anzeige_Fortschrittbalken, 33)

		For $Loop_1 = 1 To $Loop_End_1
			$Steamapps_vrmanifest_aArray = _StringBetween($Revive_revive_vrmanifest_Array[$Loop_1], '"', '"', $STR_ENDNOTSTART)

			If $Steamapps_vrmanifest_aArray <> 0 Then
				If $Steamapps_vrmanifest_aArray[0] <> "" Then
					Local $Check_Left = $Steamapps_vrmanifest_aArray[0]
					Local $Check_Right = ""

					If $Check_Left = "app_key" Or $Check_Left = "name" Or $Check_Left = "image_path" Or $Check_Left = "url" Then
						$Check_Right = $Steamapps_vrmanifest_aArray[1]
					EndIf

					If $Check_Left = "app_key" Then
						Local $app_key_TEMP = $Check_Right
						$app_key_TEMP = StringReplace($app_key_TEMP, 'revive.app.', '')

						Local $arguments_TEMP = StringReplace($Revive_revive_vrmanifest_Array[$Loop_1 + 1], '            "arguments": ', '')
						$arguments_TEMP = StringTrimRight($arguments_TEMP, 1)

						Local $binary_path_windows_TEMP = _StringBetween($Revive_revive_vrmanifest_Array[$Loop_1 + 2], '"', '"', $STR_ENDNOTSTART)
						$binary_path_windows_TEMP = $binary_path_windows_TEMP[1]

						Local $image_path_TEMP = _StringBetween($Revive_revive_vrmanifest_Array[$Loop_1 + 3], '"', '"', $STR_ENDNOTSTART)
						$image_path_TEMP = $image_path_TEMP[1]
						If Not FileExists($Icons & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg") Or $DeleteHomeLoaderLibraryData = "true" Then
							Local $Download_Icon_path_1_jpg = $Icons & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_2_jpg = $Icons & "460x215\steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_3_jpg = $Icon_Folder_1 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_4_jpg = $Icon_Folder_2 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_5_jpg = $Icon_Folder_3 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_6_jpg = $Icon_Folder_4 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_7_jpg = $Icon_Folder_5 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"

							If Not FileExists($Download_Icon_path_1_jpg) Or $DeleteHomeLoaderLibraryData = "true" Then
								FileCopy($image_path_TEMP, $Download_Icon_path_1_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
							EndIf
						EndIf
						Local $ListView_Icon_Path = $Icons & "32x32\" & "steam.app." & 'revive.app.' & $app_key_TEMP & ".bmp"
						If Not FileExists($ListView_Icon_Path) Or $DeleteHomeLoaderLibraryData = "true" Then
							FileCopy($gfx & "Icon_Preview_Oculus_32x32.bmp", $ListView_Icon_Path, $FC_OVERWRITE + $FC_CREATEPATH)
						EndIf

						Local $launch_type_TEMP = _StringBetween($Revive_revive_vrmanifest_Array[$Loop_1 + 4], '"', '"', $STR_ENDNOTSTART)
						$launch_type_TEMP = $launch_type_TEMP[1]

						Local $app_Name_TEMP = _StringBetween($Revive_revive_vrmanifest_Array[$Loop_1 + 7], '"', '"', $STR_ENDNOTSTART)
						$app_Name_TEMP = $app_Name_TEMP[1]
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'Oculus ', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'oculus-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'felix-and-paul-studios-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'fireproof-games-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'hidden-path-entertainment-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'moshe-ben-zacharia-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'playful-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'think-heavy-ltd-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'ready-at-dawn-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'vr', 'VR')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, '-', ' ')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'dg2vr', 'Defence Grid 2 VR')

						$app_Name_TEMP = _StringProper($app_Name_TEMP)
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'Vr', 'VR')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, '-', ' ')

						Local $sFill = $app_Name_TEMP & "|" & $app_key_TEMP & "|" & $arguments_TEMP & "|" & $binary_path_windows_TEMP & "|" & $image_path_TEMP & "|" & $launch_type_TEMP
						_ArrayAdd($OculusData_Array_Sorted, $sFill)
						;_ArrayDisplay($OculusData_Array_Sorted)

						If WinExists("HomeLoader - Library") Then
							_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan Oculus: " & "Nr: " & $Loop_1 & " - " & "Name: " & $app_Name_TEMP & " - " & "SteamAppID: " & $app_key_TEMP & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
						EndIf
					EndIf
				EndIf
			EndIf
		Next

		GUICtrlSetData($Anzeige_Fortschrittbalken, 66)

		For $Loop_2 = 1 To $Loop_End_2
			$Steamapps_vrmanifest_aArray = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2], '"', '"', $STR_ENDNOTSTART)

			If $Steamapps_vrmanifest_aArray <> 0 Then
				If $Steamapps_vrmanifest_aArray[0] <> "" Then
					Local $Check_Left = $Steamapps_vrmanifest_aArray[0]
					Local $Check_Right = ""

					If $Check_Left = "app_key" Or $Check_Left = "name" Or $Check_Left = "image_path" Or $Check_Left = "url" Then
						$Check_Right = $Steamapps_vrmanifest_aArray[1]
					EndIf

					If $Check_Left = "app_key" Then
						Local $app_key_TEMP = $Check_Right
						$app_key_TEMP = StringReplace($app_key_TEMP, 'revive.app.', '')

						Local $arguments_TEMP = StringReplace($Revive_support_vrmanifest_Array[$Loop_2 + 1], '            "arguments": ', '')
						$arguments_TEMP = StringTrimRight($arguments_TEMP, 1)

						Local $binary_path_windows_TEMP = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2 + 2], '"', '"', $STR_ENDNOTSTART)
						$binary_path_windows_TEMP = $binary_path_windows_TEMP[1]

						Local $image_path_TEMP = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2 + 3], '"', '"', $STR_ENDNOTSTART)
						$image_path_TEMP = $Revive_Path & $image_path_TEMP[1]
						If Not FileExists($Icons & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg") Or $DeleteHomeLoaderLibraryData = "true" Then
							Local $Download_Icon_path_1_jpg = $Icons & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_2_jpg = $Icons & "460x215\steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_3_jpg = $Icon_Folder_1 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_4_jpg = $Icon_Folder_2 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_5_jpg = $Icon_Folder_3 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_6_jpg = $Icon_Folder_4 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_7_jpg = $Icon_Folder_5 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"

							If Not FileExists($Download_Icon_path_1_jpg) Or $DeleteHomeLoaderLibraryData = "true" Then
								FileCopy($image_path_TEMP, $Download_Icon_path_1_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
							EndIf

						EndIf
						Local $ListView_Icon_Path = $Icons & "32x32\" & "steam.app." & 'revive.app.' & $app_key_TEMP & ".bmp"
						If Not FileExists($ListView_Icon_Path) Or $DeleteHomeLoaderLibraryData = "true" Then
							FileCopy($gfx & "Icon_Preview_Oculus_32x32.bmp", $ListView_Icon_Path, $FC_OVERWRITE + $FC_CREATEPATH)
						EndIf

						Local $launch_type_TEMP = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2 + 4], '"', '"', $STR_ENDNOTSTART)
						$launch_type_TEMP = $launch_type_TEMP[1]

						Local $app_Name_TEMP = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2 + 7], '"', '"', $STR_ENDNOTSTART)
						$app_Name_TEMP = $app_Name_TEMP[1]
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'Oculus ', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'oculus-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'felix-and-paul-studios-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'fireproof-games-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'hidden-path-entertainment-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'moshe-ben-zacharia-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'playful-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'think-heavy-ltd-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'ready-at-dawn-', '')

						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'vr', 'VR')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, '-', ' ')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'dg2vr', 'Defence Grid 2 VR')

						$app_Name_TEMP = _StringProper($app_Name_TEMP)
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'Vr', 'VR')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, '-', ' ')

						Local $sFill = $app_Name_TEMP & "|" & $app_key_TEMP & "|" & $arguments_TEMP & "|" & $binary_path_windows_TEMP & "|" & $image_path_TEMP & "|" & $launch_type_TEMP
						_ArrayAdd($OculusData_Array_Sorted, $sFill)
						;_ArrayDisplay($OculusData_Array_Sorted)

						If WinExists("HomeLoader - Library") Then
							_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan Oculus: " & "Nr: " & $Loop_2 & " - " & "Name: " & $app_Name_TEMP & " - " & "SteamAppID: " & $app_key_TEMP & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
						EndIf
					EndIf
				EndIf
			EndIf
		Next

		GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
		;_ArrayDisplay($OculusData_Array_Sorted)

		If $Sort_Alphabetical_order = "true" Then
			_ArraySort($OculusData_Array_Sorted, 0, 1, 0, 0)
			;_ArrayDisplay($OculusData_Array_Sorted)
		EndIf

		Local $NR_Game = UBound($OculusData_Array_Sorted) - 1
		;MsgBox(0, "$NR_Game", $NR_Game)

		For $Loop_3 = 1 To $NR_Game
			Local $Application_NR_new = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "") + 1

			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "NR", $Application_NR_new)
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "appid", "revive.app." & $OculusData_Array_Sorted[$Loop_3][1])
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "name", $OculusData_Array_Sorted[$Loop_3][0])
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "arguments", $OculusData_Array_Sorted[$Loop_3][2])
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "binary_path_windows", $OculusData_Array_Sorted[$Loop_3][3])
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "image_path", $OculusData_Array_Sorted[$Loop_3][4])
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "launch_type", $OculusData_Array_Sorted[$Loop_3][5])

			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "NR", $Application_NR_new)
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "appid", "revive.app." & $OculusData_Array_Sorted[$Loop_3][1])
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "name", $OculusData_Array_Sorted[$Loop_3][0])
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "arguments", $OculusData_Array_Sorted[$Loop_3][2])
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "binary_path_windows", $OculusData_Array_Sorted[$Loop_3][3])
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "image_path", $OculusData_Array_Sorted[$Loop_3][4])
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "launch_type", $OculusData_Array_Sorted[$Loop_3][5])

			IniWrite($ApplicationList_TEMP, "ApplicationList", "NR_Applications", $Application_NR_new)

			Local $Start_File_Path = $Install_DIR & "WebPage\Revive\" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1] & ".bat"
			Local $Start_File_Path_Replaced = StringReplace($Start_File_Path, '\', '/')
			Local $App_binary_path = StringReplace($OculusData_Array_Sorted[$Loop_3][3], '/', '\')

			Local $App_arguments, $Oculus_App_Path
			Local $Check_Left_1_App_arguments = StringLeft($OculusData_Array_Sorted[$Loop_3][2], 7)
			Local $Check_Left_2_App_arguments = StringLeft($OculusData_Array_Sorted[$Loop_3][2], 10)
			If $Check_Left_1_App_arguments = '"/base ' Then $App_arguments = StringTrimLeft($OculusData_Array_Sorted[$Loop_3][2], 7)
			If $Check_Left_2_App_arguments = '"/library ' Then $App_arguments = StringTrimLeft($OculusData_Array_Sorted[$Loop_3][2], 10)
			$App_arguments = StringReplace($App_arguments, '/', '\')
			$App_arguments = StringReplace($App_arguments, '\\', '\')
			$App_arguments = StringReplace($App_arguments, '"', '')
			If StringRight($App_arguments, 1) = "\" Then $App_arguments = StringTrimRight($App_arguments, 1)
			If $Check_Left_1_App_arguments = '"/base ' Then $Oculus_App_Path = $Oculus_Path & $App_arguments
			If $Check_Left_2_App_arguments = '"/library ' Then $Oculus_App_Path = $Oculus_Path & $App_arguments

			Local $Revive_App_Path_1 = $Revive_Path & $App_binary_path
			Local $Revive_App_Path_2 = $Oculus_App_Path

			If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Start_File_Path)
			If Not FileExists($Start_File_Path) Then
				FileWrite($Start_File_Path, '"' & $Revive_App_Path_1 & '" ' & '"' & $Revive_App_Path_2 & '"' & @CRLF & "@echo." & @CRLF & "timeout /t 3")
			EndIf
		Next
		GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	EndIf
EndFunc   ;==>_ScanOculusData

Func _Add_SteamID_Tags_to_ApplicationList_Tags()
	Local $iPosition_1 = StringInStr($DataResponse, 'store_tags</td>')
	Local $iPosition_2 = StringInStr($DataResponse, '/a></li></ul></td>', 0, 1, $iPosition_1)
	Local $iPosition_3 = $iPosition_2 - $iPosition_1

	Local $sString = StringMid($DataResponse, $iPosition_1, $iPosition_3)
	$sString = StringReplace($sString, 'store_tags</td>', '')
	$sString = StringReplace($sString, '<td><ul><li><b>', '')
	$sString = StringReplace($sString, '</b>: <a href="/tags/?tagid=', '')
	$sString = StringReplace($sString, '/a></li><li><b>', '')

	Local $Game_Tags = _StringBetween($sString, '>', '<', $STR_ENDNOTSTART)
	_ArrayDisplay($Game_Tags)

	Local $NR_Game_Tags = UBound($Game_Tags) - 1
	MsgBox(0, $NR_Game_Tags, $NR_Game_Tags)

	For $Loop_1 = 1 To $NR_Game_Tags
		MsgBox(0, $Loop_1, $ApplicationList_Folder & "Tags\" & $Game_Tags[$Loop_1] & ".ini")
		Local $NR_Current_Apps = IniRead($ApplicationList_Custom_1_INI, "ApplicationList", "NR_Applications", "")
		Local $ApplicationList_Tag_INI = $ApplicationList_Folder & "Tags\" & $Game_Tags[$Loop_1] & ".ini"
		Local $NR_Current_Apps = IniRead($ApplicationList_Tag_INI, "ApplicationList", "NR_Applications", "")
		Local $Current_App_Exist_Check = IniRead($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "name", "")
		If $Current_App_Exist_Check = $Check_name Then $NR_Current_Apps = IniRead($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "NR", "") - 1

		If $Current_App_Exist_Check <> $Check_name Then IniWrite($ApplicationList_Tag_INI, "ApplicationList", "NR_Applications", $NR_Current_Apps + 1)

		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "NR", $NR_Current_Apps + 1)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "name", $Check_name)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "appid", $Check_AppId)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "right_now", $Check_right_now)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "24h_peak", $Check_24h_peak)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "all_time_peak", $Check_all_time_peak)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $NR_Current_Apps + 1, "resolutionScale", $Check_resolutionScale)

		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "NR", $NR_Current_Apps + 1)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "name", $Check_name)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "appid", $Check_AppId)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "right_now", $Check_right_now)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "24h_peak", $Check_24h_peak)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "all_time_peak", $Check_all_time_peak)
		IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_AppId, "resolutionScale", $Check_resolutionScale)
	Next
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End adding Games using Tags" & " [NR of Apps: " & $NR_ApplicationsCheck & "]")
EndFunc   ;==>_Add_ApplicationList_To_Tags

Func _Checkbox_Show_OnlyVR_Apps()
	If $ScanOnlyVR = "false" Then
		Local $State_Checkbox = GUICtrlRead($Checkbox_ScanOnlyVR)
		If $State_Checkbox = "" Then
			GUICtrlSetData($Checkbox_ScanOnlyVR, "X")
			IniWrite($Config_INI, "Settings", "ScanOnlyVR", "true")
			GUICtrlSetData($Checkbox_ScanAll, "")
		Else
			GUICtrlSetData($Checkbox_ScanOnlyVR, "")
			IniWrite($Config_INI, "Settings", "ScanOnlyVR", "false")
			GUICtrlSetData($Checkbox_ScanAll, "X")
		EndIf
		$ScanOnlyVR = IniRead($Config_INI, "Settings", "ScanOnlyVR", "")
		_Restart()
	EndIf
EndFunc   ;==>_Checkbox_Show_OnlyVR_Apps

Func _Checkbox_Show_All_Apps()
	If $ScanOnlyVR = "true" Then
		Local $State_Checkbox = GUICtrlRead($Checkbox_ScanAll)
		If $State_Checkbox = "" Then
			GUICtrlSetData($Checkbox_ScanAll, "X")
			IniWrite($Config_INI, "Settings", "ScanOnlyVR", "false")
			GUICtrlSetData($Checkbox_ScanOnlyVR, "")
		Else
			GUICtrlSetData($Checkbox_ScanAll, "")
			IniWrite($Config_INI, "Settings", "ScanOnlyVR", "true")
			GUICtrlSetData($Checkbox_ScanOnlyVR, "X")
		EndIf
		$ScanOnlyVR = IniRead($Config_INI, "Settings", "ScanOnlyVR", "")
		_Restart()
	EndIf
EndFunc   ;==>_Checkbox_Show_All_Apps

Func _Checkbox_ScanLibrary_OnStart()
	If $Autostart_VRUB <> "true" Then
		Local $CheckBox = GUICtrlRead($Checkbox_ScanLibrary_OnStart)
		If $CheckBox = "" Then
			GUICtrlSetData($Checkbox_ScanLibrary_OnStart, "a")
			GUICtrlSetData($Checkbox_Settings_1, "a")
			IniWrite($Config_INI, "Settings", "ScanLibrary_OnStart", "true")
		Else
			GUICtrlSetData($Checkbox_ScanLibrary_OnStart, "")
			GUICtrlSetData($Checkbox_Settings_1, "")
			IniWrite($Config_INI, "Settings", "ScanLibrary_OnStart", "false")
		EndIf
		$ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
	Else
		MsgBox($MB_ICONWARNING, "HomeLoader Overlay VRUB is activated", "Overlay is activated. The settings are overwritten with the settings made in the Overlay.")
	EndIf
	_Set_States()
EndFunc   ;==>_Checkbox_ScanLibrary_OnStart

Func _Checkbox_Request_Steamdb_info()
	If $Autostart_VRUB <> "true" Then
		Local $CheckBox = GUICtrlRead($Checkbox_Request_Steamdb_info)
		If $CheckBox = "" Then
			GUICtrlSetData($Checkbox_Request_Steamdb_info, "a")
			GUICtrlSetData($Checkbox_Settings_2, "a")
			IniWrite($Config_INI, "Settings", "Request_Steamdb_info", "true")
		Else
			GUICtrlSetData($Checkbox_Request_Steamdb_info, "")
			GUICtrlSetData($Checkbox_Settings_2, "")
			IniWrite($Config_INI, "Settings", "Request_Steamdb_info", "false")
		EndIf
		$Request_Steamdb_info = IniRead($Config_INI, "Settings", "Request_Steamdb_info", "")
	Else
		MsgBox($MB_ICONWARNING, "HomeLoader Overlay VRUB is activated", "Overlay is activated. The settings are overwritten with the settings made in the Overlay.")
	EndIf
	_Set_States()
EndFunc   ;==>_Checkbox_Request_Steamdb_info

Func _Checkbox_Use_Steam_Tags()
	If $Autostart_VRUB <> "true" Then
		Local $CheckBox = GUICtrlRead($Checkbox_Use_Steam_Tags)
		If $CheckBox = "" Then
			GUICtrlSetData($Checkbox_Use_Steam_Tags, "a")
			GUICtrlSetData($Checkbox_Settings_3, "a")
			IniWrite($Config_INI, "Settings", "Use_Steam_Tags", "true")
		Else
			GUICtrlSetData($Checkbox_Use_Steam_Tags, "")
			GUICtrlSetData($Checkbox_Settings_3, "")
			IniWrite($Config_INI, "Settings", "Use_Steam_Tags", "false")
		EndIf
		$Use_Steam_Tags = IniRead($Config_INI, "Settings", "Use_Steam_Tags", "")
	Else
		MsgBox($MB_ICONWARNING, "HomeLoader Overlay VRUB is activated", "Overlay is activated. The settings are overwritten with the settings made in the Overlay.")
	EndIf
	_Set_States()
EndFunc   ;==>_Checkbox_Use_Steam_Tags

Func _RM_Checkbox_ScanViveData()
	Local $CheckBox = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_1_1, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_4, "a")
		IniWrite($Config_INI, "Settings", "ScanVIVEApps", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_1_1, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_4, "")
		IniWrite($Config_INI, "Settings", "ScanVIVEApps", "false")
	EndIf
	$ScanVIVEApps = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_ScanViveData

Func _RM_Checkbox_ScanOculusData()
	Local $CheckBox = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_1_2, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_5, "a")
		IniWrite($Config_INI, "Settings", "ScanOculusApps", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_1_2, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_5, "")
		IniWrite($Config_INI, "Settings", "ScanOculusApps", "false")
	EndIf
	$ScanOculusApps = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_ScanOculusData

Func _RM_Checkbox_Sort_Alphabetical_order()
	Local $CheckBox = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_2, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_6, "a")
		IniWrite($Config_INI, "Settings", "Sort_Alphabetical_order", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_2, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_6, "")
		IniWrite($Config_INI, "Settings", "Sort_Alphabetical_order", "false")
	EndIf
	$Sort_Alphabetical_order = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Sort_Alphabetical_order

Func _RM_Add_Apps_Tags_to_categories()
	Local $CheckBox = IniRead($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_3, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_7, "a")
		IniWrite($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_3, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_7, "")
		IniWrite($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "false")
	EndIf
	$Sort_Alphabetical_order = IniRead($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "")
	_Set_States()
EndFunc   ;==>_RM_Add_Apps_Tags_to_categories

Func _RM_Checkbox_Allow_Multiple_Tag_Assignments()
	Local $CheckBox = IniRead($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_4, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_8, "a")
		IniWrite($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_4, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_8, "")
		IniWrite($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "false")
	EndIf
	$Sort_Alphabetical_order = IniRead($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Allow_Multiple_Tag_Assignments

Func _RM_Checkbox_Add_PlayersOnline_to_Icons()
	Local $CheckBox = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_5, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_9, "a")
		IniWrite($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_5, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_9, "")
		IniWrite($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "false")
	EndIf
	$Sort_Alphabetical_order = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Add_PlayersOnline_to_Icons

Func _RM_Checkbox_Add_SS_to_Icons()
	Local $CheckBox = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_6, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_10, "a")
		IniWrite($Config_INI, "Settings", "Add_SS_to_Icons", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_6, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_10, "")
		IniWrite($Config_INI, "Settings", "Add_SS_to_Icons", "false")
	EndIf
	$Allow_Multiple_Tag_Assignments = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Add_SS_to_Icons

Func _RM_Checkbox_Add_SS_per_game()
	Local $CheckBox = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_7, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_11, "a")
		IniWrite($Config_INI, "Settings", "Add_SS_per_game", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_7, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_11, "")
		IniWrite($Config_INI, "Settings", "Add_SS_per_game", "false")
	EndIf
	$Allow_Multiple_Tag_Assignments = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Add_SS_per_game

Func _RM_Checkbox_Create_HTML_GamePage()
	Local $CheckBox = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_8, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_12, "a")
		IniWrite($Config_INI, "Settings", "Create_HTML_GamePage", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_8, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_12, "")
		IniWrite($Config_INI, "Settings", "Create_HTML_GamePage", "false")
	EndIf
	$Allow_Multiple_Tag_Assignments = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Create_HTML_GamePage

Func _RM_Checkbox_DeleteHomeLoaderLibraryData()
	Local $CheckBox = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_9, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_13, "a")
		IniWrite($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_9, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_13, "")
		IniWrite($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "false")
	EndIf
	$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_DeleteHomeLoaderLibraryData


Func _RM_Scan_Fetch_Steamdb_Tags()
	_RM_Delete_Category_Pages()
	_Get_SteamGame_Tags()
	;_Add_ApplicationList_To_Tags()
EndFunc   ;==>_RM_Scan_Fetch_Steamdb_Tags


Func _RM_Create_HTML_GamePages_All()
	_Create_GamePages()
	_Create_SinglePages()
	_Create_Game_Tags_Page()
EndFunc   ;==>_RM_Create_HTML_GamePages_All

Func _RM_Create_HTML_GamePages_Selected()
	_Button_Create_GamePage_selected()
	_Button_Create_SinglePage_selected()
EndFunc   ;==>_RM_Create_HTML_GamePages_Selected

Func _RM_Delete_Category_Pages()
	If FileExists($ApplicationList_Custom_1_INI) Then FileDelete($ApplicationList_Custom_1_INI)
	If FileExists($ApplicationList_Custom_2_INI) Then FileDelete($ApplicationList_Custom_2_INI)
	If FileExists($ApplicationList_Custom_3_INI) Then FileDelete($ApplicationList_Custom_3_INI)
	If FileExists($ApplicationList_Custom_4_INI) Then FileDelete($ApplicationList_Custom_4_INI)
EndFunc   ;==>_RM_Delete_Category_Pages

#EndRegion Func MAIN GUI

#Region Func Add to Library GUI
Func _DROPDOWN_Library()
	Local $DROPDOWN = GUICtrlRead($DROPDOWN_Library)
	If $DROPDOWN <> "" Then
		Local $Value_DROPDOWN_Library = $DROPDOWN
		IniWrite($Config_INI, "TEMP", "Value_DROPDOWN_Library", $Value_DROPDOWN_Library)
	EndIf
EndFunc   ;==>_DROPDOWN_Library

Func _BUTTON_GamePath_Folder()
	Local $FileSelect = FileOpenDialog("Choose File.", $Install_DIR, "All (*.*)", $FD_FILEMUSTEXIST)
	If $FileSelect <> "" Then
		Local $Value_GamePath_Folder = $FileSelect
		GUICtrlSetData($Input_GamePath_Folder, $FileSelect)
		IniWrite($Config_INI, "TEMP", "Value_GamePath_Folder", $FileSelect)
		Local $HL_ID = "HLNSG" & StringReplace(StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2), '.', '')
		IniWrite($Config_INI, "TEMP", "Value_Use_SteamID", $HL_ID)
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
		IniWrite($Config_INI, "TEMP", "Value_IconPath_Folder", $gfx & "Icon_Preview.jpg")
		Local $Value_FileName = StringInStr($Value_GamePath_Folder, "\", "", -1)
		$Value_FileName = StringTrimLeft($Value_GamePath_Folder, $Value_FileName)
		Local $Value_NamefromFile = StringInStr($Value_FileName, ".", "", -1)
		Local $StringCut_NR = StringLen($Value_FileName) - $Value_NamefromFile + 1
		$Value_NamefromFile = StringTrimRight($Value_FileName, $StringCut_NR)
		IniWrite($Config_INI, "TEMP", "Value_Input_Name", $Value_NamefromFile)
		GUICtrlSetData($Input_Name, $Value_NamefromFile)
	EndIf
EndFunc   ;==>_BUTTON_GamePath_Folder

Func _BUTTON_Use_SteamID()
	Local $InputBox = InputBox("Enter Steam Game ID", " ", "", "", -1, 1)
	If $InputBox <> "" Then
		Local $Value_Use_SteamID = $InputBox
		GUICtrlSetData($Input_GamePath_Folder, "steam://rungameid/" & $Value_Use_SteamID)
		IniWrite($Config_INI, "TEMP", "Value_Use_SteamID", $Value_Use_SteamID)
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
		IniWrite($Config_INI, "TEMP", "Value_IconPath_Folder", $gfx & "Icon_Preview.jpg")
		Local $Value_FileName = "SteamGameID " & $Value_Use_SteamID
		IniWrite($Config_INI, "TEMP", "Value_Input_Name", $Value_FileName)
		GUICtrlSetData($Input_Name, $Value_FileName)
	EndIf
EndFunc   ;==>_BUTTON_Use_SteamID

Func _Input_Name()
	Local $Input_Input_Name = GUICtrlRead($Input_Name)
	If $Input_Input_Name <> "" Then
		Local $Value_Input_Name = $Input_Input_Name
		IniWrite($Config_INI, "TEMP", "Value_Input_Name", $Input_Input_Name)
	EndIf
EndFunc   ;==>_Input_Name

Func _BUTTON_IconPath_Folder()
	Local $FileSelect = FileOpenDialog("Choose Icon File.", $Icons, "All (*.*)", $FD_FILEMUSTEXIST)
	If $FileSelect <> "" Then
		Local $Value_IconPath_Folder = $FileSelect
		GUICtrlSetImage($Icon_Preview, $Value_IconPath_Folder)
		IniWrite($Config_INI, "TEMP", "Value_IconPath_Folder", $Value_IconPath_Folder)
		GUICtrlSetState($Frame_up, $GUI_SHOW)
		GUICtrlSetState($Frame_down, $GUI_SHOW)
		GUICtrlSetState($Frame_right, $GUI_SHOW)
		GUICtrlSetState($Frame_left, $GUI_SHOW)
		GUICtrlSetState($Icon_Preview, $GUI_SHOW)
	EndIf
EndFunc   ;==>_BUTTON_IconPath_Folder

Func _Button_SAVE_APP()
	Local $Value_DROPDOWN_Library = IniRead($Config_INI, "TEMP", "Value_DROPDOWN_Library", "")
	Local $Value_GamePath_Folder = IniRead($Config_INI, "TEMP", "Value_GamePath_Folder", "")
	Local $Value_Use_SteamID = IniRead($Config_INI, "TEMP", "Value_Use_SteamID", "")
	Local $Value_Input_Name = IniRead($Config_INI, "TEMP", "Value_Input_Name", "")
	Local $Value_IconPath_Folder = IniRead($Config_INI, "TEMP", "Value_IconPath_Folder", "")

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

	IniWrite($Config_INI, "TEMP", "Value_DROPDOWN_Library", "")
	IniWrite($Config_INI, "TEMP", "Value_GamePath_Folder", "")
	IniWrite($Config_INI, "TEMP", "Value_Use_SteamID", "")
	IniWrite($Config_INI, "TEMP", "Value_Input_Name", "")
	IniWrite($Config_INI, "TEMP", "Value_IconPath_Folder", "")

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
EndFunc   ;==>_Button_SAVE_APP

Func _Button_Exit_AddGame2Library_GUI()
	IniWrite($Config_INI, "TEMP", "Value_DROPDOWN_Library", "")
	IniWrite($Config_INI, "TEMP", "Value_GamePath_Folder", "")
	IniWrite($Config_INI, "TEMP", "Value_Use_SteamID", "")
	IniWrite($Config_INI, "TEMP", "Value_Input_Name", "")
	IniWrite($Config_INI, "TEMP", "Value_IconPath_Folder", "")
	GUIDelete($AddGame2Library_GUI)
EndFunc   ;==>_Button_Exit_AddGame2Library_GUI
#EndRegion Func Add to Library GUI

#Region Func Settings GUI
Func _Button_Exit_Settings_GUI()
	GUIDelete($HLL_Settings_GUI)
	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
EndFunc   ;==>_Button_Exit_Settings_GUI




#EndRegion Func Settings GUI

#Region Func SS_Settings GUI
Func _Slider_0()
	Local $Value_Slider = GUICtrlRead($Slider_0)
	GUICtrlSetData($Input_ResolutionScale, $Value_Slider)
EndFunc   ;==>_Slider_0

Func _UpDown_ResolutionScale()
	Local $Value_UpDown = GUICtrlRead($Input_ResolutionScale)
	If $Value_UpDown < 20 Then $Value_UpDown = "20"
	If $Value_UpDown > 500 Then $Value_UpDown = "500"
	GUICtrlSetData($Input_ResolutionScale, $Value_UpDown)
	GUICtrlSetData($Slider_0, $Value_UpDown)
EndFunc   ;==>_UpDown_ResolutionScale

Func _Button_Save_Settings_GUI()
	$Input_ResolutionScale = GUICtrlRead($Input_ResolutionScale)

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $App_NR = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "NR", "")
	Local $AppName = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "appName", "")

	;IniWrite($SteamVR_VRSettings_INI, "steam.app." & $Game_ID, "resolutionScale", $Input_ResolutionScale)
	IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "resolutionScale", $Input_ResolutionScale)
	IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $App_NR, "resolutionScale", $Input_ResolutionScale)
EndFunc   ;==>_Button_Save_Settings_GUI

Func _Button_Exit_SS_Settings_GUI()
	GUIDelete($SS_Settings_GUI)
EndFunc   ;==>_Button_Exit_SS_Settings_GUI
#EndRegion Func SS_Settings GUI

#Region Func Home Loader
Func _Restart()
	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
	;_Create_HLL_GUI()
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
	EndIf
	Sleep(500)
	GUIDelete($HLL_GUI_Handle)
	GUIDelete($HLL_GUI)
	Exit
EndFunc   ;==>_Restart

Func _Exit_Check()
	If Not ProcessExists("vrmonitor.exe") Then
		FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " Exit Check: SteamVR is not running --> Exit [HomeLoaderLibrary]" & " '_Exit_Check()'")
		Exit
	EndIf
EndFunc   ;==>_Exit_Check

Func _Exit()
	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
	GUIDelete($HLL_GUI)
	Exit
EndFunc   ;==>_Beenden
#EndRegion Func Home Loader

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
	_Exit_Check()
	If $Add_SS_to_Icons = "true" Then _Get_AD_SS_Values_to_Icons()
	_Sync_Icons()
	_Exit_Check()
EndFunc   ;==>_Overlay_ReScan_Steam_Library

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

		Local $FileList = _FileListToArray($s_LocalFolder, "*.acf", 1)
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
				$File_Path = ""
			Next
			Sleep(500)
		EndIf
		$FileList = ""
	EndIf
EndFunc   ;==>_Overlay_Search_Files

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

		If $Request_Steamdb_info = "true" And $appid <> "" Then
			_Get_ADD_PlayersOnline_DATA()
		EndIf
	EndIf
EndFunc   ;==>_Overlay_ApplicationList_Update
#EndRegion Func OVERLAY

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

	Local $UseVideoPages = IniRead($Install_DIR & "WebPage\VideoPage\VIDEOID.ini", "Settings", "UseVideoPages", "")

	FileWriteLine($StartPage_path, '    <br><br>')

	Local $LocalFolder = $Install_DIR & "Apps\VRToolBox\"
	Local $FolderList = _FileListToArray($LocalFolder, "*", $FLTA_FOLDERS)

	For $Loop_Temp = 1 To $FolderList[0]
		Local $Addon_Path = $LocalFolder & $FolderList[$Loop_Temp] & "\index.html"
		If $FolderList[$Loop_Temp] = "HomeLoader" Then $Addon_Path = $LocalFolder & $FolderList[$Loop_Temp] & "\HomeLoader_StartPage.html"
		Local $Addon_Path_Replaced = StringReplace($Addon_Path, '\', '/')
		Local $IconPath_TEMP = $LocalFolder & $FolderList[$Loop_Temp] & "\icon.png"
		If FileExists($Addon_Path) Then
			FileWriteLine($StartPage_path, '    <div class="tooltip"><a href="file:///' & $Addon_Path_Replaced & '">         <img class="icon" src="' & $IconPath_TEMP & '" width="200" />                    <span class="tooltiptext">' & $FolderList[$Loop_Temp] & '</span></a></div>')
		EndIf
	Next

	FileWriteLine($StartPage_path, '    <br>')
	FileWriteLine($StartPage_path, '  </div>')
	FileWriteLine($StartPage_path, '</body>')
	FileWriteLine($StartPage_path, '</html>')
EndFunc   ;==>_Create_VRToolBox_StartPage

Func _Create_VRToolBox_HL_StartPage()
	Local $FileRead_HL_StartPage_Template = FileRead($Install_DIR & "WebPage\Templates\HomeLoader_StartPage.html")
	Local $FileRead_HL_StartPage = $Install_DIR & "Apps\VRToolBox\HomeLoader\HomeLoader_StartPage.html"
	Local $HL_StartPage_Install_Dir_Replace = "file:///" & StringReplace($Install_DIR, '\', '/')

	Local $FileRead_HL_StartPage_Replace = StringReplace($FileRead_HL_StartPage_Template, '___Instal_Dir___', $HL_StartPage_Install_Dir_Replace)

	If FileExists($FileRead_HL_StartPage) Then FileDelete($FileRead_HL_StartPage)
	FileWrite($FileRead_HL_StartPage, $FileRead_HL_StartPage_Replace)
EndFunc   ;==>_Create_VRToolBox_HL_StartPage

Func _Create_VRToolBox_VideoPage()
	Local $Install_DIR_Replaced = StringReplace($Install_DIR, '\', '/')
	Local $VIDEOID_ini = $Install_DIR & "WebPage\VideoPage\VIDEOID.ini"
	Local $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"

	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)

	Local $NR_Video_ID_max = 1

	For $LOOP_Random_NR = 1 To 10
		Local $Check_Video_ID = IniRead($VIDEOID_ini, "VIDEOID", "VIDEOID_" & $LOOP_Random_NR, "")
		If $Check_Video_ID <> "" Then $NR_Video_ID_max = $LOOP_Random_NR
		If $Check_Video_ID = "" Then ExitLoop
	Next

	Local $Video_NR = Random(1, $NR_Video_ID_max, 1)
	Local $Video_ID = IniRead($VIDEOID_ini, "VIDEOID", "VIDEOID_" & $Video_NR, "")

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " _Create_VRToolBox_VideoPage:" & " " & $Video_NR & " - " & '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID & '">')

	FileWriteLine($VideoPage_path, '<meta http-equiv="refresh" content="0; url=https://www.youtube.com/tv#/watch?v=' & $Video_ID & '">')
EndFunc   ;==>_Create_VRToolBox_VideoPage

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
EndFunc   ;==>_Copy_2_VRToolBox
#EndRegion Func VR ToolBox

#Region Func Create HTML Pages / Game Pages
Func _Create_GamePage_Menu_Page()
	Local $FileRead_HL_GamePage_Menu_Page_Template = FileRead($Install_DIR & "WebPage\Templates\GamePage_Menu.html")
	Local $FileRead_HL_GamePage_Menu_Page = $Install_DIR & "WebPage\GamePage_Menu.html"

	$TAB1_Label = IniRead($Config_INI, "Settings", "TAB1_Name", "")
	$TAB2_Label = IniRead($Config_INI, "Settings", "TAB2_Name", "")
	$TAB3_Label = IniRead($Config_INI, "Settings", "TAB3_Name", "")
	$TAB4_Label = IniRead($Config_INI, "Settings", "TAB4_Name", "")
	$TAB5_Label = IniRead($Config_INI, "Settings", "TAB5_Name", "")
	$TAB6_Label = IniRead($Config_INI, "Settings", "TAB6_Name", "")
	If $TAB1_Label = "" Then $TAB1_Label = "Library"
	If $TAB2_Label = "" Then $TAB2_Label = "Non-Steam_Appl"
	If $TAB3_Label = "" Then $TAB3_Label = "Custom 1"
	If $TAB4_Label = "" Then $TAB4_Label = "Custom 2"
	If $TAB5_Label = "" Then $TAB5_Label = "Custom 3"
	If $TAB6_Label = "" Then $TAB6_Label = "Custom 4"

	Local $FileRead_HL_GamePage_Menu_Page_Replace = StringReplace($FileRead_HL_GamePage_Menu_Page_Template, '___Label_3___', $TAB3_Label)
	$FileRead_HL_GamePage_Menu_Page_Replace = StringReplace($FileRead_HL_GamePage_Menu_Page_Replace, '___Label_4___', $TAB4_Label)
	$FileRead_HL_GamePage_Menu_Page_Replace = StringReplace($FileRead_HL_GamePage_Menu_Page_Replace, '___Label_5___', $TAB5_Label)
	$FileRead_HL_GamePage_Menu_Page_Replace = StringReplace($FileRead_HL_GamePage_Menu_Page_Replace, '___Label_6___', $TAB6_Label)

	If FileExists($FileRead_HL_GamePage_Menu_Page) Then FileDelete($FileRead_HL_GamePage_Menu_Page)
	FileWrite($FileRead_HL_GamePage_Menu_Page, $FileRead_HL_GamePage_Menu_Page_Replace)
EndFunc   ;==>_Create_VRToolBox_HL_StartPage

Func _Create_GamePages()
	$Add_Back_to_HTML_GamePage = IniRead($Config_INI, "Settings", "Add_Back_to_HTML_GamePage", "")
	Local $ApplicationList_TEMP, $GamePage_path, $NR_Applications, $PageName
	Local $Install_DIR_TEMP = StringReplace($Install_DIR, '\', '/')

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Creating Game Pages:")

	For $Loop_Temp = 1 To 6
		If WinExists("HomeLoader - Library") Then
			GUICtrlSetData($Anzeige_Fortschrittbalken, ($Loop_Temp * 100 / 6) / 2)
		EndIf

		If $Loop_Temp = 1 Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		EndIf

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

			Local $HTML_Content = '<html>' & @CRLF & _
					'<head>' & @CRLF & _
					'    <title>GamePage</title>' & @CRLF & _
					'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
					'</head>' & @CRLF & _
					'<body>' & @CRLF & _
					'<script>' & @CRLF & _
					' ' & @CRLF & _
					'</script>' & @CRLF & _
					'<h1>' & $PageName & '</h1><br>' & @CRLF & _
					'<div class="icons">' & @CRLF

			If $HomeApp = "VR Toolbox" Then
				$HTML_Content = '<html>' & @CRLF & _
						'<head>' & @CRLF & _
						'    <title>GamePage</title>' & @CRLF & _
						'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
						'</head>' & @CRLF & _
						'<body>' & @CRLF & _
						'<script>' & @CRLF & _
						'    function VRTStartCommand(cmd) {' & @CRLF & _
						"      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';" & @CRLF & _
						'      console.log(s);' & @CRLF & _
						'    }' & @CRLF & _
						'</script>' & @CRLF & _
						'<h1>' & $PageName & '</h1><br>' & @CRLF & _
						'<div class="icons">' & @CRLF
			EndIf

			If $Add_Back_to_HTML_GamePage = "true" Then
				Local $Content_Back = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
						'	<a href="file:///' & $Install_DIR_TEMP & 'WebPage/GamePage_Menu.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
						'</div>' & @CRLF

				$HTML_Content = $HTML_Content & $Content_Back
			EndIf


			FileWrite($GamePage_path, $HTML_Content)

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
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Game Page " & "'" & $PageName & "' " & "created . [NR of Games = " & $NR_Applications & "]")
	Next

	$ApplicationList_TEMP = ""

	If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
	If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"

	For $Loop_Temp_2 = 1 To 2
		$NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

		If $Loop_Temp_2 = 1 Then
			Local $GamePage_path_temp = $Install_DIR & "WebPage\GamePage_Viveport.html"
			Local $PageName = "Viveport Games"
		EndIf

		If $Loop_Temp_2 = 2 Then
			Local $GamePage_path_temp = $Install_DIR & "WebPage\GamePage_Oculus.html"
			Local $PageName = "Oculus Games"
		EndIf

		If FileExists($GamePage_path_temp) Then FileDelete($GamePage_path_temp)

		Local $HTML_Content = '<html>' & @CRLF & _
				'<head>' & @CRLF & _
				'    <title>GamePage</title>' & @CRLF & _
				'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
				'</head>' & @CRLF & _
				'<body>' & @CRLF & _
				'<script>' & @CRLF & _
				' ' & @CRLF & _
				'</script>' & @CRLF & _
				'<h1>' & $PageName & '</h1><br>' & @CRLF & _
				'<div class="icons">' & @CRLF

		If $HomeApp = "VR Toolbox" Then
			$HTML_Content = '<html>' & @CRLF & _
					'<head>' & @CRLF & _
					'    <title>GamePage</title>' & @CRLF & _
					'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
					'</head>' & @CRLF & _
					'<body>' & @CRLF & _
					'<script>' & @CRLF & _
					'    function VRTStartCommand(cmd) {' & @CRLF & _
					"      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';" & @CRLF & _
					'      console.log(s);' & @CRLF & _
					'    }' & @CRLF & _
					'</script>' & @CRLF & _
					'<h1>' & $PageName & '</h1><br>' & @CRLF & _
					'<div class="icons">' & @CRLF
		EndIf

		If $Add_Back_to_HTML_GamePage = "true" Then
			Local $Content_Back = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
					'	<a href="file:///' & $Install_DIR_TEMP & 'WebPage/GamePage_Menu.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
					'</div>' & @CRLF

			$HTML_Content = $HTML_Content & $Content_Back
		EndIf

		FileWrite($GamePage_path_temp, $HTML_Content)

		For $Loop_Temp_3 = 1 To $NR_Applications
			If WinExists("HomeLoader - Library") Then
				GUICtrlSetData($Anzeige_Fortschrittbalken, ($Loop_Temp_3 * 100 / $NR_Applications))
			EndIf
			Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp_3, "NR", "")
			Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp_3, "appid", "")
			Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp_3, "name", "")
			Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp_3, "installdir", "")
			Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $Application_appid, "IconPath", "")
			Global $WebPage_IconPath = $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg"

			If $Loop_Temp_2 = 1 Then
				Local $StringLeft_Check_AppID = StringLeft($Application_appid, 9)
				Local $StringTrimLeft_Check_AppID = StringTrimLeft($Application_appid, 9)
				Local $StringLeft_Application_appid = StringLeft($Application_appid, 9)
				Local $StringTrimLeft_Application_appid = StringTrimLeft($Application_appid, 9)
				Local $AppID_Check_String = "vive.htc."


				If $StringLeft_Application_appid = $AppID_Check_String Then
					If Not FileExists($WebPage_IconPath) Then
						FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If Not FileExists($WebPage_IconPath) Then
						FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If Not FileExists($WebPage_IconPath) Then
						If $StringLeft_Application_appid = "vive.htc." Then FileCopy($gfx & "Viveport.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If $HomeApp = "VR Toolbox" Then
						If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path_temp, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'vive://runapp/" & $StringTrimLeft_Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf

					If $HomeApp <> "VR Toolbox" Then
						If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path_temp, '    <div class="tooltip"><a href="vive://runapp/' & $StringTrimLeft_Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf
				EndIf
			EndIf

			If $Loop_Temp_2 = 2 Then
				Local $StringLeft_Check_AppID = StringLeft($Application_appid, 11)
				Local $StringTrimLeft_Check_AppID = StringTrimLeft($Application_appid, 11)
				Local $StringLeft_Application_appid = StringLeft($Application_appid, 11)
				Local $StringTrimLeft_Application_appid = StringTrimLeft($Application_appid, 11)
				Local $AppID_Check_String = "revive.app."

				If $StringLeft_Application_appid = $AppID_Check_String Then
					Local $App_binary_path = IniRead($ApplicationList_INI_TEMP, "Application_" & $Application_appid, "binary_path_windows", "")
					$App_binary_path = StringReplace($App_binary_path, '/', '\')
					Local $App_arguments = IniRead($ApplicationList_INI_TEMP, "Application_" & $Application_appid, "arguments", "")
					Local $Check_Left_1_App_arguments = StringLeft($App_arguments, 7)
					Local $Check_Left_2_App_arguments = StringLeft($App_arguments, 10)
					If $Check_Left_1_App_arguments = '/base \' Then $App_arguments = StringTrimLeft($App_arguments, 7)
					If $Check_Left_2_App_arguments = '/library \' Then $App_arguments = StringTrimLeft($App_arguments, 10)
					$App_arguments = StringReplace($App_arguments, '/', '\')
					$App_arguments = StringReplace($App_arguments, '\\', '\')
					$App_arguments = StringReplace($App_arguments, '"', '')
					If StringRight($App_arguments, 1) = "\" Then $App_arguments = StringTrimRight($App_arguments, 1)
					Local $Oculus_App_Path = "C:\Program Files\Oculus\Software\" & $App_arguments
					If $Check_Left_1_App_arguments = '/base \' Then $Oculus_App_Path = "C:\Program Files\Oculus\Support\" & $App_arguments
					If $Check_Left_2_App_arguments = '/library \' Then $Oculus_App_Path = "C:\Program Files\Oculus\Software\" & $App_arguments

					If $HomeApp = "VR Toolbox" Then
						Local $Start_File_Path = $Install_DIR & "WebPage\Revive\" & $Application_appid & ".bat"
						Local $Start_File_Path_Replaced = StringReplace($Start_File_Path, '\', '/')
						Local $Revive_App_Path_1 = $Revive_Path & $App_binary_path
						Local $Revive_App_Path_2 = $Oculus_App_Path

						If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Start_File_Path)
						If Not FileExists($Start_File_Path) Then
							FileWrite($Start_File_Path, '"' & $Revive_App_Path_1 & '" ' & '"' & $Revive_App_Path_2 & '"' & @CRLF & "@echo." & @CRLF & "timeout /t 3")
						EndIf
					EndIf

					If Not FileExists($WebPage_IconPath) Then
						FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If Not FileExists($WebPage_IconPath) Then
						FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If Not FileExists($WebPage_IconPath) Then
						If $StringLeft_Application_appid = "revive.app." Then FileCopy($gfx & "revive.app..jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If $HomeApp = "VR Toolbox" Then
						If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path_temp, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'file:///" & $Start_File_Path_Replaced & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf

					If $HomeApp <> "VR Toolbox" Then
						If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path_temp, '    <div class="tooltip"><a href="' & $Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf
				EndIf
			EndIf
		Next
	Next



	$ApplicationList_TEMP = ""
	$GamePage_path_temp = ""

	For $Loop_Temp_4 = 1 To 30
		If WinExists("HomeLoader - Library") Then
			GUICtrlSetData($Anzeige_Fortschrittbalken, ($Loop_Temp_4 * 100 / 30))
		EndIf

		Local $FileName = FileReadLine($Tags_TXT, $Loop_Temp_4)
		$ApplicationList_TEMP = $MainCategory_ApplicationList_Folder & $FileName & ".ini"

		If FileExists($ApplicationList_TEMP) Then
			$NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
			Local $GamePage_path_temp = $Install_DIR & "WebPage\Tags\" & $FileName & ".html"

			If FileExists($GamePage_path_temp) Then FileDelete($GamePage_path_temp)

			Local $HTML_Content = '<html>' & @CRLF & _
					'<head>' & @CRLF & _
					'    <title>GamePage</title>' & @CRLF & _
					'    <link href="File:///' & $Install_DIR_TEMP & 'WebPage/css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
					'</head>' & @CRLF & _
					'<body>' & @CRLF & _
					'<script>' & @CRLF & _
					' ' & @CRLF & _
					'</script>' & @CRLF & _
					'<h1>' & $FileName & '</h1>' & @CRLF & _
					'<div class="icons">' & @CRLF

			If $HomeApp = "VR Toolbox" Then
				$HTML_Content = '<html>' & @CRLF & _
						'<head>' & @CRLF & _
						'    <title>GamePage</title>' & @CRLF & _
						'    <link href="File:///' & $Install_DIR_TEMP & 'WebPage/css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
						'</head>' & @CRLF & _
						'<body>' & @CRLF & _
						'<script>' & @CRLF & _
						'    function VRTStartCommand(cmd) {' & @CRLF & _
						"      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';" & @CRLF & _
						'      console.log(s);' & @CRLF & _
						'    }' & @CRLF & _
						'</script>' & @CRLF & _
						'<h1>' & $FileName & '</h1><br><br>' & @CRLF & _
						'<div class="icons">' & @CRLF
			EndIf

			If $Add_Back_to_HTML_GamePage = "true" Then
				Local $Content_Back = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
						'	<a href="file:///' & $Install_DIR_TEMP & 'WebPage/GamePage_Tags.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
						'</div>' & @CRLF

				$HTML_Content = $HTML_Content & $Content_Back
			EndIf

			FileWrite($GamePage_path_temp, $HTML_Content)

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
				EndIf

				If $HomeApp = "VR Toolbox" Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path_temp, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'steam://rungameid/" & $Application_appid & "');" & '">         <img class="icon" src="File:///' & $Install_DIR_TEMP & 'WebPage/images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf

				If $HomeApp <> "VR Toolbox" Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path_temp, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' ">         <img class="icon" src="File:///' & $Install_DIR_TEMP & 'WebPage/images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf
			Next
			Sleep(100)
			FileWriteLine($GamePage_path_temp, ' </div>')
			FileWriteLine($GamePage_path_temp, '</body>')
			FileWriteLine($GamePage_path_temp, '</html>')
			Sleep(100)
		EndIf
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Game Page " & "'" & $FileName & "' " & "created . [NR of Games = " & $NR_Applications & "]")
	Next




	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating Game Pages. [NR of created Game Pages  = 6]")

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 50)
	EndIf
EndFunc   ;==>_Create_GamePages

Func _Create_SinglePages()
	Local $Install_DIR_TEMP = StringReplace($Install_DIR, '\', '/')
	$Add_Back_to_HTML_GamePage = IniRead($Config_INI, "Settings", "Add_Back_to_HTML_GamePage", "")
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start creating Single Pages:")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "" Then $ButtonTAB_State = "1"

	If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
	If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
	$GamePage_path = $Install_DIR & "WebPage\GamesPage.html"

	If FileExists($GamePage_path) Then FileDelete($GamePage_path)


	Local $HTML_Content = '<html>' & @CRLF & _
							'<head>' & @CRLF & _
							'    <title>Game Schortcuts</title>' & @CRLF & _
							'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
							'</head>' & @CRLF & _
							'<body>' & @CRLF & _
							'<script>' & @CRLF & _
							' ' & @CRLF & _
							'</script>' & @CRLF & _
							'<br><br><br>' & @CRLF & _
							'<div class="icons">' & @CRLF

	If $Add_Back_to_HTML_GamePage = "true" Then
		Local $Content_Back = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
				'	<a href="file:///' & $Install_DIR_TEMP & 'WebPage/GamePage_Menu.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
				'</div><br><br><br><br><br>' & @CRLF

		$HTML_Content = $HTML_Content & $Content_Back
	EndIf

	FileWrite($GamePage_path, $HTML_Content)

	For $NR = 1 To $NR_Applications
		If WinExists("HomeLoader - Library") Then
			GUICtrlSetData($Anzeige_Fortschrittbalken, ($NR * 100 / $NR_Applications))
		EndIf
		Local $Install_DIR_TEMP = StringReplace($Install_DIR, '\', '/')
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
		If $HomeApp = "VR Toolbox" Then FileWriteLine($HTMLSinglePage_Path, '    function VRTStartCommand(cmd) {')
		If $HomeApp = "VR Toolbox" Then FileWriteLine($HTMLSinglePage_Path, "      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';")
		If $HomeApp = "VR Toolbox" Then FileWriteLine($HTMLSinglePage_Path, '      console.log(s);')
		If $HomeApp = "VR Toolbox" Then FileWriteLine($HTMLSinglePage_Path, '    }')
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

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End Updating Single Game Pages. [NR of Game Pages created = " & $NR_Applications & "]")
	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	EndIf
EndFunc   ;==>_Create_SinglePages

Func _Create_Game_Tags_Page()
	Local $Value_Line, $Value_Line_ADD, $Value_Line_1, $Value_Line_Tag
	Local $Install_DIR_Replaced = StringReplace($Install_DIR, '\', '/')

	Local $Array_GamePage_Tags[1]

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 25)

	For $Loop_1 = 1 To 30
		$Value_Line_Tag = FileReadLine($Tags_TXT, $Loop_1)

		$Value_Line_ADD = '<a href="file:///' & $Install_DIR_Replaced & 'WebPage/Tags/' & $Value_Line_Tag & '.html' & '" class="button">' & $Value_Line_Tag & '</a>&nbsp;&nbsp;&nbsp;&nbsp;'
		If $Loop_1 = 4 Or $Loop_1 = 8 Or $Loop_1 = 12  Or $Loop_1 = 16 Or $Loop_1 = 20 Or $Loop_1 = 24 Or $Loop_1 = 28 Then
			$Value_Line_ADD = '<a href="file:///' & $Install_DIR_Replaced & 'WebPage/Tags/' & $Value_Line_Tag & '.html' & '" class="button">' & $Value_Line_Tag & '</a><br><br>'
		EndIf

		;Local $sFill = $Value_Line_Left & "|" & $Value_Line_Tag & "|" & $Value_Line_Right
		_ArrayAdd($Array_GamePage_Tags, $Value_Line_ADD)
	Next

	;_ArrayDisplay($Array_GamePage_Tags)

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 50)

	If FileExists($Path_GamePage_Tags) Then FileDelete($Path_GamePage_Tags)

	For $Loop_2 = 1 To 11
		$Value_Line = FileReadLine($Install_DIR & "WebPage\Templates\GamePage_Tags.html", $Loop_2)
		FileWriteLine($Path_GamePage_Tags, $Value_Line)
	Next

	Local $Content = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
					'	<a href="file:///' & $Install_DIR_Replaced & 'WebPage/GamePage_Menu.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
					'</div>'

	FileWriteLine($Path_GamePage_Tags, $Content)
	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 75)

	For $Loop_3 = 12 To 41
		$Value_Line = $Array_GamePage_Tags[$Loop_3 - 11]
		FileWriteLine($Path_GamePage_Tags, '	' & $Value_Line)
	Next

	For $Loop_4 = 42 To 44
		$Value_Line = FileReadLine($Install_DIR & "WebPage\Templates\GamePage_Tags.html", $Loop_4)
		FileWriteLine($Path_GamePage_Tags, $Value_Line)
	Next
	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
EndFunc

#EndRegion Func Create Game Pages

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Region Read/Write Steam Files
Func _Read_steamapps_vrmanifest()
	If FileExists($ApplicationList_SteamVRLibrary_ALL_INI) Then FileDelete($ApplicationList_SteamVRLibrary_ALL_INI)
	Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	Local $FileLines = _FileCountLines($Steamapps_vrmanifest_FilePath)
	_FileReadToArray($Steamapps_vrmanifest_FilePath, $Steamapps_vrmanifest_Array)

	$Loop_End_1 = $Steamapps_vrmanifest_Array[0]

	Global $Array_Sorted[1][2] = [["name", "appid"]]

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 3)
	EndIf

	For $Loop = 1 To $Loop_End_1
		$Steamapps_vrmanifest_aArray = _StringBetween($Steamapps_vrmanifest_Array[$Loop], '"', '"', $STR_ENDNOTSTART)

		If $Steamapps_vrmanifest_aArray <> 0 Then
			If $Steamapps_vrmanifest_aArray[0] <> "" Then
				Local $Check_Left = $Steamapps_vrmanifest_aArray[0]
				Local $Check_Right = ""

				If $Check_Left = "app_key" Or $Check_Left = "name" Or $Check_Left = "image_path" Or $Check_Left = "url" Then
					$Check_Right = $Steamapps_vrmanifest_aArray[1]
				EndIf

				If $Check_Left = "app_key" Then
					Local $Steam_app_key_TEMP = $Check_Right
					$SteamAppID_TEMP = StringReplace($Steam_app_key_TEMP, 'steam.app.', '')
					$Steam_app_Name_TEMP = _StringBetween($Steamapps_vrmanifest_Array[$Loop + 4], '"', '"', $STR_ENDNOTSTART)
					$Steam_app_Name_TEMP = $Steam_app_Name_TEMP[1]

					$ApplicationList_NR_TEMP = $ApplicationList_NR_TEMP + 1

					Local $sFill = $Steam_app_Name_TEMP & "|" & $SteamAppID_TEMP
					_ArrayAdd($Array_Sorted, $sFill)

					If WinExists("HomeLoader - Library") Then
						_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan SteamLibrary: " & "Nr: " & $ApplicationList_NR_TEMP & " - " & "Name: " & $Steam_app_Name_TEMP & " - " & "SteamAppID: " & $SteamAppID_TEMP & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
					EndIf

					If $ScanOnlyVR = "true" Then
						$appid = $SteamAppID_TEMP
						$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
						If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icons & "32x32\" & "steam.app." & $appid & ".bmp")
						If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icons & "256x256\" & "steam.app." & $appid & ".bmp")

						If Not FileExists($Icons & "steam.app." & $appid & ".jpg") Then
							_Download_Icon_for_SteamGameID()
						EndIf

						If Not FileExists($Icons & "32x32\" & "steam.app." & $appid & ".bmp") Then
							_Get_SteamGame_Icon_32x32()
						EndIf

						If Not FileExists($Icons & "256x256\" & "steam.app." & $appid & ".ico") Then
							_Get_SteamGame_Icon_256x256()
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Next
	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 6)
	EndIf

	If $Sort_Alphabetical_order = "true" Then
		_ArraySort($Array_Sorted, 0, 1, 0, 0)
	EndIf

	IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "ApplicationList", "NR_Applications", $ApplicationList_NR_TEMP)

	For $Loop = 1 To $ApplicationList_NR_TEMP
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Loop, "NR", $Loop)
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Loop, "name", $Array_Sorted[$Loop][0])
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Loop, "appid", $Array_Sorted[$Loop][1])
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop][1], "NR", $Loop)
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop][1], "name", $Array_Sorted[$Loop][0])
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop][1], "appid", $Array_Sorted[$Loop][1])

		If $Request_Steamdb_info = "true" And $Array_Sorted[$Loop][1] <> "" Then
			$Application_NR = $Loop
			$appid = $Array_Sorted[$Loop][1]
		EndIf

		If WinExists("HomeLoader - Library") Then
			GUICtrlSetData($Anzeige_Fortschrittbalken, $Loop * 100 / $ApplicationList_NR_TEMP)
		EndIf
	Next
EndFunc   ;==>_Read_steamapps_vrmanifest

Func _Read_SteamVR_VRSettings()
	Local $FileLines = _FileCountLines($Steamvr_vrsettings_FilePath)
	_FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)

	$Loop_End_1 = $Steamvr_vrsettings_Array[0]

	For $Loop = 1 To $Loop_End_1
		$Steamvr_vrsettings_aArray = _StringBetween($Steamvr_vrsettings_Array[$Loop], '"', '"', $STR_ENDNOTSTART)

		If $Steamvr_vrsettings_aArray <> 0 Then

			If $Steamvr_vrsettings_aArray[0] <> "" Then
				Local $Check_Left = StringLeft($Steamvr_vrsettings_aArray[0], 10)
				Local $Check_Right = StringTrimLeft($Steamvr_vrsettings_aArray[0], 10)

				If $Check_Left = "steam.app." Then
					$Steam_app_Name_TEMP = _StringBetween($Steamvr_vrsettings_Array[$Loop + 1], '"', '"', $STR_ENDNOTSTART)
					$ResolutionScale_TEMP = StringRight($Steamvr_vrsettings_Array[$Loop + 2], 3)
					$ResolutionScale_TEMP = StringReplace($ResolutionScale_TEMP, ' ', '')
					Local $SteamAppID_TEMP = $Check_Right

					$ApplicationList_INI_TEMP = $ApplicationList_SteamLibrary_ALL_INI

					If $ScanOnlyVR = "true" Then
						$ApplicationList_INI_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
					EndIf

					Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_INI_TEMP, "Application_" & $SteamAppID_TEMP, "NR", "")

					If WinExists("HomeLoader - Library") Then
						_GUICtrlStatusBar_SetText($Statusbar, "" & "Read SteamVR VRSettings: " & "Resolution Scale: " & $ResolutionScale_TEMP & " - " & "Name: " & $Steam_app_Name_TEMP & " - " & "SteamAppID: " & $SteamAppID_TEMP & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
					EndIf

					;IniWrite($ApplicationList_INI_TEMP, "Application_" & $ApplicationList_NR_TEMP, "name", $Steam_app_Name_TEMP[1])
					;IniWrite($ApplicationList_INI_TEMP, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
					IniWrite($ApplicationList_INI_TEMP, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
					IniWrite($ApplicationList_INI_TEMP, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)

					Local $Check_NR_Custom = IniRead($ApplicationList_Custom_1_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
					If $Check_NR_Custom <> "" Then
						;IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_NR_Custom, "name", $Steam_app_Name_TEMP[1])
						;IniWrite($ApplicationList_Custom_1_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
						IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_NR_Custom, "resolutionScale", $ResolutionScale_TEMP)
						IniWrite($ApplicationList_Custom_1_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
					EndIf

					Local $Check_NR_Custom = IniRead($ApplicationList_Custom_2_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
					If $Check_NR_Custom <> "" Then
						;IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_NR_Custom, "name", $Steam_app_Name_TEMP[1])
						;IniWrite($ApplicationList_Custom_2_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
						IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_NR_Custom, "resolutionScale", $ResolutionScale_TEMP)
						IniWrite($ApplicationList_Custom_2_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
					EndIf

					Local $Check_NR_Custom = IniRead($ApplicationList_Custom_3_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
					If $Check_NR_Custom <> "" Then
						;IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_NR_Custom, "name", $Steam_app_Name_TEMP[1])
						;IniWrite($ApplicationList_Custom_3_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
						IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_NR_Custom, "resolutionScale", $ResolutionScale_TEMP)
						IniWrite($ApplicationList_Custom_3_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
					EndIf

					Local $Check_NR_Custom = IniRead($ApplicationList_Custom_4_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
					If $Check_NR_Custom <> "" Then
						;IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_NR_Custom, "name", $Steam_app_Name_TEMP[1])
						;IniWrite($ApplicationList_Custom_4_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
						IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_NR_Custom, "resolutionScale", $ResolutionScale_TEMP)
						IniWrite($ApplicationList_Custom_4_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
					EndIf

					For $Loop_1 = 0 To 30
						Local $Tag_Temp = FileReadLine($Tags_TXT, $Loop_1)
						Local $ApplicationList_Tag_INI = $ApplicationList_Folder & "Tags\" & $Tag_Temp & ".ini"
						If FileExists($ApplicationList_Tag_INI) Then
							Local $Check_App_Exists = IniRead($ApplicationList_Tag_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
							If $Check_App_Exists <> "" Then
								;IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_App_Exists, "name", $Steam_app_Name_TEMP[1])
								;IniWrite($ApplicationList_Tag_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
								IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_App_Exists, "resolutionScale", $ResolutionScale_TEMP)
								IniWrite($ApplicationList_Tag_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
							EndIf
						EndIf
					Next
				EndIf
			EndIf
		EndIf
	Next
EndFunc   ;==>_Read_SteamVR_VRSettings

Func _Write_to_SteamVR_VRSettings()
	$Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	If $Add_SS_per_game = "true" Then
		$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
		If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
		If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
		If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
		If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
		If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
		If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

		If FileExists($Steamvr_vrsettings_FilePath & ".new") Then FileDelete($Steamvr_vrsettings_FilePath & ".new")
		Local $SteamAppExist = "false"
		Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
		$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
		Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

		Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
		Local $Steam_app_Name = $ListView_Item_Array[3]
		$Game_ID = $ListView_Item_Array[2]

		;MsgBox(0, "11580", $Steam_app_Name & @CRLF & $Game_ID)

		Local $FileLines = _FileCountLines($Steamvr_vrsettings_FilePath)
		_FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)
		$Loop_End_1 = $Steamvr_vrsettings_Array[0]

		For $Loop = 1 To $Loop_End_1
			$Steamvr_vrsettings_aArray = _StringBetween($Steamvr_vrsettings_Array[$Loop], '"', '"', $STR_ENDNOTSTART)
			If $Steamvr_vrsettings_aArray <> "" Then
				If $Steamvr_vrsettings_aArray <> 0 Then
					If $Steamvr_vrsettings_aArray[0] <> "" Then
						Local $Check_Left = StringLeft($Steamvr_vrsettings_aArray[0], 10)
						Local $Check_Right = $Game_ID

						If $Steamvr_vrsettings_aArray[0] = "steam.app." & $Check_Right Then
							$SteamAppExist = "true"
							$Steam_app_Name_TEMP = _StringBetween($Steamvr_vrsettings_Array[$Loop + 1], '"', '"', $STR_ENDNOTSTART)
							$ResolutionScale_TEMP = StringRight($Steamvr_vrsettings_Array[$Loop + 2], 3)
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
							$Loop = $Loop + 3
						Else
							FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
						EndIf
					EndIf
				EndIf
			Else
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
			EndIf
		Next

		If $SteamAppExist = "false" Then
			If FileExists($Steamvr_vrsettings_FilePath & ".new") Then FileDelete($Steamvr_vrsettings_FilePath & ".new")
			Local $SteamAppID_TEMP = $Game_ID
			Local $Steam_app_Name_TEMP = $Steam_app_Name
			Local $ResolutionScale_TEMP = GUICtrlRead($Input_ResolutionScale)

			For $Loop = 1 To $Loop_End_1 - 2
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
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
		_Read_from_INI_ADD_2_ListView()
	Else
		MsgBox($MB_ICONINFORMATION, "Attention!", "Read/Write Resolution Scale is disabled." & @CRLF & _
													"Enable it in the Settings to be able to use this function.")
	EndIf
EndFunc   ;==>_Write_to_SteamVR_VRSettings

Func _RM_Write_to_SteamVR_VRSettings()
	$Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	If $Add_SS_per_game = "true" Then
		If FileExists($Steamvr_vrsettings_FilePath & ".new") Then FileDelete($Steamvr_vrsettings_FilePath & ".new")
		Local $SteamAppExist = "false"

		$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
		If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
		If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
		If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
		If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
		If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
		If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

		Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
		$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
		Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

		Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
		Local $Steam_app_Name = $ListView_Item_Array[3]
		$Game_ID = $ListView_Item_Array[2]

		;MsgBox(0, "11724", $Steam_app_Name & @CRLF & $Game_ID)

		Local $FileLines = _FileCountLines($Steamvr_vrsettings_FilePath)
		_FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)
		$Loop_End_1 = $Steamvr_vrsettings_Array[0]

		For $Loop = 1 To $Loop_End_1
			$Steamvr_vrsettings_aArray = _StringBetween($Steamvr_vrsettings_Array[$Loop], '"', '"', $STR_ENDNOTSTART)
			If $Steamvr_vrsettings_aArray <> "" Then
				If $Steamvr_vrsettings_aArray <> 0 Then
					If $Steamvr_vrsettings_aArray[0] <> "" Then
						Local $Check_Left = StringLeft($Steamvr_vrsettings_aArray[0], 10)
						Local $Check_Right = $Game_ID

						If $Steamvr_vrsettings_aArray[0] = "steam.app." & $Check_Right Then
							$SteamAppExist = "true"
							$Steam_app_Name_TEMP = _StringBetween($Steamvr_vrsettings_Array[$Loop + 1], '"', '"', $STR_ENDNOTSTART)
							Local $SteamAppID_TEMP = $Check_Right

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

								;MsgBox(0, "11766", $Steam_app_Name_TEMP[1] & @CRLF & $ResolutionScale_TEMP)

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
							$Loop = $Loop + 3
						Else
							FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
						EndIf
					EndIf
				EndIf
			Else
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
			EndIf
		Next

		If $SteamAppExist = "false" Then
			If FileExists($Steamvr_vrsettings_FilePath & ".new") Then FileDelete($Steamvr_vrsettings_FilePath & ".new")
			Local $SteamAppID_TEMP = $Game_ID
			Local $Steam_app_Name_TEMP = $Steam_app_Name

			For $Loop = 1 To $Loop_End_1 - 2
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
			Next

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
		_Read_from_INI_ADD_2_ListView()
	Else
		MsgBox($MB_ICONINFORMATION, "Attention!", "Read/Write Resolution Scale is disabled." & @CRLF & _
				"Enable it in the Settings to be able to use this function.")
	EndIf
EndFunc   ;==>_RM_Write_to_SteamVR_VRSettings

#EndRegion Read/Write Steam Files

#Region ERROR handler
Func MyErrFunc()
	Local $HexNumber
	Local $strMsg

	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "Error Number: " & $HexNumber & " - "
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & " - "
	$strMsg &= "Script Line: " & $oMyError.ScriptLine & " - "
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [MyErrFunc()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. Error retrieving URL... " & $strMsg & " - " & $name & " - " & $appid & "<--- " & "[" & _Now() & "]")
	If WinExists("HomeLoader - Library") Then
		_GUICtrlStatusBar_SetText($Statusbar, "" & "Error retrieving URL... " & $strMsg & " - " & $name & " - " & $appid & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	EndIf
	SetError(1)
EndFunc   ;==>MyErrFunc
#EndRegion ERROR handler
