
#Region Includes
#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ColorConstants.au3>
#include <File.au3>
#endregion

Opt("GUIOnEventMode", 1)

#Region Declare Variables/Const 1
Global $Install_DIR = @ScriptDir & "\"
Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
Global $Version = IniRead($Config_INI, "Settings", "Version", "")
Global $System_DIR = $Install_DIR & "System\"
If Not FileExists($Config_INI) Then FileCopy($System_DIR & "config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $HomeLoader_StartBat = $System_DIR & "StartHomeAPP.bat"
Global $Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")
Global $gfx = $Install_DIR & "System\gfx\"
Global $Skin = IniRead($Config_INI, "Settings", "Skin", "1")
Global $ChangeDefaultSteamVRHome = IniRead($Config_INI, "Settings", "ChangeDefaultSteamVRHome", "")
Global $Close_MainGUI_after_selection = IniRead($Config_INI, "Settings", "Close_MainGUI_after_selection", "false")

Global $Start_HomeLoaderGUI = IniRead($Config_INI, "Settings", "Start_HomeLoaderGUI", "false")
Global $Start_HomeLoaderLibrary = IniRead($Config_INI, "Settings", "Start_HomeLoaderLibrary", "false")
Global $Start_Settings = IniRead($Config_INI, "Settings", "Start_Settings", "false")

Global $Home_Loader_GUI, $contextmenu, $RM_Item0, $RM_Item1, $RM_Item2, $RM_Item3, $RM_Item4, $RM_Item5, $RM_Item6
Global $font = "arial"
#endregion

#Region First Start Check
If $First_Start = "true" Then
	_Button_5()
	Exit
EndIf
#endregion


If $Skin = "1" Then _Home_Loader_GUI_1()
If $Skin = "2" Then _Home_Loader_GUI_2()


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

#Region Main
Func _Home_Loader_GUI_1()
	Global $Home_Loader_GUI = GUICreate("HomeLoader GUI", 465, 315, - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	Global $Button_1 = GUICtrlCreateButton("Home Loader Library", 15, 15, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderLibrary.bmp")
	GuiCtrlSetTip(-1, "Opens Home Loader Library.")
	GUICtrlSetOnEvent(- 1, "_Button_1")

	;Global $Button_2 = GUICtrlCreateButton("Placeholder", 165, 15, 136, 136, $BS_BITMAP)
	;_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderLibrary.bmp")
	;GuiCtrlSetTip(-1, "Placeholder")
	;GUICtrlSetOnEvent(- 1, "_Button_2")

	Global $Button_3 = GUICtrlCreateButton("Supersampling menus", 165, 15, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Supersampling_menu.bmp")
	GuiCtrlSetTip(-1, " Opens the Supersampling menu.")
	GUICtrlSetOnEvent(- 1, "_Button_3")


	Global $Button_4 = GUICtrlCreateButton("Start SteamVR HomeApp", 15, 165, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Start_SteamVR_HomeApp.bmp")
	GuiCtrlSetTip(-1, "Starts SteamVR HomeApp.")
	GUICtrlSetOnEvent(- 1, "_Button_4")

	Global $Button_5 = GUICtrlCreateButton("Home Loader Settings", 315, 15, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderSettings.bmp")
	GuiCtrlSetTip(-1, " Opens Home Loader Settings.")
	GUICtrlSetOnEvent(- 1, "_Button_5")

	Global $Button_6 = GUICtrlCreateButton("Close", 315, 165, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Close.bmp")
	GuiCtrlSetTip(-1, "Close/Exit.")
	GUICtrlSetOnEvent(- 1, "_Button_Exit_GUI")

	For $Loop = 1 To 5
		If $Loop = 1 Then $contextmenu = GUICtrlCreateContextMenu($Button_1)
		If $Loop = 2 Then $contextmenu = GUICtrlCreateContextMenu($Button_3)
		If $Loop = 3 Then $contextmenu = GUICtrlCreateContextMenu($Button_4)
		If $Loop = 4 Then $contextmenu = GUICtrlCreateContextMenu($Button_5)
		If $Loop = 5 Then $contextmenu = GUICtrlCreateContextMenu($Button_6)
		;If $Loop = 6 Then $contextmenu = GUICtrlCreateContextMenu($Button_6)
		$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
		$RM_Item1 = GUICtrlCreateMenuItem("Skin 1", $contextmenu, -1, 1)
			If $Skin = "1" Then GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(- 1, "_RM_Item1")
		$RM_Item2 = GUICtrlCreateMenuItem("Skin 2", $contextmenu, -1, 1)
			If $Skin = "2" Then GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(- 1, "_RM_Item2")
		$RM_Item3 = GUICtrlCreateMenuItem("", $contextmenu)
		$RM_Item4 = GUICtrlCreateMenuItem("Start HomeLoaderGUI with Home App", $contextmenu)
			If $Start_HomeLoaderGUI = "true" Then GUICtrlSetState($RM_Item4, $GUI_CHECKED)
			GUICtrlSetOnEvent(- 1, "_RM_Item4")
		$RM_Item5 = GUICtrlCreateMenuItem("Start HomeLoaderLibrary with Home App", $contextmenu)
			If $Start_HomeLoaderLibrary = "true" Then GUICtrlSetState($RM_Item5, $GUI_CHECKED)
			GUICtrlSetOnEvent(- 1, "_RM_Item5")
		$RM_Item6 = GUICtrlCreateMenuItem("Start Settings with Home App", $contextmenu)
			If $Start_Settings = "true" Then GUICtrlSetState($RM_Item6, $GUI_CHECKED)
			GUICtrlSetOnEvent(- 1, "_RM_Item6")
		$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
		$RM_Item8 = GUICtrlCreateMenuItem("", $contextmenu)
		$RM_Item9 = GUICtrlCreateMenuItem("Info", $contextmenu)
			GUICtrlSetOnEvent(- 1, "_RM_Item9")
		$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	Next

	GUISetState()
EndFunc

Func _Home_Loader_GUI_2()
	Global $aButton[10]
	Global $Home_Loader_GUI = GUICreate("HomeLoader GUI", 160, 750, @DesktopWidth-170, -1, $WS_POPUP, $WS_EX_TOPMOST)

	$aButton[0] = GUICtrlCreateButton("Button 1", 10, 10, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderLibrary.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_1")
	;$aButton[1] = GUICtrlCreateButton("Button 2", 10, 155, 136, 136, $BS_BITMAP)
	;_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderLibrary.bmp")
	;GUICtrlSetOnEvent(- 1, "_Button_2")
	$aButton[1] = GUICtrlCreateButton("Button 3", 10, 155, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Supersampling_menu.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_3")
	$aButton[2] = GUICtrlCreateButton("Button 4", 10, 445, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Start_SteamVR_HomeApp.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_4")
	$aButton[3] = GUICtrlCreateButton("Button 4", 10, 300, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderSettings.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_5")
	$aButton[4] = GUICtrlCreateButton("Exit", 10, 590, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Close.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_6")

	; Frame
	$aButton[5] = GUICtrlCreateButton("", 0, 0, 4, 735, $BS_BITMAP)
	GUICtrlSetBkColor(- 1, $COLOR_Blue)
	$aButton[6] = GUICtrlCreateButton("", 150, 0, 4, 735, $BS_BITMAP)
	GUICtrlSetBkColor(- 1, $COLOR_Blue)
	$aButton[7] = GUICtrlCreateButton("", 0, 0, 151, 4, $BS_BITMAP)
	GUICtrlSetBkColor(- 1, $COLOR_Blue)
	$aButton[8] = GUICtrlCreateButton("", 0, 733, 154, 4, $BS_BITMAP)
	GUICtrlSetBkColor(- 1, $COLOR_Blue)

	For $Loop = 0 To 12
		Global $contextmenu = GUICtrlCreateContextMenu($Loop)
		$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
		$RM_Item1 = GUICtrlCreateMenuItem("Skin 1", $contextmenu, -1, 1)
			If $Skin = "1" Then GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(- 1, "_RM_Item1")
		$RM_Item2 = GUICtrlCreateMenuItem("Skin 2", $contextmenu, -1, 1)
			If $Skin = "2" Then GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(- 1, "_RM_Item2")
		$RM_Item3 = GUICtrlCreateMenuItem("", $contextmenu)
		$RM_Item4 = GUICtrlCreateMenuItem("Start HomeLoaderGUI with Home App", $contextmenu)
			If $Start_HomeLoaderGUI = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(- 1, "_RM_Item4")
		$RM_Item5 = GUICtrlCreateMenuItem("Start HomeLoaderLibrary with Home App", $contextmenu)
			If $Start_HomeLoaderLibrary = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(- 1, "_RM_Item5")
		$RM_Item6 = GUICtrlCreateMenuItem("Start Settings with Home App", $contextmenu)
			If $Start_Settings = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(- 1, "_RM_Item6")
		$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
		$RM_Item8 = GUICtrlCreateMenuItem("", $contextmenu)
		$RM_Item9 = GUICtrlCreateMenuItem("Info", $contextmenu)
			GUICtrlSetOnEvent(- 1, "_RM_Item9")
		$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	Next

	GUISetState(@SW_SHOW)
	$pos = WinGetPos($Home_Loader_GUI)
	_GuiHole($Home_Loader_GUI, 0, 0, 150, 150)
EndFunc

Func _GuiHole($h_win, $i_x, $i_y, $i_sizew, $i_sizeh)
	Local $outer_rgn, $inner_rgn, $combined_rgn
	$combined_rgn = _WinAPI_CreateRectRgn(0, 0, 0, 0)
	_WinAPI_DeleteObject($outer_rgn)
	_WinAPI_DeleteObject($inner_rgn)
	_AddCtrlRegion($combined_rgn, $aButton)
	_WinAPI_SetWindowRgn($h_win, $combined_rgn)
EndFunc

Func _AddCtrlRegion($full_rgn, $ctrl_id)
	Local $ctrl_pos, $ctrl_rgn
	If IsArray($ctrl_id) Then
		For $i = 0 To UBound($ctrl_id) -1
			$ctrl_pos = ControlGetPos($Home_Loader_GUI, "", $ctrl_id[$i])
			$ctrl_rgn = _WinAPI_CreateRectRgn($ctrl_pos[0], $ctrl_pos[1], $ctrl_pos[0] + $ctrl_pos[2], $ctrl_pos[1] + $ctrl_pos[3])
			_WinAPI_CombineRgn($full_rgn, $full_rgn, $ctrl_rgn, $RGN_OR)
			_WinAPI_DeleteObject($ctrl_rgn)
		Next
	Else
		$ctrl_pos = ControlGetPos($Home_Loader_GUI, "", $ctrl_id)
		$ctrl_rgn = _WinAPI_CreateRectRgn($ctrl_pos[0], $ctrl_pos[1], $ctrl_pos[0] + $ctrl_pos[2], $ctrl_pos[1] + $ctrl_pos[3])
		_WinAPI_CombineRgn($full_rgn, $full_rgn, $ctrl_rgn, $RGN_OR)
		_WinAPI_DeleteObject($ctrl_rgn)
	EndIf
EndFunc
#endregion

#Region Buttons
Func _Button_1()
	$Close_MainGUI_after_selection = IniRead($Config_INI, "Settings", "Close_MainGUI_after_selection", "false")
	IniWrite($Config_INI, "TEMP", "Show_Playlist", "")
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	If $Close_MainGUI_after_selection = "true" Then _Button_Exit_GUI()
EndFunc

Func _Button_2()
	$Close_MainGUI_after_selection = IniRead($Config_INI, "Settings", "Close_MainGUI_after_selection", "false")
	IniWrite($Config_INI, "TEMP", "Show_Playlist", "true")
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	If $Close_MainGUI_after_selection = "true" Then _Button_Exit_GUI()
EndFunc

Func _Button_3()
	$Close_MainGUI_after_selection = IniRead($Config_INI, "Settings", "Close_MainGUI_after_selection", "false")
	IniWrite($Config_INI, "TEMP", "Show_SS_Menu", "true")
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	If $Close_MainGUI_after_selection = "true" Then _Button_Exit_GUI()
EndFunc

Func _Button_4()
	$ChangeDefaultSteamVRHome = IniRead($Config_INI, "Settings", "ChangeDefaultSteamVRHome", "")
	$Close_MainGUI_after_selection = IniRead($Config_INI, "Settings", "Close_MainGUI_after_selection", "false")

	If $ChangeDefaultSteamVRHome = "true" Then
		If Not ProcessExists("vrmonitor.exe") Then
			ShellExecute("steam://rungameid/250820")
		EndIf
	Else
		If FileExists($HomeLoader_StartBat) Then
			ShellExecute($HomeLoader_StartBat, "", $System_DIR)
		Else
			If FileExists($System_DIR & "StartSteamVRHome.exe") Then
				ShellExecute($System_DIR & "StartSteamVRHome.exe", "", $System_DIR)
			Else
				ShellExecute($System_DIR & "StartSteamVRHome.au3", "", $System_DIR)
			EndIf
		EndIf
	EndIf

	If $Close_MainGUI_after_selection = "true" Then _Button_Exit_GUI()
EndFunc

Func _Button_5()
	$Close_MainGUI_after_selection = IniRead($Config_INI, "Settings", "Close_MainGUI_after_selection", "false")
	If FileExists($System_DIR & "Settings.exe") Then
		ShellExecute($System_DIR & "Settings.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "Settings.au3", "", $System_DIR)
	EndIf
	If $Close_MainGUI_after_selection = "true" Then _Button_Exit_GUI()
EndFunc

Func _Button_6()
	_Button_Exit_GUI()
	;Exit
EndFunc
#endregion

#Region RM Klick
Func _RM_Item1()
	IniWrite($Config_INI, "Settings", "Skin", "1")
	_Button_Restart_GUI()
EndFunc

Func _RM_Item2()
	IniWrite($Config_INI, "Settings", "Skin", "2")
	_Button_Restart_GUI()
EndFunc



Func _RM_Item4()
	$Start_HomeLoaderGUI = IniRead($Config_INI, "Settings", "Start_HomeLoaderGUI", "false")
	If $Start_HomeLoaderGUI = "true" Then
		IniWrite($Config_INI, "Settings", "Start_HomeLoaderGUI", "false")
	Else
		IniWrite($Config_INI, "Settings", "Start_HomeLoaderGUI", "true")
	EndIf
	_Button_Restart_GUI()
EndFunc

Func _RM_Item5()
	$Start_HomeLoaderLibrary = IniRead($Config_INI, "Settings", "Start_HomeLoaderLibrary", "false")
	If $Start_HomeLoaderLibrary = "true" Then
		IniWrite($Config_INI, "Settings", "Start_HomeLoaderLibrary", "false")
	Else
		IniWrite($Config_INI, "Settings", "Start_HomeLoaderLibrary", "true")
	EndIf
	_Button_Restart_GUI()
EndFunc

Func _RM_Item6()
	$Start_Settings = IniRead($Config_INI, "Settings", "Start_Settings", "false")
	If $Start_Settings = "true" Then
		IniWrite($Config_INI, "Settings", "Start_Settings", "false")
	Else
		IniWrite($Config_INI, "Settings", "Start_Settings", "true")
	EndIf
	_Button_Restart_GUI()
EndFunc


Func _RM_Item9()
	MsgBox(0, "Home Loader by CogentRifter", "Home Loader by CogentRifter")
EndFunc
#endregion

#Region Func Restart / Exit / Reload
Func _Button_Restart_GUI()
	If FileExists($Install_DIR & "Home Loader GUI.exe") Then
		ShellExecute($Install_DIR & "Home Loader GUI.exe")
	Else
		ShellExecute($Install_DIR & "Home Loader GUI.au3")
	EndIf
	;Sleep(500)
	Exit
EndFunc

Func _Button_Exit_GUI()
	GUIDelete($Home_Loader_GUI)
	Exit
EndFunc
#endregion

