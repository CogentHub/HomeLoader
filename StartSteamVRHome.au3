#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\coding\Home_Loader\Compile_Icons\Play_Starten.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>
#include <Misc.au3>
#include <_IsPressed360.au3>
$dll_1 = DllOpen("xinput9_1_0.dll")
$dll_2 = DllOpen("user32.dll")

Opt("GUIOnEventMode", 1)

Global $Config_INI = @ScriptDir & "\config.ini"
Global $Install_DIR = @ScriptDir & "\"
Global $ChangeDefaultSteamVRHome = IniRead($Config_INI, "Settings", "ChangeDefaultSteamVRHome", "")
Global $Start_HomeLoader_with_HomeApp = IniRead($Config_INI, "Settings", "Start_HomeLoader_with_HomeApp", "false")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $State_USE_Key_Presses = IniRead($Config_INI, "Settings", "USE_Key_Presses", "")
Global $TEMP_StartHomeSettings = IniRead($Config_INI, "TEMP", "StartHomeLoaderSettings", "")


If $State_USE_Key_Presses = "true" Then
	_Key_Presses_Detection()
EndIf

If $Start_HomeLoader_with_HomeApp = "true" Then _Start_Home_Loader()
If $Start_HomeLoader_with_HomeApp = "false" Then _Start_Home_APP()
_Exit()

Func _Key_Presses_Detection()
	Global $Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	Global $Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	Global $Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	Global $Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	Global $Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

	Global $Array_tools_vrmanifest_File, $LOOP_vrmanifest_1, $LOOP_vrmanifest_2, $Line_NR_binary_path_windows

	If $Install_Folder_Steam_1 = "" Then
		Global $Install_Folder_Steam_Search_Folder = "C:\Program Files (x86)\Steam\Steam.exe"
		Global $Install_Folder_Steam_Folder = StringReplace($Install_Folder_Steam_Search_Folder, 'Steam.exe', '')

		If FileExists($Install_Folder_Steam_Search_Folder) Then
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $Install_Folder_Steam_Folder)
		Else
			$Steam_Folder = "C:\Program Files (x86)\Steam\"
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $Steam_Folder)
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

	Sleep(1000)

	If _IsPressed("20", $dll_2) Then ; Space Bar Button Pressed
		_Start_Button_Pressed()
	EndIf
	If _IsPressed360(16, $dll_1) Then ; Start Button Pressed
		_Start_Button_Pressed()
	EndIf
	If _IsPressed360(4096, $dll_1) Then ; A Button Pressed
		_StartUp_Radio_1()
	EndIf
	If _IsPressed360(8192, $dll_1) Then ; B Button Pressed
		_StartUp_Radio_2()
	EndIf
	If _IsPressed360(-32768, $dll_1) Then ; Y Button Pressed
		_StartUp_Radio_3()
	EndIf
	If _IsPressed360(16384, $dll_1) Then ; X Button Pressed"
		_StartUp_Radio_4()
	EndIf
	If _IsPressed360(256, $dll_1) Then ; LB Button Pressed
		_StartUp_Radio_5()
	EndIf
	If _IsPressed360(512, $dll_1) Then ; RB Button Pressed
		_StartUp_Radio_6()
	EndIf
EndFunc

Func _Start_Home_APP()
	Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
	Global $WindowName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	If Not ProcessExists("vrmonitor.exe") Then ShellExecute("steam://rungameid/250820")
	If $WindowName <> "SteamVR Home" Then ShellExecute($Home_Path)
	Exit
EndFunc

Func _Start_Home_Loader()
	If Not WinExists("Home Loader") Then
		If FileExists($Install_DIR & "HomeLoader.exe") Then
			ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
		Else
			ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
		EndIf
	EndIf
EndFunc

Func _Start_Button_Pressed()
	$TEMP_StartHomeSettings = IniRead($Config_INI, "TEMP", "StartHomeLoaderSettings", "")
	IniWrite($Config_INI, "TEMP", "StartHomeLoaderSettings", "true")
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
	EndIf
	_Exit()
EndFunc

Func _StartUp_Radio_1()
	If FileExists("C:\Program Files (x86)\ViveSetup\Updater\App\Home\win32\ViveHome.exe") Then
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "C:\Program Files (x86)\ViveSetup\Updater\App\Home\win32\ViveHome.exe")
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	EndIf

	If $ChangeDefaultSteamVRHome = "true" Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
	EndIf
EndFunc

Func _StartUp_Radio_2()
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/575430")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Home")

	If $ChangeDefaultSteamVRHome = "true" Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
	EndIf
EndFunc

Func _StartUp_Radio_3()
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")

	If $ChangeDefaultSteamVRHome = "true" Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
	EndIf
EndFunc

Func _StartUp_Radio_4()
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/602090")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Janus VR")

	If $ChangeDefaultSteamVRHome = "true" Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
	EndIf
EndFunc

Func _StartUp_Radio_5()
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/250820")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "SteamVR Home")

	If $ChangeDefaultSteamVRHome = "true" Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
	EndIf
EndFunc

Func _StartUp_Radio_6()
	If $ChangeDefaultSteamVRHome = "true" Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
	EndIf
EndFunc

Func _ADD_2_SteamVR_Home_default()
	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	$Install_DIR_StringReplace = StringReplace($Install_DIR, '\', '/')
	$NewHomePath = StringTrimRight($Install_DIR_StringReplace, 1) & "/StartSteamVRHome.exe"
	_FileReadToArray($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File)
	_ArrayDisplay($Array_tools_vrmanifest_File)

	If FileExists($Steam_tools_vrmanifest_File) Then FileDelete($Steam_tools_vrmanifest_File)

    For $LOOP_vrmanifest_1 = 1 To $Array_tools_vrmanifest_File[0]
		$ReadLine_tools_vrmanifest = $Array_tools_vrmanifest_File[$LOOP_vrmanifest_1]
		If $ReadLine_tools_vrmanifest = '			"app_key": "openvr.tool.steamvr_environments",' Then
			Local $Line_NR_binary_path_windows = $LOOP_vrmanifest_1 + 3
		EndIf

		If $LOOP_vrmanifest_1 = $Line_NR_binary_path_windows Then
			$NewLine = '			"binary_path_windows" : "' & $NewHomePath & '",'
			If $WinName =  "SteamVR Home" Then $NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
			FileWriteLine($Steam_tools_vrmanifest_File, $NewLine)
		Else
			FileWriteLine($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File[$LOOP_vrmanifest_1])
		EndIf
    Next
EndFunc

Func _Exit()
	DllClose($dll_1)
	DllClose($dll_2)
	Exit
EndFunc

