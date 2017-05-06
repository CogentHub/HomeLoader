#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <GuiButton.au3>
#include <FontConstants.au3>

Opt("GUIOnEventMode", 1)

Global $SteamVR_Status, $Title_1, $Title_2, $Handle_1, $Handle_2, $Title_Array_1, $Title_Array_2, $Handle_Array_1, $Handle_Array_2, $NR_Handle_1, $NR_Handle_2
Global $GameStarted, $LOOP_VIVEHOMECheck, $OldWindowExists, $Button_Close_Current_Running, $Checkbox_Show_Settings_at_Startup, $Button_Restart, $Button_Exit
Global $Select_HomeApp_Label, $USE_GUI_Backup

Global $Config_INI = @ScriptDir & "\config.ini"
Global $Install_DIR = @ScriptDir & "\"
Global $Show_Settings_at_Startup = IniRead($Config_INI, "Settings", "Show_Settings_at_Startup", "")
Global $TEMP_StartHomeLoader = IniRead($Config_INI, "TEMP", "StartHomeLoader", "")
Global $USE_FB_GUI = IniRead($Config_INI, "Settings", "USE_GUI", "")
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $Time_Interval = IniRead($Config_INI, "Settings", "Time_Interval", "")
Global $Status_Checkbox_Minimize_OVRS = IniRead($Config_INI,"Settings", "Minimize_Oculus", "")
Global $gfx = $Install_DIR & "gfx\"

If $Install_DIR = "" Then
	$Install_DIR = @ScriptDir & "\"
	IniWrite($Config_INI, "Settings", "Install_Folder", $Install_DIR)
EndIf

If $Home_Path = "" Or $Show_Settings_at_Startup = "true" Or $Show_Settings_at_Startup = "First Start"  Then
	If $TEMP_StartHomeLoader <> "true" Then
		StartUp_settings()
	Else
		IniWrite($Config_INI, "TEMP", "StartHomeLoader", "false")
	EndIf
EndIf

GUICtrlSetOnEvent($Button_Close_Current_Running, "_Close_CurrentRunning")
GUICtrlSetOnEvent($Checkbox_Show_Settings_at_Startup, "_Checkbox_Show_Settings_at_Startup")
GUICtrlSetOnEvent($Button_Restart, "_Restart_HomeLoader")
GUICtrlSetOnEvent($Button_Exit, "_Exit")

_MAIN()


Func _MAIN()
	Global $LimeGreen = "0x32CD32"
	Global $Blue = "0x00BFFF"
	Global $Yellow = "0xFFFF00"

	$USE_FB_GUI = IniRead($Config_INI, "Settings", "USE_GUI", "")

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

	$font_arial = "arial"

	If $USE_FB_GUI = "true" Then
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
	EndIf

	If Not ProcessExists("vrmonitor.exe") Then
		ShellExecute("steam://rungameid/250820")
		Do
			Sleep(1000)
		Until ProcessExists("vrmonitor.exe")
	EndIf

	ShellExecute($Home_Path)
	Sleep(2000)

	If $WinName = "" Then
		Sleep(3000)
		$WinName = WinGetTitle("[ACTIVE]")
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", $WinName)
	EndIf


	_Check_Open_Windows_1()

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
			_Check_Open_Windows_1()
			$HOMECheck = "false"
			For $LOOP_VIVEHOMECheck = 0 To $NR_Handle_1
				If $Title_Array_1[$LOOP_VIVEHOMECheck] = $WinName or $Title_Array_1[$LOOP_VIVEHOMECheck] = $WinName Then
					$HOMECheck = "true"
				EndIf
			Next

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
				Until Not WinExists($WinName)
				If $USE_FB_GUI = "true" Then WinSetState("Home Loader", "", @SW_DISABLE)
				Sleep(3000)
			Else
				Sleep($Time_Interval & "000")
			EndIf

			_Check_Open_Windows_2()

			If $NR_Handle_1 <> $NR_Handle_2 Then
				_Check_Windows_Title()
				$OldWindowExists = "false"
				Local $Check_Exist_GameStarted = _ArraySearch($Title_Array_1, $GameStarted, 0, $Title_Array_1[0])
				If $Check_Exist_GameStarted <> "-1" Then $OldWindowExists = "true"

				If $OldWindowExists = "true" Then
					_Check_Windows_Title()
				EndIf
			EndIf

			If $GameStarted <> "" and $GameStarted <> "Oculus" and $GameStarted <> "Vive Home" and $GameStarted <> "SteamVR-Status" and $GameStarted <> "SteamVR Status" and $GameStarted <> "SteamVR-Running..." and $OldWindowExists <> "true" and $GameStarted <> "Home Loader" and $GameStarted <> "VR Home" and $GameStarted <> $WinName Then
				If $USE_FB_GUI = "true" Then WinSetOnTop("Home Loader", "", $WINDOWS_ONTOP)
				Do
					If $USE_FB_GUI = "true" Then
						GUICtrlSetData($GUI_Label, $GameStarted)
						GUISetBkColor($LimeGreen)
					EndIf
					If $Status_Checkbox_Minimize_OVRS = "true" Then
						If WinExists("Oculus") Then WinSetState("Oculus", "", @SW_MINIMIZE)
					EndIf
					Sleep($Time_Interval & "000")
					If Not ProcessExists("vrmonitor.exe") Then Exit
				Until Not WinExists($GameStarted)
				If $USE_FB_GUI = "true" Then WinSetState("Home Loader", "", @SW_DISABLE)

				If Not WinExists($GameStarted) Then
					ShellExecute($Home_Path)
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


Func StartUp_settings()
	If $Show_Settings_at_Startup = "First Start" Then IniWrite($Config_INI, "Settings", "Show_Settings_at_Startup", "")
    Global $GUI_StartUp_settings = GUICreate("Home Loader Startup settings", 250, 293, -1, -1, $WS_EX_TOPMOST)
	GUISetIcon(@AutoItExe, -2, $GUI_StartUp_settings)
    GUISetState(@SW_SHOW, $GUI_StartUp_settings)

	Global $font_StartUp_arial = "arial"

	GUICtrlCreateGroup("Home app:", 5, 5, 235, 70)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)

	Global $StartUp_Radio_1 = GUICtrlCreateRadio("Vive Home", 10, 25, 75)
		If $WinName = "Vive Home" Then GUICtrlSetState($StartUp_Radio_1, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_1, "_StartUp_Radio_1")
	Global $StartUp_Radio_2 = GUICtrlCreateRadio("VR Home", 90, 25, 75)
		If $WinName = "VR Home" Then GUICtrlSetState($StartUp_Radio_2, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_2, "_StartUp_Radio_2")
	Global $StartUp_Radio_3 = GUICtrlCreateRadio("VR Toolbox", 10, 45, 75)
		If $WinName = "VR Toolbox" Then GUICtrlSetState($StartUp_Radio_3, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_3, "_StartUp_Radio_3")
	Global $StartUp_Radio_4 = GUICtrlCreateRadio("Other (automatic detedtion)", 90, 45, 145)
		If $WinName <> "Vive Home" And $WinName <> "VR Home" And $WinName <> "VR Toolbox" And $Home_Path <> "" Then GUICtrlSetState($StartUp_Radio_4, $GUI_CHECKED)
		GUICtrlSetOnEvent($StartUp_Radio_4, "_StartUp_Radio_4")

	GUICtrlCreateGroup("Home Loader Settings:", 5, 80, 235, 110)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 11, 400, 6, $font_StartUp_arial)

	$State_Checkbox_Show_Settings_at_Startup = IniRead($config_ini,"Settings", "Show_Settings_at_Startup", "")
	Global $Checkbox_Show_Settings_at_Startup = GUICtrlCreateCheckbox(" Show Settings at Startup", 10, 100, 180, 20) ; 430
		If $State_Checkbox_Show_Settings_at_Startup = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Show_Settings_at_Startup, "_Checkbox_Show_Settings_at_Startup")

	$State_Checkbox_USE_GUI = IniRead($config_ini,"Settings", "USE_GUI", "")
	Global $Checkbox_USE_GUI = GUICtrlCreateCheckbox(" Use Status Window", 10, 120, 170, 20) ; 430
		If $State_Checkbox_USE_GUI = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_USE_GUI, "_Checkbox_USE_GUI")

	$State_Checkbox_Minimize_Oculus = IniRead($config_ini,"Settings", "Minimize_Oculus", "")
	Global $Checkbox_Minimize_Oculus = GUICtrlCreateCheckbox(" Minimize Oculus Shop", 10, 140, 170, 20) ; 430
		If $State_Checkbox_Minimize_Oculus = "True" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GUICtrlSetOnEvent($Checkbox_Minimize_Oculus, "_Checkbox_Minimize_Oculus")

	$State_StartUp_Radio_1 = GUICtrlRead($StartUp_Radio_1)
	$State_StartUp_Radio_2 = GUICtrlRead($StartUp_Radio_2)
	$State_StartUp_Radio_3 = GUICtrlRead($StartUp_Radio_3)
	$State_StartUp_Radio_4 = GUICtrlRead($StartUp_Radio_4)

	GUICtrlCreateLabel("Scan time interval", 10, 160, 127, 20)
	GUICtrlSetFont(-1, 11, 400, 1, $font_StartUp_arial)
	GuiCtrlSetTip(-1, "Time in Seconds. " & "Sets Time for the 'pause Loop'.")
	Global $Value_Time_Interval = IniRead($config_ini, "Settings", "Time_Interval", "")
	Global $Input_Time_Interval = GUICtrlCreateInput($Value_Time_Interval, 130, 160, 43, 19)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, "", $font_StartUp_arial)
	GuiCtrlSetTip(-1, "Time in Seconds. " & "Sets Time for the 'pause Loop'.")
	Global $UpDown_Time_Interval = GUICtrlCreateUpdown($Input_Time_Interval)
	GuiCtrlSetTip(-1, "Time in Seconds. " & "Sets Time for the 'pause Loop'.")
	GUICtrlSetOnEvent($UpDown_Time_Interval, "_UpDown_Time_Interval")

	Global $Exit = GUICtrlCreateButton("Close", 5, 195, 235, 30)
	GUICtrlSetFont(-1, 14, 600, 2, $font_StartUp_arial)
	GUICtrlSetColor(-1, "0x006600")
	GUICtrlSetOnEvent($Exit, "_Exit")

	If $State_StartUp_Radio_1 <> "4" Or $State_StartUp_Radio_2 <> "4" Or $State_StartUp_Radio_3 <> "4" Or $State_StartUp_Radio_4 <> "4" Then
		_StartUp_Button_HomeLoader()
	Else
		Global $Select_HomeApp_Label = GUICtrlCreateLabel("Select Home App first", 18, 230, 235, 40)
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

Func _StartUp_Radio_1()
	If FileExists("C:\Program Files (x86)\ViveSetup\Updater\App\Home\win32\ViveHome.exe") Then
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "C:\Program Files (x86)\ViveSetup\Updater\App\Home\win32\ViveHome.exe")
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	Else
		$FileSelect = FileOpenDialog("Select 'VIVEHome.exe' File", "", "")
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	EndIf
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_2()
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/575430")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Home")
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_3()
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Radio_4()
	MsgBox(0, "Select your Home app.", "Select the app you want to start." & @CRLF & "It can be an .exe File or the Steam start URL." & @CRLF & "To use the Steam start URL don't choose a File and select cancel." & @CRLF & "Instead Enter the Steam App ID so that it can use the Steam start URL.")
	$FileSelect = FileOpenDialog("Select the app you want to start." & "It can be an .exe File or the Steam start URL." & "To use the Steam start URL don't choose a File and  select cancel. Instead Enter the Steam App ID so that it can use the Steam start URL.", "", "")
	If $FileSelect = "" Then
		$FileSelect = InputBox("Steam APP ID", "Enter the Steam APP ID for the app you want to start")
		If $FileSelect <> "" Then $FileSelect = "steam://rungameid/" & $FileSelect
	EndIf
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "")
	_StartUp_Button_HomeLoader()
EndFunc

Func _StartUp_Button_HomeLoader()
	$State_StartUp_Radio_1 = GUICtrlRead($StartUp_Radio_1)
	$State_StartUp_Radio_2 = GUICtrlRead($StartUp_Radio_2)
	$State_StartUp_Radio_3 = GUICtrlRead($StartUp_Radio_3)
	$State_StartUp_Radio_4 = GUICtrlRead($StartUp_Radio_4)

	If $State_StartUp_Radio_1 <> "4" Or $State_StartUp_Radio_2 <> "4" Or $State_StartUp_Radio_3 <> "4" Or $State_StartUp_Radio_4 <> "4" Then
		GUICtrlDelete($Select_HomeApp_Label)
		Global $Button_Start_HomeLoader = GUICtrlCreateButton("Start Home Loader", 5, 230, 235, 30)
		GUICtrlSetFont(-1, 14, 600, 2, $font_StartUp_arial)
		GUICtrlSetColor(-1, "0x006600")
		GUICtrlSetOnEvent($Button_Start_HomeLoader, "_StartUp_Exit")
	EndIf
EndFunc

Func _StartUp_Exit()
	GUIDelete($GUI_StartUp_settings)
	IniWrite($Config_INI, "TEMP", "StartHomeLoader", "true")
	_Restart_HomeLoader()
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

Func _Checkbox_USE_GUI()
	$State_Checkbox = GUICtrlRead($Checkbox_USE_GUI)

	If $State_Checkbox = 1 Then
		IniWrite($config_ini, "Settings", "USE_GUI", "true")
	EndIf

	If $State_Checkbox = 4 Then
		IniWrite($config_ini, "Settings", "USE_GUI", "false")
		IniWrite($config_ini, "Settings", "Show_Settings_at_Startup", "false")
		GUICtrlSetState($Checkbox_Show_Settings_at_Startup, $GUI_UNCHECKED)
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

Func _UpDown_Time_Interval()
	$Value_UpDown = GUICtrlRead($Input_Time_Interval)

	If $Value_UpDown < 0 Then
		IniWrite($config_ini, "Settings", "Time_Interval", "0")
		GUICtrlSetData($Input_Time_Interval, "0")
	EndIf

	If $Value_UpDown > 9 Then
		IniWrite($config_ini, "Settings", "Time_Interval", "9")
		GUICtrlSetData($Input_Time_Interval, "9")
	EndIf

	If $Value_UpDown > 0 And $Value_UpDown < 9 Then
		IniWrite($config_ini, "Settings", "Time_Interval", $Value_UpDown)
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
EndFunc

Func _Close_CurrentRunning()
	WinClose($GameStarted)
	_Restart_HomeLoader()
	If WinExists($WinName) Then WinActivate($WinName)
	Exit
EndFunc

Func _Settings()
	IniWrite($config_ini, "Settings", "First_Start", "")
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
	EndIf
	Exit
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
	Exit
EndFunc
