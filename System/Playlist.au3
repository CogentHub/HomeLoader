#include <WindowsConstants.au3>
#include <InetConstants.au3>
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>
#include <File.au3>
#include <Zip.au3>

Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
Global $System_DIR = $Install_DIR & "\System\"
Global $Config_INI = $System_DIR & "config.ini"

Global $Playlist_INI = IniRead($Config_INI, "TEMP", "Playlist_INI", "")
Global $Add_break = IniRead($Playlist_INI, "Playlist", "Add_break", "false")


TrayTip("Home Loader Playlist", "Playlist started." & @CRLF & "Playlist 1", 5, $TIP_ICONASTERISK)
If Not ProcessExists("vrmonitor.exe") Then ShellExecute("steam://rungameid/250820")

Do
	Sleep(1000)
Until Not ProcessExists("vrmonitor.exe")


_Start_Playlist()
_Restart_HomeLoaderLibrary_GUI()

Func _Start_Playlist()
	$NR_Applications = IniRead($Playlist_INI, "Playlist", "NR_Applications", "")
	$Add_break = IniRead($Playlist_INI, "Playlist", "Add_break", "")
	$Break_duration = IniRead($Playlist_INI, "Playlist", "Break_duration", "")
	If StringLeft($Break_duration, 1) = 0 Then $Break_duration = StringRight($Break_duration, 1)

	For $LOOP = 1 To $NR_Applications
		$Playlist_Exit_command = IniRead($Config_INI, "TEMP", "Playlist_Exit_command", "")

		$Read_NR = IniRead($Playlist_INI, "Application_" & $LOOP, "NR", "")
		$Read_name = IniRead($Playlist_INI, "Application_" & $LOOP, "name", "")
		$Read_appid = IniRead($Playlist_INI, "Application_" & $LOOP, "appid", "")
		$Read_Playtime = IniRead($Playlist_INI, "Application_" & $LOOP, "Playtime", "")
		$Read_renderTargetMultiplier = IniRead($Playlist_INI, "Application_" & $LOOP, "renderTargetMultiplier", "")
		$Read_supersampleScale = IniRead($Playlist_INI, "Application_" & $LOOP, "supersampleScale", "")
		$Read_allowSupersampleFiltering = IniRead($Playlist_INI, "Application_" & $LOOP, "allowSupersampleFiltering", "")

		If $Read_appid <> "" Then
			ShellExecuteWait("steam://rungameid/" & $Read_appid)
			Local $hTimer = TimerInit()
			Sleep(3000)
			Opt("WinTitleMatchMode",4)
			$WinTitle = WinGetTitle("[ACTIVE]")
			WinActivate($WinTitle)
			$GameStarted = $WinTitle
			TrayTip("Home Loader Playlist", "App started: " & @CRLF & $GameStarted, 5, $TIP_ICONASTERISK)

			Do
				$Playlist_Exit_command = IniRead($Config_INI, "TEMP", "Playlist_Exit_command", "")
				If WinExists($GameStarted) Then $GameClosed = "true"
				Sleep(5000)
				Local $fDiff = TimerDiff($hTimer)
				$fDiff_minutes = $fDiff / 60000
				$fDiff_minutes = Round($fDiff_minutes, 0)
				If $fDiff_minutes = $Read_Playtime Then WinClose($GameStarted)
				If $fDiff_minutes > $Read_Playtime Then WinClose($GameStarted)
				If $Playlist_Exit_command = "true" Then WinClose($GameStarted)
				If $Playlist_Exit_command = "true" Then ExitLoop
				If WinExists($GameStarted) Then $GameClosed = "false"
			Until $GameClosed = "true"
		EndIf

		If $Add_break = "true" Then TrayTip("Home Loader Playlist", "PAUSE", 5, $TIP_ICONASTERISK)
		If $Add_break = "true" Then Sleep($Break_duration & "000")
		If $Playlist_Exit_command = "true" Then ExitLoop
	Next

	TrayTip("Home Loader Playlist", "Playlist ended.", 5, $TIP_ICONASTERISK)
	Sleep(3000)
EndFunc

Func _Restart_HomeLoaderLibrary_GUI()
	IniWrite($Config_INI, "TEMP", "Playlist_INI", "")
	If FileExists($System_DIR & "HomeLoaderLibrary.exe") Then
		ShellExecute($System_DIR & "HomeLoaderLibrary.exe", "", $System_DIR)
	Else
		ShellExecute($System_DIR & "HomeLoaderLibrary.au3", "", $System_DIR)
	EndIf
	Exit
EndFunc