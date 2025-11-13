#include-once
;last was no err ; 5batINC-2460_bak02-no-err-TO-2651
#include <FileConstants.au3>
#include <Array.au3> ; Used For _ArrayDisplay, _ArrayAdd, And _ArrayCompare
#include <MsgBoxConstants.au3>
#include <File.au3> ; IMPORTANT : Needed For _FileReadToArray And _FileWriteFromArray
;---idxq_2648---2025_11_13---14_19_11
; festlegung: 2020 kennzeichnet functionierendes file , old war 2033 aber das koennte im jahr 2033 stoerend sein, deshalb alles aendern nach und nach von 2033 auf 2020
;; used nam[ :: ; $sBat1   #include "bat1-2020.inc"   $sBat1_Orig-s-fil-nam     new-nu. $sBat1_Cpy    ; --- Declare arrays to hold the file lines ---  	_CreateIncludeFromArray_ArrayAdd($aBat1_Lines, $sArr1_Name, $sInc1_Path)     Global $aBat1_Lines[1], $aBat2_Lines[1], $aBat3_Lines[1], $aBat4_Lines[1], $aBat5_Lines[1]
;
; "prj" git prj name
;~ @ECHO OFF
;~ set "prj=tst3"
;~ :: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::
;~ REM *** IMPORTANT: The first 3 lines (including "set prj=...") used by  external software it interacts with.
;~ rem !!!DO NOT CHANGE!!! ***
;~ rem 1 barePUSH
;~ set "cmdnam=barePUSH"
;~ set "cmdnum=1"
;~ SETLOCAL
;
;.bat cmd run
;array write .inc
;inc create array var
;append on script .inc file for only one code-file
;RESET read array in script file and make write save cmd.bat files
;ver numbers [2020] [2023] make a copy is nonsense
;
;
;ToDo: input output params arg  only 1 array Param arrayToParam $a2p
; $a2p arrayToParam $a2p only 1 array Param  and get('nam')  set('nam')
;indicator: 'n' is filename  ;; 'a' a2s string with array elements ;;else s string
; cmd file 2 arrayadd code lines
Global $shellexNotepad = 0

Global $prj = 'tst29'
; IN **** IN new in ver 2020
Global $verIN = '2020'  ;in cpy  gitPUSH-2033.bat,..,barePUSH-2033.bat to  gitPUSH-2040.bat,..,barePUSH-2040.bat
Global $VER = $verIN
Global $andVER = '-' & $VER & '.bat'
; OUT **** OUT **** can samesame 2033 ;out overwrite existing
Global $verOUT = '2033'  ;OUT overwrite rewrite ;new generated inc.au3 eg. "bat2-2040.inc" ;can sameSame 2033
;
; for: 	Global $sInc2_Path ;;// = $sWorkingDirSLASH & "\bat2-" & $iver & ".inc"
Global $iver = '2020'  ;;//  load inc file array iver  inc-Version

;
; ---idxq_2649---2025_11_13---14_55_40
;*** old  gitgit_auto; *** new gitWeb ***  new D:\ws\gitGit\source\workspaces\5batINC; ***
;old;
;~ Global $sWorkingDirSLASH         = "D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC\"
;~ Global $sScriptDir               = "D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC"
;~ Global $fromFolderAppendIncFiles = 'D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC\'
Global $sScriptDir = @ScriptDir
;*** ADDSLASH !!! ***
Global $sWorkingDirSLASH = @ScriptDir & "\"
Global $fromFolderAppendIncFiles = @ScriptDir & '\'
;
; das ergebnis file , wo alle inc files angehaengt werden
;old; Global $cmdCPY_scriptNameAppendIncFiles ;OLD!!! new Local $sCopyCommand
Global $scriptNameAppendIncFiles = $fromFolderAppendIncFiles & '_AppendIncFiles.au3'
;
ConsoleWrite(@CRLF & '@@ Debug(' & @ScriptLineNumber & ') : $sScriptDir = ' & $sScriptDir & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') // @ScriptDir // @ScriptFullPath // $sScriptDir // $scriptNameAppendIncFiles //' & @CRLF & '-- ' & @ScriptDir & @CRLF & '-- ' & @ScriptFullPath & @CRLF & '-- ' & $sScriptDir & @CRLF & '-- ' & $scriptNameAppendIncFiles & @CRLF & @CRLF)      ;### Debug Console
;*** old  gitgit_auto;  new D:\ws\gitGit\source\workspaces\5batINC; end; ***
;



;*** new ***
Global $nam[22]                 ; in D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5buttnGUI\5buttnGUI-2460.au3
$nam[1] = 'barePUSH'            ; (WS -> BARE)
$nam[2] = 'bare-gitPUSH'        ; (WS -> BARE and GITHUB)
$nam[3] = 'bareFETCH'           ; (BARE -> WS HARDPULL LATEST)
$nam[4] = 'gitFETCH'            ; (GITHUB -> WS HARDPULL LATEST)
$nam[5] = 'create-bare-gitPUSH' ; (Initialisierung)
$nam[6] = 'gitPUSH'             ; nu. only update, not run (WS -> GITHUB)
$nam[7] = 'merge-NU-bare-gitFETCH'   ;; merge-NU-bare-gitFETCH-2020.bat


If 0 Then ; *** old [11] ,  [0] is good ? do not know now ***

	$nam[11] = 'merge-NU-bare-gitFETCH' ;; merge-NU-bare-gitFETCH-2020.bat
	$nam[0] = 'gitPUSH'           ; nu. only update, not run (WS -> GITHUB)


	; Tortoise old [6][7]
	;*** NO .bat run exe ==> NO NEED nam[] add10 to index :-) qq66yy  TortoiseGit Buttons
	$nam[16] = 'Tortoise Log GIT' ; geht fuer bare und fuer git web
	$nam[17] = 'Tortoise Log BARE' ;nu. Wird im Event-Loop weggelassen

	$nam[8] = 'RESET to prj (updat bat)' ; NEU: Aktualisiert die Batch-Dateien
	$nam[9] = 'openDirGitGitEDsrcMain'
	; -- new2  code end 5buttnGUI-2462 -- PUSH-Skripte -----------------------------------------
	$nam[10] = '3OpenSelectInVSC_Notpp_AU3'
	; NU.  only update .bat , not run
EndIf



; Erstellung der vollständigen Batch-Pfade
Global $sBat1 = $sScriptDir & '\' & $nam[1] & $andVER
Global $sBat2 = $sScriptDir & '\' & $nam[2] & $andVER
Global $sBat3 = $sScriptDir & '\' & $nam[3] & $andVER
Global $sBat4 = $sScriptDir & '\' & $nam[4] & $andVER
Global $sBat5 = $sScriptDir & '\' & $nam[5] & $andVER
ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $sBat5 = ' & $sBat5 & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
;@@ Debug(72) : $sBat5 = D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC\create-bare-gitPUSH-2033.bat


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


If 1 Then  ; $sBat1_Orig-s-fil-nam
	Global $sBat1_Orig = $sWorkingDirSLASH & $nam[1] & $verIN & ".bat"
	Global $sBat2_Orig = $sWorkingDirSLASH & $nam[2] & $verIN & ".bat"
	Global $sBat3_Orig = $sWorkingDirSLASH & $nam[3] & $verIN & ".bat"
	Global $sBat4_Orig = $sWorkingDirSLASH & $nam[4] & $verIN & ".bat"
	Global $sBat5_Orig = $sWorkingDirSLASH & $nam[5] & $verIN & ".bat"
  Global $sBat6_Orig = $sWorkingDirSLASH & $nam[6] & $verIN & ".bat"
  Global $sBat7_Orig = $sWorkingDirSLASH & $nam[7] & $verIN & ".bat"
EndIf

; verOUT  Target file nu.

$verOUT = $verOUT_bak
$verIN = $verIN_bak


;
; --- Declare arrays to hold the file lines ---  	_CreateIncludeFromArray_ArrayAdd($aBat1_Lines, $sArr1_Name, $sInc1_Path)
Global $aBat1_Lines[1], $aBat2_Lines[1], $aBat3_Lines[1], $aBat4_Lines[1], $aBat5_Lines[1], $aBat6_Lines[1] , $aBat7_Lines[1]

#cs
# include "bat1-2033.inc"
# include "bat2-2033.inc"
# include "bat3-2033.inc"
# include "bat4-2033.inc"
# include "bat5-2033.inc"
#ce
;--fuc  save2file from script  --fuc addINCbat   merge: copy script + incBAT1 + 2 + 3 +incBat4  script


; =======================================================================================
Main() ; <-- This call runs the main script logic
; =======================================================================================
Func Main()
	; --- 1. Read files into arrays (UDF call) ---
	If Not _FileReadToArray($sBat1_Orig, $aBat1_Lines, 0) Then _ExitOnError("Error reading: " & $sBat1_Orig)
	If Not _FileReadToArray($sBat2_Orig, $aBat2_Lines, 0) Then _ExitOnError("Error reading: " & $sBat2_Orig)
	If Not _FileReadToArray($sBat3_Orig, $aBat3_Lines, 0) Then _ExitOnError("Error reading: " & $sBat3_Orig)
	If Not _FileReadToArray($sBat4_Orig, $aBat4_Lines, 0) Then _ExitOnError("Error reading: " & $sBat4_Orig)
	If Not _FileReadToArray($sBat5_Orig, $aBat5_Lines, 0) Then _ExitOnError("Error reading: " & $sBat5_Orig)
	If Not _FileReadToArray($sBat6_Orig, $aBat5_Lines, 0) Then _ExitOnError("Error reading: " & $sBat6_Orig)
	If Not _FileReadToArray($sBat7_Orig, $aBat5_Lines, 0) Then _ExitOnError("Error reading: " & $sBat7_Orig)

  ConsoleWrite("All files successfully read into arrays." & @CRLF)





	; Apply PRJ modification to array $aBat1_Lines in main()
	SETprj($prj, $aBat1_Lines)  ;; ;$a[1] = 'set "prj=' & $prj & '"'
	SETprj($prj, $aBat2_Lines)
	SETprj($prj, $aBat3_Lines)
	SETprj($prj, $aBat4_Lines)
	SETprj($prj, $aBat5_Lines)
  SETprj($prj, $aBat6_Lines)
  SETprj($prj, $aBat7_Lines)

	; --- 2. Write arrays to new .bat files (UDF call)  nu.---


	; --- 3. Generate .inc files from the arrays ---
	CreateIncludeFromArray_ArrayAdd_All()  ;;old makeBAT() make write save:  Local $sInc1_Path = $sWorkingDirSLASH & "\bat1-" & $verOUT & ".inc"   bat1-2020.inc

	; --- 4. Open the newly created .bat files in Notepad++ ---

	; #############################################################################
	; ### 5. Verify .inc file generation
	; #############################################################################
	ConsoleWrite(@CRLF & "--- Verification of .inc files START --- nu. old. main():" & @ScriptLineNumber & @CRLF & @CRLF)

	Global $sInc1_Path ;;//  bat1-2020.inc
	Global $sInc2_Path ;;// = $sWorkingDirSLASH & "\bat2-" & $iver & ".inc"
	Global $sInc3_Path ;;// = $sWorkingDirSLASH & "\bat3-" & $iver & ".inc"
	Global $sInc4_Path ;;// = $sWorkingDirSLASH & "\bat4-" & $iver & ".inc"
	Global $sInc5_Path ;;// = $sWorkingDirSLASH & "\bat5-" & $iver & ".inc"
  Global $sInc6_Path
  Global $sInc7_Path

	$sInc1_Path = $sWorkingDirSLASH & "bat1-" & $iver & ".inc"
	$sInc2_Path = $sWorkingDirSLASH & "bat2-" & $iver & ".inc"
	$sInc3_Path = $sWorkingDirSLASH & "bat3-" & $iver & ".inc"
	$sInc4_Path = $sWorkingDirSLASH & "bat4-" & $iver & ".inc"
	$sInc5_Path = $sWorkingDirSLASH & "bat5-" & $iver & ".inc"
  $sInc6_Path = $sWorkingDirSLASH & "bat6-" & $iver & ".inc"
  $sInc7_Path = $sWorkingDirSLASH & "bat7-" & $iver & ".inc"

	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : ( was double-slash-error\\ ) $sInc3_Path = ' & $sInc3_Path & @CRLF & '>Error code: ' & @error & @CRLF)   ;### Debug Console
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : ( was double-slash-error\\ ) $sInc4_Path = ' & $sInc4_Path & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : append $iver .inc files on: 5batINC.au3_AppendIncFiles.au3  iver= ' & $iver & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	ConsoleWrite("--- Verification of .inc files END --- nu. old. main():" & @ScriptLineNumber & @CRLF & @CRLF)
	scriptAppendIncFiles()


EndFunc   ;==>Main
Func _CreateIncludeFromArray_ArrayAdd(ByRef $aSourceArray, $sTargetArrayName, $sOutputFilePath) ;a2inc2a2f
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
Func scriptAppendIncFiles()
	#cs  ; call from main()
	;;//  @@ Debug(248) :
	;;// $cmdCPY_scriptNameAppendIncFiles = copy D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\bat1-2033.inc + D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\bat2-2033.inc + D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\bat3-2033.inc + D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\bat4-2033.inc  D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\5batINC.au3_AppendIncFiles.au3
	;;//                                                               D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\5batINC.au3_AppendIncFiles.au3
	;;//
	; run(  copy a + b + c + d + e   f  )
	;;// old ;;// 	$cmdCPY_scriptNameAppendIncFiles = 'copy ' & $sInc1_Path & ' + ' & $sInc2_Path & ' + ' & $sInc3_Path & ' + ' & $sInc4_Path & '" + "' & $sInc5_Path & '  ' & $scriptNameAppendIncFiles



	AI CHAT: Korrigierte AutoIt-String-Logik
	Angenommen, deine Variablen sind korrekt definiert ($sInc1_Path, etc. und $scriptNameAppendIncFiles), sollte der AutoIt-String so aussehen:

	AutoIt

	; AI CHAT:  Korrigierte Syntax für das Zusammenfügen MEHRERER Dateien mit binärem Modus
	#ce  ; call from main()

	; nee mach einfach ein file GlobalsArrayINC.au3
	Local $GlobalsArrayINC = @ScriptDir & '\GlobalsArrayINC.au3'
	Local $s_addArray_inc_first = @CRLF & '  ' & @CRLF & '  #include-once ' & @CRLF & ' #include <FileConstants.au3> ' & @CRLF & ' #include <Array.au3> ' & @CRLF & ' #include <MsgBoxConstants.au3> ' & @CRLF & ' #include <File.au3> ' & @CRLF & ' ' & @CRLF & ' ' & @CRLF



	Local $sIncList_AI = '"' & $GlobalsArrayINC & '" + "' & $sInc1_Path & '" + "' & $sInc2_Path & '" + "' & $sInc3_Path & '" + "' & $sInc4_Path & '" + "' & $sInc5_Path & '"'
	Local $sCopyCommand_AI = 'copy /B ' & $sIncList_AI & ' "' & $scriptNameAppendIncFiles & '"'
	#cs ; Stelle sicher, dass dieser korrigierte $sCopyCommand mit dem /B-Schalter über Run(@ComSpec & " /c " & $sCopyCommand) ausgeführt wird. Das sollte das lästige EOF-Zeichen am Ende deiner zusammengefügten Datei verhindern.
		; Originaler Befehl, aber als Argument für CMD vorbereitet
	#ce ; Stelle sicher, dass dieser korrigierte $sCopyCommand mit dem /B-Schalter über Run(@ComSpec & " /c " & $sCopyCommand) ausgeführt wird. Das sollte das lästige EOF-Zeichen am Ende deiner zusammengefügten Datei verhindern.
	;old; Local $sCopyCommand = 'copy "' & $sInc1_Path & '" + "' & $sInc2_Path & '" + "' & $sInc3_Path & '" + "' & $sInc4_Path & '" + "' & $sInc5_Path &  '" "' & $scriptNameAppendIncFiles & '"'
	;new with /b ;
	Local $sCopyCommand
	$sCopyCommand = 'copy /B "' & $GlobalsArrayINC & '" + "' & $sInc1_Path & '" + "' & $sInc2_Path & '" + "' & $sInc3_Path & '" + "' & $sInc4_Path & '" + "' & $sInc5_Path & '" "' & $scriptNameAppendIncFiles & '"'
	; here 277 in Func scriptAppendIncFiles()
	; run cmd.exe
	Local $cmdToRun = @ComSpec & ' /c ' & $sCopyCommand
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $cmdToRun = ' & $cmdToRun & @CRLF) ;### Debug Console

	; Führt CMD aus und gibt den PID des gestarteten Prozesses zurück (> 0 bei Erfolg)
	Local $cmdddrun = Run($cmdToRun, "", @SW_HIDE) ; @SW_HIDE versteckt das CMD-Fenster
	;
	;****************************
	;****************************
	; make script-file-with-arrays-create-on-end-file-append-.inc-files ; add .inc files to end on script file
	;
	; ok; ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : @ScriptName = ' & @ScriptName & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	Local $5batINC_append_incs                 ;;= @ScriptFullPath &  $scriptNameAppendIncFiles
	$5batINC_append_incs = $fromFolderAppendIncFiles & @ScriptName & '_AppendIncFiles.au3'
	; ok: D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC\5batINC-2460.au3_AppendIncFiles.au3
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $5batINC_append_incs = ********* ' & @CRLF & ' *********************************************************************************** ' & @CRLF & $5batINC_append_incs & @CRLF & '>Error code: ' & @error & @CRLF)      ;### Debug Console

	; Local $thisscript = @ScriptFullPath & @ScriptName  ; haha is allet drinn in @ScriptFullPath; zu viel: $thisscript = D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC\5batINC-2460.au35batINC-2460.au3
	; zu viel nu. ; ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $thisscript = ' & $thisscript & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	Local $cpyAppendStr = 'copy /B "' & $scriptNameAppendIncFiles & '" + "' & @ScriptFullPath & '"  "' & $5batINC_append_incs & '" '
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $cpyAppendStr =' & $cpyAppendStr & '= ' & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	$cmdToRun = @ComSpec & ' /c ' & $cpyAppendStr
	$cmdddrun = Run($cmdToRun, "", @SW_HIDE) ; @SW_HIDE versteckt das CMD-Fenster


	;
	;****************************
	;****************************
	;
	; $flist only for debugg console
	Local $flist = @CRLF & $sInc1_Path & @CRLF & $sInc2_Path & @CRLF & $sInc3_Path & @CRLF & $sInc4_Path & @CRLF & $sInc5_Path & @CRLF & @CRLF
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : make $scriptNameAppendIncFiles {err 0/1 OK}?= ' & $cmdddrun & ' =' & $scriptNameAppendIncFiles & @CRLF & $flist & @CRLF & '>Error code: ' & @error & @CRLF)    ;### Debug Console

	If @error Then
		MsgBox(16, "FEHLER", "Konnte CMD-Befehl nicht ausführen. Fehlercode: " & @error)
	ElseIf $cmdddrun = 0 Then
		MsgBox(48, "WARNUNG", "CMD-Prozess konnte nicht gestartet werden.")
	EndIf
	ConsoleWrite("--- Append  of .inc files END ---  scriptAppendIncFiles():" & @ScriptLineNumber & @CRLF & @CRLF)


EndFunc   ;==>scriptAppendIncFiles
Func SETprj($prj, ByRef $a)  ;$a[1] = 'set "prj=' & $prj & '"'
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
Func CreateIncludeFromArray_ArrayAdd_All()  ;_CreateIncludeFromArray_ArrayAdd($aBat1_Lines, $sArr1_Name, $sInc1_Path) ; & save
	ConsoleWrite("Attempting to create .inc files (using _ArrayAdd method)..." & @CRLF)

	Local $sInc1_Path = $sWorkingDirSLASH & "\bat1-" & $verOUT & ".inc"
	Local $sInc2_Path = $sWorkingDirSLASH & "\bat2-" & $verOUT & ".inc"
	Local $sInc3_Path = $sWorkingDirSLASH & "\bat3-" & $verOUT & ".inc"
	Local $sInc4_Path = $sWorkingDirSLASH & "\bat4-" & $verOUT & ".inc"
	Local $sInc5_Path = $sWorkingDirSLASH & "\bat5-" & $verOUT & ".inc"
	Local $sInc6_Path = $sWorkingDirSLASH & "\bat6-" & $verOUT & ".inc"
	Local $sInc7_Path = $sWorkingDirSLASH & "\bat7-" & $verOUT & ".inc"

	Local $sArr1_Name = "$aBat1_Lines"
	Local $sArr2_Name = "$aBat2_Lines"
	Local $sArr3_Name = "$aBat3_Lines"
	Local $sArr4_Name = "$aBat4_Lines"
	Local $sArr5_Name = "$aBat5_Lines"
	Local $sArr6_Name = "$aBat6_Lines"
	Local $sArr7_Name = "$aBat7_Lines"

	_CreateIncludeFromArray_ArrayAdd($aBat1_Lines, $sArr1_Name, $sInc1_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat2_Lines, $sArr2_Name, $sInc2_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat3_Lines, $sArr3_Name, $sInc3_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat4_Lines, $sArr4_Name, $sInc4_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat5_Lines, $sArr5_Name, $sInc5_Path)
  _CreateIncludeFromArray_ArrayAdd($aBat6_Lines, $sArr6_Name, $sInc6_Path)
  _CreateIncludeFromArray_ArrayAdd($aBat7_Lines, $sArr7_Name, $sInc7_Path)

	ConsoleWrite("... .inc file generation & save complete." & @CRLF)
EndFunc
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
Func shellexecuteIncFilesNOTEaRecreated_dummy_fuc_Do_Nothing() ; do nothing only my note from fuc main
	; do nothing only my note from fuc main
	Return False
	;
	;
	;copy lines from main , note
	;$aRecreated1
	Global $aRecreated1 = $aBat1_Lines
	Global $aRecreated2 = $aBat2_Lines
	Global $aRecreated3 = $aBat3_Lines
	Global $aRecreated4 = $aBat4_Lines
	Global $aRecreated5 = $aBat5_Lines
	;
	; 1. Backup the original arrays (AutoIt creates a copy)
	Local $aTest1 = $aBat1_Lines
	Local $aTest2 = $aBat2_Lines
	Local $aTest3 = $aBat3_Lines
	Local $aTest4 = $aBat4_Lines
	Local $aTest5 = $aBat5_Lines

	; 2. Clear the global arrays (set to 0/undefine so the 'Global' in the .inc works)
	$aBat1_Lines = 0
	$aBat2_Lines = 0
	$aBat3_Lines = 0
	$aBat4_Lines = 0
	$aBat5_Lines = 0


	; 3. Execute the .inc files to re-populate the arrays  // LINE 131
	ConsoleWrite("Executing " & $sInc1_Path & "..." & @CRLF)
	Execute(FileRead($sInc1_Path))
	ConsoleWrite("Executing " & $sInc2_Path & "..." & @CRLF)
	Execute(FileRead($sInc2_Path))
	ConsoleWrite("Executing " & $sInc3_Path & "..." & @CRLF)
	Execute(FileRead($sInc3_Path))
	ConsoleWrite("Executing " & $sInc4_Path & "..." & @CRLF)
	Execute(FileRead($sInc4_Path))
	ConsoleWrite("Executing " & $sInc5_Path & "..." & @CRLF)
	Execute(FileRead($sInc5_Path))
	;
	; 8. verify re-populated  arrays
	Global $dummy, $aTest1, $aBat1_Lines, $sInc1_Path, $aTest2, $aBat2_Lines, $sInc2_Path, $aTest3, $aBat3_Lines, $sInc3_Path, $aTest4, $aBat4_Lines, $sInc4_Path, $aTest5, $aBat5_Lines, $sInc5_Path
	;nu.  VerifyArrayCompare( Ori       INC           incpath  )
	;;// _VerifyArrayCompare(ByRef $aOriginal, ByRef $aRecreated, $sIncFilePath)
	;;// If _ArrayCompare($aOriginal, $aRecreated) = 0 Then
	;;//  If ArrCompIgnoreWS($aOriginal, $aRecreated) Then
	;_VerifyArrayCompare($aTest1, $aBat1_Lines, $sInc1_Path)
	;_VerifyArrayCompare($aTest2, $aBat2_Lines, $sInc2_Path)
	;_VerifyArrayCompare($aTest3, $aBat3_Lines, $sInc3_Path)
	;_VerifyArrayCompare($aTest4, $aBat4_Lines, $sInc4_Path)
	;_VerifyArrayCompare($aTest5, $aBat5_Lines, $sInc5_Path)
	;VerifyArrayCompare( Ori       INC           incpath  )
	;
	;
	ConsoleWrite("--- Verification of .inc files END ---" & @CRLF & @CRLF)
	;
	scriptAppendIncFiles()
	;copy lines from main , note
EndFunc   ;==>shellexecuteIncFilesNOTEaRecreated_dummy_fuc_Do_Nothing


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

