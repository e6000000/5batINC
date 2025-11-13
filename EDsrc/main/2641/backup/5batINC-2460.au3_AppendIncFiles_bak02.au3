

#include-once
#include <FileConstants.au3>
#include <Array.au3>           ; Used For _ArrayDisplay, _ArrayAdd, And _ArrayCompare
#include <MsgBoxConstants.au3>
#include <File.au3>            ; IMPORTANT : Needed For _FileReadToArray And _FileWriteFromArray
; Local $GlobalsArrayINC = 'D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC\GlobalsArrayINC.au3'

; === Auto-Generated Include File (using _ArrayAdd) ===
Global $aBat1_Lines
$aBat1_Lines = ''
_ArrayAdd($aBat1_Lines, '@@ECHO OFF')
_ArrayAdd($aBat1_Lines, 'set "prj=tst29"')
_ArrayAdd($aBat1_Lines, ':: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::')
_ArrayAdd($aBat1_Lines, 'REM *** IMPORTANT: The first 3 lines (including "set prj=...") used by  external software it interacts with.')
_ArrayAdd($aBat1_Lines, 'rem !!!DO NOT CHANGE!!! ***')
_ArrayAdd($aBat1_Lines, 'REM *** only push . must exist: REPO, BARE-REPO und REMOTE  ***')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'SETLOCAL')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'rem --- Globale Konfiguration (ReadOnly) ---')
_ArrayAdd($aBat1_Lines, 'set "REPO_DIR=D:\ws\gitGit\source\workspaces\%prj%"')
_ArrayAdd($aBat1_Lines, 'set "BARE_DIR=D:\ws\gitGit\source\local-bare-repos\%prj%.git"')
_ArrayAdd($aBat1_Lines, 'set "BRANCH=main"')
_ArrayAdd($aBat1_Lines, 'set "REMOTE=origin"')
_ArrayAdd($aBat1_Lines, 'set "FOLDERS=EDsrc"')
_ArrayAdd($aBat1_Lines, 'set "KEY_PATH=%USERPROFILE%\.ssh\id_ed25519"')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'REM Die vollstaendige URL wird nur zur Anzeige benoetigt, falls die Remote-Logik wieder aktiv wird.')
_ArrayAdd($aBat1_Lines, 'set "GITHUB_USER_URL=https://github.com/e6000000"')
_ArrayAdd($aBat1_Lines, 'set "FULL_REMOTE_URL=%GITHUB_USER_URL%/%prj%"')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'rem *** ENTFERNT: mkdir %REPO_DIR% und %BARE_DIR% ***')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'REM Check if a custom commit message was passed')
_ArrayAdd($aBat1_Lines, 'if "%COMMIT_MSG%"=="" (')
_ArrayAdd($aBat1_Lines, '    set "COMMIT_MSG=Auto-Commit %DATE% %TIME% see comments in file OLDCODE: NEWCODE: "')
_ArrayAdd($aBat1_Lines, ')')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'rem -------------------------------------------------------')
_ArrayAdd($aBat1_Lines, 'rem 1) TAG GENERATION WITH PSEUDO-VERSIONING (Code Block)')
_ArrayAdd($aBat1_Lines, 'rem -------------------------------------------------------')
_ArrayAdd($aBat1_Lines, 'set "YY=%DATE:~2,2%"')
_ArrayAdd($aBat1_Lines, 'set "MON=%DATE:~5,2%"')
_ArrayAdd($aBat1_Lines, 'set "DAY=%DATE:~8,2%"')
_ArrayAdd($aBat1_Lines, 'set "H=%TIME:~0,2%"')
_ArrayAdd($aBat1_Lines, 'if "%H:~0,1%"==" " set "H=0%H:~1,1%"')
_ArrayAdd($aBat1_Lines, 'set "MIN=%TIME:~3,2%"')
_ArrayAdd($aBat1_Lines, 'set "SEC=%TIME:~6,2%"')
_ArrayAdd($aBat1_Lines, 'set /a BASEYY=24')
_ArrayAdd($aBat1_Lines, 'set /a yearssince = YY - BASEYY')
_ArrayAdd($aBat1_Lines, 'if %yearssince% Lss 0 set /a yearssince=0')
_ArrayAdd($aBat1_Lines, 'set /a SEC_DAY=24*3600')
_ArrayAdd($aBat1_Lines, 'set /a SEC_MONTH=30*SEC_DAY')
_ArrayAdd($aBat1_Lines, 'set /a SEC_YEAR=360*SEC_DAY')
_ArrayAdd($aBat1_Lines, 'set /a mon = 1%MON% - 1')
_ArrayAdd($aBat1_Lines, 'set /a day = 1%DAY% - 1')
_ArrayAdd($aBat1_Lines, 'set /a hour = 1%H% - 1')
_ArrayAdd($aBat1_Lines, 'set /a minute = 1%MIN% - 1')
_ArrayAdd($aBat1_Lines, 'set /a second = 1%SEC% - 1')
_ArrayAdd($aBat1_Lines, 'set /a total = yearssince*SEC_YEAR + mon*SEC_MONTH + day*SEC_DAY + hour*3600 + minute*60 + second')
_ArrayAdd($aBat1_Lines, 'set /a step = (total / 2) %% 1000000000')
_ArrayAdd($aBat1_Lines, 'set /a step = step -162766300')
_ArrayAdd($aBat1_Lines, 'rem add /4 because it is ok no need tooo big numbers qq66yy')
_ArrayAdd($aBat1_Lines, 'set /a step = (step / 4)')
_ArrayAdd($aBat1_Lines, 'rem add /4 because it is ok no need tooo big numbers qq66yy')
_ArrayAdd($aBat1_Lines, 'set /a step = step + 1000000')
_ArrayAdd($aBat1_Lines, 'echo ver NR.')
_ArrayAdd($aBat1_Lines, 'echo %step%')
_ArrayAdd($aBat1_Lines, 'set "num=000000000%step%"')
_ArrayAdd($aBat1_Lines, 'set "num=%num:~-9%"')
_ArrayAdd($aBat1_Lines, 'set "version=datim_%num:~0,3%.%num:~3,3%.%num:~6,3%"')
_ArrayAdd($aBat1_Lines, 'echo version: %version%')
_ArrayAdd($aBat1_Lines, 'set "TAG_NAME=%version%"')
_ArrayAdd($aBat1_Lines, 'echo Generated Tag Name: %TAG_NAME%')
_ArrayAdd($aBat1_Lines, 'set "TAG_MSG_USER=[2033]"')
_ArrayAdd($aBat1_Lines, 'echo.')
_ArrayAdd($aBat1_Lines, 'set /p TAG_MSG_USER="Enter a Tag Message (Default: Release %TAG_NAME%): "')
_ArrayAdd($aBat1_Lines, 'if "%TAG_MSG_USER%"=="" (')
_ArrayAdd($aBat1_Lines, '    set "TAG_MSG_USER=Release %TAG_NAME%"')
_ArrayAdd($aBat1_Lines, ')')
_ArrayAdd($aBat1_Lines, 'echo _ _')
_ArrayAdd($aBat1_Lines, 'echo  _ prj: %prj%    _ branch: %branch%')
_ArrayAdd($aBat1_Lines, 'echo  _ TAG_MSG_USER: %TAG_MSG_USER%   _ TAG_NAME: %TAG_NAME%')
_ArrayAdd($aBat1_Lines, 'echo _ _')
_ArrayAdd($aBat1_Lines, 'rem -------------------------------------------------------')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'rem Change to Repo directory (Muss existieren!)')
_ArrayAdd($aBat1_Lines, 'cd /d "%REPO_DIR%"')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'rem (Optional) Set Git ssH-Command')
_ArrayAdd($aBat1_Lines, 'set "GIT_ssH_COMMAND=ssh -i "%KEY_PATH%" -o IdentitiesOnly=yes"')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'rem *** ENTFERNT: BARE REPO INITIALISIERUNG ***')
_ArrayAdd($aBat1_Lines, 'rem *** ENTFERNT: REPO INITIALISIERUNG (git init) ***')
_ArrayAdd($aBat1_Lines, 'rem *** ENTFERNT: BRANCH UMBENENNUNGS-LOGIK (da ''main'' nun Standard ist) ***')
_ArrayAdd($aBat1_Lines, 'rem *** ENTFERNT: REMOTE ADD/SET URL LOGIK (da ''origin'' nun existiert) ***')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'rem Add specified folders')
_ArrayAdd($aBat1_Lines, 'for %%F in (%FOLDERS%) do (')
_ArrayAdd($aBat1_Lines, '    echo git add "%%F"')
_ArrayAdd($aBat1_Lines, '    git add "%%F"')
_ArrayAdd($aBat1_Lines, ')')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'rem *** ENTFERNT: AUFRUF DER AutoIt EXE (nur fuer Erst-Erstellung) ***')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, 'rem Check if anything is staged, and CREATE COMMIT / TAG (Part 1)')
_ArrayAdd($aBat1_Lines, 'git diff --cached --quiet')
_ArrayAdd($aBat1_Lines, 'if errorlevel 1 (')
_ArrayAdd($aBat1_Lines, '    echo Changes are staged, creating Commit...')
_ArrayAdd($aBat1_Lines, '    git commit -m "%COMMIT_MSG%"')
_ArrayAdd($aBat1_Lines, '    if errorlevel 1 (')
_ArrayAdd($aBat1_Lines, '        echo Commit failed.')
_ArrayAdd($aBat1_Lines, '        timeout /t 222')
_ArrayAdd($aBat1_Lines, '        exit /b 1')
_ArrayAdd($aBat1_Lines, '    )')
_ArrayAdd($aBat1_Lines, '    echo Commit successful.')
_ArrayAdd($aBat1_Lines, '    echo.')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, '    rem Create tag with custom message')
_ArrayAdd($aBat1_Lines, '    echo  * creating Tag %TAG_NAME% with message "%TAG_MSG_USER%"...')
_ArrayAdd($aBat1_Lines, '    git tag -a "%TAG_NAME%" -m "%TAG_MSG_USER%"')
_ArrayAdd($aBat1_Lines, '    if errorlevel 1 (')
_ArrayAdd($aBat1_Lines, '        echo Tag creation failed.')
_ArrayAdd($aBat1_Lines, '        timeout /t 222')
_ArrayAdd($aBat1_Lines, '        exit /b 1')
_ArrayAdd($aBat1_Lines, '    )')
_ArrayAdd($aBat1_Lines, '    echo Tag %TAG_NAME% successfully created.')
_ArrayAdd($aBat1_Lines, '    echo.')
_ArrayAdd($aBat1_Lines, '    ')
_ArrayAdd($aBat1_Lines, '    rem #######################################################')
_ArrayAdd($aBat1_Lines, '    rem START: BARE-REPO PUSH (Part 1: Push to local Bare Repo)')
_ArrayAdd($aBat1_Lines, '    rem #######################################################')
_ArrayAdd($aBat1_Lines, '    echo WARNING: Now pushing to local Bare Repo %BARE_DIR%.')
_ArrayAdd($aBat1_Lines, '    if /I "y"=="y" (')
_ArrayAdd($aBat1_Lines, '        echo Pushing Branch %BRANCH% to %BARE_DIR% ...')
_ArrayAdd($aBat1_Lines, '        git push "%BARE_DIR%" %BRANCH%')
_ArrayAdd($aBat1_Lines, '        if errorlevel 1 (')
_ArrayAdd($aBat1_Lines, '            echo Push of Branch to BARE_DIR failed.')
_ArrayAdd($aBat1_Lines, '            timeout /t 222')
_ArrayAdd($aBat1_Lines, '            exit /b 1')
_ArrayAdd($aBat1_Lines, '        )')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, '        rem Push Tags')
_ArrayAdd($aBat1_Lines, '        echo Pushing Tag %TAG_NAME% to %BARE_DIR%...')
_ArrayAdd($aBat1_Lines, '        git push "%BARE_DIR%" "%TAG_NAME%"')
_ArrayAdd($aBat1_Lines, '        if errorlevel 1 (')
_ArrayAdd($aBat1_Lines, '            echo Push of Tag to BARE_DIR failed.')
_ArrayAdd($aBat1_Lines, '            timeout /t 222')
_ArrayAdd($aBat1_Lines, '            exit /b 1')
_ArrayAdd($aBat1_Lines, '        )')
_ArrayAdd($aBat1_Lines, '        ')
_ArrayAdd($aBat1_Lines, '        echo  ..')
_ArrayAdd($aBat1_Lines, '        echo ########################################    ')
_ArrayAdd($aBat1_Lines, '        echo Push and Tag Push to BARE_DIR %prj% successful.')
_ArrayAdd($aBat1_Lines, '        echo  .. ')
_ArrayAdd($aBat1_Lines, '         ')
_ArrayAdd($aBat1_Lines, '    ) else (')
_ArrayAdd($aBat1_Lines, '        echo BARE Push aborted.')
_ArrayAdd($aBat1_Lines, '    )')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, '    rem #######################################################')
_ArrayAdd($aBat1_Lines, '    rem START: REMOTE PUSH (Part 2: Push to external Remote %REMOTE%)')
_ArrayAdd($aBat1_Lines, '    rem *** AUSKOMMENTIERT: HIER ENDET DER BARE-REPO-TEIL ***')
_ArrayAdd($aBat1_Lines, '    rem #######################################################')
_ArrayAdd($aBat1_Lines, '    ')
_ArrayAdd($aBat1_Lines, '    rem echo.')
_ArrayAdd($aBat1_Lines, '    rem WARNING: In the next step, a force-push to REMOTE %REMOTE% will be executed.')
_ArrayAdd($aBat1_Lines, '    rem if /I "y"=="y" (')
_ArrayAdd($aBat1_Lines, '    rem     echo Pushing Branch %BRANCH% to %REMOTE% --force ...')
_ArrayAdd($aBat1_Lines, '    rem     git push %REMOTE% %BRANCH% --force')
_ArrayAdd($aBat1_Lines, '    rem     if errorlevel 1 (')
_ArrayAdd($aBat1_Lines, '    rem         echo Push of Branch to %REMOTE% failed.')
_ArrayAdd($aBat1_Lines, '    rem         timeout /t 222')
_ArrayAdd($aBat1_Lines, '    rem         exit /b 1')
_ArrayAdd($aBat1_Lines, '    rem     )')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, '    rem     rem Push Tags')
_ArrayAdd($aBat1_Lines, '    rem     echo Pushing Tag %TAG_NAME% to %REMOTE%...')
_ArrayAdd($aBat1_Lines, '    rem     git push %REMOTE% "%TAG_NAME%"')
_ArrayAdd($aBat1_Lines, '    rem     if errorlevel 1 (')
_ArrayAdd($aBat1_Lines, '    rem         echo Push of Tag to %REMOTE% failed.')
_ArrayAdd($aBat1_Lines, '    rem         timeout /t 222')
_ArrayAdd($aBat1_Lines, '    rem         exit /b 1')
_ArrayAdd($aBat1_Lines, '    rem     )')
_ArrayAdd($aBat1_Lines, '      ')
_ArrayAdd($aBat1_Lines, '    rem     echo  ..')
_ArrayAdd($aBat1_Lines, '    rem     echo ########################################    ')
_ArrayAdd($aBat1_Lines, '    rem     echo Force-push and Tag Push %prj% to github REMOTE %REMOTE% successful.')
_ArrayAdd($aBat1_Lines, '    rem     echo  .. ')
_ArrayAdd($aBat1_Lines, '    ')
_ArrayAdd($aBat1_Lines, '    ')
_ArrayAdd($aBat1_Lines, '    rem ) else (')
_ArrayAdd($aBat1_Lines, '    rem     echo REMOTE Push aborted. No push executed.')
_ArrayAdd($aBat1_Lines, '    rem )')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, ') else (')
_ArrayAdd($aBat1_Lines, '    echo No changes to commit.')
_ArrayAdd($aBat1_Lines, ')')
_ArrayAdd($aBat1_Lines, '')
_ArrayAdd($aBat1_Lines, ':ENDE')
_ArrayAdd($aBat1_Lines, 'timeout /t 222')
_ArrayAdd($aBat1_Lines, 'ENDLOCAL')
_ArrayAdd($aBat1_Lines, 'exit /b 0')

; === End of Auto-Generated Include File (using _ArrayAdd) ===
; === Auto-Generated Include File (using _ArrayAdd) ===
Global $aBat2_Lines
$aBat2_Lines = ''
_ArrayAdd($aBat2_Lines, '@@ECHO OFF')
_ArrayAdd($aBat2_Lines, 'set "prj=tst29"')
_ArrayAdd($aBat2_Lines, ':: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::')
_ArrayAdd($aBat2_Lines, 'REM *** IMPORTANT: The first 3 lines (including "set prj=...") used by  external software it interacts with.')
_ArrayAdd($aBat2_Lines, 'rem !!!DO NOT CHANGE!!! ***')
_ArrayAdd($aBat2_Lines, 'REM *** only push . must exist: REPO, BARE-REPO und REMOTE  ***')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'SETLOCAL')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'rem --- Globale Konfiguration (ReadOnly) ---')
_ArrayAdd($aBat2_Lines, 'set "REPO_DIR=D:\ws\gitGit\source\workspaces\%prj%"')
_ArrayAdd($aBat2_Lines, 'set "BARE_DIR=D:\ws\gitGit\source\local-bare-repos\%prj%.git"')
_ArrayAdd($aBat2_Lines, 'set "BRANCH=main"')
_ArrayAdd($aBat2_Lines, 'set "REMOTE=origin"')
_ArrayAdd($aBat2_Lines, 'set "FOLDERS=EDsrc"')
_ArrayAdd($aBat2_Lines, 'set "KEY_PATH=%USERPROFILE%\.ssh\id_ed25519"')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'REM Die vollstaendige URL wird nur zur Anzeige benoetigt, falls die Remote-Logik wieder aktiv wird.')
_ArrayAdd($aBat2_Lines, 'set "GITHUB_USER_URL=https://github.com/e6000000"')
_ArrayAdd($aBat2_Lines, 'set "FULL_REMOTE_URL=%GITHUB_USER_URL%/%prj%"')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'rem *** ENTFERNT: mkdir %REPO_DIR% und %BARE_DIR% ***')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'REM Check if a custom commit message was passed')
_ArrayAdd($aBat2_Lines, 'if "%COMMIT_MSG%"=="" (')
_ArrayAdd($aBat2_Lines, '    set "COMMIT_MSG=Auto-Commit %DATE% %TIME% see comments in file OLDCODE: NEWCODE: "')
_ArrayAdd($aBat2_Lines, ')')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'rem -------------------------------------------------------')
_ArrayAdd($aBat2_Lines, 'rem 1) TAG GENERATION WITH PSEUDO-VERSIONING (Code Block)')
_ArrayAdd($aBat2_Lines, 'rem -------------------------------------------------------')
_ArrayAdd($aBat2_Lines, 'set "YY=%DATE:~2,2%"')
_ArrayAdd($aBat2_Lines, 'set "MON=%DATE:~5,2%"')
_ArrayAdd($aBat2_Lines, 'set "DAY=%DATE:~8,2%"')
_ArrayAdd($aBat2_Lines, 'set "H=%TIME:~0,2%"')
_ArrayAdd($aBat2_Lines, 'if "%H:~0,1%"==" " set "H=0%H:~1,1%"')
_ArrayAdd($aBat2_Lines, 'set "MIN=%TIME:~3,2%"')
_ArrayAdd($aBat2_Lines, 'set "SEC=%TIME:~6,2%"')
_ArrayAdd($aBat2_Lines, 'set /a BASEYY=24')
_ArrayAdd($aBat2_Lines, 'set /a yearssince = YY - BASEYY')
_ArrayAdd($aBat2_Lines, 'if %yearssince% Lss 0 set /a yearssince=0')
_ArrayAdd($aBat2_Lines, 'set /a SEC_DAY=24*3600')
_ArrayAdd($aBat2_Lines, 'set /a SEC_MONTH=30*SEC_DAY')
_ArrayAdd($aBat2_Lines, 'set /a SEC_YEAR=360*SEC_DAY')
_ArrayAdd($aBat2_Lines, 'set /a mon = 1%MON% - 1')
_ArrayAdd($aBat2_Lines, 'set /a day = 1%DAY% - 1')
_ArrayAdd($aBat2_Lines, 'set /a hour = 1%H% - 1')
_ArrayAdd($aBat2_Lines, 'set /a minute = 1%MIN% - 1')
_ArrayAdd($aBat2_Lines, 'set /a second = 1%SEC% - 1')
_ArrayAdd($aBat2_Lines, 'set /a total = yearssince*SEC_YEAR + mon*SEC_MONTH + day*SEC_DAY + hour*3600 + minute*60 + second')
_ArrayAdd($aBat2_Lines, 'set /a step = (total / 2) %% 1000000000')
_ArrayAdd($aBat1_Lines, 'set /a step = step -162766300')
_ArrayAdd($aBat1_Lines, 'rem add /4 because it is ok no need tooo big numbers qq66yy')
_ArrayAdd($aBat1_Lines, 'set /a step = (step / 4)')
_ArrayAdd($aBat1_Lines, 'rem add /4 because it is ok no need tooo big numbers qq66yy')
_ArrayAdd($aBat2_Lines, 'set /a step = step + 1000000')
_ArrayAdd($aBat2_Lines, 'echo ver NR.')
_ArrayAdd($aBat2_Lines, 'echo %step%')
_ArrayAdd($aBat2_Lines, 'set "num=000000000%step%"')
_ArrayAdd($aBat2_Lines, 'set "num=%num:~-9%"')
_ArrayAdd($aBat2_Lines, 'set "version=datim_%num:~0,3%.%num:~3,3%.%num:~6,3%"')
_ArrayAdd($aBat2_Lines, 'echo version: %version%')
_ArrayAdd($aBat2_Lines, 'set "TAG_NAME=%version%"')
_ArrayAdd($aBat2_Lines, 'echo Generated Tag Name: %TAG_NAME%')
_ArrayAdd($aBat2_Lines, 'set "TAG_MSG_USER=[2033]"')
_ArrayAdd($aBat2_Lines, 'echo.')
_ArrayAdd($aBat2_Lines, 'set /p TAG_MSG_USER="Enter a Tag Message (Default: Release %TAG_NAME%): "')
_ArrayAdd($aBat2_Lines, 'if "%TAG_MSG_USER%"=="" (')
_ArrayAdd($aBat2_Lines, '    set "TAG_MSG_USER=Release %TAG_NAME%"')
_ArrayAdd($aBat2_Lines, ')')
_ArrayAdd($aBat2_Lines, 'echo _ _')
_ArrayAdd($aBat2_Lines, 'echo  _ prj: %prj%    _ branch: %branch%')
_ArrayAdd($aBat2_Lines, 'echo  _ TAG_MSG_USER: %TAG_MSG_USER%   _ TAG_NAME: %TAG_NAME%')
_ArrayAdd($aBat2_Lines, 'echo _ _')
_ArrayAdd($aBat2_Lines, 'rem -------------------------------------------------------')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'rem Change to Repo directory (Muss existieren!)')
_ArrayAdd($aBat2_Lines, 'cd /d "%REPO_DIR%"')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'rem (Optional) Set Git ssH-Command')
_ArrayAdd($aBat2_Lines, 'set "GIT_ssH_COMMAND=ssh -i "%KEY_PATH%" -o IdentitiesOnly=yes"')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'rem *** ENTFERNT: BARE REPO INITIALISIERUNG ***')
_ArrayAdd($aBat2_Lines, 'rem *** ENTFERNT: REPO INITIALISIERUNG (git init) ***')
_ArrayAdd($aBat2_Lines, 'rem *** ENTFERNT: BRANCH UMBENENNUNGS-LOGIK (da ''main'' nun Standard ist) ***')
_ArrayAdd($aBat2_Lines, 'rem *** ENTFERNT: REMOTE ADD/SET URL LOGIK (da ''origin'' nun existiert) ***')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'rem Add specified folders')
_ArrayAdd($aBat2_Lines, 'for %%F in (%FOLDERS%) do (')
_ArrayAdd($aBat2_Lines, '    echo git add "%%F"')
_ArrayAdd($aBat2_Lines, '    git add "%%F"')
_ArrayAdd($aBat2_Lines, ')')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'rem *** ENTFERNT: AUFRUF DER AutoIt EXE (nur fuer Erst-Erstellung) ***')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, 'rem Check if anything is staged, and CREATE COMMIT / TAG (Part 1)')
_ArrayAdd($aBat2_Lines, 'git diff --cached --quiet')
_ArrayAdd($aBat2_Lines, 'if errorlevel 1 (')
_ArrayAdd($aBat2_Lines, '    echo Changes are staged, creating Commit...')
_ArrayAdd($aBat2_Lines, '    git commit -m "%COMMIT_MSG%"')
_ArrayAdd($aBat2_Lines, '    if errorlevel 1 (')
_ArrayAdd($aBat2_Lines, '        echo Commit failed.')
_ArrayAdd($aBat2_Lines, '        timeout /t 222')
_ArrayAdd($aBat2_Lines, '        exit /b 1')
_ArrayAdd($aBat2_Lines, '    )')
_ArrayAdd($aBat2_Lines, '    echo Commit successful.')
_ArrayAdd($aBat2_Lines, '    echo.')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, '    rem Create tag with custom message')
_ArrayAdd($aBat2_Lines, '    echo  * creating Tag %TAG_NAME% with message "%TAG_MSG_USER%"...')
_ArrayAdd($aBat2_Lines, '    git tag -a "%TAG_NAME%" -m "%TAG_MSG_USER%"')
_ArrayAdd($aBat2_Lines, '    if errorlevel 1 (')
_ArrayAdd($aBat2_Lines, '        echo Tag creation failed.')
_ArrayAdd($aBat2_Lines, '        timeout /t 222')
_ArrayAdd($aBat2_Lines, '        exit /b 1')
_ArrayAdd($aBat2_Lines, '    )')
_ArrayAdd($aBat2_Lines, '    echo Tag %TAG_NAME% successfully created.')
_ArrayAdd($aBat2_Lines, '    echo.')
_ArrayAdd($aBat2_Lines, '    ')
_ArrayAdd($aBat2_Lines, '    rem #######################################################')
_ArrayAdd($aBat2_Lines, '    rem START: BARE-REPO PUSH (Part 1: Push to local Bare Repo)')
_ArrayAdd($aBat2_Lines, '    rem *** AUSKOMMENTIERT: HIER BEGINNT DER BARE-REPO-TEIL ***')
_ArrayAdd($aBat2_Lines, '    rem #######################################################')
_ArrayAdd($aBat2_Lines, '    ')
_ArrayAdd($aBat2_Lines, '    rem echo WARNING: Now pushing to local Bare Repo %BARE_DIR%.')
_ArrayAdd($aBat2_Lines, '    rem if /I "y"=="y" (')
_ArrayAdd($aBat2_Lines, '    rem     echo Pushing Branch %BRANCH% to %BARE_DIR% ...')
_ArrayAdd($aBat2_Lines, '    rem     git push "%BARE_DIR%" %BRANCH%')
_ArrayAdd($aBat2_Lines, '    rem     if errorlevel 1 (')
_ArrayAdd($aBat2_Lines, '    rem         echo Push of Branch to BARE_DIR failed.')
_ArrayAdd($aBat2_Lines, '    rem         timeout /t 222')
_ArrayAdd($aBat2_Lines, '    rem         exit /b 1')
_ArrayAdd($aBat2_Lines, '    rem     )')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, '    rem     rem Push Tags')
_ArrayAdd($aBat2_Lines, '    rem     echo Pushing Tag %TAG_NAME% to %BARE_DIR%...')
_ArrayAdd($aBat2_Lines, '    rem     git push "%BARE_DIR%" "%TAG_NAME%"')
_ArrayAdd($aBat2_Lines, '    rem     if errorlevel 1 (')
_ArrayAdd($aBat2_Lines, '    rem         echo Push of Tag to BARE_DIR failed.')
_ArrayAdd($aBat2_Lines, '    rem         timeout /t 222')
_ArrayAdd($aBat2_Lines, '    rem         exit /b 1')
_ArrayAdd($aBat2_Lines, '    rem     )')
_ArrayAdd($aBat2_Lines, '        ')
_ArrayAdd($aBat2_Lines, '    rem     echo  ..')
_ArrayAdd($aBat2_Lines, '    rem     echo ########################################    ')
_ArrayAdd($aBat2_Lines, '    rem     echo Push and Tag Push to BARE_DIR %prj% successful.')
_ArrayAdd($aBat2_Lines, '    rem     echo  .. ')
_ArrayAdd($aBat2_Lines, '         ')
_ArrayAdd($aBat2_Lines, '    rem ) else (')
_ArrayAdd($aBat2_Lines, '    rem     echo BARE Push aborted.')
_ArrayAdd($aBat2_Lines, '    rem )')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, '    rem #######################################################')
_ArrayAdd($aBat2_Lines, '    rem START: REMOTE PUSH (Part 2: Push to external Remote %REMOTE%)')
_ArrayAdd($aBat2_Lines, '    rem #######################################################')
_ArrayAdd($aBat2_Lines, '    echo.')
_ArrayAdd($aBat2_Lines, '    echo WARNING: In the next step, a force-push to REMOTE %REMOTE% will be executed.')
_ArrayAdd($aBat2_Lines, '    if /I "y"=="y" (')
_ArrayAdd($aBat2_Lines, '        echo Pushing Branch %BRANCH% to %REMOTE% --force ...')
_ArrayAdd($aBat2_Lines, '        git push %REMOTE% %BRANCH% --force')
_ArrayAdd($aBat2_Lines, '        if errorlevel 1 (')
_ArrayAdd($aBat2_Lines, '            echo Push of Branch to %REMOTE% failed.')
_ArrayAdd($aBat2_Lines, '            timeout /t 222')
_ArrayAdd($aBat2_Lines, '            exit /b 1')
_ArrayAdd($aBat2_Lines, '        )')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, '        rem Push Tags')
_ArrayAdd($aBat2_Lines, '        echo Pushing Tag %TAG_NAME% to %REMOTE%...')
_ArrayAdd($aBat2_Lines, '        git push %REMOTE% "%TAG_NAME%"')
_ArrayAdd($aBat2_Lines, '        if errorlevel 1 (')
_ArrayAdd($aBat2_Lines, '            echo Push of Tag to %REMOTE% failed.')
_ArrayAdd($aBat2_Lines, '            timeout /t 222')
_ArrayAdd($aBat2_Lines, '            exit /b 1')
_ArrayAdd($aBat2_Lines, '        )')
_ArrayAdd($aBat2_Lines, '      ')
_ArrayAdd($aBat2_Lines, '        echo  ..')
_ArrayAdd($aBat2_Lines, '        echo ########################################    ')
_ArrayAdd($aBat2_Lines, '        echo Force-push and Tag Push %prj% to github REMOTE %REMOTE% successful.')
_ArrayAdd($aBat2_Lines, '        echo  .. ')
_ArrayAdd($aBat2_Lines, '    ')
_ArrayAdd($aBat2_Lines, '    ')
_ArrayAdd($aBat2_Lines, '    ) else (')
_ArrayAdd($aBat2_Lines, '        echo REMOTE Push aborted. No push executed.')
_ArrayAdd($aBat2_Lines, '    )')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, ') else (')
_ArrayAdd($aBat2_Lines, '    echo No changes to commit.')
_ArrayAdd($aBat2_Lines, ')')
_ArrayAdd($aBat2_Lines, '')
_ArrayAdd($aBat2_Lines, ':ENDE')
_ArrayAdd($aBat2_Lines, 'timeout /t 222')
_ArrayAdd($aBat2_Lines, 'ENDLOCAL')
_ArrayAdd($aBat2_Lines, 'exit /b 0')

; === End of Auto-Generated Include File (using _ArrayAdd) ===
; === Auto-Generated Include File (using _ArrayAdd) ===
Global $aBat3_Lines
$aBat3_Lines = ''
_ArrayAdd($aBat3_Lines, '@@ECHO OFF')
_ArrayAdd($aBat3_Lines, 'set "prj=tst29"')
_ArrayAdd($aBat3_Lines, ':: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::')
_ArrayAdd($aBat3_Lines, 'REM *** IMPORTANT: The first 3 lines (including "set prj=...") used by  external software it interacts with.')
_ArrayAdd($aBat3_Lines, 'rem !!!DO NOT CHANGE!!! ***')
_ArrayAdd($aBat3_Lines, 'REM *** WICHTIG: Ueberschreibt den Workspace komplett mit der NEUESTEN BARE-REPO Version! ***')
_ArrayAdd($aBat3_Lines, 'REM *** Es setzt voraus, dass REPO und BARE-REPO existieren. ***')
_ArrayAdd($aBat3_Lines, '')
_ArrayAdd($aBat3_Lines, 'SETLOCAL')
_ArrayAdd($aBat3_Lines, '')
_ArrayAdd($aBat3_Lines, 'rem --- Globale Konfiguration (ReadOnly) ---')
_ArrayAdd($aBat3_Lines, 'set "REPO_DIR=D:\ws\gitGit\source\workspaces\%prj%"')
_ArrayAdd($aBat3_Lines, 'set "BARE_DIR=D:\ws\gitGit\source\local-bare-repos\%prj%.git"')
_ArrayAdd($aBat3_Lines, 'set "BRANCH=main"')
_ArrayAdd($aBat3_Lines, 'set "KEY_PATH=%USERPROFILE%\.ssh\id_ed25519"')
_ArrayAdd($aBat3_Lines, '')
_ArrayAdd($aBat3_Lines, 'rem Change to Repo directory (Muss existieren!)')
_ArrayAdd($aBat3_Lines, 'if not exist "%REPO_DIR%\" (')
_ArrayAdd($aBat3_Lines, '  echo Fehler: Repository directory "%REPO_DIR%" not found.')
_ArrayAdd($aBat3_Lines, '  timeout /t 222')
_ArrayAdd($aBat3_Lines, '  exit /b 1')
_ArrayAdd($aBat3_Lines, ')')
_ArrayAdd($aBat3_Lines, 'cd /d "%REPO_DIR%"')
_ArrayAdd($aBat3_Lines, '')
_ArrayAdd($aBat3_Lines, 'rem (Optional) Set Git SSH-Command')
_ArrayAdd($aBat3_Lines, 'set "GIT_SSH_COMMAND=ssh -i "%KEY_PATH%" -o IdentitiesOnly=yes"')
_ArrayAdd($aBat3_Lines, '')
_ArrayAdd($aBat3_Lines, 'echo  - -')
_ArrayAdd($aBat3_Lines, 'echo #######################################################')
_ArrayAdd($aBat3_Lines, 'echo START: BARE-REPO HARD PULL (Workspace Ueberschreiben - LATEST)')
_ArrayAdd($aBat3_Lines, 'echo #######################################################')
_ArrayAdd($aBat3_Lines, 'echo 1. Fetching latest changes from local BARE-REPO %BARE_DIR%...')
_ArrayAdd($aBat3_Lines, '')
_ArrayAdd($aBat3_Lines, 'rem *** 1. FETCH vom lokalen Bare-Repo (holt nur die Commits) ***')
_ArrayAdd($aBat3_Lines, 'git fetch "%BARE_DIR%" %BRANCH%')
_ArrayAdd($aBat3_Lines, 'if errorlevel 1 (')
_ArrayAdd($aBat3_Lines, '    echo Fehler beim Fetch vom BARE-REPO %BARE_DIR%.')
_ArrayAdd($aBat3_Lines, '    timeout /t 222')
_ArrayAdd($aBat3_Lines, '    exit /b 1')
_ArrayAdd($aBat3_Lines, ')')
_ArrayAdd($aBat3_Lines, 'echo Fetch vom BARE-REPO erfolgreich.')
_ArrayAdd($aBat3_Lines, '')
_ArrayAdd($aBat3_Lines, 'rem *** 2. HARD RESET auf den aktuellsten Stand des Bare-Repos (Ueberschreibt Workspace) ***')
_ArrayAdd($aBat3_Lines, 'echo 2. HARD RESET: Ueberschreibe Workspace mit der NEUESTEN Version (FETCH_HEAD)...')
_ArrayAdd($aBat3_Lines, 'rem FETCH_HEAD ist der Zeiger auf den letzten erfolgreich geholten Commit des Bare-Repos.')
_ArrayAdd($aBat3_Lines, 'git reset --hard FETCH_HEAD')
_ArrayAdd($aBat3_Lines, 'if errorlevel 1 (')
_ArrayAdd($aBat3_Lines, '    echo FATALER FEHLER: Hard Reset vom BARE-REPO fehlgeschlagen.')
_ArrayAdd($aBat3_Lines, '    timeout /t 222')
_ArrayAdd($aBat3_Lines, '    exit /b 1')
_ArrayAdd($aBat3_Lines, ')')
_ArrayAdd($aBat3_Lines, '')
_ArrayAdd($aBat3_Lines, 'echo  - -')
_ArrayAdd($aBat3_Lines, 'echo #######################################################')
_ArrayAdd($aBat3_Lines, 'echo Hard Reset (Ueberschreiben) erfolgreich.')
_ArrayAdd($aBat3_Lines, 'echo Workspace wurde mit neuestem Stand aus BARE-REPO synchronisiert.')
_ArrayAdd($aBat3_Lines, 'echo  - -')
_ArrayAdd($aBat3_Lines, ':ENDE')
_ArrayAdd($aBat3_Lines, 'timeout /t 222')
_ArrayAdd($aBat3_Lines, 'ENDLOCAL')
_ArrayAdd($aBat3_Lines, 'exit /b 0')

; === End of Auto-Generated Include File (using _ArrayAdd) ===
; === Auto-Generated Include File (using _ArrayAdd) ===
Global $aBat4_Lines
$aBat4_Lines = ''
_ArrayAdd($aBat4_Lines, '@@ECHO OFF')
_ArrayAdd($aBat4_Lines, 'set "prj=tst29"')
_ArrayAdd($aBat4_Lines, ':: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::')
_ArrayAdd($aBat4_Lines, 'REM *** IMPORTANT: The first 3 lines (including "set prj=...") used by  external software it interacts with.')
_ArrayAdd($aBat4_Lines, 'rem !!!DO NOT CHANGE!!! ***')
_ArrayAdd($aBat4_Lines, 'REM *** WICHTIG: Ueberschreibt den Workspace komplett mit der NEUESTEN GITHUB-Version! ***')
_ArrayAdd($aBat4_Lines, 'REM *** Es setzt voraus, dass REPO und REMOTE (origin) existieren. ***')
_ArrayAdd($aBat4_Lines, '')
_ArrayAdd($aBat4_Lines, 'SETLOCAL')
_ArrayAdd($aBat4_Lines, '')
_ArrayAdd($aBat4_Lines, 'rem --- Globale Konfiguration (ReadOnly) ---')
_ArrayAdd($aBat4_Lines, 'set "REPO_DIR=D:\ws\gitGit\source\workspaces\%prj%"')
_ArrayAdd($aBat4_Lines, 'set "BRANCH=main"')
_ArrayAdd($aBat4_Lines, 'set "REMOTE=origin"')
_ArrayAdd($aBat4_Lines, 'set "KEY_PATH=%USERPROFILE%\.ssh\id_ed25519"')
_ArrayAdd($aBat4_Lines, '')
_ArrayAdd($aBat4_Lines, 'rem Change to Repo directory (Muss existieren!)')
_ArrayAdd($aBat4_Lines, 'if not exist "%REPO_DIR%\" (')
_ArrayAdd($aBat4_Lines, '  echo Fehler: Repository directory "%REPO_DIR%" not found.')
_ArrayAdd($aBat4_Lines, '  timeout /t 222')
_ArrayAdd($aBat4_Lines, '  exit /b 1')
_ArrayAdd($aBat4_Lines, ')')
_ArrayAdd($aBat4_Lines, 'cd /d "%REPO_DIR%"')
_ArrayAdd($aBat4_Lines, '')
_ArrayAdd($aBat4_Lines, 'rem (Optional) Set Git SSH-Command')
_ArrayAdd($aBat4_Lines, 'set "GIT_SSH_COMMAND=ssh -i "%KEY_PATH%" -o IdentitiesOnly=yes"')
_ArrayAdd($aBat4_Lines, '')
_ArrayAdd($aBat4_Lines, 'echo  - -')
_ArrayAdd($aBat4_Lines, 'echo #######################################################')
_ArrayAdd($aBat4_Lines, 'echo START: GITHUB HARD PULL (Workspace Ueberschreiben - LATEST)')
_ArrayAdd($aBat4_Lines, 'echo #######################################################')
_ArrayAdd($aBat4_Lines, 'echo 1. Fetching latest changes from GITHUB REMOTE %REMOTE%...')
_ArrayAdd($aBat4_Lines, '')
_ArrayAdd($aBat4_Lines, 'rem *** 1. FETCH vom externen Remote (holt nur die Commits) ***')
_ArrayAdd($aBat4_Lines, 'git fetch %REMOTE% %BRANCH%')
_ArrayAdd($aBat4_Lines, 'if errorlevel 1 (')
_ArrayAdd($aBat4_Lines, '    echo Fehler beim Fetch vom REMOTE %REMOTE%.')
_ArrayAdd($aBat4_Lines, '    timeout /t 222')
_ArrayAdd($aBat4_Lines, '    exit /b 1')
_ArrayAdd($aBat4_Lines, ')')
_ArrayAdd($aBat4_Lines, 'echo Fetch vom REMOTE %REMOTE% erfolgreich.')
_ArrayAdd($aBat4_Lines, '')
_ArrayAdd($aBat4_Lines, 'rem *** 2. HARD RESET auf den aktuellsten Stand von origin/main (Ueberschreibt Workspace) ***')
_ArrayAdd($aBat4_Lines, 'echo 2. HARD RESET: Ueberschreibe Workspace mit der NEUESTEN Version (%REMOTE%/%BRANCH%)...')
_ArrayAdd($aBat4_Lines, 'rem Setzt den lokalen Branch auf den Stand des Remote-Tracking-Branches zurueck und verwirft alle Aenderungen.')
_ArrayAdd($aBat4_Lines, 'git reset --hard %REMOTE%/%BRANCH%')
_ArrayAdd($aBat4_Lines, 'if errorlevel 1 (')
_ArrayAdd($aBat4_Lines, '    echo FATALER FEHLER: Hard Reset vom REMOTE fehlgeschlagen.')
_ArrayAdd($aBat4_Lines, '    timeout /t 222')
_ArrayAdd($aBat4_Lines, '    exit /b 1')
_ArrayAdd($aBat4_Lines, ')')
_ArrayAdd($aBat4_Lines, '')
_ArrayAdd($aBat4_Lines, 'echo  - -')
_ArrayAdd($aBat4_Lines, 'echo #######################################################')
_ArrayAdd($aBat4_Lines, 'echo Hard Reset (Ueberschreiben) erfolgreich.')
_ArrayAdd($aBat4_Lines, 'echo Workspace wurde mit neuestem Stand von GITHUB synchronisiert.')
_ArrayAdd($aBat4_Lines, 'echo  - -')
_ArrayAdd($aBat4_Lines, ':ENDE')
_ArrayAdd($aBat4_Lines, 'timeout /t 222')
_ArrayAdd($aBat4_Lines, 'ENDLOCAL')
_ArrayAdd($aBat4_Lines, 'exit /b 0')

; === End of Auto-Generated Include File (using _ArrayAdd) ===
; === Auto-Generated Include File (using _ArrayAdd) ===
Global $aBat5_Lines
$aBat5_Lines = ''
_ArrayAdd($aBat5_Lines, '@@ECHO OFF')
_ArrayAdd($aBat5_Lines, 'set "prj=tst29"')
_ArrayAdd($aBat5_Lines, ':: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::')
_ArrayAdd($aBat5_Lines, 'REM *** IMPORTANT: The first 3 lines (including "set prj=...") used by  external software it interacts with.')
_ArrayAdd($aBat5_Lines, 'rem !!!DO NOT CHANGE!!! ***')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'SETLOCAL')
_ArrayAdd($aBat5_Lines, 'rem --- Global Configuration (set once) ---')
_ArrayAdd($aBat5_Lines, 'set "REPO_DIR=D:\ws\gitGit\source\workspaces\%prj%"')
_ArrayAdd($aBat5_Lines, 'set "BARE_DIR=D:\ws\gitGit\source\local-bare-repos\%prj%.git"')
_ArrayAdd($aBat5_Lines, 'set "BRANCH=main"')
_ArrayAdd($aBat5_Lines, 'set "REMOTE=origin"')
_ArrayAdd($aBat5_Lines, 'set "FOLDERS=EDsrc"')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem *** FIX #1: GITHUBURL wird als Basis-URL OHNE %prj% definiert, fuer die saubere Remote-Logik ***')
_ArrayAdd($aBat5_Lines, 'set "GITHUB_USER_URL=https://github.com/e6000000"')
_ArrayAdd($aBat5_Lines, 'set "FULL_REMOTE_URL=%GITHUB_USER_URL%/%prj%"')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'set "KEY_PATH=%USERPROFILE%\.ssh\id_ed25519" ')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem bevore gitpush copy gitPublic to 55My')
_ArrayAdd($aBat5_Lines, 'rem after gitFetch copy gitPriv to 55My')
_ArrayAdd($aBat5_Lines, 'mkdir  %REPO_DIR%\EDsrc\main\55My   2>nul ')
_ArrayAdd($aBat5_Lines, 'mkdir  %REPO_DIR%\EDsrc\gitPriv  2>nul ')
_ArrayAdd($aBat5_Lines, 'mkdir  %REPO_DIR%\EDsrc\gitPublic   2>nul ')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'mkdir  %BARE_DIR%       2>nul ')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'REM Check if a custom commit message was passed')
_ArrayAdd($aBat5_Lines, 'if "%COMMIT_MSG%"=="" (')
_ArrayAdd($aBat5_Lines, '    set "COMMIT_MSG=Auto-Commit %DATE% %TIME% see comments in file OLDCODE: NEWCODE: "')
_ArrayAdd($aBat5_Lines, ')')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem -------------------------------------------------------')
_ArrayAdd($aBat5_Lines, 'rem 1) TAG GENERATION WITH PSEUDO-VERSIONING (datim_YYMM.DDHH.MMSS)')
_ArrayAdd($aBat5_Lines, 'rem -------------------------------------------------------')
_ArrayAdd($aBat5_Lines, 'set "YY=%DATE:~2,2%"')
_ArrayAdd($aBat5_Lines, 'set "MON=%DATE:~5,2%"')
_ArrayAdd($aBat5_Lines, 'set "DAY=%DATE:~8,2%"')
_ArrayAdd($aBat5_Lines, 'set "H=%TIME:~0,2%"')
_ArrayAdd($aBat5_Lines, 'if "%H:~0,1%"==" " set "H=0%H:~1,1%"')
_ArrayAdd($aBat5_Lines, 'set "MIN=%TIME:~3,2%"')
_ArrayAdd($aBat5_Lines, 'set "SEC=%TIME:~6,2%"')
_ArrayAdd($aBat5_Lines, 'set /a BASEYY=24')
_ArrayAdd($aBat5_Lines, 'set /a yearsSince = YY - BASEYY')
_ArrayAdd($aBat5_Lines, 'if %yearsSince% LSS 0 set /a yearsSince=0')
_ArrayAdd($aBat5_Lines, 'set /a SEC_DAY=24*3600')
_ArrayAdd($aBat5_Lines, 'set /a SEC_MONTH=30*SEC_DAY')
_ArrayAdd($aBat5_Lines, 'set /a SEC_YEAR=360*SEC_DAY')
_ArrayAdd($aBat5_Lines, 'set /a mon = 1%MON% - 1')
_ArrayAdd($aBat5_Lines, 'set /a day = 1%DAY% - 1')
_ArrayAdd($aBat5_Lines, 'set /a hour = 1%H% - 1')
_ArrayAdd($aBat5_Lines, 'set /a minute = 1%MIN% - 1')
_ArrayAdd($aBat5_Lines, 'set /a second = 1%SEC% - 1')
_ArrayAdd($aBat5_Lines, 'set /a total = yearsSince*SEC_YEAR + mon*SEC_MONTH + day*SEC_DAY + hour*3600 + minute*60 + second')
_ArrayAdd($aBat5_Lines, 'set /a step = (total / 2) %% 1000000000')
_ArrayAdd($aBat1_Lines, 'set /a step = step -162766300')
_ArrayAdd($aBat1_Lines, 'rem add /4 because it is ok no need tooo big numbers qq66yy')
_ArrayAdd($aBat1_Lines, 'set /a step = (step / 4)')
_ArrayAdd($aBat1_Lines, 'rem add /4 because it is ok no need tooo big numbers qq66yy')
_ArrayAdd($aBat5_Lines, 'set /a step = step + 1000000')
_ArrayAdd($aBat5_Lines, 'echo ver NR.')
_ArrayAdd($aBat5_Lines, 'echo %step%')
_ArrayAdd($aBat5_Lines, 'set "num=000000000%step%"')
_ArrayAdd($aBat5_Lines, 'set "num=%num:~-9%"')
_ArrayAdd($aBat5_Lines, 'set "version=datim_%num:~0,3%.%num:~3,3%.%num:~6,3%"')
_ArrayAdd($aBat5_Lines, 'echo version: %version%')
_ArrayAdd($aBat5_Lines, 'set "TAG_NAME=%version%"')
_ArrayAdd($aBat5_Lines, 'echo Generated Tag Name: %TAG_NAME%')
_ArrayAdd($aBat5_Lines, 'set "TAG_MSG_USER=[2033]"')
_ArrayAdd($aBat5_Lines, 'echo.')
_ArrayAdd($aBat5_Lines, 'set /p TAG_MSG_USER="Enter a Tag Message (Default: Release %TAG_NAME%): "')
_ArrayAdd($aBat5_Lines, 'if "%TAG_MSG_USER%"=="" (')
_ArrayAdd($aBat5_Lines, '    set "TAG_MSG_USER=Release %TAG_NAME%"')
_ArrayAdd($aBat5_Lines, ')')
_ArrayAdd($aBat5_Lines, 'echo _ _')
_ArrayAdd($aBat5_Lines, 'echo  _ prj: %prj%    _ branch: %branch%')
_ArrayAdd($aBat5_Lines, 'echo  _ TAG_MSG_USER: %TAG_MSG_USER%   _ TAG_NAME: %TAG_NAME%')
_ArrayAdd($aBat5_Lines, 'echo _ _')
_ArrayAdd($aBat5_Lines, 'rem -------------------------------------------------------')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem Change to Repo directory')
_ArrayAdd($aBat5_Lines, 'if not exist "%REPO_DIR%\" (')
_ArrayAdd($aBat5_Lines, '  echo Repository directory "%REPO_DIR%" not found.')
_ArrayAdd($aBat5_Lines, '  timeout /t 222')
_ArrayAdd($aBat5_Lines, '  exit /b 1')
_ArrayAdd($aBat5_Lines, ')')
_ArrayAdd($aBat5_Lines, 'cd /d "%REPO_DIR%"')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem (Optional) Set Git SSH-Command')
_ArrayAdd($aBat5_Lines, 'set "GIT_SSH_COMMAND=ssh -i "%KEY_PATH%" -o IdentitiesOnly=yes"')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem #######################################################')
_ArrayAdd($aBat5_Lines, 'rem NEW: 3) CREATE BARE REPO IF NOT PRESENT')
_ArrayAdd($aBat5_Lines, 'rem #######################################################')
_ArrayAdd($aBat5_Lines, 'if not exist "%BARE_DIR%\" (')
_ArrayAdd($aBat5_Lines, '  echo.')
_ArrayAdd($aBat5_Lines, '  echo LOCAL BARE REPO "%BARE_DIR%" NOT FOUND.')
_ArrayAdd($aBat5_Lines, '  set "BARE_CREATE="')
_ArrayAdd($aBat5_Lines, '  if /I "y"=="y" (')
_ArrayAdd($aBat5_Lines, '    echo Creating Bare Repo in "%BARE_DIR%"...')
_ArrayAdd($aBat5_Lines, '    git init --bare "%BARE_DIR%"')
_ArrayAdd($aBat5_Lines, '    if errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '      echo Bare Repo creation failed.')
_ArrayAdd($aBat5_Lines, '      timeout /t 222')
_ArrayAdd($aBat5_Lines, '      exit /b 1')
_ArrayAdd($aBat5_Lines, '    )')
_ArrayAdd($aBat5_Lines, '    echo Bare Repo successfully created.')
_ArrayAdd($aBat5_Lines, '  ) else (')
_ArrayAdd($aBat5_Lines, '    echo Bare Repo creation skipped.')
_ArrayAdd($aBat5_Lines, '  )')
_ArrayAdd($aBat5_Lines, ')')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem #######################################################')
_ArrayAdd($aBat5_Lines, 'rem NEW: 4) INITIALIZE ws REPO IF NOT PRESENT')
_ArrayAdd($aBat5_Lines, 'rem #######################################################')
_ArrayAdd($aBat5_Lines, 'git rev-parse --git-dir >nul 2>&1')
_ArrayAdd($aBat5_Lines, 'if errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '  echo.')
_ArrayAdd($aBat5_Lines, '  echo Not a Git Repository in "%REPO_DIR%".')
_ArrayAdd($aBat5_Lines, '  if /I "y"=="y" (')
_ArrayAdd($aBat5_Lines, '    echo Initializing Repository with git init...')
_ArrayAdd($aBat5_Lines, '    ')
_ArrayAdd($aBat5_Lines, '    rem *** FIX: Stelle sicher, dass der initiale Branch ''main'' ist ***')
_ArrayAdd($aBat5_Lines, '    git config init.defaultBranch main ')
_ArrayAdd($aBat5_Lines, '    ')
_ArrayAdd($aBat5_Lines, '    git init')
_ArrayAdd($aBat5_Lines, '    if errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '      echo Initialization failed.')
_ArrayAdd($aBat5_Lines, '      timeout /t 222')
_ArrayAdd($aBat5_Lines, '      exit /b 1')
_ArrayAdd($aBat5_Lines, '    )')
_ArrayAdd($aBat5_Lines, '    echo Repository successfully initialized.')
_ArrayAdd($aBat5_Lines, '  ) else (')
_ArrayAdd($aBat5_Lines, '    echo Initialization skipped. Script will exit.')
_ArrayAdd($aBat5_Lines, '    timeout /t 222')
_ArrayAdd($aBat5_Lines, '    exit /b 1')
_ArrayAdd($aBat5_Lines, '  )')
_ArrayAdd($aBat5_Lines, ')')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem #######################################################')
_ArrayAdd($aBat5_Lines, 'rem FIX: Ensure BRANCH is set to ''main'' (Nur fuer Repos, die noch master haben)')
_ArrayAdd($aBat5_Lines, 'rem #######################################################')
_ArrayAdd($aBat5_Lines, 'git symbolic-ref --short HEAD | findstr /I /C:"master" >nul 2>&1')
_ArrayAdd($aBat5_Lines, 'if not errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '  git branch -m master main')
_ArrayAdd($aBat5_Lines, '  echo Renamed initial branch ''master'' to ''main''.')
_ArrayAdd($aBat5_Lines, ') else (')
_ArrayAdd($aBat5_Lines, '  git checkout %BRANCH% 2>nul')
_ArrayAdd($aBat5_Lines, ')')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem #######################################################')
_ArrayAdd($aBat5_Lines, 'rem FIX #2: KORREKTE REMOTE-LOGIK (Add ODER Set-URL)')
_ArrayAdd($aBat5_Lines, 'rem #######################################################')
_ArrayAdd($aBat5_Lines, 'echo Ensuring Remote ''%REMOTE%'' points to: %FULL_REMOTE_URL%')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'git remote add %REMOTE% %FULL_REMOTE_URL% 2>nul')
_ArrayAdd($aBat5_Lines, 'if errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '  rem Remote existiert bereits. Setze die URL neu (FIX fuer die unvollstaendige URL)')
_ArrayAdd($aBat5_Lines, '  git remote set-url %REMOTE% %FULL_REMOTE_URL%')
_ArrayAdd($aBat5_Lines, '  echo Remote origin URL successfully updated to: %FULL_REMOTE_URL%')
_ArrayAdd($aBat5_Lines, ') else (')
_ArrayAdd($aBat5_Lines, '  echo Remote origin successfully added.')
_ArrayAdd($aBat5_Lines, ')')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem Add specified folders')
_ArrayAdd($aBat5_Lines, 'for %%F in (%FOLDERS%) do (')
_ArrayAdd($aBat5_Lines, '  if exist "%%F" (')
_ArrayAdd($aBat5_Lines, '    echo git add "%%F"')
_ArrayAdd($aBat5_Lines, '    git add "%%F"')
_ArrayAdd($aBat5_Lines, '  ) else (')
_ArrayAdd($aBat5_Lines, '    echo Folder "%%F" does not exist - skipping.')
_ArrayAdd($aBat5_Lines, '  )')
_ArrayAdd($aBat5_Lines, ')')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem check exist und call AutoIt EXE')
_ArrayAdd($aBat5_Lines, 'ECHO Rufe 5gitwebNEWprj.exe mit dem Parameter "%prj%" auf und warte...')
_ArrayAdd($aBat5_Lines, 'START /WAIT "" "D:\ws\gitGit\5gitwebNEWprj.exe" "%prj%"')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'IF ERRORLEVEL 1 (')
_ArrayAdd($aBat5_Lines, '    ECHO Fehler: 5gitwebNEWprj.exe wurde mit einem Fehlercode beendet.')
_ArrayAdd($aBat5_Lines, '    GOTO :ENDE')
_ArrayAdd($aBat5_Lines, ') ELSE (')
_ArrayAdd($aBat5_Lines, '    ECHO 5gitwebNEWprj.exe erfolgreich beendet.')
_ArrayAdd($aBat5_Lines, ')')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, 'rem Check if anything is staged, and CREATE COMMIT / TAG (Part 1)')
_ArrayAdd($aBat5_Lines, 'git diff --cached --quiet')
_ArrayAdd($aBat5_Lines, 'if errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '  echo Changes are staged, creating Commit...')
_ArrayAdd($aBat5_Lines, '  git commit -m "%COMMIT_MSG%"')
_ArrayAdd($aBat5_Lines, '  if errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '    echo Commit failed.')
_ArrayAdd($aBat5_Lines, '    timeout /t 222')
_ArrayAdd($aBat5_Lines, '    exit /b 1')
_ArrayAdd($aBat5_Lines, '  )')
_ArrayAdd($aBat5_Lines, '  echo Commit successful.')
_ArrayAdd($aBat5_Lines, '  echo.')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, '  rem Create tag with custom message')
_ArrayAdd($aBat5_Lines, '  echo  * creating Tag %TAG_NAME% with message "%TAG_MSG_USER%"...')
_ArrayAdd($aBat5_Lines, '  git tag -a "%TAG_NAME%" -m "%TAG_MSG_USER%"')
_ArrayAdd($aBat5_Lines, '  if errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '    echo Tag creation failed.')
_ArrayAdd($aBat5_Lines, '    timeout /t 222')
_ArrayAdd($aBat5_Lines, '    exit /b 1')
_ArrayAdd($aBat5_Lines, '  )')
_ArrayAdd($aBat5_Lines, '  echo Tag %TAG_NAME% successfully created.')
_ArrayAdd($aBat5_Lines, '  echo.')
_ArrayAdd($aBat5_Lines, '  ')
_ArrayAdd($aBat5_Lines, '  rem #######################################################')
_ArrayAdd($aBat5_Lines, '  rem START: BARE-REPO PUSH (Part 1: Push to local Bare Repo)')
_ArrayAdd($aBat5_Lines, '  rem #######################################################')
_ArrayAdd($aBat5_Lines, '  echo WARNING: Now pushing to local Bare Repo %BARE_DIR%.')
_ArrayAdd($aBat5_Lines, '  if /I "y"=="y" (')
_ArrayAdd($aBat5_Lines, '    echo Pushing Branch %BRANCH% to %BARE_DIR% ...')
_ArrayAdd($aBat5_Lines, '    git push "%BARE_DIR%" %BRANCH%')
_ArrayAdd($aBat5_Lines, '    if errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '      echo Push of Branch to BARE_DIR failed.')
_ArrayAdd($aBat5_Lines, '      timeout /t 222')
_ArrayAdd($aBat5_Lines, '      exit /b 1')
_ArrayAdd($aBat5_Lines, '    )')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, '    rem Push Tags')
_ArrayAdd($aBat5_Lines, '    echo Pushing Tag %TAG_NAME% to %BARE_DIR%...')
_ArrayAdd($aBat5_Lines, '    git push "%BARE_DIR%" "%TAG_NAME%"')
_ArrayAdd($aBat5_Lines, '    if errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '      echo Push of Tag to BARE_DIR failed.')
_ArrayAdd($aBat5_Lines, '      timeout /t 222')
_ArrayAdd($aBat5_Lines, '      exit /b 1')
_ArrayAdd($aBat5_Lines, '    )')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, '    echo  ..')
_ArrayAdd($aBat5_Lines, '    echo ########################################')
_ArrayAdd($aBat5_Lines, '    echo Push and Tag Push to BARE_DIR successful.')
_ArrayAdd($aBat5_Lines, '    echo  .. ')
_ArrayAdd($aBat5_Lines, '  ) else (')
_ArrayAdd($aBat5_Lines, '    echo BARE Push aborted.')
_ArrayAdd($aBat5_Lines, '  )')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, '  rem #######################################################')
_ArrayAdd($aBat5_Lines, '  rem START: REMOTE PUSH (Part 2: Push to external Remote %REMOTE%)')
_ArrayAdd($aBat5_Lines, '  rem #######################################################')
_ArrayAdd($aBat5_Lines, '  echo.')
_ArrayAdd($aBat5_Lines, '  echo WARNING: In the next step, a force-push to REMOTE %REMOTE% will be executed.')
_ArrayAdd($aBat5_Lines, '  if /I "y"=="y" (')
_ArrayAdd($aBat5_Lines, '    echo Pushing Branch %BRANCH% to %REMOTE% --force ...')
_ArrayAdd($aBat5_Lines, '    git push %REMOTE% %BRANCH% --force')
_ArrayAdd($aBat5_Lines, '    if errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '      echo Push of Branch to %REMOTE% failed.')
_ArrayAdd($aBat5_Lines, '      timeout /t 222')
_ArrayAdd($aBat5_Lines, '      exit /b 1')
_ArrayAdd($aBat5_Lines, '    )')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, '    rem Push Tags')
_ArrayAdd($aBat5_Lines, '    echo Pushing Tag %TAG_NAME% to %REMOTE%...')
_ArrayAdd($aBat5_Lines, '    git push %REMOTE% "%TAG_NAME%"')
_ArrayAdd($aBat5_Lines, '    if errorlevel 1 (')
_ArrayAdd($aBat5_Lines, '      echo Push of Tag to %REMOTE% failed.')
_ArrayAdd($aBat5_Lines, '      timeout /t 222')
_ArrayAdd($aBat5_Lines, '      exit /b 1')
_ArrayAdd($aBat5_Lines, '    )')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, '    echo  ..')
_ArrayAdd($aBat5_Lines, '    echo ########################################')
_ArrayAdd($aBat5_Lines, '    echo Force-push and Tag Push to REMOTE %REMOTE% successful.')
_ArrayAdd($aBat5_Lines, '    echo  ..')
_ArrayAdd($aBat5_Lines, '  ) else (')
_ArrayAdd($aBat5_Lines, '    echo REMOTE Push aborted. No push executed.')
_ArrayAdd($aBat5_Lines, '  )')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, ') else (')
_ArrayAdd($aBat5_Lines, '  echo No changes to commit.')
_ArrayAdd($aBat5_Lines, ')')
_ArrayAdd($aBat5_Lines, '')
_ArrayAdd($aBat5_Lines, ':ENDE')
_ArrayAdd($aBat5_Lines, 'timeout /t 222')
_ArrayAdd($aBat5_Lines, 'ENDLOCAL')
_ArrayAdd($aBat5_Lines, 'exit /b 0')

; === End of Auto-Generated Include File (using _ArrayAdd) ===
#include-once
#include <FileConstants.au3>
#include <Array.au3> ; Used For _ArrayDisplay, _ArrayAdd, And _ArrayCompare
#include <MsgBoxConstants.au3>
#include <File.au3> ; IMPORTANT : Needed For _FileReadToArray And _FileWriteFromArray

; festlegung: 2020 kennzeichnet functionierendes file , old war 2033 aber das koennte im jahr 2033 stoerend sein, deshalb alles aendern nach und nach von 2033 auf 2020
; **** forEVER subDIR: 'EDsrc' **** option then:  'main'
;Global $prj = 'DirToAllCode1file_API'
;lastFile      DirToAllCode1file_API[2444].au3
;Global $prj = 'DirToAllCode1file_API'
;
Global $shellexNotepad = 1

Global $prj = 'tst29'
; IN **** IN new in ver 2020
; new 2020
Global $verIN = '2020'  ;in cpy  gitPUSH-2033.bat,..,barePUSH-2033.bat to  gitPUSH-2040.bat,..,barePUSH-2040.bat
Global $VER = $verIN
Global $andVER = '-' & $VER & '.bat'
; OUT **** OUT **** can samesame 2033 ;out overwrite existing
Global $verOUT = '2033'  ;OUT overwrite rewrite ;new generated inc.au3 eg. "bat2-2040.inc" ;can sameSame 2033
;
; for: 	Global $sInc2_Path ;;// = $sWorkingDirSLASH & "\bat2-" & $iver & ".inc"
Global $iver = '2020'  ;;//  load inc file array iver  inc-Version

;
;
;
; D:\ws\gitGit\s$verINource\workspaces\gitgit_auto\EDsrc\main   ;;//  bat1-2033.inc  ; bareFETCH-2033.bat
; --- Path definitions for Batch files ---
Global $sWorkingDirSLASH = "D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC\"
Global $sScriptDir = "D:\ws\gitGit\source\workspaces\gitgit_auto\EDsrc\main\2460-ok-5batINC"
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


; Erstellung der vollständigen Batch-Pfade
Global $sBat1 = $sScriptDir & '\' & $nam[1] & $andVER
Global $sBat2 = $sScriptDir & '\' & $nam[2] & $andVER
Global $sBat3 = $sScriptDir & '\' & $nam[3] & $andVER
Global $sBat4 = $sScriptDir & '\' & $nam[4] & $andVER
Global $sBat5 = $sScriptDir & '\' & $nam[5] & $andVER
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
EndIf

; verOUT  Target file
Global $sBat1_Cpy = $sWorkingDirSLASH & $nam[1] & $verOUT & ".bat"
Global $sBat2_Cpy = $sWorkingDirSLASH & $nam[2] & $verOUT & ".bat"
Global $sBat3_Cpy = $sWorkingDirSLASH & $nam[3] & $verOUT & ".bat"
Global $sBat4_Cpy = $sWorkingDirSLASH & $nam[4] & $verOUT & ".bat"
Global $sBat5_Cpy = $sWorkingDirSLASH & $nam[5] & $verOUT & ".bat"

$verOUT = $verOUT_bak
$verIN = $verIN_bak


;
; --- Declare arrays to hold the file lines ---
Global $aBat1_Lines[1], $aBat2_Lines[1], $aBat3_Lines[1], $aBat4_Lines[1], $aBat5_Lines[1]
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
	; --- 1. Read files into arrays (UDF call) ---
	If Not _FileReadToArray($sBat1_Orig, $aBat1_Lines, 0) Then _ExitOnError("Error reading: " & $sBat1_Orig)
	If Not _FileReadToArray($sBat2_Orig, $aBat2_Lines, 0) Then _ExitOnError("Error reading: " & $sBat2_Orig)
	If Not _FileReadToArray($sBat3_Orig, $aBat3_Lines, 0) Then _ExitOnError("Error reading: " & $sBat3_Orig)
	If Not _FileReadToArray($sBat4_Orig, $aBat4_Lines, 0) Then _ExitOnError("Error reading: " & $sBat4_Orig)
	If Not _FileReadToArray($sBat5_Orig, $aBat5_Lines, 0) Then _ExitOnError("Error reading: " & $sBat5_Orig)
	ConsoleWrite("All files successfully read into arrays." & @CRLF)





	; Apply PRJ modification to array $aBat1_Lines in main()
	; SETprj($prj, $aBat1_Lines)
	SETprj($prj, $aBat1_Lines)
	SETprj($prj, $aBat2_Lines)
	SETprj($prj, $aBat3_Lines)
	SETprj($prj, $aBat4_Lines)
	SETprj($prj, $aBat5_Lines)

	; --- 2. Write arrays to new .bat files (UDF call) ---
	If Not _FileWriteFromArray($sBat1_Cpy, $aBat1_Lines) Then _ExitOnError("Error writing: " & $sBat1_Cpy)
	If Not _FileWriteFromArray($sBat2_Cpy, $aBat2_Lines) Then _ExitOnError("Error writing: " & $sBat2_Cpy)
	If Not _FileWriteFromArray($sBat3_Cpy, $aBat3_Lines) Then _ExitOnError("Error writing: " & $sBat3_Cpy)
	If Not _FileWriteFromArray($sBat4_Cpy, $aBat4_Lines) Then _ExitOnError("Error writing: " & $sBat4_Cpy)
	If Not _FileWriteFromArray($sBat5_Cpy, $aBat5_Lines) Then _ExitOnError("Error writing: " & $sBat5_Cpy)
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

	$sInc1_Path = $sWorkingDirSLASH & "bat1-" & $iver & ".inc"
	$sInc2_Path = $sWorkingDirSLASH & "bat2-" & $iver & ".inc"
	$sInc3_Path = $sWorkingDirSLASH & "bat3-" & $iver & ".inc"
	$sInc4_Path = $sWorkingDirSLASH & "bat4-" & $iver & ".inc"
	$sInc5_Path = $sWorkingDirSLASH & "bat5-" & $iver & ".inc"

	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : ( was double-slash-error\\ ) $sInc3_Path = ' & $sInc3_Path & @CRLF & '>Error code: ' & @error & @CRLF)   ;### Debug Console
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : ( was double-slash-error\\ ) $sInc4_Path = ' & $sInc4_Path & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : append $iver .inc files on: 5batINC.au3_AppendIncFiles.au3  iver= ' & $iver & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	ConsoleWrite("--- Verification of .inc files END --- nu. old. main():" & @ScriptLineNumber & @CRLF & @CRLF)
	scriptAppendIncFiles()


EndFunc   ;==>Main


Func scriptAppendIncFiles()

  scriptAppendIncFilesCMD()
  return

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

	; AppendFiles(ByRef $arFil)
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

	Local $sArr1_Name = "$aBat1_Lines"
	Local $sArr2_Name = "$aBat2_Lines"
	Local $sArr3_Name = "$aBat3_Lines"
	Local $sArr4_Name = "$aBat4_Lines"
	Local $sArr5_Name = "$aBat5_Lines"

	_CreateIncludeFromArray_ArrayAdd($aBat1_Lines, $sArr1_Name, $sInc1_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat2_Lines, $sArr2_Name, $sInc2_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat3_Lines, $sArr3_Name, $sInc3_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat4_Lines, $sArr4_Name, $sInc4_Path)
	_CreateIncludeFromArray_ArrayAdd($aBat5_Lines, $sArr5_Name, $sInc5_Path)

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
; TESTAUFRUFE
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

