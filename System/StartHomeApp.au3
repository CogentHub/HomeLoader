
#include <File.au3>

Global $Config_INI = _PathFull("HomeLoader\config.ini", @AppDataDir)
If Not FileExists($Config_INI) Then FileCopy(@ScriptDir & "\config.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)

Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")

If $HomeApp = "SteamVR Home" Then ShellExecute($Home_Path, "-vr")
If $HomeApp <> "SteamVR Home" Then ShellExecute($Home_Path)

Exit