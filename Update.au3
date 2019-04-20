
#include <StringConstants.au3>
#include <Array.au3>
#include <InetConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <ColorConstants.au3>
#include <GUIConstantsEx.au3>
#include "_Zip.au3"

Global $oMyError, $GUI_Downloading, $GUI_Updating, $GUI_Searching, $ChangeLog, $Changelog_Array

Global $Install_DIR = @ScriptDir & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $Config_INI = $System_DIR & "config.ini"
Global $Version = IniRead($Config_INI, "Settings", "Version", "")

Global $Check_Version = StringRight($Version, 2)
Global $URL = "https://github.com/CogentHub/HomeLoader/releases/download/0." & $Check_Version & "/HomeLoader_0." & $Check_Version & ".zip"
Global $Download_URL = ""
Global $New_Version = ""

Global $Download_Path = $Install_DIR & "Update\"
If Not FileExists($Download_Path) Then DirCreate($Download_Path)

Global $Download_File_Path = $Download_Path & "HomeLoader_Update.zip"

Global $Update_Ongoing_Check = IniRead($Config_INI, "TEMP", "Updating", "")

Local $Parameter_1 = ""
If $CmdLine[0] Then
	$Parameter_1 = $CmdLine[1]
EndIf

If $Parameter_1 = "Update_Check_on_Start" Then
	IniWrite($Config_INI, "TEMP", "Updating", "Updating")
	_Update_Check()
	IniWrite($Config_INI, "TEMP", "Updating", "")
	Exit
EndIf

MsgBox(0, "$Update_Ongoing_Check", $Update_Ongoing_Check)
If IniRead($Config_INI, "TEMP", "Updating", "") <> "Updating" Then
	IniWrite($Config_INI, "TEMP", "Updating", "Updating")
	_Searching_GUI()
	_Update_Check()
	GUIDelete($GUI_Searching)
	IniWrite($Config_INI, "TEMP", "Updating", "")
EndIf

Exit

Func _Update_Check()
	For $Loop = 1 To 10
		$Check_Version = $Check_Version + 1
		$URL = "https://github.com/CogentHub/HomeLoader/releases/download/0." & $Check_Version & "/HomeLoader_0." & $Check_Version & ".zip"
		InetRead($URL)
		If Not @error Then
			$New_Version = "0." & $Check_Version
			$Download_URL = $URL
		EndIf
	Next

	$ChangeLog = ""

	If $New_Version <> "" Then
		Local $ChangeLog_URL = "https://github.com/CogentHub/HomeLoader/releases/tag/" & $New_Version

		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $ChangeLog_URL, False)
			$WinHttpReq.SetRequestHeader("User-Agent", "Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16")
			$WinHttpReq.SetTimeouts(50, 50, 50, 50)
			$WinHttpReq.Send()

			If @error Then
				MyErrFunc()
			Else
				If $WinHttpReq.Status <> 404 Then
					$DataResponse = $WinHttpReq.ResponseText
					FileWrite(@ScriptDir & "\URL_TEST.txt", $DataResponse)

					$DataResponse = FileRead(@ScriptDir & "\URL_TEST.txt")

					Local $iPosition_1 = StringInStr($DataResponse, 'Changelog:')
					Local $iPosition_2 = StringInStr($DataResponse, 'All Files are signed with an private key "Cogent".<br>')
					Local $iPosition_3 = $iPosition_2 - $iPosition_1

					Local $sString = StringMid($DataResponse, $iPosition_1, $iPosition_3)
					$Changelog_Array = StringSplit($sString, '<li>', $STR_ENTIRESPLIT)

					For $Loop = 1 To $Changelog_Array[0]
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '    <p>', '')
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '</p>', '')
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '    <p><strong>', '')
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '    <strong>', '')
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '</strong></p>', '')
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '</strong>', '')

						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '<ul>', '')
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '</ul>', '')
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '<li>', '')
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '</li>', '')
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '.<br>', '')
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '<p>.<br>', '')
						$Changelog_Array[$Loop] = StringReplace($Changelog_Array[$Loop], '<p>', '')

						If $Loop > 1 Then $Changelog_Array[$Loop] = "- " & $Changelog_Array[$Loop]

						$ChangeLog = $ChangeLog & $Changelog_Array[$Loop]
					Next


				EndIf

			EndIf
		EndIf

		If WinExists("Searching...please wait...") Then GUIDelete($GUI_Searching)
		Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "New version available" & ", HomeLoader by Cogent", "'HomeLoader " & $New_Version & "'" & @CRLF & @CRLF & _
																				$ChangeLog & @CRLF & _
																				"Do you want to download 'HomeLoader '" & $New_Version & "?" & @CRLF, 20)

		If $Abfrage = 6 Then
			If WinExists("HomeLoader - Library") Then WinClose("HomeLoader - Library")
			_Downloading_GUI()
			If $Download_URL <> "" Then
				Local $Download = InetGet($Download_URL, $Download_File_Path, 16, $INET_DOWNLOADBACKGROUND)

				Do
					Sleep(250)
				Until InetGetInfo($Download, $INET_DOWNLOADCOMPLETE)

				Local $iBytesSize = InetGetInfo($Download, $INET_DOWNLOADREAD)
				Local $iFileSize = FileGetSize($Download_File_Path)

				If $iBytesSize = $iFileSize Then
					;MsgBox(0, "Download completed", "Download completed")
				EndIf

				GUIDelete($GUI_Downloading)
				InetClose($Download)

				If FileExists($Download_File_Path) Then
					_Updating_GUI()
					_Zip_UnzipAll($Download_File_Path, $Download_Path)
					Sleep(1000)
					_Install_Update()
				EndIf
			EndIf
		EndIf
	EndIf
EndFunc

Func _Install_Update()
	Local $Updated_Config_INI = $Download_Path & "HomeLoader\System\config.ini"
	Local $Updated_Changelog_File = $Download_Path & "HomeLoader\System\Changelog.txt"
	Local $Updated_SteamVR_Home_Environment_Settings_File = $Download_Path & "HomeLoader\Apps\SteamVR_Home\SteamVR_Home_Environment_Settings.ini"
	Local $Updated_SteamVR_Home_Panel_Settings_File = $Download_Path & "HomeLoader\Apps\SteamVR_Home\SteamVR_Home_Panel_Settings.ini"

	FileCopy($Config_INI, $Updated_Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
	FileCopy($Install_DIR & "\Apps\SteamVR_Home\SteamVR_Home_Environment_Settings.ini", $Updated_SteamVR_Home_Environment_Settings_File, $FC_CREATEPATH + $FC_OVERWRITE)
	FileCopy($Install_DIR & "\Apps\SteamVR_Home\SteamVR_Home_Panel_Settings.ini", $Updated_SteamVR_Home_Panel_Settings_File, $FC_CREATEPATH + $FC_OVERWRITE)
	DirCopy($Install_DIR & "ApplicationList\", $Download_Path & "HomeLoader\ApplicationList\", $FC_OVERWRITE)
	DirCopy($Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Panel_Layouts\", $Download_Path & "HomeLoader\Apps\SteamVR_Home\SteamVR_Home_Panel_Layouts\", $FC_OVERWRITE)

	IniWrite($Updated_Config_INI, "Settings", "Version", $New_Version)
	IniWrite($Updated_Config_INI, "Settings", "First_Start", "Update")

	If $ChangeLog <> "" Then
		If FileExists($Updated_Changelog_File) Then FileDelete($Updated_Changelog_File)

		FileWriteLine($Updated_Changelog_File, "HomeLoader " & $New_Version & @CRLF & @CRLF)

		If IsArray($Changelog_Array) Then
			For $Loop = 1 To $Changelog_Array[0]
				FileWriteLine($Updated_Changelog_File, $Changelog_Array[$Loop] & @CRLF)
			Next
		EndIf
	EndIf

	DirMove($Download_Path & "HomeLoader\", @DesktopDir & "\", $FC_OVERWRITE)
	GUIDelete($GUI_Updating)
	IniWrite($Config_INI, "Settings", "First_Start", "Update")
	;MsgBox(0, "Update Completed", "HomeLoader " & $New_Version & ", Update Completed." & @CRLF & @CRLF & $ChangeLog)
	_Start_HomeLoader()
EndFunc

Func _Start_HomeLoader()
	If Not WinExists("HomeLoader - Library") Then
		If FileExists($Install_DIR & "HomeLoader.exe") Then
			ShellExecute($Install_DIR & "HomeLoader.exe", "Update_completed")
		Else
			ShellExecute($Install_DIR & "HomeLoader.au3", "Update_completed")
		EndIf
	EndIf
EndFunc

Func _Searching_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	$GUI_Searching = GUICreate("Searching...please wait...", 250, 65, -1, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	GUISetIcon(@AutoItExe, -2, $GUI_Searching)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	GUICtrlCreateLabel("...Searching...", 55, 5, 170, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)
	GUICtrlCreateLabel("...Please wait...", 49, 32, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)

	GUISetState(@SW_SHOW, $GUI_Searching)
	WinSetOnTop("Searching...please wait...", "", $WINDOWS_ONTOP)
EndFunc   ;==>_Loading_GUI

Func _Downloading_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	$GUI_Downloading = GUICreate("Downloading...please wait...", 250, 65, -1, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	GUISetIcon(@AutoItExe, -2, $GUI_Downloading)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	GUICtrlCreateLabel("...Downloading...", 40, 5, 170, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)
	GUICtrlCreateLabel("...Please wait...", 49, 32, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)

	GUISetState(@SW_SHOW, $GUI_Downloading)
	WinSetOnTop("Downloading...please wait...", "", $WINDOWS_ONTOP)
EndFunc   ;==>_Loading_GUI

Func _Updating_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	$GUI_Updating = GUICreate("Updating...please wait...", 250, 65, -1, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	GUISetIcon(@AutoItExe, -2, $GUI_Updating)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	GUICtrlCreateLabel("...Updating...", 60, 5, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)
	GUICtrlCreateLabel("...Please wait...", 49, 32, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)

	GUISetState(@SW_SHOW, $GUI_Updating)
	WinSetOnTop("Updating...please wait...", "", $WINDOWS_ONTOP)
EndFunc   ;==>_Loading_GUI

Func MyErrFunc()
	Local $HexNumber
	Local $strMsg

	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "Error Number: " & $HexNumber & " - "
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & " - "
	$strMsg &= "Script Line: " & $oMyError.ScriptLine & " - "
	;FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [MyErrFunc()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. Error retrieving URL... " & $strMsg & " - " & "" & " - " & "" & "<--- " & "[" & _Now() & "]")
	SetError(1)
EndFunc   ;==>MyErrFunc


