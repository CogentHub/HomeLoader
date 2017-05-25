
Global $Config_INI = @ScriptDir & "\config.ini"
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")

ShellExecute($Home_Path)
Exit
