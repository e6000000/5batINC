


Func scriptAppendIncFilesCMD()
    ; =========================================================================
    ; VORBEREITUNG DER VARIABLEN
    ; (Setzt voraus, dass $sInc1_Path bis $sInc5_Path und $scriptNameAppendIncFiles global definiert sind)
    ; =========================================================================

    ; 1. filenames & ERSTELLE GLOBALS BLOCK-DATEI
    Local $G = @ScriptDir & '\GlobalsArrayINC.au3'
    Local $sGlobalContent = _
        '#include-once' & @CRLF & _
        '#include <FileConstants.au3>' & @CRLF & _
        '#include <Array.au3>' & @CRLF & _
        '#include <MsgBoxConstants.au3>' & @CRLF & _
        '#include <File.au3>' & @CRLF

    FileWrite($G, $sGlobalContent) ; Nutze die native FileWrite-Funktion
    If @error Then Return SetError(1, 0, False) ; Fehlerbehandlung

    ; 2. FÜGE DIE INCLUSION-PFADE ZU EINEM CMD-STRING ZUSAMMEN
    ; Vereinfachung: Nutze die Array-Logik oder baue den String kurz zusammen.
    Local $sAllIncPaths = '"' & $G & '" + "' & $sInc1_Path & '" + "' & $sInc2_Path & '" + "' & $sInc3_Path & '" + "' & $sInc4_Path & '" + "' & $sInc5_Path & '"'
    
    ; Name des Ziels des ersten Kopiervorgangs (Temporäre Sammeldatei)
    Local $sTempCompiledIncFile = $fromFolderAppendIncFiles & '_TempCompiledInc.au3' 

    ; =========================================================================
    ; SCHRITT 1: INC-DATEIEN ZUSAMMENFÜGEN (copy /B)
    ; Ergebnis: $sTempCompiledIncFile enthaelt alle includes
    ; =========================================================================
    Local $sCopyCmd1 = 'copy /B ' & $sAllIncPaths & ' "' & $sTempCompiledIncFile & '"'
    Local $cmdToRun = @ComSpec & ' /c ' & $sCopyCmd1
    
    ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : CMD 1: ' & $sCopyCmd1 & @CRLF)
    Local $cmdddrun = Run($cmdToRun, "", @SW_HIDE)
    If Not @error = 0 Then Return SetError(2, 0, False) ; Fehler beim Start
    ProcessWaitClose($cmdddrun)

    ; =========================================================================
    ; SCHRITT 2: TEMPORÄRE DATEI VOR ZIELDATEI SCHREIBEN (Präfix-Kopie)
    ; Ergebnis: Der Inhalt der temporären Datei wird vor die Zieldatei kopiert.
    ; =========================================================================
    
    ; Ziel-Skript, an dessen Anfang die Includes gehängt werden sollen (Hier: @ScriptFullPath)
    Local $sTargetScriptFile = @ScriptFullPath
    
    ; Sicherer Weg, einen Präfix zu erstellen:
    ; copy /B PrefiX + TargetFile NewFile (Erzeugt die finale Datei)
    Local $sFinalResultFile = $fromFolderAppendIncFiles & @ScriptName & '_FINAL_INC_MERGED.au3' ; Neuer, eindeutiger Name

    Local $sCopyCmd2 = 'copy /B "' & $sTempCompiledIncFile & '" + "' & $sTargetScriptFile & '" "' & $sFinalResultFile & '"'
    $cmdToRun = @ComSpec & ' /c ' & $sCopyCmd2
    
    ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : CMD 2: ' & $sCopyCmd2 & @CRLF)
    $cmdddrun = Run($cmdToRun, "", @SW_HIDE)
    If Not @error = 0 Then Return SetError(3, 0, False) ; Fehler beim Start
    ProcessWaitClose($cmdddrun)
    
    ; Aufräumarbeiten (Optional)
    FileDelete($G)
    FileDelete($sTempCompiledIncFile)

    ConsoleWrite("--- Append of .inc files END --- Final result in: " & $sFinalResultFile & @CRLF)
    Return True
EndFunc