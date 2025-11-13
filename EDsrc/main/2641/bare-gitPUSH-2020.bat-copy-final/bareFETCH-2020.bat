@ECHO OFF
set "prj=tst29"
:: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::
REM *** IMPORTANT: The first 3 lines (including "set prj=...") used by  external software it interacts with.
rem !!!DO NOT CHANGE!!! ***
rem 3 bareFETCH
SETLOCAL
REM *** WICHTIG: Ueberschreibt den Workspace komplett mit der NEUESTEN BARE-REPO Version! ***
REM *** Es setzt voraus, dass REPO und BARE-REPO existieren. ***
rem --- Globale Konfiguration (ReadOnly) ---
set "REPO_DIR=D:\ws\gitGit\source\workspaces\%prj%"
set "BARE_DIR=D:\ws\gitGit\source\local-bare-repos\%prj%.git"
set "BRANCH=main"
set "KEY_PATH=%USERPROFILE%\.ssh\id_ed25519"

rem Change to Repo directory (Muss existieren!)
if not exist "%REPO_DIR%\" (
  echo Fehler: Repository directory "%REPO_DIR%" not found.
  timeout /t 222
  exit /b 1
)
cd /d "%REPO_DIR%"

rem (Optional) Set Git SSH-Command
set "GIT_SSH_COMMAND=ssh -i "%KEY_PATH%" -o IdentitiesOnly=yes"

echo  - -
echo #######################################################
echo START: BARE-REPO HARD PULL (Workspace Ueberschreiben - LATEST)
echo #######################################################
echo 1. Fetching latest changes from local BARE-REPO %BARE_DIR%...

rem *** 1. FETCH vom lokalen Bare-Repo (holt nur die Commits) ***
git fetch "%BARE_DIR%" %BRANCH%
if errorlevel 1 (
    echo Fehler beim Fetch vom BARE-REPO %BARE_DIR%.
    timeout /t 222
    exit /b 1
)
echo Fetch vom BARE-REPO erfolgreich.

rem *** 2. HARD RESET auf den aktuellsten Stand des Bare-Repos (Ueberschreibt Workspace) ***
echo 2. HARD RESET: Ueberschreibe Workspace mit der NEUESTEN Version (FETCH_HEAD)...
rem FETCH_HEAD ist der Zeiger auf den letzten erfolgreich geholten Commit des Bare-Repos.
git reset --hard FETCH_HEAD
if errorlevel 1 (
    echo FATALER FEHLER: Hard Reset vom BARE-REPO fehlgeschlagen.
    timeout /t 222
    exit /b 1
)

echo  - -
echo #######################################################
echo Hard Reset (Ueberschreiben) erfolgreich.
echo Workspace wurde mit neuestem Stand aus BARE-REPO synchronisiert.
echo  - -
:ENDE
timeout /t 222
ENDLOCAL
exit /b 0
