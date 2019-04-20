
#Region Includes
;#include <GuiButton.au3>
#include <FontConstants.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
;#include <File.au3>
#include <GuiMenu.au3>
#include <GuiStatusBar.au3>
#include <GUIConstants.au3>
#include <GDIPlus.au3>
#include <Inet.au3>
;#include <Array.au3>
;#include <String.au3>
#include "_GDIPlus_WTOB.au3"
#include <IE.au3>
#include <Process.au3>
#include <Misc.au3>
#include "SteamVR_Environment.au3"
#EndRegion Includes


Opt("GUIOnEventMode", 1)

#Region Set Global
Global $HLL_GUI, $HLL_Settings_GUI, $InputBox, $TAB_NR_Temp, $Oculus_App_URL
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
Global $Checkbox_Add_SS_per_game_Value, $Checkbox_Create_HTML_GamePage_Value, $Checkbox_DeleteHomeLoaderLibraryData_Value, $Checkbox_Create_SteamVR_Home_Panels_Value
Global $Checkbox_Add_Apps_Tags_to_categories_Value, $Checkbox_Settings_1, $Checkbox_Settings_2, $Checkbox_Settings_3
Global $Checkbox_Settings_4, $Checkbox_Settings_5, $Checkbox_Settings_6, $Checkbox_Settings_7, $Checkbox_Settings_8, $Checkbox_Settings_9
Global $Checkbox_Settings_10, $Checkbox_Settings_11, $Checkbox_Settings_12, $Checkbox_Settings_13, $Checkbox_Settings_1_Label, $Checkbox_Settings_2_Label
Global $Checkbox_Settings_3_Label, $Checkbox_Settings_4_Label, $Checkbox_Settings_5_Label, $Checkbox_Settings_6_Label, $Checkbox_Settings_7_Label, $Checkbox_Settings_8_Label
Global $Checkbox_Settings_9_Label, $Checkbox_Settings_10_Label, $Checkbox_Settings_11_Label, $Checkbox_Settings_12_Label, $Checkbox_Settings_13_Label
Global $Value_dvd_cover_template, $Combo_Environment_Name, $Checkbox_Update_Check_OnStart_Value, $Array_Result, $AtError_Result, $appid_TEMP
Global $INetGetSource_Check, $ScriptLineNumber_Temp, $GUI_Preparing, $contextmenu_Prepare_Environment_Button, $RM_Prepare_Environment_Item_1
Global $RM_Prepare_Environment_Item_2, $RM_Prepare_Environment_Item_3, $RM_Prepare_Environment_Item_4, $RM_Prepare_Environment_Item_5, $RM_Prepare_Environment_Item_6
Global $HomeLoader_Map_Image
Global $font = "arial"
Global $font_arial = "arial"
Global $font_Consolas = "Consolas"

Global $DesktopWidth = "855"
Global $DesktopHeight = @DesktopHeight - 75
Global $POS_X_GUI = 4

Global $oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")
#EndRegion Set Global

#Region Declare Variables/Const 1
Global $Install_DIR = @ScriptDir & "\"
Global $System_DIR = $Install_DIR & "System\"
;Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
;If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
;Global $Config_INI = @ScriptDir & "\config.ini"
Global $Config_INI = $System_DIR & "config.ini"
Global $Version = IniRead($Config_INI, "Settings", "Version", "")
Global $Update_Check = IniRead($Config_INI, "Settings", "Update_Check", "")
Global $Debug_Mode = IniRead($Config_INI, "Settings", "Debug_Mode", "")
Global $SteamVR_Home_Panel_Settings_INI = $Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Panel_Settings.ini"
Global $SteamVR_Home_Environment_Settings_INI = $Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Environment_Settings.ini"
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
Global $Create_SteamVR_Home_Panels = IniRead($Config_INI, "Settings", "Create_SteamVR_Home_Panels", "")
Global $Add_Back_to_HTML_GamePage = IniRead($Config_INI, "Settings", "Add_Back_to_HTML_GamePage", "")
Global $Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "false")
Global $Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "false")
Global $Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "false")
Global $Tags_TXT = $Install_DIR & "System\Tags.txt"
Global $Path_GamePage_Tags = $Install_DIR & "WebPage\GamePage_Tags.html"

Global $gfx = $Install_DIR & "System\gfx\"
Global $Icons = $Install_DIR & "Icons\"

Global $HomeLoader_Map_Folder = $Install_DIR & "Apps\SteamVR_Home\Maps\"
Global $HomeLoader_Map_Image_Template = $gfx & "Environment_Map.jpg"

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

Global $Viveport_Bat_File_Folder = $installdir & "WebPage\Viveport\"
If Not FileExists($Viveport_Bat_File_Folder) Then DirCreate($Viveport_Bat_File_Folder)

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

Global $VRUB_Folder = $Install_Folder_Steam_1 & "steamapps\common\VRUtilityBelt\"
If Not FileExists($VRUB_Folder) Then $VRUB_Folder = $Install_Folder_Steam_2 & "steamapps\common\VRUtilityBelt\"
If Not FileExists($VRUB_Folder) Then $VRUB_Folder = $Install_Folder_Steam_3 & "steamapps\common\VRUtilityBelt\"
If Not FileExists($VRUB_Folder) Then $VRUB_Folder = $Install_Folder_Steam_4 & "steamapps\common\VRUtilityBelt\"
If Not FileExists($VRUB_Folder) Then $VRUB_Folder = $Install_Folder_Steam_5 & "steamapps\common\VRUtilityBelt\"
If Not FileExists($VRUB_Folder) Then $VRUB_Folder = ""

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

Global $SteamVR_Environment_URL = "steam://openurl/https://steamcommunity.com/sharedfiles/filedetails/?id=1620667283"
Global $SteamVR_Environment_Name = IniRead($Config_INI, "Settings", "SteamVR_Environment_Name", "homeloader")
Global $Panel_Name_1 = IniRead($Config_INI, "Settings", "TAB1_Name", "Steam Library")
Global $Panel_Name_2 = IniRead($Config_INI, "Settings", "TAB2_Name", "Non-Steam_Appl")
Global $Panel_Name_3 = IniRead($Config_INI, "Settings", "TAB3_Name", "Custom 1")
Global $Panel_Name_4 = IniRead($Config_INI, "Settings", "TAB4_Name", "Custom 2")
Global $Panel_Name_5 = IniRead($Config_INI, "Settings", "TAB5_Name", "Custom 3")
Global $Panel_Name_6 = IniRead($Config_INI, "Settings", "TAB6_Name", "Custom 4")
Global $Panel_Name_7 = "Viveport Applications"
Global $Panel_Name_8 = "Oculus Applications"
Global $Panel_Name_9 = "Tags"
Global $Panel_Name_10 = "Panel Tool 1 - Controller"
Global $Panel_Name_11 = "Panel Tool 2 - Projector"

Global $SteamVR_Home_Panel_Icons = IniRead($Config_INI, "Settings_HomeAPP", "SteamVR_Home_Panel_Icons", "web")

Global $Use_unpacked_workshop_environment = IniRead($SteamVR_Home_Environment_Settings_INI, "Settings", "Use_unpacked_workshop_environment", "true")

Global $stats_log_FILE = $System_DIR & "Logs\stats_log.txt"
Global $scan_log_FILE = $System_DIR & "Logs\scan_log.txt"
Global $function_log_FILE = $System_DIR & "Logs\function_log.txt"
Global $error_log_FILE = $System_DIR & "Logs\error_log.txt"

Local $Check_Log_Size_1 = _FileCountLines($stats_log_FILE)
Local $Check_Log_Size_2 = _FileCountLines($scan_log_FILE)
Local $Check_Log_Size_3 = _FileCountLines($function_log_FILE)
Local $Check_Log_Size_4 = _FileCountLines($error_log_FILE)

If $Check_Log_Size_1 > 10000 Then FileDelete($stats_log_FILE)
If $Check_Log_Size_2 > 10000 Then FileDelete($scan_log_FILE)
If $Check_Log_Size_3 > 10000 Then FileDelete($function_log_FILE)
If $Check_Log_Size_4 > 10000 Then FileDelete($error_log_FILE)

IniWrite($Config_INI, "Settings", "Version", $Version)

Global $font_arial = "Arial"
Global $font_2 = "Arial"
#EndRegion Declare Variables/Const 1


#Region Declare Variables CSS Color
Local $NR_Colors = 147
Local $aArray_Colors, $Color_Name_Value
Local $aArray_Colors[1][2] = [["Name", "Value"]]

FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start '_ArrayAdd' Colors")

_ArrayAdd($aArray_Colors, "AliceBlue|#F0F8FF")
_ArrayAdd($aArray_Colors, "AntiqueWhite|#FAEBD7")
_ArrayAdd($aArray_Colors, "Aqua|#00FFFF")
_ArrayAdd($aArray_Colors, "Aquamarine|#7FFFD4")
_ArrayAdd($aArray_Colors, "Azure|#F0FFFF")
_ArrayAdd($aArray_Colors, "Beige|#F5F5DC")
_ArrayAdd($aArray_Colors, "Bisque|#FFE4C4")
_ArrayAdd($aArray_Colors, "Black|#000000")
_ArrayAdd($aArray_Colors, "BlanchedAlmond|#FFEBCD")
_ArrayAdd($aArray_Colors, "Blue|#0000FF")
_ArrayAdd($aArray_Colors, "BlueViolet|#8A2BE2")
_ArrayAdd($aArray_Colors, "Brown|#A52A2A")
_ArrayAdd($aArray_Colors, "BurlyWood|#DEB887")
_ArrayAdd($aArray_Colors, "CadetBlue|#5F9EA0")
_ArrayAdd($aArray_Colors, "Chartreuse|#7FFF00")
_ArrayAdd($aArray_Colors, "Chocolate|#D2691E")
_ArrayAdd($aArray_Colors, "Coral|#FF7F50")
_ArrayAdd($aArray_Colors, "CornflowerBlue|#6495ED")
_ArrayAdd($aArray_Colors, "Cornsilk|#FFF8DC")
_ArrayAdd($aArray_Colors, "Crimson|#DC143C")
_ArrayAdd($aArray_Colors, "Cyan|#00FFFF")
_ArrayAdd($aArray_Colors, "DarkBlue|#00008B")
_ArrayAdd($aArray_Colors, "DarkCyan|#008B8B")
_ArrayAdd($aArray_Colors, "DarkGoldenRod|#B8860B")
_ArrayAdd($aArray_Colors, "DarkGray|#A9A9A9")
_ArrayAdd($aArray_Colors, "DarkGrey|#A9A9A9")
_ArrayAdd($aArray_Colors, "DarkGreen|#006400")
_ArrayAdd($aArray_Colors, "DarkKhaki|#BDB76B")
_ArrayAdd($aArray_Colors, "DarkMagenta|#8B008B")
_ArrayAdd($aArray_Colors, "DarkOliveGreen|#556B2F")
_ArrayAdd($aArray_Colors, "DarkOrange|#FF8C00")
_ArrayAdd($aArray_Colors, "DarkOrchid|#9932CC")
_ArrayAdd($aArray_Colors, "DarkRed|#8B0000")
_ArrayAdd($aArray_Colors, "DarkSalmon|#E9967A")
_ArrayAdd($aArray_Colors, "DarkSeaGreen|#8FBC8F")
_ArrayAdd($aArray_Colors, "DarkSlateBlue|#483D8B")
_ArrayAdd($aArray_Colors, "DarkSlateGray|#2F4F4F")
_ArrayAdd($aArray_Colors, "DarkSlateGrey|#2F4F4F")
_ArrayAdd($aArray_Colors, "DarkTurquoise|#00CED1")
_ArrayAdd($aArray_Colors, "DarkViolet|#9400D3")
_ArrayAdd($aArray_Colors, "DeepPink|#FF1493")
_ArrayAdd($aArray_Colors, "DeepSkyBlue|#00BFFF")
_ArrayAdd($aArray_Colors, "DimGray|#696969")
_ArrayAdd($aArray_Colors, "DimGrey|#696969")
_ArrayAdd($aArray_Colors, "DodgerBlue|#1E90FF")
_ArrayAdd($aArray_Colors, "FireBrick|#B22222")
_ArrayAdd($aArray_Colors, "FloralWhite|#FFFAF0")
_ArrayAdd($aArray_Colors, "ForestGreen|#228B22")
_ArrayAdd($aArray_Colors, "Fuchsia|#FF00FF")
_ArrayAdd($aArray_Colors, "Gainsboro|#DCDCDC")
_ArrayAdd($aArray_Colors, "GhostWhite|#F8F8FF")
_ArrayAdd($aArray_Colors, "Gold|#FFD700")
_ArrayAdd($aArray_Colors, "GoldenRod|#DAA520")
_ArrayAdd($aArray_Colors, "Gray|#808080")
_ArrayAdd($aArray_Colors, "Grey|#808080")
_ArrayAdd($aArray_Colors, "Green|#008000")
_ArrayAdd($aArray_Colors, "GreenYellow|#ADFF2F")
_ArrayAdd($aArray_Colors, "HoneyDew|#F0FFF0")
_ArrayAdd($aArray_Colors, "HotPink|#FF69B4")
_ArrayAdd($aArray_Colors, "IndianRed|#CD5C5C")
_ArrayAdd($aArray_Colors, "Indigo|#4B0082")
_ArrayAdd($aArray_Colors, "Ivory|#FFFFF0")
_ArrayAdd($aArray_Colors, "Khaki|#F0E68C")
_ArrayAdd($aArray_Colors, "Lavender|#E6E6FA")
_ArrayAdd($aArray_Colors, "LavenderBlush|#FFF0F5")
_ArrayAdd($aArray_Colors, "LawnGreen|#7CFC00")
_ArrayAdd($aArray_Colors, "LemonChiffon|#FFFACD")
_ArrayAdd($aArray_Colors, "LightBlue|#ADD8E6")
_ArrayAdd($aArray_Colors, "LightCoral|#F08080")
_ArrayAdd($aArray_Colors, "LightCyan|#E0FFFF")
_ArrayAdd($aArray_Colors, "LightGoldenRodYellow|#FAFAD2")
_ArrayAdd($aArray_Colors, "LightGray|#D3D3D3")
_ArrayAdd($aArray_Colors, "LightGrey|#D3D3D3")
_ArrayAdd($aArray_Colors, "LightGreen|#90EE90")
_ArrayAdd($aArray_Colors, "LightPink|#FFB6C1")
_ArrayAdd($aArray_Colors, "LightSalmon|#FFA07A")
_ArrayAdd($aArray_Colors, "LightSeaGreen|#20B2AA")
_ArrayAdd($aArray_Colors, "LightSkyBlue|#87CEFA")
_ArrayAdd($aArray_Colors, "LightSlateGray|#778899")
_ArrayAdd($aArray_Colors, "LightSlateGrey|#778899")
_ArrayAdd($aArray_Colors, "LightSteelBlue|#B0C4DE")
_ArrayAdd($aArray_Colors, "LightYellow|#FFFFE0")
_ArrayAdd($aArray_Colors, "Lime|#00FF00")
_ArrayAdd($aArray_Colors, "LimeGreen|#32CD32")
_ArrayAdd($aArray_Colors, "Linen|#FAF0E6")
_ArrayAdd($aArray_Colors, "Magenta|#FF00FF")
_ArrayAdd($aArray_Colors, "Maroon|#800000")
_ArrayAdd($aArray_Colors, "MediumAquaMarine|#66CDAA")
_ArrayAdd($aArray_Colors, "MediumBlue|#0000CD")
_ArrayAdd($aArray_Colors, "MediumOrchid|#BA55D3")
_ArrayAdd($aArray_Colors, "MediumPurple|#9370DB")
_ArrayAdd($aArray_Colors, "MediumSeaGreen|#3CB371")
_ArrayAdd($aArray_Colors, "MediumSlateBlue|#7B68EE")
_ArrayAdd($aArray_Colors, "MediumSpringGreen|#00FA9A")
_ArrayAdd($aArray_Colors, "MediumTurquoise|#48D1CC")
_ArrayAdd($aArray_Colors, "MediumVioletRed|#C71585")
_ArrayAdd($aArray_Colors, "MidnightBlue|#191970")
_ArrayAdd($aArray_Colors, "MintCream|#F5FFFA")
_ArrayAdd($aArray_Colors, "MistyRose|#FFE4E1")
_ArrayAdd($aArray_Colors, "Moccasin|#FFE4B5")
_ArrayAdd($aArray_Colors, "NavajoWhite|#FFDEAD")
_ArrayAdd($aArray_Colors, "Navy|#000080")
_ArrayAdd($aArray_Colors, "OldLace|#FDF5E6")
_ArrayAdd($aArray_Colors, "Olive|#808000")
;_ArrayAdd($aArray_Colors, "OliveDrab|#6B8E23")
_ArrayAdd($aArray_Colors, "Orange|#FFA500")
_ArrayAdd($aArray_Colors, "OrangeRed|#FF4500")
_ArrayAdd($aArray_Colors, "Orchid|#DA70D6")
_ArrayAdd($aArray_Colors, "PaleGoldenRod|#EEE8AA")
_ArrayAdd($aArray_Colors, "PaleGreen|#98FB98")
_ArrayAdd($aArray_Colors, "PaleTurquoise|#AFEEEE")
_ArrayAdd($aArray_Colors, "PaleVioletRed|#DB7093")
_ArrayAdd($aArray_Colors, "PapayaWhip|#FFEFD5")
_ArrayAdd($aArray_Colors, "PeachPuff|#FFDAB9")
_ArrayAdd($aArray_Colors, "Peru|#CD853F")
_ArrayAdd($aArray_Colors, "Pink|#FFC0CB")
_ArrayAdd($aArray_Colors, "Plum|#DDA0DD")
_ArrayAdd($aArray_Colors, "PowderBlue|#B0E0E6")
_ArrayAdd($aArray_Colors, "Purple|#800080")
_ArrayAdd($aArray_Colors, "RebeccaPurple|#663399")
_ArrayAdd($aArray_Colors, "Red|#FF0000")
_ArrayAdd($aArray_Colors, "RosyBrown|#BC8F8F")
_ArrayAdd($aArray_Colors, "RoyalBlue|#4169E1")
_ArrayAdd($aArray_Colors, "SaddleBrown|#8B4513")
_ArrayAdd($aArray_Colors, "Salmon|#FA8072")
_ArrayAdd($aArray_Colors, "SandyBrown|#F4A460")
_ArrayAdd($aArray_Colors, "SeaGreen|#2E8B57")
_ArrayAdd($aArray_Colors, "SeaShell|#FFF5EE")
_ArrayAdd($aArray_Colors, "Sienna|#A0522D")
_ArrayAdd($aArray_Colors, "Silver|#C0C0C0")
_ArrayAdd($aArray_Colors, "SkyBlue|#87CEEB")
_ArrayAdd($aArray_Colors, "SlateBlue|#6A5ACD")
_ArrayAdd($aArray_Colors, "SlateGray|#708090")
_ArrayAdd($aArray_Colors, "SlateGrey|#708090")
_ArrayAdd($aArray_Colors, "Snow|#FFFAFA")
_ArrayAdd($aArray_Colors, "SpringGreen|#00FF7F")
_ArrayAdd($aArray_Colors, "SteelBlue|#4682B4")
_ArrayAdd($aArray_Colors, "Tan|#D2B48C")
_ArrayAdd($aArray_Colors, "Teal|#008080")
_ArrayAdd($aArray_Colors, "Thistle|#D8BFD8")
_ArrayAdd($aArray_Colors, "Tomato|#FF6347")
_ArrayAdd($aArray_Colors, "Turquoise|#40E0D0")
_ArrayAdd($aArray_Colors, "Violet|#EE82EE")
_ArrayAdd($aArray_Colors, "Wheat|#F5DEB3")
_ArrayAdd($aArray_Colors, "White|#FFFFFF")
_ArrayAdd($aArray_Colors, "WhiteSmoke|#F5F5F5")
_ArrayAdd($aArray_Colors, "Yellow|#FFFF00")
_ArrayAdd($aArray_Colors, "YellowGreen|#9ACD32")

FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End '_ArrayAdd' Colors")
;_ArrayDisplay($aArray_Colors, "2D - Item delimited")



;Global $Colors_ALL_Combo = "AliceBlue"&"|"&"AntiqueWhite"&"|"&"Aqua"&"|"&"Aquamarine"&"|"&"Azure"&"|"&"Beige"&"|"&"Bisque"&"|"&"Black"&"|"&"BlanchedAlmond"&"|"&"Blue"&"|"&"BlueViolet"&"|"&"Brown"&"|"&"BurlyWood"&"|"&"CadetBlue"&"|"&"Chartreuse"&"|"&"Chocolate"&"|"&"Coral"&"|"&"CornflowerBlue"&"|"&"Cornsilk"&"|"&"Crimson"&"|"&"Cyan"&"|"&"DarkBlue"&"|"&"DarkCyan"&"|"&"DarkGoldenRod"&"|"&"DarkGray"&"|"&"DarkGrey"&"|"&"DarkGreen"&"|"&"DarkKhaki"&"|"&"DarkMagenta"&"|"&"DarkOliveGreen"&"|"&"DarkOrange"&"|"&"DarkOrchid"&"|"&"DarkRed"&"|"&"DarkSalmon"&"|"&"DarkSeaGreen"&"|"&"DarkSlateBlue"&"|"&"DarkSlateGray"&"|"&"DarkSlateGrey"&"|"&"DarkTurquoise"&"|"&"DarkViolet"&"|"&"DeepPink"&"|"&"DeepSkyBlue"&"|"&"DimGray"&"|"&"DimGrey"&"|"&"DodgerBlue"&"|"&"FireBrick"&"|"&"FloralWhite"&"|"&"ForestGreen"&"|"&"Fuchsia"&"|"&"Gainsboro"&"|"&"GhostWhite"&"|"&"Gold"&"|"&"GoldenRod"&"|"&"Gray"&"|"&"Grey"&"|"&"Green"&"|"&"GreenYellow"&"|"&"HoneyDew"&"|"&"HotPink"&"|"&"IndianRed "&"|"&"Indigo "&"|"&"Ivory"&"|"&"Khaki"&"|"&"Lavender"&"|"&"LavenderBlush"&"|"&"LawnGreen"&"|"&"LemonChiffon"&"|"&"LightBlue"&"|"&"LightCoral"&"|"&"LightCyan"&"|"&"LightGoldenRodYellow"&"|"&"LightGray"&"|"&"LightGrey"&"|"&"LightGreen"&"|"&"LightPink"&"|"&"LightSalmon"&"|"&"LightSeaGreen"&"|"&"LightSkyBlue"&"|"&"LightSlateGray"&"|"&"LightSlateGrey"&"|"&"LightSteelBlue"&"|"&"LightYellow"&"|"&"Lime"&"|"&"LimeGreen"&"|"&"Linen"&"|"&"Magenta"&"|"&"Maroon"&"|"&"MediumAquaMarine"&"|"&"MediumBlue"&"|"&"MediumOrchid"&"|"&"MediumPurple"&"|"&"MediumSeaGreen"&"|"&"MediumSlateBlue"&"|"&"MediumSpringGreen"&"|"&"MediumTurquoise"&"|"&"MediumVioletRed"&"|"&"MidnightBlue"&"|"&"MintCream"&"|"&"MistyRose"&"|"&"Moccasin"&"|"&"NavajoWhite"&"|"&"Navy"&"|"&"OldLace"&"|"&"Olive"&"|"&"OliveDrab"&"|"&"Orange"&"|"&"OrangeRed"&"|"&"Orchid"&"|"&"PaleGoldenRod"&"|"&"PaleGreen"&"|"&"PaleTurquoise"&"|"&"PaleVioletRed"&"|"&"PapayaWhip"&"|"&"PeachPuff"&"|"&"Peru"&"|"&"Pink"&"|"&"Plum"&"|"&"PowderBlue"&"|"&"Purple"&"|"&"RebeccaPurple"&"|"&"Red"&"|"&"RosyBrown"&"|"&"RoyalBlue"&"|"&"SaddleBrown"&"|"&"Salmon"&"|"&"SandyBrown"&"|"&"SeaGreen"&"|"&"SeaShell"&"|"&"Sienna"&"|"&"Silver"&"|"&"SkyBlue"&"|"&"SlateBlue"&"|"&"SlateGray"&"|"&"SlateGrey"&"|"&"Snow"&"|"&"SpringGreen"&"|"&"SteelBlue"&"|"&"Tan"&"|"&"Teal"&"|"&"Thistle"&"|"&"Tomato"&"|"&"Turquoise"&"|"&"Violet"&"|"&"Wheat"&"|"&"White"&"|"&"WhiteSmoke"&"|"&"Yellow"&"|"&"YellowGreen"



Global $Colors_ALL_Combo = ""
For $Loop = 1 To $NR_Colors
	$Colors_ALL_Combo = $Colors_ALL_Combo & $aArray_Colors[$Loop][0] & "|"
Next

;MsgBox(0, "$Colors_ALL_Combo", $Colors_ALL_Combo)


#EndRegion


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

Local $Check_File = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\" & $SteamVR_Environment_Name & "\temp\log.txt"
If FileExists($Check_File) Then FileDelete($Check_File)


#Region Start Check
Local $Parameter_1 = ""
If $CmdLine[0] Then
	$Parameter_1 = $CmdLine[1]
EndIf

If $Parameter_1 = "Check_PO_Data" Then
	Local $HL_TimeDiff = IniRead($Config_INI, "TEMP", "HL_TimeDiff", "")
	;MsgBox(0, "", @MIN & @CRLF & $HL_TimeDiff + 5 )
	If @MIN > $HL_TimeDiff + 5 Then
		_Check_PO_Data_on_Start()
		IniWrite($Config_INI, "TEMP", "HL_State", "take_over_PO")
		IniWrite($Config_INI, "TEMP", "HL_TimeDiff", @MIN)
	Else
		If @MIN < $HL_TimeDiff - 5 Then
			_Check_PO_Data_on_Start()
			IniWrite($Config_INI, "TEMP", "HL_State", "take_over_PO")
			IniWrite($Config_INI, "TEMP", "HL_TimeDiff", @MIN)
		Else
			IniWrite($Config_INI, "TEMP", "HL_State", "")
		EndIf
	EndIf
	Exit
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

	If $Parameter_1 = "UpdateLibrary" Then
		$ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
		If $HomeApp = "VR Toolbox" Then _Create_VRToolBox_VideoPage()
		;_Exit_Check()

		If $ScanLibrary_OnStart_SettingValue = "true" Then
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start UpdateLibrary:")
			_Button_ReScan_Steam_Library_AutoUpdate()
		EndIf
		;MsgBox(0, "1", "UpdateOverlay fertig")
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

	If $Parameter_1 = "UpdateLibrary" Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Scan/Updating:")
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (577) :(' & @MIN & ':' & @SEC & ') _First_Start_Empty_Check_1()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (700) :(' & @MIN & ':' & @SEC & ') _HLL_Detect_SteamVR_Files()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (738) :(' & @MIN & ':' & @SEC & ') _Loading_GUI()' & @CR) ;### Function Trace
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

Func _Preparing_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (761) :(' & @MIN & ':' & @SEC & ') _Preparing_GUI()' & @CR) ;### Function Trace
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	$GUI_Preparing = GUICreate("Preparing...please wait...", 250, 65, -1, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	GUISetIcon(@AutoItExe, -2, $GUI_Preparing)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	GUICtrlCreateLabel("...Preparing...", 58, 5, 152, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)
	GUICtrlCreateLabel("...Please wait...", 49, 32, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)

	GUISetState(@SW_SHOW, $GUI_Preparing)
	WinSetOnTop("Preparing...please wait...", "", $WINDOWS_ONTOP)
EndFunc   ;==>_Loading_GUI

Func _Exit_Preparing_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (782) :(' & @MIN & ':' & @SEC & ') _Exit_Preparing_GUI()' & @CR) ;### Function Trace
	GUIDelete($GUI_Preparing)
EndFunc   ;==>_Loading_GUI

Func _Create_HLL_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (787) :(' & @MIN & ':' & @SEC & ') _Create_HLL_GUI()' & @CR) ;### Function Trace
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
	GUICtrlSetTip(-1, "Shows a preview Icon for the selected application.")

	Global $Button_AddGame2Library = GUICtrlCreateButton("Add Game to Library", 215, $DesktopHeight - 107, 102, 80, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_AddGame2Library, $gfx & "AddGame2Library.bmp")
	GUICtrlSetTip(-1, "Add Game to the Home Loader Library." & @CRLF & "It will show up in the Non-Library Appl. category.")

	Global $Button_ReScan_Steam_Library = GUICtrlCreateButton("Rescan Library", 4, 5, 207, 42, $BS_BITMAP) ; 155, 80 --> 174, 71
	_GUICtrlButton_SetImage($Button_ReScan_Steam_Library, $gfx & "ReScan_SteamLibrary.bmp")
	GUICtrlSetTip(-1, "Scans for all content." & @CRLF & @CRLF & _
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
	GUICtrlSetTip(-1, "Shows only VR Apps" & @CRLF & "[and with an new Scan it scans only for VR Apps]." & @CRLF)
	GUICtrlSetFont(-1, 19)
	GUICtrlSetOnEvent(-1, "_Checkbox_Show_OnlyVR_Apps")
	Global $Checkbox_ScanOnlyVR_Label = GUICtrlCreateLabel("Only VR Apps", 153 + 93, 15, 160, 30) ; ; +26
	GUICtrlSetTip(-1, "Shows only VR Apps" & @CRLF & "[and with an new Scan it scans only for VR Apps]." & @CRLF)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_Checkbox_Show_OnlyVR_Apps")



	GUICtrlCreateLabel("", 220, 48, 21, 22)
	GUICtrlSetBkColor(-1, 0)
	GUICtrlSetState(-1, $GUI_DISABLE)
	Local $State_Checkbox_ScanAll = "", $Checkbox_ScanOAll_Label = ""
	If $ScanOnlyVR = "false" Then $State_Checkbox_ScanAll = "X"
	If $ScanOnlyVR <> "false" Then $State_Checkbox_ScanAll = ""
	Global $Checkbox_ScanAll = GUICtrlCreateLabel($State_Checkbox_ScanAll, 160 + 61, 48 + 1, 19, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetTip(-1, "Shows All VR Apps" & @CRLF & "[and with an new scan it scans for All Apps]." & @CRLF)
	GUICtrlSetFont(-1, 19)
	GUICtrlSetOnEvent(-1, "_Checkbox_Show_All_Apps")
	Global $Checkbox_ScanAll_Label = GUICtrlCreateLabel("All Apps", 153 + 93, 46, 95, 30) ; ; +26
	GUICtrlSetTip(-1, "Shows All VR Apps" & @CRLF & "[and with an new scan it scans for All Apps]." & @CRLF)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_Checkbox_Show_All_Apps")




	Global $Checkbox_ScanLibrary_OnStart_Value = ""
	If $ScanLibrary_OnStart_SettingValue = "true" Then $Checkbox_ScanLibrary_OnStart_Value = "a"
	Global $Checkbox_ScanLibrary_OnStart = GUICtrlCreateLabel($Checkbox_ScanLibrary_OnStart_Value, 440, 05, 15, 15, 0x1201)
	GUICtrlSetTip(-1, "Scans for all content everytime the HomeApp is started." & @CRLF & @CRLF & _
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
	GUICtrlSetTip(-1, "Scans for all content everytime the HomeApp is started." & @CRLF & @CRLF & _
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

	Global $Button_More_Scan_Options = GUICtrlCreateButton("More Settings", 439, 62, 185, 24, $BS_BITMAP)
	GUICtrlSetColor(-1, "0x0000CD")
	GUICtrlSetFont(-1, 10, 600, 2, "arial")
	GUICtrlSetTip(-1, "Opens the Settings Windows that includes more HomeLoader related settings.")
	_RM_More_Scan_Options()


	Global $Button_ResolutionScale = GUICtrlCreateButton("Resolution Scale", 440, $DesktopHeight - 107, 96, 37, $BS_BITMAP) ; 440, $DesktopHeight - 100, 96, 42
	_GUICtrlButton_SetImage($Button_ResolutionScale, $gfx & "ResolutionScale.bmp")
	GUICtrlSetTip(-1, "Shows the HomeLoader Resolution Scale Window. Select the game in the List View of the HomeLoader Library Window.")

	Global $Button_HomeLoaderSettings = GUICtrlCreateButton("Home Loader settings", 440, $DesktopHeight - 65, 96, 37, $BS_BITMAP) ; 440, $DesktopHeight - 100, 96, 42
	_GUICtrlButton_SetImage($Button_HomeLoaderSettings, $gfx & "HomeLoaderSettings.bmp")
	GUICtrlSetTip(-1, "Shows the HomeLoader Start Settings Window where it is possible to change the Home App.")

	Global $Button_SteamVRHome_Panel_Settings = GUICtrlCreateButton("SteamVR Home Panel Setting", 539, $DesktopHeight - 107, 102, 80, $BS_BITMAP) ; 440, $DesktopHeight - 100, 96, 42
	_GUICtrlButton_SetImage($Button_SteamVRHome_Panel_Settings, $gfx & "SteamVRHome_Panel_Settings.bmp")
	GUICtrlSetTip(-1, "Shows the Settings Window for the SteamVR Home Environment settings.")

	;Global $Button_Settings = GUICtrlCreateButton("Settings", 590, $DesktopHeight - 100, 65, 65, $BS_BITMAP)
	;_GUICtrlButton_SetImage($Button_Settings, $gfx & "Settings.bmp")
	;GUICtrlSetTip(-1, "Settings." & @CRLF & @CRLF & "Includes:" & @CRLF & "- Steam Library Folders" & @CRLF & "- Icon Folders")

	Global $Button_Restart = GUICtrlCreateButton("Restart", 660, $DesktopHeight - 100, 65, 65, $BS_BITMAP) ;
	_GUICtrlButton_SetImage($Button_Restart, $gfx & "Restart.bmp")
	GUICtrlSetTip(-1, "Restart.")

	Global $Button_Exit = GUICtrlCreateButton("Exit", 730, $DesktopHeight - 100, 65, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Exit, $gfx & "Exit.bmp")
	GUICtrlSetTip(-1, "Close.")

	_RM_Button_SteamVRHome_Panel_Settings()


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
	GUICtrlSetTip(-1, "Checks the checkbox for all application in the List View of the current category.")
	Global $Checkbox_CreatePage_Label = GUICtrlCreateLabel("All", 30, $DesktopHeight - 78, 35, 20)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")
	GUICtrlSetTip(-1, "Checks the checkbox for all application in the List View of the current category.")


	Global $Button_ShowGamePage_1 = GUICtrlCreateButton("Game Page Mode", 335, $DesktopHeight - 107, 102, 80, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_ShowGamePage_1, $gfx & "GamePageMode.bmp")
	GUICtrlSetTip(-1, "Opens HomeLoader in the Game Page Mode. This Mode can be used after the Library was scanned." & @CRLF)

	;Global $Button_ShowGamePage_2 = GUICtrlCreateButton("Show Game Page", 325, $DesktopHeight - 65, 80, 38, $BS_BITMAP)
	;_GUICtrlButton_SetImage($Button_ShowGamePage_2, $gfx & "GamePage.bmp")
	;GUICtrlSetTip(-1, "Opens the Game Page for the current selection in the List View." & @CRLF)


	Global $ElementeUntenGroup = GUICtrlCreateGroup("Add Game to Category", 70, $DesktopHeight - 114, 143, 88)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 9, 400, 6, $font_arial)

	Global $Combo_Add_to_Custom = GUICtrlCreateCombo("Choose Category", 76, $DesktopHeight - 95, 130, 32, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, $TAB3_Label & "|" & $TAB4_Label & "|" & $TAB5_Label & "|" & $TAB6_Label, "")
	GUICtrlSetFont(-1, 12, 400, 2, "arial")
	GUICtrlSetTip(-1, "Choose the Category where you want to add the games to.")

	Global $Button_Add_to_Custom = GUICtrlCreateButton("Add to Custom", 75, $DesktopHeight - 63, 133, 32, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Add_to_Custom, $gfx & "Add_to_Custom.bmp")
	GUICtrlSetTip(-1, "Adds selected games to choose Category.")


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
	;GUICtrlSetOnEvent($Button_Settings, "_Write_ResolutionScale_OVERLAY_to_SteamVR_VRSettings")
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

	GUICtrlSetOnEvent($Button_SteamVRHome_Panel_Settings, "_Button_SteamVRHome_Panel_Settings")
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

	Global $Scan_Duration = IniRead($Config_INI, "TEMP", "Scan_Duration", "")
	If $Scan_Duration = "Scanning..." Then $Scan_Duration = ""
	If $Scan_Duration <> "" Then $Scan_Duration = "Library was scanned in: " & $Scan_Duration
	IniWrite($Config_INI, "TEMP", "Scan_Duration", "")

	$NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & $Scan_Duration & @TAB & "Apps: " & $NR_ApplicationsCheck & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	If $Autostart_VRUB = "true" Then _GUICtrlStatusBar_SetText($Statusbar, "HomeLoader OVERLAY [VRUB] is enabled..." & "   " & "" & @TAB & "Apps: " & $NR_ApplicationsCheck & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
EndFunc

Func _HLL_Settings_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (1155) :(' & @MIN & ':' & @SEC & ') _HLL_Settings_GUI()' & @CR) ;### Function Trace
	$Checkbox_ScanLibrary_OnStart_Value = ""
	$Checkbox_Request_Steamdb_info_Value = ""
	$Checkbox_Use_Steam_Tags_Value = ""
	$Checkbox_ScanVIVEApps_Value = ""
	$Checkbox_ScanOculusApps_Value = ""
	$Checkbox_Sort_Alphabetical_order_Value = ""
	$Checkbox_Add_Apps_Tags_to_categories_Value = ""
	$Checkbox_Allow_Multiple_Tag_Assignments_Value = ""
	$Checkbox_Add_PlayersOnline_to_Icons_Value = ""
	$Checkbox_Add_SS_to_Icons_Value = ""
	$Checkbox_Add_SS_per_game_Value = ""
	$Checkbox_Create_HTML_GamePage_Value = ""
	$Checkbox_Create_SteamVR_Home_Panels_Value = ""
	$Checkbox_DeleteHomeLoaderLibraryData_Value = ""

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
	$Create_SteamVR_Home_Panels = IniRead($Config_INI, "Settings", "Create_SteamVR_Home_Panels", "")

	Local $Value_SSD_SetSoundDevice = IniRead($Config_INI, "Settings", "SSD_SetSoundDevice", "")

	Global $HEIGHT_GUI = 800 ; 505
	Global $POS_X_1 = 0
	Global $POS_Y_1 = 0
	Global $POS_Y_2 = 470
	Global $POS_Y_3 = 655

	Global $POS_Y_Button_Open_SSD_SetSoundDevice = 505
	Global $POS_Y_Button_Combo_Playback = $POS_Y_Button_Open_SSD_SetSoundDevice + 30
	Global $POS_Y_Button_Combo_Record = $POS_Y_Button_Combo_Playback + 30
	Global $POS_Y_Button_Exit_Settings_GUI = 760

	Global $Width_Group_1 = 531
	Global $Width_Group_2 = 531
	Global $Width_Group_3 = 531
	Global $HEIGHT_Group_1 = 455
	Global $HEIGHT_Group_2 = 180
	Global $HEIGHT_Group_3 = 98


	$Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
	$Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
	$Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")

	$HLL_Settings_GUI = GUICreate("Settings", 540, $HEIGHT_GUI, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))


	GUICtrlCreateGroup("Scan Options", $POS_X_1 + 5, $POS_Y_1 + 5, $Width_Group_1, $HEIGHT_Group_1)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	$POS_Y_1 = 40
	If $ScanLibrary_OnStart_SettingValue = "true" Then $Checkbox_ScanLibrary_OnStart_Value = "a"
	Global $Checkbox_Settings_1 = GUICtrlCreateLabel($Checkbox_ScanLibrary_OnStart_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetTip(-1, "If it is enabled then it will Scan your Libraries in the background after SteamVR has been started." & @CRLF & "SteamVR Home App needs to be selected [for example 'SteamVR'] for this function to work." & @CRLF)
	GUICtrlSetOnEvent(-1, "_Checkbox_ScanLibrary_OnStart")
	Global $Checkbox_Settings_1_Label = GUICtrlCreateLabel("Scan with HomeApp Start", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetTip(-1, "If it is enabled then it will Scan your Libraries in the background after SteamVR has been started." & @CRLF & "SteamVR Home App needs to be selected [for example 'SteamVR'] for this function to work." & @CRLF)
	GUICtrlSetOnEvent(-1, "_Checkbox_ScanLibrary_OnStart")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Request_Steamdb_info = "true" Then $Checkbox_Request_Steamdb_info_Value = "a"
	Global $Checkbox_Settings_2 = GUICtrlCreateLabel($Checkbox_Request_Steamdb_info_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_Checkbox_Request_Steamdb_info")
	Global $Checkbox_Settings_2_Label = GUICtrlCreateLabel("Request Steamdb Info", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_Checkbox_Request_Steamdb_info")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Use_Steam_Tags = "true" Then $Checkbox_Use_Steam_Tags_Value = "a"
	Global $Checkbox_Settings_3 = GUICtrlCreateLabel($Checkbox_Use_Steam_Tags_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_Checkbox_Use_Steam_Tags")
	Global $Checkbox_Settings_3_Label = GUICtrlCreateLabel("Request Steamdb Tags", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_Checkbox_Use_Steam_Tags")

	$POS_Y_1 = $POS_Y_1 + 30
	If $ScanVIVEApps = "true" Then $Checkbox_ScanVIVEApps_Value = "a"
	Global $Checkbox_Settings_4 = GUICtrlCreateLabel($Checkbox_ScanVIVEApps_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanViveData")
	Global $Checkbox_Settings_4_Label = GUICtrlCreateLabel("Scan for Viveport Apps", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanViveData")

	$POS_Y_1 = $POS_Y_1 + 30
	If $ScanOculusApps = "true" Then $Checkbox_ScanOculusApps_Value = "a"
	Global $Checkbox_Settings_5 = GUICtrlCreateLabel($Checkbox_ScanOculusApps_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanOculusData")
	Global $Checkbox_Settings_5_Label = GUICtrlCreateLabel("Scan for Oculus Apps", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanOculusData")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Sort_Alphabetical_order = "true" Then $Checkbox_Sort_Alphabetical_order_Value = "a"
	Global $Checkbox_Settings_6 = GUICtrlCreateLabel($Checkbox_Sort_Alphabetical_order_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Sort_Alphabetical_order")
	Global $Checkbox_Settings_6_Label = GUICtrlCreateLabel("Sort Apps in Alphabetical order", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Sort_Alphabetical_order")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Add_Apps_Tags_to_categories = "true" Then $Checkbox_Add_Apps_Tags_to_categories_Value = "a"
	Global $Checkbox_Settings_7 = GUICtrlCreateLabel($Checkbox_Add_Apps_Tags_to_categories_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Add_Apps_Tags_to_categories")
	Global $Checkbox_Settings_7_Label = GUICtrlCreateLabel("Add Apps based on their tags to the categories", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Add_Apps_Tags_to_categories")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Allow_Multiple_Tag_Assignments = "true" Then $Checkbox_Allow_Multiple_Tag_Assignments_Value = "a"
	Global $Checkbox_Settings_8 = GUICtrlCreateLabel($Checkbox_Allow_Multiple_Tag_Assignments_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Allow_Multiple_Tag_Assignments")
	Global $Checkbox_Settings_8_Label = GUICtrlCreateLabel("Allow multiple Tag assigments", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Allow_Multiple_Tag_Assignments")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Add_PlayersOnline_to_Icons = "true" Then $Checkbox_Add_PlayersOnline_to_Icons_Value = "a"
	Global $Checkbox_Settings_9 = GUICtrlCreateLabel($Checkbox_Add_PlayersOnline_to_Icons_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_PlayersOnline_to_Icons")
	Global $Checkbox_Settings_9_Label = GUICtrlCreateLabel("Add number of current Players to the game Icons", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_PlayersOnline_to_Icons")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Add_SS_to_Icons = "true" Then $Checkbox_Add_SS_to_Icons_Value = "a"
	Global $Checkbox_Settings_10 = GUICtrlCreateLabel($Checkbox_Add_SS_to_Icons_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_SS_to_Icons")
	Global $Checkbox_Settings_10_Label = GUICtrlCreateLabel("Add the Resolution Scale Value to the game Icons", $POS_X_1 + 38, $POS_Y_1 - 2, 490, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_SS_to_Icons")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Add_SS_per_game = "true" Then $Checkbox_Add_SS_per_game_Value = "a"
	Global $Checkbox_Settings_11 = GUICtrlCreateLabel($Checkbox_Add_SS_per_game_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_SS_per_game")
	Global $Checkbox_Settings_11_Label = GUICtrlCreateLabel("Allow Read/Write of the Resolution Scale Value", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Add_SS_per_game")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Create_HTML_GamePage = "true" Then $Checkbox_Create_HTML_GamePage_Value = "a"
	Global $Checkbox_Settings_12 = GUICtrlCreateLabel($Checkbox_Create_HTML_GamePage_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Create_HTML_GamePage")
	Global $Checkbox_Settings_12_Label = GUICtrlCreateLabel("Create HTML Game Pages", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Create_HTML_GamePage")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Create_SteamVR_Home_Panels = "true" Then $Checkbox_Create_SteamVR_Home_Panels_Value = "a"
	Global $Checkbox_Settings_13 = GUICtrlCreateLabel($Checkbox_Create_SteamVR_Home_Panels_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Create_SteamVR_Home_Panels")
	Global $Checkbox_Settings_13_Label = GUICtrlCreateLabel("Update all SteamVR Environment Files", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Create_SteamVR_Home_Panels")

	$POS_Y_1 = $POS_Y_1 + 30
	If $DeleteHomeLoaderLibraryData = "true" Then $Checkbox_DeleteHomeLoaderLibraryData_Value = "a"
	Global $Checkbox_Settings_14 = GUICtrlCreateLabel($Checkbox_DeleteHomeLoaderLibraryData_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_DeleteHomeLoaderLibraryData")
	Global $Checkbox_Settings_14_Label = GUICtrlCreateLabel("Delete old HomeLoader Library Data first", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_DeleteHomeLoaderLibraryData")




	GUICtrlCreateGroup("Sound Device", $POS_X_1 + 5, $POS_Y_2, $Width_Group_2, $HEIGHT_Group_2)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)


	Local $Button_Open_SSD_SetSoundDevice = GUICtrlCreateButton("Open SSD - SetSoundDevice [Create Shortcuts]", $POS_X_1 + 10, $POS_Y_Button_Open_SSD_SetSoundDevice, 380, 32, $BS_BITMAP)
	GUICtrlSetFont(-1, 13, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Button_Open_SSD_SetSoundDevice")


	Global $Checkbox_SSD_SetSoundDevice_1_value = ""
	If $Value_SSD_SetSoundDevice = "true" Then $Checkbox_SSD_SetSoundDevice_1_value = "a"
	Global $Checkbox_SSD_SetSoundDevice_1 = GUICtrlCreateLabel($Checkbox_SSD_SetSoundDevice_1_value, $POS_X_1 + 10, $POS_Y_Button_Open_SSD_SetSoundDevice + 45, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetTip(-1, "Sets the selected Sound Devices after SteamVR has been started." & @CRLF & "SteamVR Home App needs to be selected [for example 'SteamVR'] for this function to work." & @CRLF)
	GUICtrlSetOnEvent(-1, "_Checkbox_SSD_SetSoundDevice_1")
	Global $Checkbox_SSD_SetSoundDevice_1_Label = GUICtrlCreateLabel("Set Sound Device after SteamVR has started", $POS_X_1 + 38, $POS_Y_Button_Open_SSD_SetSoundDevice + 43, 450, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetTip(-1, "Sets the selected Sound Devices after SteamVR has been started." & @CRLF & "SteamVR Home App needs to be selected [for example 'SteamVR'] for this function to work." & @CRLF)
	GUICtrlSetOnEvent(-1, "_Checkbox_SSD_SetSoundDevice_1")


	GUICtrlCreateLabel("Playback Device", $POS_X_1 + 10, $POS_Y_Button_Open_SSD_SetSoundDevice + 80, 145, 20)
	GUICtrlSetFont(-1, 14, $FW_NORMAL, "", $font_2)
	Global $Combo_Playback_Device = GUICtrlCreateCombo("", $POS_X_1 + 160, $POS_Y_Button_Open_SSD_SetSoundDevice + 78, 229, 20)
	GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Combo_Playback_Device")

	Local $Button_Set_Playback_Device= GUICtrlCreateButton("Set Playback Dev.", $POS_X_1 + 395, $POS_Y_Button_Open_SSD_SetSoundDevice + 77, 135, 28)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Button_Set_Playback_Device")


	GUICtrlCreateLabel("Recording Device", $POS_X_1 + 10, $POS_Y_Button_Open_SSD_SetSoundDevice + 110, 145, 20)
	GUICtrlSetFont(-1, 14, $FW_NORMAL, "", $font_2)
	Global $Combo_Recording_Device = GUICtrlCreateCombo("", $POS_X_1 + 160, $POS_Y_Button_Open_SSD_SetSoundDevice + 108, 229, 22)
	GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Combo_Recording_Device")

	Local $Button_Set_Recording_Device= GUICtrlCreateButton("Set Recording Dev.", $POS_X_1 + 395, $POS_Y_Button_Open_SSD_SetSoundDevice + 107, 135, 28)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Button_Set_Recording_Device")


	GUICtrlCreateGroup("Update", $POS_X_1 + 5, $POS_Y_3, $Width_Group_3, $HEIGHT_Group_3)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	$POS_Y_3 = $POS_Y_3 + 35
	$Checkbox_Update_Check_OnStart_Value = ""
	If $Update_Check = "true" Then $Checkbox_Update_Check_OnStart_Value = "a"
	Global $Checkbox_Update_Check_1 = GUICtrlCreateLabel($Checkbox_Update_Check_OnStart_Value, $POS_X_1 + 10, $POS_Y_3, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_Checkbox_Update_Check_1")
	Global $Checkbox_Update_Check_1_Label = GUICtrlCreateLabel("Check for Update on start", $POS_X_1 + 38, $POS_Y_3 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_Checkbox_Update_Check_1")

	$POS_Y_3 = $POS_Y_3 + 25
	Local $Button_Update_Check_1 = GUICtrlCreateButton("Check for Update", $POS_X_1 + 10, $POS_Y_3, 200, 28)
	GUICtrlSetFont(-1, 13, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Button_Update_Check_1")


	Global $Button_PAYPAL_DONATE_Settings_GUI = GUICtrlCreateButton("Donate", $POS_X_1 + 5, $POS_Y_Button_Exit_Settings_GUI, 84, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(-1, "_Button_PAYPAL_DONATE_Settings_GUI")
	_GUICtrlButton_SetImage(-1, $gfx & "Paypal_Donate.bmp")
	GUICtrlSetTip(-1, "Closes GUI Window.")

	Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", $POS_X_1 + 500, $POS_Y_Button_Exit_Settings_GUI, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(-1, "_Button_Exit_Settings_GUI")
	_GUICtrlButton_SetImage(-1, $gfx & "Exit_small.bmp")
	GUICtrlSetTip(-1, "Closes GUI Window.")

	_Update_Objects_Settings_GUI()

	GUISetState()
	$Game_ID = ""
EndFunc   ;==>_Settings_GUI

Func _AddGame2Library_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (1450) :(' & @MIN & ':' & @SEC & ') _AddGame2Library_GUI()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (1528) :(' & @MIN & ':' & @SEC & ') _SS_GUI()' & @CR) ;### Function Trace
	If Not WinExists("Resolution Scale Menu") Then
		If $ScanOnlyVR <> "true" Then
			$ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		Else
			$ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
		EndIf

		$SS_Settings_GUI = GUICreate("Resolution Scale Menu", 285, 200, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

		Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview)
		$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
		Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

		Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview, $ListView_Selected_Row_Index)
		Local $Steam_app_Name = $ListView_Item_Array[3]
		Local $Game_ID = $ListView_Item_Array[2]

		Local $App_NR = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "NR", "")

		Local $ResolutionScale_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "ResolutionScale", "100")
		Local $motionSmoothingOverride_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "motionSmoothingOverride", "")
		Local $Checkbox_motionSmoothingOverride_Value = $motionSmoothingOverride_value


		; Group 1
		Local $Steam_app_Name_RS = StringLeft($Steam_app_Name, 16)
		If StringLen($Steam_app_Name) > 16 Then $Steam_app_Name_RS = $Steam_app_Name_RS & "..."
		$ResolutionScale_Group = GUICtrlCreateGroup("Scale [%] for: " & $Steam_app_Name_RS, 5, 5, 275, 150)
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

		If $Checkbox_motionSmoothingOverride_Value = "1" Then $Checkbox_motionSmoothingOverride_Value = "a"
		Global $SS_Checkbox_motionSmoothingOverride = GUICtrlCreateLabel($Checkbox_motionSmoothingOverride_Value, 15, 80, 20, 20, 0x1201)
		GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
		GUICtrlSetBkColor(-1, 0xFFFFFF)
		GUICtrlSetOnEvent(-1, "_SS_Checkbox_motionSmoothingOverride")
		Global $SS_Checkbox_motionSmoothingOverride_Label = GUICtrlCreateLabel("MotionSmoothingOverride", 43, 78, 230, 28)
		GUICtrlSetFont(-1, 15, 400, 1, "arial")
		GUICtrlSetOnEvent(-1, "_SS_Checkbox_motionSmoothingOverride")


		Global $SAVE_Button_Group_1 = GUICtrlCreateButton("SAVE", 10, 110, 264, 30)
		GUICtrlSetTip(-1, "Closes Settings Window.")
		GUICtrlSetFont(-1, 14, 600, 2, $font_arial)
		GUICtrlSetColor(-1, "0x006600")
		GUICtrlSetOnEvent($SAVE_Button_Group_1, "_Write_to_SteamVR_VRSettings")

		Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", 4, 160, 276, 35)
		GUICtrlSetTip(-1, "Closes GUI Window.")
		GUICtrlSetFont(-1, 17, 600, 2, $font_arial)
		GUICtrlSetColor(-1, "0x8B0000")
		GUICtrlSetOnEvent(-1, "_Button_Exit_SS_Settings_GUI")

		GUICtrlSetData($ResolutionScale_Group, "Scale [%] for: " & $Steam_app_Name_RS)
		;GUICtrlSetData($VRSettings_Group, "VR Settings - " & $Steam_app_Name)
		GUICtrlSetData($Slider_0, $ResolutionScale_value)
		GUICtrlSetData($Input_ResolutionScale, $ResolutionScale_value)

		GUISetState()
	EndIf
EndFunc   ;==>_SS_GUI

Func _Update_StatusBar()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (1603) :(' & @MIN & ':' & @SEC & ') _Update_StatusBar()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (1627) :(' & @MIN & ':' & @SEC & ') _Search_Files()' & @CR) ;### Function Trace
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
		$Array_Result = $FileList
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()
		Global $Application_NR = 1

		If IsArray($FileList) Then
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
	EndIf

	If $Combo = "ALL" Then
		If $NR_Library_temp = 1 Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		If $NR_Library_temp = 2 Then $s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
		If $NR_Library_temp = 3 Then $s_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
		If $NR_Library_temp = 4 Then $s_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
		If $NR_Library_temp = 5 Then $s_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"

		Local $FileList = _FileListToArray($s_LocalFolder, "*.acf", 1)
		$Array_Result = $FileList
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()
		Global $Application_NR = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "") + 1

		If IsArray($FileList) Then
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
		EndIf
		$FileList = ""
	EndIf
	;_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_Search_Files

Func _ApplicationList_Update()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (1705) :(' & @MIN & ':' & @SEC & ') _ApplicationList_Update()' & @CR) ;### Function Trace
	Global $File = $File_Path
	Global $Wert_Zeile = ""

	If $File = "" Then FileWriteLine($scan_log_FILE, "Variable '$File' empty:" & " - " & "_ApplicationList_Update() " & "[" & _Now() & "]")

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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (1839) :(' & @MIN & ':' & @SEC & ') _Get_ADD_PlayersOnline_DATA()' & @CR) ;### Function Trace
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
		;_INetGetSource($URL)

		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $URL, False)
			$WinHttpReq.SetRequestHeader("User-Agent", "Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16")
			$WinHttpReq.SetTimeouts(50, 50, 50, 50)
			If WinExists("HomeLoader - Library") Then _GUICtrlStatusBar_SetText($Statusbar, "" & "Steamdb Info: Retrieving URL... " & $URL & " - " & "   " & "Nr: " & $Check_NR & " - " & "" & $Check_name & "" & "" & @TAB & "" & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
			$WinHttpReq.Send()

			;$DataResponse = $WinHttpReq.ResponseText
			;MsgBox(0, "$DataResponse", $DataResponse)

			If @error Then
				MyErrFunc()
			Else
				If $WinHttpReq.Status <> 404 Then
					$DataResponse = $WinHttpReq.ResponseText
					;FileWrite(@ScriptDir & "\URL_TEST.txt", $DataResponse)

					;$DataResponse = FileRead(@ScriptDir & "\URL_TEST.txt")

					Local $iPosition_1 = StringInStr($DataResponse, '<li><strong>')
					Local $iPosition_2 = StringInStr($DataResponse, '</strong> all-time peak')
					Local $iPosition_3 = $iPosition_2 - $iPosition_1

					;MsgBox(0, "$iPosition_1", $iPosition_1 & @CRLF & $iPosition_2 & @CRLF & $iPosition_3)

					Local $sString = StringMid($DataResponse, $iPosition_1, $iPosition_3)
					Global $aArray = StringSplit($sString, '<li><strong>', $STR_ENTIRESPLIT)
					If @error Then
						$Array_Result = $aArray
						$ScriptLineNumber_Temp = @ScriptLineNumber
						$AtError_Result = @error
						_StringSplit_Error_Handler()
					EndIf

					;FileWrite(@ScriptDir & "\" & "TESTTEMP.txt", $DataResponse)

					;MsgBox(0, "$iPosition_1", $iPosition_1)
					;MsgBox(0, "$iPosition_3", $iPosition_3)
					;MsgBox(0, "$sString", $sString)
					;MsgBox(0, "$iPosition_3", $aArray[0] & @CRLF & $aArray[1] )


					If $aArray[0] > 1 Then
						Global $PlayersOnline_right_now = StringSplit($aArray[2], '<')
						If @error Then
							$Array_Result = $aArray
							$ScriptLineNumber_Temp = @ScriptLineNumber
							$AtError_Result = @error
							_StringSplit_Error_Handler()
						EndIf
						$PlayersOnline_right_now = $PlayersOnline_right_now[1]
						Global $PlayersOnline_24h_peak = StringSplit($aArray[3], '<')
						If @error Then
							$Array_Result = $aArray
							$ScriptLineNumber_Temp = @ScriptLineNumber
							$AtError_Result = @error
							_StringSplit_Error_Handler()
						EndIf
						$PlayersOnline_24h_peak = $PlayersOnline_24h_peak[1]
						Global $PlayersOnline_all_time_peak = StringSplit($aArray[4], '<')
						If @error Then
							$Array_Result = $aArray
							$ScriptLineNumber_Temp = @ScriptLineNumber
							$AtError_Result = @error
							_StringSplit_Error_Handler()
						EndIf
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

						Local $NR_Temp
						$NR_Temp = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Check_AppId, "NR", "")
						If $NR_Temp <> "" Then
							IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $NR_Temp, "right_now", $PlayersOnline_right_now)
							IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $NR_Temp, "24h_peak", $PlayersOnline_24h_peak)
							IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $NR_Temp, "all_time_peak", $PlayersOnline_all_time_peak)
						EndIf
						IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Check_AppId, "right_now", $PlayersOnline_right_now)
						IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Check_AppId, "24h_peak", $PlayersOnline_24h_peak)
						IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Check_AppId, "all_time_peak", $PlayersOnline_all_time_peak)

						$NR_Temp = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "NR", "")
						If $NR_Temp <> "" Then
							IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR_Temp, "right_now", $PlayersOnline_right_now)
							IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR_Temp, "24h_peak", $PlayersOnline_24h_peak)
							IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR_Temp, "all_time_peak", $PlayersOnline_all_time_peak)
						EndIf
						IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "right_now", $PlayersOnline_right_now)
						IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "24h_peak", $PlayersOnline_24h_peak)
						IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "all_time_peak", $PlayersOnline_all_time_peak)

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
									;MsgBox(0, "", $Check_AppId & @CRLF & $Array_Library[$Loop_Library][0])
									If $Check_AppId = $Array_Library[$Loop_Library][0] Then $App_in_Library = "true"
								Next
								;MsgBox(0, "", $Check_AppId & @CRLF & $App_in_Library)
							EndIf
							If $App_in_Library <> "true" Then _Get_SteamGame_Tags_for_SteamID()
							_Get_SteamGame_Tags_for_SteamID()
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2024) :(' & @MIN & ':' & @SEC & ') _Get_SteamGame_Tags()' & @CR) ;### Function Trace
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
				Local $INetGetSource_Check = _INetGetSource($URL)
				If $INetGetSource_Check = "" Then FileWriteLine($scan_log_FILE, "Could not Read '_INetGetSource' :" & $URL & "[" & _Now() & "]")
				Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
				If Not @error Then
					$WinHttpReq.Open("GET", $URL, False)
					$WinHttpReq.SetRequestHeader("User-Agent", "Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16")
					$WinHttpReq.SetTimeouts(50, 50, 50, 50)
					_GUICtrlStatusBar_SetText($Statusbar, "" & "Steam Tags: " & "Retrieving URL... " & $URL & " - " & "   " & "Nr: " & $Loop & " - " & "" & $Check_name & "" & "" & @TAB & "" & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
					$WinHttpReq.Send()

					If @error Then
						MyErrFunc()
					Else
						If $WinHttpReq.Status <> 404 Then
							Local $Data = $WinHttpReq.ResponseText

							;MsgBox(0, "_Get_SteamGame_Tags()", $Data)

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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2245) :(' & @MIN & ':' & @SEC & ') _Get_SteamGame_Tags_for_SteamID()' & @CR) ;### Function Trace
	Global $Check_AppId = $appid
	Global $Check_NR = IniRead($ApplicationList_TEMP, "Application_" & $appid, "NR", "")
	Global $Check_name = IniRead($ApplicationList_TEMP, "Application_" & $appid, "name", "")
	Global $Check_AppId = IniRead($ApplicationList_TEMP, "Application_" & $appid, "appid", "")
	Global $Check_right_now = IniRead($ApplicationList_TEMP, "Application_" & $appid, "right_now", "")
	Global $Check_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $appid, "24h_peak", "")
	Global $Check_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $appid, "all_time_peak", "")
	Global $Check_resolutionScale = IniRead($ApplicationList_TEMP, "Application_" & $appid, "resolutionScale", "")

	;MsgBox(0, "_Get_SteamGame_Tags_for_SteamID()", @ScriptDir & "\DataResponse.txt" & @CRLF & @CRLF & $DataResponse)
	;FileWrite(@ScriptDir & "\DataResponse.txt", $DataResponse)

	Local $iPosition_1 = StringInStr($DataResponse, '<h3>User Tags</h3>')
	Local $iPosition_2 = StringInStr($DataResponse, '<div class="tab-pane" id="info">', 0, 1, $iPosition_1)
	Local $iPosition_3 = $iPosition_2 - $iPosition_1

	Local $sString = StringMid($DataResponse, $iPosition_1, $iPosition_3)
	$sString = StringReplace($sString, '<h3>User Tags</h3>', '')
	$sString = StringReplace($sString, '<a class="btn btn-sm btn-outline btn-tag" href="/tags', '')
	$sString = StringReplace($sString, '/a>', '')
	$sString = StringReplace($sString, '</div>', '/?')

	;Local $Game_Tags = _StringBetween($sString, '/?', '/?', $STR_ENDNOTSTART)
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2432) :(' & @MIN & ':' & @SEC & ') _Write_PO_TEXT_2_Image()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2445) :(' & @MIN & ':' & @SEC & ') _Write_PO_Image_2_Image()' & @CR) ;### Function Trace
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

Func _Write_CategoryNameTemplate_2_Image()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2497) :(' & @MIN & ':' & @SEC & ') _Write_CategoryNameTemplate_2_Image()' & @CR) ;### Function Trace
	Local $CategoryNameTemplate = $gfx & "CategoryNameTemplate.jpg"
	_GDIPlus_Startup()
	Global $hImage = _GDIPlus_WTOB($CategoryNameTemplate, $InputBox, "Arial", 26, -1, 3, 0, 0, 0x000000, 1, 1)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()
	$InputBox = ""

	If FileExists(@ScriptDir & "\" & "WTOB.png") Then
		FileCopy(@ScriptDir & "\" & "WTOB.png", @ScriptDir & "\CategoryNameImage" & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		FileDelete(@ScriptDir & "\" & "WTOB.png")
	EndIf
	_Write_CategoryNameTemplate_Image_2_Image()
EndFunc   ;==>_Write_PO_TEXT_2_Image

Func _Write_CategoryNameTemplate_Image_2_Image()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2513) :(' & @MIN & ':' & @SEC & ') _Write_CategoryNameTemplate_Image_2_Image()' & @CR) ;### Function Trace
	Global $ImageSizeX = 460, $ImageSizeY = 215
	Global $FAVImageSizeX = 460, $FAVImageSizeY = 45 ; 80 , 60

	$hImage1_Path = $gfx & "CategoryTemplate" & ".jpg"
	$hImage2_Path = @ScriptDir & "\" & "CategoryNameImage.jpg"

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

	;_GDIPlus_GraphicsDrawRect($hGraphic, 1, 1, 80 + 3, 60 + 3, $hPen)

	GUIRegisterMsg(0xF, "MY_PAINT")
	GUIRegisterMsg(0x85, "MY_PAINT")

	;Save
	Local $NewIcon_Path
	If $TAB_NR_Temp = "3" Then $NewIcon_Path = $Install_DIR & "WebPage\images\GamePage1.png"
	If $TAB_NR_Temp = "4" Then $NewIcon_Path = $Install_DIR & "WebPage\images\GamePage2.png"
	If $TAB_NR_Temp = "5" Then $NewIcon_Path = $Install_DIR & "WebPage\images\GamePage3.png"
	If $TAB_NR_Temp = "6" Then $NewIcon_Path = $Install_DIR & "WebPage\images\GamePage4.png"

	If $NewIcon_Path = "" Then $NewIcon_Path = $Install_DIR & "WebPage\images\" & IniRead($Config_INI, "Settings", "TAB" & $TAB_NR_Temp & "_Name", "") & ".png"

	If $NewIcon_Path <> "" Then
		_GDIPlus_ImageSaveToFile($hBMPBuff, $NewIcon_Path)
	EndIf

	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()

	_Quit_PO_Image_2_Image()
EndFunc   ;==>_Write_PO_Image_2_Image

Func MY_PAINT($hWnd, $Msg, $wParam, $lParam)
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2572) :(' & @MIN & ':' & @SEC & ') MY_PAINT()' & @CR) ;### Function Trace
	Return $GUI_RUNDEFMSG
EndFunc   ;==>MY_PAINT

Func _Quit_PO_Image_2_Image()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2577) :(' & @MIN & ':' & @SEC & ') _Quit_PO_Image_2_Image()' & @CR) ;### Function Trace
	If FileExists(@ScriptDir & "\Icon_NR_Background" & ".jpg") Then FileDelete(@ScriptDir & "\Icon_NR_Background" & ".jpg")
	If FileExists(@ScriptDir & "\CategoryNameImage" & ".jpg") Then FileDelete(@ScriptDir & "\CategoryNameImage" & ".jpg")
	If FileExists(@ScriptDir & "\WTOB" & ".png") Then FileDelete(@ScriptDir & "\WTOB" & ".png")
	If FileExists($Install_DIR & "Icon_NR_Background" & ".jpg") Then FileDelete($Install_DIR & "Icon_NR_Background" & ".jpg")
	If FileExists($Install_DIR & "\CategoryNameImage" & ".jpg") Then FileDelete($Install_DIR & "CategoryNameImage" & ".jpg")
	If FileExists($Install_DIR & "WTOB" & ".png") Then FileDelete($Install_DIR & "WTOB" & ".png")
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()
EndFunc   ;==>_Quit_PO_Image_2_Image

Func _Get_AD_SS_Values_to_Icons()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2593) :(' & @MIN & ':' & @SEC & ') _Get_AD_SS_Values_to_Icons()' & @CR) ;### Function Trace
	Global $Check_AppId
	$ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
	If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
	Local $FileList = _FileListToArray($Icons & "460x215\", "*.jpg", 1)
	$Array_Result = $FileList
	If @error Then
		$ScriptLineNumber_Temp = @ScriptLineNumber
		$AtError_Result = @error
	EndIf
	If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()

	If IsArray($FileList) Then
		If $FileList <> "" Then
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start adding SS values to icons: " & "<.jpg Files found = " & $FileList[0] & ">")

			For $NR = 1 To $FileList[0]
				$Check_AppId = StringReplace($FileList[$NR], 'steam.app.', '')
				$Check_AppId = StringReplace($Check_AppId, '.jpg', '')

				Local $SS_Value_Check = IniRead($ApplicationList_TEMP, "Application_" & $Check_AppId, "resolutionScale", "")
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
	EndIf
EndFunc   ;==>_Get_AD_SS_Values_to_Icons

Func _Write_SS_TEXT_2_Image()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2629) :(' & @MIN & ':' & @SEC & ') _Write_SS_TEXT_2_Image()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2642) :(' & @MIN & ':' & @SEC & ') _Write_SS_Image_2_Image()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2693) :(' & @MIN & ':' & @SEC & ') _Quit_SS_Image_2_Image()' & @CR) ;### Function Trace
	If FileExists(@ScriptDir & "\Icon_NR_Background" & ".jpg") Then FileDelete(@ScriptDir & "\Icon_NR_Background" & ".jpg")
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()
EndFunc   ;==>_Quit_SS_Image_2_Image

Func _Get_SteamGame_Icon_32x32()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2704) :(' & @MIN & ':' & @SEC & ') _Get_SteamGame_Icon_32x32()' & @CR) ;### Function Trace
	Global $Check_AppId = $appid
	If $Check_AppId <> "" Then
		Local $URL = "https://steamdb.info/app/" & $appid & "/info/"
		$INetGetSource_Check = _INetGetSource($URL)
		If $INetGetSource_Check = "" Then FileWriteLine($scan_log_FILE, "Could not Read '_INetGetSource' :" & $URL & "[" & _Now() & "]")
		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $URL, False)
			$WinHttpReq.SetRequestHeader("User-Agent", "Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16")
			$WinHttpReq.Send()
			Local $Data = $WinHttpReq.ResponseText
			;FileWrite(@ScriptDir & "\URL_TEST.txt", $Data)

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
				;If $Download = 0 Then _URL_Download_Error_Handler()
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2756) :(' & @MIN & ':' & @SEC & ') _Get_SteamGame_Icon_256x256()' & @CR) ;### Function Trace
	Global $Check_AppId = $appid
	If $Check_AppId <> "" Then
		Global $Steam_AppId = $appid
		Local $URL = "https://steamdb.info/app/" & $appid & "/info/"
		$INetGetSource_Check = _INetGetSource($URL)
		If $INetGetSource_Check = "" Then FileWriteLine($scan_log_FILE, "Could not Read '_INetGetSource' :" & $URL & "[" & _Now() & "]")
		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $URL, False)
			$WinHttpReq.SetRequestHeader("User-Agent", "Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16")
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
				Local $InetGet_Temp = InetGet($URL, $Icons & "256x256\" & "steam.app." & $Steam_AppId & ".ico", 16, 0)
			If $InetGet_Temp = 0 Then _URL_Download_Error_Handler()
			EndIf
		Else
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Get_SteamGame_Icon_256x256()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
		EndIf
	EndIf
EndFunc   ;==>_Get_SteamGame_Icon_256x256

Func _Convert_Icon_32x32()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2791) :(' & @MIN & ':' & @SEC & ') _Convert_Icon_32x32()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2807) :(' & @MIN & ':' & @SEC & ') _Download_Icon_for_SteamGameID()' & @CR) ;### Function Trace
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
		If Not FileExists($Download_Icon_path_1_jpg) Then
			Local $InetGet_Temp = InetGet($URL, $Download_Icon_path_1_jpg, 16, 0)
			If $InetGet_Temp = 0 Then _URL_Download_Error_Handler()
			FileCopy($gfx & "Icon_Preview.jpg", $Download_Icon_path_1_jpg)
		EndIf
		If Not FileExists($Download_Icon_path_2_jpg) Then FileCopy($Download_Icon_path_1_jpg, $Download_Icon_path_2_jpg)
	EndIf
EndFunc   ;==>_Download_Icon_for_SteamGameID

Func _Sync_Icons()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2831) :(' & @MIN & ':' & @SEC & ') _Sync_Icons()' & @CR) ;### Function Trace
	Local $Icon_Folder_Sync
	Local $Icon_Folder_1 = $Install_DIR & "WebPage\images\"
	Local $Icon_Folder_2 = $VRUB_Folder & "addons\custom\HomeLoader\overlays\HomeLoader\images\"
	Local $Icon_Folder_3 = $Install_DIR & "WebPage\Tags\images\"
	Local $Icon_Folder_4 = $VRUB_Folder & "addons\custom\HomeLoader\overlays\HomeLoader\Tags\images\"

	Local $NR_Icons_Folders = 2
	If $Use_Steam_Tags = "true" Then $NR_Icons_Folders = 4

	Local $FileList = _FileListToArray($Icons, "*.jpg", 1)
	$Array_Result = $FileList
	If @error Then
		$ScriptLineNumber_Temp = @ScriptLineNumber
		$AtError_Result = @error
	EndIf
	If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()

	If IsArray($FileList) Then
		For $Loop_1 = 1 To $FileList[0]
			For $Loop_2 = 1 To $NR_Icons_Folders
				If $Loop_2 = 1 Then $Icon_Folder_Sync = $Icon_Folder_1
				If $Loop_2 = 2 Then $Icon_Folder_Sync = $Icon_Folder_2
				If $Loop_2 = 3 Then $Icon_Folder_Sync = $Icon_Folder_3
				If $Loop_2 = 4 Then $Icon_Folder_Sync = $Icon_Folder_4

				If FileExists($Icon_Folder_Sync) Then
					If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icon_Folder_Sync & $FileList[$Loop_1])
					If FileExists($Icons & "460x215\SS_Values\" & $FileList[$Loop_1]) Then FileCopy($Icons & "460x215\SS_Values\" & $FileList[$Loop_1], $Icon_Folder_Sync & $FileList[$Loop_1], $FC_OVERWRITE + $FC_CREATEPATH)
					If Not FileExists($Icons & "460x215\SS_Values\" & $FileList[$Loop_1]) Then FileCopy($Icons & "460x215\" & $FileList[$Loop_1], $Icon_Folder_Sync & $FileList[$Loop_1], $FC_OVERWRITE + $FC_CREATEPATH)
					If Not FileExists($Icons & "460x215\" & $FileList[$Loop_1]) Then FileCopy($Icons & $FileList[$Loop_1], $Icon_Folder_Sync & $FileList[$Loop_1], $FC_OVERWRITE + $FC_CREATEPATH)
					If Not FileExists($Icon_Folder_Sync & $FileList[$Loop_1]) Then FileCopy($gfx & "Icon_Preview.jpg", $Icon_Folder_Sync & $FileList[$Loop_1])
				EndIf
			Next
		Next
	EndIf
EndFunc   ;==>_Sync_Icons

#EndRegion Func MAIN

#Region Func MAIN GUI

Func _Create_ListView_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2871) :(' & @MIN & ':' & @SEC & ') _Create_ListView_1()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2949) :(' & @MIN & ':' & @SEC & ') _Create_ListView_2()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3025) :(' & @MIN & ':' & @SEC & ') _Create_ListView_3()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3101) :(' & @MIN & ':' & @SEC & ') _Create_ListView_4()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3177) :(' & @MIN & ':' & @SEC & ') _Create_ListView_5()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3236) :(' & @MIN & ':' & @SEC & ') _Create_ListView_6()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3295) :(' & @MIN & ':' & @SEC & ') _Read_from_INI_ADD_2_ListView()' & @CR) ;### Function Trace
	GUISetState(@SW_LOCK, $HLL_GUI)
	;MsgBox(0, "_Read_from_INI_ADD_2_ListView()", "_Read_from_INI_ADD_2_ListView()")
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')
	$Status_Combo_ApplicationList = IniRead($Config_INI, "Settings", "MainCategory", "")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $Parameter_Temp = "UpdateLibrary" Then $Status_Combo_ApplicationList = "ALL Categories"

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

	;MsgBox(0, "", $NR_Applications - 1)

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
	GUISetState(@SW_UNLOCK, $HLL_GUI)
EndFunc   ;==>_Read_from_INI_ADD_2_ListView

Func _Update_ListView_Icons()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3414) :(' & @MIN & ':' & @SEC & ') _Update_ListView_Icons()' & @CR) ;### Function Trace
	GUISetState(@SW_LOCK, $HLL_GUI)
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
	GUISetState(@SW_UNLOCK, $HLL_GUI)
EndFunc   ;==>_Update_ListView_Icons

Func _ADD_Icons_32x32_to_ListView()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3494) :(' & @MIN & ':' & @SEC & ') _ADD_Icons_32x32_to_ListView()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3556) :(' & @MIN & ':' & @SEC & ') _Set_States()' & @CR) ;### Function Trace
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
	$Create_SteamVR_Home_Panels = IniRead($Config_INI, "Settings", "Create_SteamVR_Home_Panels", "")
	$Update_Check = IniRead($Config_INI, "Settings", "Update_Check", "")

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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3601) :(' & @MIN & ':' & @SEC & ') _RM_Button_Scan()' & @CR) ;### Function Trace
	Global $contextmenu_Button_Scan = GUICtrlCreateContextMenu($Button_ReScan_Steam_Library)
	Global $RM_Button_Scan_Item_1_1 = GUICtrlCreateMenuItem("Scan", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_Button_ReScan_Steam_Library")
	Global $RM_Button_Scan_Item_1_2 = GUICtrlCreateMenuItem("Scan Viveport Apps", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Button_Scan_Item_1_2")
	Global $RM_Button_Scan_Item_1_3 = GUICtrlCreateMenuItem("Scan Oculus Apps", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Button_Scan_Item_1_3")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
	Global $RM_Button_Scan_Item_2 = GUICtrlCreateMenuItem("Fetch Steamdb Info", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Button_Scan_Item_2")
	Global $RM_Button_Scan_Item_3 = GUICtrlCreateMenuItem("Fetch Steamdb Tags", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Button_Scan_Item_3")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
	Global $RM_Button_Scan_Item_4 = GUICtrlCreateMenuItem("Create HTML Game Pages [All Apps]", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Create_HTML_GamePages_All")
	Global $RM_Button_Scan_Item_5 = GUICtrlCreateMenuItem("Create HTML Game Pages [Selected Apps]", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Create_HTML_GamePages_Selected")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
	Global $RM_Button_Scan_Item_6 = GUICtrlCreateMenuItem("Update all SteamVR Environment Files", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_SteamVR_Home_Game_Panels_ALL")
	;Global $RM_Button_Scan_Item_7 = GUICtrlCreateMenuItem("Create SteamVR Home Game Panels [Selected Apps]", $contextmenu_Button_Scan)
	;GUICtrlSetOnEvent(-1, "_RM_SteamVR_Home_Game_Panels_Selected")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
	Global $RM_Button_Scan_Item_8 = GUICtrlCreateMenuItem("Delete Category Pages", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Delete_Category_Pages")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
EndFunc   ;==>_RM_Button_Scan


Func _RM_Button_Scan_Item_1_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3632) :(' & @MIN & ':' & @SEC & ') _RM_Button_Scan_Item_1_2()' & @CR) ;### Function Trace
	_ScanViveData()
	_Sync_All_INI_Files_1()
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _RM_Button_Scan_Item_1_3()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3639) :(' & @MIN & ':' & @SEC & ') _RM_Button_Scan_Item_1_3()' & @CR) ;### Function Trace
	_ScanOculusData()
	_Sync_All_INI_Files_1()
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _RM_Button_Scan_Item_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3646) :(' & @MIN & ':' & @SEC & ') _RM_Button_Scan_Item_2()' & @CR) ;### Function Trace
	_RM_Button_Scan_Get_PO_Data()
	_Sync_All_INI_Files_1()
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _RM_Button_Scan_Item_3()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3653) :(' & @MIN & ':' & @SEC & ') _RM_Button_Scan_Item_3()' & @CR) ;### Function Trace
	_RM_Scan_Fetch_Steamdb_Tags()
	_Sync_All_INI_Files_1()
	_Read_from_INI_ADD_2_ListView()
EndFunc



Func _RM_Button_Scan_Get_PO_Data()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3662) :(' & @MIN & ':' & @SEC & ') _RM_Button_Scan_Get_PO_Data()' & @CR) ;### Function Trace
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
				;If StringLeft($appid, 5) = "HLNSG" Then $Non_Steam_App = "true"
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
	_Sync_All_INI_Files_1()
EndFunc   ;==>_RM_Button_Scan_Get_PO_Data

Func _RM_More_Scan_Options()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3711) :(' & @MIN & ':' & @SEC & ') _RM_More_Scan_Options()' & @CR) ;### Function Trace
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

	Global $RM_More_Scan_Options_Item_9 = GUICtrlCreateMenuItem("Update all SteamVR Environment Files", $contextmenu_More_Scan_Options)
	If $Create_SteamVR_Home_Panels = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Create_SteamVR_Home_Panels")

	Global $RM_More_Scan_Options_Item_10 = GUICtrlCreateMenuItem("Delete old HomeLoader Library Data first", $contextmenu_More_Scan_Options)
	If $DeleteHomeLoaderLibraryData = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	If $Autostart_VRUB = "true" Then GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_DeleteHomeLoaderLibraryData")
	GUICtrlCreateMenuItem("", $Button_More_Scan_Options)
EndFunc   ;==>_RM_More_Scan_Options

Func _RM_Buttons()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3768) :(' & @MIN & ':' & @SEC & ') _RM_Buttons()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5380) :(' & @MIN & ':' & @SEC & ') _RM_Button_Item_3_1()' & @CR) ;### Function Trace
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_1)
	$InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB3_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_1, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB3_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_1, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB3_Name", $InputBox)
		$TAB_NR_Temp = "3"
		_Write_CategoryNameTemplate_2_Image()
	EndIf
EndFunc   ;==>_RM_Button_Item_3_1

Func _RM_Button_Item_4_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5395) :(' & @MIN & ':' & @SEC & ') _RM_Button_Item_4_1()' & @CR) ;### Function Trace
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_2)
	$InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB4_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_2, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB4_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_2, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB4_Name", $InputBox)
		$TAB_NR_Temp = "4"
		_Write_CategoryNameTemplate_2_Image()
	EndIf
EndFunc   ;==>_RM_Button_Item_4_1

Func _RM_Button_Item_5_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5410) :(' & @MIN & ':' & @SEC & ') _RM_Button_Item_5_1()' & @CR) ;### Function Trace
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_3)
	$InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB5_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_3, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB5_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_3, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB5_Name", $InputBox)
		$TAB_NR_Temp = "5"
		_Write_CategoryNameTemplate_2_Image()
	EndIf
EndFunc   ;==>_RM_Button_Item_5_1

Func _RM_Button_Item_6_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5425) :(' & @MIN & ':' & @SEC & ') _RM_Button_Item_6_1()' & @CR) ;### Function Trace
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_4)
	$InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB6_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_4, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB6_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_4, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB6_Name", $InputBox)
		$TAB_NR_Temp = "6"
		_Write_CategoryNameTemplate_2_Image()
	EndIf
EndFunc   ;==>_RM_Button_Item_6_1

#Region RM TAGS
Func _RM_Checkbox_Category_3_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5441) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_1()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5463) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_2()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5485) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_3()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5507) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_4()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5529) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_5()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5551) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_6()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5573) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_7()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5595) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_8()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5617) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_9()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5639) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_10()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5661) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_11()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5683) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_12()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5705) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_13()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5727) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_14()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5749) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_15()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5771) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_16()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5793) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_17()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5815) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_18()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5837) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_19()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5859) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_20()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5881) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_21()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5903) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_22()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5925) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_23()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5947) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_24()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5969) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_25()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5991) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_26()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6013) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_27()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6035) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_28()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6057) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_29()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6079) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_3_30()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6102) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_1()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6124) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_2()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6146) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_3()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6168) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_4()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6190) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_5()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6212) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_6()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6234) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_7()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6256) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_8()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6278) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_9()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6300) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_10()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6322) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_11()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6344) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_12()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6366) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_13()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6388) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_14()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6410) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_15()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6432) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_16()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6454) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_17()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6476) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_18()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6498) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_19()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6520) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_20()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6542) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_21()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6564) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_22()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6586) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_23()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6608) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_24()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6630) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_25()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6652) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_26()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6674) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_27()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6696) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_28()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6718) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_29()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6740) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_4_30()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6764) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_1()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6786) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_2()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6808) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_3()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6830) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_4()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6852) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_5()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6874) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_6()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6896) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_7()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6918) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_8()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6940) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_9()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6962) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_10()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (6984) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_11()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7006) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_12()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7028) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_13()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7050) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_14()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7072) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_15()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7094) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_16()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7116) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_17()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7138) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_18()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7160) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_19()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7182) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_20()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7204) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_21()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7226) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_22()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7248) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_23()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7270) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_24()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7292) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_25()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7314) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_26()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7336) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_27()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7358) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_28()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7380) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_29()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7402) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_5_30()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7424) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_1()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7446) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_2()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7468) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_3()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7490) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_4()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7512) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_5()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7534) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_6()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7556) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_7()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7578) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_8()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7600) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_9()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7622) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_10()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7644) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_11()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7666) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_12()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7688) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_13()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7710) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_14()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7732) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_15()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7754) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_16()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7776) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_17()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7798) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_18()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7820) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_19()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7842) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_20()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7864) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_21()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7886) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_22()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7908) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_23()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7930) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_24()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7952) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_25()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7974) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_26()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (7996) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_27()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8018) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_28()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8040) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_29()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8062) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Category_6_30()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8086) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_1()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "40"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_1

Func _RM_Item_RS_2() ; Resolution Scale 60%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8092) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_2()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "60"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_2

Func _RM_Item_RS_3() ; Resolution Scale 80%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8098) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_3()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "80"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_3

Func _RM_Item_RS_4() ; Resolution Scale 100%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8104) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_4()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "100"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_4

Func _RM_Item_RS_5() ; Resolution Scale 120%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8110) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_5()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "120"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_5

Func _RM_Item_RS_6() ; Resolution Scale 140%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8116) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_6()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "140"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_6

Func _RM_Item_RS_7() ; Resolution Scale 160%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8122) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_7()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "160"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_7

Func _RM_Item_RS_8() ; Resolution Scale 180%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8128) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_8()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "180"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_8

Func _RM_Item_RS_9() ; Resolution Scale 200%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8134) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_9()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "200"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_9

Func _RM_Item_RS_10() ; Resolution Scale 220%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8140) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_10()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "220"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_10

Func _RM_Item_RS_11() ; Resolution Scale 240%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8146) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_11()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "240"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_11

Func _RM_Item_RS_12() ; Resolution Scale 260%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8152) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_12()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "260"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_12

Func _RM_Item_RS_13() ; Resolution Scale 280%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8158) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_13()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "280"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_13

Func _RM_Item_RS_14() ; Resolution Scale 300%
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8164) :(' & @MIN & ':' & @SEC & ') _RM_Item_RS_14()' & @CR) ;### Function Trace
	$ResolutionScale_TEMP = "300"
	_RM_Write_to_SteamVR_VRSettings()
EndFunc   ;==>_RM_Item_RS_14
#EndRegion RM_Resolution Scale

Func _RM_Menu_Item_5_1() ; Add to Autostart List
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8171) :(' & @MIN & ':' & @SEC & ') _RM_Menu_Item_5_1()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8216) :(' & @MIN & ':' & @SEC & ') _RM_Menu_Item_5_2()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8261) :(' & @MIN & ':' & @SEC & ') _RM_Menu_Item_8()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8370) :(' & @MIN & ':' & @SEC & ') _RM_Menu_Item_9()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8480) :(' & @MIN & ':' & @SEC & ') _RM_Menu_Item11()' & @CR) ;### Function Trace
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
	;_Update_ListView_Icons()
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
		Local $HL_State = IniRead($Config_INI, "TEMP", "HL_State", "")
		If $HL_State = "take_over_PO" Then
			IniWrite($Config_INI, "TEMP", "HL_State", "")
			_Read_from_INI_ADD_2_ListView()
		EndIf
	EndIf
	$tagNMHDR = 0
	$event = 0
	$lParam = 0
EndFunc   ;==>_ClickOnListView

Func _DB_Click_Listview()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8609) :(' & @MIN & ':' & @SEC & ') _DB_Click_Listview()' & @CR) ;### Function Trace
	Sleep(100)
	_Start_ListView_Selected()
	Sleep(100)
EndFunc   ;==>_DB_Click_Listview

Func _Change_Preview_Icon_ListView()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8616) :(' & @MIN & ':' & @SEC & ') _Change_Preview_Icon_ListView()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8678) :(' & @MIN & ':' & @SEC & ') _Update_VRSettings_GUI_Items()' & @CR) ;### Function Trace
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

	Local $MotionSmoothingOverride_value = IniRead($ApplicationList_TEMP, "Application_" & $Game_ID, "motionSmoothingOverride", "")
	Local $ResolutionScale_value = IniRead($ApplicationList_TEMP, "Application_" & $Game_ID, "ResolutionScale", "100")

	GUICtrlSetData($ResolutionScale_Group, "Scale [%] for: " & $Steam_app_Name_RS)
	GUICtrlSetData($Slider_0, $ResolutionScale_value)
	GUICtrlSetData($Input_ResolutionScale, $ResolutionScale_value)

	If $MotionSmoothingOverride_value = "1" Then
		GUICtrlSetData($SS_Checkbox_motionSmoothingOverride, "a")
	Else
		GUICtrlSetData($SS_Checkbox_motionSmoothingOverride, "")
	EndIf
EndFunc   ;==>_Update_VRSettings_GUI_Items

Func _Button_Open_in_Browser()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8723) :(' & @MIN & ':' & @SEC & ') _Button_Open_in_Browser()' & @CR) ;### Function Trace

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

	Local $IE_Adresse = "https://steamdb.info/app/" & $Game_ID & "/graphs/"
	_Button_Exit_HTML_GUI()
	ShellExecute($IE_Adresse)
EndFunc

Func _Create_HTMLView_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8747) :(' & @MIN & ':' & @SEC & ') _Create_HTMLView_GUI()' & @CR) ;### Function Trace
	Local $Button_Exit_HTML_GUI

	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	Local $regValue = "0x2AF9"
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

	;Local $oIE = ObjCreate("Shell.Explorer.2")
	Local $oIE = _IECreateEmbedded()
	If Not @error Then
		Global $HTML_GUI = GUICreate($Steam_app_Name & " - " & "steam.app." & $Game_ID, 980, 600, (@DesktopWidth - 980) / 2, (@DesktopHeight - 600) / 2, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
		GUICtrlCreateObj($oIE, 0, 0, 979, 550)

		Global $Button_Open_in_Browser = GUICtrlCreateButton("Open in default Web Browser", 5, 560, 220, 35)
		GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
		GUICtrlSetOnEvent(-1, "_Button_Open_in_Browser")
		GUICtrlSetTip(-1, "Opens the Page in the default Web Browser.")

		Global $Button_Exit_HTML_GUI = GUICtrlCreateButton("Exit", 940, 560, 35, 35, $BS_BITMAP)
		GUICtrlSetOnEvent(-1, "_Button_Exit_HTML_GUI")
		_GUICtrlButton_SetImage(-1, $gfx & "Close_small.bmp")
		GUICtrlSetTip(-1, "Closes HTML GUI.")

		Local $IE_Adresse = "https://steamdb.info/app/" & $Game_ID & "/graphs/"
		Local $sHeader = "User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0" & @CRLF & _
							"Accept: image/gif" & @CRLF & _
							"Accept: */*"

		;$oIE.Navigate($IE_Adresse, Default, Default, "", $sHeader)
		;Sleep(150)
		;__IENavigate($oIE, $IE_Adresse, 1, 0, "", "", $sHeader)
		;$oIE.Navigate($IE_Adresse, Default, Default, "", $sHeader)

		;$oIE.navigate($IE_Adresse)

		;_IELoadWait($oIE, 1000)
		_IENavigate($oIE, $IE_Adresse, 1)

		GUISetState()
		$Game_ID = ""
	Else
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Create_HTMLView_GUI()]: " & "ObjCreate 'Shell.Explorer.2'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
	EndIf
EndFunc   ;==>_Create_HTMLView_GUI


Func _Button_HTMLGamePage_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8826) :(' & @MIN & ':' & @SEC & ') _Button_HTMLGamePage_GUI()' & @CR) ;### Function Trace
	GUIDelete($HLL_GUI_Handle)
	GUIDelete($HLL_GUI)
	_Create_HTMLGamePage_GUI()
EndFunc

Func _Create_HTMLGamePage_GUI() ; GamePageMode
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8833) :(' & @MIN & ':' & @SEC & ') _Create_HTMLGamePage_GUI()' & @CR) ;### Function Trace
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
		Global $locationurl_old_revive = StringReplace($locationurl_old, 'steam://rungameid/', '')
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

			Local $locationurl_revive_Check = StringReplace($locationurl_new, 'steam://rungameid/', '')
			If StringLeft($locationurl_revive_Check, 11) = "revive.app." And StringLeft($locationurl_old_revive, 11) <> "revive.app." Then
				;MsgBox(0, "$locationurl_new", $locationurl_new)
				$oIE.navigate($IE_Adresse)
				;MsgBox(0, "revive.app.", $Install_DIR & "WebPage\Revive\" & $locationurl_new & ".bat")
				ShellExecute($Install_DIR & "WebPage\Revive\" & $locationurl_new & ".bat")
				;$Oculus_App_URL = $locationurl_new
				;_Start_Revive_Oculus_App()
			EndIf

			;MsgBox(0, "$locationurl_new", StringLen("steam://rungameid/HLNSG"))
			If StringLeft($locationurl_new, 5) = "HLNSG" And StringLeft($locationurl_old, 5) <> "HLNSG" Then
				;MsgBox(0, "HLNSG", "HLNSG")
				$oIE.navigate($IE_Adresse)
				Local $HLNSG_installdir = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $locationurl_new, "installdir", "")
				ShellExecute($HLNSG_installdir)
				;$Oculus_App_URL = $locationurl_new
				;_Start_Revive_Oculus_App()
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9046) :(' & @MIN & ':' & @SEC & ') _Evt_onClick()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9070) :(' & @MIN & ':' & @SEC & ') _HTML_GamePage_Start_Game()' & @CR) ;### Function Trace
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


Func _Button_Exit_HTML_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9107) :(' & @MIN & ':' & @SEC & ') _Button_Exit_HTML_GUI()' & @CR) ;### Function Trace
	GUIDelete($HTML_GUI)
EndFunc   ;==>_Button_Exit_HTML_GUI

Func _Button_Exit_HTMLGamePage_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9112) :(' & @MIN & ':' & @SEC & ') _Button_Exit_HTMLGamePage_GUI()' & @CR) ;### Function Trace
	GUIDelete($HTML_HTMLGamePage_GUI)
EndFunc   ;==>_Button_Exit_HTMLGamePage_GUI


Func _Checkbox_all()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9118) :(' & @MIN & ':' & @SEC & ') _Checkbox_all()' & @CR) ;### Function Trace
	Local $CheckBox = GUICtrlRead($Checkbox_CreatePage)
	If $CheckBox = "" Then
		GUICtrlSetData($Checkbox_CreatePage, "a")
	Else
		GUICtrlSetData($Checkbox_CreatePage, "")
	EndIf
	_Checkbox_CheckUncheck()
EndFunc   ;==>_Checkbox_all

Func _Checkbox_CheckUncheck()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9129) :(' & @MIN & ':' & @SEC & ') _Checkbox_CheckUncheck()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9173) :(' & @MIN & ':' & @SEC & ') _Button_Create_GamePage_selected()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9332) :(' & @MIN & ':' & @SEC & ') _Button_Create_SinglePage_selected()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9472) :(' & @MIN & ':' & @SEC & ') _Button_Add_to_Custom()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9554) :(' & @MIN & ':' & @SEC & ') _Button_HomeLoaderSettings()' & @CR) ;### Function Trace
	If Not WinExists("HomeLoader - SteamVR Start Settings") Then
		_Settings_GUI()
	EndIf
EndFunc   ;==>_Button_HomeLoaderSettings

Func _Start_ListView_Selected()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9561) :(' & @MIN & ':' & @SEC & ') _Start_ListView_Selected()' & @CR) ;### Function Trace
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

	Local $Viveport_binary_path_windows = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "binary_path_windows", "")
	If $ScanOnlyVR = "true" Then $Viveport_binary_path_windows = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "binary_path_windows", "")
	;MsgBox(0, "1", "Application_vive.htc." & $StringTrimLeft_Check_AppID)

	Local $Revive_ShellExecute = $Revive_Path & "Revive\ReviveInjector_x64.exe"

	If $Check_AppId <> "" Then
		If $StringLeft_Check_AppID = "vive.htc." Then
			If Not ProcessExists("Vive.exe") Then
				If FileExists($Viveport_binary_path_windows) Then
					ShellExecute($Viveport_binary_path_windows, "", "")
				Else
					If FileExists($HTCVive_Path & "PCClient\Vive.exe") Then
						ShellExecute($HTCVive_Path & "PCClient\Vive.exe")
						Do
							Sleep(1000)
						Until ProcessExists("Vive.exe")
						Sleep(1000)
					EndIf
				EndIf
			Else
				ShellExecute("vive://runapp/" & $StringTrimLeft_Check_AppID)
			EndIf
		Else
			$StringLeft_Check_AppID = StringLeft($Check_AppId, 11)
			$StringTrimLeft_Check_AppID = StringTrimLeft($Check_AppId, 11)
			If $StringLeft_Check_AppID = "revive.app." Then
				;_Start_Revive_Oculus_App()
			Else
				ShellExecute("steam://rungameid/" & $Check_AppId & "/VR")
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9628) :(' & @MIN & ':' & @SEC & ') _Combo_SteamLibrary()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9693) :(' & @MIN & ':' & @SEC & ') _Combo_ApplicationList()' & @CR) ;### Function Trace
	Local $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	Local $Status_Combo = GUICtrlRead($Combo_ApplicationList)
	IniWrite($Config_INI, "Settings", "MainCategory", $Status_Combo)
	$MainCategory_ApplicationList = IniRead($Config_INI, "Settings", "MainCategory", "")
	_Restart()
EndFunc   ;==>_Combo_ApplicationList


Func _ButtonTAB_Steam_Library()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9703) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Steam_Library()' & @CR) ;### Function Trace
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Steam_Library)
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9727) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Non_Steam_Appl()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9750) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Custom_1()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9773) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Custom_2()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9796) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Custom_3()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9819) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Custom_4()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9842) :(' & @MIN & ':' & @SEC & ') _Button_AddGame2Library()' & @CR) ;### Function Trace
	_AddGame2Library_GUI()
EndFunc   ;==>_Button_AddGame2Library


Func _Button_ReScan_Steam_Library() ; Scan Button
	Local $Timer = TimerInit()
	IniWrite($Config_INI, "TEMP", "Scan_Duration", "Scanning...")

	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9848) :(' & @MIN & ':' & @SEC & ') _Button_ReScan_Steam_Library()' & @CR) ;### Function Trace
	;MsgBox(0, "1 - _Button_ReScan_Steam_Library", "_Button_ReScan_Steam_Library")
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
	$Create_SteamVR_Home_Panels = IniRead($Config_INI, "Settings", "Create_SteamVR_Home_Panels", "")

	FileWriteLine($scan_log_FILE, "Start Scan:" & " - " & "[" & _Now() & "]")
	FileWriteLine($scan_log_FILE, "$ButtonTAB_State" & " = " & $ButtonTAB_State)
	FileWriteLine($scan_log_FILE, "$DeleteHomeLoaderLibraryData" & " = " & $DeleteHomeLoaderLibraryData)
	FileWriteLine($scan_log_FILE, "$Request_Steamdb_info" & " = " & $Request_Steamdb_info)
	FileWriteLine($scan_log_FILE, "$ScanOnlyVR" & " = " & $ScanOnlyVR)
	FileWriteLine($scan_log_FILE, "$ScanVIVEApps" & " = " & $ScanVIVEApps)
	FileWriteLine($scan_log_FILE, "$ScanOculusApps" & " = " & $ScanOculusApps)
	FileWriteLine($scan_log_FILE, "$Sort_Alphabetical_order" & " = " & $Sort_Alphabetical_order)
	FileWriteLine($scan_log_FILE, "$Use_Steam_Tags" & " = " & $Use_Steam_Tags)
	FileWriteLine($scan_log_FILE, "$Allow_Multiple_Tag_Assignments" & " = " & $Allow_Multiple_Tag_Assignments)
	FileWriteLine($scan_log_FILE, "$Add_Apps_Tags_to_categories" & " = " & $Add_Apps_Tags_to_categories)
	FileWriteLine($scan_log_FILE, "$Create_HTML_GamePage" & " = " & $Create_HTML_GamePage)
	FileWriteLine($scan_log_FILE, "$Add_PlayersOnline_to_Icons" & " = " & $Add_PlayersOnline_to_Icons)
	FileWriteLine($scan_log_FILE, "$Add_SS_to_Icons" & " = " & $Add_SS_to_Icons)
	FileWriteLine($scan_log_FILE, "$Add_SS_per_game" & " = " & $Add_SS_per_game)
	FileWriteLine($scan_log_FILE, "$Create_SteamVR_Home_Panels" & " = " & $Create_SteamVR_Home_Panels)

	If WinExists("HomeLoader - Library") Then _Loading_GUI()
	If $ScanOnlyVR <> "true" Then

		Global $Array_Library[1][1] = [["appid"]]
		Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		For $Loop_Library = 1 To $NR_Applications
			Local $appid_Library_Array = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_Library, "appid", "")
			$Array_Result = _ArrayAdd($Array_Library, $appid_Library_Array)
			If @error Then
				$ScriptLineNumber_Temp = @ScriptLineNumber
				$AtError_Result = @error
			EndIf
			If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
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
			$Array_Result = _ArrayAdd($Array_Library, $appid_Library_Array)
			If @error Then
				$ScriptLineNumber_Temp = @ScriptLineNumber
				$AtError_Result = @error
			EndIf
			If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
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

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 55)

	If $ScanOculusApps = "true" Then
		If FileExists($Revive_revive_vrmanifest_FilePath) Then
			_ScanOculusData()
		EndIf
	EndIf

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 60)

	If $Add_SS_per_game = "true" Then
		_Read_SteamVR_VRSettings()
	EndIf

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 65)

	If $Add_SS_to_Icons = "true" Then _Get_AD_SS_Values_to_Icons()

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 70)

	If $Create_HTML_GamePage = "true" Then
		If WinExists("HomeLoader - Library") Then
			_GUICtrlStatusBar_SetText($Statusbar, "" & "Creating HTML Game Pages..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		EndIf
		_Create_GamePage_Menu_Page()
		_Create_GamePages()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 75)
		_Create_SinglePages()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 80)
		_Create_Game_Tags_Page()
	EndIf

	If $Create_SteamVR_Home_Panels = "true" Then
		If WinExists("HomeLoader - Library") Then
			_GUICtrlStatusBar_SetText($Statusbar, "" & "Preparing SteamVR Home Environment, please wait." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		EndIf
			_Button_Panel_Settings_Apply()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 85)
	EndIf

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 95)

	If WinExists("HomeLoader - Library") Then
		_GUICtrlStatusBar_SetText($Statusbar, "" & "Synchronizing Icons..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	EndIf
	_Sync_Icons()

	If $Autostart_VRUB = "true" Then
		_Write_ALL_Categories_to_VRUB_PersistentStore_File()
		_Copy_To_VRUB()
	EndIf

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 100)

	Local $TimerDiff = TimerDiff($Timer)
	Local $sec = Round(($TimerDiff / 1000), 2) ; sec
	Local $min = Round(($sec / 60), 2) ; min
	Local $TimerDiff_temp = $sec & " seconds"
	If $sec > 60 Then $TimerDiff_temp = $min & " minutes"

	IniWrite($Config_INI, "TEMP", "Scan_Duration", $TimerDiff_temp)

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken_2, 100)
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Scan finished in " & $TimerDiff_temp & " " & "")
		_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan finished in " & $TimerDiff_temp & " " & "" & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
		GUICtrlSetData($Anzeige_Fortschrittbalken_2, 0)
		GUIDelete($GUI_Loading)
		_Restart()
	EndIf
EndFunc   ;==>_Button_ReScan_Steam_Library

Func _Button_ReScan_Steam_Library_AutoUpdate()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10013) :(' & @MIN & ':' & @SEC & ') _Button_ReScan_Steam_Library_AutoUpdate()' & @CR) ;### Function Trace
	;MsgBox(0, "2 - _Button_ReScan_Steam_Library_AutoUpdate", "_Button_ReScan_Steam_Library_AutoUpdate")
	Local $Timer = TimerInit()
	If $ScanOnlyVR <> "true" Then
		Global $Array_Library[1][1] = [["appid"]]
		Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		For $Loop_Library = 1 To $NR_Applications
			Local $appid_Library_Array = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_Library, "appid", "")
			$Array_Result = _ArrayAdd($Array_Library, $appid_Library_Array)
			If @error Then
				$ScriptLineNumber_Temp = @ScriptLineNumber
				$AtError_Result = @error
			EndIf
			If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
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
			$Array_Result = _ArrayAdd($Array_Library, $appid_Library_Array)
			If @error Then
				$ScriptLineNumber_Temp = @ScriptLineNumber
				$AtError_Result = @error
			EndIf
			If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
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

	If $Create_SteamVR_Home_Panels = "true" Then
		Sleep(1000)
		_Button_Panel_Settings_Apply()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 85)
	EndIf

	_Sync_Icons()
	If $Autostart_VRUB = "true" Then
		_Write_ALL_Categories_to_VRUB_PersistentStore_File()
		_Copy_To_VRUB()
	EndIf

	Local $TimerDiff = TimerDiff($Timer)
	Local $sec = Round(($TimerDiff / 1000), 2)
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Scan finished in " & $sec & " " & "seconds")
EndFunc   ;==>_Button_ReScan_Steam_Library_AutoUpdate

Func _Button_More_Scan_Options()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10098) :(' & @MIN & ':' & @SEC & ') _Button_More_Scan_Options()' & @CR) ;### Function Trace
	If Not WinExists("Settings") Then
		_HLL_Settings_GUI()
	EndIf
EndFunc   ;==>_Button_More_Scan_Options


Func _Scan_SteamLibrary_ALL()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10106) :(' & @MIN & ':' & @SEC & ') _Scan_SteamLibrary_ALL()' & @CR) ;### Function Trace
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
		;_GUICtrlListView_DeleteAllItems($listview)
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
		;_GUICtrlListView_DeleteAllItems($listview)
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10162) :(' & @MIN & ':' & @SEC & ') _Sort_ApplicationList_ALL()' & @CR) ;### Function Trace
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
		$Array_Result = _ArrayAdd($Array_Sorted, $sFill)
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10207) :(' & @MIN & ':' & @SEC & ') _ScanViveData()' & @CR) ;### Function Trace
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
			If @error Then
				$Array_Result = $aArray
				$ScriptLineNumber_Temp = @ScriptLineNumber
				$AtError_Result = @error
				_StringSplit_Error_Handler()
			EndIf
			Local $Application_NR_new = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "") + 1

			Local $NR_TEMP = $Application_NR_new

			For $i = 1 To $StringSplit_Value[0]
				Local $StringSplit_Value_2 = StringSplit($StringSplit_Value[$i], ":")
				If @error Then
					$Array_Result = $aArray
					$ScriptLineNumber_Temp = @ScriptLineNumber
					$AtError_Result = @error
					_StringSplit_Error_Handler()
				EndIf
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
					$appid_TEMP = $StringSplit_Value_2_2
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
			If $appid_TEMP <> "" Then
				$Array_Result = _ArrayAdd($Viveport_Array_Sorted, $sFill)
				If @error Then
					$ScriptLineNumber_Temp = @ScriptLineNumber
					$AtError_Result = @error
				EndIf
				If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
			EndIf
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

		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "NR", $Application_NR_new)
		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "url", $Viveport_Array_Sorted[$Loop_1][2])
		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "appid", $Viveport_Array_Sorted[$Loop_1][3])
		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "name", $Viveport_Array_Sorted[$Loop_1][0])
		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "IconPath", $Viveport_Array_Sorted[$Loop_1][4])
		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "binary_path_windows", $Viveport_Array_Sorted[$Loop_1][5])

		IniWrite($ApplicationList_TEMP, "ApplicationList", "NR_Applications", $Application_NR_new)
	Next

	;$NR_Game = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	;For $Loop_1 = 1 To $NR_Game
		;$appid_TEMP = IniRead($ApplicationList_TEMP, "Application_" & $Loop_1, "appid", "")
		;MsgBox(0, "$appid_TEMP", $appid_TEMP)

		;If StringLeft($appid_TEMP, 9) = "vive.htc." Then
			;Local $Bat_Filename = $Viveport_Bat_File_Folder & $appid_TEMP & ".bat"
			;If Not FileExists($Bat_Filename) Then _Create_Viveport_Bat_Files()
		;EndIf
	;Next

	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
EndFunc   ;==>_ScanViveData

Func _Create_Viveport_Bat_Files()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10389) :(' & @MIN & ':' & @SEC & ') _Create_Viveport_Bat_Files()' & @CR) ;### Function Trace
	Local $Bat_Filename = $Viveport_Bat_File_Folder & $appid_TEMP & ".bat"

	Local $ApplicationList_Temp_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
	If $ScanOnlyVR = "true" Then $ApplicationList_Temp_INI = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
	If $ScanOnlyVR <> "true" Then $ApplicationList_Temp_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"

	Local $installdir = IniRead($ApplicationList_Temp_INI, "Application_" & $appid_TEMP, "binary_path_windows", "")
	Local $Working_Dir = StringLeft($installdir, StringInStr($installdir, "\", 0, -1) - 1)

	If Not FileExists($Bat_Filename) Then
		Local $File_Content = '@echo off ' & @CRLF & _
								'C:' & @CRLF & _
								'chdir "' & $Working_Dir & '"' & @CRLF & _
								'"' & $installdir & '"' & @CRLF & _
								'@echo.' & @CRLF

		FileWrite($Bat_Filename, $File_Content)
	EndIf
EndFunc


Func _ScanOculusData()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10412) :(' & @MIN & ':' & @SEC & ') _ScanOculusData()' & @CR) ;### Function Trace
	If FileExists($Revive_revive_vrmanifest_FilePath) Then
		Global $OculusData_Array_Sorted[1][6] = [["name", "app_key", "arguments", "binary_path_windows", "image_path", "launch_type"]]

		Local $NR_LINES_TEMP = _FileCountLines($Revive_revive_vrmanifest_FilePath)

		If $ScanOnlyVR = "true" Then
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
		Else
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		EndIf

		$Array_Result = _FileReadToArray($Revive_revive_vrmanifest_FilePath, $Revive_revive_vrmanifest_Array)
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileReadToArray_Error_Handler()
		Local $Loop_End_1 = $Revive_revive_vrmanifest_Array[0]
		$Array_Result = _FileReadToArray($Revive_support_vrmanifest_FilePath, $Revive_support_vrmanifest_Array)
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileReadToArray_Error_Handler()
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
						$Array_Result = _ArrayAdd($OculusData_Array_Sorted, $sFill)
						If @error Then
							$ScriptLineNumber_Temp = @ScriptLineNumber
							$AtError_Result = @error
						EndIf
						If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
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
						$Array_Result = _ArrayAdd($OculusData_Array_Sorted, $sFill)
						If @error Then
							$ScriptLineNumber_Temp = @ScriptLineNumber
							$AtError_Result = @error
						EndIf
						If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10669) :(' & @MIN & ':' & @SEC & ') _Add_SteamID_Tags_to_ApplicationList_Tags()' & @CR) ;### Function Trace
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
	;MsgBox(0, $NR_Game_Tags, $NR_Game_Tags)

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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10716) :(' & @MIN & ':' & @SEC & ') _Checkbox_Show_OnlyVR_Apps()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10734) :(' & @MIN & ':' & @SEC & ') _Checkbox_Show_All_Apps()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10752) :(' & @MIN & ':' & @SEC & ') _Checkbox_ScanLibrary_OnStart()' & @CR) ;### Function Trace
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")

	If $HomeApp <> "" Then
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
	Else
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention", "SteamVR Home App needs to be selected" & @CRLF & _
															"[for example 'SteamVR'] for this function to work." & @CRLF & @CRLF & _
															"If it is enabled then it will Scan your Libraries in the background after SteamVR has been started." & @CRLF)
		GUICtrlSetData($Checkbox_ScanLibrary_OnStart, "")
		GUICtrlSetData($Checkbox_Settings_1, "")
		IniWrite($Config_INI, "Settings", "ScanLibrary_OnStart", "false")
		$ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
	EndIf
EndFunc   ;==>_Checkbox_ScanLibrary_OnStart

Func _Checkbox_Request_Steamdb_info()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10784) :(' & @MIN & ':' & @SEC & ') _Checkbox_Request_Steamdb_info()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10804) :(' & @MIN & ':' & @SEC & ') _Checkbox_Use_Steam_Tags()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10824) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_ScanViveData()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10840) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_ScanOculusData()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10856) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Sort_Alphabetical_order()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10872) :(' & @MIN & ':' & @SEC & ') _RM_Add_Apps_Tags_to_categories()' & @CR) ;### Function Trace
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
	$Add_Apps_Tags_to_categories = IniRead($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "")
	_Set_States()
EndFunc   ;==>_RM_Add_Apps_Tags_to_categories

Func _RM_Checkbox_Allow_Multiple_Tag_Assignments()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10888) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Allow_Multiple_Tag_Assignments()' & @CR) ;### Function Trace
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
	$Allow_Multiple_Tag_Assignments = IniRead($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Allow_Multiple_Tag_Assignments

Func _RM_Checkbox_Add_PlayersOnline_to_Icons()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10904) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Add_PlayersOnline_to_Icons()' & @CR) ;### Function Trace
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
	$Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Add_PlayersOnline_to_Icons

Func _RM_Checkbox_Add_SS_to_Icons()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10920) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Add_SS_to_Icons()' & @CR) ;### Function Trace
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
	$Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Add_SS_to_Icons

Func _RM_Checkbox_Add_SS_per_game()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10936) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Add_SS_per_game()' & @CR) ;### Function Trace
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
	$Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Add_SS_per_game

Func _RM_Checkbox_Create_HTML_GamePage()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10952) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Create_HTML_GamePage()' & @CR) ;### Function Trace
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
	$Create_HTML_GamePage = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Create_HTML_GamePage

Func _RM_Checkbox_Create_SteamVR_Home_Panels()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10968) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Create_SteamVR_Home_Panels()' & @CR) ;### Function Trace
	Local $CheckBox = IniRead($Config_INI, "Settings", "Create_SteamVR_Home_Panels", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_9, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_13, "a")
		IniWrite($Config_INI, "Settings", "Create_SteamVR_Home_Panels", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_9, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_13, "")
		IniWrite($Config_INI, "Settings", "Create_SteamVR_Home_Panels", "false")
	EndIf
	$Create_SteamVR_Home_Panels = IniRead($Config_INI, "Settings", "Create_SteamVR_Home_Panels", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_DeleteHomeLoaderLibraryData

Func _RM_Checkbox_DeleteHomeLoaderLibraryData()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10984) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_DeleteHomeLoaderLibraryData()' & @CR) ;### Function Trace
	Local $CheckBox = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_10, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_14, "a")
		IniWrite($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_10, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_14, "")
		IniWrite($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "false")
	EndIf
	$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_DeleteHomeLoaderLibraryData

Func _RM_Scan_Fetch_Steamdb_Tags()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11000) :(' & @MIN & ':' & @SEC & ') _RM_Scan_Fetch_Steamdb_Tags()' & @CR) ;### Function Trace
	_RM_Delete_Category_Pages()
	_Get_SteamGame_Tags()
	;_Add_ApplicationList_To_Tags()
EndFunc   ;==>_RM_Scan_Fetch_Steamdb_Tags

Func _RM_Create_HTML_GamePages_All()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11007) :(' & @MIN & ':' & @SEC & ') _RM_Create_HTML_GamePages_All()' & @CR) ;### Function Trace
	_Create_GamePages()
	_Create_SinglePages()
	_Create_Game_Tags_Page()
EndFunc   ;==>_RM_Create_HTML_GamePages_All

Func _RM_Create_HTML_GamePages_Selected()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11014) :(' & @MIN & ':' & @SEC & ') _RM_Create_HTML_GamePages_Selected()' & @CR) ;### Function Trace
	_Button_Create_GamePage_selected()
	_Button_Create_SinglePage_selected()
EndFunc   ;==>_RM_Create_HTML_GamePages_Selected

Func _RM_SteamVR_Home_Game_Panels_ALL()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11020) :(' & @MIN & ':' & @SEC & ') _RM_SteamVR_Home_Game_Panels_ALL()' & @CR) ;### Function Trace
	_Button_Panel_Settings_Apply()

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	EndIf
EndFunc   ;==>_RM_SteamVR_Home_Game_Panels_ALL

Func _RM_Delete_Category_Pages()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11029) :(' & @MIN & ':' & @SEC & ') _RM_Delete_Category_Pages()' & @CR) ;### Function Trace
	If FileExists($ApplicationList_Custom_1_INI) Then FileDelete($ApplicationList_Custom_1_INI)
	If FileExists($ApplicationList_Custom_2_INI) Then FileDelete($ApplicationList_Custom_2_INI)
	If FileExists($ApplicationList_Custom_3_INI) Then FileDelete($ApplicationList_Custom_3_INI)
	If FileExists($ApplicationList_Custom_4_INI) Then FileDelete($ApplicationList_Custom_4_INI)
EndFunc   ;==>_RM_Delete_Category_Pages

#EndRegion Func MAIN GUI

#Region Func Add to Library GUI
Func _DROPDOWN_Library()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11040) :(' & @MIN & ':' & @SEC & ') _DROPDOWN_Library()' & @CR) ;### Function Trace
	Local $DROPDOWN = GUICtrlRead($DROPDOWN_Library)
	If $DROPDOWN <> "" Then
		Local $Value_DROPDOWN_Library = $DROPDOWN
		IniWrite($Config_INI, "TEMP", "Value_DROPDOWN_Library", $Value_DROPDOWN_Library)
	EndIf
EndFunc   ;==>_DROPDOWN_Library

Func _BUTTON_GamePath_Folder()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11049) :(' & @MIN & ':' & @SEC & ') _BUTTON_GamePath_Folder()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11079) :(' & @MIN & ':' & @SEC & ') _BUTTON_Use_SteamID()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11103) :(' & @MIN & ':' & @SEC & ') _Input_Name()' & @CR) ;### Function Trace
	Local $Input_Input_Name = GUICtrlRead($Input_Name)
	If $Input_Input_Name <> "" Then
		Local $Value_Input_Name = $Input_Input_Name
		IniWrite($Config_INI, "TEMP", "Value_Input_Name", $Input_Input_Name)
	EndIf
EndFunc   ;==>_Input_Name

Func _BUTTON_IconPath_Folder()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11112) :(' & @MIN & ':' & @SEC & ') _BUTTON_IconPath_Folder()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11127) :(' & @MIN & ':' & @SEC & ') _Button_SAVE_APP()' & @CR) ;### Function Trace
	Local $Value_DROPDOWN_Library = IniRead($Config_INI, "TEMP", "Value_DROPDOWN_Library", "")
	Local $Value_GamePath_Folder = IniRead($Config_INI, "TEMP", "Value_GamePath_Folder", "")
	Local $Value_Use_SteamID = IniRead($Config_INI, "TEMP", "Value_Use_SteamID", "")
	Local $Value_Input_Name = IniRead($Config_INI, "TEMP", "Value_Input_Name", "")
	Local $Value_IconPath_Folder = IniRead($Config_INI, "TEMP", "Value_IconPath_Folder", "")

	Local $LastAppNR = IniRead($ApplicationList_Non_Steam_Appl_INI, "ApplicationList", "NR_Applications", "")
	Local $NewAppNR = $LastAppNR + 1

	If FileExists($Value_IconPath_Folder) Then FileCopy($Value_IconPath_Folder, "steam.app." & $Value_Use_SteamID & ".jpg", $FC_CREATEPATH + $FC_OVERWRITE)

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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11175) :(' & @MIN & ':' & @SEC & ') _Button_Exit_AddGame2Library_GUI()' & @CR) ;### Function Trace
	IniWrite($Config_INI, "TEMP", "Value_DROPDOWN_Library", "")
	IniWrite($Config_INI, "TEMP", "Value_GamePath_Folder", "")
	IniWrite($Config_INI, "TEMP", "Value_Use_SteamID", "")
	IniWrite($Config_INI, "TEMP", "Value_Input_Name", "")
	IniWrite($Config_INI, "TEMP", "Value_IconPath_Folder", "")
	GUIDelete($AddGame2Library_GUI)
EndFunc   ;==>_Button_Exit_AddGame2Library_GUI
#EndRegion Func Add to Library GUI

#Region Func Settings GUI

Func _Update_Objects_Settings_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11188) :(' & @MIN & ':' & @SEC & ') _Update_Objects_Settings_GUI()' & @CR) ;### Function Trace
	Local $Value, $Value_Read, $Device_Name
	Local $SSD_INI = $Install_DIR & "Apps\SSD_SetSoundDevice\SSD.ini"

	IniWrite($SSD_INI, "HomeLoader", "NR_of_Playback_Devices", "")
	IniWrite($SSD_INI, "HomeLoader", "NR_of_Recording_Devices", "")

	Local $NR_of_Playback_Devices = IniRead($SSD_INI, "HomeLoader", "NR_of_Playback_Devices", "")
	Local $NR_of_Recording_Devices = IniRead($SSD_INI, "HomeLoader", "NR_of_Recording_Devices", "")

	$Value_Read = IniRead($Config_INI, "Settings", "SSD_SetSoundDevice", "")
	If $Value_Read = "true" Then GUICtrlSetState($Checkbox_SSD_SetSoundDevice_1, $GUI_CHECKED)

	$Value_Read = IniRead($Config_INI, "Settings", "Audio_Playback_Device", "")
	Local $Value_Array = _FileListToArray($Install_DIR & "Apps\SSD_SetSoundDevice\", "*.lnk", 1)
	$Array_Result = $Value_Array
	If @error Then
		$ScriptLineNumber_Temp = @ScriptLineNumber
		$AtError_Result = @error
	EndIf
	If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()

	If IsArray($Value_Array) Then
		$Value = ""
		For $Loop = 1 To $Value_Array[0]
			If StringInStr($Value_Array[$Loop], 'Playback') Then
				$Device_Name = StringReplace($Value_Array[$Loop], 'SSD - ', '')
				$Device_Name = StringReplace($Device_Name, ' Audio&Com - Hidden - ', '')
				$Device_Name = StringReplace($Device_Name, '.lnk', '')
				FileMove($Install_DIR & "Apps\SSD_SetSoundDevice\" & $Value_Array[$Loop], $Install_DIR & "Apps\SSD_SetSoundDevice\" & $Device_Name & ".lnk", $FC_OVERWRITE + $FC_CREATEPATH)
				$Value = $Value & "|" & $Device_Name

				$NR_of_Playback_Devices = $NR_of_Playback_Devices + 1
				If FileExists($SSD_INI) Then
					IniWrite($SSD_INI, "HomeLoader", "NR_of_Playback_Devices", $NR_of_Playback_Devices)
				EndIf
			EndIf
		Next

		GUICtrlSetData($Combo_Playback_Device, "")
		GUICtrlSetData($Combo_Playback_Device, $Value, $Value_Read)
	EndIf

	$Value_Read = IniRead($Config_INI, "Settings", "Audio_Recording_Device", "")
	;Local $Value_Array = _FileListToArray($Install_DIR & "Apps\SSD_SetSoundDevice\", "*.lnk", 1)
	;_ArrayDisplay($Value_Array)

	If IsArray($Value_Array) Then
		$Value = ""
		For $Loop = 1 To $Value_Array[0]
			If StringInStr($Value_Array[$Loop], 'Recording') Then
				$Device_Name = StringReplace($Value_Array[$Loop], 'SSD - ', '')
				$Device_Name = StringReplace($Device_Name, ' Audio&Com - Hidden - ', '')
				$Device_Name = StringReplace($Device_Name, '.lnk', '')
				FileMove($Install_DIR & "Apps\SSD_SetSoundDevice\" & $Value_Array[$Loop], $Install_DIR & "Apps\SSD_SetSoundDevice\" & $Device_Name & ".lnk", $FC_OVERWRITE + $FC_CREATEPATH)
				$Value = $Value & "|" & $Device_Name

				$NR_of_Recording_Devices = $NR_of_Recording_Devices + 1
				If FileExists($SSD_INI) Then
					IniWrite($SSD_INI, "HomeLoader", "NR_of_Recording_Devices", $NR_of_Recording_Devices)
				EndIf
			EndIf
		Next

		GUICtrlSetData($Combo_Recording_Device, "")
		GUICtrlSetData($Combo_Recording_Device, $Value, $Value_Read)
	EndIf
EndFunc   ;==>_Update_Objects()

Func _Button_Exit_Settings_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11258) :(' & @MIN & ':' & @SEC & ') _Button_Exit_Settings_GUI()' & @CR) ;### Function Trace
	GUIDelete($HLL_Settings_GUI)
	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
EndFunc   ;==>_Button_Exit_Settings_GUI

Func _Button_Open_SSD_SetSoundDevice()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11268) :(' & @MIN & ':' & @SEC & ') _Button_Open_SSD_SetSoundDevice()' & @CR) ;### Function Trace
	Local $SSD_Path = $Install_DIR & "Apps\SSD_SetSoundDevice\SSD.exe"
	If FileExists($SSD_Path) Then
		ShellExecuteWait($SSD_Path)
		_Update_Objects_Settings_GUI()
	Else
		FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " FilePath not found: SSD.exe" & " Path Error --> " & $SSD_Path)
	EndIf
EndFunc


Func _Checkbox_SSD_SetSoundDevice_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11280) :(' & @MIN & ':' & @SEC & ') _Checkbox_SSD_SetSoundDevice_1()' & @CR) ;### Function Trace
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")

	If $HomeApp <> "" Then
		Local $SSD_INI = $Install_DIR & "Apps\SSD_SetSoundDevice\SSD.ini"
		Local $NR_of_Playback_Devices = IniRead($SSD_INI, "HomeLoader", "NR_of_Playback_Devices", "")
		Local $NR_of_Recording_Devices = IniRead($SSD_INI, "HomeLoader", "NR_of_Recording_Devices", "")

		If $NR_of_Playback_Devices = "" And $NR_of_Recording_Devices = "" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "SSD - SetSoundDevice", "Open 'SSD - Set Sound Device' first and create shortcuts for the audio devices that you want to use.")
			GUICtrlSetData($Checkbox_SSD_SetSoundDevice_1, "")
			IniWrite($Config_INI, "Settings", "SSD_SetSoundDevice", "false")
		Else
			If Not FileExists($SSD_INI) Then
				MsgBox($MB_OK + $MB_ICONINFORMATION, "SSD - SetSoundDevice", "Open 'SSD - Set Sound Device' first and create shortcuts for the audio devices that you want to use.")
				GUICtrlSetData($Checkbox_SSD_SetSoundDevice_1, "")
				IniWrite($Config_INI, "Settings", "SSD_SetSoundDevice", "false")
			Else
				Local $CheckBox = GUICtrlRead($Checkbox_SSD_SetSoundDevice_1)
				If $CheckBox = "" Then
					GUICtrlSetData($Checkbox_SSD_SetSoundDevice_1, "a")
					IniWrite($Config_INI, "Settings", "SSD_SetSoundDevice", "true")
				Else
					GUICtrlSetData($Checkbox_SSD_SetSoundDevice_1, "")
					IniWrite($Config_INI, "Settings", "SSD_SetSoundDevice", "false")
				EndIf
			EndIf
		EndIf

	Else
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention", "SteamVR Home App needs to be selected" & @CRLF & _
															"[for example 'SteamVR'] for this function to work." & @CRLF & @CRLF & _
															"If it is enabled then it will set the selected Sound Devices after SteamVR has been started." & @CRLF)
		GUICtrlSetData($Checkbox_SSD_SetSoundDevice_1, "")
		IniWrite($Config_INI, "Settings", "SSD_SetSoundDevice", "false")
	EndIf
EndFunc



Func _Combo_Playback_Device()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11321) :(' & @MIN & ':' & @SEC & ') _Combo_Playback_Device()' & @CR) ;### Function Trace
	Local $SSD_INI = $Install_DIR & "Apps\SSD_SetSoundDevice\SSD.ini"
	Local $NR_of_Playback_Devices = IniRead($SSD_INI, "HomeLoader", "NR_of_Playback_Devices", "")
	Local $NR_of_Recording_Devices = IniRead($SSD_INI, "HomeLoader", "NR_of_Recording_Devices", "")

	If $NR_of_Playback_Devices = "" Then
		MsgBox($MB_OK + $MB_ICONINFORMATION, "SSD - SetSoundDevice", "Open 'SSD - Set Sound Device' first and create shortcuts for the playback device that you want to use.")
	Else
		Local $ComboBox = GUICtrlRead($Combo_Playback_Device)
		If $ComboBox = "" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "No playback device selected", "Select the playback device in the dropdown list.")
		Else
			IniWrite($Config_INI, "Settings", "Audio_Playback_Device", $ComboBox)
		EndIf
	EndIf
EndFunc

Func _Combo_Recording_Device()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11339) :(' & @MIN & ':' & @SEC & ') _Combo_Recording_Device()' & @CR) ;### Function Trace
	Local $SSD_INI = $Install_DIR & "Apps\SSD_SetSoundDevice\SSD.ini"
	Local $NR_of_Playback_Devices = IniRead($SSD_INI, "HomeLoader", "NR_of_Playback_Devices", "")
	Local $NR_of_Recording_Devices = IniRead($SSD_INI, "HomeLoader", "NR_of_Recording_Devices", "")

	If $NR_of_Recording_Devices = "" Then
		MsgBox($MB_OK + $MB_ICONINFORMATION, "SSD - SetSoundDevice", "Open 'SSD - Set Sound Device' first and create shortcuts for the recording device that you want to use.")
	Else
		Local $ComboBox = GUICtrlRead($Combo_Recording_Device)
		If $ComboBox = "" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "No recording device selected", "Select the recording device in the dropdown list.")
		Else
			IniWrite($Config_INI, "Settings", "Audio_Recording_Device", $ComboBox)
		EndIf
	EndIf
EndFunc


Func _Button_Set_Playback_Device()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11358) :(' & @MIN & ':' & @SEC & ') _Button_Set_Playback_Device()' & @CR) ;### Function Trace
	Local $Sound_Device_Name = IniRead($Config_INI, "Settings", "Audio_Playback_Device", "")
	Local $Sound_Device_Temp = $Install_DIR & "Apps\SSD_SetSoundDevice\" & $Sound_Device_Name & ".lnk"

	If Not ProcessExists("vrmonitor.exe") Then
		Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "SteamVR not running", "SteamVR is not running." & @CRLF & _
				"The device may not be found if the headset is unplugged or if SteamVR is not running." & @CRLF & _
				"" & @CRLF & @CRLF & _
				'Do you still want to set the audio device?' & @CRLF)

		If $Abfrage = 6 Then
			If FileExists($Sound_Device_Temp) Then
				ShellExecute($Sound_Device_Temp)
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Audio Playback Device changed to:" & $Sound_Device_Temp & " <--- " & "[" & _Now() & "]")
			EndIf
		EndIf
	Else
		If FileExists($Sound_Device_Temp) Then
			ShellExecute($Sound_Device_Temp)
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Audio Playback Device changed to:" & $Sound_Device_Temp & " <--- " & "[" & _Now() & "]")
		EndIf
	EndIf
EndFunc

Func _Button_Set_Recording_Device()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11383) :(' & @MIN & ':' & @SEC & ') _Button_Set_Recording_Device()' & @CR) ;### Function Trace
	Local $Sound_Device_Name = IniRead($Config_INI, "Settings", "Audio_Recording_Device", "")
	Local $Sound_Device_Temp = $Install_DIR & "Apps\SSD_SetSoundDevice\" & $Sound_Device_Name & ".lnk"

	If Not ProcessExists("vrmonitor.exe") Then
		Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "SteamVR not running", "SteamVR is not running." & @CRLF & _
				"The device may not be found if the headset is unplugged or if SteamVR is not running." & @CRLF & _
				"" & @CRLF & @CRLF & _
				'Do you still want to set the audio device?' & @CRLF)

		If $Abfrage = 6 Then
			If FileExists($Sound_Device_Temp) Then
				ShellExecute($Sound_Device_Temp)
				FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Audio Recording Device changed to:" & $Sound_Device_Temp & " <--- " & "[" & _Now() & "]")
			EndIf
		EndIf
	Else
		If FileExists($Sound_Device_Temp) Then
			ShellExecute($Sound_Device_Temp)
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Audio Recording Device changed to:" & $Sound_Device_Temp & " <--- " & "[" & _Now() & "]")
		EndIf
	EndIf
EndFunc



Func _Checkbox_Update_Check_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11410) :(' & @MIN & ':' & @SEC & ') _Checkbox_Update_Check_1()' & @CR) ;### Function Trace
	Local $CheckBox = GUICtrlRead($Checkbox_Update_Check_1)
	If $CheckBox = "" Then
		GUICtrlSetData($Checkbox_Update_Check_1, "a")
		IniWrite($Config_INI, "Settings", "Update_Check", "true")
	Else
		GUICtrlSetData($Checkbox_Update_Check_1, "")
		IniWrite($Config_INI, "Settings", "Update_Check", "false")
	EndIf
	$Update_Check = IniRead($Config_INI, "Settings", "Update_Check", "")

	;_Set_States()
EndFunc

Func _Button_Update_Check_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11425) :(' & @MIN & ':' & @SEC & ') _Button_Update_Check_1()' & @CR) ;### Function Trace
	If FileExists($Install_DIR & "Update.exe") Then
		ShellExecute($Install_DIR & "Update.exe")
	Else
		ShellExecute($Install_DIR & "Update.au3")
	EndIf
EndFunc


#EndRegion Func Settings GUI

#Region Func SS_Settings GUI
Func _Slider_0()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11438) :(' & @MIN & ':' & @SEC & ') _Slider_0()' & @CR) ;### Function Trace
	Local $Value_Slider = GUICtrlRead($Slider_0)
	GUICtrlSetData($Input_ResolutionScale, $Value_Slider)
EndFunc   ;==>_Slider_0

Func _UpDown_ResolutionScale()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11444) :(' & @MIN & ':' & @SEC & ') _UpDown_ResolutionScale()' & @CR) ;### Function Trace
	Local $Value_UpDown = GUICtrlRead($Input_ResolutionScale)
	If $Value_UpDown < 20 Then $Value_UpDown = "20"
	If $Value_UpDown > 500 Then $Value_UpDown = "500"
	GUICtrlSetData($Input_ResolutionScale, $Value_UpDown)
	GUICtrlSetData($Slider_0, $Value_UpDown)
EndFunc   ;==>_UpDown_ResolutionScale

Func _SS_Checkbox_motionSmoothingOverride()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11453) :(' & @MIN & ':' & @SEC & ') _SS_Checkbox_motionSmoothingOverride()' & @CR) ;### Function Trace
	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	IniWrite($Config_INI, "TEMP", "GameID", $Game_ID)

	Local $App_NR = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "NR", "")

	Local $CheckBox = GUICtrlRead($SS_Checkbox_motionSmoothingOverride)
	If $CheckBox = "" Then
		GUICtrlSetData($SS_Checkbox_motionSmoothingOverride, "a")
		;MsgBox(0, $CheckBox, "true")
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $App_NR, "motionSmoothingOverride", "1")
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "motionSmoothingOverride", "1")
		$App_NR = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Game_ID, "NR", "")
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $App_NR, "motionSmoothingOverride", "1")
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Game_ID, "motionSmoothingOverride", "1")
	Else
		GUICtrlSetData($SS_Checkbox_motionSmoothingOverride, "")
		;MsgBox(0, $CheckBox, "false")
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $App_NR, "motionSmoothingOverride", "")
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "motionSmoothingOverride", "")
		$App_NR = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Game_ID, "NR", "")
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $App_NR, "motionSmoothingOverride", "")
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Game_ID, "motionSmoothingOverride", "")
	EndIf
	;$ScanLibrary_OnStart_SettingValue = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Settings", "motionSmoothingOverride", "")
	_Sync_All_INI_Files_1()
	_Set_States()
EndFunc

Func _Button_Save_Settings_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11490) :(' & @MIN & ':' & @SEC & ') _Button_Save_Settings_GUI()' & @CR) ;### Function Trace
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
	_Sync_All_INI_Files_1()
	_Set_States()
EndFunc   ;==>_Button_Save_Settings_GUI

Func _Button_Exit_SS_Settings_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11512) :(' & @MIN & ':' & @SEC & ') _Button_Exit_SS_Settings_GUI()' & @CR) ;### Function Trace
	GUIDelete($SS_Settings_GUI)
EndFunc   ;==>_Button_Exit_SS_Settings_GUI
#EndRegion Func SS_Settings GUI

#Region Func Home Loader
Func _Restart()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11519) :(' & @MIN & ':' & @SEC & ') _Restart()' & @CR) ;### Function Trace
	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
	;_Create_HLL_GUI()
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
	EndIf
	Sleep(750)
	GUIDelete($HLL_GUI_Handle)
	GUIDelete($HLL_GUI)
	Exit
EndFunc   ;==>_Restart

Func _Exit_Check()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11534) :(' & @MIN & ':' & @SEC & ') _Exit_Check()' & @CR) ;### Function Trace
	If Not ProcessExists("vrmonitor.exe") Then
		FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " Exit Check: SteamVR is not running --> Exit [HomeLoaderLibrary]" & " '_Exit_Check()'")
		Local $Check_File = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\" & $SteamVR_Environment_Name & "\temp\log.txt"
		If FileExists($Check_File) Then FileDelete($Check_File)
		Exit
	EndIf
EndFunc   ;==>_Exit_Check

Func _Exit_Check_VRUB()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11544) :(' & @MIN & ':' & @SEC & ') _Exit_Check_VRUB()' & @CR) ;### Function Trace
	If Not ProcessExists("VRUtilityBelt.exe") Then
		FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " Exit Check: VRUB is not running --> Exit [HomeLoaderLibrary]" & " '_Exit_Check()'")
		Local $Check_File = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\" & $SteamVR_Environment_Name & "\temp\log.txt"
		If FileExists($Check_File) Then FileDelete($Check_File)
		Exit
	EndIf
	_Exit_Check()
EndFunc   ;==>_Exit_Check

Func _Exit()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11555) :(' & @MIN & ':' & @SEC & ') _Exit()' & @CR) ;### Function Trace
	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
	GUIDelete($HLL_GUI)
	Local $Check_File = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\" & $SteamVR_Environment_Name & "\temp\log.txt"
	If FileExists($Check_File) Then FileDelete($Check_File)
	Exit
EndFunc   ;==>_Beenden
#EndRegion Func Home Loader

#Region Func OVERLAY
Func _Overlay_ReScan_Steam_Library()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11566) :(' & @MIN & ':' & @SEC & ') _Overlay_ReScan_Steam_Library()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11601) :(' & @MIN & ':' & @SEC & ') _Overlay_Search_Files()' & @CR) ;### Function Trace
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
		$Array_Result = $FileList
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()
		Global $Application_NR
		If $NR_Library_temp = 1 Then $Application_NR = 1

		If IsArray($FileList) Then
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
		EndIf
		$FileList = ""
	EndIf
EndFunc   ;==>_Overlay_Search_Files

Func _Overlay_ApplicationList_Update()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11641) :(' & @MIN & ':' & @SEC & ') _Overlay_ApplicationList_Update()' & @CR) ;### Function Trace
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

Func _Copy_To_VRUB()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11772) :(' & @MIN & ':' & @SEC & ') _Copy_To_VRUB()' & @CR) ;### Function Trace
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start updating VRUB Overlay.")
	Local $VRUB_Overlay_Folder = $VRUB_Folder & "addons\custom\HomeLoader\overlays\HomeLoader\"
	;Local $File_1 = $Install_DIR & "WebPage\GamePage_ALL.html"
	;Local $File_2 = $Install_DIR & "WebPage\GamePage_Custom_1.html"
	;Local $File_3 = $Install_DIR & "WebPage\GamePage_Custom_2.html"
	;Local $File_4 = $Install_DIR & "WebPage\GamePage_Custom_3.html"
	;Local $File_5 = $Install_DIR & "WebPage\GamePage_Custom_4.html"
	;Local $File_6 = $Install_DIR & "WebPage\GamePage_Non-Steam_Appl.html"
	;Local $File_7 = $Install_DIR & "WebPage\GamePage_Oculus.html"
	Local $File_8 = $Install_DIR & "WebPage\GamePage_Tags.html"
	;Local $File_9 = $Install_DIR & "WebPage\GamePage_Viveport.html"
	Local $File_10 = $Install_DIR & "WebPage\Tags\"

	If $VRUB_Folder <> "" Then
		;If FileExists($File_1) Then FileCopy($File_1, $VRUB_Overlay_Folder & "GamePage_ALL.html", $FC_OVERWRITE + $FC_CREATEPATH)
		;If FileExists($File_2) Then FileCopy($File_2, $VRUB_Overlay_Folder & "GamePage_Custom_1.html", $FC_OVERWRITE + $FC_CREATEPATH)
		;If FileExists($File_3) Then FileCopy($File_3, $VRUB_Overlay_Folder & "GamePage_Custom_2.html", $FC_OVERWRITE + $FC_CREATEPATH)
		;If FileExists($File_4) Then FileCopy($File_4, $VRUB_Overlay_Folder & "GamePage_Custom_3.html", $FC_OVERWRITE + $FC_CREATEPATH)
		;If FileExists($File_5) Then FileCopy($File_5, $VRUB_Overlay_Folder & "GamePage_Custom_4.html", $FC_OVERWRITE + $FC_CREATEPATH)
		;If FileExists($File_6) Then FileCopy($File_6, $VRUB_Overlay_Folder & "GamePage_Non-Steam_Appl.html", $FC_OVERWRITE + $FC_CREATEPATH)
		;If FileExists($File_7) Then FileCopy($File_7, $VRUB_Overlay_Folder & "GamePage_Oculus.html", $FC_OVERWRITE + $FC_CREATEPATH)
		If FileExists($File_8) Then FileCopy($File_8, $VRUB_Overlay_Folder & "GamePage_Tags.html", $FC_OVERWRITE + $FC_CREATEPATH)
		;If FileExists($File_9) Then FileCopy($File_9, $VRUB_Overlay_Folder & "GamePage_Viveport.html", $FC_OVERWRITE + $FC_CREATEPATH)

		If FileExists($File_10) Then DirCopy($File_10, $VRUB_Overlay_Folder & "Tags\", $FC_OVERWRITE)
	EndIf

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " VRUB Overlay updated.")
EndFunc

#EndRegion Func OVERLAY

#Region Func VR ToolBox
Func _Create_VRToolBox_StartPage()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11807) :(' & @MIN & ':' & @SEC & ') _Create_VRToolBox_StartPage()' & @CR) ;### Function Trace
	Local $Array_StartPageTemplate_Value

	Local $StartPage_path = $Install_DIR & "WebPage\VRToolBox_StartPage.html"
	If FileExists($StartPage_path) Then FileDelete($StartPage_path)
	Local $StartPageTemplate = $Install_DIR & "WebPage\VRToolBox.html"
	$Array_Result = _FileReadToArray($StartPageTemplate, $Array_StartPageTemplate_Value, $FRTA_COUNT)
	If @error Then
		$ScriptLineNumber_Temp = @ScriptLineNumber
		$AtError_Result = @error
	EndIf
	If $AtError_Result <> "" Or $Array_Result = -1 Then _FileReadToArray_Error_Handler()


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
	$Array_Result = $FolderList
	If @error Then
		$ScriptLineNumber_Temp = @ScriptLineNumber
		$AtError_Result = @error
	EndIf
	If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()

	If IsArray($FolderList) Then
		For $Loop_Temp = 1 To $FolderList[0]
			Local $Addon_Path = $LocalFolder & $FolderList[$Loop_Temp] & "\index.html"
			If $FolderList[$Loop_Temp] = "HomeLoader" Then $Addon_Path = $LocalFolder & $FolderList[$Loop_Temp] & "\HomeLoader_StartPage.html"
			Local $Addon_Path_Replaced = StringReplace($Addon_Path, '\', '/')
			Local $IconPath_TEMP = $LocalFolder & $FolderList[$Loop_Temp] & "\icon.png"
			If FileExists($Addon_Path) Then
				FileWriteLine($StartPage_path, '    <div class="tooltip"><a href="file:///' & $Addon_Path_Replaced & '">         <img class="icon" src="' & $IconPath_TEMP & '" width="200" />                    <span class="tooltiptext">' & $FolderList[$Loop_Temp] & '</span></a></div>')
			EndIf
		Next
	EndIf

	FileWriteLine($StartPage_path, '    <br>')
	FileWriteLine($StartPage_path, '  </div>')
	FileWriteLine($StartPage_path, '</body>')
	FileWriteLine($StartPage_path, '</html>')
EndFunc   ;==>_Create_VRToolBox_StartPage

Func _Create_VRToolBox_HL_StartPage()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11860) :(' & @MIN & ':' & @SEC & ') _Create_VRToolBox_HL_StartPage()' & @CR) ;### Function Trace
	Local $FileRead_HL_StartPage_Template = FileRead($Install_DIR & "WebPage\Templates\HomeLoader_StartPage.html")
	Local $FileRead_HL_StartPage = $Install_DIR & "Apps\VRToolBox\HomeLoader\HomeLoader_StartPage.html"
	Local $HL_StartPage_Install_Dir_Replace = "file:///" & StringReplace($Install_DIR, '\', '/')

	Local $FileRead_HL_StartPage_Replace = StringReplace($FileRead_HL_StartPage_Template, '___Instal_Dir___', $HL_StartPage_Install_Dir_Replace)

	If FileExists($FileRead_HL_StartPage) Then FileDelete($FileRead_HL_StartPage)
	FileWrite($FileRead_HL_StartPage, $FileRead_HL_StartPage_Replace)
EndFunc   ;==>_Create_VRToolBox_HL_StartPage

Func _Create_VRToolBox_VideoPage()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11872) :(' & @MIN & ':' & @SEC & ') _Create_VRToolBox_VideoPage()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11896) :(' & @MIN & ':' & @SEC & ') _Copy_2_VRToolBox()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11926) :(' & @MIN & ':' & @SEC & ') _Create_GamePage_Menu_Page()' & @CR) ;### Function Trace
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11953) :(' & @MIN & ':' & @SEC & ') _Create_GamePages()' & @CR) ;### Function Trace
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
					'<h1>' & $PageName & '</h1><br><br><br>' & @CRLF & _
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
						'<h1>' & $PageName & '</h1><br><br><br>' & @CRLF & _
						'<div class="icons">' & @CRLF
			EndIf

			If $Add_Back_to_HTML_GamePage = "true" Then
				Local $Content_Back = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
						'	<a href="GamePage_Menu.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
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

				If $Loop_Temp <> 2 Then
					If $HomeApp = "VR Toolbox" Then
						If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'steam://rungameid/" & $Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
						If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'vive://runapp/" & $StringTrimLeft_Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf

					If $HomeApp <> "VR Toolbox" Then
						If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
						If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="vive://runapp/' & $StringTrimLeft_Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf
				Else
					If $HomeApp = "VR Toolbox" Then
						FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & $Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf

					If $HomeApp <> "VR Toolbox" Then
						FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="' & $Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf
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
				'<h1>' & $PageName & '</h1><br><br><br>' & @CRLF & _
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
					'<h1>' & $PageName & '</h1><br><br><br>' & @CRLF & _
					'<div class="icons">' & @CRLF
		EndIf

		If $Add_Back_to_HTML_GamePage = "true" Then
			Local $Content_Back = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
					'	<a href="GamePage_Menu.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
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
			Local $GamePage_Tags_path_folder = $Install_DIR & "WebPage\Tags\"

			If FileExists($GamePage_path_temp) Then FileDelete($GamePage_path_temp)

			Local $HTML_Content = '<html>' & @CRLF & _
					'<head>' & @CRLF & _
					'    <title>GamePage</title>' & @CRLF & _
					'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
					'</head>' & @CRLF & _
					'<body>' & @CRLF & _
					'<script>' & @CRLF & _
					' function goBack() {' & @CRLF & _
					'    window.history.back();' & @CRLF & _
					'}' & @CRLF & _
					' ' & @CRLF & _
					'</script>' & @CRLF & _
					'<h1>' & $FileName & '</h1><br><br><br>' & @CRLF & _
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
						'<h1>' & $FileName & '</h1><br><br><br>' & @CRLF & _
						'<div class="icons">' & @CRLF
			EndIf

			If $Add_Back_to_HTML_GamePage = "true" Then
				Local $Content_Back = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
						'	<a onclick="goBack()" href="Back.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
						'</div>' & @CRLF

				$HTML_Content = $HTML_Content & $Content_Back
			EndIf

			FileWrite($GamePage_path_temp, $HTML_Content)

			Local $Back_Content = '<meta http-equiv="refresh" content="0; url=file:///' & $Install_DIR & 'WebPage/' & 'GamePage_Tags.html">'

			If FileExists($GamePage_Tags_path_folder & "Back.html") Then FileDelete($GamePage_Tags_path_folder & "Back.html")
			FileWrite($GamePage_Tags_path_folder & "Back.html", $Back_Content)

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
					If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path_temp, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'steam://rungameid/" & $Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf

				If $HomeApp <> "VR Toolbox" Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path_temp, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (12367) :(' & @MIN & ':' & @SEC & ') _Create_SinglePages()' & @CR) ;### Function Trace
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
				'	<a href="GamePage_Menu.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (12475) :(' & @MIN & ':' & @SEC & ') _Create_Game_Tags_Page()' & @CR) ;### Function Trace
	Local $Value_Line, $Value_Line_ADD, $Value_Line_1, $Value_Line_Tag
	Local $Install_DIR_Replaced = StringReplace($Install_DIR, '\', '/')

	Local $Array_GamePage_Tags[1]

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 25)

	For $Loop_1 = 1 To 30
		$Value_Line_Tag = FileReadLine($Tags_TXT, $Loop_1)

		$Value_Line_ADD = '<a href="Tags/' & $Value_Line_Tag & '.html' & '" class="Tag_button">' & $Value_Line_Tag & '</a>&nbsp;&nbsp;&nbsp;&nbsp;'
		If $Loop_1 = 4 Or $Loop_1 = 8 Or $Loop_1 = 12  Or $Loop_1 = 16 Or $Loop_1 = 20 Or $Loop_1 = 24 Or $Loop_1 = 28 Then
			$Value_Line_ADD = '<a href="Tags/' & $Value_Line_Tag & '.html' & '" class="Tag_button">' & $Value_Line_Tag & '</a><br><br><br>'
		EndIf

		;Local $sFill = $Value_Line_Left & "|" & $Value_Line_Tag & "|" & $Value_Line_Right
		$Array_Result = _ArrayAdd($Array_GamePage_Tags, $Value_Line_ADD)
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
	Next

	;_ArrayDisplay($Array_GamePage_Tags)

	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 50)

	If FileExists($Path_GamePage_Tags) Then FileDelete($Path_GamePage_Tags)

	For $Loop_2 = 1 To 11
		$Value_Line = FileReadLine($Install_DIR & "WebPage\Templates\GamePage_Tags.html", $Loop_2)
		FileWriteLine($Path_GamePage_Tags, $Value_Line)
	Next

	Local $Content = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
					'	<a href="GamePage_Menu.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
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

#Region Func Create SteamVR_Home Pages / Game Pages
Func _Button_SteamVRHome_Panel_Settings()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (12534) :(' & @MIN & ':' & @SEC & ') _Button_SteamVRHome_Panel_Settings()' & @CR) ;### Function Trace
	If Not WinExists("HomeLoader - SteamVR Environment Settings") Then
		Local $SteamVR_Environment_Name_Check = "homeloader"
		Local $SteamVR_EnvironmentPath_Check = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\" & $SteamVR_Environment_Name_Check & "\"

		If FileExists($SteamVR_EnvironmentPath_Check) Then
			_Create_SteamVRHome_Environment_Settings_GUI()
			_Set_SteamVR_Home_Panel_GUI_Data()
			GUISetState(@SW_SHOW)
		Else
			Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Attention", "" & @CRLF & _
																	"HomeLoader SteamVR Home Workshop Environment is not prepared for use." & @CRLF & @CRLF & _
																	"Do you want to prepare the downloaded HomeLoader SteamVR Home Workshop Environment for use with HomeLoader?" & @CRLF)

			If $Abfrage = 6 Then
				_Preparing_GUI()
				_Create_HomeLoader_Environment_Files_Folders()
				Sleep(100)
				;_Check_for_HomeLoader_Environment_Map_Folders()
				;_Exit_Preparing_GUI()
			Else

			EndIf
		EndIf
	EndIf
EndFunc

Func _Create_SteamVRHome_Environment_Settings_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (12560) :(' & @MIN & ':' & @SEC & ') _Create_SteamVRHome_Environment_Settings_GUI()' & @CR) ;### Function Trace
	_Loading_GUI()
	$Panel_Name_1 = IniRead($Config_INI, "Settings", "TAB1_Name", "Steam Library")
	$Panel_Name_2 = IniRead($Config_INI, "Settings", "TAB2_Name", "Non-Steam_Appl")
	$Panel_Name_3 = IniRead($Config_INI, "Settings", "TAB3_Name", "Custom 1")
	$Panel_Name_4 = IniRead($Config_INI, "Settings", "TAB4_Name", "Custom 2")
	$Panel_Name_5 = IniRead($Config_INI, "Settings", "TAB5_Name", "Custom 3")
	$Panel_Name_6 = IniRead($Config_INI, "Settings", "TAB6_Name", "Custom 4")

	Global $SteamVR_Home_Panels_GUI = GUICreate("HomeLoader - SteamVR Environment Settings", 1014, 734, -1, -1, BitOR($WS_BORDER, $WS_CAPTION, $WS_SYSMENU))
	GUISetState(@SW_HIDE, $SteamVR_Home_Panels_GUI)
	Local $hMenu = _GUICtrlMenu_GetSystemMenu($SteamVR_Home_Panels_GUI)
	Local $iMenuItemCount = _GUICtrlMenu_GetItemCount($hMenu)
	_GUICtrlMenu_RemoveMenu($hMenu, $iMenuItemCount - 1, $MF_BYPOSITION)

	Local $Pos_X_1 = 10
	Local $Pos_X_2= 315
	Local $Pos_X_3= 755
	Local $Pos_X_4= 10
	Local $Pos_X_5= 710
	Local $Pos_X_6= 710
	Local $Pos_Y = 60
	Local $Pos_Y_2 = 55
	Local $Pos_Y_3 = 70
	Local $Pos_Y_4 = 542
	Local $Pos_Y_5 = 50
	Local $Pos_Y_6 = 372

	GUICtrlCreateLabel("SteamVR Home Environment: ", $Pos_X_1, $Pos_Y - 52, 300, 20)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 17, 500, 1, $font_arial)

	$Combo_Environment_Name = GUICtrlCreateCombo("", $Pos_X_1 + 305, $Pos_Y - 55, 386, 33, $CBS_DROPDOWNLIST)
	GUICtrlSetFont(-1, 14, $FW_NORMAL, "", $font_Consolas)
	GuiCtrlSetTip(-1, "Select the SteamVR Environment you want to use. If you have other Environments saved in your Steam steamvr_environments folder then you can use them too.")
	GUICtrlSetOnEvent(-1, "_Combo_Environment_Name")

	;Global $contextmenu_Combo_Environment_Name = GUICtrlCreateContextMenu($Combo_Environment_Name)
	;Global $RM_Combo_Environment_Name_1 = GUICtrlCreateMenuItem("Prepare new SteamVR Home Workshop Environment for use with HomeLoader", $contextmenu_Combo_Environment_Name)
	;GUICtrlSetOnEvent(-1, "_RM_Combo_Environment_Name_1")

	Global $Button_Prepare_Environment = GUICtrlCreateButton("Update/Prepare Environment", $Pos_X_1 + 699, $Pos_Y - 56, 296, 31)
	GuiCtrlSetTip(-1, "Updates and prepares the downloaded HomeLoader SteamVR Workshop Environment.")
	GUICtrlSetFont(-1, 14, 600, 2, $font_arial)
	GUICtrlSetColor(-1, "0x006600")
	GUICtrlSetOnEvent(-1, "_RM_Selection_Prepare_Environment_Button")
	_RM_Selection_Update_Prepare_Button_Contextmenu()





	#Region X 1
	GUICtrlCreateLabel("Enable/Disable SteamVR Home Panels:", $Pos_X_1, $Pos_Y - 10, 400, 20)
	;GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 12, 400, 6, $font_arial)

	GUICtrlCreateGroup("", $Pos_X_1, $Pos_Y + 07, 295, 295)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

	Global $Checkbox_Panel_1 = GUICtrlCreateCheckbox(" Panel 1 [" & $Panel_Name_1 & "]", $Pos_X_1 + 5, $Pos_Y + 25, 230, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_1")

	Global $Checkbox_Panel_2 = GUICtrlCreateCheckbox(" Panel 2 [" & $Panel_Name_2 & "]", $Pos_X_1 + 5, $Pos_Y + 45, 230, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_2")

	Global $Checkbox_Panel_3 = GUICtrlCreateCheckbox(" Panel 3 [" & $Panel_Name_3 & "]", $Pos_X_1 + 5, $Pos_Y + 65, 230, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_3")

	Global $Checkbox_Panel_4 = GUICtrlCreateCheckbox(" Panel 4 [" & $Panel_Name_4 & "]", $Pos_X_1 + 5, $Pos_Y + 85, 230, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_4")

	Global $Checkbox_Panel_5 = GUICtrlCreateCheckbox(" Panel 5 [" & $Panel_Name_5 & "]", $Pos_X_1 + 5, $Pos_Y + 105, 230, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_5")

	Global $Checkbox_Panel_6 = GUICtrlCreateCheckbox(" Panel 6 [" & $Panel_Name_6 & "]", $Pos_X_1 + 5, $Pos_Y + 125, 230, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_6")

	Global $Checkbox_Panel_7 = GUICtrlCreateCheckbox(" Panel 7 [" & $Panel_Name_7 & "]", $Pos_X_1 + 5, $Pos_Y + 145, 230, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_7")

	Global $Checkbox_Panel_8 = GUICtrlCreateCheckbox(" Panel 8 [" & $Panel_Name_8 & "]", $Pos_X_1 + 5, $Pos_Y + 165, 230, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_8")

	Global $Checkbox_Panel_9 = GUICtrlCreateCheckbox(" Panel 9 [" & $Panel_Name_9 & "]", $Pos_X_1 + 5, $Pos_Y + 185, 280, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_9")

	Global $Checkbox_Panel_10 = GUICtrlCreateCheckbox(" Panel 10 [" & $Panel_Name_10 & "]", $Pos_X_1 + 5, $Pos_Y + 205, 280, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_10")

	Global $Checkbox_Panel_11 = GUICtrlCreateCheckbox(" Panel 11 [" & $Panel_Name_11 & "]", $Pos_X_1 + 5, $Pos_Y + 225, 280, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_11")

	Global $Checkbox_Panel_Tutorials = GUICtrlCreateCheckbox(" Show Tutorial Panels", $Pos_X_1 + 5, $Pos_Y + 275, 280, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_Panel_Turorials")
	#endregion


	#Region X 2
	GUICtrlCreateLabel("Tool Panel Selection:", $Pos_X_1, $Pos_Y_2 + 325, 350, 20)
	;GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 12, 400, 6, $font_arial)

	GUICtrlCreateGroup("", $Pos_X_1, $Pos_Y_2 + 342, 295, 125)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

	GUICtrlCreateLabel($Panel_Name_10, $Pos_X_1 + 5, $Pos_Y_2 + 365, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Tool_1 = GUICtrlCreateCombo("", $Pos_X_1 + 148, $Pos_Y_2 + 362, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Tool_1")

	GUICtrlCreateLabel($Panel_Name_11, $Pos_X_1 + 5, $Pos_Y_2 + 388, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Tool_2 = GUICtrlCreateCombo("", $Pos_X_1 + 148, $Pos_Y_2 + 385, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Tool_2")
	#endregion


	#Region X 3
	GUICtrlCreateLabel("Panel Appearance:", $Pos_X_2 + 5, $Pos_Y_3 - 20, 205, 20)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 12, 400, 6, $font_arial)

	GUICtrlCreateGroup("", $Pos_X_2, $Pos_Y_3 - 03, 387, 607)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

	GUICtrlCreateLabel("Panel Nr.", $Pos_X_2 + 5, $Pos_Y_3 + 20, 65, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Panel_Nr_Selection_Input = GUICtrlCreateInput("", $Pos_X_2 + 160, $Pos_Y_3 + 17, 50, 20)
	GUICtrlSetBkColor(-1, 0xD3D3D3)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Panel_Nr_Selection_Updown = GUICtrlCreateUpdown($Panel_Nr_Selection_Input)
	GUICtrlSetOnEvent(-1, "_Panel_Nr_Selection_Updown")
	Global $Panel_Nr_Selection_Input_Name = GUICtrlCreateInput("", $Pos_X_2 + 215, $Pos_Y_3 + 17, 165, 20)
	GUICtrlSetBkColor(-1, 0xD3D3D3)


	GUICtrlCreateLabel("Panel width:", $Pos_X_2 + 5, $Pos_Y_3 + 48, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_width = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 45, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_width")

	GUICtrlCreateLabel("Panel height:", $Pos_X_2 + 5, $Pos_Y_3 + 71, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_height = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 68, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_height")

	GUICtrlCreateLabel("Background color:", $Pos_X_2 + 5, $Pos_Y_3 + 94, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_background_color = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 91, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_background_color")

	GUICtrlCreateLabel("Border:", $Pos_X_2 + 5, $Pos_Y_3 + 117, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_border = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 114, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_border")

	GUICtrlCreateLabel("Border color:", $Pos_X_2 + 5, $Pos_Y_3 + 140, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_border_color = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 137, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_border_color")

	GUICtrlCreateLabel("Border radius:", $Pos_X_2 + 5, $Pos_Y_3 + 163, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_border_radius = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 160, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_border_radius")

	GUICtrlCreateLabel("Saturation:", $Pos_X_2 + 5, $Pos_Y_3 + 186, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_saturation = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 183, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_saturation")

	GUICtrlCreateLabel("Scale:", $Pos_X_2 + 5, $Pos_Y_3 + 209, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_scale = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 206, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_scale")

	GUICtrlCreateLabel("Text size:", $Pos_X_2 + 5, $Pos_Y_3 + 232, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Text_size = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 229, 165, 55)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Text_size")

	GUICtrlCreateLabel("Text color:", $Pos_X_2 + 5, $Pos_Y_3 + 255, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Text_Color = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 252, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Text_Color")

	GUICtrlCreateLabel("Text position:", $Pos_X_2 + 5, $Pos_Y_3 + 278, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_text_position = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 275, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_text_position")

	GUICtrlCreateLabel("Text distance to the upper edge:", $Pos_X_2 + 5, $Pos_Y_3 + 301, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Text_distance = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 298, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Text_distance")

	GUICtrlCreateLabel("Icon distance to the upper edge:", $Pos_X_2 + 5, $Pos_Y_3 + 324, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Icon_distance = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 321, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Icon_distance")

	GUICtrlCreateLabel("Icon width:", $Pos_X_2 + 5, $Pos_Y_3 + 347, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Icon_width = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 344, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Icon_width")

	GUICtrlCreateLabel("Icon height:", $Pos_X_2 + 5, $Pos_Y_3 + 370, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Icon_height = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 367, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Icon_height")

	GUICtrlCreateLabel("Icon radius:", $Pos_X_2 + 5, $Pos_Y_3 + 393, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Icon_radius = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 390, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Icon_radius")


	GUICtrlCreateLabel("Icon border (hover):", $Pos_X_2 + 5, $Pos_Y_3 + 416, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Icon_border_hover = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 413, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Icon_border_hover")

	GUICtrlCreateLabel("Icon border color (hover):", $Pos_X_2 + 5, $Pos_Y_3 + 439, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Icon_border_color_hover = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 436, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Icon_border_color_hover")

	GUICtrlCreateLabel("Icon border radius (hover):", $Pos_X_2 + 5, $Pos_Y_3 + 462, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Icon_border_radius_hover = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 459, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Icon_border_radius_hover")

	GUICtrlCreateLabel("Scroll button position:", $Pos_X_2 + 5, $Pos_Y_3 + 485, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Scroll_button_position = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 482, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Scroll_button_position")

	GUICtrlCreateLabel("Scroll button width:", $Pos_X_2 + 5, $Pos_Y_3 + 508, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Scroll_button_width = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 505, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Scroll_button_width")

	GUICtrlCreateLabel("Scroll button height:", $Pos_X_2 + 5, $Pos_Y_3 + 531, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Scroll_button_height = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 528, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Scroll_button_height")

	GUICtrlCreateLabel("Scroll button color:", $Pos_X_2 + 5, $Pos_Y_3 + 554, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Scroll_button_color = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 551, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Scroll_button_color")

	GUICtrlCreateLabel("Scroll button border radius:", $Pos_X_2 + 5, $Pos_Y_3 + 577, 205, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	Global $Combo_Panel_Scroll_button_border_radius = GUICtrlCreateCombo("", $Pos_X_2 + 215, $Pos_Y_3 + 574, 165, 20)
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Scroll_button_border_radius")
	#endregion

	#Region X 4
	GUICtrlCreateLabel("Props / 3D Models:", $Pos_X_4, $Pos_Y_4 - 10, 150, 20)
	;GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 12, 400, 6, $font_arial)

	GUICtrlCreateGroup("", $Pos_X_4, $Pos_Y_4 + 07, 295, 125)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_arial)


	Global $Checkbox_DVD_Case_1 = GUICtrlCreateCheckbox(" Enable DVD Case", $Pos_X_4 + 5, $Pos_Y_4 + 25, 230, 20)
	GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_DVD_Case_1")

	GUICtrlCreateLabel("DVD Cover Template: ", $Pos_X_4 + 5, $Pos_Y_4 + 50, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	Global $Combo_DVD_Cover_Template = GUICtrlCreateCombo("", $Pos_X_4 + 138, $Pos_Y_4 + 48, 150, 20)
	GUICtrlSetOnEvent(-1, "_Combo_DVD_Cover_Template")

	;Global $Checkbox_Arcade_Machine_1 = GUICtrlCreateCheckbox(" Enable Arcade Machine", $Pos_X_4 + 5, $Pos_Y_4 + 75, 230, 20)
	;GUICtrlSetFont(-1, 11, $FW_NORMAL, "", $font_2)
	;GUICtrlSetOnEvent(-1, "_Checkbox_Arcade_Machine_1")
	;GUICtrlSetState($Checkbox_Arcade_Machine_1, $GUI_DISABLE)
	#endregion

	#Region X 5
	GUICtrlCreateLabel("HomeLoader Menu:", $Pos_X_5, $Pos_Y_5, 350, 20)
	;GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 12, 400, 6, $font_arial)

	GUICtrlCreateGroup("", $Pos_X_5, $Pos_Y_5 + 17, 295, 285)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_arial)

	Global $Checkbox_HL_Environment_Enable_Row_1 = GUICtrlCreateCheckbox(" Category for Row 1", $Pos_X_5 + 5, $Pos_Y_5 + 35, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_HL_Environment_Enable_Row_1")
	Global $Combo_HomeLoader_Menu_Category_Row_1 = GUICtrlCreateCombo("", $Pos_X_5 + 148, $Pos_Y_5 + 32, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_HomeLoader_Menu_Category_Row_1")

	Global $Checkbox_HL_Environment_Enable_Row_2 = GUICtrlCreateCheckbox(" Category for Row 2", $Pos_X_5 + 5, $Pos_Y_5 + 59, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_HL_Environment_Enable_Row_2")
	Global $Combo_HomeLoader_Menu_Category_Row_2 = GUICtrlCreateCombo("", $Pos_X_5 + 148, $Pos_Y_5 + 56, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_HomeLoader_Menu_Category_Row_2")

	Global $Checkbox_HL_Environment_Enable_Row_3 = GUICtrlCreateCheckbox(" Category for Row 3", $Pos_X_5 + 5, $Pos_Y_5 + 83, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_HL_Environment_Enable_Row_3")
	Global $Combo_HomeLoader_Menu_Category_Row_3 = GUICtrlCreateCombo("", $Pos_X_5 + 148, $Pos_Y_5 + 80, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_HomeLoader_Menu_Category_Row_3")

	Global $Checkbox_HL_Environment_Enable_Row_4 = GUICtrlCreateCheckbox(" Category for Row 4", $Pos_X_5 + 5, $Pos_Y_5 + 107, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_HL_Environment_Enable_Row_4")
	Global $Combo_HomeLoader_Menu_Category_Row_4 = GUICtrlCreateCombo("", $Pos_X_5 + 148, $Pos_Y_5 + 105, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_HomeLoader_Menu_Category_Row_4")

	Global $Checkbox_HL_Environment_Enable_Row_5 = GUICtrlCreateCheckbox(" Category for Row 5", $Pos_X_5 + 5, $Pos_Y_5 + 131, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_HL_Environment_Enable_Row_5")
	Global $Combo_HomeLoader_Menu_Category_Row_5 = GUICtrlCreateCombo("", $Pos_X_5 + 148, $Pos_Y_5 + 128, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_HomeLoader_Menu_Category_Row_5")

	Global $Checkbox_HL_Environment_Enable_Row_6 = GUICtrlCreateCheckbox(" Category for Row 6", $Pos_X_5 + 5, $Pos_Y_5 + 155, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_HL_Environment_Enable_Row_6")
	Global $Combo_HomeLoader_Menu_Category_Row_6 = GUICtrlCreateCombo("", $Pos_X_5 + 148, $Pos_Y_5 + 152, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_HomeLoader_Menu_Category_Row_6")

	Global $Checkbox_HL_Environment_Enable_Row_7 = GUICtrlCreateCheckbox(" Category for Row 7", $Pos_X_5 + 5, $Pos_Y_5 + 179, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_HL_Environment_Enable_Row_7")
	Global $Combo_HomeLoader_Menu_Category_Row_7 = GUICtrlCreateCombo("", $Pos_X_5 + 148, $Pos_Y_5 + 176, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_HomeLoader_Menu_Category_Row_7")

	Global $Checkbox_HL_Environment_Enable_Row_8 = GUICtrlCreateCheckbox(" Category for Row 8", $Pos_X_5 + 5, $Pos_Y_5 + 203, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_HL_Environment_Enable_Row_8")
	Global $Combo_HomeLoader_Menu_Category_Row_8 = GUICtrlCreateCombo("", $Pos_X_5 + 148, $Pos_Y_5 + 200, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_HomeLoader_Menu_Category_Row_8")

	Global $Checkbox_HL_Environment_Enable_Row_9 = GUICtrlCreateCheckbox(" Category for Row 9", $Pos_X_5 + 5, $Pos_Y_5 + 227, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	GUICtrlSetOnEvent(-1, "_Checkbox_HL_Environment_Enable_Row_9")
	Global $Combo_HomeLoader_Menu_Category_Row_9 = GUICtrlCreateCombo("", $Pos_X_5 + 148, $Pos_Y_5 + 224, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_HomeLoader_Menu_Category_Row_9")



	GUICtrlCreateLabel("Panel Distance", $Pos_X_5 + 5, $Pos_Y_5 + 256, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	Global $Combo_HomeLoader_Menu_Panel_Distance_1 = GUICtrlCreateCombo("", $Pos_X_5 + 148, $Pos_Y_5 + 253, 140, 20)
	GUICtrlSetOnEvent(-1, "_Combo_HomeLoader_Menu_Panel_Distance_1")


	;Local $Button_HomeLoader_Menu_1 = GUICtrlCreateButton("Create Menu Panel", $Pos_X_5 + 5, $Pos_Y_5 + 600, 140, 20, $BS_BITMAP)
	;GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	;GuiCtrlSetTip(-1, "Create Menu Panel")
	;GUICtrlSetOnEvent(-1, "_Create_Menu_Panel")

	;Local $Button_HomeLoader_Menu_2 = GUICtrlCreateButton("Create LUA File", $Pos_X_5 + 148, $Pos_Y_5 + 600, 140, 20, $BS_BITMAP)
	;GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	;GuiCtrlSetTip(-1, "Create Menu Panel")
	;GUICtrlSetOnEvent(-1, "_Create_Menu_LUA")
	#endregion

	#Region X 6
	GUICtrlCreateLabel("Environment:", $Pos_X_6, $Pos_Y_6, 350, 20)
	;GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 12, 400, 6, $font_arial)

	GUICtrlCreateGroup("", $Pos_X_6, $Pos_Y_6 + 17, 295, 285)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_arial)


	GUICtrlCreateLabel("Environment / Map", $Pos_X_6 + 5, $Pos_Y_6 + 35, 140, 20)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_2)
	Global $Combo_HomeLoader_Environment_Map = GUICtrlCreateCombo("", $Pos_X_6 + 120, $Pos_Y_6 + 32, 168, 20)
	GUICtrlSetOnEvent(-1, "_Combo_HomeLoader_Environment_Map")


	Global $Map_Preview_Image = GUICtrlCreatePic($gfx & "Environment_Map.jpg", $Pos_x_6 + 5, $Pos_Y_6 + 60, 283, 157)
	GUICtrlSetTip(-1, "Shows an preview image of the selected Environment Map.")
	GUICtrlSetOnEvent(-1, "_RM_Map_Preview_Image")
	_Create_RM_Map_Preview_Image()




	Local $Button_Environment_Apply_Map = GUICtrlCreateButton("Apply Map", $Pos_x_6 + 5, $Pos_Y_6 + 225, 140, 25, $BS_BITMAP)
	GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	GuiCtrlSetTip(-1, "Applies the selected Map to the Environment.")
	GUICtrlSetOnEvent(-1, "_Button_Environment_Apply_Map")

	Local $Button_Environment_Create_New_Map = GUICtrlCreateButton("Create New Map", $Pos_x_6 + 149, $Pos_Y_6 + 225, 140, 25, $BS_BITMAP)
	GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	GuiCtrlSetTip(-1, "Creates an new Map for use with the HomeLoader SteamVR Home Environment.")
	GUICtrlSetOnEvent(-1, "_Button_Environment_Create_New_Map")

	Global $Button_Environment_Edit_Map = GUICtrlCreateButton("Edit Map", $Pos_x_6 + 5, $Pos_Y_6 + 255, 140, 25, $BS_BITMAP)
	GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	GuiCtrlSetTip(-1, "Creates an new Map for use with the HomeLoader SteamVR Home Environment.")
	GUICtrlSetOnEvent(-1, "_Button_Environment_Edit_Map")

	Global $Button_Environment_Save_Map = GUICtrlCreateButton("Save Map", $Pos_x_6 + 149, $Pos_Y_6 + 255, 140, 25, $BS_BITMAP)
	GUICtrlSetFont(-1, 12, $FW_NORMAL, "", $font_2)
	GuiCtrlSetTip(-1, "Creates an new Map for use with the HomeLoader SteamVR Home Environment.")
	GUICtrlSetOnEvent(-1, "_Button_Environment_Save_Map")

	#endregion









	Global $Button_Panel_Settings_Apply = GUICtrlCreateButton("Apply", $Pos_X_1, $Pos_Y_3 + 615, 155, 32, $BS_BITMAP)
	GUICtrlSetFont(-1, 13, $FW_NORMAL, "", $font_2)
	GuiCtrlSetTip(-1, "Creates the Game Panels and/or DVD Cases using the current settings.")
	GUICtrlSetOnEvent(-1, "_Button_Panel_Settings_Apply")

	Global $Combo_Panel_Layout = GUICtrlCreateCombo("", $Pos_X_1 + 305, $Pos_Y_3 + 616, 386, 33, $CBS_DROPDOWNLIST)
	GUICtrlSetFont(-1, 14, $FW_NORMAL, "", $font_Consolas)
	GuiCtrlSetTip(-1, "Select saved settings to change the appearance of the panels.")
	GUICtrlSetOnEvent(-1, "_Combo_Panel_Layout")
	Global $contextmenu_Combo_Panel_Layout = GUICtrlCreateContextMenu($Combo_Panel_Layout)
	Global $RM_Combo_Panel_Layout_1 = GUICtrlCreateMenuItem("Save Environment Layout Settings", $contextmenu_Combo_Panel_Layout)
	GUICtrlSetOnEvent(-1, "_RM_Combo_Panel_Layout_1")





	Local $Button_Panel_Settings_Close = GUICtrlCreateButton("Close", $Pos_X_1 + 840, $Pos_Y_3 + 615, 155, 32, $BS_BITMAP)
	GUICtrlSetFont(-1, 13, $FW_NORMAL, "", $font_2)
	GuiCtrlSetTip(-1, "Closes the settings window.")
	GUICtrlSetOnEvent(-1, "_Close_Button_SteamVRHome_Panel_Settings_GUI")

	_RM_Button_SteamVRHome_Panel_Settings_Apply_Button()
EndFunc



Func _RM_Button_SteamVRHome_Panel_Settings()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (12972) :(' & @MIN & ':' & @SEC & ') _RM_Button_SteamVRHome_Panel_Settings()' & @CR) ;### Function Trace
	Global $contextmenu_Button_SteamVRHome_Panel_Settings = GUICtrlCreateContextMenu($Button_SteamVRHome_Panel_Settings)
	Global $RM_Button_SteamVRHome_Panel_Settings_1 = GUICtrlCreateMenuItem("Update all Environment Files", $contextmenu_Button_SteamVRHome_Panel_Settings)
	GUICtrlCreateMenuItem("", $contextmenu_Button_SteamVRHome_Panel_Settings)
	Global $RM_Button_SteamVRHome_Panel_Settings_2 = GUICtrlCreateMenuItem("Update Game Panels", $contextmenu_Button_SteamVRHome_Panel_Settings)
	Global $RM_Button_SteamVRHome_Panel_Settings_3 = GUICtrlCreateMenuItem("Update HomeLoader Menu", $contextmenu_Button_SteamVRHome_Panel_Settings)
	Global $RM_Button_SteamVRHome_Panel_Settings_4 = GUICtrlCreateMenuItem("Update DVD Case Models", $contextmenu_Button_SteamVRHome_Panel_Settings)
	;Global $RM_Button_SteamVRHome_Panel_Settings_5 = GUICtrlCreateMenuItem("Update Arcade Machine", $contextmenu_Button_SteamVRHome_Panel_Settings)
	GUICtrlCreateMenuItem("", $contextmenu_Button_SteamVRHome_Panel_Settings)

	;GUICtrlSetState($RM_Button_SteamVRHome_Panel_Settings_4, $GUI_DISABLE)

	GUICtrlSetOnEvent($RM_Button_SteamVRHome_Panel_Settings_1, "_RM_Button_SteamVRHome_Panel_Settings_1")
	GUICtrlSetOnEvent($RM_Button_SteamVRHome_Panel_Settings_2, "_RM_Button_SteamVRHome_Panel_Settings_2")
	GUICtrlSetOnEvent($RM_Button_SteamVRHome_Panel_Settings_3, "_RM_Button_SteamVRHome_Panel_Settings_3")
	GUICtrlSetOnEvent($RM_Button_SteamVRHome_Panel_Settings_4, "_RM_Button_SteamVRHome_Panel_Settings_4")
EndFunc

Func _RM_Button_SteamVRHome_Panel_Settings_Apply_Button()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (12991) :(' & @MIN & ':' & @SEC & ') _RM_Button_SteamVRHome_Panel_Settings_Apply_Button()' & @CR) ;### Function Trace
	Global $contextmenu_Button_SteamVRHome_Panel_Settings_Apply_Button = GUICtrlCreateContextMenu($Button_Panel_Settings_Apply)
	Global $RM_Button_SteamVRHome_Panel_Settings_Apply_Button_1 = GUICtrlCreateMenuItem("Update all Environment Files", $contextmenu_Button_SteamVRHome_Panel_Settings_Apply_Button)
	GUICtrlCreateMenuItem("", $contextmenu_Button_SteamVRHome_Panel_Settings_Apply_Button)
	Global $RM_Button_SteamVRHome_Panel_Settings_Apply_Button_2 = GUICtrlCreateMenuItem("Update Game Panels", $contextmenu_Button_SteamVRHome_Panel_Settings_Apply_Button)
	Global $RM_Button_SteamVRHome_Panel_Settings_Apply_Button_3 = GUICtrlCreateMenuItem("Update HomeLoader Menu", $contextmenu_Button_SteamVRHome_Panel_Settings_Apply_Button)
	Global $RM_Button_SteamVRHome_Panel_Settings_Apply_Button_4 = GUICtrlCreateMenuItem("Update DVD Case Models", $contextmenu_Button_SteamVRHome_Panel_Settings_Apply_Button)
	;Global $RM_Button_SteamVRHome_Panel_Settings_Apply_Button_5 = GUICtrlCreateMenuItem("Update Map", $contextmenu_Button_SteamVRHome_Panel_Settings_Apply_Button)
	GUICtrlCreateMenuItem("", $contextmenu_Button_SteamVRHome_Panel_Settings_Apply_Button)

	;GUICtrlSetState($RM_Button_SteamVRHome_Panel_Settings_4, $GUI_DISABLE)

	GUICtrlSetOnEvent($RM_Button_SteamVRHome_Panel_Settings_Apply_Button_1, "_RM_Button_SteamVRHome_Panel_Settings_1")
	GUICtrlSetOnEvent($RM_Button_SteamVRHome_Panel_Settings_Apply_Button_2, "_RM_Button_SteamVRHome_Panel_Settings_2")
	GUICtrlSetOnEvent($RM_Button_SteamVRHome_Panel_Settings_Apply_Button_3, "_RM_Button_SteamVRHome_Panel_Settings_3")
	GUICtrlSetOnEvent($RM_Button_SteamVRHome_Panel_Settings_Apply_Button_4, "_RM_Button_SteamVRHome_Panel_Settings_4")
	;GUICtrlSetOnEvent($RM_Button_SteamVRHome_Panel_Settings_Apply_Button_5, "_RM_Button_SteamVRHome_Panel_Settings_5")
EndFunc

Func _RM_Combo_Panel_Layout_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13010) :(' & @MIN & ':' & @SEC & ') _RM_Combo_Panel_Layout_1()' & @CR) ;### Function Trace
	Local $InputBox_Name = InputBox("Enter Layout Name", "Enter Layout Name and continue with 'OK'", "", "", 270, 140)
	Sleep(500)
	If $InputBox_Name <> "" Then
		Local $FilePath_Layout = $Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Panel_Layouts\Layout_" & $InputBox_Name & ".ini"

		If FileExists($Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Panel_Settings.ini") Then
			FileCopy($Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Panel_Settings.ini", $FilePath_Layout, $FC_OVERWRITE + $FC_CREATEPATH)
		EndIf
	EndIf
	Sleep(500)
	MsgBox($MB_OK + $MB_ICONINFORMATION, "Environment Layout Settings saved", "Environment Layout Settings saved." & @CRLF)
	_Set_SteamVR_Home_Panel_GUI_Data()
EndFunc

Func _RM_Selection_Update_Prepare_Button_Contextmenu()
	$SteamVR_Environment_Name = IniRead($Config_INI, "Settings", "SteamVR_Environment_Name", "homeloader")
	$contextmenu_Prepare_Environment_Button = GUICtrlCreateContextMenu($Button_Prepare_Environment)

	$RM_Prepare_Environment_Item_1 = GUICtrlCreateMenuItem("Open the HomeLoader SteamVR Home Environment Steam Page", $contextmenu_Prepare_Environment_Button)
	GUICtrlSetOnEvent(- 1, "_RM_Prepare_Environment_Item_1")

	$RM_Prepare_Environment_Item_2 = GUICtrlCreateMenuItem("Unpack the downloaded HomeLoader SteamVR Home Workshop Environment", $contextmenu_Prepare_Environment_Button)
	GUICtrlSetOnEvent(- 1, "_RM_Prepare_Environment_Item_2")

	;$RM_Prepare_Environment_Item_3 = GUICtrlCreateMenuItem("Unpack an new SteamVR Workshop Environment", $contextmenu_Prepare_Environment_Button)
	;GUICtrlSetOnEvent(- 1, "_RM_Prepare_Environment_Item_3")

	GUICtrlCreateMenuItem("", $contextmenu_Prepare_Environment_Button)

	$RM_Prepare_Environment_Item_4 = GUICtrlCreateMenuItem("Use unpacked workshop environment (longer loading time)", $contextmenu_Prepare_Environment_Button, -1, 1)
	If $Use_unpacked_workshop_environment = "true" Then GUICtrlSetState($RM_Prepare_Environment_Item_4, $GUI_CHECKED)
	GUICtrlSetOnEvent(- 1, "_RM_Prepare_Environment_Item_4")

	$RM_Prepare_Environment_Item_5 = GUICtrlCreateMenuItem("Use packed workshop environment (faster londing time)", $contextmenu_Prepare_Environment_Button, -1, 1)
	If $Use_unpacked_workshop_environment <> "true" Then GUICtrlSetState($RM_Prepare_Environment_Item_5, $GUI_CHECKED)
	GUICtrlSetOnEvent(- 1, "_RM_Prepare_Environment_Item_5")

	GUICtrlCreateMenuItem("", $contextmenu_Prepare_Environment_Button)

	$RM_Prepare_Environment_Item_6 = GUICtrlCreateMenuItem("Pack Current Environment to .vpk File.", $contextmenu_Prepare_Environment_Button)
	GUICtrlSetOnEvent(- 1, "_RM_Prepare_Environment_Item_6")
EndFunc

Func _Create_RM_Map_Preview_Image()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (12972) :(' & @MIN & ':' & @SEC & ') _RM_Button_SteamVRHome_Panel_Settings()' & @CR) ;### Function Trace

	Local $Value_Map = IniRead($SteamVR_Home_Environment_Settings_INI, "Settings", "Map", "")

	Local $Environment_Map = $Value_Map
	If $Environment_Map = "" Then
		$Environment_Map = "homeloader_default"
	EndIf

	Local $Map_INI = $HomeLoader_Map_Folder & $Environment_Map & "\map.ini"
	Local $Map_Name = IniRead($Map_INI, "Map", "Name", "")
	Local $Map_Environment_by = IniRead($Map_INI, "Map", "Environment_by", "")
	Local $Map_Environment_source = IniRead($Map_INI, "Map", "Environment_source", "")
	Local $Map_Model_by = IniRead($Map_INI, "Map", "Model_by", "")
	Local $Map_Model_source = IniRead($Map_INI, "Map", "Model_source", "")


	Global $contextmenu_RM_Map_Preview_Image = GUICtrlCreateContextMenu($Map_Preview_Image)
	Global $RM_Button_RM_Map_Preview_Image_1 = GUICtrlCreateMenuItem("Environment source" & " [by " & $Map_Environment_by & "]", $contextmenu_RM_Map_Preview_Image)
	Global $RM_Button_RM_Map_Preview_Image_2 = GUICtrlCreateMenuItem("Model source" & " [by " & $Map_Environment_by & "]", $contextmenu_RM_Map_Preview_Image)

	If $Map_Environment_source = "" Then GUICtrlSetState($RM_Button_RM_Map_Preview_Image_1, $GUI_DISABLE)
	If $Map_Model_source = "" Then GUICtrlSetState($RM_Button_RM_Map_Preview_Image_2, $GUI_DISABLE)

	GUICtrlSetOnEvent($RM_Button_RM_Map_Preview_Image_1, "_RM_Button_RM_Map_Preview_Image_1")
	GUICtrlSetOnEvent($RM_Button_RM_Map_Preview_Image_2, "_RM_Button_RM_Map_Preview_Image_2")
EndFunc


Func _Set_SteamVR_Home_Panel_GUI_Data()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13026) :(' & @MIN & ':' & @SEC & ') _Set_SteamVR_Home_Panel_GUI_Data()' & @CR) ;### Function Trace
	Local $Value, $Value_Panel_NR, $Panel_Name_temp, $Combo_BK_color

	$SteamVR_Environment_Name = IniRead($Config_INI, "Settings", "SteamVR_Environment_Name", "homeloader")
	If $SteamVR_Environment_Name = "" Then $SteamVR_Environment_Name = "homeloader"
	Local $Value_Array = _FileListToArray($SteamVR_Path & "tools\steamvr_environments\content\steamtours_addons\", "*", $FLTA_FOLDERS)
	$Array_Result = $Value_Array
	If @error Then
		$ScriptLineNumber_Temp = @ScriptLineNumber
		$AtError_Result = @error
	EndIf
	If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()
	$Value = ""

	If IsArray($Value_Array) Then
		For $Loop = 1 To $Value_Array[0]
			If $Value_Array[$Loop] <> "addon_template" Then
				$Value = $Value & "|" & $Value_Array[$Loop]
			EndIf
		Next
	EndIf
	GUICtrlSetData($Combo_Environment_Name, $Value, $SteamVR_Environment_Name)



	$Value_Panel_NR = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	GUICtrlSetData($Panel_Nr_Selection_Input, $Value_Panel_NR)

	If $Value_Panel_NR = "1" Then $Panel_Name_temp = $Panel_Name_1
	If $Value_Panel_NR = "2" Then $Panel_Name_temp = $Panel_Name_2
	If $Value_Panel_NR = "3" Then $Panel_Name_temp = $Panel_Name_3
	If $Value_Panel_NR = "4" Then $Panel_Name_temp = $Panel_Name_4
	If $Value_Panel_NR = "5" Then $Panel_Name_temp = $Panel_Name_5
	If $Value_Panel_NR = "6" Then $Panel_Name_temp = $Panel_Name_6
	If $Value_Panel_NR = "7" Then $Panel_Name_temp = $Panel_Name_7
	If $Value_Panel_NR = "8" Then $Panel_Name_temp = $Panel_Name_8
	If $Value_Panel_NR = "9" Then $Panel_Name_temp = $Panel_Name_9
	If $Value_Panel_NR = "10" Then $Panel_Name_temp = $Panel_Name_10
	If $Value_Panel_NR = "11" Then $Panel_Name_temp = $Panel_Name_11

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_1", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_1, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_2", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_2, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_3", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_3, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_4", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_4, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_5", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_5, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_6", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_6, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_7", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_7, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_8", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_8, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_9", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_9, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_10", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_10, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_11", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_11, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_Turorials", "")
	If $Value = "true" Then GUICtrlSetState($Checkbox_Panel_Tutorials, $GUI_CHECKED)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_Tool_1", "")
	GUICtrlSetData($Combo_Panel_Tool_1, "")
	GUICtrlSetData($Combo_Panel_Tool_1, "Panel 1 [" & $Panel_Name_1 & "]|" & "Panel 2 [" & $Panel_Name_2 & "]|" & "Panel 3 [" & $Panel_Name_3 & "]|" & "Panel 4 [" & $Panel_Name_4 & "]|" & "Panel 5 [" & $Panel_Name_5 & "]|" & "Panel 6 [" & $Panel_Name_6 & "]|" & "Panel 7 [" & $Panel_Name_7 & "]|" & "Panel 8 [" & $Panel_Name_8 & "]|" & "Panel 9 [" & $Panel_Name_9 & "]", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_Tool_2", "")
	GUICtrlSetData($Combo_Panel_Tool_2, "")
	GUICtrlSetData($Combo_Panel_Tool_2, "Panel 1 [" & $Panel_Name_1 & "]|" & "Panel 2 [" & $Panel_Name_2 & "]|" & "Panel 3 [" & $Panel_Name_3 & "]|" & "Panel 4 [" & $Panel_Name_4 & "]|" & "Panel 5 [" & $Panel_Name_5 & "]|" & "Panel 6 [" & $Panel_Name_6 & "]|" & "Panel 7 [" & $Panel_Name_7 & "]|" & "Panel 8 [" & $Panel_Name_8 & "]|" & "Panel 9 [" & $Panel_Name_9 & "]", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Panel_width", "")
	GUICtrlSetData($Combo_Panel_width, "")
	GUICtrlSetData($Combo_Panel_width, "100%|95%|90%|85%|80%|75%|70%|65%|60%|65%|60%|55%|50%|45%|40%|35%|30%|25%|20%|15%|10%", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Panel_height", "")
	GUICtrlSetData($Combo_Panel_height, "")
	GUICtrlSetData($Combo_Panel_height, "100%|95%|90%|85%|80%|75%|70%|65%|60%|65%|60%|55%|50%|45%|40%|35%|30%|25%|20%|15%|10%", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Background_color_1", "")
	Local $Combo_BK_color_Name = ""
	For $Loop = 1 To $NR_Colors
		If $Value = $aArray_Colors[$Loop][1] Then
			$Combo_BK_color_Name =  $aArray_Colors[$Loop][0]
			ExitLoop
		EndIf
	Next
	GUICtrlSetData($Combo_Panel_background_color, "")
	GUICtrlSetData($Combo_Panel_background_color, "Transparent|" & $Colors_ALL_Combo, $Combo_BK_color_Name)
	$Combo_BK_color = "0x" & StringRight($Value, StringLen($Value) - 1)
	GUICtrlSetBkColor($Combo_Panel_background_color, $Combo_BK_color)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Border", "")
	GUICtrlSetData($Combo_Panel_border, "Transparent|1px|2px|3px|4px|5px|6px|7px|8px|9px|10px|11px|12px|13px|14px|15px|16px|17px|18px|19px|20px|21px|22px|23px|24px|25px|26px|27px|28px|29px|30px", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Border_color", "")
	Local $Combo_BK_color_Name = ""
	For $Loop = 1 To $NR_Colors
		If $Value = $aArray_Colors[$Loop][1] Then
			$Combo_BK_color_Name =  $aArray_Colors[$Loop][0]
			ExitLoop
		EndIf
	Next
	GUICtrlSetData($Combo_Panel_border_color, "")
	GUICtrlSetData($Combo_Panel_border_color, "Transparent|" & $Colors_ALL_Combo, $Combo_BK_color_Name)
	$Combo_BK_color = "0x" & StringRight($Value, StringLen($Value) - 1)
	GUICtrlSetBkColor($Combo_Panel_border_color, $Combo_BK_color)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Border_radius", "")
	GUICtrlSetData($Combo_Panel_border_radius, "")
	GUICtrlSetData($Combo_Panel_border_radius, "1px|2px|3px|4px|5px|6px|7px|8px|9px|10px|11px|12px|13px|14px|15px|16px|17px|18px|19px|20px|21px|22px|23px|24px|25px|26px|27px|28px|29px|30px", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Saturation", "")
	GUICtrlSetData($Combo_Panel_saturation, "")
	GUICtrlSetData($Combo_Panel_saturation, "0.10|0.15|0.20|0.25|0.30|0.35|0.40|0.45|0.50|0.55|0.60|0.65|0.70|0.75|0.80|0.85|0.90|0.95|1.00", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Scale", "")
	GUICtrlSetData($Combo_Panel_scale, "")
	GUICtrlSetData($Combo_Panel_scale, "0.10|0.15|0.20|0.25|0.30|0.35|0.40|0.45|0.50|0.55|0.60|0.65|0.70|0.75|0.80|0.85|0.90|0.95|1.00", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Text_size", "")
	GUICtrlSetData($Combo_Panel_Text_size, "")
	GUICtrlSetData($Combo_Panel_Text_size, "5px|10px|15px|20px|25px|30px|35px|40px|45px|50px|55px|60px|65px|70px|75px|80px|85px|90px|100px|105px|110px|115px|120px|125px|130px|135px|140px|145px|150px", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Text_color", "")
	;MsgBox(0, "$Value", $Value)
	Local $Combo_BK_color_Name = ""
	For $Loop = 1 To $NR_Colors
		;MsgBox(0, "2", $Value & @CRLF & $aArray_Colors[$Loop][1])
		If $Value = $aArray_Colors[$Loop][1] Then
			$Combo_BK_color_Name =  $aArray_Colors[$Loop][0]
			ExitLoop
		EndIf
	Next
	GUICtrlSetData($Combo_Panel_Text_Color, "")
	GUICtrlSetData($Combo_Panel_Text_Color, $Colors_ALL_Combo, $Combo_BK_color_Name)
	$Combo_BK_color = "0x" & StringRight($Value, StringLen($Value) - 1)
	GUICtrlSetBkColor($Combo_Panel_Text_Color, $Combo_BK_color)
	;MsgBox(0, "1", $Combo_BK_color_Name & @CRLF & $Combo_BK_color)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Text_position", "")
	GUICtrlSetData($Combo_Panel_text_position, "")
	GUICtrlSetData($Combo_Panel_text_position, "50px|45px|40px|35px|30px|25px|20px|15px|10px|05px|0px|-05px|-10px|-15px|-20px|-25px|-30px|-35px|-40px|-45px|-50px|-55px|-60px|-65px|-70px|-75px|-80px|-85px|-90px|-95px|-100px|-105px|-110px|-115px|-120px|-125px|-130px|-135px|-140px|-145px|-150px|-155px|-160px|-165px|-170px|-175px|-180px|-185px|-190px|-195px|-200px", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Text_distance", "")
	GUICtrlSetData($Combo_Panel_Text_distance, "")
	GUICtrlSetData($Combo_Panel_Text_distance, "50px|45px|40px|35px|30px|25px|20px|15px|10px|05px|0px|-05px|-10px|-15px|-20px|-25px|-30px|-35px|-40px|-45px|-50px|-55px|-60px|-65px|-70px|-75px|-80px|-85px|-90px|-95px|-100px|-105px|-110px|-115px|-120px|-125px|-130px|-135px|-140px|-145px|-150px|-155px|-160px|-165px|-170px|-175px|-180px|-185px|-190px|-195px|-200px", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Icon_distance", "")
	GUICtrlSetData($Combo_Panel_Icon_distance, "")
	GUICtrlSetData($Combo_Panel_Icon_distance, "-100px|-95px|-90px|-85px|-80px|-75px|-70px|-65px|-60px|-55px|-50px|-45px|-40px|-35px|-30px|-25px|-20px|-15px|-10px|-05px|0px|10px|20px|30px|40px|50px|60px|70px|80px|90px|100px|110px|120px|130px|140px|150px|160px|170px|180px|190px|200px|210px|220px|230px|240px|250px|260px|270px|280px|290px|300px|310px|320px|330px|340px|350px|360px|370px|380px|390px|400px|410px|420px|430px|440px|450px|460px|470px|480px|490px|500px", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Icon_width", "")
	GUICtrlSetData($Combo_Panel_Icon_width, "")
	GUICtrlSetData($Combo_Panel_Icon_width, "460px|190px|180px|170px|160px|150px|140px|130px|120px|110px|100px", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Icon_height", "")
	GUICtrlSetData($Combo_Panel_Icon_height, "")
	GUICtrlSetData($Combo_Panel_Icon_height, "215px|95px|90px|85px|80px|75px|70px|65px|60px|55px|50px", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Icon_radius", "")
	GUICtrlSetData($Combo_Panel_Icon_radius, "")
	GUICtrlSetData($Combo_Panel_Icon_radius, "1px|2px|3px|4px|5px|6px|7px|8px|9px|10px|11px|12px|13px|14px|15px|16px|17px|18px|19px|20px|21px|22px|23px|24px|25px|26px|27px|28px|29px|30px", $Value)




	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Icon_border_hover", "")
	GUICtrlSetData($Combo_Panel_Icon_border_hover, "")
	GUICtrlSetData($Combo_Panel_Icon_border_hover, "0px|1px|2px|3px|4px|5px|6px|7px|8px|9px|10px|11px|12px|13px|14px|15px|16px|17px|18px|19px|20px|21px|22px|23px|24px|25px|26px|27px|28px|29px|30px", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Icon_border_color_hover", "")
	;MsgBox(0, "$Value", $Value)
	Local $Combo_BK_color_Name = ""
	For $Loop = 1 To $NR_Colors
		;MsgBox(0, "2", $Value & @CRLF & $aArray_Colors[$Loop][1])
		If $Value = $aArray_Colors[$Loop][1] Then
			$Combo_BK_color_Name =  $aArray_Colors[$Loop][0]
			ExitLoop
		EndIf
	Next
	GUICtrlSetData($Combo_Panel_Icon_border_color_hover, "")
	GUICtrlSetData($Combo_Panel_Icon_border_color_hover, $Colors_ALL_Combo, $Combo_BK_color_Name)
	$Combo_BK_color = "0x" & StringRight($Value, StringLen($Value) - 1)
	GUICtrlSetBkColor($Combo_Panel_Icon_border_color_hover, $Combo_BK_color)



	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Icon_border_radius_hover", "")
	GUICtrlSetData($Combo_Panel_Icon_border_radius_hover, "")
	GUICtrlSetData($Combo_Panel_Icon_border_radius_hover, "0px|1px|2px|3px|4px|5px|6px|7px|8px|9px|10px|11px|12px|13px|14px|15px|16px|17px|18px|19px|20px|21px|22px|23px|24px|25px|26px|27px|28px|29px|30px", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Scroll_button_position", "")
	GUICtrlSetData($Combo_Panel_Scroll_button_position, "")
	GUICtrlSetData($Combo_Panel_Scroll_button_position, "top_left|top_center|top_right|bottom_left|bottom_center|bottom_right", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Scroll_button_width", "")
	GUICtrlSetData($Combo_Panel_Scroll_button_width, "")
	GUICtrlSetData($Combo_Panel_Scroll_button_width, "10px|20px|30px|40px|50px|60px|70px|80px|90px|100px|110px|120px|130px|140px|150px|160px|170px|180px|190px|200px|210px|220px|230px|240px|250px|260px|270px|280px|290px|300px|310px|320px|330px|340px|350px|360px|370px|380px|390px|400px|410px|420px|430px|440px|450px|460px|470px|480px|490px|500px", $Value)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Scroll_button_height", "")
	GUICtrlSetData($Combo_Panel_Scroll_button_height, "")
	GUICtrlSetData($Combo_Panel_Scroll_button_height, "10px|20px|30px|40px|50px|60px|70px|80px|90px|100px|110px|120px|130px|140px|150px|160px|170px|180px|190px|200px|210px|220px|230px|240px|250px|260px|270px|280px|290px|300px|310px|320px|330px|340px|350px|360px|370px|380px|390px|400px|410px|420px|430px|440px|450px|460px|470px|480px|490px|500px", $Value)



	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Scroll_button_color", "")
	Local $Combo_BK_color_Name = ""
	For $Loop = 1 To $NR_Colors
		If $Value = $aArray_Colors[$Loop][1] Then
			$Combo_BK_color_Name =  $aArray_Colors[$Loop][0]
			ExitLoop
		EndIf
	Next
	GUICtrlSetData($Combo_Panel_Scroll_button_color, "")
	GUICtrlSetData($Combo_Panel_Scroll_button_color, $Colors_ALL_Combo, $Combo_BK_color_Name)
	$Combo_BK_color = "0x" & StringRight($Value, StringLen($Value) - 1)
	GUICtrlSetBkColor($Combo_Panel_Scroll_button_color, $Combo_BK_color)
	;MsgBox(0, "3", $Combo_BK_color_Name & @CRLF & $Combo_BK_color)

	$Value = IniRead($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Value_Panel_NR & "_appearance", "Scroll_button_border_radius", "")
	GUICtrlSetData($Combo_Panel_Scroll_button_border_radius, "")
	GUICtrlSetData($Combo_Panel_Scroll_button_border_radius, "0px|1px|2px|3px|4px|5px|6px|7px|8px|9px|10px|11px|12px|13px|14px|15px|16px|17px|18px|19px|20px|21px|22px|23px|24px|25px|26px|27px|28px|29px|30px", $Value)



	GUICtrlSetData($Panel_Nr_Selection_Input_Name, $Panel_Name_temp)
	Local $Value_Array = _FileListToArray($Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Panel_Layouts\", "*.ini", 1)
	$Array_Result = $Value_Array
	If @error Then
		$ScriptLineNumber_Temp = @ScriptLineNumber
		$AtError_Result = @error
	EndIf
	If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()

	Local $NR_Files_Temp = $Value_Array[0]

	$Value = "Custom Layout"
	Local $Layout_File_Name = IniRead($SteamVR_Home_Environment_Settings_INI, "Settings", "Layout", "")
	Local $Layout_File_Temp = $Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Panel_Layouts\" & $Layout_File_Name
	;If FileExists($Layout_File_Temp) Then $Value = $Layout_File_Name

	If IsArray($Value_Array) Then
		For $Loop = 1 To $NR_Files_Temp
			;MsgBox(0, "$Value", $NR_Files_Temp & @CRLF & $Loop & @CRLF & $Value)
			$Value = $Value & "|" & StringReplace($Value_Array[$Loop], '.ini', '')
		Next
	EndIf



	GUICtrlSetData($Combo_Panel_Layout, "")
	GUICtrlSetData($Combo_Panel_Layout, $Value, $Layout_File_Name)

	;MsgBox(0, "1 draussen", $NR_Files_Temp & @CRLF & $Loop & @CRLF & $Value)

	GUICtrlSetState($Combo_Panel_background_color, $GUI_FOCUS)
	GUICtrlSetState($Combo_Panel_border_color, $GUI_FOCUS)
	GUICtrlSetState($Combo_Panel_Text_Color, $GUI_FOCUS)

	;MsgBox(0, "2 draussen", $NR_Files_Temp & @CRLF & $Loop & @CRLF & $Value)

	GUICtrlSetState($Combo_Panel_Icon_border_color_hover, $GUI_FOCUS)
	GUICtrlSetState($Combo_Panel_Scroll_button_color, $GUI_FOCUS)
	GUICtrlSetState($Panel_Nr_Selection_Input, $GUI_FOCUS)

	;MsgBox(0, "3 draussen", $NR_Files_Temp & @CRLF & $Loop & @CRLF & $Value)

	$Value = IniRead($SteamVR_Home_Environment_Settings_INI, "Settings", "Enable_DVD_Case", "")
	If $Value = "true" Then
		GUICtrlSetState($Checkbox_DVD_Case_1, $GUI_CHECKED)
		GUICtrlSetState($Combo_DVD_Cover_Template, $GUI_ENABLE)
	Else
		GUICtrlSetState($Combo_DVD_Cover_Template, $GUI_DISABLE)
	EndIf

	;MsgBox(0, "4 draussen", $NR_Files_Temp & @CRLF & $Loop & @CRLF & $Value)

	$Value_dvd_cover_template = IniRead($SteamVR_Home_Environment_Settings_INI, "Settings", "dvd_cover_template", "")

	If FileExists($Install_DIR & "Apps\SteamVR_Home\DVD_Case_Templates\") Then
		Local $Value_Array = _FileListToArray($Install_DIR & "Apps\SteamVR_Home\DVD_Case_Templates\", "*.jpg", 1)
		$Array_Result = $Value_Array
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()
		$Value = ""

		If IsArray($Value_Array) Then
			For $Loop = 1 To $Value_Array[0]
				$Value = $Value & "|" & $Value_Array[$Loop]
			Next
		EndIf
	Else
		$Value = ""
	EndIf

	GUICtrlSetData($Combo_DVD_Cover_Template, $Value, $Value_dvd_cover_template)

	;MsgBox(0, "5 draussen", $NR_Files_Temp & @CRLF & $Loop & @CRLF & $Value)


	;$Value = IniRead($SteamVR_Home_Environment_Settings_INI, "Settings", "Enable_Arcade_Machine", "")
	;If $Value = "true" Then GUICtrlSetState($Checkbox_Arcade_Machine_1, $GUI_CHECKED)

	;MsgBox(0, "6 draussen", $NR_Files_Temp & @CRLF & $Loop & @CRLF & $Value)


	Local $Checkbox_HL_Environment_Enable_Row_1_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_1", "")
	Local $Checkbox_HL_Environment_Enable_Row_2_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_2", "")
	Local $Checkbox_HL_Environment_Enable_Row_3_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_3", "")
	Local $Checkbox_HL_Environment_Enable_Row_4_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_4", "")
	Local $Checkbox_HL_Environment_Enable_Row_5_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_5", "")
	Local $Checkbox_HL_Environment_Enable_Row_6_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_6", "")
	Local $Checkbox_HL_Environment_Enable_Row_7_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_7", "")
	Local $Checkbox_HL_Environment_Enable_Row_8_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_8", "")
	Local $Checkbox_HL_Environment_Enable_Row_9_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_9", "")

	If $Checkbox_HL_Environment_Enable_Row_1_Value = "true" Then
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_1, $GUI_CHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_1, $GUI_ENABLE)
	Else
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_1, $GUI_UNCHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_1, $GUI_DISABLE)
	EndIf

	If $Checkbox_HL_Environment_Enable_Row_2_Value = "true" Then
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_2, $GUI_CHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_2, $GUI_ENABLE)
	Else
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_2, $GUI_UNCHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_2, $GUI_DISABLE)
	EndIf

	If $Checkbox_HL_Environment_Enable_Row_3_Value = "true" Then
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_3, $GUI_CHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_3, $GUI_ENABLE)
	Else
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_3, $GUI_UNCHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_3, $GUI_DISABLE)
	EndIf

	If $Checkbox_HL_Environment_Enable_Row_4_Value = "true" Then
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_4, $GUI_CHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_4, $GUI_ENABLE)
	Else
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_4, $GUI_UNCHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_4, $GUI_DISABLE)
	EndIf

	If $Checkbox_HL_Environment_Enable_Row_5_Value = "true" Then
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_5, $GUI_CHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_5, $GUI_ENABLE)
	Else
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_5, $GUI_UNCHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_5, $GUI_DISABLE)
	EndIf

	If $Checkbox_HL_Environment_Enable_Row_6_Value = "true" Then
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_6, $GUI_CHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_6, $GUI_ENABLE)
	Else
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_6, $GUI_UNCHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_6, $GUI_DISABLE)
	EndIf

	If $Checkbox_HL_Environment_Enable_Row_7_Value = "true" Then
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_7, $GUI_CHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_7, $GUI_ENABLE)
	Else
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_7, $GUI_UNCHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_7, $GUI_DISABLE)
	EndIf

	If $Checkbox_HL_Environment_Enable_Row_8_Value = "true" Then
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_8, $GUI_CHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_8, $GUI_ENABLE)
	Else
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_8, $GUI_UNCHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_8, $GUI_DISABLE)
	EndIf

	If $Checkbox_HL_Environment_Enable_Row_9_Value = "true" Then
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_9, $GUI_CHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_9, $GUI_ENABLE)
	Else
		GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_9, $GUI_UNCHECKED)
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_9, $GUI_DISABLE)
	EndIf


	$Panel_Name_1 = IniRead($Config_INI, "Settings", "TAB1_Name", "Steam Library")
	$Panel_Name_2 = IniRead($Config_INI, "Settings", "TAB2_Name", "Non-Steam_Appl")
	$Panel_Name_3 = IniRead($Config_INI, "Settings", "TAB3_Name", "Custom 1")
	$Panel_Name_4 = IniRead($Config_INI, "Settings", "TAB4_Name", "Custom 2")
	$Panel_Name_5 = IniRead($Config_INI, "Settings", "TAB5_Name", "Custom 3")
	$Panel_Name_6 = IniRead($Config_INI, "Settings", "TAB6_Name", "Custom 4")
	$Panel_Name_7 = IniRead($Config_INI, "Settings", "TAB7_Name", "Viveport Applications")
	$Panel_Name_8 = IniRead($Config_INI, "Settings", "TAB8_Name", "Oculus Applications")
	Local $Panel_Name_9 = "DVD Case Models"

	Local $Category_Row_1_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_1", $Panel_Name_1)
	Local $Category_Row_2_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_2", $Panel_Name_2)
	Local $Category_Row_3_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_3", $Panel_Name_3)
	Local $Category_Row_4_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_4", $Panel_Name_4)
	Local $Category_Row_5_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_5", $Panel_Name_5)
	Local $Category_Row_6_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_6", $Panel_Name_6)
	Local $Category_Row_7_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_7", $Panel_Name_7)
	Local $Category_Row_8_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_8", $Panel_Name_8)
	Local $Category_Row_9_Value = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_9", $Panel_Name_9)



	$Value = $Panel_Name_1 & "|" & $Panel_Name_2 & "|" & $Panel_Name_3 & "|" & $Panel_Name_4 & "|" & $Panel_Name_5 & "|" & $Panel_Name_6 & "|" & $Panel_Name_7 & "|" & $Panel_Name_8 & "|" & $Panel_Name_9

	GUICtrlSetData($Combo_HomeLoader_Menu_Category_Row_1, $Value, $Category_Row_1_Value)
	GUICtrlSetData($Combo_HomeLoader_Menu_Category_Row_2, $Value, $Category_Row_2_Value)
	GUICtrlSetData($Combo_HomeLoader_Menu_Category_Row_3, $Value, $Category_Row_3_Value)
	GUICtrlSetData($Combo_HomeLoader_Menu_Category_Row_4, $Value, $Category_Row_4_Value)
	GUICtrlSetData($Combo_HomeLoader_Menu_Category_Row_5, $Value, $Category_Row_5_Value)
	GUICtrlSetData($Combo_HomeLoader_Menu_Category_Row_6, $Value, $Category_Row_6_Value)
	GUICtrlSetData($Combo_HomeLoader_Menu_Category_Row_7, $Value, $Category_Row_7_Value)
	GUICtrlSetData($Combo_HomeLoader_Menu_Category_Row_8, $Value, $Category_Row_8_Value)
	GUICtrlSetData($Combo_HomeLoader_Menu_Category_Row_9, $Value, $Category_Row_9_Value)
	;GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_9, $GUI_DISABLE)

	Local $Panel_Distance = IniRead($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Panel_Distance", "")
	If $Panel_Distance = "" Then
		$Panel_Distance = "70 [Default]"
		IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Panel_Distance", $Panel_Distance)
	EndIf
	$Value = "46.2 [Close]" & "|" & "50" & "|" & "55" & "|" & "60" & "|" & "65" & "|" & "70 [Default]" & "|" & "75" & "|" & "80" & "|" & "85" & "|" &"90" & "|" & "95" & "|" & "100" & "|" & "105" & "|" & "110" & "|" & "115" & "|" & "120 [Far away]"
	GUICtrlSetData($Combo_HomeLoader_Menu_Panel_Distance_1, $Value, $Panel_Distance)


	Local $Environment_Map = IniRead($SteamVR_Home_Environment_Settings_INI, "Settings", "Map", "")
	If $Environment_Map = "" Then
		$Environment_Map = "homeloader_default"
		IniWrite($SteamVR_Home_Environment_Settings_INI, "Settings", "Map", $Environment_Map)
	EndIf

	Local $FileList_Maps = _FileListToArray($HomeLoader_Map_Folder, "*", $FLTA_FOLDERS)

	$Value = ""
	Local $Map_Name = ""
	If IsArray($FileList_Maps) Then
		For $Loop = 1 To $FileList_Maps[0]
			$Map_Name = StringReplace($FileList_Maps[$Loop], '.vpk', "")
			If FileExists($HomeLoader_Map_Folder & $FileList_Maps[$Loop] & "\map_" & $FileList_Maps[$Loop] & ".vpk") Then
				$Value = $Value & $Map_Name & "|"
			EndIf
		Next
	EndIf

	GUICtrlSetData($Combo_HomeLoader_Environment_Map, $Value, $Environment_Map)

	$HomeLoader_Map_Image = $HomeLoader_Map_Folder & $Environment_Map & "\" & "preview_image.jpg"
	If FileExists($HomeLoader_Map_Image) Then
		GUICtrlSetImage($Map_Preview_Image, $HomeLoader_Map_Image)

		Local $Map_INI = $HomeLoader_Map_Folder & $Environment_Map & "\map.ini"
		Local $Map_Name = IniRead($Map_INI, "Map", "Name", "")
		Local $Map_Environment_by = IniRead($Map_INI, "Map", "Environment_by", "")
		Local $Map_Environment_source = IniRead($Map_INI, "Map", "Environment_source", "")
		Local $Map_Model_by = IniRead($Map_INI, "Map", "Model_by", "")
		Local $Map_Model_source = IniRead($Map_INI, "Map", "Model_source", "")

		GUICtrlSetTip($Map_Preview_Image, "Map Name: " & @TAB & @TAB & $Map_Name & @CRLF & _
											"Environment by: " & @TAB & @TAB & $Map_Environment_by & @CRLF & _
											"Environment source: " & @TAB & $Map_Environment_source & @CRLF & _
											"Model by: " & @TAB & @TAB & $Map_Model_by & @CRLF & _
											"Model source: " & @TAB & @TAB & $Map_Model_source & @CRLF)
	Else
		GUICtrlSetImage($Map_Preview_Image, $HomeLoader_Map_Image_Template)
	EndIf


	Local $steamtours_addons_Content_Map_Folder = $SteamVR_Path & "tools\steamvr_environments\content\steamtours_addons\homeloader\maps\"
	Local $FileList = _FileListToArray($steamtours_addons_Content_Map_Folder, "*.vmap", 1)
	If IsArray($FileList) Then
		If $FileList[0] < 1 Then GUICtrlSetState($Button_Environment_Edit_Map, $GUI_DISABLE)
	Else
		GUICtrlSetState($Button_Environment_Edit_Map, $GUI_DISABLE)
	EndIf

	Local $steamtours_addons_Game_Map_Folder = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\homeloader\maps\"
	Local $FileList = _FileListToArray($steamtours_addons_Game_Map_Folder, "*.vpk", 1)
	If IsArray($FileList) Then
		If $FileList[0] < 1 Then GUICtrlSetState($Button_Environment_Save_Map, $GUI_DISABLE)
	Else
		GUICtrlSetState($Button_Environment_Save_Map, $GUI_DISABLE)
	EndIf


	GUICtrlSetState($Checkbox_Panel_2, $GUI_DISABLE)
	GUICtrlSetState($Checkbox_Panel_7, $GUI_DISABLE)
	GUICtrlSetState($Checkbox_Panel_8, $GUI_DISABLE)
	GUICtrlSetState($Checkbox_Panel_9, $GUI_DISABLE)


	GUISetState(@SW_SHOW, $SteamVR_Home_Panels_GUI)
	GUIDelete($GUI_Loading)
EndFunc


Func _Checkbox_Panel_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13472) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_1()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_1)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_1", $Value)
EndFunc

Func _Checkbox_Panel_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13483) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_2()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_2)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_2", $Value)
EndFunc

Func _Checkbox_Panel_3()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13494) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_3()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_3)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_3", $Value)
EndFunc

Func _Checkbox_Panel_4()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13505) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_4()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_4)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_4", $Value)
EndFunc

Func _Checkbox_Panel_5()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13516) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_5()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_5)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_5", $Value)
EndFunc

Func _Checkbox_Panel_6()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13527) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_6()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_6)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_6", $Value)
EndFunc

Func _Checkbox_Panel_7()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13538) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_7()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_7)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_7", $Value)
EndFunc

Func _Checkbox_Panel_8()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13549) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_8()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_8)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_8", $Value)
EndFunc

Func _Checkbox_Panel_9()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13560) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_9()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_9)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_9", $Value)
EndFunc

Func _Checkbox_Panel_10()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13571) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_10()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_10)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_10", $Value)
EndFunc

Func _Checkbox_Panel_11()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13582) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_11()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_11)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_11", $Value)
EndFunc

Func _Checkbox_Panel_Turorials()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13593) :(' & @MIN & ':' & @SEC & ') _Checkbox_Panel_Turorials()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_Panel_Tutorials)
	If $Value = 1 Then
		$Value = "true"
	Else
		$Value = "false"
	EndIf
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_Turorials", $Value)
EndFunc

Func _Combo_Panel_Tool_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13604) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Tool_1()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_Panel_Tool_1)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_Tool_1", $Value)
EndFunc

Func _Combo_Panel_Tool_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13610) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Tool_2()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_Panel_Tool_2)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_Tool_2", $Value)
EndFunc

Func _Panel_Nr_Selection_Updown()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13616) :(' & @MIN & ':' & @SEC & ') _Panel_Nr_Selection_Updown()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Panel_Nr_Selection_Input)
	If $Value > 11 Then $Value = 11
	If $Value < 1 Then $Value = 1
	GUICtrlSetData($Panel_Nr_Selection_Input, $Value)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", $Value)
	_Set_SteamVR_Home_Panel_GUI_Data()
EndFunc

Func _Combo_Panel_width()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13626) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_width()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_width)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Panel_width", $Value)
EndFunc

Func _Combo_Panel_height()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13633) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_height()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_height)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Panel_height", $Value)
EndFunc

Func _Combo_Panel_background_color()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13640) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_background_color()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_background_color)

	Local $Combo_BK_color = ""
	For $Loop = 1 To $NR_Colors
		If $Value = $aArray_Colors[$Loop][0] Then
			$Combo_BK_color =  $aArray_Colors[$Loop][1]
			ExitLoop
		EndIf
	Next

	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Background_color_1", $Combo_BK_color)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Background_color_2", $Combo_BK_color)

	If $Combo_BK_color <> "" Then
		$Combo_BK_color = "0x" & StringRight($Combo_BK_color, StringLen($Combo_BK_color) - 1)
		GUICtrlSetBkColor($Combo_Panel_background_color, $Combo_BK_color)
	EndIf
EndFunc

Func _Combo_Panel_border()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13662) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_border()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_border)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Border", $Value)
EndFunc

Func _Combo_Panel_border_color()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13669) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_border_color()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_border_color)

	Local $Combo_BK_color = ""
	For $Loop = 1 To $NR_Colors
		If $Value = $aArray_Colors[$Loop][0] Then
			$Combo_BK_color =  $aArray_Colors[$Loop][1]
			ExitLoop
		EndIf
	Next

	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Border_color", $Combo_BK_color)

	If $Combo_BK_color <> "" Then
		$Combo_BK_color = "0x" & StringRight($Combo_BK_color, StringLen($Combo_BK_color) - 1)
		GUICtrlSetBkColor($Combo_Panel_border_color, $Combo_BK_color)
	EndIf
EndFunc

Func _Combo_Panel_border_radius()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13690) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_border_radius()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead(_Combo_Panel_border_radius)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Border_radius", $Value)
EndFunc

Func _Combo_Panel_saturation()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13697) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_saturation()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_saturation)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Saturation", $Value)
EndFunc

Func _Combo_Panel_scale()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13704) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_scale()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_scale)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Scale", $Value)
EndFunc

Func _Combo_Panel_Text_size()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13711) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Text_size()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Text_size)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Text_size", $Value)
EndFunc

Func _Combo_Panel_Text_Color()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13718) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Text_Color()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Text_Color)

	Local $Combo_BK_color = ""
	For $Loop = 1 To $NR_Colors
		If $Value = $aArray_Colors[$Loop][0] Then
			$Combo_BK_color =  $aArray_Colors[$Loop][1]
			ExitLoop
		EndIf
	Next

	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Text_color", $Combo_BK_color)

	If $Combo_BK_color <> "" Then
		$Combo_BK_color = "0x" & StringRight($Combo_BK_color, StringLen($Combo_BK_color) - 1)
		GUICtrlSetBkColor($Combo_Panel_Text_Color, $Combo_BK_color)
	EndIf
EndFunc

Func _Combo_Panel_text_position()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13739) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_text_position()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_text_position)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Text_position", $Value)
EndFunc

Func _Combo_Panel_Text_distance()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13746) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Text_distance()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Text_distance)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Text_distance", $Value)
EndFunc

Func _Combo_Panel_Icon_distance()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13753) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Icon_distance()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Icon_distance)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Icon_distance", $Value)
EndFunc

Func _Combo_Panel_Icon_width()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13760) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Icon_width()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Icon_width)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Icon_width", $Value)
EndFunc

Func _Combo_Panel_Icon_height()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13767) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Icon_height()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Icon_height)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Icon_height", $Value)
EndFunc

Func _Combo_Panel_Icon_radius()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13774) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Icon_radius()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Icon_radius)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Icon_radius", $Value)
EndFunc


Func _Combo_Panel_Icon_border_hover()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13782) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Icon_border_hover()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Icon_border_hover)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Icon_border_hover", $Value)
EndFunc

Func _Combo_Panel_Icon_border_color_hover()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13789) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Icon_border_color_hover()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Icon_border_color_hover)

	Local $Combo_BK_color = ""
	For $Loop = 1 To $NR_Colors
		If $Value = $aArray_Colors[$Loop][0] Then
			$Combo_BK_color =  $aArray_Colors[$Loop][1]
			ExitLoop
		EndIf
	Next

	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Icon_border_color_hover", $Combo_BK_color)

	If $Combo_BK_color <> "" Then
		$Combo_BK_color = "0x" & StringRight($Combo_BK_color, StringLen($Combo_BK_color) - 1)
		GUICtrlSetBkColor($Combo_Panel_Icon_border_color_hover, $Combo_BK_color)
	EndIf
EndFunc

Func _Combo_Panel_Icon_border_radius_hover()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13810) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Icon_border_radius_hover()' & @CR) ;### Function Trace
		Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Icon_border_radius_hover)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Icon_border_radius_hover", $Value)
EndFunc

Func _Combo_Panel_Scroll_button_position()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13817) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Scroll_button_position()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Scroll_button_position)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Scroll_button_position", $Value)
EndFunc

Func _Combo_Panel_Scroll_button_width()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13824) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Scroll_button_width()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Scroll_button_width)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Scroll_button_width", $Value)
EndFunc

Func _Combo_Panel_Scroll_button_height()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13831) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Scroll_button_height()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Scroll_button_height)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Scroll_button_height", $Value)
EndFunc

Func _Combo_Panel_Scroll_button_color()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13838) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Scroll_button_color()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Scroll_button_color)

	Local $Combo_BK_color = ""
	For $Loop = 1 To $NR_Colors
		If $Value = $aArray_Colors[$Loop][0] Then
			$Combo_BK_color =  $aArray_Colors[$Loop][1]
			ExitLoop
		EndIf
	Next

	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Scroll_button_color", $Combo_BK_color)

	If $Combo_BK_color <> "" Then
		$Combo_BK_color = "0x" & StringRight($Combo_BK_color, StringLen($Combo_BK_color) - 1)
		GUICtrlSetBkColor($Combo_Panel_Scroll_button_color, $Combo_BK_color)
	EndIf
EndFunc

Func _Combo_Panel_Scroll_button_border_radius()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13859) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Scroll_button_border_radius()' & @CR) ;### Function Trace
	Local $Panel_Nr_temp = IniRead($SteamVR_Home_Panel_Settings_INI, "Settings", "Panel_NR", "1")
	Local $Value = GUICtrlRead($Combo_Panel_Scroll_button_border_radius)
	IniWrite($SteamVR_Home_Panel_Settings_INI, "Panel_" & $Panel_Nr_temp & "_appearance", "Scroll_button_border_radius", $Value)
EndFunc


Func _Combo_Environment_Name()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13867) :(' & @MIN & ':' & @SEC & ') _Combo_Environment_Name()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_Environment_Name)
	IniWrite($Config_INI, "Settings", "SteamVR_Environment_Name", $Value)
	$SteamVR_Environment_Name = IniRead($Config_INI, "Settings", "SteamVR_Environment_Name", "homeloader")
EndFunc

Func _Checkbox_DVD_Case_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13874) :(' & @MIN & ':' & @SEC & ') _Checkbox_DVD_Case_1()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_DVD_Case_1)

	Local $DVD_Case_Cover_Check = "false"
	Local $DVD_Case_Material_Check = "false"
	Local $DVD_Case_Model_Check = "false"
	Local $DVD_Case_Templates_Check = "false"

	If FileExists($Install_DIR & "Apps\SteamVR_Home\DVD_Case_Cover\") Then  $DVD_Case_Cover_Check = "true"
	If FileExists($Install_DIR & "Apps\SteamVR_Home\DVD_Case_Material\") Then  $DVD_Case_Material_Check = "true"
	If FileExists($Install_DIR & "Apps\SteamVR_Home\DVD_Case_Model\") Then  $DVD_Case_Model_Check = "true"
	If FileExists($Install_DIR & "Apps\SteamVR_Home\DVD_Case_Templates\") Then  $DVD_Case_Templates_Check = "true"

	If $DVD_Case_Cover_Check = "true" And $DVD_Case_Material_Check = "true" And $DVD_Case_Model_Check = "true" And $DVD_Case_Templates_Check = "true" Then
		If $Value = 1 Then
			$Value = "true"
			GUICtrlSetState($Combo_DVD_Cover_Template, $GUI_ENABLE)
		Else
			$Value = "false"
			GUICtrlSetState($Combo_DVD_Cover_Template, $GUI_DISABLE)
		EndIf
		IniWrite($SteamVR_Home_Environment_Settings_INI, "Settings", "Enable_DVD_Case", $Value)
	Else
		$Value = "false"
		GUICtrlSetState($Checkbox_DVD_Case_1, $GUI_UNCHECKED)
		GUICtrlSetState($Combo_DVD_Cover_Template, $GUI_DISABLE)
		IniWrite($SteamVR_Home_Environment_Settings_INI, "Settings", "Enable_DVD_Case", $Value)
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Missing DVD Case Files", "The HomeLoader DVD case files are missing. Download the DVD case files first and copy them to the appropriate folder.")
	EndIf
EndFunc

Func _Combo_DVD_Cover_Template()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13887) :(' & @MIN & ':' & @SEC & ') _Combo_DVD_Cover_Template()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_DVD_Cover_Template)
	IniWrite($SteamVR_Home_Environment_Settings_INI, "Settings", "dvd_cover_template", $Value)
EndFunc

Func _Checkbox_Arcade_Machine_1()
	;If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13893) :(' & @MIN & ':' & @SEC & ') _Checkbox_Arcade_Machine_1()' & @CR) ;### Function Trace
	;Local $Value = GUICtrlRead($Checkbox_Arcade_Machine_1)
	;If $Value = 1 Then
	;	$Value = "true"
	;Else
	;	$Value = "false"
	;EndIf
	;IniWrite($SteamVR_Home_Environment_Settings_INI, "Settings", "Enable_Arcade_Machine", $Value)
EndFunc



Func _Checkbox_HL_Environment_Enable_Row_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13906) :(' & @MIN & ':' & @SEC & ') _Checkbox_HL_Environment_Enable_Row_1()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_HL_Environment_Enable_Row_1)
	If $Value = 1 Then
		$Value = "true"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_1, $GUI_ENABLE)
	Else
		$Value = "false"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_1, $GUI_DISABLE)
	EndIf

	If $HomeApp <> "SteamVR Home" Then
		Local $Value_Combo = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_1)

		If $Value_Combo = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_1, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_1", "false")
			$Value = "false"
		ElseIf $Value_Combo = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_1, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_1", "false")
			$Value = ""
		ElseIf $Value_Combo = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_1, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_1", "false")
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_1", $Value)
EndFunc

Func _Checkbox_HL_Environment_Enable_Row_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13941) :(' & @MIN & ':' & @SEC & ') _Checkbox_HL_Environment_Enable_Row_2()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_HL_Environment_Enable_Row_2)
	If $Value = 1 Then
		$Value = "true"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_2, $GUI_ENABLE)
	Else
		$Value = "false"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_2, $GUI_DISABLE)
	EndIf

	If $HomeApp <> "SteamVR Home" Then
		Local $Value_Combo = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_2)

		If $Value_Combo = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_2, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_2", "false")
			$Value = "false"
		ElseIf $Value_Combo = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_2, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_2", "false")
			$Value = ""
		ElseIf $Value_Combo = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_2, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_2", "false")
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_2", $Value)
EndFunc

Func _Checkbox_HL_Environment_Enable_Row_3()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (13976) :(' & @MIN & ':' & @SEC & ') _Checkbox_HL_Environment_Enable_Row_3()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_HL_Environment_Enable_Row_3)
	If $Value = 1 Then
		$Value = "true"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_3, $GUI_ENABLE)
	Else
		$Value = "false"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_3, $GUI_DISABLE)
	EndIf

	If $HomeApp <> "SteamVR Home" Then
		Local $Value_Combo = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_3)

		If $Value_Combo = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_3, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_3", "false")
			$Value = "false"
		ElseIf $Value_Combo = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_3, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_3", "false")
			$Value = ""
		ElseIf $Value_Combo = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_3, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_3", "false")
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_3", $Value)
EndFunc

Func _Checkbox_HL_Environment_Enable_Row_4()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14011) :(' & @MIN & ':' & @SEC & ') _Checkbox_HL_Environment_Enable_Row_4()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_HL_Environment_Enable_Row_4)
	If $Value = 1 Then
		$Value = "true"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_4, $GUI_ENABLE)
	Else
		$Value = "false"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_4, $GUI_DISABLE)
	EndIf

	If $HomeApp <> "SteamVR Home" Then
		Local $Value_Combo = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_4)

		If $Value_Combo = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_4, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_4", "false")
			$Value = "false"
		ElseIf $Value_Combo = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_4, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_4", "false")
			$Value = ""
		ElseIf $Value_Combo = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_4, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_4", "false")
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_4", $Value)
EndFunc

Func _Checkbox_HL_Environment_Enable_Row_5()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14046) :(' & @MIN & ':' & @SEC & ') _Checkbox_HL_Environment_Enable_Row_5()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_HL_Environment_Enable_Row_5)
	If $Value = 1 Then
		$Value = "true"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_5, $GUI_ENABLE)
	Else
		$Value = "false"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_5, $GUI_DISABLE)
	EndIf

	If $HomeApp <> "SteamVR Home" Then
		Local $Value_Combo = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_5)

		If $Value_Combo = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_5, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_5", "false")
			$Value = "false"
		ElseIf $Value_Combo = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_5, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_5", "false")
			$Value = ""
		ElseIf $Value_Combo = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_5, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_5", "false")
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_5", $Value)
EndFunc

Func _Checkbox_HL_Environment_Enable_Row_6()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14081) :(' & @MIN & ':' & @SEC & ') _Checkbox_HL_Environment_Enable_Row_6()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_HL_Environment_Enable_Row_6)
	If $Value = 1 Then
		$Value = "true"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_6, $GUI_ENABLE)
	Else
		$Value = "false"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_6, $GUI_DISABLE)
	EndIf

	If $HomeApp <> "SteamVR Home" Then
		Local $Value_Combo = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_6)

		If $Value_Combo = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_6, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_6", "false")
			$Value = "false"
		ElseIf $Value_Combo = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_6, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_6", "false")
			$Value = ""
		ElseIf $Value_Combo = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_6, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_6", "false")
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_6", $Value)
EndFunc

Func _Checkbox_HL_Environment_Enable_Row_7()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14116) :(' & @MIN & ':' & @SEC & ') _Checkbox_HL_Environment_Enable_Row_7()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_HL_Environment_Enable_Row_7)
	If $Value = 1 Then
		$Value = "true"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_7, $GUI_ENABLE)
	Else
		$Value = "false"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_7, $GUI_DISABLE)
	EndIf

	If $HomeApp <> "SteamVR Home" Then
		Local $Value_Combo = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_7)

		If $Value_Combo = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_7, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_7", "false")
			$Value = "false"
		ElseIf $Value_Combo = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_7, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_7", "false")
			$Value = ""
		ElseIf $Value_Combo = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_7, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_7", "false")
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_7", $Value)
EndFunc

Func _Checkbox_HL_Environment_Enable_Row_8()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14151) :(' & @MIN & ':' & @SEC & ') _Checkbox_HL_Environment_Enable_Row_8()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_HL_Environment_Enable_Row_8)
	If $Value = 1 Then
		$Value = "true"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_8, $GUI_ENABLE)
	Else
		$Value = "false"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_8, $GUI_DISABLE)
	EndIf

	If $HomeApp <> "SteamVR Home" Then
		Local $Value_Combo = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_8)

		If $Value_Combo = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_8, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_8", "false")
			$Value = "false"
		ElseIf $Value_Combo = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_8, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_8", "false")
			$Value = ""
		ElseIf $Value_Combo = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_8, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_8", "false")
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_8", $Value)
EndFunc

Func _Checkbox_HL_Environment_Enable_Row_9()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14186) :(' & @MIN & ':' & @SEC & ') _Checkbox_HL_Environment_Enable_Row_9()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Checkbox_HL_Environment_Enable_Row_9)
	If $Value = 1 Then
		$Value = "true"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_9, $GUI_ENABLE)
	Else
		$Value = "false"
		GUICtrlSetState($Combo_HomeLoader_Menu_Category_Row_9, $GUI_DISABLE)
	EndIf

	If $HomeApp <> "SteamVR Home" Then
		Local $Value_Combo = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_9)

		If $Value_Combo = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_9, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_9", "false")
			$Value = "false"
		ElseIf $Value_Combo = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_9, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_9", "false")
			$Value = ""
		ElseIf $Value_Combo = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_9, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_9", "false")
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_9", $Value)
EndFunc


Func _Combo_HomeLoader_Menu_Category_Row_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14222) :(' & @MIN & ':' & @SEC & ') _Combo_HomeLoader_Menu_Category_Row_1()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_1)

	If $HomeApp <> "SteamVR Home" Then
		If $Value = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_1, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_1", "false")
			$Value = ""
		ElseIf $Value = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_1, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_1", "false")
			$Value = ""
		ElseIf $Value = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_1, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_1", "false")
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_1", $Value)
EndFunc

Func _Combo_HomeLoader_Menu_Category_Row_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14248) :(' & @MIN & ':' & @SEC & ') _Combo_HomeLoader_Menu_Category_Row_2()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_2)

	If $HomeApp <> "SteamVR Home" Then
		If $Value = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_2, $GUI_UNCHECKED)
			IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Enable_Row_2", "false")
			$Value = ""
		ElseIf $Value = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_2, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_2, $GUI_UNCHECKED)
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_2", $Value)
EndFunc

Func _Combo_HomeLoader_Menu_Category_Row_3()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14272) :(' & @MIN & ':' & @SEC & ') _Combo_HomeLoader_Menu_Category_Row_3()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_3)

	If $HomeApp <> "SteamVR Home" Then
		If $Value = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_3, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_3, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_3, $GUI_UNCHECKED)
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_3", $Value)
EndFunc

Func _Combo_HomeLoader_Menu_Category_Row_4()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14295) :(' & @MIN & ':' & @SEC & ') _Combo_HomeLoader_Menu_Category_Row_4()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_4)

	If $HomeApp <> "SteamVR Home" Then
		If $Value = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_4, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_4, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_4, $GUI_UNCHECKED)
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_4", $Value)
EndFunc

Func _Combo_HomeLoader_Menu_Category_Row_5()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14318) :(' & @MIN & ':' & @SEC & ') _Combo_HomeLoader_Menu_Category_Row_5()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_5)

	If $HomeApp <> "SteamVR Home" Then
		If $Value = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_5, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_5, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_5, $GUI_UNCHECKED)
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_5", $Value)
EndFunc

Func _Combo_HomeLoader_Menu_Category_Row_6()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14341) :(' & @MIN & ':' & @SEC & ') _Combo_HomeLoader_Menu_Category_Row_6()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_6)

	If $HomeApp <> "SteamVR Home" Then
		If $Value = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_6, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_6, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_6, $GUI_UNCHECKED)
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_6", $Value)
EndFunc

Func _Combo_HomeLoader_Menu_Category_Row_7()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14364) :(' & @MIN & ':' & @SEC & ') _Combo_HomeLoader_Menu_Category_Row_7()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_7)

	If $HomeApp <> "SteamVR Home" Then
		If $Value = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_7, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_7, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_7, $GUI_UNCHECKED)
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_7", $Value)
EndFunc

Func _Combo_HomeLoader_Menu_Category_Row_8()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14387) :(' & @MIN & ':' & @SEC & ') _Combo_HomeLoader_Menu_Category_Row_8()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_8)

	If $HomeApp <> "SteamVR Home" Then
		If $Value = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_8, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_8, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_8, $GUI_UNCHECKED)
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_8", $Value)
EndFunc

Func _Combo_HomeLoader_Menu_Category_Row_9()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14410) :(' & @MIN & ':' & @SEC & ') _Combo_HomeLoader_Menu_Category_Row_9()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_HomeLoader_Menu_Category_Row_9)

	If $HomeApp <> "SteamVR Home" Then
		If $Value = "Non-Library Appl." Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Non-Library Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_9, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Viveport Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Viveport Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_9, $GUI_UNCHECKED)
			$Value = ""
		ElseIf $Value = "Oculus Applications" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "You need to select SteamVR as Home App to be able to start Oculus Applications.")
			GUICtrlSetState($Checkbox_HL_Environment_Enable_Row_9, $GUI_UNCHECKED)
			$Value = ""
		EndIf
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Category_Row_9", $Value)
EndFunc


Func _Combo_HomeLoader_Menu_Panel_Distance_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14434) :(' & @MIN & ':' & @SEC & ') _Combo_HomeLoader_Menu_Panel_Distance_1()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_HomeLoader_Menu_Panel_Distance_1)
	IniWrite($SteamVR_Home_Environment_Settings_INI, "HomeLoader_Menu", "Panel_Distance", $Value)
EndFunc

Func _Combo_HomeLoader_Environment_Map()
	;MsgBox(0, "_Combo_HomeLoader_Environment_Map()", "_Combo_HomeLoader_Environment_Map()")

	Local $Value = GUICtrlRead($Combo_HomeLoader_Environment_Map)

	Local $Environment_Map = $Value
	If $Environment_Map = "" Then
		$Environment_Map = "homeloader_default"
	EndIf

	IniWrite($SteamVR_Home_Environment_Settings_INI, "Settings", "Map", $Environment_Map)

	$HomeLoader_Map_Image = $HomeLoader_Map_Folder & $Environment_Map & "\" & "preview_image.jpg"
	If FileExists($HomeLoader_Map_Image) Then
		GUICtrlSetImage($Map_Preview_Image, $HomeLoader_Map_Image)

		Local $Map_INI = $HomeLoader_Map_Folder & $Environment_Map & "\map.ini"
		Local $Map_Name = IniRead($Map_INI, "Map", "Name", "")
		Local $Map_Environment_by = IniRead($Map_INI, "Map", "Environment_by", "")
		Local $Map_Environment_source = IniRead($Map_INI, "Map", "Environment_source", "")
		Local $Map_Model_by = IniRead($Map_INI, "Map", "Model_by", "")
		Local $Map_Model_source = IniRead($Map_INI, "Map", "Model_source", "")

		GUICtrlSetTip($Map_Preview_Image, "Map Name: " & @TAB & @TAB & $Map_Name & @CRLF & _
											"Environment by: " & @TAB & @TAB & $Map_Environment_by & @CRLF & _
											"Environment source: " & @TAB & $Map_Environment_source & @CRLF & _
											"Model by: " & @TAB & @TAB & $Map_Model_by & @CRLF & _
											"Model source: " & @TAB & @TAB & $Map_Model_source & @CRLF)
	Else
		GUICtrlSetImage($Map_Preview_Image, $HomeLoader_Map_Image_Template)
	EndIf
EndFunc




Func _Button_Panel_Settings_Apply()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14441) :(' & @MIN & ':' & @SEC & ') _Button_Panel_Settings_Apply()' & @CR) ;### Function Trace

	Local $SteamVR_Home_Environment_Enable_DVD_Case = IniRead($SteamVR_Home_Environment_Settings_INI, "Settings", "Enable_DVD_Case", "")

	;If $HomeApp = "SteamVR Home" Then

		Local $Timer = TimerInit()

		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment started.")
		If WinExists("HomeLoader - Library") Then
			_GUICtrlStatusBar_SetText($Statusbar, "Preparing SteamVR Home Environment [1/2], please wait..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		EndIf

		If WinExists("HomeLoader - Library") Then
			GUICtrlSetData($Anzeige_Fortschrittbalken_2, 5)
		EndIf
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[1]")
		_Create_SteamVR_Home_GamePages()

		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 20)

		If $SteamVR_Home_Environment_Enable_DVD_Case = "true" Then
			_Create_Environment_Control_Panel()
		EndIf

		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 35)

		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[2]")
		_Create_Panel_CSS()

		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 45)

		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[3]")
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 10)
		_Create_Menu_Panel()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 30)
		_Create_Menu_LUA()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 50)
		_Create_Tool_S_LUA_Files()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 70)
		_Create_LUA_Files()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 90)
		_Create_Map_Script_LUA()
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
		Sleep(500)
		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken, 0)


		If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 50)
		Sleep(500)

		If $SteamVR_Home_Environment_Enable_DVD_Case = "true" Then
			If WinExists("HomeLoader - Library") Then
				GUICtrlSetData($Anzeige_Fortschrittbalken_2, 55)
			EndIf
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[4]")

			If WinExists("HomeLoader - Library") Then
				GUICtrlSetData($Anzeige_Fortschrittbalken_2, 60)
			EndIf
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[5]")
			_Add_DVD_Case_Models()

			If WinExists("HomeLoader - Library") Then
				GUICtrlSetData($Anzeige_Fortschrittbalken_2, 65)
			EndIf
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[6]")
			_Add_DVD_Case_Materials()

			If WinExists("HomeLoader - Library") Then
				GUICtrlSetData($Anzeige_Fortschrittbalken_2, 70)
			EndIf
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[7]")
			_Create_DVD_Case_Cover_JPG()
			If WinExists("HomeLoader - Library") Then
				GUICtrlSetData($Anzeige_Fortschrittbalken_2, 75)
			EndIf
		EndIf


		If WinExists("HomeLoader - Library") Then
			_GUICtrlStatusBar_SetText($Statusbar, "Preparing SteamVR Home Environment [2/2], please wait..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
			GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
			GUICtrlSetData($Anzeige_Fortschrittbalken_2, 80)
			Sleep(1000)
		EndIf

		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[7]")
		_Compile_SteamVR_Files()

		If WinExists("HomeLoader - Library") Then
			GUICtrlSetData($Anzeige_Fortschrittbalken_2, 90)
		EndIf

		If $SteamVR_Home_Environment_Enable_DVD_Case = "true" Then
			_Add_Empty_DVD_Cases()
		EndIf

		If WinExists("HomeLoader - Library") Then
			GUICtrlSetData($Anzeige_Fortschrittbalken_2, 95)
		EndIf
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[8]")

		If $Use_unpacked_workshop_environment = "false" Then
			_Pack_Environment_Final()
		EndIf

		Sleep(1000)

		If WinExists("HomeLoader - Library") Then
			GUICtrlSetData($Anzeige_Fortschrittbalken_2, 100)
		EndIf
		If WinExists("HomeLoader - Library") Then
			_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		EndIf
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment finished.")
		Sleep(500)
	;Else
		;If WinExists("HomeLoader - Library") Then
		;	_GUICtrlStatusBar_SetText($Statusbar, "Attention: Home App needs to be set to 'SteamVR Home'" & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		;EndIf
	;EndIf

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	EndIf
	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken_2, 0)
	EndIf

	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	;If $HomeApp <> "SteamVR Home" Then _StartUp_Radio_1()

	Local $TimerDiff = TimerDiff($Timer)
	Local $sec = Round(($TimerDiff / 1000), 2) ; sec
	Local $min = Round(($sec / 60), 2) ; min
	Local $TimerDiff_temp = $sec & " seconds"
	If $sec > 60 Then $TimerDiff_temp = $min & " minutes"
	_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & @TAB & "Environment Updated in: " & $TimerDiff_temp & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
EndFunc


Func _RM_Button_SteamVRHome_Panel_Settings_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14555) :(' & @MIN & ':' & @SEC & ') _RM_Button_SteamVRHome_Panel_Settings_1()' & @CR) ;### Function Trace
	Local $Timer = TimerInit()
	_Button_Panel_Settings_Apply()
	Local $TimerDiff = TimerDiff($Timer)
	Local $sec = Round(($TimerDiff / 1000), 2) ; sec
	Local $min = Round(($sec / 60), 2) ; min
	Local $TimerDiff_temp = $sec & " seconds"
	If $sec > 60 Then $TimerDiff_temp = $min & " minutes"
	_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & @TAB & "Environment Updated in: " & $TimerDiff_temp & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
EndFunc

Func _RM_Button_SteamVRHome_Panel_Settings_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14567) :(' & @MIN & ':' & @SEC & ') _RM_Button_SteamVRHome_Panel_Settings_2()' & @CR) ;### Function Trace
	Local $Timer = TimerInit()
	If WinExists("HomeLoader - Library") Then
		_GUICtrlStatusBar_SetText($Statusbar, "Preparing SteamVR Home Environment...please wait..." & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		GUICtrlSetData($Anzeige_Fortschrittbalken, 10)
	EndIf
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[1]")
	_Create_SteamVR_Home_GamePages()

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 40)
	EndIf
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[2]")
	_Create_Panel_CSS()

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 60)
	EndIf
	_Compile_Panels()

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
		Sleep(500)
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
		_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & @TAB & "Apps: " & $NR_ApplicationsCheck & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	EndIf

	If $Use_unpacked_workshop_environment = "false" Then
		_Pack_Environment_Final()
	EndIf

	Local $TimerDiff = TimerDiff($Timer)
	Local $sec = Round(($TimerDiff / 1000), 2) ; sec
	Local $min = Round(($sec / 60), 2) ; min
	Local $TimerDiff_temp = $sec & " seconds"
	If $sec > 60 Then $TimerDiff_temp = $min & " minutes"
	_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & @TAB & "Environment Updated in: " & $TimerDiff_temp & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
EndFunc

Func _RM_Button_SteamVRHome_Panel_Settings_3()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14603) :(' & @MIN & ':' & @SEC & ') _RM_Button_SteamVRHome_Panel_Settings_3()' & @CR) ;### Function Trace
	Local $Timer = TimerInit()
	If WinExists("HomeLoader - Library") Then
		_GUICtrlStatusBar_SetText($Statusbar, "Preparing SteamVR Home Environment...please wait..." & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		GUICtrlSetData($Anzeige_Fortschrittbalken, 10)
	EndIf
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[1]")
	_Create_Menu_Panel()

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 40)
	EndIf
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[2]")
	_Create_Menu_LUA()
	_Create_Tool_S_LUA_Files()

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 60)
	EndIf
	_Compile_HomeLoader_Menu()

	If $Use_unpacked_workshop_environment = "false" Then
		_Pack_Environment_Final()
	EndIf

	If WinExists("HomeLoader - Library") Then
		;GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
		Sleep(500)
		;GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
		_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & @TAB & "Apps: " & $NR_ApplicationsCheck & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	EndIf

	Local $TimerDiff = TimerDiff($Timer)
	Local $sec = Round(($TimerDiff / 1000), 2) ; sec
	Local $min = Round(($sec / 60), 2) ; min
	Local $TimerDiff_temp = $sec & " seconds"
	If $sec > 60 Then $TimerDiff_temp = $min & " minutes"
	_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & @TAB & "Environment Updated in: " & $TimerDiff_temp & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
EndFunc

Func _RM_Button_SteamVRHome_Panel_Settings_4()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14640) :(' & @MIN & ':' & @SEC & ') _RM_Button_SteamVRHome_Panel_Settings_4()' & @CR) ;### Function Trace
	Local $Timer = TimerInit()
	If WinExists("HomeLoader - Library") Then
		_GUICtrlStatusBar_SetText($Statusbar, "Preparing SteamVR Home Environment...please wait..." & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
		GUICtrlSetData($Anzeige_Fortschrittbalken, 10)
	EndIf
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[3]")
	_Create_LUA_Files()
	_Create_Map_Script_LUA()

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 30)
	EndIf
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[4]")
	_Add_DVD_Case_Models()

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 50)
	EndIf
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[5]")
	_Add_DVD_Case_Materials()

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 60)
	EndIf
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Preparing SteamVR Home Environment[6]")
	_Create_DVD_Case_Cover_JPG()

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 70)
	EndIf
	_Compile_DVD_Case_Models()

	If $Use_unpacked_workshop_environment = "false" Then
		_Pack_Environment_Final()
	EndIf

	If WinExists("HomeLoader - Library") Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
		Sleep(500)
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
		_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & @TAB & "Apps: " & $NR_ApplicationsCheck & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	EndIf

	Local $TimerDiff = TimerDiff($Timer)
	Local $sec = Round(($TimerDiff / 1000), 2) ; sec
	Local $min = Round(($sec / 60), 2) ; min
	Local $TimerDiff_temp = $sec & " seconds"
	If $sec > 60 Then $TimerDiff_temp = $min & " minutes"
	_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & @TAB & "Environment Updated in: " & $TimerDiff_temp & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
EndFunc

Func _RM_Button_SteamVRHome_Panel_Settings_5()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14689) :(' & @MIN & ':' & @SEC & ') _RM_Button_SteamVRHome_Panel_Settings_5()' & @CR) ;### Function Trace
	MsgBox(0, "_RM_Button_SteamVRHome_Panel_Settings_4()", "_RM_Button_SteamVRHome_Panel_Settings_4()")
	_Compile_HomeLoader_Maps()
EndFunc

Func _RM_Selection_Prepare_Environment_Button()
	MouseClick($MOUSE_CLICK_RIGHT)
EndFunc

Func _RM_Prepare_Environment_Item_1()
	;MsgBox(0, "_RM_Prepare_Environment_Item_1", "_RM_Prepare_Environment_Item_1")
	ShellExecute($SteamVR_Environment_URL)
EndFunc

Func _RM_Prepare_Environment_Item_2()
	;MsgBox(0, "_RM_Prepare_Environment_Item_2", "_RM_Prepare_Environment_Item_2")
	_Update_HomeLoader_Environment_Workshop_Files_Folders()
EndFunc

Func _RM_Prepare_Environment_Item_3()
	;MsgBox(0, "_RM_Prepare_Environment_Item_3", "_RM_Prepare_Environment_Item_3")
	;_Select_New_Workshop_Environment_File()
EndFunc

Func _RM_Prepare_Environment_Item_4()
	IniWrite($SteamVR_Home_Environment_Settings_INI, "Settings", "Use_unpacked_workshop_environment", "true")
	GUICtrlSetState($RM_Prepare_Environment_Item_4, $GUI_CHECKED)
	GUICtrlSetState($RM_Prepare_Environment_Item_5, $GUI_UNCHECKED)
	$Use_unpacked_workshop_environment = "true"
EndFunc

Func _RM_Prepare_Environment_Item_5()
	Local $HomeLoader_VPK_Folder = $Install_DIR & "Apps\SteamVR_Home\VPK\"
	Local $VPK_Path = $HomeLoader_VPK_Folder & "vpk.exe"

	If Not FileExists($VPK_Path) Then
		_Check_VPK()
	EndIf

	If FileExists($VPK_Path) Then
		IniWrite($SteamVR_Home_Environment_Settings_INI, "Settings", "Use_unpacked_workshop_environment", "false")
		GUICtrlSetState($RM_Prepare_Environment_Item_4, $GUI_UNCHECKED)
		GUICtrlSetState($RM_Prepare_Environment_Item_5, $GUI_CHECKED)
		$Use_unpacked_workshop_environment = "false"
	Else
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Attention.", "vpk.exe File could not be found." & @CRLF & _
															"Try again after one of the mentioned games is installed " & _
															"or after copying the vpk.exe manually to the following folder." & @CRLF & @CRLF & _
															$HomeLoader_VPK_Folder & @CRLF)
	EndIf
EndFunc

Func _RM_Prepare_Environment_Item_6()
	;MsgBox(0, "_RM_Prepare_Environment_Item_6", "_RM_Prepare_Environment_Item_6")
	_Pack_Environment_Final()
EndFunc

Func _RM_Map_Preview_Image()
	MouseClick($MOUSE_CLICK_RIGHT)
EndFunc

Func _RM_Button_RM_Map_Preview_Image_1()
	Local $Value_Map = IniRead($SteamVR_Home_Environment_Settings_INI, "Settings", "Map", "")

	Local $Environment_Map = $Value_Map
	If $Environment_Map = "" Then
		$Environment_Map = "homeloader_default"
	EndIf

	Local $Map_INI = $HomeLoader_Map_Folder & $Environment_Map & "\map.ini"
	Local $Map_Environment_source = IniRead($Map_INI, "Map", "Environment_source", "")

	If StringLeft($Map_Environment_source, 4) = "http" Then
		ShellExecute($Map_Environment_source)
	EndIf
EndFunc

Func _RM_Button_RM_Map_Preview_Image_2()
	Local $Value_Map = IniRead($SteamVR_Home_Environment_Settings_INI, "Settings", "Map", "")

	Local $Environment_Map = $Value_Map
	If $Environment_Map = "" Then
		$Environment_Map = "homeloader_default"
	EndIf

	Local $Map_INI = $HomeLoader_Map_Folder & $Environment_Map & "\map.ini"
	Local $Map_Model_source = IniRead($Map_INI, "Map", "Model_source", "")

	If StringLeft($Map_Model_source, 4) = "http" Then
		ShellExecute($Map_Model_source)
	EndIf
EndFunc





Func _Button_Environment_Apply_Map()
	_Copy_Map_Files()
	Local $Environment_Map = IniRead($SteamVR_Home_Environment_Settings_INI, "Settings", "Map", "")
	$NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")

	Sleep(500)
	If WinExists("HomeLoader - Library") Then
		Sleep(250)
		_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & $Scan_Duration & @TAB & "Apps: " & $NR_ApplicationsCheck & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	EndIf
	If WinExists("HomeLoader - Library") Then GUICtrlSetData($Anzeige_Fortschrittbalken_2, 0)
EndFunc

Func _Button_Environment_Create_New_Map()
	Local $SteamtoursCFG_EXE = $SteamVR_Path & "tools\steamvr_environments\game\bin\win64\steamtourscfg.exe"
	Local $New_Map_Name = ""

	$New_Map_Name = InputBox("Map Name.", "Enter the name of your new map. Use only lowercase letters and continue with 'OK'", "new_map", "", 270, 140)

	;Local $Template_Folder = $Install_DIR & "Apps\SteamVR_Home\Maps\homeloader_template\"
	Local $Template_Folder = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\" & "homeloader" & "\maps\homeloader_template\"
	;Local $Template_File = $Install_DIR & "Apps\SteamVR_Home\Maps\homeloader_template\map_homeloader_template.vmap"
	Local $Template_File = $Template_Folder & "map_homeloader_template.vmap"
	Local $New_Map_File = $SteamVR_Path & "tools\steamvr_environments\content\steamtours_addons\" & "homeloader" & "\maps\" & $New_Map_Name & ".vmap"

	;Local $Template_Cache_File = $Install_DIR & "Apps\SteamVR_Home\Maps\homeloader_template\map_homeloader_template_bakeresourcecache.vpk"
	Local $Template_Cache_File = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\" & "homeloader" & "\maps\homeloader_template\map_homeloader_template_bakeresourcecache.vpk"
	Local $New_Map_Cache_File = $SteamVR_Path & "tools\steamvr_environments\content\steamtours_addons\" & "homeloader" & "\maps\map_" & $New_Map_Name & "_bakeresourcecache.vpk"

	If $New_Map_Name <> "" Then
		DirCopy($Template_Folder & "graphs", $Install_DIR & "Apps\SteamVR_Home\Maps\" & $New_Map_Name & "\graphs")
		Sleep(100)
		;FileCopy($Template_Folder & "map.ini", $Install_DIR & "Apps\SteamVR_Home\Maps\" & $New_Map_Name & "\map.ini", $FC_OVERWRITE + $FC_CREATEPATH)
		;Sleep(100)
		FileCopy($Template_Folder & "preview_image.jpg", $Install_DIR & "Apps\SteamVR_Home\Maps\" & $New_Map_Name & "\preview_image.jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(100)

		FileCopy($Template_File, $New_Map_File, $FC_OVERWRITE + $FC_CREATEPATH)
		FileCopy($Template_Cache_File, $New_Map_Cache_File, $FC_OVERWRITE + $FC_CREATEPATH)

		IniWrite($Install_DIR & "Apps\SteamVR_Home\Maps\" & $New_Map_Name & "\map.ini", "Map", "Name", $New_Map_Name)
		IniWrite($Install_DIR & "Apps\SteamVR_Home\Maps\" & $New_Map_Name & "\map.ini", "Map", "Environment_by", "")
		IniWrite($Install_DIR & "Apps\SteamVR_Home\Maps\" & $New_Map_Name & "\map.ini", "Map", "Environment_source", "")
		IniWrite($Install_DIR & "Apps\SteamVR_Home\Maps\" & $New_Map_Name & "\map.ini", "Map", "Model_by", "")
		IniWrite($Install_DIR & "Apps\SteamVR_Home\Maps\" & $New_Map_Name & "\map.ini", "Map", "Model_source", "")

		ShellExecute($SteamtoursCFG_EXE)
	Else
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Missing Environment Name.", "Enter an Name for the Environment and try again." & @CRLF)
	EndIf
EndFunc

Func _Button_Environment_Edit_Map()
	Local $SteamtoursCFG_EXE = $SteamVR_Path & "tools\steamvr_environments\game\bin\win64\steamtourscfg.exe"
	Local $steamtours_addons_Content_Map_Folder = $SteamVR_Path & "tools\steamvr_environments\content\steamtours_addons\homeloader\maps\"

	Local $FileList = _FileListToArray($steamtours_addons_Content_Map_Folder, "*.vmap", 1)

	If IsArray($FileList) Then
		If $FileList[0] > 0 Then
			ShellExecute($SteamtoursCFG_EXE)
		Else
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Missing Map File.", "Missing Map File. Create a New Map and try again." & @CRLF)
		EndIf
	Else
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Missing Map File.", "Missing Map File. Create a New Map and try again." & @CRLF)
	EndIf
EndFunc

Func _Button_Environment_Save_Map()
	Local $Map_Name, $Map_File_source, $Map_File_target, $AIN_File_source, $AIN_File_target
	Local $SteamtoursCFG_EXE = $SteamVR_Path & "tools\steamvr_environments\game\bin\win64\steamtourscfg.exe"
	Local $steamtours_addons_Game_Map_Folder = $SteamVR_Path & "tools\steamvr_environments\game\steamtours_addons\homeloader\maps\"
	Local $Maps_Folder = $Install_DIR & "Apps\SteamVR_Home\Maps\"

	Local $FileList = _FileListToArray($steamtours_addons_Game_Map_Folder, "*.vpk", 1)

	If IsArray($FileList) Then
		If $FileList[0] > 0 Then
			For $Loop = 1 To $FileList[0]
				If FileExists($steamtours_addons_Game_Map_Folder & $FileList[$Loop]) Then
					$Map_Name = StringReplace($FileList[$Loop], '.vpk', '')
					$Map_File_source = $steamtours_addons_Game_Map_Folder & $FileList[$Loop]
					$Map_File_target = $Maps_Folder & $Map_Name & "\" & $FileList[$Loop]
					$AIN_File_source = $steamtours_addons_Game_Map_Folder & "graphs\" & $Map_Name & ".ain"
					$AIN_File_target = $Maps_Folder & $Map_Name & "\graphs\" & $Map_Name & ".ain"

					FileCopy($Map_File_source, $Map_File_target, $FC_OVERWRITE + $FC_CREATEPATH)
					FileCopy($AIN_File_source, $AIN_File_target, $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf
			Next
		Else
			MsgBox($MB_OK + $MB_ICONINFORMATION, "Missing Map File.", "Missing Map File. Build the Map with the Hammer editor first and try again." & @CRLF)
		EndIf
	Else
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Missing Map File.", "Missing Map File. Build the Map with the Hammer editor first and try again." & @CRLF)
	EndIf
EndFunc





Func _Combo_Panel_Layout()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14695) :(' & @MIN & ':' & @SEC & ') _Combo_Panel_Layout()' & @CR) ;### Function Trace
	Local $Value = GUICtrlRead($Combo_Panel_Layout)
	IniWrite($SteamVR_Home_Environment_Settings_INI, "Settings", "Layout", $Value)
	If FileExists($Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Panel_Layouts\" & $Value & ".ini") Then
		FileCopy($Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Panel_Layouts\" & $Value & ".ini", $Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Panel_Settings.ini", $FC_OVERWRITE + $FC_CREATEPATH)
	EndIf
	_Set_SteamVR_Home_Panel_GUI_Data()
EndFunc

Func _Close_Button_SteamVRHome_Panel_Settings_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14705) :(' & @MIN & ':' & @SEC & ') _Close_Button_SteamVRHome_Panel_Settings_GUI()' & @CR) ;### Function Trace
	GUIDelete($SteamVR_Home_Panels_GUI)
EndFunc
#EndRegion Func Create Game Pages

Func _Start_Revive_Oculus_App()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14711) :(' & @MIN & ':' & @SEC & ') _Start_Revive_Oculus_App()' & @CR) ;### Function Trace
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

	MsgBox(0, "_Start_Revive_Oculus_App", $Revive_Path & $App_binary_path & " " & $Oculus_App_Path)

	;ShellExecute($Revive_Path & $App_binary_path, $Oculus_App_Path)
	RunWait($Revive_Path & $App_binary_path & " " & $Oculus_App_Path, "", @SW_HIDE)
EndFunc


#Region Read/Write Steam Files
Func _Read_steamapps_vrmanifest()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14741) :(' & @MIN & ':' & @SEC & ') _Read_steamapps_vrmanifest()' & @CR) ;### Function Trace
	If FileExists($ApplicationList_SteamVRLibrary_ALL_INI) Then FileDelete($ApplicationList_SteamVRLibrary_ALL_INI)
	Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	Local $FileLines = _FileCountLines($Steamapps_vrmanifest_FilePath)
	$Array_Result = _FileReadToArray($Steamapps_vrmanifest_FilePath, $Steamapps_vrmanifest_Array)
	If @error Then
		$ScriptLineNumber_Temp = @ScriptLineNumber
		$AtError_Result = @error
	EndIf
	If $AtError_Result <> "" Or $Array_Result = -1 Then _FileReadToArray_Error_Handler()

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
					$Array_Result = _ArrayAdd($Array_Sorted, $sFill)
					If @error Then
						$ScriptLineNumber_Temp = @ScriptLineNumber
						$AtError_Result = @error
					EndIf
					If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()

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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14844) :(' & @MIN & ':' & @SEC & ') _Read_SteamVR_VRSettings()' & @CR) ;### Function Trace
	Local $FileLines = _FileCountLines($Steamvr_vrsettings_FilePath)
	$Array_Result = _FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)
	If @error Then
		$ScriptLineNumber_Temp = @ScriptLineNumber
		$AtError_Result = @error
	EndIf
	If $AtError_Result <> "" Or $Array_Result = -1 Then _FileReadToArray_Error_Handler()

	If FileExists($Steamvr_vrsettings_FilePath) Then
		$Loop_End_1 = $Steamvr_vrsettings_Array[0]

		For $Loop = 1 To $Loop_End_1
			$Steamvr_vrsettings_aArray = _StringBetween($Steamvr_vrsettings_Array[$Loop], '"', '"', $STR_ENDNOTSTART)

			If $Steamvr_vrsettings_aArray <> 0 Then
				If $Steamvr_vrsettings_aArray[0] <> "" Then
					Local $StringInString_Check = StringInStr($Steamvr_vrsettings_aArray[0], 'steam.app.')

					Local $SteamAppID_TEMP = ""
					Local $motionSmoothingOverride_TEMP = ""
					Local $ResolutionScale_TEMP = ""

					If $StringInString_Check <> 0 Then
						$Steam_app_Name_TEMP = StringReplace($Steamvr_vrsettings_Array[$Loop + 1], '      "appName" : "', '')
						$Steam_app_Name_TEMP = StringReplace($Steam_app_Name_TEMP, '",', '')

						Local $SteamAppID_TEMP = StringReplace($Steamvr_vrsettings_Array[$Loop], '   "steam.app.', '')
						$SteamAppID_TEMP = StringReplace($SteamAppID_TEMP, '" : {', '')

						If StringInStr($Steamvr_vrsettings_Array[$Loop + 2], 'motionSmoothingOverride') <> 0 Then
							$motionSmoothingOverride_TEMP = StringReplace($Steamvr_vrsettings_Array[$Loop + 2], '      "motionSmoothingOverride" : ', '')
							$motionSmoothingOverride_TEMP = StringReplace($motionSmoothingOverride_TEMP, ',', '')
						Else
							If StringInStr($Steamvr_vrsettings_Array[$Loop + 3], 'motionSmoothingOverride') <> 0 Then
								$motionSmoothingOverride_TEMP = StringReplace($Steamvr_vrsettings_Array[$Loop + 3], '      "motionSmoothingOverride" : ', '')
								$motionSmoothingOverride_TEMP = StringReplace($motionSmoothingOverride_TEMP, ',', '')
							EndIf
						EndIf

						If StringInStr($Steamvr_vrsettings_Array[$Loop + 2], 'resolutionScale') <> 0 Then
							$ResolutionScale_TEMP = StringReplace($Steamvr_vrsettings_Array[$Loop + 2], '      "resolutionScale" : ', '')
							$ResolutionScale_TEMP = StringReplace($ResolutionScale_TEMP, ',', '')
						Else
							If StringInStr($Steamvr_vrsettings_Array[$Loop + 3], 'resolutionScale') <> 0 Then
								$ResolutionScale_TEMP = StringReplace($Steamvr_vrsettings_Array[$Loop + 3], '      "resolutionScale" : ', '')
								$ResolutionScale_TEMP = StringReplace($ResolutionScale_TEMP, ',', '')
							EndIf
						EndIf

						;MsgBox(0, "2", $Steam_app_Name_TEMP & @CRLF & $SteamAppID_TEMP & @CRLF & $motionSmoothingOverride_TEMP & @CRLF & $ResolutionScale_TEMP)

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
						IniWrite($ApplicationList_INI_TEMP, "Application_" & $ApplicationList_NR_TEMP, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
						IniWrite($ApplicationList_INI_TEMP, "Application_" & $SteamAppID_TEMP, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
						IniWrite($ApplicationList_INI_TEMP, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
						IniWrite($ApplicationList_INI_TEMP, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)

						Local $Check_NR_Custom = IniRead($ApplicationList_Custom_1_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
						If $Check_NR_Custom <> "" Then
							;IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_NR_Custom, "name", $Steam_app_Name_TEMP[1])
							;IniWrite($ApplicationList_Custom_1_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
							IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_NR_Custom, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
							IniWrite($ApplicationList_Custom_1_INI, "Application_" & $SteamAppID_TEMP, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
							IniWrite($ApplicationList_Custom_1_INI, "Application_" & $Check_NR_Custom, "resolutionScale", $ResolutionScale_TEMP)
							IniWrite($ApplicationList_Custom_1_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
						EndIf

						Local $Check_NR_Custom = IniRead($ApplicationList_Custom_2_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
						If $Check_NR_Custom <> "" Then
							;IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_NR_Custom, "name", $Steam_app_Name_TEMP[1])
							;IniWrite($ApplicationList_Custom_2_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
							IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_NR_Custom, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
							IniWrite($ApplicationList_Custom_2_INI, "Application_" & $SteamAppID_TEMP, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
							IniWrite($ApplicationList_Custom_2_INI, "Application_" & $Check_NR_Custom, "resolutionScale", $ResolutionScale_TEMP)
							IniWrite($ApplicationList_Custom_2_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
						EndIf

						Local $Check_NR_Custom = IniRead($ApplicationList_Custom_3_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
						If $Check_NR_Custom <> "" Then
							;IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_NR_Custom, "name", $Steam_app_Name_TEMP[1])
							;IniWrite($ApplicationList_Custom_3_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
							IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_NR_Custom, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
							IniWrite($ApplicationList_Custom_3_INI, "Application_" & $SteamAppID_TEMP, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
							IniWrite($ApplicationList_Custom_3_INI, "Application_" & $Check_NR_Custom, "resolutionScale", $ResolutionScale_TEMP)
							IniWrite($ApplicationList_Custom_3_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
						EndIf

						Local $Check_NR_Custom = IniRead($ApplicationList_Custom_4_INI, "Application_" & $SteamAppID_TEMP, "NR", "")
						If $Check_NR_Custom <> "" Then
							;IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_NR_Custom, "name", $Steam_app_Name_TEMP[1])
							;IniWrite($ApplicationList_Custom_4_INI, "Application_" & $SteamAppID_TEMP, "name", $Steam_app_Name_TEMP[1])
							IniWrite($ApplicationList_Custom_4_INI, "Application_" & $Check_NR_Custom, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
							IniWrite($ApplicationList_Custom_4_INI, "Application_" & $SteamAppID_TEMP, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
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
									IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_App_Exists, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
									IniWrite($ApplicationList_Tag_INI, "Application_" & $SteamAppID_TEMP, "motionSmoothingOverride", $motionSmoothingOverride_TEMP)
									IniWrite($ApplicationList_Tag_INI, "Application_" & $Check_App_Exists, "resolutionScale", $ResolutionScale_TEMP)
									IniWrite($ApplicationList_Tag_INI, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
								EndIf
							EndIf
						Next
					EndIf
				EndIf
			EndIf
		Next
	EndIf
	If WinExists("HomeLoader - Library") Then
		_GUICtrlStatusBar_SetText($Statusbar, "Read SteamVR VRSettings: " & "Finished " & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	EndIf
EndFunc   ;==>_Read_SteamVR_VRSettings

Func _Write_to_SteamVR_VRSettings()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14981) :(' & @MIN & ':' & @SEC & ') _Write_to_SteamVR_VRSettings()' & @CR) ;### Function Trace
	$Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	If $Add_SS_per_game = "true" Then
		$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
		If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
		If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
		If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
		If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
		If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
		If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

		;If FileExists($Steamvr_vrsettings_FilePath & ".new") Then FileDelete($Steamvr_vrsettings_FilePath & ".new")
		Local $SteamAppExist = "false"
		Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
		$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
		Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

		Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
		Local $Steam_app_Name = $ListView_Item_Array[3]
		$Game_ID = $ListView_Item_Array[2]

		;MsgBox(0, "11580", $Steam_app_Name & @CRLF & $Game_ID)

		Local $FileLines = _FileCountLines($Steamvr_vrsettings_FilePath)
		$Array_Result = _FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileReadToArray_Error_Handler()
		$Loop_End_1 = $Steamvr_vrsettings_Array[0]

		$ApplicationList_INI_TEMP = $ApplicationList_SteamLibrary_ALL_INI

		If $ScanOnlyVR = "true" Then
			$ApplicationList_INI_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
		EndIf

		Local $Steam_app_Name_TEMP = IniRead($ApplicationList_INI_TEMP, "Application_" & $Game_ID, "name", "")
		Local $motionSmoothingOverride_TEMP = IniRead($ApplicationList_INI_TEMP, "Application_" & $Game_ID, "motionSmoothingOverride", "")
		Local $ResolutionScale_TEMP = IniRead($ApplicationList_INI_TEMP, "Application_" & $Game_ID, "resolutionScale", "")

		For $Loop = 1 To $Loop_End_1
			If StringInStr($Steamvr_vrsettings_Array[$Loop], "steam.app." & $Game_ID) <> 0 Then
				$SteamAppExist = "true"
				$SteamAppID_TEMP = $Game_ID

				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop + 1])
				If $motionSmoothingOverride_TEMP <> "" Then FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "motionSmoothingOverride" : ' & $motionSmoothingOverride_TEMP & ',')
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "resolutionScale" : ' & $ResolutionScale_TEMP)
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   },')
				$Loop = $Loop + 3
				If $motionSmoothingOverride_TEMP <> "" Then $Loop = $Loop + 4

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
						;IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "name", $Steamvr_vrsettings_Array[$Loop + 1])
						IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
						IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "name", $Steamvr_vrsettings_Array[$Loop + 1])
						IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
					EndIf
				Next
			Else
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
			EndIf
		Next

		If $SteamAppExist = "false" Then
			If FileExists($Steamvr_vrsettings_FilePath & ".new") Then FileDelete($Steamvr_vrsettings_FilePath & ".new")

			For $Loop = 1 To $Loop_End_1 - 2
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
			Next

			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   },')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   "steam.app.' & $SteamAppID_TEMP & '" : {')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "appName" : "' & $Steam_app_Name_TEMP & '",')
			If $motionSmoothingOverride_TEMP <> "" Then FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "motionSmoothingOverride" : ' & $motionSmoothingOverride_TEMP & ',')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "resolutionScale" : ' & $ResolutionScale_TEMP)
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   }')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '}')

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
					;IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "name", $Steamvr_vrsettings_Array[$Loop + 1])
					IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
					IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "name", $Steamvr_vrsettings_Array[$Loop + 1])
					IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
				EndIf
			Next
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
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15102) :(' & @MIN & ':' & @SEC & ') _RM_Write_to_SteamVR_VRSettings()' & @CR) ;### Function Trace
	$Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	$Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	If $Add_SS_per_game = "true" Then
		$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
		If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
		If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
		If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
		If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
		If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
		If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

		;If FileExists($Steamvr_vrsettings_FilePath & ".new") Then FileDelete($Steamvr_vrsettings_FilePath & ".new")
		Local $SteamAppExist = "false"
		Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
		$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
		Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

		Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
		Local $Steam_app_Name = $ListView_Item_Array[3]
		$Game_ID = $ListView_Item_Array[2]

		;MsgBox(0, "11580", $Steam_app_Name & @CRLF & $Game_ID)

		Local $FileLines = _FileCountLines($Steamvr_vrsettings_FilePath)
		$Array_Result = _FileReadToArray($Steamvr_vrsettings_FilePath, $Steamvr_vrsettings_Array)
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileReadToArray_Error_Handler()
		$Loop_End_1 = $Steamvr_vrsettings_Array[0]

		$ApplicationList_INI_TEMP = $ApplicationList_SteamLibrary_ALL_INI

		If $ScanOnlyVR = "true" Then
			$ApplicationList_INI_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
		EndIf

		Local $Steam_app_Name_TEMP = IniRead($ApplicationList_INI_TEMP, "Application_" & $Game_ID, "name", "")
		Local $motionSmoothingOverride_TEMP = IniRead($ApplicationList_INI_TEMP, "Application_" & $Game_ID, "motionSmoothingOverride", "")
		;Local $ResolutionScale_TEMP = IniRead($ApplicationList_INI_TEMP, "Application_" & $Game_ID, "resolutionScale", "")



		For $Loop = 1 To $Loop_End_1
			If StringInStr($Steamvr_vrsettings_Array[$Loop], "steam.app." & $Game_ID) <> 0 Then
				$SteamAppExist = "true"
				$SteamAppID_TEMP = $Game_ID


				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop + 1])
				If $motionSmoothingOverride_TEMP <> "" Then FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "motionSmoothingOverride" : ' & $motionSmoothingOverride_TEMP & ',')
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "resolutionScale" : ' & $ResolutionScale_TEMP)
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   },')
				$Loop = $Loop + 3
				If $motionSmoothingOverride_TEMP <> "" Then $Loop = $Loop + 4

				For $Loop_Temp = 1 To 6
					If $Loop_Temp = 1 Then $ApplicationList_TEMP_RS = $ApplicationList_SteamLibrary_ALL_INI
					If $Loop_Temp = 2 Then $ApplicationList_TEMP_RS = $ApplicationList_SteamVRLibrary_ALL_INI
					If $Loop_Temp = 3 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_1_INI
					If $Loop_Temp = 4 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_2_INI
					If $Loop_Temp = 5 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_3_INI
					If $Loop_Temp = 6 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_4_INI

					Local $ID_Exist_Check_1 = IniRead($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "appid", "")

					If $ID_Exist_Check_1 <> "" Then
						Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "NR", "")
						;IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "name", $Steamvr_vrsettings_Array[$Loop + 1])
						;IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "name", $Steamvr_vrsettings_Array[$Loop + 1])
						IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
						IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
						;MsgBox(0, $SteamAppExist, $Game_ID & @CRLF & $ResolutionScale_TEMP)
					EndIf
				Next
			Else
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
			EndIf
		Next

		;MsgBox(0, "1" & " " & $SteamAppExist, $Game_ID & @CRLF & $ResolutionScale_TEMP)

		If $SteamAppExist = "false" Then
			$SteamAppID_TEMP = $Game_ID
			If FileExists($Steamvr_vrsettings_FilePath & ".new") Then FileDelete($Steamvr_vrsettings_FilePath & ".new")

			For $Loop = 1 To $Loop_End_1 - 2
				FileWriteLine($Steamvr_vrsettings_FilePath & ".new", $Steamvr_vrsettings_Array[$Loop])
			Next

			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   },')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   "steam.app.' & $SteamAppID_TEMP & '" : {')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "appName" : "' & $Steam_app_Name_TEMP & '",')
			If $motionSmoothingOverride_TEMP <> "" Then FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "motionSmoothingOverride" : ' & $motionSmoothingOverride_TEMP & ',')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '      "resolutionScale" : ' & $ResolutionScale_TEMP)
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '   }')
			FileWriteLine($Steamvr_vrsettings_FilePath & ".new", '}')

			For $Loop_Temp = 1 To 6
				If $Loop_Temp = 1 Then $ApplicationList_TEMP_RS = $ApplicationList_SteamLibrary_ALL_INI
				If $Loop_Temp = 2 Then $ApplicationList_TEMP_RS = $ApplicationList_SteamVRLibrary_ALL_INI
				If $Loop_Temp = 3 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_1_INI
				If $Loop_Temp = 4 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_2_INI
				If $Loop_Temp = 5 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_3_INI
				If $Loop_Temp = 6 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_4_INI

				Local $ID_Exist_Check_1 = IniRead($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "appid", "")

				If $ID_Exist_Check_1 <> "" Then
					Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "NR", "")
					;IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "name", $Steamvr_vrsettings_Array[$Loop + 1])
					;IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "name", $Steamvr_vrsettings_Array[$Loop + 1])
					IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
					IniWrite($ApplicationList_TEMP_RS, "Application_" & $SteamAppID_TEMP, "resolutionScale", $ResolutionScale_TEMP)
					;MsgBox(0, $SteamAppExist, $Game_ID & @CRLF & $ResolutionScale_TEMP)
				EndIf
			Next
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


Func _Sync_All_INI_Files_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15237) :(' & @MIN & ':' & @SEC & ') _Sync_All_INI_Files_1()' & @CR) ;### Function Trace
	Local $GameID_Temp = IniRead($Config_INI, "TEMP", "GameID", "")

	If $ScanOnlyVR = "true" Then
		$ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
	Else
		$ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
	EndIf

	Local $MotionSmoothingOverride_TEMP = IniRead($ApplicationList_TEMP, "Application_" & $GameID_Temp, "motionSmoothingOverride", "")
	Local $ResolutionScale_TEMP = IniRead($ApplicationList_TEMP, "Application_" & $GameID_Temp, "resolutionScale", "")
	Local $PO_right_now_TEMP = IniRead($ApplicationList_TEMP, "Application_" & $GameID_Temp, "right_now", "")
	Local $PO_24h_peak_TEMP = IniRead($ApplicationList_TEMP, "Application_" & $GameID_Temp, "24h_peak", "")
	Local $PO_all_time_peak_TEMP = IniRead($ApplicationList_TEMP, "Application_" & $GameID_Temp, "all_time_peak", "")

	;MsgBox(0, "", $ApplicationList_TEMP)

	If $GameID_Temp <> "" Then
		For $Loop_Temp = 1 To 6
			If $Loop_Temp = 1 Then $ApplicationList_TEMP_RS = $ApplicationList_SteamLibrary_ALL_INI
			If $Loop_Temp = 2 Then $ApplicationList_TEMP_RS = $ApplicationList_SteamVRLibrary_ALL_INI
			If $Loop_Temp = 3 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_1_INI
			If $Loop_Temp = 4 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_2_INI
			If $Loop_Temp = 5 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_3_INI
			If $Loop_Temp = 6 Then $ApplicationList_TEMP_RS = $ApplicationList_Custom_4_INI

			Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_TEMP_RS, "Application_" & $GameID_Temp, "NR", "")
			Local $ID_Exist_Check_1 = IniRead($ApplicationList_TEMP_RS, "Application_" & $GameID_Temp, "appid", "")

			;MsgBox(0, $GameID_Temp, $ID_Exist_Check_1 & @CRLF & @CRLF & $ApplicationList_NR_TEMP)

			If $ID_Exist_Check_1 <> "" Then
				IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "motionSmoothingOverride", $MotionSmoothingOverride_TEMP)
				IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "resolutionScale", $ResolutionScale_TEMP)
				IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "right_now", $PO_right_now_TEMP)
				IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "24h_peak", $PO_24h_peak_TEMP)
				IniWrite($ApplicationList_TEMP_RS, "Application_" & $ApplicationList_NR_TEMP, "all_time_peak", $PO_all_time_peak_TEMP)

				IniWrite($ApplicationList_TEMP_RS, "Application_" & $GameID_Temp, "motionSmoothingOverride", $MotionSmoothingOverride_TEMP)
				IniWrite($ApplicationList_TEMP_RS, "Application_" & $GameID_Temp, "resolutionScale", $ResolutionScale_TEMP)
				IniWrite($ApplicationList_TEMP_RS, "Application_" & $GameID_Temp, "right_now", $PO_right_now_TEMP)
				IniWrite($ApplicationList_TEMP_RS, "Application_" & $GameID_Temp, "24h_peak", $PO_24h_peak_TEMP)
				IniWrite($ApplicationList_TEMP_RS, "Application_" & $GameID_Temp, "all_time_peak", $PO_all_time_peak_TEMP)
			EndIf
		Next
	EndIf
	IniWrite($Config_INI, "TEMP", "GameID", "")
EndFunc


Func _Check_PO_Data_on_Start()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15278) :(' & @MIN & ':' & @SEC & ') _Check_PO_Data_on_Start()' & @CR) ;### Function Trace
	;MsgBox(0, "Check PO Data", "Check PO Data")
	_RM_Button_Scan_Get_PO_Data()
	_Sync_All_INI_Files_1()
	;_Read_from_INI_ADD_2_ListView()
EndFunc

#Region ERROR handler
Func MyErrFunc()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15287) :(' & @MIN & ':' & @SEC & ') MyErrFunc()' & @CR) ;### Function Trace
	Local $HexNumber
	Local $strMsg

	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "Error Number: " & $HexNumber & " - "
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & " - "
	$strMsg &= "Script Line: " & $oMyError.ScriptLine & " - "

	Local $Error_Explanation_Write = "[" & _Now() & "]" & " ---> Error [MyErrFunc()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. Error retrieving URL... " & $strMsg & " - " & $name & " - " & $appid & "<--- " & "[" & _Now() & "]"

	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	If WinExists("HomeLoader - Library") Then
		_GUICtrlStatusBar_SetText($Statusbar, "" & "Error retrieving URL... " & $strMsg & " - " & $name & " - " & $appid & @TAB & "" & @TAB & "'V" & $Version & "' " & "'HomeLoader by Cogent'")
	EndIf
	SetError(1)
EndFunc   ;==>MyErrFunc

Func _ArrayAdd_Error_Handler()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15308) :(' & @MIN & ':' & @SEC & ') _ArrayAdd_Error_Handler()' & @CR) ;### Function Trace
	Local $Error_From = "_ArrayAdd_Error_Handler"
	Local $HexNumber
	Local $strMsg
	Local $Error_Explanation = ""
	Local $Error_Explanation_Details = ""
	Local $Log_NR_Lines =_FileCountLines($function_log_FILE)
	$Error_Explanation_Details = FileReadLine($function_log_FILE, $Log_NR_Lines - 2)

	Local $Check_String_NR = StringInStr($Error_Explanation_Details, ':')
	Local $Script_Line = StringReplace(StringLeft($Error_Explanation_Details, $Check_String_NR - 3), '@@ (', '')
	;$Script_Line = StringReplace($Script_Line, ') ', '')


	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "HomeLoader Version: " & $Version & @CRLF
	$strMsg &= "Error Number: " & $HexNumber & @CRLF
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & @CRLF
	$strMsg &= "Script Line: " & $Script_Line & " (" & $ScriptLineNumber_Temp & ")" ;& @CRLF


	If $Array_Result = -1 Then $Error_Explanation = "-1 - Failure @error flag to non-zero"
	If $AtError_Result = 1 Then $Error_Explanation = "1 - $aArray is not an array"
	If $AtError_Result = 2 Then $Error_Explanation = "2 - $aArray is not a 1 or 2 dimensional array"
	If $AtError_Result = 3 Then $Error_Explanation = "3 - $vValue has too many columns to fit into $aArray"
	If $AtError_Result = 4 Then $Error_Explanation = "4 - $iStart outside array bounds (2D only)"
	If $AtError_Result = 5 Then $Error_Explanation = "5 - Number of dimensions for $avArray and $vValue arrays do not match"


	If $Error_Explanation = "" Then $Error_Explanation = "(No explanation available)"

	Local $Error_Explanation_Write = "An error occurred." & " - " & "[" & _Now() & "]" & @CRLF & _
										"HomeLoader has written some informations in to the" & @CRLF & _
										"log file and cancels the current action." & @CRLF & @CRLF & _
										$Error_From & @CRLF & @CRLF & _
										"Description:" & @CRLF & _
										$strMsg & @CRLF & @CRLF & _
										"Explanation:" & @CRLF & _
										$Error_Explanation & @CRLF & _
										$Error_Explanation_Details & @CRLF


	;FileWriteLine($error_log_FILE, "@error '_ArrayAdd' " & "[" & _Now() & "]" & " : " & $strMsg & " - " & $AtError_Result & @CRLF)
	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	;Local $Abfrage = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_TASKMODAL + $MB_ICONERROR, "An error occurred", $Error_Explanation_Write & @CRLF & @CRLF & @CRLF & _
	;																					"Do you want to open the folder with the log files for further investigation?" & @CRLF & @CRLF)

	;If $Abfrage = 6 Then
	;	ShellExecute($Install_DIR & "System\logs\")
	;EndIf

	SetError(1)
EndFunc

Func _FileListToArray_Error_Handler()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15365) :(' & @MIN & ':' & @SEC & ') _FileListToArray_Error_Handler()' & @CR) ;### Function Trace
	Local $Error_From = "_FileListToArray_Error_Handler"
	Local $HexNumber
	Local $strMsg
	Local $Error_Explanation = ""
	Local $Error_Explanation_Details = ""
	Local $Log_NR_Lines =_FileCountLines($function_log_FILE)
	$Error_Explanation_Details = FileReadLine($function_log_FILE, $Log_NR_Lines - 2)

	Local $Check_String_NR = StringInStr($Error_Explanation_Details, ':')
	Local $Script_Line = StringReplace(StringLeft($Error_Explanation_Details, $Check_String_NR - 3), '@@ (', '')
	;$Script_Line = StringReplace($Script_Line, ') ', '')


	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "HomeLoader Version: " & $Version & @CRLF
	$strMsg &= "Error Number: " & $HexNumber & @CRLF
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & @CRLF
	$strMsg &= "Script Line: " & $Script_Line & " (" & $ScriptLineNumber_Temp & ")" ;& @CRLF

	If $Array_Result = 0 Then $Error_Explanation = "0 - @error flag set to non-zero and $vReturn is set to 0."
	If $AtError_Result = 1 Then $Error_Explanation = "1 - Error opening specified file"
	If $AtError_Result = 2 Then $Error_Explanation = "2 - Unable to split the file"
	If $AtError_Result = 3 Then $Error_Explanation = "3 - File lines have different numbers of fields (only if $FRTA_INTARRAYS flag not set)"
	If $AtError_Result = 4 Then $Error_Explanation = "4 - No delimiters found (only if $FRTA_INTARRAYS flag not set)"


	If $Error_Explanation = "" Then $Error_Explanation = "(No explanation available)"

	Local $Error_Explanation_Write = "An error occurred." & " - " & "[" & _Now() & "]" & @CRLF & _
										"HomeLoader has written some informations in to the" & @CRLF & _
										"log file and cancels the current action." & @CRLF & @CRLF & _
										$Error_From & @CRLF & @CRLF & _
										"Description:" & @CRLF & _
										$strMsg & @CRLF & @CRLF & _
										"Explanation:" & @CRLF & _
										$Error_Explanation & @CRLF & _
										$Error_Explanation_Details & @CRLF


	;FileWriteLine($error_log_FILE, "@error '_ArrayAdd' " & "[" & _Now() & "]" & " : " & $strMsg & " - " & $AtError_Result & @CRLF)
	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	;Local $Abfrage = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_TASKMODAL + $MB_ICONERROR, "An error occurred", $Error_Explanation_Write & @CRLF & @CRLF & @CRLF & _
	;																					"Do you want to open the folder with the log files for further investigation?" & @CRLF & @CRLF)

	;If $Abfrage = 6 Then
	;	ShellExecute($Install_DIR & "System\logs\")
	;EndIf

	SetError(1)
EndFunc

Func _FileReadToArray_Error_Handler()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15420) :(' & @MIN & ':' & @SEC & ') _FileReadToArray_Error_Handler()' & @CR) ;### Function Trace
	Local $Error_From = "_FileReadToArray_Error_Handler"
	Local $HexNumber
	Local $strMsg
	Local $Error_Explanation = ""
	Local $Error_Explanation_Details = ""
	Local $Log_NR_Lines =_FileCountLines($function_log_FILE)
	$Error_Explanation_Details = FileReadLine($function_log_FILE, $Log_NR_Lines - 2)

	Local $Check_String_NR = StringInStr($Error_Explanation_Details, ':')
	Local $Script_Line = StringReplace(StringLeft($Error_Explanation_Details, $Check_String_NR - 3), '@@ (', '')
	;$Script_Line = StringReplace($Script_Line, ') ', '')


	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "HomeLoader Version: " & $Version & @CRLF
	$strMsg &= "Error Number: " & $HexNumber & @CRLF
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & @CRLF
	$strMsg &= "Script Line: " & $Script_Line & " (" & $ScriptLineNumber_Temp & ")" ;& @CRLF

	If $AtError_Result = 1 Then $Error_Explanation = "1 - Folder not found or invalid"
	If $AtError_Result = 2 Then $Error_Explanation = "2 - Invalid $sFilter"
	If $AtError_Result = 3 Then $Error_Explanation = "3 - Invalid $iFlag"
	If $AtError_Result = 4 Then $Error_Explanation = "4 - No File(s) Found"


	If $Error_Explanation = "" Then $Error_Explanation = "(No explanation available)"

	Local $Error_Explanation_Write = "An error occurred." & " - " & "[" & _Now() & "]" & @CRLF & _
										"HomeLoader has written some informations in to the" & @CRLF & _
										"log file and cancels the current action." & @CRLF & @CRLF & _
										$Error_From & @CRLF & @CRLF & _
										"Description:" & @CRLF & _
										$strMsg & @CRLF & @CRLF & _
										"Explanation:" & @CRLF & _
										$Error_Explanation & @CRLF & _
										$Error_Explanation_Details & @CRLF


	;FileWriteLine($error_log_FILE, "@error '_ArrayAdd' " & "[" & _Now() & "]" & " : " & $strMsg & " - " & $AtError_Result & @CRLF)
	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	;Local $Abfrage = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_TASKMODAL + $MB_ICONERROR, "An error occurred", $Error_Explanation_Write & @CRLF & @CRLF & @CRLF & _
	;																					"Do you want to open the folder with the log files for further investigation?" & @CRLF & @CRLF)

	;If $Abfrage = 6 Then
	;	ShellExecute($Install_DIR & "System\logs\")
	;EndIf

	SetError(1)
EndFunc

Func _StringSplit_Error_Handler()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15474) :(' & @MIN & ':' & @SEC & ') _StringSplit_Error_Handler()' & @CR) ;### Function Trace
	Local $Error_From = "_StringSplit_Error_Handler"
	Local $HexNumber
	Local $strMsg
	Local $Error_Explanation = ""
	Local $Error_Explanation_Details = ""
	Local $Log_NR_Lines =_FileCountLines($function_log_FILE)
	$Error_Explanation_Details = FileReadLine($function_log_FILE, $Log_NR_Lines - 2)

	Local $Check_String_NR = StringInStr($Error_Explanation_Details, ':')
	Local $Script_Line = StringReplace(StringLeft($Error_Explanation_Details, $Check_String_NR - 3), '@@ (', '')
	;$Script_Line = StringReplace($Script_Line, ') ', '')


	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "HomeLoader Version: " & $Version & @CRLF
	$strMsg &= "Error Number: " & $HexNumber & @CRLF
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & @CRLF
	$strMsg &= "Script Line: " & $Script_Line & " (" & $ScriptLineNumber_Temp & ")" ;& @CRLF

	If $AtError_Result = 1 Then $Error_Explanation = "1 - Folder not found or invalid"
	If $AtError_Result = 2 Then $Error_Explanation = "2 - Invalid $sFilter"
	If $AtError_Result = 3 Then $Error_Explanation = "3 - Invalid $iFlag"
	If $AtError_Result = 4 Then $Error_Explanation = "4 - No File(s) Found"


	If $Error_Explanation = "" Then $Error_Explanation = "(No explanation available)"

	Local $Error_Explanation_Write = "An error occurred." & " - " & "[" & _Now() & "]" & @CRLF & _
										"HomeLoader has written some informations in to the" & @CRLF & _
										"log file and cancels the current action." & @CRLF & @CRLF & _
										$Error_From & @CRLF & @CRLF & _
										"Description:" & @CRLF & _
										$strMsg & @CRLF & @CRLF & _
										"Explanation:" & @CRLF & _
										$Error_Explanation & @CRLF & _
										$Error_Explanation_Details & @CRLF


	;FileWriteLine($error_log_FILE, "@error '_ArrayAdd' " & "[" & _Now() & "]" & " : " & $strMsg & " - " & $AtError_Result & @CRLF)
	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	;Local $Abfrage = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_TASKMODAL + $MB_ICONERROR, "An error occurred", $Error_Explanation_Write & @CRLF & @CRLF & @CRLF & _
	;																					"Do you want to open the folder with the log files for further investigation?" & @CRLF & @CRLF)

	;If $Abfrage = 6 Then
	;	ShellExecute($Install_DIR & "System\logs\")
	;EndIf

	SetError(1)
EndFunc

Func _URL_Download_Error_Handler()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15528) :(' & @MIN & ':' & @SEC & ') _URL_Download_Error_Handler()' & @CR) ;### Function Trace
	Local $Error_From = "_URL_Download_Error_Handler"
	Local $HexNumber
	Local $strMsg
	Local $Error_Explanation = ""
	Local $Error_Explanation_Details = ""
	Local $Log_NR_Lines =_FileCountLines($function_log_FILE)
	$Error_Explanation_Details = FileReadLine($function_log_FILE, $Log_NR_Lines - 2)

	Local $Check_String_NR = StringInStr($Error_Explanation_Details, ':')
	Local $Script_Line = StringReplace(StringLeft($Error_Explanation_Details, $Check_String_NR - 3), '@@ (', '')
	;$Script_Line = StringReplace($Script_Line, ') ', '')


	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "HomeLoader Version: " & $Version & @CRLF
	$strMsg &= "Error Number: " & $HexNumber & @CRLF
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & @CRLF
	$strMsg &= "Script Line: " & $Script_Line & " (" & $ScriptLineNumber_Temp & ")" ;& @CRLF

	If $AtError_Result = 1 Then $Error_Explanation = "1 - Folder not found or invalid"
	If $AtError_Result = 2 Then $Error_Explanation = "2 - Invalid $sFilter"
	If $AtError_Result = 3 Then $Error_Explanation = "3 - Invalid $iFlag"
	If $AtError_Result = 4 Then $Error_Explanation = "4 - No File(s) Found"


	If $Error_Explanation = "" Then $Error_Explanation = "(No explanation available)"

	Local $Error_Explanation_Write = "An error occurred." & " - " & "[" & _Now() & "]" & @CRLF & _
										"HomeLoader has written some informations in to the" & @CRLF & _
										"log file and cancels the current action." & @CRLF & @CRLF & _
										$Error_From & @CRLF & @CRLF & _
										"Description:" & @CRLF & _
										$strMsg & @CRLF & @CRLF & _
										"Explanation:" & @CRLF & _
										$Error_Explanation & @CRLF & _
										$Error_Explanation_Details & @CRLF


	;FileWriteLine($error_log_FILE, "@error '_ArrayAdd' " & "[" & _Now() & "]" & " : " & $strMsg & " - " & $AtError_Result & @CRLF)
	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	;Local $Abfrage = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_TASKMODAL + $MB_ICONERROR, "An error occurred", $Error_Explanation_Write & @CRLF & @CRLF & @CRLF & _
	;																					"Do you want to open the folder with the log files for further investigation?" & @CRLF & @CRLF)

	;If $Abfrage = 6 Then
		;ShellExecute($Install_DIR & "System\logs\")
	;EndIf

	SetError(1)
EndFunc
#EndRegion ERROR handler
