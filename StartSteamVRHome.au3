#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Compile_Icons\Play_Starten.ico
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
Global $Start_HomeLoader_with_HomeApp = IniRead($Config_INI, "Settings", "Start_HomeLoader_with_HomeApp", "")
Global $Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $State_USE_Key_Presses = IniRead($Config_INI, "Settings", "USE_Key_Presses", "")
Global $TEMP_StartHomeSettings = IniRead($Config_INI, "TEMP", "StartHomeLoaderSettings", "")
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")

Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath") & "\"

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


If $State_USE_Key_Presses = "true" Then
	_Key_Presses_Detection()
EndIf

If $Advanced_Settings = "true" And $Start_HomeLoader_with_HomeApp = "true" Then
	_Start_Home_Loader()
EndIf

_Start_Home_APP()
_Exit()


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


Func _Key_Presses_Detection()

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

Func _Start_Home_Loader()
	If Not WinExists("Home Loader") Then
		If FileExists($Install_DIR & "HomeLoader.exe") Then
			ShellExecute($Install_DIR & "HomeLoader.exe", "", $Install_DIR)
		Else
			ShellExecute($Install_DIR & "HomeLoader.au3", "", $Install_DIR)
		EndIf
	EndIf
EndFunc

Func _Start_Home_APP()
	Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
	Global $WindowName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	If Not ProcessExists("vrmonitor.exe") Then ShellExecute("steam://rungameid/250820")
	If $WindowName <> "SteamVR Home" Then ShellExecute($Home_Path)
	Exit
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

Func _StartUp_Radio_1() ; SteamVR Home
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/250820")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "SteamVR Home")

	If $ChangeDefaultSteamVRHome = "true" Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
	EndIf
EndFunc

Func _StartUp_Radio_2() ; Vive Home
	If FileExists($HTCVive_Path & "Updater\App\Home\win32\ViveHome.exe") Then
		IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $HTCVive_Path & "Updater\App\Home\win32\ViveHome.exe")
		IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Vive Home")
	EndIf

	If $ChangeDefaultSteamVRHome = "true" Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
	EndIf
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

	If $ChangeDefaultSteamVRHome = "true" Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
	EndIf
EndFunc

Func _StartUp_Radio_4() ; VR Toolbox
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")

	If $ChangeDefaultSteamVRHome = "true" Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
	EndIf
EndFunc

Func _StartUp_Radio_5() ; Other
	If $ChangeDefaultSteamVRHome = "true" Then
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
		_ADD_2_SteamVR_Home_default()
	Else
		IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "false")
	EndIf
EndFunc

Func _StartUp_Radio_6() ; Not in use
	;;;
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

Func _FirstStart_Restart()
	If FileExists($Install_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($Install_DIR & "HomeLoaderLibrary.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "HomeLoaderLibrary.au3", "", $Install_DIR)
	EndIf
	Exit
EndFunc

Func _Restart()
	If FileExists($Install_DIR & "StartSteamVRHome.exe") Then
		ShellExecute($Install_DIR & "StartSteamVRHome.exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & "StartSteamVRHome.au3", "", $Install_DIR)
	EndIf
	Exit
EndFunc

Func _Exit()
	DllClose($dll_1)
	DllClose($dll_2)
	Exit
EndFunc

