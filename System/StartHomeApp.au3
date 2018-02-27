
#Region Includes
#include <File.au3>
#include <Date.au3>
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>
#endregion

#Region Declare Variables/Const 1
Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)

Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "")

Global $Autostart_App_1_State = IniRead($Config_INI, "Autostart", "App_1_State", "")
Global $Autostart_App_2_State = IniRead($Config_INI, "Autostart", "App_2_State", "")
Global $Autostart_App_3_State = IniRead($Config_INI, "Autostart", "App_3_State", "")
Global $Autostart_App_4_State = IniRead($Config_INI, "Autostart", "App_4_State", "")
Global $Autostart_App_5_State = IniRead($Config_INI, "Autostart", "App_5_State", "")
Global $Autostart_App_6_State = IniRead($Config_INI, "Autostart", "App_6_State", "")
Global $Autostart_App_7_State = IniRead($Config_INI, "Autostart", "App_7_State", "")
Global $Autostart_App_8_State = IniRead($Config_INI, "Autostart", "App_8_State", "")
Global $Autostart_App_9_State = IniRead($Config_INI, "Autostart", "App_9_State", "")

Global $Autostart_App_1_Name = IniRead($Config_INI, "Autostart", "App_1_Name", "")
Global $Autostart_App_2_Name = IniRead($Config_INI, "Autostart", "App_2_Name", "")
Global $Autostart_App_3_Name = IniRead($Config_INI, "Autostart", "App_3_Name", "")
Global $Autostart_App_4_Name = IniRead($Config_INI, "Autostart", "App_4_Name", "")
Global $Autostart_App_5_Name = IniRead($Config_INI, "Autostart", "App_5_Name", "")
Global $Autostart_App_6_Name = IniRead($Config_INI, "Autostart", "App_6_Name", "")
Global $Autostart_App_7_Name = IniRead($Config_INI, "Autostart", "App_7_Name", "")
Global $Autostart_App_8_Name = IniRead($Config_INI, "Autostart", "App_8_Name", "")
Global $Autostart_App_9_Name = IniRead($Config_INI, "Autostart", "App_9_Name", "")

Global $Autostart_App_1_Path = IniRead($Config_INI, "Autostart", "App_1_Path", "")
Global $Autostart_App_2_Path = IniRead($Config_INI, "Autostart", "App_2_Path", "")
Global $Autostart_App_3_Path = IniRead($Config_INI, "Autostart", "App_3_Path", "")
Global $Autostart_App_4_Path = IniRead($Config_INI, "Autostart", "App_4_Path", "")
Global $Autostart_App_5_Path = IniRead($Config_INI, "Autostart", "App_5_Path", "")
Global $Autostart_App_6_Path = IniRead($Config_INI, "Autostart", "App_6_Path", "")
Global $Autostart_App_7_Path = IniRead($Config_INI, "Autostart", "App_7_Path", "")
Global $Autostart_App_8_Path = IniRead($Config_INI, "Autostart", "App_8_Path", "")
Global $Autostart_App_9_Path = IniRead($Config_INI, "Autostart", "App_9_Path", "")

Global $stats_log_FILE = @ScriptDir & "\Logs\stats_log.txt"

Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Local $Vive_Home_Folder_1 = StringInStr($Home_Path, "\", 1, - 1)
Local $Vive_Home_Folder_2 = StringLeft($Home_Path, $Vive_Home_Folder_1)
#endregion


FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Home APP:")
FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Home APP = " & $HomeApp)
FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Home Path = " & $Home_Path)


#Region Start Actions
_Start_actions_before()

If $HomeApp = "SteamVR Home" Then ShellExecute($Home_Path, "-vr")
If $HomeApp = "VR Toolbox" Then	ShellExecute($Home_Path, "-e")
If $HomeApp = "Vive Home" Then ShellExecute($Home_Path, "", $Vive_Home_Folder_2)
If $HomeApp <> "SteamVR Home" And $HomeApp <> "VR Toolbox" And $HomeApp <> "Vive Home" Then ShellExecute($Home_Path)


FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " --- Home APP " & $HomeApp & " started --- " & "[" & _Now() & "]")

_Start_actions_after()
#endregion

Exit

#Region Start Funktionen
Func _Start_actions_before()
	Local $Start_HomeLoaderGUI = IniRead($Config_INI, "Settings", "Start_HomeLoaderGUI", "")
	Local $Start_HomeLoaderLibrary = IniRead($Config_INI, "Settings", "Start_HomeLoaderLibrary", "")
	Local $Start_Settings = IniRead($Config_INI, "Settings", "Start_Settings", "")

	If $Start_HomeLoaderGUI = "true" Then
		If FileExists($Install_DIR & "Home Loader GUI.exe") Then
			ShellExecute($Install_DIR & "Home Loader GUI.exe", "", $Install_DIR)
		Else
			ShellExecute($Install_DIR & "Home Loader GUI.au3", "", $Install_DIR)
		EndIf
	EndIf

	If $Start_HomeLoaderLibrary = "true" Then
		If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
			ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
		Else
			ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
		EndIf
	EndIf

	If $Start_Settings = "true" Then
		If FileExists($System_DIR & "Settings.exe") Then
			ShellExecute($System_DIR & "Settings.exe", "", $System_DIR)
		Else
			ShellExecute($System_DIR & "Settings.au3", "", $System_DIR)
		EndIf
	EndIf
EndFunc

Func _Start_actions_after()
	Sleep(3000)
	If $Autostart_VRUB = "true" Then
		If ProcessExists("VRUtilityBelt.exe") Then
			ProcessClose("VRUtilityBelt.exe")
			Sleep(1000)
		EndIf
		If Not ProcessExists("VRUtilityBelt.exe") Then
			Sleep(1000)
			If Not ProcessExists("VRUtilityBelt.exe") Then
				Sleep(1000)
				ShellExecute("steam://rungameid/645370")
				Sleep(100)
			EndIf
		EndIf
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " --- VRUB " & "VRUtilityBelt" & " started --- " & "[" & _Now() & "]")
		Sleep(3000)
	EndIf

	For $LOOP = 1 To 9
		$Autostart_App_Name = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_Name", "")
		$Autostart_App_Path = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_Path", "")
		$Autostart_App_State = IniRead($Config_INI, "Autostart", "App_" & $LOOP & "_State", "")

		If $Autostart_App_State = "true" Then
			If $Autostart_App_Path <> "" Then
				ShellExecute($Autostart_App_Path)
			EndIf
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " --- APP " & $Autostart_App_Name & " started --- " & $Autostart_App_Path &  " --- " &"[" & _Now() & "]")
			Sleep(3000)
		EndIf
	Next
	Sleep(1000)
EndFunc

#endregion