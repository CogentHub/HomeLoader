#include <MsgBoxConstants.au3>
#include <array.au3>
#include <File.au3>
#include <Date.au3>

;Global $Config_INI = @ScriptDir & "\config.ini"
Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
Global $System_DIR = $Install_DIR & "System\"
Global $Version = IniRead($Config_INI, "Settings", "Version", "")
Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
Global $UpdateOverlay = IniRead($Config_INI, "Settings", "UpdateOverlay", "")
Global $Use_Local_Icons = IniRead($Config_INI, "Settings", "Use_Local_Icons", "")
Global $ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
Global $Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "")
Global $Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "")
Global $Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
Global $HomeLoaderOverlaySteamID = IniRead($Config_INI, "Settings", "HomeLoaderOverlaySteamID", "")
Global $Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "")

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

Global $Steam_tools_vrmanifest_File = IniRead($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
Global $Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"

Global $StartHomeAPP_bat = $System_DIR & "StartHomeAPP.bat"
Global $StartSteamVRHome_au3 = $System_DIR & "StartSteamVRHome.au3"
Global $StartSteamVRHome_exe = $System_DIR & "StartSteamVRHome.exe"

$default_vrsettings_File = $SteamVR_Path & "resources\settings\default.vrsettings"
If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"

Global $default_vrsettings_File = IniRead($Config_INI, "Folders", "Steam_default_vrsettings", "")
Global $default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
Global $default_vrsettings_File_new = $default_vrsettings_File & ".new"

Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"

Global $default_renderTargetMultiplier = IniRead($Config_INI, "SteamVR_Status", "default_renderTargetMultiplier", "")
Global $default_supersampleScale = IniRead($Config_INI, "SteamVR_Status", "default_supersampleScale", "")
Global $default_allowSupersampleFiltering = IniRead($Config_INI, "SteamVR_Status", "default_allowSupersampleFiltering", "")

Global $stats_log_FILE = $System_DIR & "Logs\stats_log.txt"

Global $Array_tools_vrmanifest_File, $HomeApp_Overlay, $HomeLoaderOverlaySteamID_Overlay
Global $PressedOverlayButton_Overlay, $AppIDLoaded_Overlay, $HomeAppSteamID_Overlay
Global $OverlaySettings_RenderTargetMultiplier, $OverlaySettings_SupersampleScale, $OverlaySettings_AllowSupersampleFiltering
Global $OverlaySettings_Checkbox1, $OverlaySettings_Checkbox2, $OverlaySettings_Checkbox3
Global $OverlaySettings_Checkbox4, $OverlaySettings_Checkbox5, $OverlaySettings_Checkbox6
Global $OverlaySettings_LabelCustomPage3, $OverlaySettings_LabelCustomPage4, $OverlaySettings_LabelCustomPage5
Global $OverlaySettings_LabelCustomPage6
Global $OverlayGameRenderTargetMultiplier, $OverlayGameSupersampleScale, $OverlayGameAllowSupersampleFiltering


If $CmdLine[0] Then
	_ArrayDisplay($CmdLine)
	$Parameter_1 = $CmdLine[1]
	MsgBox(0, "$Parameter_1", $Parameter_1)
EndIf


If FileExists(@DesktopDir & "\HomeLoaderOverlay.url") Then
	Local $HomeLoaderOverlay_url = IniRead(@DesktopDir & "\HomeLoaderOverlay.url", "InternetShortcut","URL", "ERROR")
	Local $StringReplace_SteamID = StringReplace($HomeLoaderOverlay_url, 'http://"steam://rungameid/', '')
	$HomeLoaderOverlaySteamID = StringReplace($StringReplace_SteamID, '"', '')
	IniWrite($Config_INI, "Settings", "HomeLoaderOverlaySteamID", $HomeLoaderOverlaySteamID)
	FileDelete(@DesktopDir & "\HomeLoaderOverlay.url")
EndIf

_Read_PersistentStore_Settings()


If $PressedOverlayButton_Overlay = "StartHomeLoader" Then
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PressedOverlayButton: " & "<StartHomeLoader>")
	_Start_HomeApp()
EndIf

If $PressedOverlayButton_Overlay = "Save" Then
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PressedOverlayButton: " & "<Save>")
	_Write_Save_Settings_to_HomeLoader_INI()
EndIf

If $PressedOverlayButton_Overlay = "StartGame" Then
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PressedOverlayButton: " & "<Save>")
	_Write_Save_Settings_to_HomeLoader_INI()
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PressedOverlayButton: " & "<StartGame>")
	_Start_Game()
EndIf



_Empty_PressedOverlayButton()
Exit



Func _Read_PersistentStore_Settings()
	$HomeApp_Overlay = ""
	$HomeLoaderOverlaySteamID_Overlay = ""

	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
    Local $sText = FileRead($filePath) ; Define a variable with a string of text.
    Local $aArray = StringSplit($sText, ',', $STR_ENTIRESPLIT) ; Pass the variable to StringSplit and using the delimiter "\n".

    For $i1 = 1 To $aArray[0] ; Loop through the array returned by StringSplit to display the individual values.
		Local $StringReplaced1 = StringReplace($aArray[$i1], '{', '')
		Local $StringReplaced2 = StringReplace($StringReplaced1, '}', '')
		Local $StringReplaced3 = StringReplace($StringReplaced2, '"', '')
        Local $StringSplit = StringSplit($StringReplaced3, ':', $STR_ENTIRESPLIT)

		If $StringSplit[1] = "HomeApp" Then
			$HomeApp_Overlay = $StringSplit[2] ; Home App
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "HomeApp = <" & $HomeApp_Overlay & ">")
			;MsgBox($MB_SYSTEMMODAL, "HomeApp", $HomeApp_Overlay)
		EndIf
		If $StringSplit[1] = "HomeAppSteamID" Then
			$HomeAppSteamID_Overlay = $StringSplit[2] ; Home App
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "HomeAppSteamID = <" & $HomeAppSteamID_Overlay & ">")
			;MsgBox($MB_SYSTEMMODAL, "HomeApp", $HomeAppSteamID_Overlay)
		EndIf
		If $StringSplit[1] = "HomeLoaderOverlaySteamID" Then
			$HomeLoaderOverlaySteamID_Overlay = $StringSplit[2] ; HomeLoaderOverlaySteamID
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "HomeLoaderOverlaySteamID = <" & $HomeLoaderOverlaySteamID_Overlay & ">")
			;MsgBox($MB_SYSTEMMODAL, "HomeLoaderOverlaySteamID", $HomeLoaderOverlaySteamID_Overlay)
		EndIf
		If $StringSplit[1] = "PressedOverlayButton" Then
			$PressedOverlayButton_Overlay = $StringSplit[2] ; PressedOverlayButton
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "PressedOverlayButton = <" & $PressedOverlayButton_Overlay & ">")
			;MsgBox($MB_SYSTEMMODAL, "1 - PressedOverlayButton_Overlay", $PressedOverlayButton_Overlay)
		EndIf
		If $StringSplit[1] = "AppIDLoaded" Then
			$AppIDLoaded_Overlay = $StringSplit[2] ; PressedOverlayButton
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "AppIDLoaded = <" & $AppIDLoaded_Overlay & ">")
			;MsgBox($MB_SYSTEMMODAL, "1 - PressedOverlayButton_Overlay", $AppIDLoaded_Overlay)
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox1" Then
			$OverlaySettings_Checkbox1 = $StringSplit[2] ;;; Update Overlay using HomeLoader ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox1 = <" & $OverlaySettings_Checkbox1 & ">")
			;MsgBox($MB_SYSTEMMODAL, "OverlaySettings_Checkbox1", $OverlaySettings_Checkbox1)
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox2" Then
			$OverlaySettings_Checkbox2 = $StringSplit[2] ;;; Use local Icons ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox2 = <" & $OverlaySettings_Checkbox2 & ">")
			;MsgBox($MB_SYSTEMMODAL, "OverlaySettings_Checkbox2", $OverlaySettings_Checkbox2)
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox3" Then
			$OverlaySettings_Checkbox3 = $StringSplit[2] ;;; Scan Steam Library on Home App Start ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox3 = <" & $OverlaySettings_Checkbox3 & ">")
			;MsgBox($MB_SYSTEMMODAL, "OverlaySettings_Checkbox3", $OverlaySettings_Checkbox3)
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox4" Then
			$OverlaySettings_Checkbox4 = $StringSplit[2] ;;; Add number of current Players to the game Icons ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox4 = <" & $OverlaySettings_Checkbox4 & ">")
			;MsgBox($MB_SYSTEMMODAL, "OverlaySettings_Checkbox4", $OverlaySettings_Checkbox4)
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox5" Then
			$OverlaySettings_Checkbox5 = $StringSplit[2] ;;; Add saved Supersampling settings to the game Icons ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox5 = <" & $OverlaySettings_Checkbox5 & ">")
			;MsgBox($MB_SYSTEMMODAL, "OverlaySettings_Checkbox5", $OverlaySettings_Checkbox5)
		EndIf
		If $StringSplit[1] = "OverlaySettings_Checkbox6" Then
			$OverlaySettings_Checkbox6 = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "OverlaySettings_Checkbox6 = <" & $OverlaySettings_Checkbox6 & ">")
			;MsgBox($MB_SYSTEMMODAL, "OverlaySettings_Checkbox5", $OverlaySettings_Checkbox6)
		EndIf
		If $StringSplit[1] = "RenderTargetMultiplier" Then
			$OverlaySettings_RenderTargetMultiplier = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "RenderTargetMultiplier = <" & $OverlaySettings_RenderTargetMultiplier & ">")
			;MsgBox($MB_SYSTEMMODAL, "OverlaySettings_Checkbox5", $OverlaySettings_Checkbox5)
		EndIf
		If $StringSplit[1] = "SupersampleScale" Then
			$OverlaySettings_SupersampleScale = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "SupersampleScale = <" & $OverlaySettings_SupersampleScale & ">")
			;MsgBox($MB_SYSTEMMODAL, "OverlaySettings_Checkbox5", $OverlaySettings_Checkbox5)
		EndIf
		If $StringSplit[1] = "AllowSupersampleFiltering" Then
			$OverlaySettings_AllowSupersampleFiltering = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "AllowSupersampleFiltering = <" & $OverlaySettings_AllowSupersampleFiltering & ">")
			;MsgBox($MB_SYSTEMMODAL, "OverlaySettings_Checkbox5", $OverlaySettings_Checkbox5)
		EndIf
		If $StringSplit[1] = "LabelCustomPage3" Then
			$OverlaySettings_LabelCustomPage3 = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCustomPage3 = <" & $OverlaySettings_LabelCustomPage3 & ">")
			;MsgBox($MB_SYSTEMMODAL, "$OverlaySettings_LabelCustomPage3", $OverlaySettings_Checkbox5)
		EndIf
		If $StringSplit[1] = "LabelCustomPage4" Then
			$OverlaySettings_LabelCustomPage4 = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCustomPage4 = <" & $OverlaySettings_LabelCustomPage4 & ">")
			;MsgBox($MB_SYSTEMMODAL, "$OverlaySettings_LabelCustomPage4", $OverlaySettings_Checkbox5)
		EndIf
		If $StringSplit[1] = "LabelCustomPage5" Then
			$OverlaySettings_LabelCustomPage5 = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCustomPage5 = <" & $OverlaySettings_LabelCustomPage5 & ">")
			;MsgBox($MB_SYSTEMMODAL, "$OverlaySettings_LabelCustomPage5", $OverlaySettings_Checkbox5)
		EndIf
		If $StringSplit[1] = "LabelCustomPage6" Then
			$OverlaySettings_LabelCustomPage6 = $StringSplit[2] ;;; Automatically apply the saved Supersampling settings to the game when it is launched ;;;
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "LabelCustomPage6 = <" & $OverlaySettings_LabelCustomPage6 & ">")
			;MsgBox($MB_SYSTEMMODAL, "$OverlaySettings_LabelCustomPage6", $OverlaySettings_Checkbox5)
		EndIf
		If $StringSplit[1] = $AppIDLoaded_Overlay & "_RenderTargetMultiplier" Then
			$OverlayGameRenderTargetMultiplier = $StringSplit[2] ; Home App
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "SS_RenderTargetMultiplier = <" & $OverlayGameRenderTargetMultiplier & ">")
			;MsgBox($MB_SYSTEMMODAL, "SS_RenderTargetMultiplier", $OverlayGameRenderTargetMultiplier)
		EndIf
		If $StringSplit[1] = $AppIDLoaded_Overlay & "_SupersampleScale" Then
			$OverlayGameSupersampleScale = $StringSplit[2] ; Home App
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "SS_SupersampleScale = <" & $OverlayGameSupersampleScale & ">")
			;MsgBox($MB_SYSTEMMODAL, "SS_SupersampleScale", $OverlayGameSupersampleScale)
		EndIf
		If $StringSplit[1] = $AppIDLoaded_Overlay & "_AllowSupersampleFiltering" Then
			$OverlayGameAllowSupersampleFiltering = $StringSplit[2] ; HomeLoaderOverlaySteamID
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " PersistentStore: " & "SS_AllowSupersampleFiltering = <" & $OverlayGameAllowSupersampleFiltering & ">")
			;MsgBox($MB_SYSTEMMODAL, "SS_AllowSupersampleFiltering", $OverlayGameAllowSupersampleFiltering)
		EndIf
    Next

	;MsgBox($MB_SYSTEMMODAL, "Values 1", "HomeApp: " & $HomeApp_Overlay & @CRLF & _
	;									"HomeAppSteamID_Overlay: " & $HomeAppSteamID_Overlay & @CRLF & _
	;									"HomeLoaderOverlaySteamID: " & $HomeLoaderOverlaySteamID_Overlay & @CRLF & _
	;									"PressedOverlayButton: " & $PressedOverlayButton_Overlay & @CRLF & _
	;									"AppIDLoaded: " & $AppIDLoaded_Overlay & @CRLF & _
	;									"OverlaySettings_Checkbox1: " & $OverlaySettings_Checkbox1 & @CRLF & _
	;									"OverlaySettings_Checkbox2: " & $OverlaySettings_Checkbox2 & @CRLF & _
	;									"OverlaySettings_Checkbox3: " & $OverlaySettings_Checkbox3 & @CRLF & _
	;									"OverlaySettings_Checkbox4: " & $OverlaySettings_Checkbox4 & @CRLF & _
	;									"OverlaySettings_Checkbox5: " & $OverlaySettings_Checkbox5 & @CRLF & _
	;									"OverlaySettings_Checkbox6: " & $OverlaySettings_Checkbox6 & @CRLF & _
	;									"Default_renderTargetMultiplier: " & $OverlaySettings_RenderTargetMultiplier & @CRLF & _
	;									"Default_supersampleScale: " & $OverlaySettings_SupersampleScale & @CRLF & _
	;									"Default_allowSupersampleFiltering: " & $OverlaySettings_AllowSupersampleFiltering & @CRLF & _
	;									"TAB3_Name: " & $OverlaySettings_LabelCustomPage3 & @CRLF & _
	;									"TAB4_Name: " & $OverlaySettings_LabelCustomPage4 & @CRLF & _
	;									"TAB5_Name: " & $OverlaySettings_LabelCustomPage5 & @CRLF & _
	;									"TAB6_Name: " & $OverlaySettings_LabelCustomPage6 & @CRLF & _
	;									"SS_RenderTargetMultiplier: " & $OverlayGameRenderTargetMultiplier & @CRLF & _
	;									"SS_SupersampleScale: " & $OverlayGameSupersampleScale & @CRLF & _
	;									"SS_AllowSupersampleFiltering: " & $OverlayGameAllowSupersampleFiltering & @CRLF)
EndFunc


Func _Write_Save_Settings_to_HomeLoader_INI()
	If $HomeApp_Overlay <> "" Then
		If $HomeApp_Overlay <> $HomeApp Then
			If $HomeApp_Overlay = "Default SteamVR Home" Then _StartUp_Radio_0()
			If $HomeApp_Overlay = "SteamVR Home" Then _StartUp_Radio_1()
			If $HomeApp_Overlay = "Vive Home" Then _StartUp_Radio_2()
			If $HomeApp_Overlay = "Janus VR" Then _StartUp_Radio_3()
			If $HomeApp_Overlay = "VR Toolbox" Then _StartUp_Radio_4()
			If $HomeApp_Overlay = "Other" Then _StartUp_Radio_5()
		EndIf
	EndIf

	IniWrite($Config_INI, "Settings_HomeAPP", "HomeAppSteamID", $HomeAppSteamID_Overlay)
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeLoaderOverlaySteamID", $HomeLoaderOverlaySteamID_Overlay)
	IniWrite($Config_INI, "Settings", "UpdateOverlay", $OverlaySettings_Checkbox1)
	IniWrite($Config_INI, "Settings", "Use_Local_Icons", $OverlaySettings_Checkbox2)
	IniWrite($Config_INI, "Settings", "ScanLibrary_OnStart", $OverlaySettings_Checkbox3)
	IniWrite($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", $OverlaySettings_Checkbox4)
	IniWrite($Config_INI, "Settings", "Add_SS_to_Icons", $OverlaySettings_Checkbox5)
	IniWrite($Config_INI, "Settings", "Add_SS_per_game", $OverlaySettings_Checkbox6)
	IniWrite($Config_INI, "SteamVR_Status", "default_renderTargetMultiplier", $OverlaySettings_RenderTargetMultiplier)
	IniWrite($Config_INI, "SteamVR_Status", "default_supersampleScale", $OverlaySettings_SupersampleScale)
	IniWrite($Config_INI, "SteamVR_Status", "default_allowSupersampleFiltering", $OverlaySettings_AllowSupersampleFiltering)
	IniWrite($Config_INI, "Settings", "TAB3_Name", $OverlaySettings_LabelCustomPage3)
	IniWrite($Config_INI, "Settings", "TAB4_Name", $OverlaySettings_LabelCustomPage4)
	IniWrite($Config_INI, "Settings", "TAB5_Name", $OverlaySettings_LabelCustomPage5)
	IniWrite($Config_INI, "Settings", "TAB6_Name", $OverlaySettings_LabelCustomPage6)

	;MsgBox(0, "_Write_Save_Settings_to_HomeLoader_INI", "Application_" & $AppIDLoaded_Overlay & @CRLF & @CRLF & $OverlayGameRenderTargetMultiplier & @CRLF & $OverlayGameSupersampleScale & @CRLF & $OverlayGameAllowSupersampleFiltering)
	If $OverlayGameRenderTargetMultiplier <> "" And $OverlayGameSupersampleScale <> "" And $OverlayGameAllowSupersampleFiltering <> "" Then
		$AppNR = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $AppIDLoaded_Overlay, "NR", "")
		;MsgBox(0, $AppNR, "Application_" & $AppIDLoaded_Overlay & @CRLF & @CRLF & $OverlayGameRenderTargetMultiplier & @CRLF & $OverlayGameSupersampleScale & @CRLF & $OverlayGameAllowSupersampleFiltering)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $AppIDLoaded_Overlay, "renderTargetMultiplier", $OverlayGameRenderTargetMultiplier)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $AppIDLoaded_Overlay, "supersampleScale", $OverlayGameSupersampleScale)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $AppIDLoaded_Overlay, "allowSupersampleFiltering", $OverlayGameAllowSupersampleFiltering)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $AppNR, "renderTargetMultiplier", $OverlayGameRenderTargetMultiplier)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $AppNR, "supersampleScale", $OverlayGameSupersampleScale)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $AppNR, "allowSupersampleFiltering", $OverlayGameAllowSupersampleFiltering)
	EndIf

	If $HomeLoaderOverlaySteamID <> $HomeLoaderOverlaySteamID_Overlay Then
		_Write_HomeLoaderOverlaySteamID_to_VRUB_PersistentStore_File()
	EndIf
EndFunc

Func _Write_HomeLoaderOverlaySteamID_to_VRUB_PersistentStore_File()
	Local $NEW_sText
	Local $NEW_HomeLoaderOverlaySteamID = IniRead($Config_INI, "Settings", "HomeLoaderOverlaySteamID", "")
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
    Local $sText = FileRead($filePath) ; Define a variable with a string of text.
	Local $iPosition_1 = StringInStr($sText, "HomeLoaderOverlaySteamID")
	Local $iPosition_2 = StringInStr($sText, ",", 0, 1, $iPosition_1)

	$Replace_String_length = $iPosition_2 - $iPosition_1
	$String_1 = StringTrimLeft($sText, $iPosition_1 - 2)
	$String_2 = StringTrimLeft($sText, $iPosition_2 - 1)
	$String = StringLeft($String_1, $Replace_String_length + 1)
	$NEW_sText = StringReplace($sText, $String, '"HomeLoaderOverlaySteamID":"' & $NEW_HomeLoaderOverlaySteamID & '"')

	If FileExists($filePath) Then FileDelete($filePath)
	FileWrite($filePath, $NEW_sText)
EndFunc

Func _Start_HomeApp()
	;MsgBox(0, "StartHomeApp", "StartHomeApp")
	If FileExists($System_DIR & "StartHomeApp.exe") Then
		ShellExecute($System_DIR & "StartHomeApp.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "StartHomeApp.au3", "", $System_DIR)
	EndIf
EndFunc


Func _Start_Game()
	_StartGame_Check()
	Exit
EndFunc



Func _Empty_PressedOverlayButton()
	Local $NEW_sText
	Local $filePath = _PathFull("VRUtilityBelt\PersistentStore\custom_vrub_HomeLoader.json", @AppDataDir)
    Local $sText = FileRead($filePath) ; Define a variable with a string of text.
	Local $iPosition_1 = StringInStr($sText, "PressedOverlayButton")
	Local $iPosition_2 = StringInStr($sText, ",", 0, 1, $iPosition_1)

	$Replace_String_length = $iPosition_2 - $iPosition_1
	$String_1 = StringTrimLeft($sText, $iPosition_1 - 2)
	$String_2 = StringTrimLeft($sText, $iPosition_2 - 1)
	$String = StringLeft($String_1, $Replace_String_length + 1)
	$NEW_sText = StringReplace($sText, $String, '"PressedOverlayButton":""')

	If FileExists($filePath) Then FileDelete($filePath)
	FileWrite($filePath, $NEW_sText)
EndFunc



Func _StartUp_Radio_0() ; Default [SteamVR Home]
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Default SteamVR Home")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/250820")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Default SteamVR Home")

	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	_ADD_2_SteamVR_Home_default()
	_Create_StartHomeAPP_BAT_File()
	_Sync_Config_INI()
EndFunc

Func _StartUp_Radio_1() ; SteamVR Home
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "SteamVR Home")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $SteamVR_Path & "tools\steamvr_environments\game\bin\win64\steamtours.exe")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "SteamVR Home")

	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	If $HomeApp = "Default SteamVR Home" Then _ADD_2_SteamVR_Home_default()
	_Create_StartHomeAPP_BAT_File()
	_Sync_Config_INI()
EndFunc

Func _StartUp_Radio_2() ; Vive Home
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Vive Home")
	Local $ViveHome_SDK_Path = $Install_DIR & "Apps\ViveHome\ViveHomeSDKTestbed.exe"
	Local $ViveHome_App_Path = $Install_DIR & "Apps\ViveHome\Home\win32\ViveHome.exe"
	Local $ViveHome_Path = $HTCVive_Path & "Updater\App\Home\win32\ViveHome.exe"

	If FileExists($ViveHome_SDK_Path) Then $ViveHome_Path = $ViveHome_SDK_Path
	If FileExists($ViveHome_App_Path) Then $ViveHome_Path = $ViveHome_App_Path

	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $ViveHome_Path)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")

	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	If $HomeApp = "Default SteamVR Home" Then _ADD_2_SteamVR_Home_default()
	_Create_StartHomeAPP_BAT_File()
	_Sync_Config_INI()
EndFunc

Func _StartUp_Radio_3() ; Janus VR
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

	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	If $HomeApp = "Default SteamVR Home" Then _ADD_2_SteamVR_Home_default()
	_Create_StartHomeAPP_BAT_File()
	_Sync_Config_INI()
EndFunc

Func _StartUp_Radio_4() ; VR Toolbox
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "VR Toolbox")
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")

	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	If $HomeApp = "Default SteamVR Home" Then _ADD_2_SteamVR_Home_default()
	_Create_StartHomeAPP_BAT_File()
	_Sync_Config_INI()
EndFunc

Func _StartUp_Radio_5() ; Other
	IniWrite($Config_INI, "Settings_HomeAPP", "HomeApp", "Other")
	;_StartUp_Add_Other_GUI()
	_Sync_Config_INI()
EndFunc


Func _StartGame_Check()
	$Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	Global $SteamGameID = $AppIDLoaded_Overlay
	Local $ApplicationList_Read = $ApplicationList_SteamLibrary_ALL_INI

	Local $Application_appid = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "appid", "")
	Global $Application_name = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "name", "")
	Local $Application_installdir = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "installdir", "")
	Local $Application_IconPath = IniRead($ApplicationList_Read, "Application_" & $SteamGameID, "IconPath", "")

	If $Add_SS_per_game = "true" Then
		;MsgBox(0, "_StartGame_Check 1", $Add_SS_per_game & @CRLF & $SteamGameID)
		_Add_SS_to_SteamVR()

		If ProcessExists("vrmonitor.exe") Then
			ProcessClose("vrmonitor.exe")
			;Sleep(10000)
			;ShellExecute("steam://rungameid/250820")
		EndIf

		Sleep(7000)

		;Do
			;Sleep(1000)
		;Until ProcessExists("vrmonitor.exe")

		ShellExecute("steam://rungameid/" & $SteamGameID)

	If $Autostart_VRUB = "true" Then
		If Not ProcessExists("VRUtilityBelt.exe") Then
			Sleep(10000)
			ShellExecute("steam://rungameid/645370")
			;Sleep(5000)
		EndIf
	EndIf

	EndIf
EndFunc

Func _Add_SS_to_SteamVR()
	If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK, $FC_OVERWRITE)

	Local $Steam_app_Name = $Application_name
	Local $Game_ID = $SteamGameID

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Starting adding SS to SteamVR: " & "<App ID: " & $Game_ID & ">" & " - " & "<App Name: " & $Steam_app_Name & ">")

	$FileLines = _FileCountLines($default_vrsettings_File)

	$default_renderTargetMultiplier_value = IniRead($Config_INI, "SteamVR_Status", "default_renderTargetMultiplier", "1.0")
	$default_supersampleScale_value = IniRead($Config_INI, "SteamVR_Status", "default_supersampleScale", "1.0")
	$default_allowSupersampleFiltering_value = IniRead($Config_INI, "SteamVR_Status", "default_allowSupersampleFiltering", "true")

	Local $renderTargetMultiplier_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "renderTargetMultiplier", $default_renderTargetMultiplier_value)
	Local $supersampleScale_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "supersampleScale", $default_supersampleScale_value)
	Local $allowSupersampleFiltering_value = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Game_ID, "allowSupersampleFiltering", $default_allowSupersampleFiltering_value)

	;MsgBox(0, "_Add_SS_to_SteamVR 1", $Add_SS_per_game & @CRLF & @CRLF & $Game_ID & @CRLF & $renderTargetMultiplier_value & @CRLF & $supersampleScale_value & @CRLF & $allowSupersampleFiltering_value)

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
	IniWrite($Config_INI, "TEMP", "HomeLoaderState_SSDATA", "loaded")
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End adding SS to SteamVR: " & "<App ID: " & $Game_ID & ">" & " - " & "<App Name: " & $Steam_app_Name & ">")
EndFunc



Func _ADD_2_SteamVR_Home_default()
	Local $Line_NR_binary_path_windows
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	Local $Install_DIR_StringReplace = StringReplace($Install_DIR, '\', '/')
	Local $NewHomePath = StringTrimRight($Install_DIR_StringReplace, 1) & "/System/StartHomeAPP.bat"
	_FileReadToArray($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File)
	_ArrayDisplay($Array_tools_vrmanifest_File, "Original", Default, 8)

	If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
	FileDelete($Steam_tools_vrmanifest_File)

    For $LOOP_vrmanifest = 1 To $Array_tools_vrmanifest_File[0]
		Local $ReadLine_tools_vrmanifest = $Array_tools_vrmanifest_File[$LOOP_vrmanifest]
		If $ReadLine_tools_vrmanifest = '			"app_key": "openvr.tool.steamvr_environments",' Then
			Local $Line_NR_binary_path_windows = $LOOP_vrmanifest + 3
		EndIf

		If $LOOP_vrmanifest = $Line_NR_binary_path_windows Then
			Local $NewLine = '			"binary_path_windows" : "' & $NewHomePath & '",'
			If $HomeApp = "Default SteamVR Home" Then $NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
			FileWriteLine($Steam_tools_vrmanifest_File, $NewLine)
		Else
			FileWriteLine($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File[$LOOP_vrmanifest])
		EndIf
    Next
EndFunc

Func _Create_StartHomeAPP_BAT_File()
	$HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
	If FileExists($StartHomeAPP_bat) Then FileDelete($StartHomeAPP_bat)
	If FileExists($StartSteamVRHome_au3) Then Local $StartSteamVRHome_x = "StartSteamVRHome.au3"
	If FileExists($StartSteamVRHome_exe) Then Local $StartSteamVRHome_x = "StartSteamVRHome.exe"

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


Func _Sync_Config_INI()
	FileCopy($Config_INI, $System_DIR & "config.ini", $FC_OVERWRITE)
EndFunc

