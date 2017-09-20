
#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <GuiButton.au3>
#include <FontConstants.au3>
#include <File.au3>
#include <GUIConstants.au3>
#include <InetConstants.au3>
#include "_Zip.au3"


Opt("GUIOnEventMode", 1)

Global $font_arial = "arial"

#Region Declare Globals
Global $SteamVR_Status, $Title_1, $Title_2, $Handle_1, $Handle_2, $Title_Array_1, $Title_Array_2, $Handle_Array_1, $Handle_Array_2, $NR_Handle_1, $NR_Handle_2
Global $GameStarted, $LOOP_VIVEHOMECheck, $OldWindowExists, $Button_Close_Current_Running, $Checkbox_Show_Settings_at_Startup, $Button_Restart, $Button_Exit
Global $Select_HomeApp_Label, $USE_GUI_Backup, $ApplicationList_Read, $Array_tools_vrmanifest_File, $Line_NR_binary_path_windows, $Line_NR_image_path
Global $Array_tools_vrmanifest_File, $AddShortcut_to_Oculus_GUI, $Add_Other_GUI, $bookmarksArray, $settingsArray, $StartSteamVRHome_x
Global $ZipFile, $ZipSplit
#endregion

#Region Variables
Global $Config_INI = @ScriptDir & "\config.ini"
Global $Version = "0.62"
Global $Auto_CheckUpdates = IniRead($Config_INI, "Settings", "Auto_CheckUpdates", "")
Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $System_DIR = $Install_DIR & "\System\"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $Show_Settings_at_Startup = IniRead($Config_INI, "Settings", "Show_Settings_at_Startup", "")
Global $TEMP_StartHomeLoader = IniRead($Config_INI, "TEMP", "StartHomeLoader", "")
Global $TEMP_StartHomeSettings = IniRead($Config_INI, "TEMP", "StartHomeLoaderSettings", "")
Global $USE_FB_GUI = IniRead($Config_INI, "Settings", "USE_GUI", "")
Global $USE_PHP_WebServer = IniRead($Config_INI, "Settings", "USE_PHP_WebServer", "")
Global $StartSteamVRHome = $System_DIR & "StartSteamVRHome.exe"
Global $StartSteamVRHome_au3 = $System_DIR & "StartSteamVRHome.au3"
Global $StartSteamVRHome_exe = $System_DIR & "StartSteamVRHome.exe"
Global $StartHomeAPP_bat = $System_DIR & "StartHomeAPP.bat"
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $Time_Interval = IniRead($Config_INI, "Settings", "Time_Interval", "")
Global $Status_Checkbox_Minimize_OVRS = IniRead($Config_INI,"Settings", "Minimize_Oculus", "")
Global $gfx = $Install_DIR & "System\gfx\"
Global $JanusVR_Page = $Install_DIR & "WebPage\janusvr\" & "index.html"
Global $Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
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

Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")

IniWrite($config_ini, "Settings", "Version", $Version)
#endregion


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


_StartUp_settings()

#Region Update Performed Check
Func _Update_Performed_Check()
	$Update_Performed_Check = IniRead($config_ini, "TEMP", "Update", "")
	If $Update_Performed_Check = "Updated" Then
		IniWrite($config_ini, "TEMP", "Update", "")
		If FileExists($System_DIR & "Update.exe") Then
			ShellExecuteWait($System_DIR & "Update.exe", "", $Install_DIR)
			IniWrite($config_ini, "TEMP", "Update", "")
			IniWrite($Config_INI, "TEMP", "Update_Check", "")
		Else
			;If FileExists($System_DIR & "Update.au3") Then
				ShellExecuteWait($System_DIR & "Update.au3", "", $Install_DIR)
				IniWrite($config_ini, "TEMP", "Update", "")
				IniWrite($Config_INI, "TEMP", "Update_Check", "")
			;EndIf
		EndIf
		Exit
	EndIf
	If $Update_Performed_Check = "Done, delete Update" Then
		IniWrite($config_ini, "TEMP", "Update", "")
		If FileExists($System_DIR & "Update.exe") Then FileDelete($System_DIR & "Update.exe")
		If FileExists($System_DIR & "TEMP.zip") Then FileDelete($System_DIR & "TEMP.zip")
		If FileExists($System_DIR & "Update\") Then DirRemove($System_DIR & "Update\", $DIR_REMOVE)
	EndIf
EndFunc
#endregion


#Region First Start And Empty Check
Func _First_Start_Empty_Check_1()
	_Update_Performed_Check()
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
	;_Detect_SteamVR_Files()
	_Create_Uninstaller()
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

Func _Loading_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	Global $GUI_Loading = GUICreate("Updating Home Loader...", 250, 65, - 1, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	GUISetIcon(@AutoItExe, -2, $GUI_Loading)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	Global $Updating_Label = GUICtrlCreateLabel("...Searching...", 60, 5, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	;GUICtrlSetColor(-1, $COLOR_RED)
	Global $Please_wait_Label = GUICtrlCreateLabel("...Please wait...", 49, 32, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	;GUICtrlSetColor(-1, $COLOR_RED)

	GUISetState(@SW_SHOW, $GUI_Loading)
	WinSetOnTop("Updating Home Loader...", "", $WINDOWS_ONTOP)
EndFunc

Func _Download_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000
	Global $XPOSGUI = - 1

	Global $GUI_Loading = GUICreate("Downlading...", 250, 105, $XPOSGUI, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	;If $Update_Check = "true" Then GUISetState(@SW_HIDE, $GUI_Loading)
	GUISetIcon(@AutoItExe, -2, $GUI_Loading)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	Global $Updating_Label = GUICtrlCreateLabel("...Searching...", 58, 5, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)

	Global $Anzeige_Fortschrittbalken = GUICtrlCreateProgress(5, 38, 240, 30)

	Global $Please_wait_Label = GUICtrlCreateLabel("...Please wait...", 49, 72, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)

	GUISetState(@SW_SHOW, $GUI_Loading)
	WinSetOnTop("Updating Home Loader...", "", $WINDOWS_ONTOP)
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

Func _StartUp_settings()
	If $Advanced_Settings = "true" Then
		Global $HEIGHT_GUI = 490
		Global $POS_X = 10
		Global $POS_Y_Button_Close = 427
		Global $POS_Y_Button_StartSteamVR = 370
		Global $POS_Y_Button_Start_HomeLoaderLibrary = 330
		Global $POS_X_Advanced_Settings_Label = 10
		Global $POS_Y_Advanced_Settings_Label = 129
		Global $POS_X_Check_for_Updates = 5
		Global $POS_Y_Check_for_Updates = 365
		Global $POS_X_Checkbox_Auto_CheckUpdates = 5
		Global $POS_Y_Checkbox_Auto_CheckUpdates = 400
		Global $Advanced_Settings_img = $gfx & "Advanced_Settings_UP.bmp"
		Global $ToolTip_Advanced_Settings = "Closes Advanced Settings options."
	Else
		Global $HEIGHT_GUI = 235
		Global $POS_X = 10000
		Global $POS_Y_Button_Close = 170
		Global $POS_Y_Button_StartSteamVR = 170
		Global $POS_Y_Button_Start_HomeLoaderLibrary = 135
		Global $POS_X_Advanced_Settings_Label = 82
		Global $POS_Y_Advanced_Settings_Label = 108
		Global $POS_X_Check_for_Updates = 10000
		Global $POS_Y_Check_for_Updates = 10000
		Global $POS_X_Checkbox_Auto_CheckUpdates = 10000
		Global $POS_Y_Checkbox_Auto_CheckUpdates = 10000
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

	Global $StartUp_Radio_0 = GUICtrlCreateRadio("Default", 10, 25, 55, 20) ; Default
		GuiCtrlSetTip(-1, "Sets default SteamVR Home as SteamVR Home App without the use of any HomeLoader functions.")
		If $HomeApp = "Default SteamVR Home" Then GUICtrlSetState($StartUp_Radio_0, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_0, "_StartUp_Radio_0")

	Global $StartUp_Radio_1 = GUICtrlCreateRadio("SteamVR", 80, 25, 65, 20) ; SteamVR
		GuiCtrlSetTip(-1, "Sets SteamVR as SteamVR Home App.")
		If $HomeApp = "SteamVR Home" Then GUICtrlSetState($StartUp_Radio_1, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_1, "_StartUp_Radio_1")

	Global $StartUp_Radio_2 = GUICtrlCreateRadio("Vive Home", 165, 25, 70, 20) ; Vive Home
		GuiCtrlSetTip(-1, "Sets Vive Home as SteamVR Home App.")
		If $HomeApp = "Vive Home" Then GUICtrlSetState($StartUp_Radio_2, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_2, "_StartUp_Radio_2")

	Global $StartUp_Radio_3 = GUICtrlCreateRadio("JanusVR", 10, 47, 60, 20) ; JanusVR
		GuiCtrlSetTip(-1, "Sets JanusVR as SteamVR Home App.")
		If $HomeApp = "Janus VR" Then GUICtrlSetState($StartUp_Radio_3, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_3, "_StartUp_Radio_3")

	Global $StartUp_Radio_4 = GUICtrlCreateRadio("VR Toolbox", 80, 47, 75, 20) ; VR Toolbox
		GuiCtrlSetTip(-1, "Sets VR Toolbox as SteamVR Home App.")
		If $HomeApp = "VR Toolbox" Then GUICtrlSetState($StartUp_Radio_4, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_4, "_StartUp_Radio_4")

	Global $StartUp_Radio_5 = GUICtrlCreateRadio("Other", 165, 47, 45, 20) ; Other
	GuiCtrlSetTip(-1, "Sets any other Apllication as SteamVR Home App.")
		If $HomeApp = "Other" And $Home_Path <> "" Then GUICtrlSetState($StartUp_Radio_5, $GUI_CHECKED)
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
	Global $Checkbox_Add_PlayersOnline_to_Icons = GUICtrlCreateCheckbox(" Add current Players to Icons", $POS_X, 170, 220, 20)
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
	Global $Checkbox_Add_SS_per_game = GUICtrlCreateCheckbox(" Automatically add SS per game", $POS_X, 210, 220, 20)
		GuiCtrlSetTip(-1, "If activated it will check the saved Supersampling settings" & @CRLF & "for the current loaded game and adds these value to SteamVR.")
		If $State_Checkbox_Add_SS_per_game = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Add_SS_per_game, "_Checkbox_Add_SS_per_game")

	Global $Button_Restore_SteamVR_Settings = GUICtrlCreateButton("Restore SteamVR Settings", $POS_X, 230, 223, 20)
		GuiCtrlSetTip(-1, "Restores the SteamVR Settings." & @CRLF & @CRLF & "It will Restore the following Files:" & @CRLF & "- default.vrsettings" & @CRLF & "- tools.vrmanifest")
		GUICtrlSetOnEvent($Button_Restore_SteamVR_Settings, "_Button_Restore_SteamVR_Settings")


	GUICtrlCreateGroup("Oculus Home:", $POS_X - 5, 258, 235, 63)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)

	$State_Checkbox_Minimize_Oculus = IniRead($config_ini,"Settings", "Minimize_Oculus", "")
	Global $Checkbox_Minimize_Oculus = GUICtrlCreateCheckbox(" Minimize Oculus Shop Window", $POS_X, 277, 220, 20)
		GuiCtrlSetTip(-1, "If activated it will automatically minimize the Oculus Home Window if it is detected.")
		If $State_Checkbox_Minimize_Oculus = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Minimize_Oculus, "_Checkbox_Minimize_Oculus")

	$State_Checkbox_Close_Oculus = IniRead($config_ini,"Settings", "Close_Oculus", "")
	Global $Checkbox_Close_Oculus = GUICtrlCreateCheckbox(" Close Oculus Shop Window", $POS_X, 297, 220, 20)
		GuiCtrlSetTip(-1, "If activated it will automatically close the Oculus Home Window if it is detected.")
		If $State_Checkbox_Close_Oculus = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Close_Oculus, "_Checkbox_Close_Oculus")

	Global $Button_Start_HomeLoaderLibrary = GUICtrlCreateButton("Home Loader Library", 5, $POS_Y_Button_Start_HomeLoaderLibrary, 235, 30, $BS_BITMAP)
		If FileExists($ApplicationList_SteamLibrary_ALL_INI) Then _GUICtrlButton_SetImage($Button_Start_HomeLoaderLibrary, $gfx & "HomeLoaderLibrary.bmp")
		If Not FileExists($ApplicationList_SteamLibrary_ALL_INI) Then _GUICtrlButton_SetImage($Button_Start_HomeLoaderLibrary, $gfx & "ScanHomeLoaderLibrary_first.bmp")
		GuiCtrlSetTip(-1, "Starts Home Loader Library.")
		GUICtrlSetOnEvent($Button_Start_HomeLoaderLibrary, "_Button_Start_HomeLoaderLibrary")



	Global $Check_for_Updates = GUICtrlCreateButton("Check for Updates", $POS_X_Check_for_Updates, $POS_Y_Check_for_Updates, 235, 30)
		GuiCtrlSetTip(-1, "Closes Settings Window.")
		GUICtrlSetFont(-1, 12, 600, 2, $font_StartUp_arial)
		GUICtrlSetColor(-1, "0x6495ED")
		GUICtrlSetOnEvent($Check_for_Updates, "_Check_for_Updates_1")


	GUICtrlCreateLabel("", $POS_X_Checkbox_Auto_CheckUpdates + 5, $POS_Y_Checkbox_Auto_CheckUpdates, 22, 22)
	GUICtrlSetBkColor(-1, 0)
	GUICtrlSetState(-1, $GUI_DISABLE)
	If $Auto_CheckUpdates = "true" Then $State_Checkbox_Auto_CheckUpdates = "X"
	If $Auto_CheckUpdates <> "true" Then $State_Checkbox_Auto_CheckUpdates = ""
	Global $Checkbox_Auto_CheckUpdates = GUICtrlCreateLabel($State_Checkbox_Auto_CheckUpdates, $POS_X_Checkbox_Auto_CheckUpdates + 6, $POS_Y_Checkbox_Auto_CheckUpdates + 1, 20, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetFont(-1, 16)
	$Checkbox_Auto_CheckUpdates_Label = GUICtrlCreateLabel("Auto. Check for Updates", $POS_X_Checkbox_Auto_CheckUpdates + 34, $POS_Y_Checkbox_Auto_CheckUpdates, 200, 23) ; ; +26
	GUICtrlSetFont(-1, 14, 400, 1, "arial")
	GUICtrlSetOnEvent($Checkbox_Auto_CheckUpdates, "_Checkbox_Auto_CheckUpdates")
	GUICtrlSetOnEvent($Checkbox_Auto_CheckUpdates_Label, "_Checkbox_Auto_CheckUpdates")


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


	$contextmenu = GUICtrlCreateContextMenu($StartUp_Radio_2)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Download VIVE Home", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Install VIVE Home", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("Uninstall VIVE Home", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_RM_Item1")
	GUICtrlSetOnEvent($RM_Item3, "_RM_Item3")
	GUICtrlSetOnEvent($RM_Item4, "_RM_Item4")


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
		;GUICtrlSetState($Button_Start_HomeLoader, $GUI_SHOW)
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

Func _StartUp_Radio_0() ; Default [SteamVR Home]
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Default SteamVR Home")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/250820")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Default SteamVR Home")

	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
	_ADD_2_SteamVR_Home_default()

	_StartUp_Button_HomeLoader()

	MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "The default SteamVR Home app was set as Home app.")
EndFunc

Func _StartUp_Radio_1() ; SteamVR Home
	$Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "SteamVR Home")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $SteamVR_Path & "tools\steamvr_environments\game\bin\win64\steamtours.exe")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "SteamVR Home")

	If $Advanced_Settings = "true" Then
		Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																	"This can be changed at any time in this settings menu." & @CRLF & @CRLF & _
																	"Yes:" & @CRLF & _
																	"It will change the SteamVR settings." & @CRLF & _
																	"After start it will load the new Home app instead of SteamVR Home." & @CRLF & _
																	"SteamVR can be started in any way, it will load the Home app every time." & @CRLF & @CRLF & _
																	"No:" & @CRLF & _
																	"It will NOT change the SteamVR settings." & @CRLF & _
																	"SteamVR can be started in any way but it will only load like usual SteamVR Home." & @CRLF & _
																	"To load the new Home app it is needed to use the 'Advanced settings' mode and to start SteamVR using the Button in the Home Loader GUI." & @CRLF & @CRLF)

		If $Abfrage = 6 Then
			IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
			IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
			_ADD_2_SteamVR_Home_default()
		Else
			IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
			IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
			_Restore_Default_SteamVR_Home()
		EndIf
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
		_ADD_2_SteamVR_Home_default()
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "'SteamVR Home' app was set as Home app.")
	EndIf
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_2() ; Vive Home
	$Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Vive Home")
	Local $ViveHome_SDK_Path = $Install_DIR & "Apps\ViveHome\ViveHomeSDKTestbed.exe"
	Local $ViveHome_Path = $HTCVive_Path & "Updater\App\Home\win32\ViveHome.exe"

	If FileExists($ViveHome_SDK_Path) Then $ViveHome_Path = $ViveHome_SDK_Path

	If FileExists($ViveHome_Path) Then
		;ConsoleWrite($HTCVive_Path & "ViveSetup\Updater\App\Home\win32\ViveHome.exe" & @CRLF)
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $ViveHome_Path)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	Else
		$FileSelect = FileOpenDialog("Select 'VIVEHome.exe' File", $Install_DIR, "Executable (*.exe)")
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	EndIf

	If $Advanced_Settings = "true" Then
		Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																	"This can be changed at any time in this settings menu." & @CRLF & @CRLF & _
																	"Yes:" & @CRLF & _
																	"It will change the SteamVR settings." & @CRLF & _
																	"After start it will load the new Home app instead of SteamVR Home." & @CRLF & _
																	"SteamVR can be started in any way, it will load the Home app every time." & @CRLF & @CRLF & _
																	"No:" & @CRLF & _
																	"It will NOT change the SteamVR settings." & @CRLF & _
																	"SteamVR can be started in any way but it will only load like usual SteamVR Home." & @CRLF & _
																	"To load the new Home app it is needed to use the 'Advanced settings' mode and to start SteamVR using the Button in the Home Loader GUI." & @CRLF & @CRLF)

		If $Abfrage = 6 Then
			IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
			IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
			_ADD_2_SteamVR_Home_default()
		Else
			IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
			IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
			_Restore_Default_SteamVR_Home()
		EndIf
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
		_ADD_2_SteamVR_Home_default()
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "'Vive Home' app was set as Home app.")
	EndIf
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_3() ; Janus VR
	$Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
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

	$JanusVR_Settings_Folder = "c:\Users\" & @UserName & "\Documents\janusvr\"
	$bookmarks_json = "c:\Users\" & @UserName & "\Documents\janusvr\appdata\bookmarks.json"
	$settings_json = "c:\Users\" & @UserName & "\Documents\janusvr\appdata\settings.json"

	Local $Abfrage_1 = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Janus VR bookmarks [1/3]", "Do you also want to add the default Home Loader Room" & @CRLF & _
																"to the JanusVR bookmark page?" & @CRLF & _
																$bookmarks_json & @CRLF & @CRLF & _
																"JanusVR Settings can be found in the following folder:" & @CRLF & _
																$JanusVR_Settings_Folder & @CRLF)

	If $Abfrage_1 = 6 Then
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
																$JanusVR_Settings_Folder & @CRLF)

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

	If $Advanced_Settings = "true" Then
		Local $Abfrage_3 = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Default SteamVR Home 'Janus VR' [3/3]", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																	"This can be changed at any time in this settings menu." & @CRLF & @CRLF & _
																	"Yes:" & @CRLF & _
																	"It will change the SteamVR settings." & @CRLF & _
																	"After start it will load the new Home app instead of SteamVR Home." & @CRLF & _
																	"SteamVR can be started in any way, it will load the Home app every time." & @CRLF & @CRLF & _
																	"No:" & @CRLF & _
																	"It will NOT change the SteamVR settings." & @CRLF & _
																	"SteamVR can be started in any way but it will only load like usual SteamVR Home." & @CRLF & _
																	"To load the new Home app it is needed to use the 'Advanced settings' mode and to start SteamVR using the Button in the Home Loader GUI." & @CRLF & @CRLF)

		If $Abfrage_3 = 6 Then
			IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
			IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
			_ADD_2_SteamVR_Home_default()
		Else
			IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
			IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
			_Restore_Default_SteamVR_Home()
		EndIf
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
		_ADD_2_SteamVR_Home_default()
		MsgBox($MB_OK + $MB_ICONINFORMATION, "DDefault SteamVR Home 'Janus VR' [3/3]", "'Janus VR' app was set as Home app.")
	EndIf
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_4() ; VR Toolbox
	$Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "VR Toolbox")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")

	If $Advanced_Settings = "true" Then
		Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																	"This can be changed at any time in this settings menu." & @CRLF & @CRLF & _
																	"Yes:" & @CRLF & _
																	"It will change the SteamVR settings." & @CRLF & _
																	"After start it will load the new Home app instead of SteamVR Home." & @CRLF & _
																	"SteamVR can be started in any way, it will load the Home app every time." & @CRLF & @CRLF & _
																	"No:" & @CRLF & _
																	"It will NOT change the SteamVR settings." & @CRLF & _
																	"SteamVR can be started in any way but it will only load like usual SteamVR Home." & @CRLF & _
																	"To load the new Home app it is needed to use the 'Advanced settings' mode and to start SteamVR using the Button in the Home Loader GUI." & @CRLF & @CRLF)

		If $Abfrage = 6 Then
			IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
			IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
			_ADD_2_SteamVR_Home_default()
		Else
			IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
			IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
			_Restore_Default_SteamVR_Home()
		EndIf
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
		_ADD_2_SteamVR_Home_default()
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "'VR Toolbox' app was set as Home app.")
	EndIf
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_5() ; Other
	$Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Other")
	_StartUp_Add_Other_GUI()
EndFunc

Func _DROPDOWN_Other_GUI() ; Other GUI DropDown
	$Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
	$DROPDOWN = GUICtrlRead($DROPDOWN_Other_GUI)

	Local $StringSplit = StringSplit($DROPDOWN, '[')
	Local $SteamStartGameName = StringTrimRight(StringReplace($StringSplit[1], ']', ''), 1)
	Local $SteamStartURL = "steam://rungameid/" & StringReplace($StringSplit[2], ']', '')

	If $SteamStartGameName = "Bigscreen Beta" Then $SteamStartGameName = "Bigscreen"

	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", $SteamStartGameName)
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $SteamStartURL)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", $SteamStartGameName)

	If $Advanced_Settings = "true" Then
		Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
																	"This can be changed at any time in this settings menu." & @CRLF & @CRLF & _
																	"Yes:" & @CRLF & _
																	"It will change the SteamVR settings." & @CRLF & _
																	"After start it will load the new Home app instead of SteamVR Home." & @CRLF & _
																	"SteamVR can be started in any way, it will load the Home app every time." & @CRLF & @CRLF & _
																	"No:" & @CRLF & _
																	"It will NOT change the SteamVR settings." & @CRLF & _
																	"SteamVR can be started in any way but it will only load like usual SteamVR Home." & @CRLF & _
																	"To load the new Home app it is needed to use the 'Advanced settings' mode and to start SteamVR using the Button in the Home Loader GUI." & @CRLF & @CRLF)

		If $Abfrage = 6 Then
			IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
			IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
			_ADD_2_SteamVR_Home_default()
		Else
			IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
			IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "true")
			_Restore_Default_SteamVR_Home()
		EndIf
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
		_ADD_2_SteamVR_Home_default()
		MsgBox($MB_OK + $MB_ICONINFORMATION, "Default SteamVR Home", "'" & $SteamStartGameName & "'" & " app was set as Home app.")
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

	Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Default SteamVR Home", "Do you also want to change the default SteamVR Home app?" & @CRLF & @CRLF & _
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

Func _Checkbox_Close_Oculus()
	$State_Checkbox = GUICtrlRead($Checkbox_Close_Oculus)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "Close_Oculus", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "Close_Oculus", "false")
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
	If FileExists($Install_DIR & "Uninstal.exe") And FileExists($Install_DIR & "Uninstaller.exe") Then
		FileMove($Install_DIR & "Uninstal.exe", $Install_DIR & "Uninstall Files.exe", $FC_CREATEPATH + $FC_OVERWRITE)
	EndIf
	Sleep(500)
	If FileExists($Install_DIR & "Uninstaller.exe") Then
		FileMove($Install_DIR & "Uninstaller.exe", $Install_DIR & "Uninstal.exe", $FC_CREATEPATH + $FC_OVERWRITE)
	EndIf
EndFunc

Func _Restore_Default_SteamVR_Home()
	FileCopy($Steam_tools_vrmanifest_File_BAK, $Steam_tools_vrmanifest_File)
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
	$Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")

	If $Advanced_Settings = "true" Then
		IniWrite($Config_INI, "TEMP", "StartHomeLoader", "true")
		If FileExists($System_DIR & "StartSteamVRHome.exe") Then
			ShellExecute($System_DIR & "StartSteamVRHome.exe", "", $System_DIR)
		Else
			ShellExecute($System_DIR & "StartSteamVRHome.au3", "", $System_DIR)
		EndIf
		Exit
	Else
		ShellExecute("steam://rungameid/250820")
	EndIf
EndFunc

Func _Button_Start_HomeLoaderLibrary()
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	Exit
EndFunc

Func _Check_for_Updates_1()
	If FileExists($System_DIR & "UpdateCheck.exe") Then
		ShellExecute($System_DIR & "UpdateCheck.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "UpdateCheck.au3", "", $System_DIR)
	EndIf
	IniWrite($config_ini, "TEMP", "Update", "true")
	_Exit()
EndFunc

Func _Checkbox_Auto_CheckUpdates()
	Local $State_Checkbox = GUICtrlRead($Checkbox_Auto_CheckUpdates)
	If $State_Checkbox = "" Then
		GUICtrlSetData($Checkbox_Auto_CheckUpdates, "X")
		IniWrite($Config_INI, "Settings", "Auto_CheckUpdates", "true")
	Else
		GUICtrlSetData($Checkbox_Auto_CheckUpdates, "")
		IniWrite($Config_INI, "Settings", "Auto_CheckUpdates", "false")
	EndIf
EndFunc


Func _RM_Item1()
	Local $Download_File = $Install_DIR & "ViveHomeSDK.zip"
	Local $Download_URL = "http://dl4.htc.com/vive/ViveHomeSDK/ViveHomeSDK.zip?_ga=2.165259967.1201289051.1505049124-1214461869.1505049124"

	$Abfrage = MsgBox($MB_YESNO	 + $MB_ICONINFORMATION, "Download VIVE Home SDK", "VIVE Home SDK Download Link:" & @CRLF & _
																					$Download_URL & @CRLF & @CRLF &  _
																					"Do you want to download the VIVE Home SDK?")


	If $Abfrage = 6 Then

		_Download_GUI()

		Local $Get_Download = InetGet($Download_URL, $Download_File, $INET_FORCERELOAD, $INET_DOWNLOADBACKGROUND)

		Do
			Sleep(250)
			Local $iInetGetInfo_1 = InetGetInfo($Get_Download, $INET_DOWNLOADREAD)
			Local $iInetGetInfo_2 = InetGetInfo($Get_Download, $INET_DOWNLOADSIZE)

			If $iInetGetInfo_1 <> 0 Then
				WinSetOnTop("Downlading...", "", $WINDOWS_NOONTOP)

				GUICtrlSetData($Updating_Label, "Downloading")
				Do
					Sleep(1000)
					$iInetGetInfo_1 = InetGetInfo($Get_Download, $INET_DOWNLOADREAD)
					$iInetGetInfo_2 = InetGetInfo($Get_Download, $INET_DOWNLOADSIZE)

					GUICtrlSetData($Anzeige_Fortschrittbalken, $iInetGetInfo_1 * 100 / $iInetGetInfo_2)

					Local $MB_Current = Round($iInetGetInfo_1 / 1000000, 2)
					Local $MB_complete = Round($iInetGetInfo_2 / 1000000, 2)

					GUICtrlSetData($Please_wait_Label, $MB_Current & "" & " / " & $MB_complete & "")
				Until InetGetInfo($Get_Download, $INET_DOWNLOADCOMPLETE)
			Else
				InetClose($Get_Download)
			EndIf
		Until InetGetInfo($Get_Download, $INET_DOWNLOADCOMPLETE)
		GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
	EndIf
	GUIDelete($GUI_Loading)
EndFunc

Func _RM_Item3()
	Local $Download_File = $Install_DIR & "ViveHomeSDK.zip"

	If FileExists($Download_File) Then
		_Download_GUI()
		GUICtrlSetData($Anzeige_Fortschrittbalken, 30)
		Local $Download_ZIP = $Install_DIR & "ViveHomeSDK.zip"
		Local $ViveHome_ZIP = $Install_DIR & "temp\ViveHomeSDK\ViveHome_v1.0.zip"
		Local $Apps_Folder = $Install_DIR & "Apps\"
		Local $TEMP_Folder = $Install_DIR & "temp\"

		If Not FileExists($TEMP_Folder) Then DirCreate($TEMP_Folder)
		_Zip_UnzipAll($Download_ZIP, $TEMP_Folder, 0)

		GUICtrlSetData($Anzeige_Fortschrittbalken, 60)
		Sleep(1000)

		If Not FileExists($Apps_Folder) Then DirCreate($Apps_Folder)
		_Zip_UnzipAll($ViveHome_ZIP, $Apps_Folder, 0)

		GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
		Sleep(1000)
	Else
		MsgBox($MB_ICONINFORMATION, "Install VIVE Home", "VIVE Home SDK File is missing." & @CRLF & "Download the VIVE Home SDK first.")
	EndIf

	Sleep(1000)
	DirRemove($TEMP_Folder, 1)
	Sleep(500)
	MsgBox($MB_ICONINFORMATION, "Install VIVE Home", "VIVE Home successfully installed." & @CRLF & "You can delete the File/Folder:" & @CRLF & _
														$Download_File & @CRLF & $TEMP_Folder)
	GUIDelete($GUI_Loading)
EndFunc

Func _RM_Item4()
	Local $ViveHome_SDK_Path = $Install_DIR & "Apps\ViveHome\ViveHomeSDKTestbed.exe"
	Local $Download_File = $Install_DIR & "ViveHomeSDK.zip"
	Local $TEMP_Folder = $Install_DIR & "temp\"

	$Abfrage = MsgBox($MB_YESNO	 + $MB_ICONINFORMATION, "Delete VIVE Home SDK Files", "VIVE Home SDK Files:" & @CRLF & _
																					$Install_DIR & "Apps\ViveHome\" & @CRLF & _
																					$Download_File & @CRLF & _
																					$TEMP_Folder & @CRLF & @CRLF & _
																					"Do you want to delete these Files/Folders?")

	If $Abfrage = 6 Then
		DirRemove($Install_DIR & "Apps\ViveHome\", 1)
		DirRemove($TEMP_Folder, 1)
		FileDelete($Download_File)
	EndIf
EndFunc


Func _FirstStart_Restart()
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	Exit
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
	If $USE_PHP_WebServer = "true" Then
		If ProcessExists("cmd.exe") Then ProcessClose("cmd.exe")
	EndIf
	Exit
EndFunc

