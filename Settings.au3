
#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <GuiButton.au3>
#include <FontConstants.au3>
#include <File.au3>
#include <GUIConstants.au3>

Opt("GUIOnEventMode", 1)

Global $font_arial = "arial"

#Region Declare Globals
Global $SteamVR_Status, $Title_1, $Title_2, $Handle_1, $Handle_2, $Title_Array_1, $Title_Array_2, $Handle_Array_1, $Handle_Array_2, $NR_Handle_1, $NR_Handle_2
Global $GameStarted, $LOOP_VIVEHOMECheck, $OldWindowExists, $Button_Close_Current_Running, $Checkbox_Show_Settings_at_Startup, $Button_Restart, $Button_Exit
Global $Select_HomeApp_Label, $USE_GUI_Backup, $ApplicationList_Read, $Array_tools_vrmanifest_File, $Line_NR_binary_path_windows, $Line_NR_image_path
Global $Array_tools_vrmanifest_File, $AddShortcut_to_Oculus_GUI, $Add_Other_GUI
#endregion

#Region Variables
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
Global $Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")

Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
Global $ApplicationList_Non_Steam_Appl_INI = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
Global $ApplicationList_Custom_1_INI = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
Global $ApplicationList_Custom_2_INI = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
Global $ApplicationList_Custom_3_INI = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
Global $ApplicationList_Custom_4_INI = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
Global $Steam_Path = StringReplace($Steam_Path_REG, '/', '\') & "\"

Global $HTCVive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\HTC\HTC Vive\', "ViveHelperPath")
Global $HTCVive_Path_StringReplace_1 = StringReplace($HTCVive_Path_REG, 'PCClient\HTCVRMarketplaceUserContextHelper.exe', '')
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
#endregion


_First_Start_Empty_Check_1()


If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK, $FC_OVERWRITE)
If $default_vrsettings_File = "" Then MsgBox(48, "Attention!", "Default.vrsettings File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")

If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK, $FC_OVERWRITE)
If $Steam_tools_vrmanifest_File = ""  Then MsgBox(48, "Attention!", "Tools.vrmanifest File not found. Write the path to the File manually to the config.ini File in Home Loader folder.")

If $First_Start = "true" Then
	If Not FileExists($Install_DIR & "Backups\default.vrsettings") Then FileCopy($default_vrsettings_File, $Install_DIR & "Backups\default.vrsettings", $FC_OVERWRITE)
	If Not FileExists($Install_DIR & "Backups\tools.vrmanifest") Then FileCopy($Steam_tools_vrmanifest_File, $Install_DIR & "Backups\tools.vrmanifest", $FC_OVERWRITE)
	_FirstStart_Restart()
EndIf

If $First_Start = "Settings" Then
	MsgBox(48, "First Start", "This is your first start of the program. " & @CRLF & @CRLF & _
							"Choose your Home APP, continiue using by the HomeLoaderLibrary or Start SteamVR." & @CRLF & @CRLF & _
							"Optional it is possible to switch to the 'Advanced mode' and use the other functions.")
	IniWrite($Config_INI, "Settings", "First_Start", "false")
EndIf


_StartUp_settings()


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
			MsgBox(0, "Steam folder", "Steam folder was not found." & @CRLF & _
							"Choose the folder before continue." & @CRLF)

			Local $FileSelectFolder = FileSelectFolder("Choose Steam folder", $Install_Folder_Steam_Search_Folder & "\")
			If $FileSelectFolder <> "" Then
				IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $FileSelectFolder & "\")
			Else
				MsgBox(48, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
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
				MsgBox(0, "Default.vrsettings File", "Default.vrsettings File not found." & @CRLF & _
					"Choose the File before continue." & @CRLF)

				Local $FileSelect = FileOpenDialog("Default.vrsettings File", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
				If $FileSelect <> "" Then
					IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $FileSelect)
				Else
					MsgBox(48, "Attention!", "Default.vrsettings File" & @CRLF & @CRLF & "Search the File and write the path manually to the config.igi File or try again.")
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
				MsgBox(0, "Tools.vrmanifest File", "Tools.vrmanifest File not found." & @CRLF & _
					"Choose the File before continue." & @CRLF)

				Local $FileSelect = FileOpenDialog("Tools.vrmanifest File", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
				If $FileSelect <> "" Then
					IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $FileSelect)
				Else
					MsgBox(48, "Attention!", "Tools.vrmanifest File" & @CRLF & @CRLF & "Search the File and write the path manually to the config.igi File or try again.")
					IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
					_Restart()
				EndIf
			EndIf
		EndIf
	EndIf
EndFunc
#endregion

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
	If $Advanced_Settings = "true" Then
		Global $HEIGHT_GUI = 469
		Global $POS_X = 10
		Global $POS_Y_Button_Close = 335
		Global $POS_Y_Button_StartSteamVR = 370
		Global $POS_Y_Button_Start_HomeLoaderLibrary = 405
		Global $POS_X_Advanced_Settings_Label = 10
		Global $POS_Y_Advanced_Settings_Label = 129
		Global $Advanced_Settings_img = $gfx & "Advanced_Settings_UP.bmp"
		Global $ToolTip_Advanced_Settings = "Closes Advanced Settings options."
	Else
		Global $HEIGHT_GUI = 269
		Global $POS_X = 10000
		Global $POS_Y_Button_Close = 135
		Global $POS_Y_Button_StartSteamVR = 170
		Global $POS_Y_Button_Start_HomeLoaderLibrary = 205
		Global $POS_X_Advanced_Settings_Label = 82
		Global $POS_Y_Advanced_Settings_Label = 108
		Global $Advanced_Settings_img = $gfx & "Advanced_Settings_DOWN.bmp"
		Global $ToolTip_Advanced_Settings = "Opens Advanced Settings options."
	EndIf

	If $Show_Settings_at_Startup = "First Start" Then IniWrite($Config_INI, "Settings", "Show_Settings_at_Startup", "")
    Global $GUI_StartUp_settings = GUICreate("Home Loader - Settings", 250, $HEIGHT_GUI, -1, -1, $WS_EX_TOPMOST)
	GUISetIcon(@AutoItExe, -2, $GUI_StartUp_settings)
    GUISetState(@SW_SHOW, $GUI_StartUp_settings)

	Global $font_StartUp_arial = "arial"

	GUICtrlCreateGroup("Home app:", 5, 5, 235, 100)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)

	Global $StartUp_Radio_1 = GUICtrlCreateRadio("SteamVR", 10, 25, 75, 20) ; Vive Home
		GuiCtrlSetTip(-1, "Sets SteamVR as SteamVR Home App.")
		If $WinName = "SteamVR Home" Then GUICtrlSetState($StartUp_Radio_1, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_1, "_StartUp_Radio_1")

	Global $StartUp_Radio_2 = GUICtrlCreateRadio("Vive Home", 90, 25, 70, 20) ; VR Home
		GuiCtrlSetTip(-1, "Sets Vive Home as SteamVR Home App.")
		If $WinName = "Vive Home" Then GUICtrlSetState($StartUp_Radio_2, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_2, "_StartUp_Radio_2")

	Global $StartUp_Radio_3 = GUICtrlCreateRadio("JanusVR", 170, 25, 65, 20) ; SteamVR
		GuiCtrlSetTip(-1, "Sets JanusVR as SteamVR Home App.")
		If $WinName = "Janus VR" Then GUICtrlSetState($StartUp_Radio_3, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_3, "_StartUp_Radio_3")

	Global $StartUp_Radio_4 = GUICtrlCreateRadio("VR Toolbox", 10, 47, 75, 20) ; VR Toolbox
		GuiCtrlSetTip(-1, "Sets VR Toolbox as SteamVR Home App.")
		If $WinName = "VR Toolbox" Then GUICtrlSetState($StartUp_Radio_4, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_4, "_StartUp_Radio_4")

	Global $StartUp_Radio_5 = GUICtrlCreateRadio("Other", 90, 47, 45, 20) ; JanusVR
	GuiCtrlSetTip(-1, "Sets any other Apllication as SteamVR Home App.")
		If $WinName <> "Vive Home" And $WinName <> "VR Home" And $WinName <> "VR Toolbox" And $WinName <> "Janus VR" And $WinName <> "SteamVR Home" And $Home_Path <> "" Then GUICtrlSetState($StartUp_Radio_5, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_5, "_StartUp_Radio_5")


	Global $Button_Restore_DefaultSteamVRHome = GUICtrlCreateButton("Restore Default SteamVR Home Path", 10, 73, 223, 25)
		GuiCtrlSetTip(-1, "Restores the SteamVR Home Path using the Backup Files.")
		GUICtrlSetOnEvent($Button_Restore_DefaultSteamVRHome, "_Restore_Default_SteamVR_Home")


	Global $GUI_Button_Advanced_Settings= GUICtrlCreateButton("", 224, 107, 16, 22, $BS_BITMAP)
		_GUICtrlButton_SetImage($GUI_Button_Advanced_Settings, $Advanced_Settings_img)
		GuiCtrlSetTip(-1, $ToolTip_Advanced_Settings)
		GUICtrlSetOnEvent($GUI_Button_Advanced_Settings, "_GUI_Button_Advanced_Settings")


	GUICtrlCreateLabel("Advanced Settings:", $POS_X_Advanced_Settings_Label, $POS_Y_Advanced_Settings_Label, 142, 35)
	GUICtrlSetFont(-1, 12, 400, 6, "arial")


	GUICtrlCreateGroup("Home Loader Settings:", $POS_X - 5, 150, 235, 107)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)


	$State_Checkbox_Add_PlayersOnline_to_Icons = IniRead($config_ini,"Settings", "Add_PlayersOnline_to_Icons", "")
	Global $Checkbox_Add_PlayersOnline_to_Icons = GUICtrlCreateCheckbox(" Add Players Online to Icons", $POS_X, 170, 220, 20)
		GuiCtrlSetTip(-1, "If activated it will check the number of Players that are" & @CRLF & "currently playing the game and write it on top of the Icon.")
		If $State_Checkbox_Add_PlayersOnline_to_Icons = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Add_PlayersOnline_to_Icons, "_Checkbox_Add_PlayersOnline_to_Icons")

	$State_Checkbox_Add_SS_to_Icons = IniRead($config_ini,"Settings", "Add_SS_to_Icons", "")
	Global $Checkbox_Add_SS_to_Icons = GUICtrlCreateCheckbox(" Add Supersampling to Icons", $POS_X, 190, 220, 20)
		GuiCtrlSetTip(-1, "If activated it will check the saved Supersampling settings" & @CRLF & "for each game and adds it on top of the Icon.")
		If $State_Checkbox_Add_SS_to_Icons = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Add_SS_to_Icons, "_Checkbox_Add_SS_to_Icons")

	$State_Checkbox_Add_SS_per_game = IniRead($config_ini,"Settings", "Add_SS_per_game", "")
	Global $Checkbox_Add_SS_per_game = GUICtrlCreateCheckbox(" Automaticly add SS per game", $POS_X, 210, 220, 20)
		GuiCtrlSetTip(-1, "If activated it will check the saved Supersampling settings" & @CRLF & "for the current loaded game and adds these value to SteamVR.")
		If $State_Checkbox_Add_SS_per_game = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Add_SS_per_game, "_Checkbox_Add_SS_per_game")

	Global $Button_Restore_SteamVR_Settings = GUICtrlCreateButton("Restore SteamVR Settings", $POS_X, 230, 223, 20)
		GuiCtrlSetTip(-1, "Restores the SteamVR Settings." & @CRLF & @CRLF & "It will Restore the following Files:" & @CRLF & "- default.vrsettings" & @CRLF & "- tools.vrmanifest")
		GUICtrlSetOnEvent($Button_Restore_SteamVR_Settings, "_Button_Restore_SteamVR_Settings")


	GUICtrlCreateGroup("Oculus Home:", $POS_X - 5, 258, 235, 73)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)

	$State_Checkbox_Minimize_Oculus = IniRead($config_ini,"Settings", "Minimize_Oculus", "")
	Global $Checkbox_Minimize_Oculus = GUICtrlCreateCheckbox(" Minimize Oculus Shop", $POS_X, 277, 170, 20)
		GuiCtrlSetTip(-1, "If activated it will automatically minimize Oculus Home Window if it is detected.")
		If $State_Checkbox_Minimize_Oculus = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Minimize_Oculus, "_Checkbox_Minimize_Oculus")

	Global $Button_Add_Shortcut_2_OH = GUICtrlCreateButton("Add 'Home App' Shortcut to Oculus Home", $POS_X, 298, 223, 25)
		GuiCtrlSetTip(-1, "Creates an new '.exe' File/Shortcut for use as Oculus Home Shortcut." & @CRLF & "This new File can be used as an replacement for any executable of an free Oculus Rift game." & @CRLF & "With that new Shortcut it is possibel to Start Steam VR [or the selected Home App] from within Oculus Home.")
		GUICtrlSetOnEvent($Button_Add_Shortcut_2_OH, "_Button_Add_Shortcut_2_OH")

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
	;Global $State_StartUp_Radio_6 = GUICtrlRead($StartUp_Radio_6)

	Global $Button_Start_HomeLoader = GUICtrlCreateButton("Start SteamVR", 5, $POS_Y_Button_StartSteamVR, 235, 30)
		GuiCtrlSetTip(-1, "Starts SteamVR." & @CRLF & @CRLF & "Depending on the settings [Normal Mode or Advanced mode]" & @CRLF & _
							"it will also automaticly start 'HomeLoader.exe' File.")
		GUICtrlSetFont(-1, 14, 600, 2, $font_StartUp_arial)
		GUICtrlSetColor(-1, "0x006600")
		GUICtrlSetOnEvent($Button_Start_HomeLoader, "_Button_Start_HomeLoader")


	Global $Button_Start_HomeLoaderLibrary = GUICtrlCreateButton("Home Loader Library", 5, $POS_Y_Button_Start_HomeLoaderLibrary, 235, 30, $BS_BITMAP)
		If FileExists($ApplicationList_SteamLibrary_ALL_INI) Then _GUICtrlButton_SetImage($Button_Start_HomeLoaderLibrary, $gfx & "HomeLoaderLibrary.bmp")
		If Not FileExists($ApplicationList_SteamLibrary_ALL_INI) Then _GUICtrlButton_SetImage($Button_Start_HomeLoaderLibrary, $gfx & "ScanHomeLoaderLibrary_first.bmp")
		GuiCtrlSetTip(-1, "Starts Home Loader Library.")
		GUICtrlSetOnEvent($Button_Start_HomeLoaderLibrary, "_Button_Start_HomeLoaderLibrary")

	If $State_StartUp_Radio_1 <> "4" Or $State_StartUp_Radio_2 <> "4" Or $State_StartUp_Radio_3 <> "4" Or $State_StartUp_Radio_4 <> "4" Or $State_StartUp_Radio_5 <> "4" Then
		GUICtrlSetState($Button_Start_HomeLoader, $GUI_SHOW)
	Else
		GUICtrlSetState($Button_Start_HomeLoader, $GUI_HIDE)
		Global $Select_HomeApp_Label = GUICtrlCreateLabel("Select Home App first", 18, $POS_Y_Button_StartSteamVR + 2, 235, 25)
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
	;$State_StartUp_Radio_6 = GUICtrlRead($StartUp_Radio_6)

	If $State_StartUp_Radio_1 <> "4" Or $State_StartUp_Radio_2 <> "4" Or $State_StartUp_Radio_3 <> "4" Or $State_StartUp_Radio_4 <> "4" Or $State_StartUp_Radio_5 <> "4" Then
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

	Global $Button_Exit_Add_Other_GUI = GUICtrlCreateButton("Exit", 275, 125, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_Add_Other_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

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

Func _StartUp_Radio_1() ; SteamVR Home
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

Func _StartUp_Radio_2() ; Vive Home
	If FileExists($HTCVive_Path & "Updater\App\Home\win32\ViveHome.exe") Then
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $HTCVive_Path & "ViveSetup\Updater\App\Home\win32\ViveHome.exe")
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

Func _StartUp_Radio_3() ; Janus VR
	Global $JanusVR_Path = ""
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

Func _StartUp_Radio_5() ; Other
	_StartUp_Add_Other_GUI()
EndFunc

Func _StartUp_Radio_0() ; VR Home
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

Func _Button_Delete_Backup_SteamVR_Files()
	If FileExists($ApplicationList_SteamLibrary_ALL_INI) Then
		Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		Local $APP_GameName = "Choose APP."

		For $Loop_NR = 1 To $NR_Applications
			$Check_GameName = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_NR, "name", "")
			If $Check_GameName <> "" Then
				$APP_GameName = $APP_GameName & "|" & $Check_GameName
			EndIf
		Next

		If $APP_GameName <> "" Then
			GUICtrlSetData(-1, $APP_GameName, "Choose APP.")
			GUICtrlSetFont(-1, 8, 400, 2, "arial")
		EndIf
	Else
		Local $APP_GameName = "Scan Library first"
		GUICtrlSetData(-1, $APP_GameName, "Scan Library first")
		GUICtrlSetFont(-1, 8, 400, 2, "arial")
	EndIf

EndFunc

Func _GUI_Button_Advanced_Settings()
	$State_Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
	If $State_Advanced_Settings = "true" Then
		$NEW_State_Advanced_Settings = "false"
		IniWrite($Config_INI, "Settings", "Advanced_Settings", $NEW_State_Advanced_Settings)
		_GUICtrlButton_SetImage($GUI_Button_Advanced_Settings, $gfx & "Advanced_Settings_UP.bmp")
		IniWrite($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "false")
		IniWrite($Config_INI, "Settings", "Add_SS_to_Icons", "false")
		IniWrite($Config_INI, "Settings", "Add_SS_per_game", "false")
		IniWrite($Config_INI, "Settings", "Start_HomeLoader_with_HomeApp", "false")
		IniWrite($Config_INI, "Settings", "Minimize_Oculus", "false")
		IniWrite($Config_INI, "Settings", "USE_PHP_WebServer", "false")
		IniWrite($Config_INI, "Folders", "Icon_Folder_1", "")
		IniWrite($Config_INI, "Folders", "Icon_Folder_2", "")
		IniWrite($Config_INI, "Folders", "Icon_Folder_3", "")
		GUICtrlSetState($Checkbox_Add_PlayersOnline_to_Icons, $GUI_CHECKED)
		GUICtrlSetState($Checkbox_Add_SS_to_Icons, $GUI_CHECKED)
		GUICtrlSetState($Checkbox_Add_SS_per_game, $GUI_CHECKED)
		GUICtrlSetState($Checkbox_Minimize_Oculus, $GUI_CHECKED)
	Else
		$NEW_State_Advanced_Settings = "true"
		IniWrite($Config_INI, "Settings", "Advanced_Settings", $NEW_State_Advanced_Settings)
		_GUICtrlButton_SetImage($GUI_Button_Advanced_Settings, $gfx & "Advanced_Settings_DOWN.bmp")
		IniWrite($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "true")
		IniWrite($Config_INI, "Settings", "Add_SS_to_Icons", "true")
		IniWrite($Config_INI, "Settings", "Add_SS_per_game", "true")
		IniWrite($Config_INI, "Settings", "Start_HomeLoader_with_HomeApp", "true")
		IniWrite($Config_INI, "Settings", "Minimize_Oculus", "true")
		GUICtrlSetState($Checkbox_Add_PlayersOnline_to_Icons, "false")
		GUICtrlSetState($Checkbox_Add_SS_to_Icons, "false")
		GUICtrlSetState($Checkbox_Add_SS_per_game, "false")
		GUICtrlSetState($Checkbox_Minimize_Oculus, "false")
	EndIf
	_Restart()
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

Func _Checkbox_Add_PlayersOnline_to_Icons()
	$State_Checkbox = GUICtrlRead($Checkbox_Add_PlayersOnline_to_Icons)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Add_PlayersOnline_to_Icons", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Add_PlayersOnline_to_Icons", "false")
	EndIf
EndFunc

Func _Checkbox_Add_SS_to_Icons()
	$State_Checkbox = GUICtrlRead($Checkbox_Add_SS_to_Icons)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Add_SS_to_Icons", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Add_SS_to_Icons", "false")
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

Func _Button_Restore_SteamVR_Settings()
	Local $Abfrage = MsgBox(4, "Attention!", "This function will delete the following Files and create new ones:" & @CRLF & _
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
			MsgBox(0, "Finished", "New Files successfully created/restored.", 4)
		Else
			MsgBox(48, "Error", "Something went wrong, new Files not created.")
		EndIf
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

Func _Button_Exit_Add_Other_GUI()
	GUIDelete($Add_Other_GUI)
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

Func _Button_Start_HomeLoaderLibrary()
	If FileExists($Install_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($Install_DIR & "HomeLoaderLibrary.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoaderLibrary.au3", "", $Install_DIR)
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

Func _FirstStart_Restart()
	If FileExists($Install_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($Install_DIR & "HomeLoaderLibrary.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoaderLibrary.au3", "", $Install_DIR)
	EndIf
	Exit
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
