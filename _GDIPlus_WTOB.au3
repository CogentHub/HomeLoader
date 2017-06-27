#include-once
#include <GDIPlus.au3>
Opt('MustDeclareVars', 1)
;======================================================================================
; Function Name:	_GDIPlus_WTOB (Write Text On Bitmap)
; Description:			Loads a bitmap and writes a text on it
;
; Parameters:    	$sIn:						filename of the bitmap or a handle to a bitmap
;                  				$sText:					the text which will be written onto the bitmap centered
; Optional:
;                				$fName:				font name to be used
;                  				$fSize:					fonst size of the text
;								$iX:						x position of font - if x and y set $iAlignX and $iAlignY will be skipped
;								$iY:						y position of font
;								$iAlignX:				align the font center, left, right (0, 1, 2) on x axis
;								$iAlignY:				align the font center, top, buttom (0, 1, 2) on y axis
;								$iFColor:				color of font
;								$ebg:					enable background black painting to get contrast with font color
;                  				$save:					if set to 1 bitmap will be saved
;                  				$sFilename:			filename of the save bitmap, if no extension is given PNG will be used instead
;                  				$iJPGQ:					jpg image save quality -> 0: worst, 100: best
;								$draw_bgrect 		draws a filled transparent rectangle to make the font better readable
;								$iDrawBGRect_c	color of filled transparent rectangle
;
; Error codes:
;								1: image file not found
;								2: no text given
;								3: no font given
;								4: wrong font size - must be greater then 0
;								5: wrong align x value
;								6: wrong align y value
;								7: unable to create bitmap from scan 0
;								8: unable to save image
;
; Requirement(s):		GDIplus.au3
; Return Value(s):	Success: handle to bitmap, Error: 0
; Author(s):				UEZ
; Version:					v0.92 Build 2013-02-16 Beta
;=======================================================================================
Func _GDIPlus_WTOB($sIn, $sText, $fName = "Impact", $fSize = 11, $iX = -1, $iY = -1, $iAlignX = 2, $iAlignY = 2, $iFColor = 0xFFFFFFFF, $ebg = True, $save = False, $sFilename = "WTOB.png", $iJPGQ = 90, $draw_bgrect = False, $iDrawBGRect_c = 0xFF808080)
	Local $handle = False, $hImage, $declared = True
	If IsPtr($sIn) Then $handle = True
	If (Not $handle) And ($sIn = "" Or Not FileExists($sIn)) Then Return SetError(1, 0, "File not found")
	If $sText = "" Then Return SetError(2, 0, "No text given")
	If $fName = "" Then SetError(3, 0, "No font given")
	If Not IsInt($fSize) And $fSize > 0 Then Return SetError(4, 0, "Wrong font size")
	If $iAlignX < 0 Or $iAlignX > 2 Then Return SetError(5, 0, "Wrong align x value")
	If $iAlignY < 0 Or $iAlignY > 2 Then Return SetError(6, 0, "Wrong align y value")

	If Not $__g_hGDIPDll Then
		_GDIPlus_Startup()
		$declared = False
	EndIf

	If Not $handle Then
		$hImage = _GDIPlus_ImageLoadFromFile($sIn)
	Else
		$hImage = $sIn
	EndIf
	Local $iW = _GDIPlus_ImageGetWidth($hImage)
	Local $iH = _GDIPlus_ImageGetHeight($hImage)

	Local $hBitmap = _GDIPlus_BitmapCreateFromScan0($iW, $iH)
	If @error Then Return SetError(7, @extended, "Unable to create bitmap from scan 0")
	Local $hContext = _GDIPlus_ImageGetGraphicsContext($hBitmap)
	_GDIPlus_GraphicsSetSmoothingMode($hContext, 2)
	DllCall($__g_hGDIPDll, "int", "GdipSetInterpolationMode", "handle", $hContext, "int", 7)
	DllCall($__g_hGDIPDll, "uint", "GdipSetTextRenderingHint", "handle", $hContext, "int", 4)

	Local $hPinsel = _GDIPlus_BrushCreateSolid($iFColor)
	Local $hFormat = _GDIPlus_StringFormatCreate()
	Local $hFamily = _GDIPlus_FontFamilyCreate($fName)
;~ 	Local $font_size = Floor(($iW - StringLen($sText)) / $fSize)
	Local $hFont = _GDIPlus_FontCreate($hFamily, $fSize, 1)
	Local $tLayout = _GDIPlus_RectFCreate(0, 0, 0, 0)
	Local $aInfo = _GDIPlus_GraphicsMeasureString($hContext, $sText, $hFont, $tLayout, $hFormat)

	_GDIPlus_GraphicsDrawImageRect($hContext, $hImage, 0, 0, $iW, $iH)

	Local $fWidth = DllStructGetData($aInfo[0], "Width")
	Local $fHeight = DllStructGetData($aInfo[0], "Height")

	If $iX < 0 Then
		Switch $iAlignX
			Case 0 ;alignment center
				DllStructSetData($tLayout, "x", $iW / 2 - Round($fWidth / 2, 0))
			Case 1 ;alignment left
				DllStructSetData($tLayout, "x", 0)
			Case 2 ;alignment right
				DllStructSetData($tLayout, "x", $iW - $fWidth - 1)
		EndSwitch
	Else
		DllStructSetData($tLayout, "x", $iX)
	EndIf

	If $iY < 0 Then
		Switch $iAlignY
			Case 0 ;alignment center
				DllStructSetData($tLayout, "y", $iH / 2 - Floor($fHeight / 2))
			Case 1 ;alignment top
				DllStructSetData($tLayout, "y", 0)
			Case 2 ;alignment buttom
				DllStructSetData($tLayout, "y", $iH - $fHeight - 1)
		EndSwitch
	Else
		DllStructSetData($tLayout, "y", $iY)
	EndIf

	Local $hBrush_rect = _GDIPlus_BrushCreateSolid($iDrawBGRect_c)
	If $draw_bgrect Then _GDIPlus_GraphicsFillRect($hContext, DllStructGetData($tLayout, "x"), DllStructGetData($tLayout, "y"), $fWidth, $fHeight, $hBrush_rect)

	Local $i, $fs = $fSize * 0.075
	Local $hBrush_back = _GDIPlus_CreateLineBrush(0, 0, 0, $fSize, 0xFF000000, 0xFF808080)
	Local $tLayout2 = _GDIPlus_RectFCreate(0, 0, 0, 0)
	DllStructSetData($tLayout2, "Width", $fWidth)
	DllStructSetData($tLayout2, "Height", $fHeight)
	If $ebg Then
		For $i = 0 To 3
			Switch $i
				Case 0
					DllStructSetData($tLayout2, "x", DllStructGetData($tLayout, "x"))
					DllStructSetData($tLayout2, "y", DllStructGetData($tLayout, "y") - $fs)
				Case 1
					DllStructSetData($tLayout2, "x", DllStructGetData($tLayout, "x") + $fs)
					DllStructSetData($tLayout2, "y", DllStructGetData($tLayout, "y"))
				Case 2
					DllStructSetData($tLayout2, "x", DllStructGetData($tLayout, "x"))
					DllStructSetData($tLayout2, "y", DllStructGetData($tLayout, "y") + $fs)
				Case 3
					DllStructSetData($tLayout2, "x", DllStructGetData($tLayout, "x") - $fs)
					DllStructSetData($tLayout2, "y", DllStructGetData($tLayout, "y"))
			EndSwitch
			_GDIPlus_GraphicsDrawStringEx($hContext, $sText, $hFont, $tLayout2, $hFormat, $hBrush_back)
		Next
	EndIf
	_GDIPlus_GraphicsDrawStringEx($hContext, $sText, $hFont, $tLayout, $hFormat, $hPinsel)

	_GDIPlus_ImageDispose($hImage)
	Local $err = 0
	If $save Then
		If StringRight($sFilename, 4) = ".jpg" Then
			Local $sCLSID = _GDIPlus_EncodersGetCLSID("JPG")
			Local $tParams = _GDIPlus_ParamInit(1)
			Local $tData = DllStructCreate("int Quality")
			DllStructSetData($tData, "Quality", $iJPGQ) ;quality 0-100
			Local $pData = DllStructGetPtr($tData)
			_GDIPlus_ParamAdd($tParams, $GDIP_EPGQUALITY, 1, $GDIP_EPTLONG, $pData)
			Local $pParams = DllStructGetPtr($tParams)
			If Not _GDIPlus_ImageSaveToFileEx($hBitmap, $sFilename, $sCLSID, $pParams) Then $err = 8
			$tParams = 0
			$tData = 0
		Else
			If StringMid($sFilename, StringLen($sFilename) - 3, 1) <> "." Then $sFilename &= ".png"
			If Not _GDIPlus_ImageSaveToFile($hBitmap, $sFilename) Then $err = 8
		EndIf
	EndIf
	_GDIPlus_FontDispose($hFont)
	_GDIPlus_FontFamilyDispose($hFamily)
	_GDIPlus_StringFormatDispose($hFormat)
	_GDIPlus_BrushDispose($hPinsel)
	_GDIPlus_BrushDispose($hBrush_rect)
	_GDIPlus_BrushDispose($hBrush_back)
	_GDIPlus_GraphicsDispose($hContext)
	If Not $declared Then _GDIPlus_Shutdown()
	$tLayout = 0
	$tLayout2 = 0
	Return SetError($err, 0, $hBitmap)
EndFunc   ;==>WTOB

Func _GDIPlus_CreateLineBrush($iPoint1X, $iPoint1Y, $iPoint2X, $iPoint2Y, $iArgb1 = 0xFF0000FF, $iArgb2 = 0xFFFF0000, $WrapMode = 1)
	Local $tPoint1, $pPoint1, $tPoint2, $pPoint2, $aRet
	If $iArgb1 = "" Then $iArgb1 = 0xFF0000FF
	If $iArgb2 = "" Then $iArgb2 = 0xFFFF0000
	If $WrapMode = -1 Then $WrapMode = 0
	$tPoint1 = DllStructCreate("float X;float Y")
	$pPoint1 = DllStructGetPtr($tPoint1)
	DllStructSetData($tPoint1, "X", $iPoint1X)
	DllStructSetData($tPoint1, "Y", $iPoint1Y)
	$tPoint2 = DllStructCreate("float X;float Y")
	$pPoint2 = DllStructGetPtr($tPoint2)
	DllStructSetData($tPoint2, "X", $iPoint2X)
	DllStructSetData($tPoint2, "Y", $iPoint2Y)
	$aRet = DllCall($__g_hGDIPDll, "int", "GdipCreateLineBrush", "ptr", $pPoint1, "ptr", $pPoint2, "int", $iArgb1, "int", $iArgb2, "int", $WrapMode, "int*", 0)
	Return $aRet[6]
EndFunc   ;==>_GDIPlus_CreateLineBrush