#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Cogent

 Script Function:
	Home Loader.

#ce ----------------------------------------------------------------------------

#Region Includes
#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <ColorConstants.au3>
#include <InetConstants.au3>
#endregion

Opt("GUIOnEventMode", 1)

#Region Declare Variables/Const 1
Global $Version = "0.55"
Global $Install_DIR = @ScriptDir & "\"
Global $System_DIR = $Install_DIR & "\System\"
Global $config_ini = $System_DIR & "\config.ini"
Global $Auto_CheckUpdates = IniRead($Config_INI, "Settings", "Auto_CheckUpdates", "")
Global $Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")
Global $gfx = $Install_DIR & "System\gfx\"
Global $Skin = IniRead($Config_INI, "Settings", "Skin", "1")
Global $Close_MainGUI_after_selection = IniRead($Config_INI, "Settings", "Close_MainGUI_after_selection", "false")

Global $Update_ZIP = $System_DIR & "TEMP.zip"

Global $Home_Loader_GUI, $contextmenu, $RM_Item0,  $RM_Item1, $RM_Item2, $RM_Item3, $RM_Item4, $RM_Item5, $RM_Item6

IniWrite($config_ini, "Settings", "Version", $Version)
#endregion

#Region First Start Check
If $First_Start = "true" Then
	_Button_5()
	Exit
EndIf
#endregion

Global $font = "arial"

If $Skin = "1" Then _Home_Loader_GUI_1()
If $Skin = "2" Then _Home_Loader_GUI_2()

If $Auto_CheckUpdates = "true" Then _Check_for_Updates()

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


Func _Home_Loader_GUI_1()
	Global $Home_Loader_GUI = GUICreate("Home Loader GUI", 465, 315, - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	Global $Button_1 = GUICtrlCreateButton("Home Loader Library", 15, 15, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderLibrary.bmp")
	GuiCtrlSetTip(-1, "Opens Home Loader Library.")
	GUICtrlSetOnEvent(- 1, "_Button_1")

	Global $Button_2 = GUICtrlCreateButton("Home Loader Playlist", 165, 15, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderPlaylist.bmp")
	GuiCtrlSetTip(-1, "Opens Home Loader Playlist.")
	GUICtrlSetOnEvent(- 1, "_Button_2")

	Global $Button_3 = GUICtrlCreateButton("Supersampling menus", 315, 15, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Supersampling_menu.bmp")
	GuiCtrlSetTip(-1, " Opens the Supersampling menu.")
	GUICtrlSetOnEvent(- 1, "_Button_3")


	Global $Button_4 = GUICtrlCreateButton("Start SteamVR HomeApp", 15, 165, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Start_SteamVR_HomeApp.bmp")
	GuiCtrlSetTip(-1, "Starts SteamVR HomeApp.")
	GUICtrlSetOnEvent(- 1, "_Button_4")

	Global $Button_5 = GUICtrlCreateButton("Home Loader Settings", 165, 165, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderSettings.bmp")
	GuiCtrlSetTip(-1, " Opens Home Loader Settings.")
	GUICtrlSetOnEvent(- 1, "_Button_5")

	Global $Button_6 = GUICtrlCreateButton("Close", 315, 165, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Close.bmp")
	GuiCtrlSetTip(-1, "Close/Exit.")
	GUICtrlSetOnEvent(- 1, "_Button_Exit_GUI")

	For $Loop = 1 To 6
		If $Loop = 1 Then $contextmenu = GUICtrlCreateContextMenu($Button_1)
		If $Loop = 2 Then $contextmenu = GUICtrlCreateContextMenu($Button_2)
		If $Loop = 3 Then $contextmenu = GUICtrlCreateContextMenu($Button_3)
		If $Loop = 4 Then $contextmenu = GUICtrlCreateContextMenu($Button_4)
		If $Loop = 5 Then $contextmenu = GUICtrlCreateContextMenu($Button_5)
		If $Loop = 6 Then $contextmenu = GUICtrlCreateContextMenu($Button_6)
		$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
		$RM_Item1 = GUICtrlCreateMenuItem("Skin 1", $contextmenu)
			GUICtrlSetOnEvent(- 1, "_RM_Item1")
		$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
		$RM_Item3 = GUICtrlCreateMenuItem("Skin 2", $contextmenu)
			GUICtrlSetOnEvent(- 1, "_RM_Item3")
		$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
		$RM_Item5 = GUICtrlCreateMenuItem("Info", $contextmenu)
			GUICtrlSetOnEvent(- 1, "_RM_Item5")
		$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	Next

	GUISetState()
EndFunc

Func _Home_Loader_GUI_2()
	Global $aButton[10]
	Global $Home_Loader_GUI = GUICreate("Test Windows regions", 160, 890, @DesktopWidth-170, -1, $WS_POPUP, $WS_EX_TOPMOST)

	$aButton[0] = GUICtrlCreateButton("Button 1", 10, 10, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderLibrary.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_1")
	$aButton[1] = GUICtrlCreateButton("Button 2", 10, 155, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderPlaylist.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_2")
	$aButton[2] = GUICtrlCreateButton("Button 3", 10, 300, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Supersampling_menu.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_3")
	$aButton[3] = GUICtrlCreateButton("Button 4", 10, 445, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Start_SteamVR_HomeApp.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_4")
	$aButton[4] = GUICtrlCreateButton("Button 4", 10, 590, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_HomeLoaderSettings.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_5")
	$aButton[5] = GUICtrlCreateButton("Exit", 10, 735, 136, 136, $BS_BITMAP)
	_GUICtrlButton_SetImage(- 1, $gfx & "Button_Close.bmp")
	GUICtrlSetOnEvent(- 1, "_Button_6")

	; Frame
	$aButton[6] = GUICtrlCreateButton("", 0, 0, 4, 883, $BS_BITMAP)
	GUICtrlSetBkColor(- 1, $COLOR_Blue)
	$aButton[7] = GUICtrlCreateButton("", 150, 0, 4, 883, $BS_BITMAP)
	GUICtrlSetBkColor(- 1, $COLOR_Blue)
	$aButton[8] = GUICtrlCreateButton("", 0, 0, 151, 4, $BS_BITMAP)
	GUICtrlSetBkColor(- 1, $COLOR_Blue)
	$aButton[9] = GUICtrlCreateButton("", 0, 878, 154, 4, $BS_BITMAP)
	GUICtrlSetBkColor(- 1, $COLOR_Blue)

	For $Loop = 0 To 12
		Global $contextmenu = GUICtrlCreateContextMenu($Loop)
		Global $RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
		Global $RM_Item1 = GUICtrlCreateMenuItem("Skin 1", $contextmenu)
			GUICtrlSetOnEvent(- 1, "_RM_Item1")
		Global $RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
		Global $RM_Item3 = GUICtrlCreateMenuItem("Skin 2", $contextmenu)
			GUICtrlSetOnEvent(- 1, "_RM_Item3")
		Global $RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
		Global $RM_Item5 = GUICtrlCreateMenuItem("Info", $contextmenu)
			GUICtrlSetOnEvent(- 1, "_RM_Item5")
		Global $RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
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
EndFunc   ;==>_GuiHole

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
EndFunc   ;==>_AddCtrlRegion



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
	$Close_MainGUI_after_selection = IniRead($Config_INI, "Settings", "Close_MainGUI_after_selection", "false")
	If FileExists($System_DIR & "StartSteamVRHome.exe") Then
		ShellExecute($System_DIR & "StartSteamVRHome.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "StartSteamVRHome.au3", "", $System_DIR)
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


Func _RM_Item1()
	IniWrite($Config_INI, "Settings", "Skin", "1")
	_Button_Restart_GUI()
EndFunc

Func _RM_Item3()
	IniWrite($Config_INI, "Settings", "Skin", "2")
	_Button_Restart_GUI()
EndFunc

Func _RM_Item5()
	MsgBox(0, "Home Loader by CogentRifter", "Home Loader by CogentRifter")
EndFunc


Func _Check_for_Updates()
	IniWrite($Config_INI, "TEMP", "Update_Check", "true")
	If FileExists($System_DIR & "UpdateCheck.exe") Then
		ShellExecute($System_DIR & "UpdateCheck.exe")
	Else
		ShellExecute($System_DIR & "UpdateCheck.au3")
	EndIf
EndFunc


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

#AutoIt3Wrapper_Run_After=SignMe.exe /"Home Loader GUI.exe" /"Cogent.pfx"


