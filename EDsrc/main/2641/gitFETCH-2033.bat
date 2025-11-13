@ECHO OFF
set "prj=tst28"
:: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::
REM *** IMPORTANT: The first 3 lines (including "set prj=...") used by  external software it interacts with.
rem !!!DO NOT CHANGE!!! ***
rem 4 gitFETCH
SETLOCAL
REM *** WICHTIG: Ueberschreibt den Workspace komplett mit der NEUESTEN WEB GITHUB-Version! ***
REM *** Es setzt voraus, dass REPO und REMOTE (origin) existieren. ***
rem --- Globale Konfiguration (ReadOnly) ---
set "REPO_DIR=D:\ws\gitGit\source\workspaces\%prj%"
set "BRANCH=main"
set "REMOTE=origin"
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
echo START: GITHUB HARD PULL (Workspace Ueberschreiben - LATEST)
echo #######################################################
echo 1. Fetching latest changes from GITHUB REMOTE %REMOTE%...

rem *** 1. FETCH vom externen Remote (holt nur die Commits) ***
git fetch %REMOTE% %BRANCH%
if errorlevel 1 (
    echo Fehler beim Fetch vom REMOTE %REMOTE%.
    timeout /t 222
    exit /b 1
)
echo Fetch vom REMOTE %REMOTE% erfolgreich.

rem *** 2. HARD RESET auf den aktuellsten Stand von origin/main (Ueberschreibt Workspace) ***
echo 2. HARD RESET: Ueberschreibe Workspace mit der NEUESTEN Version (%REMOTE%/%BRANCH%)...
rem Setzt den lokalen Branch auf den Stand des Remote-Tracking-Branches zurueck und verwirft alle Aenderungen.
git reset --hard %REMOTE%/%BRANCH%
if errorlevel 1 (
    echo FATALER FEHLER: Hard Reset vom REMOTE fehlgeschlagen.
    timeout /t 222
    exit /b 1
)

echo  - -
echo #######################################################
echo Hard Reset (Ueberschreiben) erfolgreich.
echo Workspace wurde mit neuestem Stand von GITHUB synchronisiert.
echo  - -
:ENDE
timeout /t 222
ENDLOCAL
exit /b 0
