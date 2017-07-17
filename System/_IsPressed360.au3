#include-once
#Region _IsPressed360
; #FUNCTION# ====================================================================================================================
; Name...........: _IsPressed360
; Description ...: Checks if key on Xbox360 controller has been pressed
; Syntax.........: _IsPressed360($iKey[, $vDLL = 'user32.dll'])
; Parameters ....: $iKey        - Key to check for
;                 $vDLL     - Handle to dll or default to user32.dll
; Return values .: True      - 1
;                 False     - 0
; Author ........: Carlo Westmaas (with the help of scripts made by Oxin8, ezzetabi and Jon)
; Modified.......:
; Remarks .......: If calling this function repeatidly, you should open 'xinput9_1_0.dll' and pass in handle.
;                 Make sure to close at end of script
;                 If requesting state of one of the Joysticks or triggers its press value will be returned as @extended
;                 -32768  Y
;                 1    Up
;                 2    Down
;                 4    Left
;                 8    Right
;                 16      Start
;                 32      Back
;                 64      LeftJoyStick
;                 128    RightJoyStick
;                 256    LB
;                 512    RB
;                 4096  A
;                 8192  B
;                 16384   X
;                 32768   LeftTrigger  (@extended 0 - 255)
;                 65536   RightTrigger (@extended 0 - 255)
;                 131072  LeftJoyStick-X (@extended -32768 - 32767)
;                 262144  LeftJoyStick-Y (@extended -32768 - 32767)
;                 524288  RightJoyStick-X (@extended -32768 - 32767)
;                 1048576 RightJoyStick-Y (@extended -32768 - 32767)
; Related .......:
; Link ..........: http://www.autoitscript.com/forum/topic/133663-udf-ispressed360au3-xbox360-controller/
; Example .......: Yes
; ===============================================================================================================================
Func _IsPressed360($iKey, $vDLL = 'xinput9_1_0.dll')
    Local $hStruct, $iValue = 0
    $hStruct = DllStructCreate("dword;short;ubyte;ubyte;short;short;short;short")
    If DllCall($vDLL, "long", "XInputGetState", "long", 0, "ptr", DllStructGetPtr($hStruct)) = 0 Then Return SetError(5, 0, False)
    If @error Then Return SetError(@error, @extended, False)
    Select
        Case $iKey < 16385
            Return Number(BitAND($iKey, DllStructGetData($hStruct, 2)) <> 0)
        Case $iKey = 32768
            $iValue = DllStructGetData($hStruct, 3)
            If $iValue > 10 Then Return SetError(0, $iValue, 1)
        Case $iKey = 65536
            $iValue = DllStructGetData($hStruct, 4)
            If $iValue > 10 Then Return SetError(0, $iValue, 1)
        Case $iKey = 131072
            $iValue = DllStructGetData($hStruct, 5)
            If $iValue > 10000 Or $iValue < -10000 Then Return SetError(0, $iValue, 1)
        Case $iKey = 262144
            $iValue = DllStructGetData($hStruct, 6)
            If $iValue > 10000 Or $iValue < -10000 Then Return SetError(0, $iValue, 1)
        Case $iKey = 524288
            $iValue = DllStructGetData($hStruct, 7)
            If $iValue > 10000 Or $iValue < -10000 Then Return SetError(0, $iValue, 1)
        Case $iKey = 1048576
            $iValue = DllStructGetData($hStruct, 8)
            If $iValue > 10000 Or $iValue < -10000 Then Return SetError(0, $iValue, 1)
    EndSelect
    Return SetError(0, $iValue, 0)
EndFunc   ;==>_IsPressed360
#EndRegion _IsPressed360