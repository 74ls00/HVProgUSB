;CIN
;version 0.4
;#NoTrayIcon
#include <Misc.au3>
#include <GUIConstants.au3>
;#include <TrayConstants.au3>

AutoItSetOption("TrayAutoPause", 0)
;AutoItSetOption("MouseCoordMode", 2) 	;позиция внутри окнна 2 (0)
;AutoItSetOption("PixelCoordMode", 2)	;пиксели внутри окна 2
;AutoItSetOption("SendKeyDelay", 0)
;AutoItSetOption("SendKeyDownDelay", 0)
;Opt("TrayMenuMode", 3)
;Opt("TrayOnEventMode", 1)
;Opt("WinTextMatchMode", 2)

$Window = "Импорт файлов Gerber"
$WinPlug = "."
$ini = "GerberAImport4SL6.ini"

$open_dlg = "Открыть"

Dim $firstrun, $mode = 0	;алгоритм кликов 0=winapi
Dim $numMode = 1	;формат чисел 0=авто 1=целое
Dim $pause1 = 190 , $pause2 = 5	;min 190 5
Dim $m1,$s1,$m2,$s2,$k,$m3,$m4,$e, $tlay[8], $sl6, $sl6e, $sl6r = 0, $path, $pref, $ini	;func iniSave, line ~60
Dim $tbutton[8] = [16,15,14,13,12,11,10,2]	;кнопки по ci
;Dim $tcross[8] = [9,8,7,6,5,4,3,1]	;удалить

Dim $addpos[2] = [150,30]	;смещение кнопки
Dim $xco = 150 , $yco = 23	;размер кнопки

iniLoad()	;загрузить настройки


;$ini = $path & $pref & $inif
;MsgBox(4096, 'Импорт',$ini)

If $sl6r = 1 Then slRun()	;запуск sl6 при старте

;получить координаты окна
Dim $size[4]
While 1
   $size=WinGetPos($Window)
   If Not @error Then ExitLoop
WEnd

$hGUI = GUICreate ($WinPlug, $xco, $yco, $size[0]+$addpos[0] ,$size[1]+$addpos[1],$WS_POPUPWINDOW ,BitOR($WS_EX_TOPMOST,$WS_EX_TOOLWINDOW) )
$importButton = GUICtrlCreateButton('Импортировать всё', -1, -1, $xco+2, $yco+2)
GUISetState(@SW_HIDE)

;Local $EslRun = TrayCreateItem("Run Sprint-Layout 6")
;TrayCreateItem("")
;Local $idExit = TrayCreateItem("Exit")
;TraySetState(1) ; Показывает меню трея

While 1 ;гуй
Switch GUIGetMsg()
   Case $importButton
	  importGerber()
EndSwitch
Pos($Window)
showWin()
;trayFunc()
;setcursor()
WEnd
;--------------------------------------------------------------------------------------------------
Func importGerber()
iniLoad()
$clipbak = ClipGet()	;сохранить буфер

If $mode = 0 Then
For $tb = 0 To 7
If $tlay[$tb] <> "" Then
ControlClick($Window, "", "[CLASS:TButton; INSTANCE:" & $tbutton[$tb] &"]")	;выбрать
WinActivate($open_dlg)
;ControlClick($open_dlg, "", "[CLASS:Static; INSTANCE:3]")	;фикс7форточки бесполезен
WinWait($open_dlg)
ClipPut($path & $pref & $tlay[$tb])
Send("+{ins}", 0)
Sleep($pause2)
ControlClick($open_dlg, "", "[CLASS:Button; INSTANCE:2]")	;открыть
EndIf
Next
ControlClick ($Window,"","[CLASS:TGroupBox; INSTANCE:4]","left",1,33,78)	;система измерений авто;
If $numMode = 0 Then ControlClick ($Window,"","[CLASS:TGroupBox; INSTANCE:3]","left",1,136,78)	;формат чисел авто
If $numMode = 1 Then ControlCommand ($Window,"","[CLASS:TComboBox; INSTANCE:1]","SelectString","Целое")	;формат чисел целое
ControlClick ($Window,"","[CLASS:TButton; INSTANCE:18]")					;импортировать
EndIf

#cs
dataLoad()
If $tlay[$tb] = "" Then
MsgBox(4096, 'Импорт', 'm3=' & $m3 & ', m4=' & $m4)
Sleep($pause1)
ControlClick($Window,"","[CLASS:TButton; INSTANCE:" & $tcross[$tb] &"]")	;удалить
Sleep($pause1)
EndIf
#ce

ClipPut($clipbak)	;восстановить буфер
;MsgBox(4096, 'Импорт', 'Добавлено')
SoundPlay("C:\Windows\Media\Windows Ding.wav")
;

EndFunc
;--------------------------------------------------------------------------------------------------
Func iniSave()

If Not FileExists($ini) Then
   ;$path="G:\home\Documents\Projects\EAGLE\HVProg\gerber\"
   ;$path = @WorkingDir & "\..\gerber\"
   $path = @WorkingDir & "\gerber\"
   $pref="HWProgUSB."
   Dim $sl6 = "G:\Programs\ProgramsT\Sprint-Layout\Sprint_Layout_6_0_rus\", $sl6e = "layout60.exe" , $sl6r = 0	;запуск программы
   Dim $m1="TopCopper.grb",$m2="BottomCopper.grb",$m3="TopMask.grb",$m4="BottomMask.grb",$s1="TopSilk.grb",$s2="BottomSilk.grb",$k="Edge.grb",$e="Drill.xln"
   FileWrite ($ini,"")
   $firstrun = 1
EndIf

IniWrite($ini, "config", "path", $path)
IniWrite($ini, "config", "pref", $pref)
IniWrite($ini, "config", "cooperTop", $m1)
IniWrite($ini, "config", "Cooper3", $m3)
IniWrite($ini, "config", "Cooper4", $m4)
IniWrite($ini, "config", "cooperBottom", $m2)
IniWrite($ini, "config", "silkTop", $s1)
IniWrite($ini, "config", "silkBottom", $s2)
IniWrite($ini, "config", "Edge", $k)
IniWrite($ini, "config", "Drill", $e)
IniWrite($ini, "config", "SprintLayout6Path", $sl6)
IniWrite($ini, "config", "SprintLayout6Exe", $sl6e)
IniWrite($ini, "config", "SprintLayout6Run", $sl6r)
IniWrite($ini, "sprint", "numMode", $numMode)
IniWrite($ini, "system", "mode", $mode)
IniWrite($ini, "system", "pause1", $pause1)
IniWrite($ini, "system", "pause2", $pause2)


EndFunc
;--------------------------------------------------------------------------------------------------
Func iniLoad()
   ;MsgBox(4096, $ini)
If FileExists($ini) Then
$path = IniRead ($ini,"config","path","")
$pref = IniRead ($ini,"config","pref","")
$m1 = IniRead ($ini,"config","cooperTop","")
$m3 = IniRead ($ini,"config","Cooper3","")
$m4 = IniRead ($ini,"config","Cooper4","")
$m2 = IniRead ($ini,"config","cooperBottom","")
$s1 = IniRead ($ini,"config","silkTop","")
$s2 = IniRead ($ini,"config","silkBottom","")
$k = IniRead ($ini,"config","Edge","")
$e = IniRead ($ini,"config","Drill","")
$sl6 = IniRead ($ini,"config","SprintLayout6Path","")
$sl6e = IniRead ($ini,"config","SprintLayout6Exe","")
$sl6r = IniRead ($ini,"config","SprintLayout6Run","0")
$numMode = IniRead ($ini,"sprint","numMode","1")
$mode = IniRead ($ini,"system","mode","0")
$pause1 = IniRead ($ini,"system","pause1","")
$pause2 = IniRead ($ini,"system","pause2","")
Else
iniSave()
EndIf
dataLoad()
If $firstrun Then firstrun()
EndFunc
;--------------------------------------------------------------------------------------------------
Func dataLoad()
Dim $tlay[8] = [$m1,$s1,$m2,$s2,$k,$m3,$m4,$e]	;слои
EndFunc
;--------------------------------------------------------------------------------------------------
Func firstrun()
   $hFile = FileOpen($ini, 1)
   FileWriteLine($hFile, ";sprint" & @CRLF)
   FileWriteLine($hFile, ";numMode=0 Формат чисел Авто" & @CRLF)
   FileWriteLine($hFile, ";numMode=1 Формат чисел Целое" & @CRLF)
   FileWriteLine($hFile, ";system" & @CRLF)
   FileWriteLine($hFile, ";mode=0 Click mode" & @CRLF)
   FileClose($hFile)
   IniWrite($ini, "system", "firstrun", 0)
   $firstrun = 0
EndFunc
;--------------------------------------------------------------------------------------------------
Func Pos($w)
    Dim $size[4]
    While 1
        $size2=WinGetPos($w)
        If Not @error Then ExitLoop
    WEnd
    $xik=$size2[0]+$addpos[0]
    $yik=$size2[1]+$addpos[1]
    WinMove ( $WinPlug, '',$xik ,$yik  )
EndFunc
;--------------------------------------------------------------------------------------------------
Func showWin()
$wact = WinActive($Window,"")
$wact2 = WinActive($WinPlug,"")
;#cs
Select
Case $wact
   GUISetState(@SW_SHOW)
Case $wact2
   GUISetState(@SW_SHOW)
Case Else
	GUISetState(@SW_HIDE)
 EndSelect
 ;TraySetOnEvent(-11,@SW_SHOW)
;#ce
#cs
If $wact Or $wact2 Then
   GUISetState(@SW_SHOW)
   ;WinActivate($WinPlug)
Else
   GUISetState(@SW_HIDE)
   EndIf
#ce
EndFunc
;--------------------------------------------------------------------------------------------------


#cs
Func setcursor()
$IDC = -1
$newIDC = 15

If $newIDC <> $IDC Then
$IDC = $newIDC
GUISetCursor($IDC,1)
EndIf

EndFunc
#ce
;--------------------------------------------------------------------------------------------------
Func trayFunc()	;трей
Switch TrayGetMsg()

   Case $idExit ; Exit
	  Exit
   Case $EslRun
	  slRun()
	  MsgBox(4096, 'Импорт', 'm3=' & $m3 & ', m4=' & $m4)

EndSwitch
EndFunc

Func slRun()
If $sl6e <> "" Then
   If Not ProcessExists($sl6e) Then Run ($sl6 & $sl6e)
EndIf

EndFunc