#include <WindowsConstants.au3>
#include <InetConstants.au3>
#include <File.au3>
#include <Zip.au3>

Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $Config_INI = $System_DIR & "config.ini"
Global $Version = IniRead($config_ini, "Settings", "Version", "")

Global $UpdateTargetFolder = $Install_DIR ; & "Home_Loader_Update\"
Global $Update_ZIP = $System_DIR & "TEMP.zip"
Global $Update_File = $System_DIR & "HomeLoaderSetup.exe"

Global $Update_Check = IniRead($Config_INI, "TEMP", "Update_Check", "")
Global $Update_Check_2 = IniRead($Config_INI, "TEMP", "Update", "")

Global $Anzeige_Fortschrittbalken, $Get_Update_State, $Updating_Label, $GUI_Loading

_Check_for_Updates()
Sleep(1000)
If $Update_Check_2 = "true" Then _Restart_Settings_GUI()
Exit

Func _Loading_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000
	Global $XPOSGUI = - 1
	;If $Update_Check = "true" Then $XPOSGUI = 10000

	Global $GUI_Loading = GUICreate("Updating Home Loader...", 250, 105, $XPOSGUI, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	If $Update_Check = "true" Then GUISetState(@SW_HIDE, $GUI_Loading)
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
	;_Loading_GUI()
	If $Update_Check_2 = "true" Then _Loading_GUI()
	$Update_Check = IniRead($Config_INI, "TEMP", "Update_Check", "")

	$Version_NR = StringRight($Version, 2)
	$New_Version_NR = StringRight($Version_NR, 2) + 1
	IniWrite($config_ini, "TEMP", "Update_Version", $New_Version_NR)

	Local $Update_URL = "https://github.com/CogentHub/HomeLoader/releases/download/v0." & $New_Version_NR & "/HomeLoaderSetup.exe"

	Local $Fortschrittbalken_Value = 0
	GUICtrlSetData($Updating_Label, "...Loading...")
	$Get_Update_State = "false"
	For $Update_Loop = $New_Version_NR To $New_Version_NR + 5
		IniWrite($config_ini, "TEMP", "Update_Version", $Update_Loop)
		$Update_URL = "https://github.com/CogentHub/HomeLoader/releases/download/v0." & $Update_Loop & "/HomeLoaderSetup.exe"
		Local $Get_Update = InetGet($Update_URL, $Update_File, $INET_FORCERELOAD, $INET_DOWNLOADBACKGROUND)

		Do
			;MsgBox(0, $INET_DOWNLOADREAD, $Update_File)
			Sleep(250)
			$Get_Update_Version_NR = $Update_Loop
			Local $iInetGetInfo_1 = InetGetInfo($Get_Update, $INET_DOWNLOADREAD)
			Local $iInetGetInfo_2 = InetGetInfo($Get_Update, $INET_DOWNLOADSIZE)
			;MsgBox(0, $INET_DOWNLOADREAD, $INET_DOWNLOADSIZE)
			If $iInetGetInfo_1 <> 0 Then
				$Get_Update_State = "true"
				WinSetOnTop("Updating Home Loader", "", $WINDOWS_NOONTOP)
				$Abfrage = MsgBox($MB_YESNO	 + $MB_ICONINFORMATION, "Check for Updates", "New Version found:" & @CRLF & "Home Loader '0." & $Get_Update_Version_NR & "'" & @CRLF & @CRLF &  _
																								"Download Link: " & @CRLF & "https://github.com/CogentHub/HomeLoader/releases/download/v0." & $Update_Loop & "/HomeLoaderSetup.exe" & @CRLF & @CRLF &  _
																								"Do you want to download and install the new Version?")


				If $Abfrage = 6 Then
					;_Loading_GUI()
					GUICtrlSetData($Updating_Label, "Downloading")
					Do
						$iInetGetInfo_1 = InetGetInfo($Get_Update, $INET_DOWNLOADREAD)
						$iInetGetInfo_2 = InetGetInfo($Get_Update, $INET_DOWNLOADSIZE)
						;MsgBox($MB_SYSTEMMODAL, $iInetGetInfo_2, $iInetGetInfo_1, 1)
						GUICtrlSetData($Anzeige_Fortschrittbalken, $iInetGetInfo_1 * 100 / $iInetGetInfo_2)
					Until InetGetInfo($Get_Update, $INET_DOWNLOADCOMPLETE)
				Else
					$Get_Update_State = "false"
					InetClose($Get_Update)
					;FileDelete($Update_File)
					ExitLoop
				EndIf
				Sleep(800)
				ExitLoop
			EndIf
		Until InetGetInfo($Get_Update, $INET_DOWNLOADCOMPLETE)
		If $Get_Update_State = "true" Then ExitLoop
		$Fortschrittbalken_Value = $Fortschrittbalken_Value + 20
		GUICtrlSetData($Anzeige_Fortschrittbalken, $Fortschrittbalken_Value)
	Next

	GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
	InetClose($Get_Update)

	;MsgBox(0, "Get_Update_State", $Get_Update_State)

	If $Get_Update_State = "true" Then
		WinSetOnTop("Updating Home Loader", "", $WINDOWS_ONTOP)
		GUICtrlSetData($Updating_Label, "...Loading Installer...")
		GUICtrlSetData($Anzeige_Fortschrittbalken, "")
		GUICtrlSetData($Anzeige_Fortschrittbalken, 20)
		GUICtrlSetData($Anzeige_Fortschrittbalken, 50)
		GUICtrlSetData($Updating_Label, "...Updating...")
		GUISetState(@SW_HIDE, $GUI_Loading)
		ShellExecuteWait($Update_File)
		GUISetState(@SW_SHOW, $GUI_Loading)
		GUICtrlSetData($Anzeige_Fortschrittbalken, 70)
		GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
		Sleep(2000)
		WinSetOnTop("Updating Home Loader", "", $WINDOWS_NOONTOP)
		IniWrite($config_ini, "TEMP", "Update", "Updated")
		MsgBox($MB_ICONINFORMATION, "Check for Updates", "Home Loader updated to version 0." & $Get_Update_Version_NR & "." & @CRLF & @CRLF & _
															"Some Files and settings from the old version were saved: " & @CRLF & $Install_DIR & "Backups\Home_Loader_" & $Version)
		;_Update_Finished()
		;_Restart_Settings_GUI()

		WinSetOnTop("Updating Home Loader", "", $WINDOWS_NOONTOP)
		;IniWrite($config_ini, "TEMP", "Update", "")
		;IniWrite($Config_INI, "TEMP", "Update_Check", "")

		GUIDelete($GUI_Loading)
	Else
		WinSetOnTop("Updating Home Loader", "", $WINDOWS_NOONTOP)
		If $Update_Check_2 = "true" Then MsgBox($MB_ICONINFORMATION, "Check for Updates", "No Update available.")
	EndIf

	IniWrite($config_ini, "TEMP", "Update", "")
	IniWrite($Config_INI, "TEMP", "Update_Check", "")
	IniWrite($config_ini, "TEMP", "Update_Version", "")
	;If FileExists($Update_File) Then FileDelete($Update_File)
	;Exit
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
	If FileExists($Update_File) Then FileDelete($Update_File)
	Exit
EndFunc

