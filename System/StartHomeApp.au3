
#include <File.au3>
#include <Date.au3>
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>

Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)

Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "")
Global $stats_log_FILE = @ScriptDir & "\Logs\stats_log.txt"

Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Local $Vive_Home_Folder_1 = StringInStr($Home_Path, "\", 1, - 1)
Local $Vive_Home_Folder_2 = StringLeft($Home_Path, $Vive_Home_Folder_1)

FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Home APP:")
FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Home APP = " & $HomeApp)
FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Home Path = " & $Home_Path)

_Start_actions_before()

If $HomeApp = "SteamVR Home" Then ShellExecute($Home_Path, "-vr")
If $HomeApp = "VR Toolbox" Then	ShellExecute($Home_Path, "-e")
If $HomeApp = "Vive Home" Then ShellExecute($Home_Path, "", $Vive_Home_Folder_2)
If $HomeApp <> "SteamVR Home" And $HomeApp <> "VR Toolbox" And $HomeApp <> "Vive Home" Then ShellExecute($Home_Path)

FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " --- Home APP " & $HomeApp & " started --- " & "[" & _Now() & "]")

_Start_actions_after()

Exit

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
	EndIf

EndFunc
