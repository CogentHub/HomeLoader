
#Region Includes
;#include <Constants.au3>
#include <File.au3>
#include <Date.au3>
#include <Array.au3>
#include <String.au3>
#include "System\StartSteamVRHome.au3"
;#include <File.au3>
;#include <Date.au3>
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>
#include "System\StartHomeApp.au3"
#include <GuiButton.au3>
;#include <File.au3>
;#include <GUIConstants.au3>
;#include <Date.au3>
#include <GuiImageList.au3>
#include <AutoItConstants.au3>
;#include <GuiMenu.au3>
#include "System\Settings.au3"
;#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ColorConstants.au3>
;#include <File.au3>
;#include <Date.au3>
;#include <MsgBoxConstants.au3>
;#include <TrayConstants.au3>
#endregion

Opt("GUIOnEventMode", 1)

#Region Declare Variables/Const 1
;Global $Install_DIR = @ScriptDir & "\"
;Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
;Global $Config_INI = $Install_DIR & "System\config.ini"
Global $Version = IniRead($Config_INI, "Settings", "Version", "")
Global $Update_Check = IniRead($Config_INI, "Settings", "Update_Check", "")
;Global $System_DIR = $Install_DIR & "System\"
If Not FileExists($Config_INI) Then FileCopy($System_DIR & "config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Advanced_Settings = IniRead($Config_INI, "Settings", "Advanced_Settings", "")
;Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")
Global $gfx = $Install_DIR & "System\gfx\"
Global $Skin = IniRead($Config_INI, "Settings", "Skin", "1")
Global $Close_MainGUI_after_selection = IniRead($Config_INI, "Settings", "Close_MainGUI_after_selection", "false")

Global $Start_HomeLoaderGUI = IniRead($Config_INI, "Settings", "Start_HomeLoaderGUI", "false")
Global $Start_HomeLoaderLibrary = IniRead($Config_INI, "Settings", "Start_HomeLoaderLibrary", "false")
Global $Start_Settings = IniRead($Config_INI, "Settings", "Start_Settings", "false")
Global $Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "false")
Global $Autostart_OVRdrop = IniRead($Config_INI, "Settings", "Autostart_OVRdrop", "false")
Global $Autostart_Pluto = IniRead($Config_INI, "Settings", "Autostart_Pluto", "false")

;Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
;Global $Steam_Path = StringReplace($Steam_Path_REG, '/', '\') & "\"
;Global $SteamVR_Path = $Steam_Path & "SteamApps\common\SteamVR\"

Global $default_vrsettings_File = IniRead($Config_INI, "Folders", "Steam_default_vrsettings", "")
Global $Steam_tools_vrmanifest_File = IniRead($Config_INI, "Folders", "Steam_tools_vrmanifest", "")

Global $ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
Global $Request_Steamdb_info = IniRead($Config_INI, "Settings", "Request_Steamdb_info", "")

Global $Home_Loader_GUI, $contextmenu, $RM_Item0, $RM_Item1, $RM_Item2, $RM_Item3, $RM_Item4, $RM_Item5, $RM_Item6
Global $font = "arial"
#endregion


;MsgBox(0, "HLG 1", $First_Start & @CRLF & _
;					$Config_INI & @CRLF & _
;					$Install_DIR & @CRLF & _
;					$System_DIR & @CRLF & _
;					$Steam_Path & @CRLF & _
;					$SteamVR_Path & @CRLF & _
;					$ScanOnlyVR & @CRLF)

If Not FileExists($Steam_tools_vrmanifest_File) Then _Detect_SteamVR_Files()
If Not FileExists($default_vrsettings_File) Then _Detect_SteamVR_Files()


#Region Start Check
Local $Parameter_1 = ""
If $CmdLine[0] Then
	$Parameter_1 = $CmdLine[1]
EndIf

;If $Parameter_1 = "StartHomeLoaderHomeApp" Then
	;_Start_HomeLoader_HomeApp()
	;Exit
;EndIf

If $Parameter_1 = "Update_completed" Then
	If $First_Start = "Update" Then
		_Update_completed()
	EndIf
EndIf

If $Parameter_1 = "GamePageMode" Then
	_Create_HTMLGamePage_GUI()
	Exit
EndIf

;If Not WinExists("HomeLoader - Library") Then
	If $First_Start = "true" Then
		_First_Start_Check()
	Else
		;_Keep_HomeLoader_SteamVR_Home_Allive_Check()
		;Exit
		_Loading_GUI()
		_Create_HLL_GUI()
		Local $HL_State = IniRead($Config_INI, "TEMP", "HL_State", "")
		If $HL_State <> "_Check_PO_Data" Then
			If $Request_Steamdb_info = "true" And $ScanLibrary_OnStart_SettingValue = "false" Then
				IniWrite($Config_INI, "TEMP", "HL_State", "_Check_PO_Data")
				_Check_PO_Data()
				;_Create_Environment_Control_Panel()
			EndIf
		EndIf
		If WinExists("Loading...please wait...") Then
			GUIDelete($GUI_Loading)
		EndIf
		If $Update_Check = "true" Then
			If IniRead($Config_INI, "TEMP", "Updating", "") <> "Updating" Then
				_Start_HomeLoader_Update()
			EndIf
		EndIf
	EndIf
;Else
;	Exit
;EndIf

#endregion

#Region While 1
While 1
	Sleep(100)
    Global $nMsg = GUIGetMsg()

    Switch $nMsg

        Case $GUI_EVENT_CLOSE
            ;Exit
	EndSwitch
WEnd
#endregion

#Region Main
Func _Detect_SteamVR_Files()
	IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", "")
	IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")

	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

	If FileExists($Install_Folder_Steam_1 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_2 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_3 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_4 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_5 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\"

	$default_vrsettings_File = $SteamVR_Path & "resources\settings\default.vrsettings"
	If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
	$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"

	$Steam_tools_vrmanifest_File = $SteamVR_Path & "tools\tools.vrmanifest"
	If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
	$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
EndFunc
#endregion




#Region Func Restart / Exit / Reload / Update
Func _Update_completed()
	$Version = IniRead($Config_INI, "Settings", "Version", "")
	Local $Changelog = FileRead($System_DIR & "Changelog.txt")
	MsgBox(0, "Update Completed", "HomeLoader " & $Version & ", Update Completed." & @CRLF & @CRLF & $ChangeLog)
	IniWrite($Config_INI, "Settings", "First_Start", "false")
EndFunc

Func _Check_PO_Data()
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "Check_PO_Data", @ScriptDir)
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "Check_PO_Data", @ScriptDir)
	EndIf
EndFunc


Func _Start_HomeLoader_Update()
	If FileExists($Install_DIR & "Update.exe") Then
		ShellExecute($Install_DIR & "Update.exe", "Update_Check_on_Start", @ScriptDir)
	Else
		ShellExecute($Install_DIR & "Update.au3", "Update_Check_on_Start", @ScriptDir)
	EndIf
EndFunc

Func _Start_HomeLoader_HomeApp()
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe", "StartSteamVRHome")
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3", "StartSteamVRHome")
	EndIf

	If $ScanLibrary_OnStart_SettingValue = "true" Then
		_Start_HomeLoader_UpdateLibrary()
	EndIf

	Exit
EndFunc

Func _Button_Restart_GUI()
	If FileExists($Install_DIR & "HomeLoader.exe") Then
		ShellExecute($Install_DIR & "HomeLoader.exe")
	Else
		ShellExecute($Install_DIR & "HomeLoader.au3")
	EndIf
	Exit
EndFunc

Func _Button_Exit_GUI()
	GUIDelete($Home_Loader_GUI)
	Exit
EndFunc
#endregion

