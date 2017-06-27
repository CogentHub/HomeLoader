#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\coding\Home_Loader\Compile_Icons\AutoDataUpdate.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <GuiButton.au3>
#include <FontConstants.au3>
#include <File.au3>
#include <GUIConstants.au3>
#include <TrayConstants.au3>
;#include <ComboConstants.au3>
;#include <GDIPlus.au3>
#include <Inet.au3>

#include "_GDIPlus_WTOB.au3"
#include <GDIPlus.au3>

Opt("GUIOnEventMode", 1)

Global $SteamVR_Status, $Title_1, $Title_2, $Handle_1, $Handle_2, $Title_Array_1, $Title_Array_2, $Handle_Array_1, $Handle_Array_2, $NR_Handle_1, $NR_Handle_2
Global $GameStarted, $LOOP_VIVEHOMECheck, $OldWindowExists, $Button_Close_Current_Running, $Checkbox_Show_Settings_at_Startup, $Button_Restart, $Button_Exit
Global $Select_HomeApp_Label, $USE_GUI_Backup, $ApplicationList_Read, $Array_tools_vrmanifest_File, $Line_NR_binary_path_windows, $Line_NR_image_path
Global $Array_tools_vrmanifest_File, $AddShortcut_to_Oculus_GUI, $GUI_Label, $HOMECheck, $State_Reload_HOMEonExit, $WinTitle, $Check_AppId
Global $DesktopWidth, $DesktopHeight, $Width, $Height, $X, $Y, $font_arial, $GUI, $Install_DIR_replaced,$State_Checkbox, $SteamGameID
Global $hImage1_Path, $hImage2_Path, $Check_StringSplit_NR, $Check_Filename_1, $Check_Filename_2, $Check_Filename_3, $Check_Filename, $hBMPBuff, $hGraphic, $hPen
Global $hImage1, $hImage2, $GameNameStarted, $GameStarted_State, $FileLines

Global $Config_INI = @ScriptDir & "\config.ini"
Global $Install_DIR = @ScriptDir & "\"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $Show_Settings_at_Startup = IniRead($Config_INI, "Settings", "Show_Settings_at_Startup", "")
Global $TEMP_StartHomeLoader = IniRead($Config_INI, "TEMP", "StartHomeLoader", "")
Global $TEMP_StartHomeSettings = IniRead($Config_INI, "TEMP", "StartHomeLoaderSettings", "")
Global $USE_FB_GUI = IniRead($Config_INI, "Settings", "USE_GUI", "")
Global $USE_PHP_WebServer = IniRead($Config_INI, "Settings", "USE_PHP_WebServer", "")
Global $ChangeDefaultSteamVRHome = IniRead($Config_INI, "Settings", "ChangeDefaultSteamVRHome", "")
Global $Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "")
Global $Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "false")
Global $Start_HomeLoader_with_HomeApp = IniRead($Config_INI, "Settings", "Start_HomeLoader_with_HomeApp", "false")
Global $StartSteamVRHome = $Install_DIR & "StartSteamVRHome.exe"
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $Time_Interval = IniRead($Config_INI, "Settings", "Time_Interval", "")
Global $Status_Checkbox_Minimize_OVRS = IniRead($Config_INI,"Settings", "Minimize_Oculus", "")
Global $gfx = $Install_DIR & "gfx\"
Global $Icons = $Install_DIR & "Icons\"
Global $JanusVR_Page = $Install_DIR & "WebPage\janusvr\" & "index.html"


Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
Global $ApplicationList_Non_Steam_Appl_INI = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
Global $ApplicationList_Custom_1_INI = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
Global $ApplicationList_Custom_2_INI = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
Global $ApplicationList_Custom_3_INI = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
Global $ApplicationList_Custom_4_INI = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

Global $default_vrsettings_File = IniRead($Config_INI, "Folders", "Steam_default_vrsettings", "")
Global $default_vrsettings_File_Backup = $default_vrsettings_File & ".bak"
Global $default_vrsettings_File_new = $default_vrsettings_File & ".new"

Global $Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
Global $Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
Global $Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
Global $Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
Global $Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

Global $Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
Global $Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
Global $Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")


If $Start_HomeLoader_with_HomeApp = "true" Then
	If WinExists("Home Loader") Then
		Exit
	EndIf
EndIf


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
			_Restart_HomeLoader()
		EndIf
	EndIf
	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
EndIf

Global $Steam_tools_vrmanifest_File = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"

If Not FileExists($Steam_tools_vrmanifest_File) Then
	$Steam_tools_vrmanifest_File = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
EndIf

If Not FileExists($Steam_tools_vrmanifest_File) Then
	$Steam_tools_vrmanifest_File = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
EndIf

If Not FileExists($Steam_tools_vrmanifest_File) Then
	$Steam_tools_vrmanifest_File = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
EndIf

If Not FileExists($Steam_tools_vrmanifest_File) Then
	$Steam_tools_vrmanifest_File = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
EndIf

If Not FileExists($Steam_tools_vrmanifest_File) Then
	$Steam_tools_vrmanifest_File = "C:\Program Files (x86)\Steam\" & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
EndIf

If $Install_DIR = "" Then
	$Install_DIR = @ScriptDir & "\"
	IniWrite($Config_INI, "Settings", "Install_Folder", $Install_DIR)
EndIf

If FileExists($Install_DIR & "WebPage\temp.txt") Then FileDelete($Install_DIR & "WebPage\temp.txt")
_Close_Process()
If $Add_PlayersOnline_to_Icons = "true" Then _Get_ADD_PlayersOnline_DATA()

If $WinName <> "Janus VR" Then
	_MAIN()
EndIf

If $WinName = "Janus VR" Then
	If Not FileExists($JanusVR_Page) Then _Create_JanusVR_Page()
	_MAIN_JanusVR()
EndIf



Func _MAIN()
	Global $LimeGreen = "0x32CD32"
	Global $Blue = "0x00BFFF"
	Global $Yellow = "0xFFFF00"

	$USE_FB_GUI = IniRead($Config_INI, "Settings", "USE_GUI", "")
	$USE_PHP_WebServer = IniRead($Config_INI, "Settings", "USE_PHP_WebServer", "")

	If $USE_PHP_WebServer = "true" Then
		_Close_Process()
		Sleep(500)
		_Start_PHP_WebServer()
	EndIf

	If $USE_FB_GUI = "true" Then
		_Create_GUI()
	EndIf

	If Not ProcessExists("vrmonitor.exe") Then
		ShellExecute("steam://rungameid/250820")
		Do
			Sleep(1000)
		Until ProcessExists("vrmonitor.exe")
	EndIf

	$ChangeDefaultSteamVRHome = IniRead($Config_INI, "Settings", "ChangeDefaultSteamVRHome", "")
	If $ChangeDefaultSteamVRHome <> "true" Then
		ShellExecute($StartSteamVRHome)
	EndIf
	Sleep(2000)

	If $WinName = "" Then
		Sleep(3000)
		$WinName = WinGetTitle("[ACTIVE]")
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", $WinName)
	EndIf


	;_Check_Open_Windows_1()

	Do
		If $USE_FB_GUI = "true" Then
			GUICtrlSetData($GUI_Label, "...Loading...")
			GUISetBkColor($Yellow)
		EndIf

		$Status_Checkbox_Minimize_OVRS = IniRead($config_ini,"Settings", "Minimize_Oculus", "")
		If $Status_Checkbox_Minimize_OVRS = "true" Then
			If WinExists("Oculus") Then WinSetState("Oculus", "", @SW_MINIMIZE)
		EndIf

		If ProcessExists("vrmonitor.exe") or WinExists("SteamVR-Status") or WinExists("SteamVR Status") Then
			Do
				$HOMECheck = "false"
				If WinExists($WinName) Then
					If $Add_PlayersOnline_to_Icons = "true" Then _Get_ADD_PlayersOnline_DATA()
					$HOMECheck = "true"
					TrayTip("Home Loader", "Home app started.", 5, $TIP_ICONASTERISK)
				EndIf
				GUICtrlSetData($GUI_Label, "Home not loaded")
				GUISetBkColor($Yellow)
				Sleep($Time_Interval & "000")
				If Not ProcessExists("vrmonitor.exe") Then _Exit()
				If Not ProcessExists("vrmonitor.exe") Then TrayTip("Home Loader", "SteamVR closed.", 5, $TIP_ICONASTERISK)
			Until WinExists($WinName)

			If $HOMECheck = "true" Then
				If $USE_FB_GUI = "true" Then
					GUICtrlSetData($GUI_Label, $WinName)
					GUISetBkColor($Blue)
				EndIf
				If $USE_FB_GUI = "true" Then WinSetOnTop("Home Loader", "", $WINDOWS_ONTOP)
				Do
					$GameStarted = ""
					Sleep($Time_Interval & "000")
					If $Status_Checkbox_Minimize_OVRS = "true" Then
						If WinExists("Oculus") Then WinSetState("Oculus", "", @SW_MINIMIZE)
					EndIf
					_StartGame_Check()
				Until Not WinExists($WinName)
				;If $USE_FB_GUI = "true" Then WinSetState("Home Loader", "", @SW_DISABLE)
				Sleep(3000)
			Else
				Sleep($Time_Interval & "000")
			EndIf

			;_Check_Open_Windows_2()

			If Not WinExists($WinName) Then
				Sleep(4000)
				_Check_Windows_Title()
			EndIf

			If $GameStarted <> "" and $GameStarted <> "Oculus" and $GameStarted <> "Vive Home" and $GameStarted <> "SteamVR-Status" and $GameStarted <> "SteamVR Status" and $GameStarted <> "SteamVR-Running..." and $OldWindowExists <> "true" and $GameStarted <> "Home Loader" and $GameStarted <> "VR Home" and $GameStarted <> $WinName Then
				If $USE_FB_GUI = "true" Then WinSetOnTop("Home Loader", "", $WINDOWS_ONTOP)
				;_Close_Process()
				Do
					If $USE_FB_GUI = "true" Then
						GUICtrlSetData($GUI_Label, $GameStarted)
						GUISetBkColor($LimeGreen)
					EndIf
					If $Status_Checkbox_Minimize_OVRS = "true" Then
						If WinExists("Oculus") Then WinSetState("Oculus", "", @SW_MINIMIZE)
					EndIf
					Sleep($Time_Interval & "000")
					If Not ProcessExists("vrmonitor.exe") Then _Exit()
					If Not ProcessExists("vrmonitor.exe") Then TrayTip("Home Loader", "SteamVR closed.", 5, $TIP_ICONASTERISK)
				Until Not WinExists($GameStarted)
				If $USE_FB_GUI = "true" Then WinSetState("Home Loader", "", @SW_DISABLE)

				If Not WinExists($GameStarted) Then
					If $Add_PlayersOnline_to_Icons = "true" Then _Get_ADD_PlayersOnline_DATA()
					$State_Reload_HOMEonExit = IniRead($Config_INI, "Settings", "Reload_HOMEonExit", "")
					If $State_Reload_HOMEonExit = "true" Then ShellExecute($Home_Path)
					Sleep(500)
					If FileExists($Install_DIR & "HomeLoader.exe") Then
						ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
					Else
						ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
					EndIf
					IniWrite($Config_INI, "TEMP", "StartHomeLoader", "true")
					Exit
				EndIf
			EndIf
		Else
			$SteamVR_Status = "false"
		EndIf

		If $USE_FB_GUI = "true" Then
			GUICtrlSetData($GUI_Label, $GameStarted & "...Loading...")
			GUISetBkColor($Yellow)
		EndIf
	Until $SteamVR_Status = "false"
EndFunc

Func _MAIN_JanusVR()
	Global $LimeGreen = "0x32CD32"
	Global $Blue = "0x00BFFF"
	Global $Yellow = "0xFFFF00"

	$USE_FB_GUI = IniRead($Config_INI, "Settings", "USE_GUI", "")

	$USE_PHP_WebServer = "true"
	If $USE_PHP_WebServer = "true" Then _Start_PHP_WebServer()

	If $USE_FB_GUI = "true" Then
		_Create_GUI()
	EndIf

	If Not ProcessExists("vrmonitor.exe") Then
		ShellExecute("steam://rungameid/250820")
		Do
			Sleep(1000)
		Until ProcessExists("vrmonitor.exe")
	EndIf

	$ChangeDefaultSteamVRHome = IniRead($Config_INI, "Settings", "ChangeDefaultSteamVRHome", "")
	If $ChangeDefaultSteamVRHome <> "true" Then
		ShellExecute($StartSteamVRHome)
	EndIf
	Sleep(2000)

	If $WinName = "" Then
		Sleep(3000)
		$WinName = WinGetTitle("[ACTIVE]")
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", $WinName)
	EndIf

	Do
		If $USE_FB_GUI = "true" Then
			GUICtrlSetData($GUI_Label, "...Loading...")
			GUISetBkColor($Yellow)
		EndIf

		$Status_Checkbox_Minimize_OVRS = IniRead($config_ini,"Settings", "Minimize_Oculus", "")
		If $Status_Checkbox_Minimize_OVRS = "true" Then
			If WinExists("Oculus") Then WinSetState("Oculus", "", @SW_MINIMIZE)
		EndIf

		If ProcessExists("vrmonitor.exe") or WinExists("SteamVR-Status") or WinExists("SteamVR Status") Then
			$HOMECheck = "true"

			If $HOMECheck = "true" Then
				If $USE_FB_GUI = "true" Then
					GUICtrlSetData($GUI_Label, $WinName)
					GUISetBkColor($Blue)
				EndIf
				If $USE_FB_GUI = "true" Then WinSetOnTop("Home Loader", "", $WINDOWS_ONTOP)
				Do
					$GameStarted = ""
					Sleep($Time_Interval & "000")
					If $Status_Checkbox_Minimize_OVRS = "true" Then
						If WinExists("Oculus") Then WinSetState("Oculus", "", @SW_MINIMIZE)
					EndIf
					_StartGame_Check()
					Sleep(2000)
				Until Not WinExists($WinName)
				If $USE_FB_GUI = "true" Then WinSetState("Home Loader", "", @SW_DISABLE)
				Sleep(1000)
			Else
				Sleep($Time_Interval & "000")
			EndIf

		If $USE_FB_GUI = "true" Then
			GUICtrlSetData($GUI_Label, $GameStarted & "...Loading...")
			GUISetBkColor($Yellow)
		EndIf

		;_Close_Process()

		_Restart_HomeLoader()
		EndIf
	Until $SteamVR_Status = "false"
EndFunc

Func _Create_GUI()
	$DesktopWidth = @DesktopWidth / 2
	$DesktopHeight = @DesktopHeight

	$Width = $DesktopWidth - 118
	$Height = $DesktopHeight - 5

	$X = $Width
	$Y = $DesktopHeight - $Height

	$font_arial = "arial"

	$SteamVR_Status = "true"

	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	$GUI = GUICreate("Home Loader", 320, 65, $X, $Y, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))  ; $WS_EX_TOPMOST
	GUISetIcon(@AutoItExe, -2, $GUI)
	GUISetBkColor($Yellow)

	$GUI_Label = GUICtrlCreateLabel("...Loading...", 80, 26, 127, 20)
	GUICtrlSetFont(-1, 11, 600, 2, $font_arial, 2)
	GUISetBkColor($Yellow)

	Global $Button_Close_Current_Running = GUICtrlCreateButton("Close current running APP", 65, 0, 190, 23, $BS_BITMAP)
	GUICtrlSetFont(-1, 9, 600, 2, $font_arial, 2)
	GUICtrlSetColor(-1, "0x00008B")
	GUICtrlSetOnEvent($Button_Close_Current_Running, "_Close_CurrentRunning")

	Global $State_Checkbox_Show_Settings_at_Startup = IniRead($config_ini,"Settings", "Show_Settings_at_Startup", "")
	Global $Checkbox_Show_Settings_at_Startup = GUICtrlCreateCheckbox(" Show Settings at Startup", 67, 45, 180, 20) ; 430
		If $State_Checkbox_Show_Settings_at_Startup = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
	GUICtrlSetOnEvent($Checkbox_Show_Settings_at_Startup, "_Checkbox_Show_Settings_at_Startup")

	Global $Button_Restart = GUICtrlCreateButton("Restart", 0, 0, 65, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Restart, $gfx & "Restart.bmp")
	GUICtrlSetOnEvent($Button_Restart, "_Restart_HomeLoader")

	Global $Button_Exit = GUICtrlCreateButton("Exit", 255, 0, 65, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Exit, $gfx & "Exit.bmp")
	GUICtrlSetOnEvent($Button_Exit, "_Exit")

	GUISetState(@SW_SHOW, $GUI)
	WinActivate($WinName)
EndFunc

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

Func _Start_PHP_WebServer()
	If Not FileExists($Install_DIR & "\php\StartPHP.bat") Then
		FileWrite($Install_DIR & "\php\StartPHP.bat", "php -S localhost:8000 -t " & $Install_DIR & @CRLF & _
														"pause")
	EndIf
	Run($Install_DIR & "\php\StartPHP.bat", $Install_DIR & "\php\", "", @SW_HIDE)
EndFunc

Func _Checkbox_Show_Settings_at_Startup()
	$State_Checkbox = GUICtrlRead($Checkbox_Show_Settings_at_Startup)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Show_Settings_at_Startup", "true")
		IniWrite($config_ini, "Settings", "USE_GUI", "true")
		GUICtrlSetState($Checkbox_Show_Settings_at_Startup, $GUI_CHECKED)
		_Restart_HomeLoader()
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Show_Settings_at_Startup", "false")
	EndIf
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
		Global $Application_name = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "name", "")
		Local $Application_installdir = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "installdir", "")
		Local $Application_IconPath = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "IconPath", "")

		TrayTip("Home Loader", "App started: " & @CRLF & $Application_name, 5, $TIP_ICONASTERISK)

		GUICtrlSetData($GUI_Label, $Application_name)
		GUISetBkColor($Blue)


		If StringLeft($Application_appid, 2) <> "HL" Then
			If WinExists("Janus VR") Then WinClose("Janus VR")
			If WinExists($WinName) Then WinClose($WinName)
			If $Add_SS_per_game = "true" Then _Add_SS_to_SteamVR()
			ShellExecuteWait("steam://rungameid/" & $SteamGameID)
		Else
			If WinExists("Janus VR") Then WinClose("Janus VR")
			If WinExists($WinName) Then WinClose($WinName)
			If $Add_SS_per_game = "true" Then _Add_SS_to_SteamVR()
			ShellExecuteWait($Application_installdir)
		EndIf

		Sleep(4000)
		$GameStarted_State = "true"
		$GameNameStarted = WinGetTitle("[ACTIVE]")
		If FileExists($Install_DIR & "WebPage\temp.txt") Then FileDelete($Install_DIR & "WebPage\temp.txt")
		Do
			GUICtrlSetData($GUI_Label, $GameNameStarted)
			GUISetBkColor($Blue)
			Sleep(2000)
			If Not WinExists($GameNameStarted) Then $GameStarted_State = "false"
		Until $GameStarted_State = "false"


		$State_Reload_HOMEonExit = IniRead($Config_INI, "Settings", "Reload_HOMEonExit", "")
		;If $State_Reload_HOMEonExit = "true" Then
			IniWrite($Config_INI, "TEMP", "StartHomeLoader", "true")
			If FileExists($Install_DIR & "HomeLoader.exe") Then
				ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
			Else
				ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
			EndIf
		;EndIf
		If FileExists($Install_DIR & "WebPage\temp.txt") Then FileDelete($Install_DIR & "WebPage\temp.txt")
		Sleep(3000)
		;_Check_Windows_Title()
		Exit
	EndIf
EndFunc

Func _Check_Open_Windows_1()
    ; Retrieve a list of window handles.
	Global $Title_1
	Global $Handle_1
    Local $aList = WinList()

    ; Loop through the array displaying only visable windows with a title.
    For $i = 1 To $aList[0][0]
        If $aList[$i][0] <> "" And BitAND(WinGetState($aList[$i][1]), 2) Then
			$Title_1 = $Title_1 & "," & $aList[$i][0]
			$Handle_1 = $Handle_1 & "," & $aList[$i][1]
        EndIf
    Next

	$Title_1 = StringTrimLeft($Title_1, "1")
	$Handle_1 = StringTrimLeft($Handle_1, "1")
	$Title_Array_1 = StringSplit($Title_1, ',')
	$Handle_Array_1 = StringSplit($Handle_1, ',')

	$NR_Handle_1 = $Handle_Array_1[0]
EndFunc

Func _Check_Open_Windows_2()
    ; Retrieve a list of window handles.
	Global $Title_2
	Global $Handle_2
    Local $aList = WinList()

    ; Loop through the array displaying only visable windows with a title.
    For $i = 1 To $aList[0][0]
        If $aList[$i][0] <> "" And BitAND(WinGetState($aList[$i][1]), 2) Then
			$Title_2 = $Title_2 & "," & $aList[$i][0]
			$Handle_2 = $Handle_2 & "," & $aList[$i][1]
        EndIf
    Next

	$Title_2 = StringTrimLeft($Title_2, "1")
	$Handle_2 = StringTrimLeft($Handle_2, "1")
	$Title_Array_2 = StringSplit($Title_2, ',')
	$Handle_Array_2 = StringSplit($Handle_2, ',')

	$NR_Handle_2 = $Handle_Array_2[0]
EndFunc

Func _Check_Windows_Title()
	Opt("WinTitleMatchMode",4)
	$WinTitle = WinGetTitle("[ACTIVE]")
	WinActivate($WinTitle)
	$GameStarted = $WinTitle
	TrayTip("Home Loader", "App started: " & @CRLF & $GameStarted, 5, $TIP_ICONASTERISK)
EndFunc


Func _Get_ADD_PlayersOnline_DATA()
	Local $FileList = _FileListToArray($Icons , "*.jpg" , 1)

	If $FileList <> "" Then
		For $NR = 1 To $FileList[0]
			$Check_AppId = StringReplace($FileList[$NR], 'steam.app.', '')
			$Check_AppId = StringReplace($Check_AppId, '.jpg', '')

			Local $sHTML = _INetGetSource('https://steamdb.info/app/' & $Check_AppId & '/graphs/')

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

				Local $NR_Apps = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "NR", "")

				IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "right_now", $PlayersOnline_right_now)
				IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "24h_peak", $PlayersOnline_24h_peak)
				IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "all_time_peak", $PlayersOnline_all_time_peak)

				IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR_Apps, "right_now", $PlayersOnline_right_now)
				IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR_Apps, "24h_peak", $PlayersOnline_24h_peak)
				IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR_Apps, "all_time_peak", $PlayersOnline_all_time_peak)

				_Write_PO_TEXT_2_Image()
				_Write_PO_Image_2_Image()
				_Copy_Icon_2_Icon_Folder()

				$PlayersOnline_right_now = ""
				$PlayersOnline_24h_peak = ""
				$PlayersOnline_all_time_peak = ""
				$Check_AppId = ""
			EndIf
		Next
	EndIf
EndFunc

Func _Write_PO_TEXT_2_Image()
	_GDIPlus_Startup()
	Global $hImage = _GDIPlus_WTOB($gfx & "PlayersOnline.jpg", $PlayersOnline_right_now, "Arial", 45, -1, 3, 0, 0,  0x00CCFF, 1, 1)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()

	If FileExists(@ScriptDir & "\" & "WTOB.png") Then
		FileCopy(@ScriptDir & "\" & "WTOB.png", @ScriptDir & "\PlayersOnline" & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		FileDelete(@ScriptDir & "\" & "WTOB.png")
	EndIf
EndFunc

Func _Write_PO_Image_2_Image()
	Global $ImageSizeX = 460, $ImageSizeY = 215
	Global $FAVImageSizeX = 60, $FAVImageSizeY = 60

	$hImage1_Path = $Icons & "steam.app." & $Check_AppId & ".jpg"
	$hImage2_Path = @ScriptDir & "\" & "PlayersOnline.jpg"

	$Check_StringSplit_NR = StringInStr($hImage1_Path, "/", "", -1)
	If $Check_StringSplit_NR = "0" Then $Check_StringSplit_NR = StringInStr($hImage1_Path, "\", "", -1)
	$Check_Filename_1 = StringTrimLeft($hImage1_Path, $Check_StringSplit_NR)
	$Check_Filename_2 = StringRight($Check_Filename_1, 11)
	$Check_Filename = $Check_Filename_1

	GUISetState()

	_GDIPlus_Startup()
	$hImage1 = _GDIPlus_ImageLoadFromFile($hImage1_Path)
	$hImage2 = _GDIPlus_ImageLoadFromFile($hImage2_Path)

	$hBMPBuff = _GDIPlus_ImageLoadFromFile($hImage1_Path)
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hBMPBuff)

	;Graphics here
	_GDIPlus_GraphicsClear($hGraphic, 0xFFE8FFE8)

	$hPen = _GDIPlus_PenCreate(0xFFFF0000, 3)

	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage1, 0, 0, $ImageSizeX, $ImageSizeY)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage2, 3, 3, $FAVImageSizeX, $FAVImageSizeY)

	_GDIPlus_GraphicsDrawRect($hGraphic, 1, 1, 60 + 3, 60 + 3, $hPen); $hPen 3 pixels thick

	GUIRegisterMsg(0xF, "MY_PAINT"); Register PAINT-Event 0x000F = $WM_PAINT (WindowsConstants.au3)
	GUIRegisterMsg(0x85, "MY_PAINT") ; $WM_NCPAINT = 0x0085 (WindowsConstants.au3)Restore after Minimize.

	;Save composite image
	Local $sNewName = $Icons & "460x215\" & $Check_Filename
	Global $NewIcon_Path = $sNewName

	_GDIPlus_ImageSaveToFile($hBMPBuff, $NewIcon_Path) ; $hBMPBuff the bitmap

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
	FileDelete(@ScriptDir & "\PlayersOnline" & ".jpg")
    _GDIPlus_PenDispose($hPen)
    _GDIPlus_ImageDispose($hImage1)
    _GDIPlus_ImageDispose($hImage2)
    _GDIPlus_GraphicsDispose($hGraphic)
    _WinAPI_DeleteObject($hBMPBuff)
    _GDIPlus_Shutdown()
EndFunc

Func _Copy_Icon_2_Icon_Folder()
	If $Icon_Folder_1 <> "" Then FileCopy($NewIcon_Path, $Icon_Folder_1 & $Check_AppId & "_header" & ".jpg", $FC_OVERWRITE)
	If $Icon_Folder_2 <> "" Then FileCopy($NewIcon_Path, $Icon_Folder_2 & $Check_AppId & "_header" & ".jpg", $FC_OVERWRITE)
	If $Icon_Folder_3 <> "" Then FileCopy($NewIcon_Path, $Icon_Folder_3 & $Check_AppId & "_header" & ".jpg", $FC_OVERWRITE)

	If $Icon_Folder_1 = "" And $Icon_Folder_2 = "" And $Icon_Folder_3 = "" Then
		MsgBox(4, "", "You need at least one Icon Folder path." & @CRLF & "Go to settings menu and enter an Icon path.")
	EndIf
EndFunc

Func _Add_SS_to_SteamVR()
	If Not FileExists($default_vrsettings_File_Backup) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_Backup, $FC_OVERWRITE)

	Local $Steam_app_Name = $Application_name
	Local $Game_ID = $SteamGameID

	$FileLines = _FileCountLines($default_vrsettings_File)

	Local $renderTargetMultiplier_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "renderTargetMultiplier", "")
	Local $supersampleScale_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "supersampleScale", "")
	Local $allowSupersampleFiltering_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "allowSupersampleFiltering", "")

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
	If Not FileExists($default_vrsettings_File) Then FileCopy($default_vrsettings_File_Backup, $default_vrsettings_File, $FC_OVERWRITE)
EndFunc


Func _Close_CurrentRunning()
	WinClose($GameStarted)
	_Restart_HomeLoader()
	If WinExists($WinName) Then WinActivate($WinName)
	Exit
EndFunc

Func _Close_Process()
	If ProcessExists("cmd.exe") Then
		Do
			ProcessClose("cmd.exe")
		Until Not ProcessExists("cmd.exe")
	EndIf

	If ProcessExists("php.exe") Then
		Do
			ProcessClose("php.exe")
		Until Not ProcessExists("php.exe")
	EndIf

	If ProcessExists("conhost.exe") Then
		Do
			ProcessClose("conhost.exe")
		Until Not ProcessExists("conhost.exe")
	EndIf
EndFunc

Func _Restart_HomeLoader()
	IniWrite($Config_INI, "TEMP", "StartHomeLoader", "true")
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
	EndIf
	Exit
EndFunc

Func _Exit()
	If $USE_PHP_WebServer = "true" Then
		If Not ProcessExists("vrmonitor.exe") Then
			_Close_Process()
		EndIf
	EndIf
	Exit
EndFunc
