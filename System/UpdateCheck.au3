#include <WindowsConstants.au3>
#include <InetConstants.au3>
#include <File.au3>
#include <Zip.au3>


Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
Global $System_DIR = $Install_DIR & "\System\"
Global $Config_INI = $System_DIR & "config.ini"
Global $Version = IniRead($config_ini, "Settings", "Version", "")

Global $UpdateFolder = $System_DIR & "Update\"
Global $UpdateTargetFolder = $Install_DIR ; & "Home_Loader_Update\"
Global $Update_ZIP = $System_DIR & "TEMP.zip"

Global $Update_Check = IniRead($Config_INI, "TEMP", "Update_Check", "")

Global $Anzeige_Fortschrittbalken, $Get_Update_State

_Check_for_Updates()
Sleep(1000)
If $Update_Check <> "true" Then _Restart_Settings_GUI()

Func _Loading_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	Global $GUI_Loading = GUICreate("Updating Home Loader...", 250, 105, - 1, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	GUISetIcon(@AutoItExe, -2, $GUI_Loading)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	Global $Updating_Label = GUICtrlCreateLabel("...Searching...", 58, 5, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	;GUICtrlSetColor(-1, $COLOR_RED)

	$Anzeige_Fortschrittbalken = GUICtrlCreateProgress(5, 38, 240, 30)

	Global $Please_wait_Label = GUICtrlCreateLabel("...Please wait...", 49, 72, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	;GUICtrlSetColor(-1, $COLOR_RED)

	GUISetState(@SW_SHOW, $GUI_Loading)
	WinSetOnTop("Updating Home Loader...", "", $WINDOWS_ONTOP)
EndFunc

Func _Check_for_Updates()
	$Update_Check = IniRead($Config_INI, "TEMP", "Update_Check", "")

	$Version_NR = StringRight($Version, 2)
	$New_Version_NR = StringRight($Version_NR, 2) + 1
	IniWrite($config_ini, "TEMP", "Update_Version", $New_Version_NR)

	Local $Update_URL = "https://github.com/CogentHub/HomeLoader/releases/download/v0." & $New_Version_NR & "/Home_Loader_0." & $New_Version_NR & ".zip"

	If $Update_Check <> "true" Then _Loading_GUI()

	For $Update_Loop = $New_Version_NR To $New_Version_NR + 5
		If $Update_Loop > 35 Then GUICtrlSetData($Anzeige_Fortschrittbalken, 35)

		$Get_Update_State = "true"
		IniWrite($config_ini, "TEMP", "Update_Version", $Update_Loop)
		$Update_URL = "https://github.com/CogentHub/HomeLoader/releases/download/v0." & $Update_Loop & "/Home_Loader_0." & $Update_Loop & ".zip"
		$Get_Update = InetGet($Update_URL, $Update_ZIP, $INET_FORCERELOAD)

		If $Get_Update = 0 Then
			$Get_Update_State = "false"
		EndIf

		If $Get_Update_State = "true" Then
			$Get_Update_State = "true"
			$Get_Update_Version_NR = $Update_Loop
			GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
			Sleep(800)
			ExitLoop
		EndIf
	Next

	If $Update_Check = "true" Then
		If $Get_Update_State = "true" Then
			MsgBox($MB_OK + $MB_ICONINFORMATION, "New Update available", "There is a new update available." & @CRLF & "--> " & "Home Loader 0." & $New_Version_NR)
		EndIf
	Else
		If $Get_Update_State = "true" Then
			;GUISetState(@SW_HIDE, $GUI_Loading)
			WinSetOnTop("Updating Home Loader", "", $WINDOWS_NOONTOP)
			$Abfrage = MsgBox($MB_YESNOCANCEL + $MB_ICONINFORMATION, "Check for Updates", "New Version found:" & @CRLF & "Home Loader '0." & $Get_Update_Version_NR & "'" & @CRLF & @CRLF &  _
																							"Do you want to install the new Version?")

			If $Abfrage = 6 Then
				WinSetOnTop("Updating Home Loader", "", $WINDOWS_ONTOP)
				GUICtrlSetData($Updating_Label, "...Preparing...")
				Sleep(500)
				WinSetOnTop("Updating Home Loader", "", $WINDOWS_ONTOP)
				GUICtrlSetData($Updating_Label, "...Updating...")
				GUICtrlSetData($Anzeige_Fortschrittbalken, "")
				GUICtrlSetData($Anzeige_Fortschrittbalken, 20)
				DirCopy ($Install_DIR, $Install_DIR & "Backups\Home_Loader_" & $Version, $FC_OVERWRITE)
				GUICtrlSetData($Anzeige_Fortschrittbalken, 50)
				If FileExists($UpdateFolder) Then DirRemove($UpdateFolder, $DIR_REMOVE)
				_Zip_UnzipAll($Update_ZIP, $UpdateFolder, 0)
				GUICtrlSetData($Anzeige_Fortschrittbalken, 70)
				;DirCopy($UpdateFolder, $UpdateTargetFolder, $FC_OVERWRITE)
				GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
				Sleep(2000)
				;GUISetState(@SW_HIDE, $GUI_Loading)
				WinSetOnTop("Updating Home Loader", "", $WINDOWS_NOONTOP)
				IniWrite($config_ini, "TEMP", "Update", "Updated")
				MsgBox($MB_ICONINFORMATION, "Check for Updates", "Home Loader updated to version 0." & $Get_Update_Version_NR & "." & @CRLF & @CRLF & _
																	"Some Files and settings from the old version were saved: " & @CRLF & $Install_DIR & "Backups\Home_Loader_" & $Version)
				_Update_Finished()
			EndIf
		EndIf

		If $Get_Update_State = "false" Then
			;GUISetState(@SW_HIDE, $GUI_Loading)
			WinSetOnTop("Updating Home Loader", "", $WINDOWS_NOONTOP)
			MsgBox($MB_ICONINFORMATION, "Check for Updates", "No Update available.")
			IniWrite($config_ini, "TEMP", "Update", "")
			IniWrite($Config_INI, "TEMP", "Update_Check", "")
		EndIf

		GUIDelete($GUI_Loading)
	EndIf

	IniWrite($Config_INI, "TEMP", "Update_Check", "")
	IniWrite($config_ini, "TEMP", "Update_Version", "")
	If FileExists($UpdateFolder) Then DirRemove($UpdateFolder, $DIR_REMOVE)
	If FileExists($Update_ZIP) Then FileDelete($Update_ZIP)
EndFunc



Func _Update_Finished()
		If FileExists($System_DIR & "Update.exe") Then
			ShellExecute($System_DIR & "Update.exe", "", $Install_DIR)
		Else
			If FileExists($System_DIR & "Update.au3") Then
				ShellExecute($System_DIR & "Update.au3", "", $Install_DIR)
			EndIf
		EndIf
EndFunc


Func _Restart_Settings_GUI()
	If FileExists($System_DIR & "Settings.exe") Then
		ShellExecute($System_DIR & "Settings.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "Settings.au3", "", $System_DIR)
	EndIf
	If FileExists($UpdateFolder) Then DirRemove($UpdateFolder, $DIR_REMOVE)
	If FileExists($Update_ZIP) Then FileDelete($Update_ZIP)
	Exit
EndFunc

