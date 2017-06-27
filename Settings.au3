#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\coding\Home_Loader\Compile_Icons\Settings.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <GuiButton.au3>
#include <FontConstants.au3>
#include <File.au3>
#include <GUIConstants.au3>
;#include <ComboConstants.au3>
;#include <GDIPlus.au3>
;#include <Inet.au3>

Opt("GUIOnEventMode", 1)

Global $SteamVR_Status, $Title_1, $Title_2, $Handle_1, $Handle_2, $Title_Array_1, $Title_Array_2, $Handle_Array_1, $Handle_Array_2, $NR_Handle_1, $NR_Handle_2
Global $GameStarted, $LOOP_VIVEHOMECheck, $OldWindowExists, $Button_Close_Current_Running, $Checkbox_Show_Settings_at_Startup, $Button_Restart, $Button_Exit
Global $Select_HomeApp_Label, $USE_GUI_Backup, $ApplicationList_Read, $Array_tools_vrmanifest_File, $Line_NR_binary_path_windows, $Line_NR_image_path
Global $Array_tools_vrmanifest_File, $AddShortcut_to_Oculus_GUI, $Add_Other_GUI

Global $Config_INI = @ScriptDir & "\config.ini"
Global $Install_DIR = @ScriptDir & "\"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $Show_Settings_at_Startup = IniRead($Config_INI, "Settings", "Show_Settings_at_Startup", "")
Global $TEMP_StartHomeLoader = IniRead($Config_INI, "TEMP", "StartHomeLoader", "")
Global $TEMP_StartHomeSettings = IniRead($Config_INI, "TEMP", "StartHomeLoaderSettings", "")
Global $USE_FB_GUI = IniRead($Config_INI, "Settings", "USE_GUI", "")
Global $USE_PHP_WebServer = IniRead($Config_INI, "Settings", "USE_PHP_WebServer", "")
Global $StartSteamVRHome = $Install_DIR & "StartSteamVRHome.exe"
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $Time_Interval = IniRead($Config_INI, "Settings", "Time_Interval", "")
Global $Status_Checkbox_Minimize_OVRS = IniRead($Config_INI,"Settings", "Minimize_Oculus", "")
Global $gfx = $Install_DIR & "gfx\"
Global $JanusVR_Page = $Install_DIR & "WebPage\janusvr\" & "index.html"

Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
Global $ApplicationList_Non_Steam_Appl_INI = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
Global $ApplicationList_Custom_1_INI = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
Global $ApplicationList_Custom_2_INI = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
Global $ApplicationList_Custom_3_INI = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
Global $ApplicationList_Custom_4_INI = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

Global $Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
Global $Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
Global $Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
Global $Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
Global $Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

If $Install_Folder_Steam_1 = "" Then
	Global $Install_Folder_Steam_Search_Folder = "C:\Program Files (x86)\Steam\Steam.exe"
	Global $Install_Folder_Steam_Folder = StringReplace($Install_Folder_Steam_Search_Folder, 'Steam.exe', '')

	If FileExists($Install_Folder_Steam_Search_Folder) Then
		IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $Install_Folder_Steam_Folder)
	Else
		MsgBox(0, "Steam folder", "Steam folder was not found." & @CRLF & _
						"Choose the folder before continue." & @CRLF)

		Local $FileSelectFolder = FileSelectFolder("Choose Steam folder", $Install_Folder_Steam_Folder)
		If FileExists($FileSelectFolder & "\Steam.exe") Then
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $FileSelectFolder & "\")
		Else
			MsgBox(48, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", "")
			_Restart()
		EndIf
	EndIf
	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
EndIf

Global $Steam_tools_vrmanifest_File = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
Global $Steam_tools_vrmanifest_File_BAK = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest.bak"

If Not FileExists($Steam_tools_vrmanifest_File) Then
	$Steam_tools_vrmanifest_File = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
	$Steam_tools_vrmanifest_File_BAK = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest.bak"
	If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
EndIf

If Not FileExists($Steam_tools_vrmanifest_File) Then
	$Steam_tools_vrmanifest_File = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
	$Steam_tools_vrmanifest_File_BAK = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest.bak"
	If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
EndIf

If Not FileExists($Steam_tools_vrmanifest_File) Then
	$Steam_tools_vrmanifest_File = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
	$Steam_tools_vrmanifest_File_BAK = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest.bak"
	If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
EndIf

If Not FileExists($Steam_tools_vrmanifest_File) Then
	$Steam_tools_vrmanifest_File = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
	$Steam_tools_vrmanifest_File_BAK = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest.bak"
	If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
EndIf

If Not FileExists($Steam_tools_vrmanifest_File) Then
	$Steam_tools_vrmanifest_File = "C:\Program Files (x86)\Steam\" & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
	$Steam_tools_vrmanifest_File_BAK = "C:\Program Files (x86)\Steam\" & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest.bak"
	If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
EndIf

If $Install_DIR = "" Then
	$Install_DIR = @ScriptDir & "\"
	IniWrite($Config_INI, "Settings", "Install_Folder", $Install_DIR)
EndIf


_StartUp_settings()


Global $font_arial = "arial"


Func _Create_JanusVR_Page()
	$Install_DIR_replaced = StringReplace($Install_DIR, '\', '/')
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

Func _StartUp_settings()
	If $Show_Settings_at_Startup = "First Start" Then IniWrite($Config_INI, "Settings", "Show_Settings_at_Startup", "")
    Global $GUI_StartUp_settings = GUICreate("Home Loader - Settings", 250, 415, -1, -1, $WS_EX_TOPMOST)
	GUISetIcon(@AutoItExe, -2, $GUI_StartUp_settings)
    GUISetState(@SW_SHOW, $GUI_StartUp_settings)

	Global $font_StartUp_arial = "arial"

	GUICtrlCreateGroup("Home app:", 5, 5, 235, 95)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)

	Global $StartUp_Radio_1 = GUICtrlCreateRadio("Vive Home", 10, 25, 75)
		If $WinName = "Vive Home" Then GUICtrlSetState($StartUp_Radio_1, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_1, "_StartUp_Radio_1")

	Global $StartUp_Radio_2 = GUICtrlCreateRadio("VR Home", 90, 25, 70)
		If $WinName = "VR Home" Then GUICtrlSetState($StartUp_Radio_2, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_2, "_StartUp_Radio_2")

	Global $StartUp_Radio_3 = GUICtrlCreateRadio("SteamVR", 163, 25, 65)
		If $WinName = "SteamVR Home" Then GUICtrlSetState($StartUp_Radio_3, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_3, "_StartUp_Radio_3")

	Global $StartUp_Radio_4 = GUICtrlCreateRadio("VR Toolbox", 10, 45, 75)
		If $WinName = "VR Toolbox" Then GUICtrlSetState($StartUp_Radio_4, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_4, "_StartUp_Radio_4")

	Global $StartUp_Radio_5 = GUICtrlCreateRadio("JanusVR", 90, 45, 65)
		If $WinName = "Janus VR" Then GUICtrlSetState($StartUp_Radio_5, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_5, "_StartUp_Radio_5")

	Global $StartUp_Radio_6 = GUICtrlCreateRadio("Other", 163, 45, 65)
		If $WinName <> "Vive Home" And $WinName <> "VR Home" And $WinName <> "VR Toolbox" And $WinName <> "Janus VR" And $WinName <> "SteamVR Home" And $Home_Path <> "" Then GUICtrlSetState($StartUp_Radio_6, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_6, "_StartUp_Radio_6")


	Global $Button_Restore_DefaultSteamVRHome = GUICtrlCreateButton("Restore Default SteamVR Home Path", 10, 68, 223, 25)
	GUICtrlSetOnEvent($Button_Restore_DefaultSteamVRHome, "_Restore_Default_SteamVR_Home")

	GUICtrlCreateGroup("Home Loader Settings:", 5, 105, 235, 125)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)


	$State_Checkbox_USE_HTML_WebPage = IniRead($config_ini,"Settings", "USE_PHP_WebServer", "")
	Global $Checkbox_USE_HTML_WebPage = GUICtrlCreateCheckbox(" Use HTML Game Page", 10, 125, 170, 20) ; 430
		If $State_Checkbox_USE_HTML_WebPage = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_USE_HTML_WebPage, "_Checkbox_USE_HTML_WebPage")

	$State_Checkbox_USE_Key_Presses = IniRead($config_ini,"Settings", "USE_Key_Presses", "")
	Global $Checkbox_USE_Key_Presses = GUICtrlCreateCheckbox(" Use Pad/Key Press detection", 10, 145, 220, 20) ; 430
		If $State_Checkbox_USE_Key_Presses = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_USE_Key_Presses, "_Checkbox_USE_Key_Presses")

	$State_Checkbox_Add_PlayersOnline_to_Icons = IniRead($config_ini,"Settings", "Add_PlayersOnline_to_Icons", "")
	Global $Checkbox_Add_PlayersOnline_to_Icons = GUICtrlCreateCheckbox(" Add Players Online to Icons", 10, 165, 220, 20) ; 430
		If $State_Checkbox_Add_PlayersOnline_to_Icons = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Add_PlayersOnline_to_Icons, "_Checkbox_Add_PlayersOnline_to_Icons")

	$State_Checkbox_Add_SS_per_game = IniRead($config_ini,"Settings", "Add_SS_per_game", "")
	Global $Checkbox_Add_SS_per_game = GUICtrlCreateCheckbox(" Automaticly add SS per game", 10, 185, 220, 20) ; 430
		If $State_Checkbox_Add_SS_per_game = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Add_SS_per_game, "_Checkbox_Add_SS_per_game")

	$State_Checkbox_Start_HomeLoader_with_HomeApp = IniRead($config_ini,"Settings", "Start_HomeLoader_with_HomeApp", "")
	Global $Checkbox_Start_HomeLoader_with_HomeApp = GUICtrlCreateCheckbox(" Start HomeLoader with HomeApp", 10, 205, 228, 20) ; 430
		If $State_Checkbox_Start_HomeLoader_with_HomeApp = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 10, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Start_HomeLoader_with_HomeApp, "_Checkbox_Start_HomeLoader_with_HomeApp")


	GUICtrlCreateGroup("Oculus Home:", 5, 235, 235, 72)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)

	$State_Checkbox_Minimize_Oculus = IniRead($config_ini,"Settings", "Minimize_Oculus", "")
	Global $Checkbox_Minimize_Oculus = GUICtrlCreateCheckbox(" Minimize Oculus Shop", 10, 255, 170, 20) ; 430
		If $State_Checkbox_Minimize_Oculus = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Minimize_Oculus, "_Checkbox_Minimize_Oculus")

	Global $Button_Add_Shortcut_2_OH = GUICtrlCreateButton("Add 'Home App' Shortcut to Oculus Home", 10, 275, 223, 25)
	GUICtrlSetOnEvent($Button_Add_Shortcut_2_OH, "_Button_Add_Shortcut_2_OH")

	Global $Exit = GUICtrlCreateButton("Close", 5, 315, 235, 30)
	GUICtrlSetFont(-1, 14, 600, 2, $font_StartUp_arial)
	GUICtrlSetColor(-1, "0x006600")
	GUICtrlSetOnEvent($Exit, "_Exit")

	Global $State_StartUp_Radio_1 = GUICtrlRead($StartUp_Radio_1)
	Global $State_StartUp_Radio_2 = GUICtrlRead($StartUp_Radio_2)
	Global $State_StartUp_Radio_3 = GUICtrlRead($StartUp_Radio_3)
	Global $State_StartUp_Radio_4 = GUICtrlRead($StartUp_Radio_4)
	Global $State_StartUp_Radio_5 = GUICtrlRead($StartUp_Radio_5)
	Global $State_StartUp_Radio_6 = GUICtrlRead($StartUp_Radio_6)

	Global $Button_Start_HomeLoader = GUICtrlCreateButton("Start Home Loader", 5, 350, 235, 30)
	GUICtrlSetFont(-1, 14, 600, 2, $font_StartUp_arial)
	GUICtrlSetColor(-1, "0x006600")
	GUICtrlSetOnEvent($Button_Start_HomeLoader, "_Button_Start_HomeLoader")

	If $State_StartUp_Radio_1 <> "4" Or $State_StartUp_Radio_2 <> "4" Or $State_StartUp_Radio_3 <> "4" Or $State_StartUp_Radio_4 <> "4" Or $State_StartUp_Radio_5 <> "4" Or $State_StartUp_Radio_6 <> "4" Then
		GUICtrlSetState($Button_Start_HomeLoader, $GUI_SHOW)
	Else
		GUICtrlSetState($Button_Start_HomeLoader, $GUI_HIDE)
		Global $Select_HomeApp_Label = GUICtrlCreateLabel("Select Home App first", 18, 352, 235, 40)
		GUICtrlSetFont(-1, 16, 400, 2, $font_StartUp_arial)
		GUICtrlSetColor(-1, "0xFF0000")
	EndIf

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop
        EndSwitch
    WEnd
EndFunc

Func _StartUp_Button_HomeLoader()
	$State_StartUp_Radio_1 = GUICtrlRead($StartUp_Radio_1)
	$State_StartUp_Radio_2 = GUICtrlRead($StartUp_Radio_2)
	$State_StartUp_Radio_3 = GUICtrlRead($StartUp_Radio_3)
	$State_StartUp_Radio_4 = GUICtrlRead($StartUp_Radio_4)
	$State_StartUp_Radio_5 = GUICtrlRead($StartUp_Radio_5)
	$State_StartUp_Radio_6 = GUICtrlRead($StartUp_Radio_6)

	If $State_StartUp_Radio_1 <> "4" Or $State_StartUp_Radio_2 <> "4" Or $State_StartUp_Radio_3 <> "4" Or $State_StartUp_Radio_4 <> "4" Or $State_StartUp_Radio_5 <> "4" Or $State_StartUp_Radio_6 <> "4" Then
		;GUICtrlDelete($Select_HomeApp_Label)
		GUICtrlSetState($Select_HomeApp_Label, $GUI_HIDE)
		GUICtrlSetState($Button_Start_HomeLoader, $GUI_SHOW)
	EndIf
EndFunc

Func _StartUp_AddShortcut_to_Oculus_GUI()
	$font_arial = "arial"
	$AddShortcut_to_Oculus_GUI = GUICreate("Add Shortcut to Oculus Home", 349, 305 , - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	; Darstellung Icon Preview Rahmen
	Global $Frame_up = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 190, 110, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_down = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 243, 110, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_right = GUICtrlCreatePic($gfx & "Frame.jpg", 330, 190, 3, 56, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_left = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 190, 3, 56, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Icon_Preview = GUICtrlCreatePic($gfx & "Icon_Preview.jpg", 223, 193, 107, 50)

	GUICtrlCreateGroup("New [replaced] Oculus Home Shortcut", 5, 5, 340, 255)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 14, 400, 6, $font_arial)

	GUICtrlCreateLabel("Replacement for:", 10, 40, 170, 25)
	GUICtrlSetFont(-1, 12, 400, 1, $font_arial)
	Global $DROPDOWN_Library = GUICtrlCreateCombo("Choose Application", 130, 39, 203, 35)
	;GUICtrlSetOnEvent(- 1, "_DROPDOWN_Library")
	GUICtrlSetData(-1, "The Body VR" & "|" & "Discovery VR", "Choose Application")
	GUICtrlSetFont(-1, 10, 400, 2, "arial")

	GUICtrlCreateLabel("Game Path:", 10, 80, 115, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $BUTTON_GamePath_Folder = GUICtrlCreateButton("Select File", 130, 76, 99, 30, 0)
	;GUICtrlSetOnEvent(- 1, "_BUTTON_GamePath_Folder")
	GUICtrlSetFont(-1, 9, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Select File.")
	Global $BUTTON_Use_SteamID= GUICtrlCreateButton("Use Steam ID", 234, 76, 100, 30, 0)
	;GUICtrlSetOnEvent(- 1, "_BUTTON_Use_SteamID")
	GUICtrlSetFont(-1, 9, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Enter Steam ID.")
	Global $Input_GamePath_Folder = GUICtrlCreateInput("", 130, 108, 203, 30)
	GUICtrlSetFont(-1, 9, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")

	GUICtrlCreateLabel("Appl. Name:", 10, 153, 150, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Name = GUICtrlCreateInput("", 130, 149, 203, 30)
	;GUICtrlSetOnEvent(- 1, "_Input_Name")
	GUICtrlSetFont(-1, 12, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")

	GUICtrlCreateLabel("Icon Path:", 10, 207, 115, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $BUTTON_IconPath_Folder = GUICtrlCreateButton("Select Icon", 130, 203, 85, 30, 0)
	;GUICtrlSetOnEvent(- 1, "_BUTTON_IconPath_Folder")
	GUICtrlSetFont(-1, 9, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Select File.")

	GUICtrlCreateGroup("Drop Field", 350, 5, 130, 255)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 16, 400, 6, $font_arial)

	Global $Button_SAVE_APP = GUICtrlCreateButton("Save", 5, 265, 300, 35, $BS_BITMAP)
	;GUICtrlSetOnEvent(- 1, "_Button_SAVE_APP")
	_GUICtrlButton_SetImage(- 1, $gfx & "Create_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	Global $Button_Exit_AddShortcut_to_Oculus_GUI = GUICtrlCreateButton("Exit", 310, 265, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_AddShortcut_to_Oculus_GUI")
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

	GUISetState()
EndFunc

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


Func _StartUp_Radio_1() ; Vive Home
	If FileExists("C:\Program Files (x86)\ViveSetup\Updater\App\Home\win32\ViveHome.exe") Then
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "C:\Program Files (x86)\ViveSetup\Updater\App\Home\win32\ViveHome.exe")
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	Else
		$FileSelect = FileOpenDialog("Select 'VIVEHome.exe' File", "", "")
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	EndIf

	Local $Abfrage = MsgBox (4, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																"This can be changed at any time in this settings menu." & @CRLF)

	If $Abfrage = 6 Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
	EndIf
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_2() ; VR Home
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/575430")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Home")
	Local $Abfrage = MsgBox (4, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																"This can be changed at any time in this settings menu." & @CRLF)

	If $Abfrage = 6 Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
	EndIf
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_3() ; SteamVR Home
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/250820")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "SteamVR Home")
	Local $Abfrage = MsgBox (4, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																"This can be changed at any time in this settings menu." & @CRLF)

	If $Abfrage = 6 Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
	EndIf
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_4() ; VR Toolbox
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")
	Local $Abfrage = MsgBox (4, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																"This can be changed at any time in this settings menu." & @CRLF)

	If $Abfrage = 6 Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
	EndIf
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_5() ; Janus VR
	Global $JanusVR_Path = "" ; E:\SteamLibrary\steamapps\common\Janus VR\janusvr.exe
	If FileExists($Install_Folder_Steam_1 & "SteamApps\common\Janus VR\janusvr.exe") Then $JanusVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\Janus VR\janusvr.exe"
	If FileExists($Install_Folder_Steam_2 & "SteamApps\common\Janus VR\janusvr.exe") Then $JanusVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\Janus VR\janusvr.exe"
	If FileExists($Install_Folder_Steam_3 & "SteamApps\common\Janus VR\janusvr.exe") Then $JanusVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\Janus VR\janusvr.exe"
	If FileExists($Install_Folder_Steam_4 & "SteamApps\common\Janus VR\janusvr.exe") Then $JanusVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\Janus VR\janusvr.exe"
	If FileExists($Install_Folder_Steam_5 & "SteamApps\common\Janus VR\janusvr.exe") Then $JanusVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\Janus VR\janusvr.exe"
	If $JanusVR_Path = "" Then $JanusVR_Path = "steam://rungameid/602090"
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $JanusVR_Path)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Janus VR")
	Local $Abfrage = MsgBox (4, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																"This can be changed at any time in this settings menu." & @CRLF)

	If $Abfrage = 6 Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
	EndIf
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_6() ; Other
	_StartUp_Add_Other_GUI()
EndFunc

Func _DROPDOWN_Other_GUI() ; Other GUI DropDown
	$DROPDOWN = GUICtrlRead($DROPDOWN_Other_GUI)

	Local $StringSplit = StringSplit($DROPDOWN, '[')
	Local $SteamStartURL = "steam://rungameid/" & StringReplace($StringSplit[2], ']', '')

	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $SteamStartURL)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "")
	Local $Abfrage = MsgBox (4, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																"This can be changed at any time in this settings menu." & @CRLF)

	If $Abfrage = 6 Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
	EndIf
	_StartUp_Button_HomeLoader()
	GUIDelete($Add_Other_GUI)
EndFunc

Func _BUTTON_GamePath_Folder_Other_GUI() ; Other GUI BUTTON
	$FileSelect = FileOpenDialog("Select the app you want to start.", @ScriptDir & "\", "Executable (*.exe;*.au3; ...)", $FD_FILEMUSTEXIST)

	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "")

	Local $Abfrage = MsgBox (4, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																"This can be changed at any time in this settings menu." & @CRLF)

	If $Abfrage = 6 Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
	EndIf
	_StartUp_Button_HomeLoader()
	GUIDelete($Add_Other_GUI)
EndFunc


Func _Checkbox_USE_HTML_WebPage()
	$State_Checkbox = GUICtrlRead($Checkbox_USE_HTML_WebPage)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "USE_PHP_WebServer", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "USE_PHP_WebServer", "false")
	EndIf
EndFunc

Func _Checkbox_USE_Key_Presses()
	$State_Checkbox = GUICtrlRead($Checkbox_USE_Key_Presses)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "USE_Key_Presses", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "USE_Key_Presses", "false")
	EndIf
EndFunc

Func _Checkbox_Add_PlayersOnline_to_Icons()
	$State_Checkbox = GUICtrlRead($Checkbox_Add_PlayersOnline_to_Icons)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Add_PlayersOnline_to_Icons", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Add_PlayersOnline_to_Icons", "false")
	EndIf
EndFunc

Func _Checkbox_Add_SS_per_game()
	$State_Checkbox = GUICtrlRead($Checkbox_Add_SS_per_game)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Add_SS_per_game", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Add_SS_per_game", "false")
	EndIf
EndFunc

Func _Checkbox_Start_HomeLoader_with_HomeApp()
	$State_Checkbox = GUICtrlRead($Checkbox_Start_HomeLoader_with_HomeApp)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Start_HomeLoader_with_HomeApp", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Start_HomeLoader_with_HomeApp", "false")
	EndIf
EndFunc







Func _Checkbox_Minimize_Oculus()
	$State_Checkbox = GUICtrlRead($Checkbox_Minimize_Oculus)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Minimize_Oculus", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Minimize_Oculus", "false")
	EndIf
EndFunc


Func _ADD_2_SteamVR_Home_default()
	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	$Install_DIR_StringReplace = StringReplace($Install_DIR, '\', '/')
	$NewHomePath = StringTrimRight($Install_DIR_StringReplace, 1) & "/StartSteamVRHome.exe"
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
			If $WinName = "SteamVR Home" Then $NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
			FileWriteLine($Steam_tools_vrmanifest_File, $NewLine)
		Else
			FileWriteLine($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File[$LOOP_vrmanifest])
		EndIf
    Next
EndFunc

Func _Restore_Default_SteamVR_Home()
	If Not FileExists($Steam_tools_vrmanifest_File) Then FileCopy($Steam_tools_vrmanifest_File_BAK, $Steam_tools_vrmanifest_File)
	$WinName = "SteamVR Home"
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
			If $WinName = "SteamVR Home" Then $NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
			FileWriteLine($Steam_tools_vrmanifest_File, $NewLine)
		Else
			FileWriteLine($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File[$LOOP_vrmanifest])
		EndIf
    Next
EndFunc

Func  _Button_Add_Shortcut_2_OH()
	Local $Abfrage = MsgBox (4, "Add Shortcut to Oculus Home", "Create an new .exe File to start the SteamVR Home app from inside Oculus Home." & @CRLF & _
																"Use any free Game to replace/add the new File." & @CRLF & @CRLF & _
																"Using that File as Shortcut gives you the ability to load different apps from inside" & @CRLF & _
																"Oculus Home by pressing A, B, X, Y, RB, LB or Start on your XBox controller." & @CRLF & @CRLF & _
																"Do you want to create the new .exe File?" & @CRLF)

	If $Abfrage = 6 Then
		FileWrite($Install_DIR & 'temp.au3', 'ShellExecute("' & $Install_DIR & 'StartSteamVRHome.exe")')
		$IN = $Install_DIR & "temp.au3"
		$OUT = $Install_DIR & "Rename.exe"
		RunWait(@ComSpec & " /c " & 'System\Aut2exe.exe' & ' /in ' & $IN & ' /out ' & $OUT, "", @SW_HIDE)
		FileDelete($IN)
		MsgBox (0, "Creation completed", "New .exe File was created in Home Loader folder:" & @CRLF & _
																$OUT & @CRLF & @CRLF & _
																"Copy the new File to the game folder of your choise. Rename the File so that it matches the executable of the game. Use any free Game to replace the new File." & @CRLF & _
																"Make a Backup of the origial one or just reinstall it later if you want to use it again.")
	Else

	EndIf
EndFunc

Func _Button_Exit_AddShortcut_to_Oculus_GUI()
	GUIDelete($AddShortcut_to_Oculus_GUI)
EndFunc


Func _Button_Start_HomeLoader()
	GUIDelete($GUI_StartUp_settings)
	IniWrite($Config_INI, "TEMP", "StartHomeLoader", "true")
	IniWrite($Config_INI, "TEMP", "StartHomeLoaderSettings", "false")
	_Start_HomeLoader()
EndFunc

Func _Start_HomeLoader()
	IniWrite($Config_INI, "TEMP", "StartHomeLoader", "true")
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
	EndIf
	Exit
EndFunc

Func _Start_PHP_WebServer()
	If Not FileExists($Install_DIR & "\php\StartPHP.bat") Then
		FileWrite($Install_DIR & "\php\StartPHP.bat", "php -S localhost:8000 -t " & $Install_DIR & @CRLF & _
														"pause")
	EndIf
	Run($Install_DIR & "\php\StartPHP.bat", $Install_DIR & "\php\", "", @SW_HIDE)
EndFunc

Func _StartGame_Check()
	If FileExists($Install_DIR & "WebPage\temp.txt") Then
		$SteamGameID = FileRead($Install_DIR & "WebPage\temp.txt")
		$ApplicationList_Read = $ApplicationList_SteamLibrary_ALL_INI
		Local $Application_appid = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "appid", "")

		If $Application_appid = "" Then
			$ApplicationList_Read = $ApplicationList_Non_Steam_Appl_INI
			$Application_appid = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "appid", "")
		EndIf

		If $Application_appid = "" Then
			$ApplicationList_Read = $ApplicationList_Custom_1_INI
			$Application_appid = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "appid", "")
		EndIf

		If $Application_appid = "" Then
			$ApplicationList_Read = $ApplicationList_Custom_2_INI
			$Application_appid = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "appid", "")
		EndIf

		If $Application_appid = "" Then
			$ApplicationList_Read = $ApplicationList_Custom_3_INI
			$Application_appid = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "appid", "")
		EndIf

		If $Application_appid = "" Then
			$ApplicationList_Read = $ApplicationList_Custom_4_INI
			$Application_appid = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "appid", "")
		EndIf

		Local $Application_appid = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "appid", "")
		Local $Application_name = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "name", "")
		Local $Application_installdir = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "installdir", "")
		Local $Application_IconPath = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "IconPath", "")

		If StringLeft($Application_appid, 2) <> "HL" Then
			If WinExists("Janus VR") Then WinClose("Janus VR")
			If WinExists($WinName) Then WinClose($WinName)
			ProcessClose("cmd.exe")
			ProcessClose("cmd.exe")
			ProcessClose("cmd.exe")
			ProcessClose("cmd.exe")
			ProcessClose("cmd.exe")
			ProcessClose("php.exe")
			ProcessClose("php.exe")
			ProcessClose("php.exe")
			ProcessClose("php.exe")
			ProcessClose("php.exe")
			ProcessClose("conhost.exe")
			ProcessClose("conhost.exe")
			ProcessClose("conhost.exe")
			ProcessClose("conhost.exe")
			ProcessClose("conhost.exe")
			ShellExecuteWait("steam://rungameid/" & $SteamGameID)
		Else
			If WinExists("Janus VR") Then WinClose("Janus VR")
			If WinExists($WinName) Then WinClose($WinName)
			ProcessClose("cmd.exe")
			ProcessClose("cmd.exe")
			ProcessClose("cmd.exe")
			ProcessClose("cmd.exe")
			ProcessClose("cmd.exe")
			ProcessClose("php.exe")
			ProcessClose("php.exe")
			ProcessClose("php.exe")
			ProcessClose("php.exe")
			ProcessClose("php.exe")
			ProcessClose("conhost.exe")
			ProcessClose("conhost.exe")
			ProcessClose("conhost.exe")
			ProcessClose("conhost.exe")
			ProcessClose("conhost.exe")
			ShellExecuteWait($Application_installdir)
		EndIf

		$State_Reload_HOMEonExit = IniRead($Config_INI, "Settings", "Reload_HOMEonExit", "")
		If $State_Reload_HOMEonExit = "true" Then
			IniWrite($Config_INI, "TEMP", "StartHomeLoader", "true")
			If FileExists($Install_DIR & "HomeLoader.exe") Then
				ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
			Else
				ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
			EndIf
		EndIf
		If FileExists($Install_DIR & "WebPage\temp.txt") Then FileDelete($Install_DIR & "WebPage\temp.txt")
		Sleep(1000)
		Exit
	EndIf
EndFunc

Func _Restart()
	GUIDelete($GUI_StartUp_settings)
	If FileExists($Install_DIR & "Settings.exe") Then
		ShellExecute($Install_DIR & "Settings.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "Settings.au3", "", $Install_DIR)
	EndIf
	Exit
EndFunc

Func _Exit()
	If $USE_PHP_WebServer = "true" Then
		If ProcessExists("cmd.exe") Then ProcessClose("cmd.exe")
	EndIf
	Exit
EndFunc

