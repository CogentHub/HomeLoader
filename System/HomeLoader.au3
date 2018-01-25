
#Region Inncludes
#include <Date.au3>
#include <File.au3>
#include <GUIConstants.au3>
#include <Inet.au3>
#include "_GDIPlus_WTOB.au3"
#endregion

Opt("GUIOnEventMode", 1)

#Region Global
Global $SteamVR_Status, $Title_1, $Title_2, $Handle_1, $Handle_2, $Title_Array_1, $Title_Array_2, $Handle_Array_1, $Handle_Array_2, $NR_Handle_1, $NR_Handle_2
Global $GameStarted, $LOOP_VIVEHOMECheck, $OldWindowExists, $Button_Close_Current_Running, $Button_Restart, $Button_Exit
Global $Select_HomeApp_Label, $USE_GUI_Backup, $ApplicationList_Read, $Array_tools_vrmanifest_File, $Line_NR_binary_path_windows, $Line_NR_image_path
Global $Array_tools_vrmanifest_File, $AddShortcut_to_Oculus_GUI, $GUI_Label, $HOMECheck, $WinTitle, $Check_AppId
Global $DesktopWidth, $DesktopHeight, $Width, $Height, $X, $Y, $font_arial, $GUI, $Install_DIR_replaced, $State_Checkbox, $SteamGameID
Global $hImage1_Path, $hImage2_Path, $Check_StringSplit_NR, $Check_Filename_1, $Check_Filename_2, $Check_Filename_3, $Check_Filename, $hBMPBuff, $hGraphic, $hPen
Global $hImage1, $hImage2, $GameNameStarted, $GameStarted_State, $FileLines, $Application_name
Global $GUI_Loading, $COLOR_RED, $DOWNLOAD_URL, $Button_HLStatus, $NewIcon_Path, $GameClosed, $GameStarted
Global $SteamVR_Status
#EndRegion Global

#Region Colors
Global $LimeGreen = "0x32CD32"
Global $Blue = "0x00BFFF"
Global $Yellow = "0xFFFF00"
#EndRegion Colors

#Region Variablen
Global $font = "arial"
Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $HomeLoader_StartBat = $System_DIR & "StartHomeAPP.bat"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $TEMP_StartHomeLoader = IniRead($Config_INI, "TEMP", "StartHomeLoader", "")
Global $TEMP_StartHomeSettings = IniRead($Config_INI, "TEMP", "StartHomeLoaderSettings", "")
Global $Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "false")
Global $Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "false")
Global $Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "false")
Global $StartSteamVRHome = $System_DIR & "StartSteamVRHome.exe"
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $gfx = $System_DIR & "gfx\"
Global $Icons = $Install_DIR & "Icons\"
Global $JanusVR_Page = $Install_DIR & "WebPage\janusvr\" & "index.html"
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")
Global $Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "")
Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
Global $Steam_Path = StringReplace($Steam_Path_REG, '/', '\') & "\"
Global $HomeLoader_Overlay_Folder = $Steam_Path & "steamapps\common\VRUtilityBelt\addons\custom\HomeLoader\overlays\HomeLoader\"

Global $ShowCMD = IniRead($Config_INI, "TEMP", "ShowCMD", "")

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

Global $Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
Global $Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
Global $Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")
Global $Icon_Folder_4 = IniRead($Config_INI, "Folders", "Icon_Folder_4", "")
Global $Icon_Folder_5 = IniRead($Config_INI, "Folders", "Icon_Folder_5", "")

Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
Global $Steam_Path = StringReplace($Steam_Path_REG, '/', '\') & "\"
Global $SteamVR_Path = $Steam_Path & "SteamApps\common\SteamVR\"

Global $default_vrsettings_File = IniRead($Config_INI, "Folders", "Steam_default_vrsettings", "")
Global $default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
Global $default_vrsettings_File_new = $default_vrsettings_File & ".new"

Global $Steam_tools_vrmanifest_File = IniRead($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
Global $Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"

Global $Steam_stats_log_txt = $Install_Folder_Steam_1 & "\logs\stats_log.txt"

Global $HTCVive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\HTC\HTC Vive\', "ViveHelperPath")
Global $HTCVive_Path_StringReplace_1 = StringReplace($HTCVive_Path_REG, 'PCClient\ViveportDesktopHelper.exe', '')
Global $HTCVive_Path = StringReplace($HTCVive_Path_StringReplace_1, '/', '\')

Global $DefaultClickAction = IniRead($Config_INI, "TEMP", "DefaultClickAction", "")

Global $default_renderTargetMultiplier_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "SteamVR_Status", "default_renderTargetMultiplier", "1.0")
Global $default_supersampleScale_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "SteamVR_Status", "default_supersampleScale", "1.0")
Global $default_allowSupersampleFiltering_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "SteamVR_Status", "default_allowSupersampleFiltering", "true")

Global $stats_log_FILE = $System_DIR & "Logs\stats_log.txt"
#EndRegion Variablen

#Region Start Check
If Not ProcessExists("vrmonitor.exe") Then
	Sleep(5000)
	_Check_SteamVR_Exit()
EndIf

If $First_Start = "true" Then
	If Not FileExists($Install_DIR & "Backups\default.vrsettings") Then FileCopy($default_vrsettings_File, $Install_DIR & "Backups\default.vrsettings", $FC_OVERWRITE)
	If Not FileExists($Install_DIR & "Backups\tools.vrmanifest") Then FileCopy($Steam_tools_vrmanifest_File, $Install_DIR & "Backups\tools.vrmanifest", $FC_OVERWRITE)
	_FirstStart_Restart()
EndIf

If $Autostart_VRUB = "true" Then
	Local $Parameter_1 = ""
	If $CmdLine[0] Then
		$Parameter_1 = $CmdLine[1]
	EndIf

	If $Parameter_1 = "UpdateOverlay" Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Updating the Overlay:")
		If $Add_PlayersOnline_to_Icons = "true" Then _Get_ADD_PlayersOnline_DATA()
		If $Add_SS_to_Icons = "true" Then _Get_AD_SS_Values_to_Icons()
		_Start_HomeLoaderLibrary_UpdateOverlay()
		Exit
	EndIf
Else
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Updating without Overlay:")
	_Start_HomeLoaderLibrary_Update()
	If $Add_PlayersOnline_to_Icons = "true" Then _Get_ADD_PlayersOnline_DATA()
	If $Add_SS_to_Icons = "true" Then _Get_AD_SS_Values_to_Icons()
EndIf

#EndRegion Start Check

_LOOP_1()

#Region LOOP
Func _LOOP_1()
	_Check_SteamVR_Exit()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ----- HomeLoader Loop 1 Finished -----" & "[" & _Now() & "]")
	Sleep(1000)
	_Check_SteamVR_Exit()
	WinSetOnTop("Home Loader", "", $WINDOWS_ONTOP)
	_LOOP_2()
EndFunc

Func _LOOP_2()
	Sleep(100)
	_Exit()
EndFunc

#EndRegion LOOP

#Region Main
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
EndFunc   ;==>_Create_JanusVR_Page

Func _Get_ADD_PlayersOnline_DATA()
	Local $FileList = _FileListToArray($Icons, "*.jpg", 1)

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start adding PO values to icons: " & "<.jpg Files found = " & $FileList[0] & ">")

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
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End adding PO values to icons: " & "<.jpg Files found = " & $FileList[0] & ">")
EndFunc

Func _Write_PO_TEXT_2_Image()
	_GDIPlus_Startup()
	Global $hImage = _GDIPlus_WTOB($gfx & "PlayersOnline.jpg", $PlayersOnline_right_now, "Arial", 45, -1, 3, 0, 0, 0x00CCFF, 1, 1)
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

	_GDIPlus_GraphicsDrawRect($hGraphic, 1, 1, 60 + 3, 60 + 3, $hPen)

	GUIRegisterMsg(0xF, "MY_PAINT")
	GUIRegisterMsg(0x85, "MY_PAINT")

	;Save composite image
	Local $sNewName = $Icons & "460x215\" & $Check_Filename
	$NewIcon_Path = $sNewName

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
	FileDelete(@ScriptDir & "\PlayersOnline" & ".jpg")
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()
EndFunc

Func _Copy_Icon_2_Icon_Folder()
	If $Icon_Folder_3 <> "" Then
		If FileExists($Icon_Folder_3 & $Check_AppId & "_header" & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_3 & $Check_AppId & "_header" & ".jpg", $FC_OVERWRITE)
		If FileExists($Icon_Folder_3 & "steam.app." & $Check_AppId & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_3 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)

		If Not FileExists($Icon_Folder_3 & $Check_AppId & "_header" & ".jpg") And Not FileExists($Icon_Folder_3 & "steam.app." & $Check_AppId & ".jpg") Then
			FileCopy($NewIcon_Path, $Icon_Folder_3 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)
		EndIf
	EndIf

	If $Icon_Folder_1 <> "" Then
		If FileExists($Icon_Folder_1 & $Check_AppId & "_header" & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_1 & $Check_AppId & "_header" & ".jpg", $FC_OVERWRITE)
		If FileExists($Icon_Folder_1 & "steam.app." & $Check_AppId & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_1 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)

		If Not FileExists($Icon_Folder_1 & $Check_AppId & "_header" & ".jpg") And Not FileExists($Icon_Folder_1 & "steam.app." & $Check_AppId & ".jpg") Then
			FileCopy($NewIcon_Path, $Icon_Folder_1 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)
		EndIf
	EndIf

	If $Icon_Folder_2 <> "" Then
		If FileExists($Icon_Folder_2 & $Check_AppId & "_header" & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_2 & $Check_AppId & "_header" & ".jpg", $FC_OVERWRITE)
		If FileExists($Icon_Folder_2 & "steam.app." & $Check_AppId & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_2 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)

		If Not FileExists($Icon_Folder_2 & $Check_AppId & "_header" & ".jpg") And Not FileExists($Icon_Folder_2 & "steam.app." & $Check_AppId & ".jpg") Then
			FileCopy($NewIcon_Path, $Icon_Folder_2 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)
		EndIf
	EndIf

	If $Icon_Folder_4 <> "" Then
		If FileExists($Icon_Folder_4 & $Check_AppId & "_header" & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_4 & $Check_AppId & "_header" & ".jpg", $FC_OVERWRITE)
		If FileExists($Icon_Folder_4 & "steam.app." & $Check_AppId & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_4 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)

		If Not FileExists($Icon_Folder_4 & $Check_AppId & "_header" & ".jpg") And Not FileExists($Icon_Folder_4 & "steam.app." & $Check_AppId & ".jpg") Then
			FileCopy($NewIcon_Path, $Icon_Folder_4 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)
		EndIf
	EndIf

	If $Icon_Folder_5 <> "" Then
		If FileExists($Icon_Folder_5 & $Check_AppId & "_header" & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_5 & $Check_AppId & "_header" & ".jpg", $FC_OVERWRITE)
		If FileExists($Icon_Folder_5 & "steam.app." & $Check_AppId & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_5 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)

		If Not FileExists($Icon_Folder_5 & $Check_AppId & "_header" & ".jpg") And Not FileExists($Icon_Folder_5 & "steam.app." & $Check_AppId & ".jpg") Then
			FileCopy($NewIcon_Path, $Icon_Folder_5 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)
		EndIf
	EndIf
EndFunc

Func _Add_SS_to_SteamVR()
	If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK, $FC_OVERWRITE)

	Local $Steam_app_Name = $Application_name
	Local $Game_ID = $SteamGameID

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Starting adding SS to SteamVR: " & "<App ID: " & $Game_ID & ">" & " - " & "<App Name: " & $Steam_app_Name & ">")

	$FileLines = _FileCountLines($default_vrsettings_File)

	$default_renderTargetMultiplier_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "default_renderTargetMultiplier", "1.0")
	$default_supersampleScale_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "default_supersampleScale", "1.0")
	$default_allowSupersampleFiltering_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "default_allowSupersampleFiltering", "true")

	Local $renderTargetMultiplier_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "renderTargetMultiplier", $default_renderTargetMultiplier_value)
	Local $supersampleScale_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "supersampleScale", $default_supersampleScale_value)
	Local $allowSupersampleFiltering_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "allowSupersampleFiltering", $default_allowSupersampleFiltering_value)

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " <renderTargetMultiplier: " & $renderTargetMultiplier_value & ">" & " - " & "<supersampleScale: " & $supersampleScale_value & ">" & " - " & "<allowSupersampleFiltering: " & $allowSupersampleFiltering_value & ">")

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
	If Not FileExists($default_vrsettings_File) Then FileCopy($default_vrsettings_File_BAK, $default_vrsettings_File, $FC_OVERWRITE)
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End adding SS to SteamVR: " & "<App ID: " & $Game_ID & ">" & " - " & "<App Name: " & $Steam_app_Name & ">")
EndFunc

Func _Get_AD_SS_Values_to_Icons()
	Local $FileList = _FileListToArray($Icons & "460x215\", "*.jpg", 1)

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start adding SS values to icons: " & "<.jpg Files found = " & $FileList[0] & ">")

	If $FileList <> "" Then
		For $NR = 1 To $FileList[0]
			$Check_AppId = StringReplace($FileList[$NR], 'steam.app.', '')
			$Check_AppId = StringReplace($Check_AppId, '.jpg', '')

			Local $SS_Value_Check = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "renderTargetMultiplier", "")

			Local $renderTargetMultiplier_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "renderTargetMultiplier", "1.0")
			Local $supersampleScale_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "supersampleScale", "1.0")
			Local $allowSupersampleFiltering_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Check_AppId, "allowSupersampleFiltering", "true")

			Global $Value_for_Image = $renderTargetMultiplier_value & " / " & $supersampleScale_value

			If $SS_Value_Check <> "" Then
				_Write_SS_TEXT_2_Image()
				_Write_SS_Image_2_Image()
				_Copy_SS_Icon_2_Icon_Folder()
			EndIf

			$renderTargetMultiplier_value = ""
			$supersampleScale_value = ""
			$allowSupersampleFiltering_value = ""
			$Check_AppId = ""
		Next
	EndIf
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End adding SS values to icons: " & "<.jpg Files found = " & $FileList[0] & ">")
EndFunc

Func _Write_SS_TEXT_2_Image()
	_GDIPlus_Startup()
	Global $hImage = _GDIPlus_WTOB($gfx & "SS_Values.jpg", $Value_for_Image, "Arial", 45, -1, 3, 0, 0, 0x00CCFF, 1, 1)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()

	If FileExists(@ScriptDir & "\" & "WTOB.png") Then
		FileCopy(@ScriptDir & "\" & "WTOB.png", @ScriptDir & "\SS_Values" & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		FileDelete(@ScriptDir & "\" & "WTOB.png")
	EndIf
EndFunc

Func _Write_SS_Image_2_Image()
	Global $ImageSizeX = 460, $ImageSizeY = 215
	Global $FAVImageSizeX = 200, $FAVImageSizeY = 60

	$hImage1_Path = $Icons & "460x215\" & "steam.app." & $Check_AppId & ".jpg"
	$hImage2_Path = @ScriptDir & "\" & "SS_Values.jpg"

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

	;Graphics
	_GDIPlus_GraphicsClear($hGraphic, 0xFFE8FFE8)

	$hPen = _GDIPlus_PenCreate(0xFFFF0000, 3)

	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage1, 0, 0, $ImageSizeX, $ImageSizeY)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage2, 257, 152, $FAVImageSizeX, $FAVImageSizeY)

	_GDIPlus_GraphicsDrawRect($hGraphic, 255, 150, 200 + 3, 60 + 3, $hPen)

	GUIRegisterMsg(0xF, "MY_PAINT")
	GUIRegisterMsg(0x85, "MY_PAINT")

	;Save composite image
	Local $sNewName = $Icons & "460x215\SS_Values\" & $Check_Filename
	$NewIcon_Path = $sNewName
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
	FileDelete(@ScriptDir & "\SS_Values." & ".jpg")
	FileDelete(@ScriptDir & "\System\SS_Values." & ".jpg")
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()
EndFunc

Func _Copy_SS_Icon_2_Icon_Folder()
	If $Icon_Folder_1 <> "" Then
		If FileExists($Icon_Folder_1 & $Check_AppId & "_header" & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_1 & $Check_AppId & "_header" & ".jpg", $FC_OVERWRITE)
		If FileExists($Icon_Folder_1 & "steam.app." & $Check_AppId & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_1 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)

		If Not FileExists($Icon_Folder_1 & $Check_AppId & "_header" & ".jpg") And Not FileExists($Icon_Folder_1 & "steam.app." & $Check_AppId & ".jpg") Then
			FileCopy($NewIcon_Path, $Icon_Folder_1 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)
		EndIf
	EndIf

	If $Icon_Folder_2 <> "" Then
		If FileExists($Icon_Folder_2 & $Check_AppId & "_header" & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_2 & $Check_AppId & "_header" & ".jpg", $FC_OVERWRITE)
		If FileExists($Icon_Folder_2 & "steam.app." & $Check_AppId & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_2 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)

		If Not FileExists($Icon_Folder_2 & $Check_AppId & "_header" & ".jpg") And Not FileExists($Icon_Folder_2 & "steam.app." & $Check_AppId & ".jpg") Then
			FileCopy($NewIcon_Path, $Icon_Folder_2 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)
		EndIf
	EndIf

	If $Icon_Folder_3 <> "" Then
		If FileExists($Icon_Folder_3 & $Check_AppId & "_header" & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_3 & $Check_AppId & "_header" & ".jpg", $FC_OVERWRITE)
		If FileExists($Icon_Folder_3 & "steam.app." & $Check_AppId & ".jpg") Then FileCopy($NewIcon_Path, $Icon_Folder_3 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)

		If Not FileExists($Icon_Folder_3 & $Check_AppId & "_header" & ".jpg") And Not FileExists($Icon_Folder_3 & "steam.app." & $Check_AppId & ".jpg") Then
			FileCopy($NewIcon_Path, $Icon_Folder_3 & "steam.app." & $Check_AppId & ".jpg", $FC_OVERWRITE)
		EndIf
	EndIf

	If $Icon_Folder_1 = "" And $Icon_Folder_2 = "" And $Icon_Folder_3 = "" Then
		MsgBox($MB_ICONWARNING, "", "You need at least one Icon Folder path." & @CRLF & "Go to settings menu and enter an Icon path." & @CRLF & "Or disable the 'Add PlayersOnline to Icons function'.")
	EndIf
EndFunc

Func _Check_SteamVR_Exit()
	If Not ProcessExists("vrmonitor.exe") Then
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ----- HomeLoader SteamVR Closed --> Exit -----" & "[" & _Now() & "]")
		_Exit()
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

Func _Restart_HomeLoader()
	Local $stats_log_FILE_Lines = _FileCountLines($stats_log_FILE)
	If $stats_log_FILE_Lines > 400 Then FileDelete($stats_log_FILE)
	If FileExists($System_DIR & "HomeLoader.exe") Then
		ShellExecute($System_DIR & "HomeLoader.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoader.au3", "", $System_DIR)
	EndIf
	Sleep(5000)
	Exit
EndFunc

Func _Exit()
	Exit
EndFunc

#EndRegion Main

#Region Restart/Exit
Func _Start_HomeLoaderLibrary_UpdateOverlay()
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecuteWait($System_DIR & "HomeLoaderLibrary.exe", "UpdateOverlay", $System_DIR)
	Else
		ShellExecuteWait($System_DIR & "HomeLoaderLibrary.au3", "UpdateOverlay", $System_DIR)
	EndIf
EndFunc

Func _Start_HomeLoaderLibrary_Update()
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecuteWait($System_DIR & "HomeLoaderLibrary.exe", "Update", $System_DIR)
	Else
		ShellExecuteWait($System_DIR & "HomeLoaderLibrary.au3", "Update", $System_DIR)
	EndIf
EndFunc
#EndRegion Restart/Exit



