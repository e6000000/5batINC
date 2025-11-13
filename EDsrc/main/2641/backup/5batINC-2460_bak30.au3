#include-once
#include <FileConstants.au3>
#include <Array.au3> ; Used For _ArrayDisplay, _ArrayAdd, And _ArrayCompare
#include <MsgBoxConstants.au3>
#include <File.au3> ; IMPORTANT : Needed For _FileReadToArray And _FileWriteFromArray
;file array functions here qq66yy AppendFiles($a) scriptAppendIncFiles()  FileWriteMy()  scriptAppendIncFilesCMD()
; festlegung: 2020 kennzeichnet functionierendes file , old war 2033 aber das koennte im jahr 2033 stoerend sein, deshalb alles aendern nach und nach von 2033 auf 2020
; **** forEVER subDIR: 'EDsrc' **** option then:  'main'
;Global $prj = 'DirToAllCode1file_API'
;lastFile      DirToAllCode1file_API[2444].au3
;Global $prj = 'DirToAllCode1file_API'

Global $shellexNotepad = 1

Global $prj = 'tst28'  ; 5batINC   ;tst29 is   5buttnGUI  both in ws gitgit_auto
; IN **** IN new in ver 2020
; new 2020
Global $verIN = '2020'  ;in cpy  gitPUSH-2033.bat,..,barePUSH-2033.bat to  gitPUSH-2040.bat,..,barePUSH-2040.bat
Global $VER = $verIN
Global $andVER = '-' & $VER & '.bat'
; OUT **** OUT **** can samesame 2033 ;out overwrite existing
Global $verOUT = '2033'  ;OUT overwrite rewrite ;new generated inc.au3 eg. "bat2-2040.inc" ;can sameSame 2033
;
; for: 	Global $sInc2_Path ;;// = $sWorkingDirSLASH & "\bat2-" & $iver & ".inc"
Global $iver = '2020'  ;;//  load inc file WHY ??? array iver  inc-Version

;
;
;
; D:\ws\gitGit\s$verINource\workspaces\gitgit_auto\EDsrc\main   ;;//  bat1-2033.inc  ; bareFETCH-2033.bat
; --- Path definitions for Batch files ---
Global $sWorkingDirSLASH         = "D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC\"
Global $sScriptDir               = "D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC"
Global $fromFolderAppendIncFiles = 'D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC\' ;;//  add backslash ---idxq_2541---2025_11_09---22_35_22
;  'D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\'
; das ergebnis file , wo alle inc files angehaengt werden
Global $scriptNameAppendIncFiles = $fromFolderAppendIncFiles & '_AppendIncFiles.au3'
;old; Global $cmdCPY_scriptNameAppendIncFiles ;OLD!!! new Local $sCopyList
;

;;// $cmdCPY_scriptNameAppendIncFiles = 'copy ' & $sInc1_Path & ' + ' & $sInc2_Path & ' + ' & $sInc3_Path & ' + ' & $sInc4_Path & '  ' & $scriptNameAppendIncFiles
Global $sInc1_Path   ;;// = $sWorkingDirSLASH & "\bat1-" & $iver & ".inc"  ;;#include "bat1-2020.inc"
Global $sInc2_Path   ;;// = $sWorkingDirSLASH & "\bat2-" & $iver & ".inc"
Global $sInc3_Path   ;;// = $sWorkingDirSLASH & "\bat3-" & $iver & ".inc"
Global $sInc4_Path   ;;// = $sWorkingDirSLASH & "\bat4-" & $iver & ".inc"
Global $sInc5_Path   ;;// = $sWorkingDirSLASH & "\bat5-" & $iver & ".inc"

; verIN  save generated from the inc
Global $aBat1_Lines
Global $aBat2_Lines
Global $aBat3_Lines
Global $aBat4_Lines
Global $aBat5_Lines


Global $nam[22]                 ; in D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5buttnGUI\5buttnGUI-2460.au3
; PUSH-Skripte
#cs   old names
$nam[1] = 'barePUSH'            ; (WS -> BARE)
$nam[2] = 'gitPUSH'             ; (WS -> GITHUB)
; HARD PULL-Skripte
$nam[3] = 'bareFETCH'           ; (BARE -> WS HARDPULL LATEST)
$nam[4] = 'gitFETCH'            ; (GITHUB -> WS HARDPULL LATEST)
$nam[5] = 'create-bare-gitPUSH' ; (Initialisierung)
; TortoiseGit Buttons
$nam[6] = 'Tortoise Log BARE' ;
$nam[7] = 'Tortoise Log GIT' ; ; Wird im Event-Loop weggelassen
$nam[8] = 'RESET to prj' ; NEU: Aktualisiert die Batch-Dateien
#ce

$nam[0] = 'gitPUSH'             ; nu. only update, not run (WS -> GITHUB)
$nam[1] = 'barePUSH'            ; (WS -> BARE)

;'gitPUSH' nu. wir nehmen nur  change to [0] 'bare-gitPUSH'
$nam[2] = 'bare-gitPUSH'        ; (WS -> BARE and GITHUB)

; HARD PULL-Skripte
$nam[3] = 'bareFETCH'           ; (BARE -> WS HARDPULL LATEST)
$nam[4] = 'gitFETCH'            ; (GITHUB -> WS HARDPULL LATEST)
$nam[5] = 'create-bare-gitPUSH' ; (Initialisierung)

; TortoiseGit Buttons
$nam[6] = 'Tortoise Log GIT'  ; geht fuer bare und fuer git web
$nam[7] = 'Tortoise Log BARE' ;nu. Wird im Event-Loop weggelassen

$nam[8] = 'RESET to prj (updat bat)' ; NEU: Aktualisiert die Batch-Dateien

$nam[9] = 'openDirGitGitEDsrcMain'
; -- new2  code end 5buttnGUI-2462 -- PUSH-Skripte -----------------------------------------
$nam[10] = '3OpenSelectInVSC_Notpp_AU3'

; NU.  only update .bat , not run
$nam[11] = 'merge-NU-bare-gitFETCH'   ;; merge-NU-bare-gitFETCH-2020.bat



; Erstellung der vollständigen Batch-Pfade
Global $sBat1 = $sScriptDir & '\' & $nam[1] & $andVER
Global $sBat2 = $sScriptDir & '\' & $nam[2] & $andVER
Global $sBat3 = $sScriptDir & '\' & $nam[3] & $andVER
Global $sBat4 = $sScriptDir & '\' & $nam[4] & $andVER
Global $sBat5 = $sScriptDir & '\' & $nam[0] & $andVER
Global $sBat5 = $sScriptDir & '\' & $nam[11] & $andVER
ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $sBat5 = ' & $sBat5 & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
;@@ Debug(72) : $sBat5 = D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC\create-bare-gitPUSH-2033.bat

#cs
#include "bat1-2020.inc"
#include "bat2-2020.inc"
#include "bat3-2020.inc"
#include "bat4-2020.inc"
#include "bat5-2020.inc"

#include "bat6-2020.inc"
#include "bat7-2020.inc"
#include "bat8-2020.inc"
#include "bat9-2020.inc"
#include "bat0-2020.inc"
#ce

Local $verIN_bak = $verIN
$verIN = '-' & $verIN
Local $verOUT_bak = $verOUT
$verOUT = '-' & $verOUT

If 1 Then
	Global $sBat1_Orig = $sWorkingDirSLASH & $nam[1] & $verIN & ".bat"
	Global $sBat2_Orig = $sWorkingDirSLASH & $nam[2] & $verIN & ".bat"
	Global $sBat3_Orig = $sWorkingDirSLASH & $nam[3] & $verIN & ".bat"
	Global $sBat4_Orig = $sWorkingDirSLASH & $nam[4] & $verIN & ".bat"
	Global $sBat5_Orig = $sWorkingDirSLASH & $nam[5] & $verIN & ".bat"
  Global $sBat0_Orig = $sWorkingDirSLASH & $nam[0] & $verIN & ".bat"
  Global $sBat11_Orig = $sWorkingDirSLASH & $nam[11] & $verIN & ".bat"


EndIf

; verOUT  Target file
Global $sBat1_Cpy = $sWorkingDirSLASH & $nam[1] & $verOUT & ".bat"
Global $sBat2_Cpy = $sWorkingDirSLASH & $nam[2] & $verOUT & ".bat"
Global $sBat3_Cpy = $sWorkingDirSLASH & $nam[3] & $verOUT & ".bat"
Global $sBat4_Cpy = $sWorkingDirSLASH & $nam[4] & $verOUT & ".bat"
Global $sBat5_Cpy = $sWorkingDirSLASH & $nam[5] & $verOUT & ".bat"
Global $sBat0_Cpy = $sWorkingDirSLASH & $nam[0] & $verOUT & ".bat"
Global $sBat11_Cpy = $sWorkingDirSLASH & $nam[11] & $verOUT & ".bat"

$verOUT = $verOUT_bak
$verIN = $verIN_bak


;
; --- 1line hmmm , Declare arrays to hold the file lines ---
Global $aBat1_Lines[1], $aBat2_Lines[1], $aBat3_Lines[1], $aBat4_Lines[1], $aBat5_Lines[1], $aBat0_Lines[1] , $aBat11_Lines[1]
;
;
#cs
# include "bat1-2033.inc"
# include "bat2-2033.inc"
# include "bat3-2033.inc"
# include "bat4-2033.inc"
# include "bat5-2033.inc"
#ce

#cs
; nu. old.
include "bat1-2040.inc"
include "bat2-2040.inc"
include "bat3-2040.inc"
include "bat4-2040.inc"
include "bat5-2040.inc"
#ce

; =======================================================================================
; --- SCRIPT EXECUTION ---
; =======================================================================================
Main() ; <-- This call runs the main script logic
; =======================================================================================

Func _CreateIncludeFromArray_ArrayAdd(ByRef $aSourceArray, $sTargetArrayName, $sOutputFilePath)
	Local $hFile = FileOpen($sOutputFilePath, $FO_OVERWRITE)
	If $hFile = -1 Then
		_ExitOnError(@ScriptLineNumber & "Error: Could not open file for writing: " & @CRLF & $sOutputFilePath)
		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $sOutputFilePath = ' & $sOutputFilePath & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
		Return
	EndIf

	; Apply PRJ modification to array $aBat1_Lines in main()
	; SETprj($prj, $aBat1_Lines)

	FileWriteLine($hFile, "; === Auto-Generated Include File (using _ArrayAdd) ===")
	; FileWriteLine($hFile,  "Global " & $sTargetArrayName & "[0]" & @CRLF)  ;; & "[0]" & @CRLF)
	FileWriteLine($hFile, "Global " & $sTargetArrayName & @CRLF)
	FileWriteLine($hFile, $sTargetArrayName & " = '' " & @CRLF)

	Local $iUbound = UBound($aSourceArray)
	If $iUbound > 0 Then
		For $i = 0 To $iUbound - 1
			Local $sLine = $aSourceArray[$i]
			$sLine = StringReplace($sLine, "@", "@@")
			$sLine = StringReplace($sLine, "'", "''")
			FileWriteLine($hFile, "_ArrayAdd(" & $sTargetArrayName & ", '" & $sLine & "')")
		Next
	EndIf

	FileWriteLine($hFile, @CRLF & "; === End of Auto-Generated Include File (using _ArrayAdd) ===")
	FileClose($hFile)
EndFunc   ;==>_CreateIncludeFromArray_ArrayAdd
Func Main()

  #cs  copy from   5buttnGUI
Global $sBat1 = $sScriptDir & '\' & $nam[1] & $andVER
Global $sBat2 = $sScriptDir & '\' & $nam[2] & $andVER
Global $sBat3 = $sScriptDir & '\' & $nam[3] & $andVER
Global $sBat4 = $sScriptDir & '\' & $nam[4] & $andVER
Global $sBat5 = $sScriptDir & '\' & $nam[5] & $andVER
Global $sBat0 = $sScriptDir & '\' & $nam[0] & $andVER  ; only update bat file prj , not run the bat
Global $sBat11 = $sScriptDir & '\' & $nam[11] & $andVER
#ce

	; --- 1. Read files into arrays (UDF call) ---
	If Not _FileReadToArray($sBat1_Orig, $aBat1_Lines, 0) Then _ExitOnError("Error reading: " & $sBat1_Orig)
	If Not _FileReadToArray($sBat2_Orig, $aBat2_Lines, 0) Then _ExitOnError("Error reading: " & $sBat2_Orig)
	If Not _FileReadToArray($sBat3_Orig, $aBat3_Lines, 0) Then _ExitOnError("Error reading: " & $sBat3_Orig)
	If Not _FileReadToArray($sBat4_Orig, $aBat4_Lines, 0) Then _ExitOnError("Error reading: " & $sBat4_Orig)
	If Not _FileReadToArray($sBat5_Orig, $aBat5_Lines, 0) Then _ExitOnError("Error reading: " & $sBat5_Orig)
	If Not _FileReadToArray($sBat0_Orig, $aBat5_Lines, 0) Then _ExitOnError("Error reading: " & $sBat0_Orig)
	If Not _FileReadToArray($sBat11_Orig, $aBat11_Lines, 0) Then _ExitOnError("Error reading: " & $sBat11_Orig)
	ConsoleWrite("All files successfully read into arrays." & @CRLF)





	; Apply PRJ modification to array $aBat1_Lines in main()
	; SETprj($prj, $aBat1_Lines)
	SETprj($prj, $aBat1_Lines)
	SETprj($prj, $aBat2_Lines)
	SETprj($prj, $aBat3_Lines)
	SETprj($prj, $aBat4_Lines)
	SETprj($prj, $aBat5_Lines)
SETprj($prj, $aBat0_Lines)
SETprj($prj, $aBat11_Lines)

	; --- 2. Write arrays to new .bat files (UDF call) ---
	If Not _FileWriteFromArray($sBat1_Cpy, $aBat1_Lines) Then _ExitOnError("Error writing: " & $sBat1_Cpy)
	If Not _FileWriteFromArray($sBat2_Cpy, $aBat2_Lines) Then _ExitOnError("Error writing: " & $sBat2_Cpy)
	If Not _FileWriteFromArray($sBat3_Cpy, $aBat3_Lines) Then _ExitOnError("Error writing: " & $sBat3_Cpy)
	If Not _FileWriteFromArray($sBat4_Cpy, $aBat4_Lines) Then _ExitOnError("Error writing: " & $sBat4_Cpy)
	If Not _FileWriteFromArray($sBat5_Cpy, $aBat5_Lines) Then _ExitOnError("Error writing: " & $sBat5_Cpy)
If Not _FileWriteFromArray($sBat0_Cpy, $aBat0_Lines) Then _ExitOnError("Error writing: " & $sBat0_Cpy)
If Not _FileWriteFromArray($sBat11_Cpy, $aBat11_Lines) Then _ExitOnError("Error writing: " & $sBat11_Cpy)
	ConsoleWrite("All arrays successfully written to .bat files." & @CRLF)

	; --- 3. Generate .inc files from the arrays ; write .inc files $sInc1_Path  $verOUT  ---
	makeBAT()

	; --- 4. Open the newly created .inc files in Notepad++ ---
	If $shellexNotepad Then
		ShellExecute('notepad++.exe', $sBat1_Cpy)
		ShellExecute('notepad++.exe', $sBat2_Cpy)
		ShellExecute('notepad++.exe', $sBat3_Cpy)
		ShellExecute('notepad++.exe', $sBat4_Cpy)
		ShellExecute('notepad++.exe', $sBat5_Cpy)
		ShellExecute('notepad++.exe', $sBat0_Cpy)
		ShellExecute('notepad++.exe', $sBat11_Cpy)
	EndIf
	; #############################################################################
	; ### 5. Verify .inc file generation
	; #############################################################################
	ConsoleWrite(@CRLF & "--- Verification of .inc files START --- nu. old. main():" & @ScriptLineNumber & @CRLF & @CRLF)

	Global $sInc1_Path
	Global $sInc2_Path
	Global $sInc3_Path
	Global $sInc4_Path
	Global $sInc5_Path
Global $sInc0_Path
Global $sInc11_Path

	$sInc1_Path = $sWorkingDirSLASH & "bat1-" & $iver & ".inc"
	$sInc2_Path = $sWorkingDirSLASH & "bat2-" & $iver & ".inc"
	$sInc3_Path = $sWorkingDirSLASH & "bat3-" & $iver & ".inc"
	$sInc4_Path = $sWorkingDirSLASH & "bat4-" & $iver & ".inc"
	$sInc5_Path = $sWorkingDirSLASH & "bat5-" & $iver & ".inc"
	$sInc5_Path = $sWorkingDirSLASH & "bat0-" & $iver & ".inc"
	$sInc5_Path = $sWorkingDirSLASH & "bat11-" & $iver & ".inc"

	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : ( was double-slash-error\\ ) $sInc3_Path = ' & $sInc3_Path & @CRLF & '>Error code: ' & @error & @CRLF)   ;### Debug Console
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : ( was double-slash-error\\ ) $sInc4_Path = ' & $sInc4_Path & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : append $iver .inc files on: 5batINC.au3_AppendIncFiles.au3  iver= ' & $iver & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	ConsoleWrite("--- Verification of .inc files END --- nu. old. main():" & @ScriptLineNumber & @CRLF & @CRLF)
	scriptAppendIncFiles()


EndFunc   ;==>Main


Func scriptAppendIncFiles()

  ;scriptAppendIncFilesCMD()        ;; test the old func with CMD
  ;return

	; nee mach einfach ein file GlobalsArrayINC.au3
	Global $GlobalsArrayINC = @ScriptDir & '\GlobalsArrayINC.au3'
	Local $s_addArray_inc_first = @CRLF & '  ' & @CRLF & '  #include-once ' & @CRLF & ' #include <FileConstants.au3> ' & @CRLF & ' #include <Array.au3> ' & @CRLF & ' #include <MsgBoxConstants.au3> ' & @CRLF & ' #include <File.au3> ' & @CRLF & ' ' & @CRLF & ' ' & @CRLF


	Local $a = ''
	_ArrayAdd($a, $scriptNameAppendIncFiles)
	_ArrayAdd($a, $scriptNameAppendIncFiles)

	_ArrayAdd($a, @ScriptDir & '\GlobalsArrayINC.au3')
	_ArrayAdd($a, 'n')

	_ArrayAdd($a, $sInc1_Path)
	_ArrayAdd($a, 'n')

	_ArrayAdd($a, $sInc2_Path)
	_ArrayAdd($a, 'n')

	_ArrayAdd($a, $sInc3_Path)
	_ArrayAdd($a, 'n')

	_ArrayAdd($a, $sInc4_Path)
	_ArrayAdd($a, 'n')


	_ArrayAdd($a, $sInc5_Path)
	_ArrayAdd($a, 'n')
	_ArrayAdd($a, $sInc0_Path)
	_ArrayAdd($a, 'n')
	_ArrayAdd($a, $sInc11_Path)
	_ArrayAdd($a, 'n')

	;  AppendFiles(ByRef $arFil) in hardcoded scriptAppendIncFiles()
	AppendFiles($a)
	Return
EndFunc   ;==>scriptAppendIncFiles
Func scriptAppendIncFilesCMD()
	; call from main()
	; mach einfach ein file GlobalsArrayINC.au3
	Global $GlobalsArrayINC = @ScriptDir & '\GlobalsArrayINC.au3'
	Local $s_addArray_inc_first = @CRLF & '  ' & @CRLF & '  #include-once ' & @CRLF & ' #include <FileConstants.au3> ' & @CRLF & ' #include <Array.au3> ' & @CRLF & ' #include <MsgBoxConstants.au3> ' & @CRLF & ' #include <File.au3> ' & @CRLF & ' ' & @CRLF & ' ' & @CRLF
   FileWriteMy($GlobalsArrayINC, $s_addArray_inc_first)

	Local $5batINC_append_incs = $fromFolderAppendIncFiles & @ScriptName & '_AppendIncFiles.au3'
	Local $5b = $5batINC_append_incs
	Local $sc = $scriptNameAppendIncFiles

	Local $sCopyList
	Local $cmdToRun
	Local $cmdddrun ; Führt CMD aus und gibt den PID des gestarteten Prozesses zurück (> 0 bei Erfolg) ; @SW_HIDE versteckt das CMD-Fenster

	;****************************
	$sCopyList = $GlobalsArrayINC & '" + "' & $sInc1_Path & '" + "' & $sInc2_Path & '" + "' & $sInc3_Path & '" + "' & $sInc4_Path & '" + "' & $sInc5_Path & '" "' & $sc & '"'
	$cmdToRun = @ComSpec & ' /c ' & 'copy /B "' & $sCopyList
	$cmdddrun = Run($cmdToRun, "", @SW_HIDE)

	;****************************
	$sCopyList = $sc & '" + "' & @ScriptFullPath & '"  "' & $5b & '" '
	$cmdToRun = @ComSpec & ' /c ' & 'copy /B "' & $sCopyList
	$cmdddrun = Run($cmdToRun, "", @SW_HIDE) ; @SW_HIDE versteckt das CMD-Fenster


	;****************************
	If @error Then
		MsgBox(16, "FEHLER", @ScriptLineNumber & " Konnte CMD-Befehl nicht ausführen. Fehlercode: " & @error)
	ElseIf $cmdddrun = 0 Then
		MsgBox(48, "WARNUNG", "CMD-Prozess konnte nicht gestartet werden.")
	EndIf
	ConsoleWrite("--- Append  of .inc files END ---  scriptAppendIncFiles():" & @ScriptLineNumber & @CRLF & @CRLF)


EndFunc   ;==>scriptAppendIncFilesCMD

; =======================================================================================
; --- HELPER FUNCTIONS ---
; =======================================================================================

Func SETprj($prj, ByRef $a)
	; Apply PRJ modification to array $aBat1_Lines in main()
	; SETprj($prj, $aBat1_Lines)
	;
	;
	; @ECHO OFF
	; set "prj=tst12"
	; :: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::
	;
	; rem ****.bat
	;frst line[0] , test line 2 == ':: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::'
	;
	If $a[2] == ':: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::' Then
		$a[1] = 'set "prj=' & $prj & '"'
	Else
		$a[1] = '>Error testLINE 2 NOT ok '
		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $a[1] = ' & $a[1] & @CRLF & '>Error NOT == ' & @error & @CRLF) ;### Debug Console
	EndIf

	Local $x = 3
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $prj //$a[' & $x & ']= ' & $prj & ' //' & $a[$x] & @CRLF) ;### Debug Console
	; _ArrayDisplay($a,  $a[$x])
EndFunc   ;==>SETprj


Func makeBAT() ; write .inc files $sInc1_Path  $verOUT
	ConsoleWrite("Attempting to create .inc files (using _ArrayAdd method)..." & @CRLF)
	; write .inc files $sInc1_Path  $verOUT
	Local $sInc1_Path = $sWorkingDirSLASH & "\bat1-" & $verOUT & ".inc"
	Local $sInc2_Path = $sWorkingDirSLASH & "\bat2-" & $verOUT & ".inc"
	Local $sInc3_Path = $sWorkingDirSLASH & "\bat3-" & $verOUT & ".inc"
	Local $sInc4_Path = $sWorkingDirSLASH & "\bat4-" & $verOUT & ".inc"
	Local $sInc5_Path = $sWorkingDirSLASH & "\bat5-" & $verOUT & ".inc"
Local $sInc0_Path = $sWorkingDirSLASH & "\bat0-" & $verOUT & ".inc"
Local $sInc11_Path = $sWorkingDirSLASH & "\bat11-" & $verOUT & ".inc"

	Local $sArr1_Name = "$aBat1_Lines"
	Local $sArr2_Name = "$aBat2_Lines"
	Local $sArr3_Name = "$aBat3_Lines"
	Local $sArr4_Name = "$aBat4_Lines"
	Local $sArr5_Name = "$aBat5_Lines"
Local $sArr0_Name = "$aBat0_Lines"
Local $sArr11_Name = "$aBat11_Lines"

	_CreateIncludeFromArray_ArrayAdd($aBat1_Lines, $sArr1_Name, $sInc1_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat2_Lines, $sArr2_Name, $sInc2_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat3_Lines, $sArr3_Name, $sInc3_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat4_Lines, $sArr4_Name, $sInc4_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat5_Lines, $sArr5_Name, $sInc5_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat0_Lines, $sArr0_Name, $sInc5_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat11_Lines, $sArr11_Name, $sInc5_Path)

	ConsoleWrite("... .inc file generation complete." & @CRLF)
EndFunc   ;==>makeBAT


Func _CreateIncludeFromArray_byIndex(ByRef $aSourceArray, $sTargetArrayName, $sOutputFilePath)
	; old nu.
	Local $hFile = FileOpen($sOutputFilePath, $FO_OVERWRITE)
	If $hFile = -1 Then
		_ExitOnError("Error: Could not open file for writing: " & @CRLF & $sOutputFilePath)
		Return
	EndIf

	Local $iUbound = UBound($aSourceArray)
	FileWriteLine($hFile, "; === Auto-Generated Include File (by Index) ===")
	;FileWriteLine($hFile, "#include-once" & @CRLF)

	If $iUbound = 0 Then
		FileWriteLine($hFile, "Global " & $sTargetArrayName & "[0]")
	Else
		FileWriteLine($hFile, "Global " & $sTargetArrayName & "[" & $iUbound & "]" & @CRLF)
		For $i = 0 To $iUbound - 1
			Local $sLine = $aSourceArray[$i]
			$sLine = StringReplace($sLine, "@", "@@")
			$sLine = StringReplace($sLine, "'", "''")
			FileWriteLine($hFile, $sTargetArrayName & "[" & $i & "] = '" & $sLine & "'")
		Next
	EndIf
	FileWriteLine($hFile, @CRLF & "; === End of Auto-Generated Include File (by Index) ===")
	FileClose($hFile)
	Local $sdummy = '    ' & "    " & ' ""    "" '
EndFunc   ;==>_CreateIncludeFromArray_byIndex


Func _ExitOnError($sMessage)
	MsgBox($MB_ICONERROR + $MB_TOPMOST, "Script-Error", $sMessage & @CRLF & "Errorcode @error: " & @error)
	Exit 1 ; Exits the script with an error code
EndFunc   ;==>_ExitOnError

Func ArrComp($a, $b)
	Return ArrayEqual($a, $b)
EndFunc   ;==>ArrComp
Func ArrCompIgnoreWS($a, $b)
	Return ArrayEqualIgnoreWS($a, $b)
EndFunc   ;==>ArrCompIgnoreWS
Func ArrayEqual($a, $b)
	If Not IsArray($a) Or Not IsArray($b) Then Return False
	If UBound($a) <> UBound($b) Then Return False
	For $i = 0 To UBound($a) - 1
		If $a[$i] <> $b[$i] Then Return False
	Next
	Return True
EndFunc   ;==>ArrayEqual
Func ArrayEqualIgnoreWS($a, $b)
	; Eingaben prüfen
	If Not IsArray($a) Or Not IsArray($b) Then
		Return 0
	EndIf

	; Indizes und Grenzen initialisieren
	Local $idxA = 0
	Local $idxB = 0
	Local $lenA = UBound($a)
	Local $lenB = UBound($b)

	; Hauptschleife: durch beide Arrays laufen, dabei leere/whitespace-only Einträge überspringen
	While True
		; Elemente in $a überspringen, die nur aus Whitespace bestehen
		While $idxA < $lenA And StringStripWS($a[$idxA], 3) = ""
			$idxA = $idxA + 1
		WEnd

		; Elemente in $b überspringen, die nur aus Whitespace bestehen
		While $idxB < $lenB And StringStripWS($b[$idxB], 3) = ""
			$idxB = $idxB + 1
		WEnd

		; Wenn eines oder beide Arrays am Ende sind, Schleife verlassen
		If $idxA >= $lenA Or $idxB >= $lenB Then
			ExitLoop
		EndIf

		; Vergleich der aktuellen Elemente (nach Trim)
		Local $valA = StringStripWS($a[$idxA], 3)
		Local $valB = StringStripWS($b[$idxB], 3)
		If $valA <> $valB Then
			Return 0
		EndIf

		; Weiter zum nächsten Paar
		$idxA = $idxA + 1
		$idxB = $idxB + 1
	WEnd

	; Am Ende verbleibende rein-Whitespace Einträge überspringen
	While $idxA < $lenA And StringStripWS($a[$idxA], 3) = ""
		$idxA = $idxA + 1
	WEnd

	While $idxB < $lenB And StringStripWS($b[$idxB], 3) = ""
		$idxB = $idxB + 1
	WEnd

	; samesame return 1 Beide Indizes müssen am Ende sein, damit die Arrays gleich sind
	If $idxA >= $lenA And $idxB >= $lenB Then
		Return 1
	EndIf

	; false arrays not samesame
	Return 0
EndFunc   ;==>ArrayEqualIgnoreWS
Func AppendFiles(ByRef $arFil)
	#cs  ; ## schreibe moeglichst kurze Autoit func, nach dem schema/beschreibung:

	Func AppendFiles(ByRef $arFil)
	  ;input array arFil enthaelt je ar[x] entweder pathFileName oder fileContentString oder kennzeichen
	  ;input array arFil structure: arFil[0] target-path-file-name arFil[1]=''
	  ;arFil[$i]= entweder path-file-NAME oder fileContentString ;; arFil[$i+1]='n' oder 's' fuer Name-File oder file-content-STRING
	  ;and so on arFil[x * $i] = path-file-NAME oder fileContentString  ;; arFil[(x * $i)+1] = 'n' oder 's' fuer NAME-file oder file-content-STRING
	  
	  FileWriteMy( arFil[0] target-path-file-name , ..content.. )
	EndFunc

	## alles klar? oder frage genau nach
	#ce  ; ## schreibe moeglichst kurze Autoit func, nach dem schema/beschreibung:
	;
	; Die erste Aktion muss die Zieldatei vorbereiten (loeschen), wofuer wir den Modus 2 (Ueberschreiben) verwenden.
	; Wir schreiben einen leeren String, um die Datei zu erstellen und zu leeren.
	Local $sTarget = $arFil[0]
	FileWriteMy($sTarget, "")
	If @error Then Return SetError(1, 0, False)   ; Fehler beim Vorbereiten/Loeschen

	; Starte bei Index 2, da 0 die Zieldatei und 1 der Indikator ist
	For $i = 2 To UBound($arFil) - 1 Step 2
		Local $sContent = $arFil[$i]
		Local $sIndicator = $arFil[$i + 1]

		If $sIndicator = 'n' Then
			; Indikator 'n': $sContent ist ein Pfad -> Lese Inhalt der Datei und schreibe ihn
			Local $sFileData = FileRead($sContent)
			If @error Then ContinueLoop       ; Datei nicht gefunden/lesbar
			; Write text/data to the end of a previously opened file.
			FileWrite($sTarget, $sFileData)
		ElseIf $sIndicator = 's' Then
			; Indikator 's': $sContent ist ein direkter String-Inhalt -> Schreibe ihn
			; Verwende FileWriteMy im APPEND-Modus (1), um den String anzuhaengen
			FileWrite($sTarget, $sContent)
		EndIf
	Next

	Return True
EndFunc   ;==>AppendFiles

#include-once
#include <File.au3>
;#include "1file_Global_DEF.au3"
;#include "1file_func_marker.au3"
;#include "D:\ws\autoit2020\FileWriteMy._final.au3"

; =======================================================
; TESTAUFRUFE   FileWriteMy
; =======================================================
If 0 Then
	; Test 1: Datei im aktuellen Skript-Verzeichnis (wo $sFolderPath leer sein wird)
	FileWriteMy(@ScriptDir & "\testfile_hier.txt", "Inhalt 1")
	ConsoleWrite("Test 1: 'testfile_hier.txt' geschrieben." & @CRLF)

	; Test 2: Datei in einem neuen Unterordner (wo $sFolderPath erstellt werden muss)
	FileWriteMy(@ScriptDir & "\MeinNeuerOrdner\testfile_dort.txt", "Inhalt 2")
	ConsoleWrite("Test 2: '\MeinNeuerOrdner\testfile_dort.txt' geschrieben." & @CRLF)
EndIf


Func FileWriteMy($PathFileExt, $String, $dummy = '')
	;#include "D:\ws\autoit2020\FileWriteMy._final.au3"
	; 1. Prüfen, ob die ZIEL-DATEI bereits existiert
	If FileExists($PathFileExt) Then
		; 1a. JA: Datei existiert.
		; Der Ordner MUSS also auch existieren.
		; Wir müssen nur die alte Datei löschen.
		FileDelete($PathFileExt)
	Else
		; 1b. NEIN: Datei existiert nicht.
		; Jetzt MÜSSEN wir den Ordner prüfen.
		Local $sDrive, $sDir

		; =======================================================
		; KORREKTUR:
		; Wir brauchen Variablen für ALLE ByRef-Parameter.
		Local $sDummyFname, $sDummyExt
		_PathSplit($PathFileExt, $sDrive, $sDir, $sDummyFname, $sDummyExt)
		; =======================================================

		Local $sFolderPath = $sDrive & $sDir

		; 2. KORREKTUR:
		;    Nur wenn $sFolderPath NICHT LEER ist UND der Ordner
		;    NICHT existiert, DANN erstellen.
		If $sFolderPath <> "" And Not FileExists($sFolderPath) Then
			; 3. Wenn nicht, erstellen.
			DirCreate($sFolderPath)
		EndIf
	EndIf

	; 4. (Jetzt) Alte Datei ist gelöscht UND Ordner existiert garantiert.
	; Success: 1. ;; Failure: 0 if file not opened in writemode, file is read only, or file cannot otherwise be written to.
	Return FileWrite($PathFileExt, $String)
EndFunc   ;==>FileWriteMy

#cs   ### please know



>Running AU3Check (3.3.16.1)  from:C:\p\AutoIt3  input:D:\ws\autoit2020\FileWriteMy._final.au3
"D:\ws\autoit2020\FileWriteMy._final.au3"(37,55) : error: _PathSplit() called with Const or expression on ByRef-param(s).
		_PathSplit($PathFileExt, $sDrive, $sDir, Null, Null)
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
"C:\p\AutoIt3\Include\File.au3"(999,93) : REF: definition of _PathSplit().
Func _PathSplit($sFilePath, ByRef $sDrive, ByRef $sDir, ByRef $sFileName, ByRef $sExtension)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
D:\ws\autoit2020\FileWriteMy._final.au3 - 1 error(s), 0 warning(s)
!>14:02:25 AU3Check ended. Press F4 to jump to next error.rc:2


### ****  check params , example: ****
#include <Array.au3>
#include <File.au3>

Local $sDrive = "", $sDir = "", $sFileName = "", $sExtension = ""
Local $aPathSplit = _PathSplit(@ScriptFullPath, $sDrive, $sDir, $sFileName, $sExtension)
_ArrayDisplay($aPathSplit, "_PathSplit of " & @ScriptFullPath)


### help::
_PathSplit
Splits a path into the drive, directory, file name and file extension parts. An empty string is set if a part is missing


#include <File.au3>
_PathSplit ( $sFilePath, ByRef $sDrive, ByRef $sDir, ByRef $sFileName, ByRef $sExtension )


Parameters
$sFilePath The path to be split (can contain a UNC server or drive letter)
$sDrive String to hold the drive
$sDir String to hold the directory
$sFileName String to hold the file name
$sExtension String to hold the file extension

Return Value
Returns an array with 5 elements:
    $aArray[$PATH_ORIGINAL] = original path
    $aArray[$PATH_DRIVE] = drive
    $aArray[$PATH_DIRECTORY] = directory
    $aArray[$PATH_FILENAME] = filename
    $aArray[$PATH_EXTENSION] = extension

Remarks
This function does not take a command line string. It works on paths, not paths with arguments.

$PATH_ORIGINAL 0
$PATH_DRIVE 1
$PATH_DIRECTORY 2
$PATH_FILENAME 3
$PATH_EXTENSION 4

Constants are defined in FileConstants.au3.


Related
_PathFull, _PathMake



### chat ::
Der Fehler ist sehr klar und deine beigelegte Hilfe-Datei erklärt ihn perfekt ; Das Problem ist: `_PathSplit` erwartet für die Parameter 2, 3, 4 und 5 **Variablen** (definiert als `ByRef`), in die es die Ergebnisse schreiben kann.

Du übergibst aber für Parameter 4 und 5 den Wert `Null`. `Null` ist ein konstanter Wert (eine "Const or expression"), keine Variable. Die Funktion kann nicht in `Null` hineinschreiben.

### Der fehlerhafte Code

```autoit
_PathSplit($PathFileExt, $sDrive, $sDir, Null, Null) ; <-- FALSCH
```

### Die Lösung  Du musst einfach zwei (beliebige) "Dummy"-Variablen für den Dateinamen und die Dateiendung deklarieren, auch wenn du sie später nicht brauchst.
###  oben ist die umgeschriebene `Func FileWriteMy`, die den Fehler behebt

#ce   ### please know
#cs
_ArrayAdd
Adds a specified value at the end of an existing 1D or 2D array


#include <Array.au3>
_ArrayAdd ( ByRef $aArray, $vValue [, $iStart = 0 [, $sDelim_Item = "|" [, $sDelim_Row = @CRLF [, $iForce = $ARRAYFILL_FORCE_DEFAULT]]]] )


Parameters
$aArray Array to modify
$vValue Value(s) to add - can be a single item, a delimited string or an array
$iStart [optional] Column in which addition is to begin (2D array only)
$sDelim_Item [optional] Delimiter used if a string is to be split into items
$sDelim_Row [optional] Delimiter used if a string is to be split into rows (2D only)
$iForce [optional] Maintains default behaviour,
    $ARRAYFILL_FORCE_DEFAULT (0)
Forces $vValue addition as a single item,
    $ARRAYFILL_FORCE_SINGLEITEM (1)
Or forces datatype for all added items
    $ARRAYFILL_FORCE_INT (2)
    $ARRAYFILL_FORCE_NUMBER (3)
    $ARRAYFILL_FORCE_PTR (4)
    $ARRAYFILL_FORCE_HWND (5)
    $ARRAYFILL_FORCE_STRING (6)
    $ARRAYFILL_FORCE_BOOLEAN (7)
See Remarks for more details


#ce

