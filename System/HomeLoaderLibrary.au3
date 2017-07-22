#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Compile_Icons\InfoWindow.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#Region Inncludes
#include <GuiToolbar.au3>
#include <GuiButton.au3>
#include <FontConstants.au3>
#include <WinAPI.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <GuiTab.au3>
#include <EventLog.au3>
#include <GuiEdit.au3>
#include <buttonconstants.au3>
#include <ProgressConstants.au3>
#include <SendMessage.au3>
#include <File.au3>
#include <GuiMenu.au3>
#include <GuiStatusBar.au3>
#include <GuiHeader.au3>
#include <GuiTreeView.au3>
#include <Array.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <StaticConstants.au3>
#include <EditConstants.au3>
#include <ListViewConstants.au3>
#include <TabConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstants.au3>
#include <GDIPlus.au3>
#include <Inet.au3>
#include <IE.au3>
#include <MsgBoxConstants.au3>
#include <GuiSlider.au3>
#include <Zip.au3>
#endregion

Opt("GUIOnEventMode", 1)

#Region Set Global
Global $GUI_Loading, $GUI_Loading_2, $AddGame2Library_GUI, $Settings_GUI, $Button_Exit_Settings_GUI, $HTML_GUI, $NR_Applications
Global $appid, $name, $installdir, $NR_temp1, $NR_temp2, $NR_temp3, $NR_Library, $NR_Library_temp
Global $listview, $listview_2, $listview_3, $listview_4, $listview_5, $listview_6, $iStylesEx, $CheckBox_Restart, $Icon_Preview, $ApplicationList_TEMP
Global $ListView_ImageList_Temp, $SS_Settings_GUI, $VRSettings_Group, $Playlist_GUI, $POS_X_PlaylistButton
Global $TAB_NR, $listview_7, $listview_8, $listview_9, $listview_10, $listview_11, $listview_TEMP
Global $contextmenu, $RM_Item0, $RM_Item1, $RM_Item2, $RM_Item3, $RM_Item4, $RM_Item5, $RM_Item6, $RM_Item7,$RM_Item8,$RM_Item9, $RM_Item10, $RM_Item11, $RM_Item12
Global $Checkbox_Add_break, $Combo_Add_break, $GUI
#endregion

Global $font = "arial"
Global $font_arial = "arial"

#Region Declare Variables/Const 1
Global $Version = "0.52"
Global $config_ini = @ScriptDir & "\config.ini"
Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
Global $System_DIR = $Install_DIR & "\System\"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $ApplicationList_INI = $Install_DIR & "ApplicationList.ini"
Global $GamePage_path = $Install_DIR & "WebPage\StartPage.html"
Global $Steam_Library = IniRead($Config_INI, "Settings", "Steam_Library", "")
Global $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
Global $USE_PHP_WebServer = IniRead($Config_INI, "Settings", "USE_PHP_WebServer", "")
Global $Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")
Global $Show_Playlist = IniRead($Config_INI, "TEMP", "Show_Playlist", "")
Global $Show_SS_Menu = IniRead($Config_INI, "TEMP", "Show_SS_Menu", "")

Global $gfx = $Install_DIR & "System\gfx\"
Global $Icons = $Install_DIR & "Icons\"

Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")

Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath") & "\"

Global $HTCVive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\HTC\HTC Vive\', "ViveHelperPath")
Global $HTCVive_Path_StringReplace_1 = StringReplace($HTCVive_Path_REG, 'PCClient\HTCVRMarketplaceUserContextHelper.exe', '')
Global $HTCVive_Path = StringReplace($HTCVive_Path_StringReplace_1, '/', '\')

Global $Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
Global $Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
Global $Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
Global $Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
Global $Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

Global $Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
Global $Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
Global $Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")

Global $default_vrsettings_File = IniRead($Config_INI, "Folders", "Steam_default_vrsettings", "")
Global $default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
Global $default_vrsettings_File_new = $default_vrsettings_File & ".new"

Global $Steam_tools_vrmanifest_File = IniRead($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
Global $Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"

Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
Global $ApplicationList_Non_Steam_Appl_INI = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
Global $ApplicationList_Custom_1_INI = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
Global $ApplicationList_Custom_2_INI = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
Global $ApplicationList_Custom_3_INI = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
Global $ApplicationList_Custom_4_INI = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

Global $Playlist_1_INI = $Install_DIR & "System\Playlist\Playlist_1.ini"
Global $Playlist_2_INI = $Install_DIR & "System\Playlist\Playlist_2.ini"
Global $Playlist_3_INI = $Install_DIR & "System\Playlist\Playlist_3.ini"
Global $Playlist_4_INI = $Install_DIR & "System\Playlist\Playlist_4.ini"
Global $Playlist_5_INI = $Install_DIR & "System\Playlist\Playlist_5.ini"
Global $Add_break = IniRead($Playlist_1_INI, "Playlist", "Add_break", "false")

IniWrite($config_ini, "Settings", "Version", $Version)
#endregion

#region First Start Check
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
EndIf
#endregion

#region Declare Names
$TAB1_Label = IniRead($Config_INI, "Settings", "TAB1_Name", "")
$TAB2_Label = IniRead($Config_INI, "Settings", "TAB2_Name", "")
$TAB3_Label = IniRead($Config_INI, "Settings", "TAB3_Name", "")
$TAB4_Label = IniRead($Config_INI, "Settings", "TAB4_Name", "")
$TAB5_Label = IniRead($Config_INI, "Settings", "TAB5_Name", "")
$TAB6_Label = IniRead($Config_INI, "Settings", "TAB6_Name", "")
If $TAB1_Label = "" Then $TAB1_Label = "Steam Library"
If $TAB2_Label = "" Then $TAB2_Label = "Non-Steam_Appl"
If $TAB3_Label = "" Then $TAB3_Label = "Custom 1"
If $TAB4_Label = "" Then $TAB4_Label = "Custom 2"
If $TAB5_Label = "" Then $TAB5_Label = "Custom 3"
If $TAB6_Label = "" Then $TAB6_Label = "Custom 4"
#endregion


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
	If $Show_Playlist = "true" Then $POS_X_GUI = 10000

	; Erstellen der GUI
	Global $GUI = GUICreate("Home Loader Library", 800, $DesktopHeight, $POS_X_GUI, 4, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))


	; PROGRESS
	Global $Anzeige_Fortschrittbalken_2 = GUICtrlCreateProgress(0, $DesktopHeight - 25, $DesktopWidth, 5)
	Global $Anzeige_Fortschrittbalken = GUICtrlCreateProgress(0, $DesktopHeight - 121, $DesktopWidth, 5)

	;Status Bar $Anzeige_Fortschrittbalken
	Global $Statusbar = _GUICtrlStatusBar_Create($GUI)
	_GUICtrlStatusBar_SetSimple($Statusbar, True)

	_GUICtrlStatusBar_SetText($Statusbar, "Loading, please wait." & @TAB & "" & @TAB & "'Version " & $Version & "'")

	GUISetState()

	; Darstellung Icon Preview Rahmen
	Global $Linie_oben = GUICtrlCreatePic($gfx & "Frame.jpg", 612, 4, 177, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_unten = GUICtrlCreatePic($gfx & "Frame.jpg", 612, 87, 177, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_rechts = GUICtrlCreatePic($gfx & "Frame.jpg", 786, 4, 3, 84, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_links = GUICtrlCreatePic($gfx & "Frame.jpg", 612, 4, 3, 83, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))

	; Darstellung Icon Preview
	Global $Icon_Preview_Image = GUICtrlCreatePic($gfx & "Icon_Preview.jpg", 615, 7, 171, 80)


	; Toolbar oben
	GUICtrlCreateLabel("Home Loader Library", 5, 0, 350, 38)
	GUICtrlSetFont(-1, 24, 400, 6, "arial")

	Global $Combo_SteamLibrary = GUICtrlCreateCombo("", 0, 60, 155, 25, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, "ALL|Steam Library 1|Steam Library 2|Steam Library 3|Steam Library 4|Steam Library 5", $Steam_Library)
	GUICtrlSetFont(-1, 14, 400, 2, "arial")
	GuiCtrlSetTip(-1, "Choose Steam Library.")

	Global $Button_AddGame2Library = GUICtrlCreateButton("Add Game to Library", 345, 5, 100, 80, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_AddGame2Library, $gfx & "AddGame2Library.bmp")
	GuiCtrlSetTip(-1, "Add Game to the Home Loader Library." & @CRLF)

	Global $Button_ReScan_Steam_Library = GUICtrlCreateButton("Rescan Steam Library", 450, 5, 155, 80, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_ReScan_Steam_Library, $gfx & "ReScan_SteamLibrary.bmp")
	If $ButtonTAB_State <>  1 Then GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GuiCtrlSetTip(-1, "Rescan Steam Library." & @CRLF)

	Global $Button_HomeLoaderSettings = GUICtrlCreateButton("Home Loader settings", 440, $DesktopHeight - 100, 145, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_HomeLoaderSettings, $gfx & "HomeLoaderSettings.bmp")
	GuiCtrlSetTip(-1, "Shows the Home Loader settings menu.")

	Global $Button_Start_SteamVR = GUICtrlCreateButton("Start SteamVR", 440, $DesktopHeight - 65, 145, 29)
	GUICtrlSetFont(-1, 13, 600, 2, $font_arial)
	GUICtrlSetColor(-1, "0x006600")
	GuiCtrlSetTip(-1, "Starts SteamVR." & @CRLF & @CRLF &  "If activated [Normal Mode or Advanced mode] it will automaticly" & @CRLF & "load the 'HomeLoader.exe' when it starts SteamVR.")


	Global $Button_Settings = GUICtrlCreateButton("Settings", 590, $DesktopHeight - 100, 65, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Settings, $gfx & "Settings.bmp")
	GuiCtrlSetTip(-1, "Settings." & @CRLF & @CRLF &  "Includes:" & @CRLF & "- Steam Library Folders" & @CRLF & "- Icon Folders [Advanced mode]")

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

	$Checkbox_CreatePage = GUICtrlCreateLabel("", 4, $DesktopHeight - 77, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 22, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$Checkbox_CreatePage_Label = GUICtrlCreateLabel("All", 30, $DesktopHeight - 78, 35, 20)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")

	Global $Button_Create_GamePage = GUICtrlCreateButton("Create Game Page", 70, $DesktopHeight - 100, 166, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Create_GamePage, $gfx & "Create_GamePage.bmp")
	GuiCtrlSetTip(-1, "Create Game Page." & @CRLF & _
						"This can take some time, depending on how many games are installed and selected." & @CRLF & @CRLF)



	If $Advanced_Settings = "true" Then
		GUICtrlCreateLabel("", 72, $DesktopHeight - 61, 22, 22)
		GUICtrlSetBkColor(-1, 0)
		GUICtrlSetState(-1, $GUI_DISABLE)
		If $USE_PHP_WebServer = "true" Then $State_Checkbox_USE_PHP_GamePage = "X"
		If $USE_PHP_WebServer <> "true" Then $State_Checkbox_USE_PHP_GamePage = ""
		Global $Checkbox_USE_PHP_GamePage = GUICtrlCreateLabel($State_Checkbox_USE_PHP_GamePage, 73, $DesktopHeight - 60, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE))
		GUICtrlSetFont(-1, 16)
		$Checkbox_USE_PHP_GamePage_Label = GUICtrlCreateLabel("PHP Game Page", 97, $DesktopHeight - 60, 155, 23) ; ; +26
		GUICtrlSetFont(-1, 14, 400, 1, "arial")
	Else
		Global $POS_X_Label = 10000
		GUICtrlCreateLabel("", $POS_X_Label - 1, $DesktopHeight - 61, 22, 22)
		GUICtrlSetBkColor(-1, 0)
		GUICtrlSetState(-1, $GUI_DISABLE)
		If $USE_PHP_WebServer = "true" Then $State_Checkbox_USE_PHP_GamePage = "X"
		If $USE_PHP_WebServer <> "true" Then $State_Checkbox_USE_PHP_GamePage = ""
		Global $Checkbox_USE_PHP_GamePage = GUICtrlCreateLabel($State_Checkbox_USE_PHP_GamePage, $POS_X_Label, $DesktopHeight - 60, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE))
		GUICtrlSetFont(-1, 16)
		$Checkbox_USE_PHP_GamePage_Label = GUICtrlCreateLabel("PHP Game Page", $POS_X_Label + 24, $DesktopHeight - 60, 155, 23) ; ; +26
		GUICtrlSetFont(-1, 14, 400, 1, "arial")
	EndIf


	Global $Button_Add_to_Custom = GUICtrlCreateButton("Add to Custom", 243, $DesktopHeight - 100, 117, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Add_to_Custom, $gfx & "Add_to_Custom.bmp")
	If $ButtonTAB_State = 1 Or $ButtonTAB_State = 2 Then
		GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	Else
		GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	EndIf
	GuiCtrlSetTip(-1, "Add Entry to Custom TAB.")

	Global $Combo_Add_to_Custom = GUICtrlCreateCombo("Choose TAB", 244, $DesktopHeight - 64, 115, 15, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, $TAB3_Label & "|" & $TAB4_Label & "|" & $TAB5_Label & "|" & $TAB6_Label, "")
	GUICtrlSetFont(-1, 12, 400, 2, "arial")
	If $ButtonTAB_State = 1 Or $ButtonTAB_State = 2 Then
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
	Else
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	EndIf


	Global $Button_Playlist = GUICtrlCreateButton("Home Loader settings", 372, $DesktopHeight - 90, 56, 46, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Playlist, $gfx & "Playlist.bmp")
	GuiCtrlSetTip(-1, "Shows the Home Loader settings menu.")

	#endregion

	_Loading_GUI()

	#Region Funktionen Verknüpfen
	GUISetOnEvent($GUI_EVENT_CLOSE, "_Beenden")
	GUICtrlSetOnEvent($Button_Restart, "_Restart")
	GUICtrlSetOnEvent($Button_Exit, "_Beenden")
	GUICtrlSetOnEvent($Button_Settings, "_Settings_GUI")
	GUICtrlSetOnEvent($Button_Exit_Settings_GUI, "_Button_Exit_Settings_GUI")

	GUICtrlSetOnEvent($Combo_SteamLibrary, "_Combo_SteamLibrary")
	GUICtrlSetOnEvent($Button_AddGame2Library, "_Button_AddGame2Library")
	GUICtrlSetOnEvent($Button_ReScan_Steam_Library, "_Button_ReScan_Steam_Library")

	GUICtrlSetOnEvent($ButtonTAB_Steam_Library, "_ButtonTAB_Steam_Library")
	GUICtrlSetOnEvent($ButtonTAB_Non_Steam_Appl, "_ButtonTAB_Non_Steam_Appl")
	GUICtrlSetOnEvent($ButtonTAB_Custom_1, "_ButtonTAB_Custom_1")
	GUICtrlSetOnEvent($ButtonTAB_Custom_2 , "_ButtonTAB_Custom_2")
	GUICtrlSetOnEvent($ButtonTAB_Custom_3 , "_ButtonTAB_Custom_3")
	GUICtrlSetOnEvent($ButtonTAB_Custom_4 , "_ButtonTAB_Custom_4")

	GUICtrlSetOnEvent($Button_HomeLoaderSettings, "_Button_HomeLoaderSettings")
	GUICtrlSetOnEvent($Button_Start_SteamVR, "_Button_Start_SteamVR")

	GUICtrlSetOnEvent($Checkbox_CreatePage, "_Checkbox_all")
	GUICtrlSetOnEvent($Checkbox_CreatePage_Label, "_Checkbox_all")
	GUICtrlSetOnEvent($Checkbox_USE_PHP_GamePage, "_Checkbox_USE_PHP_GamePage")

	GUICtrlSetOnEvent($Button_Create_GamePage, "_Button_Create_GamePage_selected")
	GUICtrlSetOnEvent($Button_Add_to_Custom, "_Button_Add_to_Custom")
	GUICtrlSetOnEvent($Button_Playlist, "_Playlist_GUI")

	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")


	#endregion

	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)

	_Read_from_INI_ADD_2_ListView()

	Sleep(500)
	GUICtrlSetData($Anzeige_Fortschrittbalken, 0)

	GUIRegisterMsg($WM_notify, "_ClickOnListView")
	;_Tab()
	GUIDelete($GUI_Loading)

	$NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	_GUICtrlStatusBar_SetText($Statusbar, "'Rescan Steam Library' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & @TAB & "'Version " & $Version & "'")
EndIf

$Show_Playlist = IniRead($Config_INI, "TEMP", "Show_Playlist", "")
If $Show_Playlist = "true" Then
	GUICtrlSetState($GUI, $GUI_HIDE)
	_Playlist_GUI()
EndIf


$Show_SS_Menu = IniRead($Config_INI, "TEMP", "Show_SS_Menu", "")
If $Show_SS_Menu = "true" Then
	;GUICtrlSetState($GUI, $GUI_HIDE)
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





#Region Start Funktionen

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

	If $default_vrsettings_File = "" Then
		$Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
		$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\') & "\"
		$default_vrsettings_File = $Install_Folder_Steam_Search_Folder & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
		If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
		$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"

		If Not FileExists($default_vrsettings_File) Then
			If Not FileExists($default_vrsettings_File) Then
				$default_vrsettings_File = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File & "\")
				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
			EndIf

			If Not FileExists($default_vrsettings_File) Then
				$default_vrsettings_File = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
			EndIf

			If Not FileExists($default_vrsettings_File) Then
				$default_vrsettings_File = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
			EndIf

			If Not FileExists($default_vrsettings_File) Then
				$default_vrsettings_File = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
			EndIf

			If Not FileExists($default_vrsettings_File) Then
				$default_vrsettings_File = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
			EndIf

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
	EndIf

	If $Advanced_Settings = "true" Then
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
	EndIf


	If $Steam_tools_vrmanifest_File = "" Then
		$Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
		$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\') & "\"
		$Steam_tools_vrmanifest_File = $Install_Folder_Steam_Search_Folder & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
		If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
		$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"

		If Not FileExists($Steam_tools_vrmanifest_File) Then
			If Not FileExists($Steam_tools_vrmanifest_File) Then
				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
			EndIf

			If Not FileExists($Steam_tools_vrmanifest_File) Then
				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
			EndIf

			If Not FileExists($Steam_tools_vrmanifest_File) Then
				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
			EndIf

			If Not FileExists($Steam_tools_vrmanifest_File) Then
				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
			EndIf

			If Not FileExists($Steam_tools_vrmanifest_File) Then
				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
			EndIf

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
	EndIf
EndFunc
#endregion

#Region Func MAIN
Func _Loading_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	Local $POS_X_Loading_GUI = ($DesktopWidth / 2) - 152
	If $Show_Playlist = "true" Or $Show_SS_Menu = "true" Then $POS_X_Loading_GUI = - 1

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
	If $Advanced_Settings = "true" Then
		Global $HEIGHT_GUI = 600
		Global $POS_Y_Button_Exit_Settings_GUI = 560
		Global $POS_X_Input_Icon_Folder_1 = 10
		Global $POS_X_IconFolders_Group = 5
	Else
		Global $HEIGHT_GUI = 375
		Global $POS_Y_Button_Exit_Settings_GUI = 335
		Global $POS_X_Input_Icon_Folder_1 = 10000
		Global $POS_X_IconFolders_Group = 10000
	EndIf

	$Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
	$Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
	$Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")

	$Settings_GUI = GUICreate("Settings", 540, $HEIGHT_GUI, - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

#Region Folders
	GUICtrlCreateGroup("Steam Library Folders", 5, 5, 531, 325)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	GUICtrlCreateLabel("Library Folder 1:", 10, 42, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_1 = GUICtrlCreateInput($Install_Folder_Steam_1, 10, 65, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_1 = GUICtrlCreateButton("...", 430, 66, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_1_open = GUICtrlCreateButton("Open", 465, 66, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Install_Folder_Steam_1_save = GUICtrlCreateButton("Save", 500, 66, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_1_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_1_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 2:", 10, 97, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_2 = GUICtrlCreateInput($Install_Folder_Steam_2, 10, 120, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_2 = GUICtrlCreateButton("...", 430, 119, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_2_open = GUICtrlCreateButton("Open", 465, 119, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Install_Folder_Steam_2_save = GUICtrlCreateButton("Save", 500, 119, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_2_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_2_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 3:", 10, 152, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_3 = GUICtrlCreateInput($Install_Folder_Steam_3, 10, 175, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_3 = GUICtrlCreateButton("...", 430, 174, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_3_open = GUICtrlCreateButton("Open", 465, 174, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Install_Folder_Steam_3_save = GUICtrlCreateButton("Save", 500, 174, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_3_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_3_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 4:", 10, 207, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_4 = GUICtrlCreateInput($Install_Folder_Steam_4, 10, 230, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_4 = GUICtrlCreateButton("...", 430, 229, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_4_open = GUICtrlCreateButton("Open", 465, 229, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Install_Folder_Steam_4_save = GUICtrlCreateButton("Save", 500, 229, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_4_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_4_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 5:", 10, 262, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_5 = GUICtrlCreateInput($Install_Folder_Steam_5, 10, 285, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_5 = GUICtrlCreateButton("...", 430, 284, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_5_open = GUICtrlCreateButton("Open", 465, 284, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Install_Folder_Steam_5_save = GUICtrlCreateButton("Save", 500, 284, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_5_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_5_save, $gfx & "Save_small.bmp")
#endregion


#Region Icon Folders
	GUICtrlCreateGroup("Icon Folders", $POS_X_IconFolders_Group, 335, 531, 215)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	Local $Label_Icon_Path_1 = "Custom 1:"
	If $Icon_Folder_1 = $Install_DIR & "WebPage\images\" Then
		$Label_Icon_Path_1 = "HTML Icon folder:"
	EndIf

	Local $Label_Icon_Path_2 = "Custom 2:"
	If $Icon_Folder_2 = $HTCVive_Path & "Updater\App\Dashboard\win32\header_image\" Then
		$Label_Icon_Path_2 = "Vive Home:"
	EndIf

	GUICtrlCreateLabel($Label_Icon_Path_1, $POS_X_Input_Icon_Folder_1, 372, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Icon_Folder_1 = GUICtrlCreateInput($Icon_Folder_1, $POS_X_Input_Icon_Folder_1, 395, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Icon_Folder_1 = GUICtrlCreateButton("...", $POS_X_Input_Icon_Folder_1 + 420, 396, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_1")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Icon_Folder_1_open = GUICtrlCreateButton("Open", $POS_X_Input_Icon_Folder_1 + 455, 396, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_1_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Icon_Folder_1_save = GUICtrlCreateButton("Save", $POS_X_Input_Icon_Folder_1 + 490, 396, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_1_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Icon_Folder_1_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Icon_Folder_1_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel($Label_Icon_Path_2, $POS_X_Input_Icon_Folder_1, 427, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Icon_Folder_2 = GUICtrlCreateInput($Icon_Folder_2, $POS_X_Input_Icon_Folder_1, 450, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Icon_Folder_2 = GUICtrlCreateButton("...", $POS_X_Input_Icon_Folder_1 + 420, 451, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_2")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Icon_Folder_2_open = GUICtrlCreateButton("Open", $POS_X_Input_Icon_Folder_1 + 455, 451, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_2_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Icon_Folder_2_save = GUICtrlCreateButton("Save", $POS_X_Input_Icon_Folder_1 + 490, 451, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_2_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Icon_Folder_2_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Icon_Folder_2_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Custom 3:", $POS_X_Input_Icon_Folder_1, 482, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Icon_Folder_3 = GUICtrlCreateInput($Icon_Folder_3, $POS_X_Input_Icon_Folder_1, 505, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Icon_Folder_3 = GUICtrlCreateButton("...", $POS_X_Input_Icon_Folder_1 + 420, 506, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_3")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Icon_Folder_3_open = GUICtrlCreateButton("Open", $POS_X_Input_Icon_Folder_1 + 455, 506, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_3_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Icon_Folder_3_save = GUICtrlCreateButton("Save", $POS_X_Input_Icon_Folder_1 + 490, 506, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_2_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Icon_Folder_3_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Icon_Folder_3_save, $gfx & "Save_small.bmp")
#endregion


	Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", 500, $POS_Y_Button_Exit_Settings_GUI, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_Settings_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	GUISetState()
	$Game_ID = ""
EndFunc

Func _AddGame2Library_GUI()
	$AddGame2Library_GUI = GUICreate("Add Game to Library", 349, 305 , - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	; Darstellung Icon Preview Rahmen
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
	$SS_Settings_GUI = GUICreate("Steam VR Settings Menu", 285, 290 , - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	$VRSettings_Group = GUICtrlCreateGroup("VR Settings - " & $Steam_app_Name, 5, 5, 275, 240)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 12, 400, 6, $font_arial)

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
	If $allowSupersampleFiltering_value = "true" Then $aSsF_value = 0
	If $allowSupersampleFiltering_value = "false" Then $aSsF_value = 1


	GUICtrlCreateLabel("Render Target Multiplier:", 10, 40, 265, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)

	Global $Slider_1 = GUICtrlCreateSlider(10, 65, 200, 30, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUICtrlSetLimit($Slider_1, 25, 5)
	GUICtrlSetData ($Slider_1, $rTM_value)
	GUICtrlSetOnEvent(- 1, "_Slider_1")

	Global $Input_renderTargetMultiplier = GUICtrlCreateInput($rTM_Input_value, 205, 65, 65, 30)
	GUICtrlSetFont(-1, 14, $FW_NORMAL, "", $font_arial)
	Global $UpDown_renderTargetMultiplier = GUICtrlCreateUpdown($Input_renderTargetMultiplier)
	GUICtrlSetOnEvent(- 1, "_UpDown_renderTargetMultiplier")


	GUICtrlCreateLabel("Supersample Scale:", 10, 110, 265, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)

	Global $Slider_2 = GUICtrlCreateSlider(10, 135, 200, 30, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUICtrlSetLimit($Slider_2, 25, 5)
	GUICtrlSetData ($Slider_2, $ssS_value)
	GUICtrlSetOnEvent(- 1, "_Slider_2")

	Global $Input_supersampleScale = GUICtrlCreateInput($ssS_Input_value, 205, 135, 65, 30)
	GUICtrlSetFont(-1, 14, $FW_NORMAL, "", $font_arial)
	Global $UpDown_supersampleScale = GUICtrlCreateUpdown($Input_supersampleScale)
	GUICtrlSetOnEvent(- 1, "_UpDown_supersampleScale")

	GUICtrlCreateLabel("Allow Supersample Filtering:", 10, 180, 265, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)

	Global $Slider_3 = GUICtrlCreateSlider(10, 205, 200, 30, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUICtrlSetLimit($Slider_3, 1, 0)
	GUICtrlSetData ($Slider_3, $aSsF_value)
	GUICtrlSetOnEvent(- 1, "_Slider_3")

    Global $ComboBox_3 = GUICtrlCreateCombo("", 205, 205, 65, 30)
	GUICtrlSetFont(-1, 13, 400, 1, $font_arial)
	GUICtrlSetData($ComboBox_3, "true|false", $allowSupersampleFiltering_value)
	GUICtrlSetOnEvent(- 1, "_ComboBox_3")


	Global $Button_Save_Settings_GUI = GUICtrlCreateButton("Save", 5, 250, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Save_Settings_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Speichern.bmp")
	GuiCtrlSetTip(-1, "Save values to HomeLoaderLibrary File.")

	Global $Button_Add2Steam_Settings_GUI = GUICtrlCreateButton("Add to Steam", 52, 250, 85, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Add2Steam_Settings_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Add2Steam.bmp")
	GuiCtrlSetTip(-1, "Add values to the Steam VR settings File [default.vrsettings].")

	Global $Button_StartGame_Settings_GUI = GUICtrlCreateButton("Start Game", 148, 250, 85, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_StartGame_Settings_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "StartGame.bmp")
	GuiCtrlSetTip(-1, "Saves, Adds and Starts the selected game using the current values.")

	Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", 245, 250, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_SS_Settings_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	GUISetState()
EndFunc

Func _Playlist_GUI()
	$Playlist_GUI = GUICreate("Playlist", 600, 485, - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	Global $TAB_NR = GUICtrlCreateTab(197, 50, 555, 275, BitOR($TCS_BUTTONS, $TCS_FLATBUTTONS))
	GUICtrlSetOnEvent($TAB_NR, "_Tab")

	Global $TAB_NR_1 = GUICtrlCreateTabItem("Playlist 1")
	_Create_ListView_7()
	GUICtrlCreateTabItem("")

	Global $TAB_NR_2 = GUICtrlCreateTabItem("Playlist 2")
	_Create_ListView_8()
	GUICtrlCreateTabItem("")

	Global $TAB_NR_3 = GUICtrlCreateTabItem("Playlist 3")
	_Create_ListView_9()
	GUICtrlCreateTabItem("")

	Global $TAB_NR_4 = GUICtrlCreateTabItem("Playlist 4")
	_Create_ListView_10()
	GUICtrlCreateTabItem("")

	Global $TAB_NR_5 = GUICtrlCreateTabItem("Playlist 5")
	_Create_ListView_11()
	GUICtrlCreateTabItem("")


	GUICtrlCreateGroup("Create / Add Appl. to Playlist", 5, 5, 591, 325)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	Global $Combo_Playlist_LIBRARY = GUICtrlCreateCombo("Choose LIBRARY", 10, 70, 175, 25, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, $TAB1_Label & "|" & $TAB2_Label & "|" & $TAB3_Label & "|" & $TAB4_Label & "|" & $TAB5_Label & "|" & $TAB6_Label, $TAB1_Label)
	GUICtrlSetFont(-1, 12, 400, 2, "arial")
	GUICtrlSetOnEvent(- 1, "_Combo_Playlist_LIBRARY")

	Global $Combo_Choose_Application = GUICtrlCreateCombo("Choose Application", 10, 105, 175, 25)
	GUICtrlSetFont(-1, 12, 400, 2, "arial")
	GUICtrlSetOnEvent(- 1, "_Combo_Choose_Application")


	GUICtrlCreateLabel("Playtime", 10, 147, 120, 30)
	GUICtrlSetFont(-1, 11, 400, 6, "arial")
	GUICtrlCreateLabel("[Minutes]", 67, 148, 120, 30)
	GUICtrlSetFont(-1, 9, 400, 1, "arial")

	GUICtrlCreateLabel("renderTargetM.", 10, 182, 140, 30)
	GUICtrlSetFont(-1, 11, 400, 6, "arial")

	GUICtrlCreateLabel("supersampleS.", 10, 217, 140, 30)
	GUICtrlSetFont(-1, 11, 400, 6, "arial")

	GUICtrlCreateLabel("SupersampleF.", 10, 252, 140, 20)
	GUICtrlSetFont(-1, 11, 400, 6, "arial")


	Global $Combo_Playtime = GUICtrlCreateCombo("", 120, 142, 65, 20)
	GUICtrlSetFont(-1, 12, 400, 2, "arial")
	GUICtrlSetData(-1, "05" & "|" & "10" & "|" & "15" & "|" & "20" & "|" & "30" & "|" & "45" & "|" & "60" & "|" & "90" & "|" & "120", "15")

	Global $Combo_renderTargetMultiplie = GUICtrlCreateCombo("", 120, 177, 65, 20)
	GUICtrlSetFont(-1, 12, 400, 2, "arial")
	GUICtrlSetData(-1, "0.5" & "|" & "0.6" & "|" & "0.7" & "|" & "0.8" & "|" & "0.9" & "|" & "1.0" & "|" & "1.1" & "|" & "1.2" & "|" & "1.3" & "|" & "1.4" & "|" & _
						"1.5" & "|" & "1.6" & "|" & "1.7" & "|" & "1.8" & "|" & "1.9" & "|" & "2.0" & "|" & "2.1" & "|" & "2.2" & "|" & "2.3" & "|" & "2.4" & "|" & "2.5", "1.0")

	Global $Combo_supersampleScale = GUICtrlCreateCombo("1.0", 120, 212, 65, 20)
	GUICtrlSetFont(-1, 12, 400, 2, "arial")
	GUICtrlSetData(-1, "0.5" & "|" & "0.6" & "|" & "0.7" & "|" & "0.8" & "|" & "0.9" & "|" & "1.0" & "|" & "1.1" & "|" & "1.2" & "|" & "1.3" & "|" & "1.4" & "|" & _
						"1.5" & "|" & "1.6" & "|" & "1.7" & "|" & "1.8" & "|" & "1.9" & "|" & "2.0" & "|" & "2.1" & "|" & "2.2" & "|" & "2.3" & "|" & "2.4" & "|" & "2.5", "1.0")

	Global $Combo_allowSupersampleFiltering = GUICtrlCreateCombo("", 120, 247, 65, 20)
	GUICtrlSetFont(-1, 12, 400, 2, "arial")
	GUICtrlSetData(-1, "true" & "|" & "false", "true")


	Global $Button_Add2Playlist = GUICtrlCreateButton("Add to Playlist", 9, 282, 177, 36, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Add2Playlist, $gfx & "Add2Playlist.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_Add2Playlist")


	GUICtrlCreateGroup("Control Playlist", 5, 340, 591, 100)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	Global $Button_StartPlaylist = GUICtrlCreateButton("Add to Playlist", 9, 380, 136, 53, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_StartPlaylist, $gfx & "StartPlaylist.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_StartPlaylist")

	Global $Button_StopPlaylist = GUICtrlCreateButton("Add to Playlist", 148, 380, 136, 53, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_StopPlaylist, $gfx & "StopPlaylist.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_StopPlaylist")

	$Add_break = IniRead($Playlist_1_INI, "Playlist", "Add_break", "false")
	GUICtrlCreateLabel("", 287, 383, 22, 22)
	GUICtrlSetBkColor(-1, 0)
	GUICtrlSetState(-1, $GUI_DISABLE)
	If $Add_break = "true" Then $State_Checkbox_Add_break = "X"
	If $Add_break <> "true" Then $State_Checkbox_Add_break = ""
	Global $Checkbox_Add_break = GUICtrlCreateLabel($State_Checkbox_Add_break, 288, 384, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 16)
	$Checkbox_Add_break_Label = GUICtrlCreateLabel("Break between applications", 312, 385, 199, 23) ; ; +26
	GUICtrlSetFont(-1, 13, 400, 1, "arial")
	GUICtrlSetOnEvent($Checkbox_Add_break, "_Checkbox_Add_break")
	GUICtrlSetOnEvent($Checkbox_Add_break_Label, "_Checkbox_Add_break")

	Global $Combo_Add_break = GUICtrlCreateCombo("", 513, 382, 77, 20)
	GUICtrlSetFont(-1, 11, 400, 2, "arial")
	GUICtrlSetData(-1, "00 Min." & "|" & "01 Min." & "|" & "02 Min." & "|" & "04 Min." & "|" & "06 Min." & "|" & "08 Min." & "|" & "10 Min." & "|" & "15 Min.")
	GUICtrlSetOnEvent(- 1, "_Combo_Add_break")


	Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", 560, 445, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_Playlist_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")


	$State_Combobox = GUICtrlRead($Combo_Playlist_LIBRARY)
	If $State_Combobox <> "" And $State_Combobox <> "Choose Application" Then _Combo_Playlist_LIBRARY()

	_Read_from_INI_ADD_2_Playlist_ListView_7()

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
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "ALL" Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"

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

			If Not FileExists($Icons & "steam.app." & $appid & ".jpg") Then
				_Download_Icon_for_SteamGameID()
			EndIf

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
	Global $sHTML = _INetGetSource('https://steamdb.info/app/' & $Check_AppId & '/graphs/')

	Local $iPosition_1 = StringInStr($sHTML, '<li><strong>')
	Local $iPosition_2 = StringInStr($sHTML, '</strong><em>all-time peak')
	Local $iPosition_3 = $iPosition_2 - $iPosition_1

	Local $sString = StringMid($sHTML, $iPosition_1, $iPosition_3)
	Global $aArray = StringSplit($sString, '<li><strong>', $STR_ENTIRESPLIT)

	If $aArray[0] > 1 Then
		Global $PlayersOnline_right_now = StringSplit($aArray[2], '<')
		$PlayersOnline_right_now = $PlayersOnline_right_now[1]
		Global $PlayersOnline_24h_peak = StringSplit($aArray[3], '<')
		$PlayersOnline_24h_peak = $PlayersOnline_24h_peak[1]
		Global $PlayersOnline_all_time_peak = StringSplit($aArray[4], '<')
		$PlayersOnline_all_time_peak = $PlayersOnline_all_time_peak[1]

		;MsgBox(0, "", $PlayersOnline_all_time_peak & @CRLF & @CRLF & $aArray[4])

		IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "right_now", $PlayersOnline_right_now)
		IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "24h_peak", $PlayersOnline_24h_peak)
		IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "all_time_peak", $PlayersOnline_all_time_peak)

		$PlayersOnline_right_now = ""
		$PlayersOnline_24h_peak = ""
		$PlayersOnline_all_time_peak = ""
	EndIf
EndFunc

Func _Get_SteamGame_Icon_32x32()
	Global $Steam_AppId = $appid

	Global $sHTML = _INetGetSource('https://steamdb.info/app/' & $appid & '/info/')

	Local $iPosition_1 = StringInStr($sHTML, 'clienttga</td>', $STR_CASESENSE, 1, 1000)
	Local $iPosition_2 = StringInStr($sHTML, '.jpg" rel="nofollow">', $STR_CASESENSE, 1, 1000)
	Local $iPosition_3 = $iPosition_2 - $iPosition_1
	Local $sString = StringMid($sHTML, $iPosition_1, $iPosition_3)

	Local $iPosition_1_2 = StringInStr($sString, '<td class="span3">icon</td>', $STR_CASESENSE, 1, 1)
	Local $iPosition_2_2 = StringLen($sString) + 1
	Local $iPosition_3_2 = $iPosition_2_2 - $iPosition_1_2
	Local $sString_2 = StringMid($sString, $iPosition_1_2, $iPosition_3_2)

	Global $HTML_IconLink = StringReplace($sString_2, '<td class="span3">icon</td>', '')
	$HTML_IconLink = StringReplace($HTML_IconLink, '<td><a href="', '')

	If $HTML_IconLink <> "" Then
		Local $URL = $HTML_IconLink & ".jpg"
		Local $Download = InetGet($URL, $Icons & "32x32\" & "steam.app." & $Steam_AppId & ".jpg", 16, 0)
		If $Download = 0 Then FileCopy($Icons & "32x32\" & "default.bmp", $Icons & "32x32\" & "steam.app." & $Steam_AppId & ".bmp", $FC_OVERWRITE)
		If $Download <> 0 Then _Convert_Icon_32x32()
		FileDelete($Icons & "32x32\" & "steam.app." & $Steam_AppId & ".jpg")
	EndIf

	$ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Steam_AppId & ".bmp"
	If Not FileExists($ImageList_Icon) Then
		FileCopy($gfx & "Icon_Preview_32x32.jpg", $ImageList_Icon)
	EndIf
EndFunc

Func _Get_SteamGame_Icon_256x256()
	Global $Steam_AppId = $appid

	Global $sHTML = _INetGetSource('https://steamdb.info/app/' & $Steam_AppId & '/info/')

	Local $iPosition_1 = StringInStr($sHTML, 'clienticon</td>')
	Local $iPosition_2 = StringInStr($sHTML, '.ico" rel="nofollow')
	Local $iPosition_3 = $iPosition_2 - $iPosition_1

	Local $sString = StringMid($sHTML, $iPosition_1, $iPosition_3)

	Global $HTML_IconLink = StringReplace($sString, 'clienticon</td>', '')
	$HTML_IconLink = StringReplace($HTML_IconLink, '<td><a href="', '')

	If $HTML_IconLink <> "" Then
		Local $URL = $HTML_IconLink & ".ico"
		InetGet($URL, $Icons & "256x256\" & "steam.app." & $Steam_AppId & ".ico", 16, 0)
	EndIf
EndFunc

Func _Convert_Icon_32x32()
	_GDIPlus_Startup()

	Local $sFile = $Icons & "32x32\" & "steam.app." & $Steam_AppId & ".jpg"
    If @error Or Not FileExists($sFile) Then Return

    Local $hImage = _GDIPlus_ImageLoadFromFile($sFile)

    Local $iWidth = 600
    Local $iHeight = _GDIPlus_ImageGetHeight($hImage) * 600 / _GDIPlus_ImageGetWidth($hImage)

    Local $tPalette = _GDIPlus_PaletteInitialize(16, $GDIP_PaletteTypeFixedHalftone27, 16, False, $hImage)
    _GDIPlus_BitmapConvertFormat($hImage, "", $GDIP_DitherTypeDualSpiral8x8, $GDIP_PaletteTypeFixedHalftone27, $tPalette)

	_GDIPlus_ImageSaveToFile($hImage, $Icons & "32x32\" & "steam.app." & $Steam_AppId & ".bmp")

    _GDIPlus_ImageDispose($hImage)
    _GDIPlus_Shutdown()
EndFunc

Func _Download_Icon_for_SteamGameID()
	Local $Application_appid = $appid
	Local $Download_Icon_path_jpg = $Icons & "steam.app." & $Application_appid & '.jpg'

	Local $URL = 'http://cdn.akamai.steamstatic.com/steam/apps/' & $Application_appid & '/header.jpg'
	InetGet($URL, $Download_Icon_path_jpg, 16, 0)
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
	_GUICtrlListView_AddColumn($listview, "App ID", 90)
	_GUICtrlListView_AddColumn($listview, "Name", 290)
	_GUICtrlListView_AddColumn($listview, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
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
	_GUICtrlListView_AddColumn($listview_2, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_2, "Name", 290)
	_GUICtrlListView_AddColumn($listview_2, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview_2, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_2)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview_2, $GUI_HIDE)
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
	_GUICtrlListView_AddColumn($listview_3, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_3, "Name", 290)
	_GUICtrlListView_AddColumn($listview_3, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview_3, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_3)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview_3, $GUI_HIDE)
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
	_GUICtrlListView_AddColumn($listview_4, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_4, "Name", 290)
	_GUICtrlListView_AddColumn($listview_4, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview_4, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_4)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview_4, $GUI_HIDE)
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
	_GUICtrlListView_AddColumn($listview_5, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_5, "Name", 290)
	_GUICtrlListView_AddColumn($listview_5, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview_5, "Online", 95, 2)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	$contextmenu = GUICtrlCreateContextMenu($listview_5)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
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
	_GUICtrlListView_AddColumn($listview_6, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_6, "Name", 290)
	_GUICtrlListView_AddColumn($listview_6, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview_6, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_6)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview_6, $GUI_HIDE)
EndFunc

Func _Read_from_INI_ADD_2_ListView()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')

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

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR; - 1

			$ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"

			If Not FileExists($ImageList_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon)
			EndIf

			$ListView_Icon = $ImageList_Icon
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
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')
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

	;MsgBox(0, $NR_Applications, $ApplicationList_TEMP & @CRLF & @CRLF & $listview_Temp)

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

			$ListView_Icon = $ImageList_Icon_new
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
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')
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

			$ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"

			If Not FileExists($ImageList_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon)
			EndIf

			$ListView_Icon = $ImageList_Icon
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

Func _RM_Menu_Item_4() ; Create new default.vrsettings" File
	If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK, $FC_OVERWRITE)

	$FileLines = _FileCountLines($default_vrsettings_File)

	$renderTargetMultiplier_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_1", "renderTargetMultiplier", "1.0")
	$supersampleScale_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_1", "supersampleScale", "1.0")
	$allowSupersampleFiltering_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_1", "allowSupersampleFiltering", "true")

	FileWriteLine($default_vrsettings_File_new, '{')
	FileWriteLine($default_vrsettings_File_new, '	"steamvr" : {')

	For $LOOP_vrsettings = 3 To $FileLines
		$ReadLine = FileReadLine($default_vrsettings_File, $LOOP_vrsettings)
		$ReadLine_Split_value = $ReadLine

		If $ReadLine <> '	},' Then
			$ReadLine_Split = StringSplit($ReadLine, ':')
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
EndFunc

Func _RM_Menu_Item_5() ; Create Shortcut File

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Steam_app_Name_Replaced = StringReplace($Steam_app_Name, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	Local $renderTargetMultiplier_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "renderTargetMultiplier", "1.0")
	Local $supersampleScale_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "supersampleScale", "1.0")
	Local $allowSupersampleFiltering_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "allowSupersampleFiltering", "true")
	$allowSupersampleFiltering_value = StringLeft($allowSupersampleFiltering_value, 1)

	Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Create SS Shortcut", "Selected Game:" & @CRLF & @CRLF & _
														$Steam_app_Name & " [" & $Game_ID & "]" & @CRLF & @CRLF & _
														"Do you want to create the Shortcut File?" & @CRLF)

	If $Abfrage = 6 Then
		_Create_SS_Shortcut()
		$IN = $Install_DIR & "temp.au3"
		$OUT = $Install_DIR & "SS_" & $renderTargetMultiplier_value & "_" & $supersampleScale_value & "_" & $allowSupersampleFiltering_value & "___" & $Steam_app_Name_Replaced & ".exe"
		RunWait(@ComSpec & " /c " & 'System\Aut2exe.exe' & ' /in ' & $IN & ' /out ' & $OUT, "", @SW_HIDE)
		FileDelete($IN)
		MsgBox($MB_ICONINFORMATION, "Creation completed", "New Shortcut File was created in Home Loader folder:" & @CRLF & @CRLF & _
																$OUT & @CRLF & @CRLF & _
																"Copy the new Shortcut wherever you want and rename the File if wanted.")
	Else

	EndIf
EndFunc

Func _RM_Menu_Item_8() ; RM_UP
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')

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

	$GameNR = $ListView_Selected_Row_Nr

	$GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	$GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	$GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	$GetItem_Playtime_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "Playtime", "")
	$GetItem_renderTargetMultiplier_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

	$GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "NR", "")
	$GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "name", "")
	$GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "appid", "")
	$GetItem_Playtime_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "Playtime", "")
	$GetItem_renderTargetMultiplier_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "allowSupersampleFiltering", "")

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
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')

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

	$GameNR = $ListView_Selected_Row_Nr

	$GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	$GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	$GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	$GetItem_Playtime_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "Playtime", "")
	$GetItem_renderTargetMultiplier_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

	$GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "NR", "")
	$GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "name", "")
	$GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "appid", "")
	$GetItem_Playtime_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "Playtime", "")
	$GetItem_renderTargetMultiplier_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "allowSupersampleFiltering", "")

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
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')

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

	$GameNR = $ListView_Selected_Row_Nr
	$GameNR_next = $ListView_Selected_Row_Nr + 1
	$GetItem_appid_delete = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")

	$ApplicationList_NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	$GetItem_NR_1 = ""
	$GetItem_appid_1 = ""
	$GetItem_name_1 = ""
	$GetItem_installdir_1 = ""
	$GetItem_IconPath_1 = ""
	$GetItem_right_now_1 = ""
	$GetItem_24h_peak_1 = ""
	$GetItem_all_time_peak_1 = ""
	$GetItem_renderTargetMultiplier_1 = ""
	$GetItem_supersampleScale_1 = ""
	$GetItem_allowSupersampleFiltering_1 = ""

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
		$GameName_before = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "name", "")
		$GameName_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "name", "")
		If $GameName_next <> "" Then
			$GetItem_NR_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "NR", "")
			$GetItem_appid_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "appid", "")
			$GetItem_name_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "name", "")
			$GetItem_installdir_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "installdir", "")
			$GetItem_IconPath_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "IconPath", "")
			$GetItem_right_now_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "right_now", "")
			$GetItem_24h_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "24h_peak", "")
			$GetItem_all_time_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "all_time_peak", "")
			$GetItem_24h_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "24h_peak", "")
			$GetItem_renderTargetMultiplier_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "renderTargetMultiplier", "")
			$GetItem_supersampleScale_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "supersampleScale", "")
			$GetItem_allowSupersampleFiltering_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "allowSupersampleFiltering", "")

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
	;_Restart()
EndFunc


Func _Create_SS_Shortcut()
	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $FileLines = _FileCountLines($default_vrsettings_File)

	Local $renderTargetMultiplier_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "renderTargetMultiplier", "1.0")
	Local $supersampleScale_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "supersampleScale", "1.0")
	Local $allowSupersampleFiltering_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "allowSupersampleFiltering", "true")


	FileWrite($Install_DIR & 'temp.au3', 'If Not FileExists("' & $default_vrsettings_File_BAK & '") Then FileCopy("' & $default_vrsettings_File & '", "' & $default_vrsettings_File_BAK & '",' & $FC_OVERWRITE & ')' & @CRLF)

	FileWrite($Install_DIR & 'temp.au3', 'FileWriteLine("' & $default_vrsettings_File_new & '"' & ", '{')" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', 'FileWriteLine("' & $default_vrsettings_File_new & '", ' & "'	" & '"steamvr" : {' & "')" & @CRLF)

	FileWrite($Install_DIR & 'temp.au3', "For $LOOP_vrsettings = 3 To " & $FileLines & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', '	$ReadLine = FileReadLine("' & $default_vrsettings_File & '", $LOOP_vrsettings)' & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', "	$ReadLine_Split_value = $ReadLine" & @CRLF)

	FileWrite($Install_DIR & 'temp.au3', "	If $ReadLine <> '	},' Then" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', "		$ReadLine_Split = StringSplit($ReadLine, ':')" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', "		$ReadLine_Split_value = StringReplace($ReadLine_Split[1], '" & '"' & "', ''" & ")" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', "		$ReadLine_Split_value = StringReplace($ReadLine_Split_value, '        ', '')" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', "		$ReadLine_Split_value = StringReplace($ReadLine_Split_value, ' ', '')" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', "	EndIf" & @CRLF)

	FileWrite($Install_DIR & 'temp.au3', "	If $ReadLine_Split_value = 'renderTargetMultiplier' Then" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', '		FileWriteLine("' & $default_vrsettings_File_new & '", ' & "'        " & '"renderTargetMultiplier" : ' & $renderTargetMultiplier_value & ",')" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', "	EndIf" & @CRLF)

	FileWrite($Install_DIR & 'temp.au3', "	If $ReadLine_Split_value = 'supersampleScale' Then" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', '		FileWriteLine("' & $default_vrsettings_File_new & '", ' & "'        " & '"supersampleScale" : ' & $supersampleScale_value & ",')" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', "	EndIf" & @CRLF)

	FileWrite($Install_DIR & 'temp.au3', "	If $ReadLine_Split_value = 'allowSupersampleFiltering' Then" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', '		FileWriteLine("' & $default_vrsettings_File_new & '", ' & "'        " & '"allowSupersampleFiltering" : ' & $allowSupersampleFiltering_value & ",')" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', "	EndIf" & @CRLF)

	FileWrite($Install_DIR & 'temp.au3', "	If $ReadLine_Split_value <> 'renderTargetMultiplier' And $ReadLine_Split_value <> 'supersampleScale' And $ReadLine_Split_value <> 'allowSupersampleFiltering' Then" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', '		FileWriteLine("' & $default_vrsettings_File_new & '", $ReadLine)' & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', "	EndIf" & @CRLF)
	FileWrite($Install_DIR & 'temp.au3', "Next" & @CRLF)

	FileWrite($Install_DIR & 'temp.au3', 'ShellExecute("steam://rungameid/' & $Game_ID & '")' & @CRLF)

EndFunc

Func _ClickOnListView($hWndGUI, $MsgID, $wParam, $lParam)
    Local $tagNMHDR, $event, $hwndFrom, $code
    $tagNMHDR = DllStructCreate("int;int;int", $lParam)
    If @error Then Return
    $event = DllStructGetData($tagNMHDR, 3)
    If $wParam = $ListView Then
        If $event = $NM_CLICK Then
			_Change_Preview_Icon_ListView()
			If WinExists("Steam VR Settings Menu") Then _Update_VRSettings_GUI_Items()
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
	_Create_HTMLView_GUI()
	Sleep(200)
EndFunc

Func _Change_Preview_Icon_ListView()
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	Local  $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppID = _GUICtrlListView_GetItemText($ListView, $ListView_Selected_Row_Nr - 1, 1)
	Local $CheckImagePath = $Icons & "steam.app." & $Check_AppID & ".jpg"

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

	If $CheckImagePath = "" or $CheckImagePath = $Icons & "" & ".jpg" or Not FileExists($CheckImagePath) Then $CheckImagePath = $gfx & "Icon_Preview.jpg"
	GUICtrlSetImage($Icon_Preview_Image, $CheckImagePath)
EndFunc

Func _Update_VRSettings_GUI_Items()
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
	If $allowSupersampleFiltering_value = "true" Then $aSsF_value = 0
	If $allowSupersampleFiltering_value = "false" Then $aSsF_value = 1

	GUICtrlSetData($ComboBox_3, "", "")
	GUICtrlSetData($VRSettings_Group, "VR Settings - " & $Steam_app_Name)
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
EndFunc

Func _Button_Exit_HTML_GUI()
	GUIDelete($HTML_GUI)
EndFunc

Func _Checkbox_all()
	$CheckBox = GUICtrlRead($Checkbox_CreatePage)
	If $CheckBox = "" Then
		GUICtrlSetData($Checkbox_CreatePage, "a")
	Else
		GUICtrlSetData($Checkbox_CreatePage, "")
	EndIf
	_Checkbox_CheckUncheck()
EndFunc

Func _Checkbox_CheckUncheck()
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
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

Func _Checkbox_USE_PHP_GamePage()
	Local $State_Checkbox = GUICtrlRead($Checkbox_USE_PHP_GamePage)
	$Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")

	If $State_Checkbox = "" Then
		If $Advanced_Settings = "true" Then
			GUICtrlSetData($Checkbox_USE_PHP_GamePage, "X")
			IniWrite($Config_INI, "Settings", "USE_PHP_WebServer", "true")

			If Not FileExists(@ScriptDir & "\php\") Then
				$DOWNLOAD_URL = "http://windows.php.net/downloads/releases/php-7.1.7-nts-Win32-VC14-x86.zip"

				Local $Abfrage = MsgBox($MB_YESNO, "Needed Files not found", "Needed Files for the 'PHP Function' not found." & @CRLF & @CRLF & _
														"Do you want to Download the needed Files from the following Page?" & @CRLF & _
														$DOWNLOAD_URL & @CRLF & @CRLF & _
														"Warning:" & @CRLF & _
														"This web server was designed to aid application development. It may also be" & @CRLF & _
														"useful for testing purposes or for application demonstrations that are run" & @CRLF & _
														"in controlled environments. It is not intended to be a full-featured web server." & @CRLF & _
														"It should not be used on a public network." & @CRLF)

				If $Abfrage = 6 Then
					_Loading_GUI()
					DirCreate(@ScriptDir & "\php\")
					InetGet($DOWNLOAD_URL, @ScriptDir & "\temp.zip", 16, 0)
					Sleep(1000)
					_Zip_UnzipAll(@ScriptDir & "\temp.zip", @ScriptDir & "\php\")
					FileDelete(@ScriptDir & "\temp.zip")
					Sleep(2000)
					GUIDelete($GUI_Loading)
				EndIf

			Else
				GUICtrlSetData($Checkbox_USE_PHP_GamePage, "X")
				IniWrite($Config_INI, "Settings", "USE_PHP_WebServer", "true")
			EndIf
		Else
			MsgBox($MB_ICONINFORMATION, "Advanced Settings", "Advanced Settings needs to be enabled [settings] to be able to use this function.")
		EndIf
	Else
		GUICtrlSetData($Checkbox_USE_PHP_GamePage, "")
		IniWrite($Config_INI, "Settings", "USE_PHP_WebServer", "false")
	EndIf
EndFunc

Func _Button_Create_GamePage_all()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
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
			FileCopy($gfx & "Icon_Preview.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		EndIf

		FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" />                       <span class="tooltiptext">' & $Application_name & '</span></a></div>')
	Next

	FileWriteLine($GamePage_path, '  </div>')
	FileWriteLine($GamePage_path, '</body>')
	FileWriteLine($GamePage_path, '</html>')
EndFunc

Func _Button_Create_GamePage_selected()
	_GUICtrlStatusBar_SetText($Statusbar, "Creating Game Page..." & @TAB & @TAB & "'Version " & $Version & "'")
	$USE_PHP_WebServer = IniRead($Config_INI, "Settings", "USE_PHP_WebServer", "")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "" Then $ButtonTAB_State = "1"
	$Combo = GUICtrlRead($Combo_SteamLibrary)
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

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($gfx & "Icon_Preview.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If $WinName = "VR Toolbox" And $USE_PHP_WebServer <> "true" Then
					FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'steam://rungameid/" & $Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf

				If $WinName <> "VR Toolbox" And $USE_PHP_WebServer <> "true" Then
					FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf

				If $USE_PHP_WebServer = "true" Then
					FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="http://localhost:8000/WebPage/' & $Application_appid & '.php"' & ' class="auto-style1">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')

					FileWrite($Install_DIR & "/WebPage/" & $Application_appid & ".php", '<head>' & @CRLF & _
								'<style type="text/css">' & @CRLF & _
								'{' & @CRLF & _
								"  font-family: 'Josefin Sans', sans-serif;" & @CRLF & _
								'  -webkit-box-sizing: border-box;' & @CRLF & _
								'  -moz-box-sizing: border-box;' & @CRLF & _
								'  box-sizing: border-box;' & @CRLF & _
								'}' & @CRLF & _
								'.auto-style1 {' & @CRLF & _
								'	font-family: "WRC Clean Bold";' & @CRLF & _
								'	font-size: medium;' & @CRLF & _
								'}' & @CRLF & _
								'.auto-style2 {' & @CRLF & _
								'	color: #0000FF;' & @CRLF & _
								'}' & @CRLF & _
								'</style>' & @CRLF & _
								'</head>' & @CRLF & _
								'<?php' & @CRLF & _
								"	if (file_exists('temp.txt'))" & @CRLF & _
								"	{" & @CRLF & _
								"		$dat = " & $Application_appid & ";" & @CRLF & _
								"		$fil = fopen('temp.txt', w);" & @CRLF & _
								"		fwrite($fil, $dat);" & @CRLF & _
								"	}" & @CRLF & _
								"	else" & @CRLF & _
								"	{" & @CRLF & _
								"		$dat = " & $Application_appid & ";" & @CRLF & _
								"		$fil = fopen('temp.txt', w);" & @CRLF & _
								"		fwrite($fil, $dat);" & @CRLF & _
								"		fclose($fil);" & @CRLF & _
								"	}" & @CRLF & _
								"?>" & @CRLF & _
								'<img src="' & $WebPage_IconPath & '" width="300">' & @CRLF & _
								'<p class="auto-style1">Loading... ' & '<span class="auto-style2"> ' & $Application_name & '</span></p>')
				EndIf
			Else

			EndIf
			;GUICtrlSetData($Anzeige_Fortschrittbalken, $NR * 100 / $NR_Applications)
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
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$Status_Combo_Add_to_Custom = GUICtrlRead($Combo_Add_to_Custom)
	$Combo = GUICtrlRead($Combo_SteamLibrary)
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
		$ButtonTAB_State_1 = GUICtrlRead($ButtonTAB_Custom_1)
		$ButtonTAB_State_2 = GUICtrlRead($ButtonTAB_Custom_2)
		$ButtonTAB_State_3 = GUICtrlRead($ButtonTAB_Custom_3)
		$ButtonTAB_State_4 = GUICtrlRead($ButtonTAB_Custom_4)

		$ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"

		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_1 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_2 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_3 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_4 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"


		Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
		$LastAppNR = IniRead($ApplicationList_target, "ApplicationList", "NR_Applications", "")
		$NewAppNR = $LastAppNR + 1

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

Func _Button_Start_SteamVR()
	$Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")

	If $Advanced_Settings = "true" Then
		If FileExists($System_DIR & "StartSteamVRHome.exe") Then
			ShellExecute($System_DIR & "StartSteamVRHome.exe")
		Else
			ShellExecute($System_DIR & "StartSteamVRHome.au3")
		EndIf
	Else
		ShellExecute("steam://rungameid/250820")
	EndIf
EndFunc

Func _Combo_SteamLibrary()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
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
	$Combo = GUICtrlRead($Combo_SteamLibrary)

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
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(500)
		GUICtrlSetData($Anzeige_Fortschrittbalken_2, 0)
	EndIf

	If $Combo <> "ALL" Then
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(500)
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	EndIf
	_Read_from_INI_ADD_2_ListView()
	_GUICtrlStatusBar_SetText($Statusbar, "Rescan of Steam Library finished." & @TAB & "Apps: " & $NR_Applications & @TAB & "'Version " & $Version & "'")
EndFunc


#endregion

#Region Func Add to Library GUI
Func _DROPDOWN_Library()
	$DROPDOWN = GUICtrlRead($DROPDOWN_Library)
	If $DROPDOWN <> "" Then
		$Value_DROPDOWN_Library = $DROPDOWN
		IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", $Value_DROPDOWN_Library)
	EndIf
EndFunc

Func _BUTTON_GamePath_Folder()
	$FileSelect = FileOpenDialog("Choose File.", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
	If $FileSelect <> "" Then
		$Value_GamePath_Folder = $FileSelect
		GUICtrlSetData($Input_GamePath_Folder, $FileSelect)
		IniWrite($config_ini, "TEMP", "Value_GamePath_Folder", $FileSelect)
		$HL_ID = "HL" & StringReplace(StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2), '.', '')
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
		$Value_FileName = StringInStr($Value_GamePath_Folder, "\", "", -1)
		$Value_FileName = StringTrimLeft($Value_GamePath_Folder, $Value_FileName)
		$Value_NamefromFile = StringInStr($Value_FileName, ".", "", -1)
		$StringCut_NR = StringLen($Value_FileName) - $Value_NamefromFile + 1
		$Value_NamefromFile = StringTrimRight($Value_FileName, $StringCut_NR)
		IniWrite($config_ini, "TEMP", "Value_Input_Name", $Value_NamefromFile)
		GUICtrlSetData($Input_Name, $Value_NamefromFile)
	EndIf
EndFunc

Func _BUTTON_Use_SteamID()
	$InputBox = InputBox("Enter Steam Game ID", " ", "", "", - 1, 1)
	If $InputBox <> "" Then
		$Value_Use_SteamID = $InputBox
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
		$Value_FileName = "SteamGameID " & $Value_Use_SteamID
		IniWrite($config_ini, "TEMP", "Value_Input_Name", $Value_FileName)
		GUICtrlSetData($Input_Name, $Value_FileName)
	EndIf
EndFunc

Func _Input_Name()
	$Input_Input_Name = GUICtrlRead($Input_Name)
	If $Input_Input_Name <> "" Then
		$Value_Input_Name = $Input_Input_Name
		IniWrite($config_ini, "TEMP", "Value_Input_Name", $Input_Input_Name)
	EndIf
EndFunc

Func _BUTTON_IconPath_Folder()
	$FileSelect = FileOpenDialog("Choose Icon File.", $Icons, "All (*.*)", $FD_FILEMUSTEXIST)
	If $FileSelect <> "" Then
		$Value_IconPath_Folder = $FileSelect
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
	$Value_DROPDOWN_Library = IniRead($config_ini, "TEMP", "Value_DROPDOWN_Library", "")
	$Value_GamePath_Folder = IniRead($config_ini, "TEMP", "Value_GamePath_Folder", "")
	$Value_Use_SteamID = IniRead($config_ini, "TEMP", "Value_Use_SteamID", "")
	$Value_Input_Name = IniRead($config_ini, "TEMP", "Value_Input_Name", "")
	$Value_IconPath_Folder = IniRead($config_ini, "TEMP", "Value_IconPath_Folder", "")

	$LastAppNR = IniRead($ApplicationList_Non_Steam_Appl_INI, "ApplicationList", "NR_Applications", "")
	$NewAppNR = $LastAppNR + 1

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
		If FileExists($System_DIR & "Settings.exe") Then
			ShellExecute($System_DIR & "Settings.exe", $System_DIR)
		Else
			ShellExecute($System_DIR & "Settings.au3", $System_DIR)
		EndIf
		IniWrite($Config_INI, "Settings", "First_Start", "Settings")
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
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
		IniWrite($Config_INI, "Folders", "Icon_Folder_3", "")
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


#endregion

#Region Func SS_Settings GUI

Func _Slider_1()
	$Value_Slider_1 = GUICtrlRead($Slider_1)
	Local $rTM_1 = StringLeft($Value_Slider_1, 1)
	Local $rTM_2 = StringRight($Value_Slider_1, 1)
	Local $rTM_value = $rTM_1 & $rTM_2
	Local $rTM_Input_value = $rTM_1 & "." & $rTM_2
	If StringLen($Value_Slider_1) = 1 Then $rTM_value = $rTM_2
	If StringLen($Value_Slider_1) = 1 Then $rTM_Input_value = "0." & $rTM_2
	GUICtrlSetData($Input_renderTargetMultiplier, $rTM_Input_value)
EndFunc

Func _Slider_2()
	$Value_Slider_2 = GUICtrlRead($Slider_2)
	Local $ssS_1 = StringLeft($Value_Slider_2, 1)
	Local $ssS_2 = StringRight($Value_Slider_2, 1)
	Local $ssS_value = $ssS_1 & $ssS_2
	Local $ssS_Input_value = $ssS_1 & "." & $ssS_2
	If StringLen($Value_Slider_2) = 1 Then $ssS_value = $ssS_2
	If StringLen($Value_Slider_2) = 1 Then $ssS_Input_value = "0." & $ssS_2
	GUICtrlSetData($Input_supersampleScale, $ssS_Input_value)
EndFunc

Func _Slider_3()
	$Value_Slider_3 = GUICtrlRead($Slider_3)
	If $Value_Slider_3 = 0 Then $Value_Slider_3 = "true"
	If $Value_Slider_3 = 1 Then $Value_Slider_3 = "false"
	GUICtrlSetData($ComboBox_3, "", "")
	GUICtrlSetData($ComboBox_3, "true|false", $Value_Slider_3)
EndFunc

Func _UpDown_renderTargetMultiplier()
	$Value_UpDown = GUICtrlRead($Input_renderTargetMultiplier)
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
	$Value_UpDown = GUICtrlRead($Input_supersampleScale)
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
	$Value_ComboBox = GUICtrlRead($ComboBox_3)
	If $Value_ComboBox = "true" Then $Value_Slider_3 = 0
	If $Value_ComboBox = "false" Then $Value_Slider_3 = 1
	GUICtrlSetData($Slider_3, $Value_Slider_3)
EndFunc


Func _Button_Save_Settings_GUI()
	$Input_renderTargetMultiplier = GUICtrlRead($Input_renderTargetMultiplier)
	$Input_supersampleScale = GUICtrlRead($Input_supersampleScale)
	$Input_allowSupersampleFiltering = GUICtrlRead($ComboBox_3)

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $App_NR = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "NR", "")

	IniWrite($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $App_NR, "renderTargetMultiplier", $Input_renderTargetMultiplier)
	IniWrite($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $App_NR, "supersampleScale", $Input_supersampleScale)
	IniWrite($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $App_NR, "allowSupersampleFiltering", $Input_allowSupersampleFiltering)

	IniWrite($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "renderTargetMultiplier", $Input_renderTargetMultiplier)
	IniWrite($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "supersampleScale", $Input_supersampleScale)
	IniWrite($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "allowSupersampleFiltering", $Input_allowSupersampleFiltering)
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

	$FileLines = _FileCountLines($default_vrsettings_File)

	$renderTargetMultiplier_value = GUICtrlRead($Input_renderTargetMultiplier)
	$supersampleScale_value = GUICtrlRead($Input_supersampleScale)
	$allowSupersampleFiltering_value = GUICtrlRead($ComboBox_3)

	FileWriteLine($default_vrsettings_File_new, '{')
	FileWriteLine($default_vrsettings_File_new, '	"steamvr" : {')

	For $LOOP_vrsettings = 3 To $FileLines
		$ReadLine = FileReadLine($default_vrsettings_File, $LOOP_vrsettings)
		$ReadLine_Split_value = $ReadLine

		If $ReadLine <> '	},' Then
			$ReadLine_Split = StringSplit($ReadLine, ':')
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
	IniWrite($Config_INI, "TEMP", "Show_SS_Menu", "")
	GUIDelete($SS_Settings_GUI)
EndFunc
#endregion

#Region Func Playlist GUI
Func _Create_ListView_7()
	Global $listview_7 = GUICtrlCreateListView("", 200, 70, 390, 248, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_7, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx))
	GUICtrlSetFont($listview_7, 12, 500, 1, "arial")

	; Add columns
	_GUICtrlListView_AddColumn($listview_7, "Nr.", 32)
	_GUICtrlListView_AddColumn($listview_7, "Name", 145)
	_GUICtrlListView_AddColumn($listview_7, "Playtime", 73)
	_GUICtrlListView_AddColumn($listview_7, "rTM", 45)
	_GUICtrlListView_AddColumn($listview_7, "ssS", 45, 2)
	_GUICtrlListView_AddColumn($listview_7, "aSF", 45, 2)

	Global $contextmenu_Playlist = GUICtrlCreateContextMenu($listview_7)
	Global $RM_Playlist_1_Item0 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item1 = GUICtrlCreateMenuItem("Move Up", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item2 = GUICtrlCreateMenuItem("Move Down", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item3 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item4 = GUICtrlCreateMenuItem("Delete", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item5 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	GUICtrlSetOnEvent($RM_Playlist_1_Item1, "_RM_UP")
	GUICtrlSetOnEvent($RM_Playlist_1_Item2, "_RM_DOWN")
	GUICtrlSetOnEvent($RM_Playlist_1_Item4, "_RM_DELETE_Item")
EndFunc

Func _Create_ListView_8()
	Global $listview_8 = GUICtrlCreateListView("", 200, 70, 390, 247, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_8, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx))
	GUICtrlSetFont($listview_8, 12, 500, 1, "arial")

	; Add columns
	_GUICtrlListView_AddColumn($listview_8, "Nr.", 32)
	_GUICtrlListView_AddColumn($listview_8, "Name", 145)
	_GUICtrlListView_AddColumn($listview_8, "Playtime", 73)
	_GUICtrlListView_AddColumn($listview_8, "rTM", 45)
	_GUICtrlListView_AddColumn($listview_8, "ssS", 45, 2)
	_GUICtrlListView_AddColumn($listview_8, "aSF", 45, 2)

	Global $contextmenu_Playlist = GUICtrlCreateContextMenu($listview_8)
	Global $RM_Playlist_1_Item0 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item1 = GUICtrlCreateMenuItem("Move Up", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item2 = GUICtrlCreateMenuItem("Move Down", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item3 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item4 = GUICtrlCreateMenuItem("Delete", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item5 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	GUICtrlSetOnEvent($RM_Playlist_1_Item1, "_RM_UP")
	GUICtrlSetOnEvent($RM_Playlist_1_Item2, "_RM_DOWN")
	GUICtrlSetOnEvent($RM_Playlist_1_Item4, "_RM_DELETE_Item")
EndFunc

Func _Create_ListView_9()
	Global $listview_9 = GUICtrlCreateListView("", 200, 70, 390, 247, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_9, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx))
	GUICtrlSetFont($listview_9, 12, 500, 1, "arial")

	; Add columns
	_GUICtrlListView_AddColumn($listview_9, "Nr.", 32)
	_GUICtrlListView_AddColumn($listview_9, "Name", 145)
	_GUICtrlListView_AddColumn($listview_9, "Playtime", 73)
	_GUICtrlListView_AddColumn($listview_9, "rTM", 45)
	_GUICtrlListView_AddColumn($listview_9, "ssS", 45, 2)
	_GUICtrlListView_AddColumn($listview_9, "aSF", 45, 2)

	Global $contextmenu_Playlist = GUICtrlCreateContextMenu($listview_9)
	Global $RM_Playlist_1_Item0 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item1 = GUICtrlCreateMenuItem("Move Up", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item2 = GUICtrlCreateMenuItem("Move Down", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item3 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item4 = GUICtrlCreateMenuItem("Delete", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item5 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	GUICtrlSetOnEvent($RM_Playlist_1_Item1, "_RM_UP")
	GUICtrlSetOnEvent($RM_Playlist_1_Item2, "_RM_DOWN")
	GUICtrlSetOnEvent($RM_Playlist_1_Item4, "_RM_DELETE_Item")
EndFunc

Func _Create_ListView_10()
	Global $listview_10 = GUICtrlCreateListView("", 200, 70, 390, 247, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_10, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx))
	GUICtrlSetFont($listview_10, 12, 500, 1, "arial")

	; Add columns
	_GUICtrlListView_AddColumn($listview_10, "Nr.", 32)
	_GUICtrlListView_AddColumn($listview_10, "Name", 145)
	_GUICtrlListView_AddColumn($listview_10, "Playtime", 73)
	_GUICtrlListView_AddColumn($listview_10, "rTM", 45)
	_GUICtrlListView_AddColumn($listview_10, "ssS", 45, 2)
	_GUICtrlListView_AddColumn($listview_10, "aSF", 45, 2)

	Global $contextmenu_Playlist = GUICtrlCreateContextMenu($listview_10)
	Global $RM_Playlist_1_Item0 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item1 = GUICtrlCreateMenuItem("Move Up", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item2 = GUICtrlCreateMenuItem("Move Down", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item3 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item4 = GUICtrlCreateMenuItem("Delete", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item5 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	GUICtrlSetOnEvent($RM_Playlist_1_Item1, "_RM_UP")
	GUICtrlSetOnEvent($RM_Playlist_1_Item2, "_RM_DOWN")
	GUICtrlSetOnEvent($RM_Playlist_1_Item4, "_RM_DELETE_Item")
EndFunc

Func _Create_ListView_11()
	Global $listview_11 = GUICtrlCreateListView("", 200, 70, 390, 247, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_11, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx))
	GUICtrlSetFont($listview_11, 12, 500, 1, "arial")

	; Add columns
	_GUICtrlListView_AddColumn($listview_11, "Nr.", 32)
	_GUICtrlListView_AddColumn($listview_11, "Name", 145)
	_GUICtrlListView_AddColumn($listview_11, "Playtime", 73)
	_GUICtrlListView_AddColumn($listview_11, "rTM", 45)
	_GUICtrlListView_AddColumn($listview_11, "ssS", 45, 2)
	_GUICtrlListView_AddColumn($listview_11, "aSF", 45, 2)

	Global $contextmenu_Playlist = GUICtrlCreateContextMenu($listview_11)
	Global $RM_Playlist_1_Item0 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item1 = GUICtrlCreateMenuItem("Move Up", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item2 = GUICtrlCreateMenuItem("Move Down", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item3 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item4 = GUICtrlCreateMenuItem("Delete", $contextmenu_Playlist)
	Global $RM_Playlist_1_Item5 = GUICtrlCreateMenuItem("", $contextmenu_Playlist)
	GUICtrlSetOnEvent($RM_Playlist_1_Item1, "_RM_UP")
	GUICtrlSetOnEvent($RM_Playlist_1_Item2, "_RM_DOWN")
	GUICtrlSetOnEvent($RM_Playlist_1_Item4, "_RM_DELETE_Item")
EndFunc

Func _Read_from_INI_ADD_2_Playlist_ListView_7()

	$Playlist_TEMP = $Install_DIR & "System\Playlist\Playlist_1.ini"

	Local $NR_Applications = IniRead($Playlist_TEMP, "Playlist", "NR_Applications", "")
	Local $Read_Add_break = IniRead($Playlist_TEMP, "Playlist", "Add_break", "")
	Local $Read_Break_duration = IniRead($Playlist_TEMP, "Playlist", "Break_duration", "")

	_GUICtrlListView_BeginUpdate($listview_7)
	_GUICtrlListView_DeleteAllItems($listview_7)

	For $NR_2 = 0 To $NR_Applications - 1
		Local $Application_NR = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "NR", "")
		Local $Application_name = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "name", "")
		Local $Application_appid = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "appid", "")
		Local $Application_Playtime = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "Playtime", "")
		Local $Application_renderTargetMultiplier = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "renderTargetMultiplier", "")
		Local $Application_supersampleScale = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "supersampleScale", "")
		Local $Application_allowSupersampleFiltering = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "allowSupersampleFiltering", "")

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR_2; - 1
			_GUICtrlListView_AddItem($listview_7, "")
			_GUICtrlListView_AddSubItem($listview_7, $ListView_RowNR, $Application_NR, 0)
			_GUICtrlListView_AddSubItem($listview_7, $ListView_RowNR, $Application_name, 1)
			_GUICtrlListView_AddSubItem($listview_7, $ListView_RowNR, $Application_Playtime & " Min.", 2)
			_GUICtrlListView_AddSubItem($listview_7, $ListView_RowNR, $Application_renderTargetMultiplier, 3)
			_GUICtrlListView_AddSubItem($listview_7, $ListView_RowNR, $Application_supersampleScale, 4)
			_GUICtrlListView_AddSubItem($listview_7, $ListView_RowNR, $Application_allowSupersampleFiltering, 5)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_7)
	If $Read_Add_break = "true" Then GUICtrlSetData($Checkbox_Add_break, "X")
	If $Read_Add_break <> "true" Then GUICtrlSetData($Checkbox_Add_break, "")
	If $Read_Break_duration <> "" Then GUICtrlSetData($Combo_Add_break, $Read_Break_duration & " Min.")
	If $Read_Break_duration = "" Then GUICtrlSetData($Combo_Add_break, "00 Min.")
EndFunc

Func _Read_from_INI_ADD_2_Playlist_ListView_8()
	$Playlist_TEMP = $Install_DIR & "System\Playlist\Playlist_2.ini"

	Local $NR_Applications = IniRead($Playlist_TEMP, "Playlist", "NR_Applications", "")
	Local $Read_Add_break = IniRead($Playlist_TEMP, "Playlist", "Add_break", "")
	Local $Read_Break_duration = IniRead($Playlist_TEMP, "Playlist", "Break_duration", "")

	_GUICtrlListView_BeginUpdate($listview_8)
	_GUICtrlListView_DeleteAllItems($listview_8)

	For $NR_2 = 0 To $NR_Applications - 1
		Local $Application_NR = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "NR", "")
		Local $Application_name = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "name", "")
		Local $Application_appid = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "appid", "")
		Local $Application_Playtime = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "Playtime", "")
		Local $Application_renderTargetMultiplier = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "renderTargetMultiplier", "")
		Local $Application_supersampleScale = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "supersampleScale", "")
		Local $Application_allowSupersampleFiltering = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "allowSupersampleFiltering", "")

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR_2; - 1
			_GUICtrlListView_AddItem($listview_8, "")
			_GUICtrlListView_AddSubItem($listview_8, $ListView_RowNR, $Application_NR, 0)
			_GUICtrlListView_AddSubItem($listview_8, $ListView_RowNR, $Application_name, 1)
			_GUICtrlListView_AddSubItem($listview_8, $ListView_RowNR, $Application_Playtime, 2)
			_GUICtrlListView_AddSubItem($listview_8, $ListView_RowNR, $Application_renderTargetMultiplier, 3)
			_GUICtrlListView_AddSubItem($listview_8, $ListView_RowNR, $Application_supersampleScale, 4)
			_GUICtrlListView_AddSubItem($listview_8, $ListView_RowNR, $Application_allowSupersampleFiltering, 5)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_8)
	If $Read_Add_break = "true" Then GUICtrlSetData($Checkbox_Add_break, "X")
	If $Read_Add_break <> "true" Then GUICtrlSetData($Checkbox_Add_break, "")
	If $Read_Break_duration <> "" Then GUICtrlSetData($Combo_Add_break, $Read_Break_duration & " Min.")
	If $Read_Break_duration = "" Then GUICtrlSetData($Combo_Add_break, "00 Min.")
EndFunc

Func _Read_from_INI_ADD_2_Playlist_ListView_9()
	$Playlist_TEMP = $Install_DIR & "System\Playlist\Playlist_3.ini"

	Local $NR_Applications = IniRead($Playlist_TEMP, "Playlist", "NR_Applications", "")
	Local $Read_Add_break = IniRead($Playlist_TEMP, "Playlist", "Add_break", "")
	Local $Read_Break_duration = IniRead($Playlist_TEMP, "Playlist", "Break_duration", "")

	_GUICtrlListView_BeginUpdate($listview_9)
	_GUICtrlListView_DeleteAllItems($listview_9)

	For $NR_2 = 0 To $NR_Applications - 1
		Local $Application_NR = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "NR", "")
		Local $Application_name = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "name", "")
		Local $Application_appid = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "appid", "")
		Local $Application_Playtime = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "Playtime", "")
		Local $Application_renderTargetMultiplier = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "renderTargetMultiplier", "")
		Local $Application_supersampleScale = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "supersampleScale", "")
		Local $Application_allowSupersampleFiltering = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "allowSupersampleFiltering", "")

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR_2; - 1
			_GUICtrlListView_AddItem($listview_9, "")
			_GUICtrlListView_AddSubItem($listview_9, $ListView_RowNR, $Application_NR, 0)
			_GUICtrlListView_AddSubItem($listview_9, $ListView_RowNR, $Application_name, 1)
			_GUICtrlListView_AddSubItem($listview_9, $ListView_RowNR, $Application_Playtime, 2)
			_GUICtrlListView_AddSubItem($listview_9, $ListView_RowNR, $Application_renderTargetMultiplier, 3)
			_GUICtrlListView_AddSubItem($listview_9, $ListView_RowNR, $Application_supersampleScale, 4)
			_GUICtrlListView_AddSubItem($listview_9, $ListView_RowNR, $Application_allowSupersampleFiltering, 5)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_9)
	If $Read_Add_break = "true" Then GUICtrlSetData($Checkbox_Add_break, "X")
	If $Read_Add_break <> "true" Then GUICtrlSetData($Checkbox_Add_break, "")
	If $Read_Break_duration <> "" Then GUICtrlSetData($Combo_Add_break, $Read_Break_duration & " Min.")
	If $Read_Break_duration = "" Then GUICtrlSetData($Combo_Add_break, "00 Min.")
EndFunc

Func _Read_from_INI_ADD_2_Playlist_ListView_10()
	$Playlist_TEMP = $Install_DIR & "System\Playlist\Playlist_4.ini"

	Local $NR_Applications = IniRead($Playlist_TEMP, "Playlist", "NR_Applications", "")
	Local $Read_Add_break = IniRead($Playlist_TEMP, "Playlist", "Add_break", "")
	Local $Read_Break_duration = IniRead($Playlist_TEMP, "Playlist", "Break_duration", "")

	_GUICtrlListView_BeginUpdate($listview_10)
	_GUICtrlListView_DeleteAllItems($listview_10)

	For $NR_2 = 0 To $NR_Applications - 1
		Local $Application_NR = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "NR", "")
		Local $Application_name = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "name", "")
		Local $Application_appid = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "appid", "")
		Local $Application_Playtime = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "Playtime", "")
		Local $Application_renderTargetMultiplier = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "renderTargetMultiplier", "")
		Local $Application_supersampleScale = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "supersampleScale", "")
		Local $Application_allowSupersampleFiltering = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "allowSupersampleFiltering", "")

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR_2; - 1
			_GUICtrlListView_AddItem($listview_10, "")
			_GUICtrlListView_AddSubItem($listview_10, $ListView_RowNR, $Application_NR, 0)
			_GUICtrlListView_AddSubItem($listview_10, $ListView_RowNR, $Application_name, 1)
			_GUICtrlListView_AddSubItem($listview_10, $ListView_RowNR, $Application_Playtime, 2)
			_GUICtrlListView_AddSubItem($listview_10, $ListView_RowNR, $Application_renderTargetMultiplier, 3)
			_GUICtrlListView_AddSubItem($listview_10, $ListView_RowNR, $Application_supersampleScale, 4)
			_GUICtrlListView_AddSubItem($listview_10, $ListView_RowNR, $Application_allowSupersampleFiltering, 5)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_10)
	If $Read_Add_break = "true" Then GUICtrlSetData($Checkbox_Add_break, "X")
	If $Read_Add_break <> "true" Then GUICtrlSetData($Checkbox_Add_break, "")
	If $Read_Break_duration <> "" Then GUICtrlSetData($Combo_Add_break, $Read_Break_duration & " Min.")
	If $Read_Break_duration = "" Then GUICtrlSetData($Combo_Add_break, "00 Min.")
EndFunc

Func _Read_from_INI_ADD_2_Playlist_ListView_11()
	$Playlist_TEMP = $Install_DIR & "System\Playlist\Playlist_5.ini"

	Local $NR_Applications = IniRead($Playlist_TEMP, "Playlist", "NR_Applications", "")
	Local $Read_Add_break = IniRead($Playlist_TEMP, "Playlist", "Add_break", "")
	Local $Read_Break_duration = IniRead($Playlist_TEMP, "Playlist", "Break_duration", "")

	_GUICtrlListView_BeginUpdate($listview_11)
	_GUICtrlListView_DeleteAllItems($listview_11)

	For $NR_2 = 0 To $NR_Applications - 1
		Local $Application_NR = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "NR", "")
		Local $Application_name = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "name", "")
		Local $Application_appid = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "appid", "")
		Local $Application_Playtime = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "Playtime", "")
		Local $Application_renderTargetMultiplier = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "renderTargetMultiplier", "")
		Local $Application_supersampleScale = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "supersampleScale", "")
		Local $Application_allowSupersampleFiltering = IniRead($Playlist_TEMP, "Application_" & $NR_2 + 1, "allowSupersampleFiltering", "")

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR_2; - 1
			_GUICtrlListView_AddItem($listview_11, "")
			_GUICtrlListView_AddSubItem($listview_11, $ListView_RowNR, $Application_NR, 0)
			_GUICtrlListView_AddSubItem($listview_11, $ListView_RowNR, $Application_name, 1)
			_GUICtrlListView_AddSubItem($listview_11, $ListView_RowNR, $Application_Playtime, 2)
			_GUICtrlListView_AddSubItem($listview_11, $ListView_RowNR, $Application_renderTargetMultiplier, 3)
			_GUICtrlListView_AddSubItem($listview_11, $ListView_RowNR, $Application_supersampleScale, 4)
			_GUICtrlListView_AddSubItem($listview_11, $ListView_RowNR, $Application_allowSupersampleFiltering, 5)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_11)
	If $Read_Add_break = "true" Then GUICtrlSetData($Checkbox_Add_break, "X")
	If $Read_Add_break <> "true" Then GUICtrlSetData($Checkbox_Add_break, "")
	If $Read_Break_duration <> "" Then GUICtrlSetData($Combo_Add_break, $Read_Break_duration & " Minutes")
	If $Read_Break_duration = "" Then GUICtrlSetData($Combo_Add_break, "00 Min.")
EndFunc

Func _Tab()
	Global $TAB_Name = GUICtrlRead($TAB_NR)

	If $TAB_Name = 0 Then
		_Read_from_INI_ADD_2_Playlist_ListView_7()
		_GUICtrlListView_SetColumnWidth($listview_7, 0, 32)
		_GUICtrlListView_SetColumnWidth($listview_7, 1, 145)
		_GUICtrlListView_SetColumnWidth($listview_7, 2, 73)
		_GUICtrlListView_SetColumnWidth($listview_7, 3, 45)
		_GUICtrlListView_SetColumnWidth($listview_7, 4, 45)
		_GUICtrlListView_SetColumnWidth($listview_7, 5, 45)
	EndIf

	If $TAB_Name = 1 Then
		_Read_from_INI_ADD_2_Playlist_ListView_8()
		_GUICtrlListView_SetColumnWidth($listview_8, 0, 32)
		_GUICtrlListView_SetColumnWidth($listview_8, 1, 145)
		_GUICtrlListView_SetColumnWidth($listview_8, 2, 73)
		_GUICtrlListView_SetColumnWidth($listview_8, 3, 45)
		_GUICtrlListView_SetColumnWidth($listview_8, 4, 45)
		_GUICtrlListView_SetColumnWidth($listview_8, 5, 45)
	EndIf

	If $TAB_Name = 2 Then
		_Read_from_INI_ADD_2_Playlist_ListView_9()
		_GUICtrlListView_SetColumnWidth($listview_9, 0, 32)
		_GUICtrlListView_SetColumnWidth($listview_9, 1, 145)
		_GUICtrlListView_SetColumnWidth($listview_9, 2, 73)
		_GUICtrlListView_SetColumnWidth($listview_9, 3, 45)
		_GUICtrlListView_SetColumnWidth($listview_9, 4, 45)
		_GUICtrlListView_SetColumnWidth($listview_9, 5, 45)
	EndIf

	If $TAB_Name = 3 Then
		_Read_from_INI_ADD_2_Playlist_ListView_10()
		_GUICtrlListView_SetColumnWidth($listview_10, 0, 32)
		_GUICtrlListView_SetColumnWidth($listview_10, 1, 145)
		_GUICtrlListView_SetColumnWidth($listview_10, 2, 73)
		_GUICtrlListView_SetColumnWidth($listview_10, 3, 45)
		_GUICtrlListView_SetColumnWidth($listview_10, 4, 45)
		_GUICtrlListView_SetColumnWidth($listview_10, 5, 45)
	EndIf

	If $TAB_Name = 4 Then
		_Read_from_INI_ADD_2_Playlist_ListView_11()
		_GUICtrlListView_SetColumnWidth($listview_10, 0, 32)
		_GUICtrlListView_SetColumnWidth($listview_10, 1, 145)
		_GUICtrlListView_SetColumnWidth($listview_10, 2, 73)
		_GUICtrlListView_SetColumnWidth($listview_10, 3, 45)
		_GUICtrlListView_SetColumnWidth($listview_10, 4, 45)
		_GUICtrlListView_SetColumnWidth($listview_10, 5, 45)
	EndIf

EndFunc

Func _RM_UP()
	Global $TAB_Name = GUICtrlRead($TAB_NR)

	If $TAB_Name = 0 Then $Playlist_TEMP = $Playlist_1_INI
	If $TAB_Name = 1 Then $Playlist_TEMP = $Playlist_2_INI
	If $TAB_Name = 2 Then $Playlist_TEMP = $Playlist_3_INI
	If $TAB_Name = 3 Then $Playlist_TEMP = $Playlist_4_INI
	If $TAB_Name = 4 Then $Playlist_TEMP = $Playlist_5_INI
	If $TAB_Name = 0 Then $ListView_TEMP = $listview_7
	If $TAB_Name = 1 Then $ListView_TEMP = $listview_8
	If $TAB_Name = 2 Then $ListView_TEMP = $listview_9
	If $TAB_Name = 3 Then $ListView_TEMP = $listview_10
	If $TAB_Name = 4 Then $ListView_TEMP = $listview_11

	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$GameNR = _GUICtrlListView_GetItemText($ListView_TEMP, $ListView_Selected_Row_Nr - 1, 0)
	$GameName = _GUICtrlListView_GetItemText($ListView_TEMP, $ListView_Selected_Row_Nr - 1, 1)

	$GetItem_NR_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "NR", "")
	$GetItem_name_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "name", "")
	$GetItem_appid_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "appid", "")
	$GetItem_Playtime_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "Playtime", "")
	$GetItem_renderTargetMultiplier_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

	$GetItem_NR_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR - 1, "NR", "")
	$GetItem_name_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR - 1, "name", "")
	$GetItem_appid_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR - 1, "appid", "")
	$GetItem_Playtime_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR - 1, "Playtime", "")
	$GetItem_renderTargetMultiplier_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR - 1, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR - 1, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR - 1, "allowSupersampleFiltering", "")

	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "Playtime", $GetItem_Playtime_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "Playtime", $GetItem_Playtime_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "supersampleScale", $GetItem_supersampleScale_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_2)

	_Tab()
EndFunc

Func _RM_DOWN()
	Global $TAB_Name = GUICtrlRead($TAB_NR)

	If $TAB_Name = 0 Then $Playlist_TEMP = $Playlist_1_INI
	If $TAB_Name = 1 Then $Playlist_TEMP = $Playlist_2_INI
	If $TAB_Name = 2 Then $Playlist_TEMP = $Playlist_3_INI
	If $TAB_Name = 3 Then $Playlist_TEMP = $Playlist_4_INI
	If $TAB_Name = 4 Then $Playlist_TEMP = $Playlist_5_INI
	If $TAB_Name = 0 Then $ListView_TEMP = $listview_7
	If $TAB_Name = 1 Then $ListView_TEMP = $listview_8
	If $TAB_Name = 2 Then $ListView_TEMP = $listview_9
	If $TAB_Name = 3 Then $ListView_TEMP = $listview_10
	If $TAB_Name = 4 Then $ListView_TEMP = $listview_11

	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$GameNR = _GUICtrlListView_GetItemText($ListView_TEMP, $ListView_Selected_Row_Nr - 1, 0)
	$GameName = _GUICtrlListView_GetItemText($ListView_TEMP, $ListView_Selected_Row_Nr - 1, 1)

	$GetItem_NR_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "NR", "")
	$GetItem_name_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "name", "")
	$GetItem_appid_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "appid", "")
	$GetItem_Playtime_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "Playtime", "")
	$GetItem_renderTargetMultiplier_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_1 = IniRead($Playlist_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

	$GetItem_NR_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR + 1, "NR", "")
	$GetItem_name_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR + 1, "name", "")
	$GetItem_appid_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR + 1, "appid", "")
	$GetItem_Playtime_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR + 1, "Playtime", "")
	$GetItem_renderTargetMultiplier_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR + 1, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR + 1, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_2 = IniRead($Playlist_TEMP, "Application_" & $GameNR + 1, "allowSupersampleFiltering", "")

	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "Playtime", $GetItem_Playtime_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_2, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "Playtime", $GetItem_Playtime_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "supersampleScale", $GetItem_supersampleScale_2)
	IniWrite($Playlist_TEMP, "Application_" & $GetItem_NR_1, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_2)

	_Tab()
EndFunc

Func _RM_DELETE_Item()
	Global $TAB_Name = GUICtrlRead($TAB_NR)

	If $TAB_Name = 0 Then $Playlist_TEMP = $Playlist_1_INI
	If $TAB_Name = 1 Then $Playlist_TEMP = $Playlist_2_INI
	If $TAB_Name = 2 Then $Playlist_TEMP = $Playlist_3_INI
	If $TAB_Name = 3 Then $Playlist_TEMP = $Playlist_4_INI
	If $TAB_Name = 4 Then $Playlist_TEMP = $Playlist_5_INI
	If $TAB_Name = 0 Then $ListView_TEMP = $listview_7
	If $TAB_Name = 1 Then $ListView_TEMP = $listview_8
	If $TAB_Name = 2 Then $ListView_TEMP = $listview_9
	If $TAB_Name = 3 Then $ListView_TEMP = $listview_10
	If $TAB_Name = 4 Then $ListView_TEMP = $listview_11

	$ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	$ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$GameNR = _GUICtrlListView_GetItemText($ListView_TEMP, $ListView_Selected_Row_Nr - 1, 0)
	$GameName = _GUICtrlListView_GetItemText($ListView_TEMP, $ListView_Selected_Row_Nr - 1, 1)
	$GameNR_next = _GUICtrlListView_GetItemText($ListView_TEMP, $ListView_Selected_Row_Nr, 0)

	$Playlist_NR_Applications = IniRead($Playlist_TEMP, "Playlist", "NR_Applications", "")

	$GetItem_NR_1 = ""
	$GetItem_name_1 = ""
	$GetItem_appid_1 = ""
	$GetItem_Playtime_1 = ""
	$GetItem_renderTargetMultiplier_1 = ""
	$GetItem_supersampleScale_1 = ""
	$GetItem_allowSupersampleFiltering_1 = ""

	IniWrite($Playlist_TEMP, "Application_" & $GameNR, "NR", $GetItem_NR_1)
	IniWrite($Playlist_TEMP, "Application_" & $GameNR, "name", $GetItem_name_1)
	IniWrite($Playlist_TEMP, "Application_" & $GameNR, "appid", $GetItem_appid_1)
	IniWrite($Playlist_TEMP, "Application_" & $GameNR, "Playtime", $GetItem_Playtime_1)
	IniWrite($Playlist_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($Playlist_TEMP, "Application_" & $GameNR, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($Playlist_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($Playlist_TEMP, "Playlist", "NR_Applications", $Playlist_NR_Applications - 1)

	For $Loop_Temp = $GameNR_next To 10
		$GameName_before = IniRead($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "name", "")
		$GameName_next = IniRead($Playlist_TEMP, "Application_" & $Loop_Temp, "name", "")
		If $GameName_next <> "" Then
			$GetItem_NR_next = IniRead($Playlist_TEMP, "Application_" & $Loop_Temp, "NR", "")
			$GetItem_name_next = IniRead($Playlist_TEMP, "Application_" & $Loop_Temp, "name", "")
			$GetItem_appid_next = IniRead($Playlist_TEMP, "Application_" & $Loop_Temp, "appid", "")
			$GetItem_Playtime_next = IniRead($Playlist_TEMP, "Application_" & $Loop_Temp, "Playtime", "")
			$GetItem_renderTargetMultiplier_next = IniRead($Playlist_TEMP, "Application_" & $Loop_Temp, "renderTargetMultiplier", "")
			$GetItem_supersampleScale_next = IniRead($Playlist_TEMP, "Application_" & $Loop_Temp, "supersampleScale", "")
			$GetItem_allowSupersampleFiltering_next = IniRead($Playlist_TEMP, "Application_" & $Loop_Temp, "allowSupersampleFiltering", "")

			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "NR", $Loop_Temp - 1)
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "name", $GetItem_name_next)
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "appid", $GetItem_appid_next)
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "Playtime", $GetItem_Playtime_next)
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_next)
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "supersampleScale", $GetItem_supersampleScale_next)
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_next)
		EndIf
		If $GameName_next = "" And $GameName_before <>"" Then
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "NR", "")
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "name", "")
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "appid", "")
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "Playtime", "")
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "renderTargetMultiplier", "")
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "supersampleScale", "")
			IniWrite($Playlist_TEMP, "Application_" & $Loop_Temp - 1, "allowSupersampleFiltering", "")
		EndIf
	Next
	_Tab()
EndFunc

Func _Checkbox_Add_break()
	Global $TAB_Name = GUICtrlRead($TAB_NR)

	If $TAB_Name = 0 Then $Playlist_TEMP = $Playlist_1_INI
	If $TAB_Name = 1 Then $Playlist_TEMP = $Playlist_2_INI
	If $TAB_Name = 2 Then $Playlist_TEMP = $Playlist_3_INI
	If $TAB_Name = 3 Then $Playlist_TEMP = $Playlist_4_INI
	If $TAB_Name = 4 Then $Playlist_TEMP = $Playlist_5_INI

	Local $State_Checkbox = GUICtrlRead($Checkbox_Add_break)

	If $State_Checkbox = "" Then
		GUICtrlSetData($Checkbox_Add_break, "X")
		IniWrite($Playlist_TEMP, "Playlist", "Add_break", "true")
	Else
		GUICtrlSetData($Checkbox_Add_break, "")
		IniWrite($Playlist_TEMP, "Playlist", "Add_break", "false")
	EndIf
EndFunc

Func _Combo_Add_break()
	Global $TAB_Name = GUICtrlRead($TAB_NR)

	If $TAB_Name = 0 Then $Playlist_TEMP = $Playlist_1_INI
	If $TAB_Name = 1 Then $Playlist_TEMP = $Playlist_2_INI
	If $TAB_Name = 2 Then $Playlist_TEMP = $Playlist_3_INI
	If $TAB_Name = 3 Then $Playlist_TEMP = $Playlist_4_INI
	If $TAB_Name = 4 Then $Playlist_TEMP = $Playlist_5_INI

	Local $State_Combobox = GUICtrlRead($Combo_Add_break)

	If $State_Combobox <> "" Then
		$Value_Add_break = StringLeft($State_Combobox, 2)
		IniWrite($Playlist_TEMP, "Playlist", "Break_duration", $Value_Add_break)
	EndIf
EndFunc

Func _Combo_Playlist_LIBRARY()
	GUICtrlSetData($Combo_Choose_Application, "", "")
	$State_Combobox = GUICtrlRead($Combo_Playlist_LIBRARY)

	If $State_Combobox = $TAB1_Label Then $ApplicationList_TEMP_2 = $ApplicationList_SteamLibrary_ALL_INI
	If $State_Combobox = $TAB2_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Non_Steam_Appl_INI
	If $State_Combobox = $TAB3_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_1_INI
	If $State_Combobox = $TAB4_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_2_INI
	If $State_Combobox = $TAB5_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_3_INI
	If $State_Combobox = $TAB6_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_4_INI

	If $State_Combobox <> "" And $State_Combobox <> "Choose LIBRARY" Then
		Local $NR_Applications = IniRead($ApplicationList_TEMP_2, "ApplicationList", "NR_Applications", "")

		$DROPDOWN_DATA_TEMP = "Choose Application" & "|"

		For $Loop_NR = 1 To $NR_Applications
			Local $Check_GameName = IniRead($ApplicationList_TEMP_2, "Application_" & $Loop_NR, "name", "")
			Local $Check_SteamGameID = IniRead($ApplicationList_TEMP_2, "Application_" & $Loop_NR, "appid", "")
			If $Check_GameName <> "" And $Check_SteamGameID <> "" Then
				$Check_Playlist_NR = IniRead($ApplicationList_TEMP_2, "Application_" & $Loop_NR, "NR", "")
				$APP_GameName = IniRead($ApplicationList_TEMP_2, "Application_" & $Loop_NR, "name", "")
				$Check_SteamGameID = IniRead($ApplicationList_TEMP_2, "Application_" & $Loop_NR, "appid", "")
				Local $Check_renderTargetMultiplier = IniRead($ApplicationList_TEMP_2, "Application_" & $Loop_NR, "renderTargetMultiplier", "")
				Local $Check_supersampleScale = IniRead($ApplicationList_TEMP_2, "Application_" & $Loop_NR, "supersampleScale", "")
				Local $Check_allowSupersampleFiltering = IniRead($ApplicationList_TEMP_2, "Application_" & $Loop_NR, "allowSupersampleFiltering", "")
				$DROPDOWN_DATA_TEMP = $DROPDOWN_DATA_TEMP  & "|" & $APP_GameName & " [" & $Check_SteamGameID & "]"
			EndIf
		Next
		GUICtrlSetData($Combo_Choose_Application, $DROPDOWN_DATA_TEMP, "Choose Application")
	Else
		MsgBox($MB_ICONINFORMATION, "", "Choose LIBRARY firt.")
	EndIf
EndFunc

Func _Combo_Choose_Application()
	$State_Combobox = GUICtrlRead($Combo_Playlist_LIBRARY)
	If $State_Combobox = $TAB1_Label Then $ApplicationList_TEMP_2 = $ApplicationList_SteamLibrary_ALL_INI
	If $State_Combobox = $TAB2_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Non_Steam_Appl_INI
	If $State_Combobox = $TAB3_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_1_INI
	If $State_Combobox = $TAB4_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_2_INI
	If $State_Combobox = $TAB5_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_3_INI
	If $State_Combobox = $TAB6_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_4_INI

	$State_Combobox = GUICtrlRead($Combo_Choose_Application)
	If $State_Combobox <> "" And $State_Combobox <> "Choose Application" Then
		Local $State_Combobox_Split = StringSplit($State_Combobox, '[')
		Local $Playlist_SteamGameID = StringReplace($State_Combobox_Split[2], ']', '')

		Local $Check_App_NR = IniRead($Playlist_1_INI, "Application_" & $Playlist_SteamGameID, "NR", "")
		Local $APP_GameName = IniRead($ApplicationList_TEMP_2, "Application_" & $Check_App_NR, "name", "")
		Local $Check_SteamGameID = IniRead($ApplicationList_TEMP_2, "Application_" & $Check_App_NR, "appid", "")
		Local $Check_renderTargetMultiplier = IniRead($ApplicationList_TEMP_2, "Application_" & $Check_App_NR, "renderTargetMultiplier", "1.0")
		Local $Check_supersampleScale = IniRead($ApplicationList_TEMP_2, "Application_" & $Check_App_NR, "supersampleScale", "1.0")
		Local $Check_allowSupersampleFiltering = IniRead($ApplicationList_TEMP_2, "Application_" & $Check_App_NR, "allowSupersampleFiltering", "true")
	EndIf
	GUICtrlSetData($Combo_renderTargetMultiplie , $Check_renderTargetMultiplier, "1.0")
	GUICtrlSetData($Combo_supersampleScale , $Check_supersampleScale, "1.0")
	GUICtrlSetData($Combo_allowSupersampleFiltering , $Check_allowSupersampleFiltering, "true")
EndFunc

Func _Button_Add2Playlist()
	Global $TAB_Name = GUICtrlRead($TAB_NR)

	If $TAB_Name = 0 Then $Playlist_TEMP = $Playlist_1_INI
	If $TAB_Name = 1 Then $Playlist_TEMP = $Playlist_2_INI
	If $TAB_Name = 2 Then $Playlist_TEMP = $Playlist_3_INI
	If $TAB_Name = 3 Then $Playlist_TEMP = $Playlist_4_INI
	If $TAB_Name = 4 Then $Playlist_TEMP = $Playlist_5_INI

	Local $Check_Playlist_NR_Applications = IniRead($Playlist_TEMP, "Playlist", "NR_Applications", "")

	If $Check_Playlist_NR_Applications < 10 Then
		$State_Combobox = GUICtrlRead($Combo_Playlist_LIBRARY)
		If $State_Combobox = $TAB1_Label Then $ApplicationList_TEMP_2 = $ApplicationList_SteamLibrary_ALL_INI
		If $State_Combobox = $TAB2_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Non_Steam_Appl_INI
		If $State_Combobox = $TAB3_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_1_INI
		If $State_Combobox = $TAB4_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_2_INI
		If $State_Combobox = $TAB5_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_3_INI
		If $State_Combobox = $TAB6_Label Then $ApplicationList_TEMP_2 = $ApplicationList_Custom_4_INI

		$State_Combo_Playtime = GUICtrlRead($Combo_Playtime)
		$State_Combo_renderTargetMultiplie = GUICtrlRead($Combo_renderTargetMultiplie)
		$State_Combo_supersampleScale = GUICtrlRead($Combo_supersampleScale)
		$State_Combo_allowSupersampleFiltering = GUICtrlRead($Combo_allowSupersampleFiltering)

		$State_Combobox = GUICtrlRead($Combo_Choose_Application)
		If $State_Combobox <> "" And $State_Combobox <> "Choose Application" Then
			Local $State_Combobox_Split = StringSplit($State_Combobox, '[')
			Local $Playlist_SteamGameID = StringReplace($State_Combobox_Split[2], ']', '')

			Local $Check_Playlist_NR = IniRead($Playlist_TEMP, "Playlist", "NR_Applications", "")
			Local $Playlist_NR_Temp = $Check_Playlist_NR + 1

			Local $APP_GameName = IniRead($ApplicationList_TEMP_2, "Application_" & $Playlist_SteamGameID, "name", "")
			Local $Check_SteamGameID = IniRead($ApplicationList_TEMP_2, "Application_" & $Playlist_SteamGameID, "appid", "")
			Local $Check_renderTargetMultiplier = IniRead($ApplicationList_TEMP_2, "Application_" & $Playlist_SteamGameID, "renderTargetMultiplier", "")
			Local $Check_supersampleScale = IniRead($ApplicationList_TEMP_2, "Application_" & $Playlist_SteamGameID, "supersampleScale", "")
			Local $Check_allowSupersampleFiltering = IniRead($ApplicationList_TEMP_2, "Application_" & $Playlist_SteamGameID, "allowSupersampleFiltering", "")

			IniWrite($Playlist_TEMP, "Application_" & $Playlist_NR_Temp, "NR", $Playlist_NR_Temp)
			IniWrite($Playlist_TEMP, "Application_" & $Playlist_NR_Temp, "name", $APP_GameName)
			IniWrite($Playlist_TEMP, "Application_" & $Playlist_NR_Temp, "appid", $Check_SteamGameID)
			IniWrite($Playlist_TEMP, "Application_" & $Playlist_NR_Temp, "Playtime", $State_Combo_Playtime)
			IniWrite($Playlist_TEMP, "Application_" & $Playlist_NR_Temp, "renderTargetMultiplier", $State_Combo_renderTargetMultiplie)
			IniWrite($Playlist_TEMP, "Application_" & $Playlist_NR_Temp, "supersampleScale", $State_Combo_supersampleScale)
			IniWrite($Playlist_TEMP, "Application_" & $Playlist_NR_Temp, "allowSupersampleFiltering", $State_Combo_allowSupersampleFiltering)
			IniWrite($Playlist_TEMP, "Playlist", "NR_Applications", $Playlist_NR_Temp)
		Else
			MsgBox($MB_ICONINFORMATION, "", "Choose Application firt.")
		EndIf

		_Tab()
	Else
		MsgBox($MB_ICONINFORMATION, "Playlist Maximum", "Maximum number of Playlist entries [10] already reached.")
	EndIf
EndFunc

Func  _Button_StartPlaylist()
	Global $TAB_Name = GUICtrlRead($TAB_NR)

	If $TAB_Name = 0 Then $Playlist_TEMP = $Playlist_1_INI
	If $TAB_Name = 1 Then $Playlist_TEMP = $Playlist_2_INI
	If $TAB_Name = 2 Then $Playlist_TEMP = $Playlist_3_INI
	If $TAB_Name = 3 Then $Playlist_TEMP = $Playlist_4_INI
	If $TAB_Name = 4 Then $Playlist_TEMP = $Playlist_5_INI

	$Playlist_NR = StringRight($Playlist_TEMP, 5)
	$Playlist_NR = StringReplace($Playlist_NR, '.ini', '')

	Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Start Playlist", "Do you realy want to Start Playlist " & $Playlist_NR & "?")

	If $Abfrage = 6 Then
		IniWrite($Config_INI, "TEMP", "Playlist_Exit_command", "")
		IniWrite($Config_INI, "TEMP", "Playlist_INI", $Playlist_TEMP)
		If FileExists($System_DIR & "Playlist.exe") Then
			ShellExecute($System_DIR & "Playlist.exe", "", $System_DIR)
		Else
			ShellExecute($System_DIR & "Playlist.au3", "", $System_DIR)
		EndIf
	EndIf
EndFunc

Func  _Button_StopPlaylist()
	Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Stop Playlist", "Do you realy want to Stop the current running Playlist?")

	If $Abfrage = 6 Then
		IniWrite($Config_INI, "TEMP", "Playlist_Exit_command", "true")
	EndIf
EndFunc

Func _Button_Exit_Playlist_GUI()
	GUIDelete($Playlist_GUI)
	$Show_Playlist = IniRead($Config_INI, "TEMP", "Show_Playlist", "")
	IniWrite($Config_INI, "TEMP", "Show_Playlist", "")
	If $Show_Playlist = "true" Then Exit
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

Func _Beenden()
	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
	IniWrite($Config_INI, "TEMP", "Show_Playlist", "")
	IniWrite($Config_INI, "TEMP", "Show_SS_Menu", "")
	Exit
EndFunc
#endregion

#endregion

