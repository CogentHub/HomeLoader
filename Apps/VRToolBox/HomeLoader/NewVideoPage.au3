
Global $Install_DIR = StringReplace(@ScriptDir, 'Apps\VRToolBox\HomeLoader', '')
	If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"

Global $Install_DIR_Replaced = StringReplace($Install_DIR, '\', '/')
Global $VIDEOID_ini = $Install_DIR & "WebPage\VideoPage\VIDEOID.ini"
Global $VideoPage_path = $Install_DIR & "WebPage\VideoPage\VideoPage.html"

_Delete_VRToolBox_VideoPage()

Exit

Func _Delete_VRToolBox_VideoPage()
	If FileExists($VideoPage_path) Then FileDelete($VideoPage_path)
	FileWrite($VideoPage_path, "")
EndFunc

