@ECHO OFF
set "prj=tst3"
:: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::
REM *** IMPORTANT: The first 3 lines (including "set prj=...") used by  external software it interacts with.
rem !!!DO NOT CHANGE!!! ***
rem 5 create-bare-gitPUSH
set "cmdnam=create-bare-gitPUSH"
set "cmdnum=5"
SETLOCAL
rem --- Global Configuration (set once) ---
set "REPO_DIR=D:\ws\gitGit\source\workspaces\%prj%"
set "BARE_DIR=D:\ws\gitGit\source\local-bare-repos\%prj%.git"
set "BRANCH=main"
set "REMOTE=origin"
set "FOLDERS=EDsrc"

rem *** FIX #1: GITHUBURL wird als Basis-URL OHNE %prj% definiert, fuer die saubere Remote-Logik ***
set "GITHUB_USER_URL=https://github.com/e6000000"
set "FULL_REMOTE_URL=%GITHUB_USER_URL%/%prj%"

set "KEY_PATH=%USERPROFILE%\.ssh\id_ed25519"

rem bevore gitpush copy gitPublic to 55My
rem after gitFetch copy gitPriv to 55My
mkdir  %REPO_DIR%\EDsrc\main\55My   2>nul
mkdir  %REPO_DIR%\EDsrc\gitPriv  2>nul
mkdir  %REPO_DIR%\EDsrc\gitPublic   2>nul 
 
mkdir  %BARE_DIR%         2>nul
git config --global init.defaultBranch main
git init --bare %BARE_DIR%
git branch -m master main    2>nul


REM Check if a custom commit message was passed
if "%COMMIT_MSG%"=="" (
    set "COMMIT_MSG=Auto-Commit %DATE% %TIME% see comments in file OLDCODE: NEWCODE: "
)

rem -------------------------------------------------------
rem 1) TAG GENERATION WITH PSEUDO-VERSIONING (datim_YYMM.DDHH.MMSS)
rem -------------------------------------------------------
set "YY=%DATE:~2,2%"
set "MON=%DATE:~5,2%"
set "DAY=%DATE:~8,2%"
set "H=%TIME:~0,2%"
if "%H:~0,1%"==" " set "H=0%H:~1,1%"
set "MIN=%TIME:~3,2%"
set "SEC=%TIME:~6,2%"
set /a BASEYY=24
set /a yearsSince = YY - BASEYY
if %yearsSince% LSS 0 set /a yearsSince=0
set /a SEC_DAY=24*3600
set /a SEC_MONTH=30*SEC_DAY
set /a SEC_YEAR=360*SEC_DAY
set /a mon = 1%MON% - 1
set /a day = 1%DAY% - 1
set /a hour = 1%H% - 1
set /a minute = 1%MIN% - 1
set /a second = 1%SEC% - 1
set /a total = yearsSince*SEC_YEAR + mon*SEC_MONTH + day*SEC_DAY + hour*3600 + minute*60 + second
set /a step = (total / 50) %% 1000000000
set /a step = step   -6521726
rem add /50 because it is ok no need tooo big numbers qq66yy
set /a step = step + 1000000
echo ver NR.  %step%
set "num=000000000%step%"
set "num=%num:~-9%"
rem "version=datim_ 890
set "version=creatbagit_%num:~0,3%.%num:~3,3%.%num:~6,3%"
echo version: %version%
set "TAG_NAME=%version%"
echo Generated Tag Name: %TAG_NAME%
set "TAG_MSG_USER=[2033]"
echo.
set /p TAG_MSG_USER="Enter a Tag Message (Default: Release %TAG_NAME%): "
if "%TAG_MSG_USER%"=="" (
    set "TAG_MSG_USER=Release %TAG_NAME%"
)
echo _ _
echo  _ prj: %prj%    _ branch: %branch%
echo  _ TAG_MSG_USER: %TAG_MSG_USER%   _ TAG_NAME: %TAG_NAME%
echo _ _
rem -------------------------------------------------------

rem Change to Repo directory
if not exist "%REPO_DIR%\" (
  echo Repository directory "%REPO_DIR%" not found.
  timeout /t 222
  exit /b 1
)
cd /d "%REPO_DIR%"

rem (Optional) Set Git SSH-Command
set "GIT_SSH_COMMAND=ssh -i "%KEY_PATH%" -o IdentitiesOnly=yes"

rem #######################################################
rem NEW: 3) CREATE BARE REPO IF NOT PRESENT
rem #######################################################
if not exist "%BARE_DIR%\" (
  echo.
  echo LOCAL BARE REPO "%BARE_DIR%" NOT FOUND.
  set "BARE_CREATE="
  if /I "y"=="y" (
    echo Creating Bare Repo in "%BARE_DIR%"...
    git init --bare "%BARE_DIR%"
    if errorlevel 1 (
      echo Bare Repo creation failed.
      timeout /t 222
      exit /b 1
    )
    echo Bare Repo successfully created.
  ) else (
    echo Bare Repo creation skipped.
  )
)

rem #######################################################
rem NEW: 4) INITIALIZE ws REPO IF NOT PRESENT
rem #######################################################
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
  echo.
  echo Not a Git Repository in "%REPO_DIR%".
  if /I "y"=="y" (
    echo Initializing Repository with git init...

    rem *** FIX: Stelle sicher, dass der initiale Branch 'main' ist ***
    git config init.defaultBranch main

    git init
    if errorlevel 1 (
      echo Initialization failed.
      timeout /t 222
      exit /b 1
    )
    echo Repository successfully initialized.
  ) else (
    echo Initialization skipped. Script will exit.
    timeout /t 222
    exit /b 1
  )
)

rem #######################################################
rem FIX: Ensure BRANCH is set to 'main' (Nur fuer Repos, die noch master haben)
rem #######################################################
git symbolic-ref --short HEAD | findstr /I /C:"master" >nul 2>&1
if not errorlevel 1 (
  git branch -m master main
  echo Renamed initial branch 'master' to 'main'.
) else (
  git checkout %BRANCH% 2>nul
)

rem #######################################################
rem FIX #2: KORREKTE REMOTE-LOGIK (Add ODER Set-URL)
rem #######################################################
echo Ensuring Remote '%REMOTE%' points to: %FULL_REMOTE_URL%

git remote add %REMOTE% %FULL_REMOTE_URL% 2>nul
if errorlevel 1 (
  rem Remote existiert bereits. Setze die URL neu (FIX fuer die unvollstaendige URL)
  git remote set-url %REMOTE% %FULL_REMOTE_URL%
  echo Remote origin URL successfully updated to: %FULL_REMOTE_URL%
) else (
  echo Remote origin successfully added.
)


rem Add specified folders
for %%F in (%FOLDERS%) do (
  if exist "%%F" (
    echo git add "%%F"
    git add "%%F"
  ) else (
    echo Folder "%%F" does not exist - skipping.
  )
)

rem check exist und call AutoIt EXE
ECHO Rufe 5gitwebNEWprj.exe mit dem Parameter "%prj%" auf und warte...
START /WAIT "" "D:\ws\gitGit\5gitwebNEWprj.exe" "%prj%"

IF ERRORLEVEL 1 (
    ECHO Fehler: 5gitwebNEWprj.exe wurde mit einem Fehlercode beendet.
    GOTO :ENDE
) ELSE (
    ECHO 5gitwebNEWprj.exe erfolgreich beendet.
)


rem Check if anything is staged, and CREATE COMMIT / TAG (Part 1)
git diff --cached --quiet
if errorlevel 1 (
  echo Changes are staged, creating Commit...
  git commit -m "%COMMIT_MSG%"
  if errorlevel 1 (
    echo Commit failed.
    timeout /t 222
    exit /b 1
  )
  echo Commit successful.
  echo.

  rem Create tag with custom message
  echo  * creating Tag %TAG_NAME% with message "%TAG_MSG_USER%"...
  git tag -a "%TAG_NAME%" -m "%TAG_MSG_USER%"
  if errorlevel 1 (
    echo Tag creation failed.
    timeout /t 222
    exit /b 1
  )
  echo Tag %TAG_NAME% successfully created.
  echo.

  rem #######################################################
  rem START: BARE-REPO PUSH (Part 1: Push to local Bare Repo)
  rem #######################################################
  echo WARNING: Now pushing to local Bare Repo %BARE_DIR%.
  if /I "y"=="y" (
    echo Pushing Branch %BRANCH% to %BARE_DIR% ...
    git push "%BARE_DIR%" %BRANCH%
    if errorlevel 1 (
      echo Push of Branch to BARE_DIR failed.
      timeout /t 222
      exit /b 1
    )

    rem Push Tags
    echo Pushing Tag %TAG_NAME% to %BARE_DIR%...
    git push "%BARE_DIR%" "%TAG_NAME%"
    if errorlevel 1 (
      echo Push of Tag to BARE_DIR failed.
      timeout /t 222
      exit /b 1
    )

    echo  ..
    echo ########################################
    echo Push and Tag Push to BARE_DIR successful.
    echo  ..
  ) else (
    echo BARE Push aborted.
  )

  rem #######################################################
  rem START: REMOTE PUSH (Part 2: Push to external Remote %REMOTE%)
  rem #######################################################
  echo.
  echo WARNING: In the next step, a force-push to REMOTE %REMOTE% will be executed.
  if /I "y"=="y" (
    echo Pushing Branch %BRANCH% to %REMOTE% --force ...
    git push %REMOTE% %BRANCH% --force
    if errorlevel 1 (
      echo Push of Branch to %REMOTE% failed.
      timeout /t 222
      exit /b 1
    )

    rem Push Tags
    echo Pushing Tag %TAG_NAME% to %REMOTE%...
    git push %REMOTE% "%TAG_NAME%"
    if errorlevel 1 (
      echo Push of Tag to %REMOTE% failed.
      timeout /t 222
      exit /b 1
    )

    echo  ..
    echo ########################################
    echo Force-push and Tag Push to REMOTE %REMOTE% successful.
    echo  ..
  ) else (
    echo REMOTE Push aborted. No push executed.
  )

) else (
  echo No changes to commit.
)

:ENDE
timeout /t 222
ENDLOCAL
exit /b 0
