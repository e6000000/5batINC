@ECHO OFF
set "prj=tst3"
:: set prj MUST in LINE 2 :: ws edit src prj-name-dir ::
REM *** IMPORTANT: The first 3 lines (including "set prj=...") used by  external software it interacts with.
REM *** LINE 2 !!!DO NOT CHANGE!!! ***
rem 11 merge-NU-bare-gitFETCH
SETLOCAL
REM *** Es setzt voraus, dass REPO, BARE-REPO und REMOTE existieren. ***
rem --- Globale Konfiguration (ReadOnly) ---
set "REPO_DIR=D:\ws\gitGit\source\workspaces\%prj%"
set "BARE_DIR=D:\ws\gitGit\source\local-bare-repos\%prj%.git"
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
echo START: BARE-REPO FETCH / PULL (Lokales Bare Repo)
echo #######################################################
echo Fetching latest changes from local BARE-REPO %BARE_DIR%...

rem *** 1. FETCH vom lokalen Bare-Repo (aktualisiert lokale Remote-Tracking-Branches) ***
git fetch "%BARE_DIR%" %BRANCH%
if errorlevel 1 (
    echo Fehler beim Fetch vom BARE-REPO %BARE_DIR%.
    timeout /t 222
    exit /b 1
)
echo Fetch vom BARE-REPO erfolgreich.

rem *** 2. PULL/MERGE vom lokalen Bare-Repo in den aktuellen Branch (optional, wenn Bare-Repo primär ist) ***
echo Pulling changes from BARE-REPO to local %BRANCH%...
git pull "%BARE_DIR%" %BRANCH%
if errorlevel 1 (
    echo Fehler beim Pull vom BARE-REPO %BARE_DIR%.
    timeout /t 222
    exit /b 1
)
echo Pull vom BARE-REPO erfolgreich.

echo  - -
echo #######################################################
echo START: GIT WEB FETCH / PULL (Externes Remote)
echo #######################################################
echo Fetching latest changes from external REMOTE %REMOTE%...

rem *** 3. FETCH vom externen Remote (GitHub) ***
git fetch %REMOTE%
if errorlevel 1 (
    echo Fehler beim Fetch vom REMOTE %REMOTE%.
    timeout /t 222
    exit /b 1
)
echo Fetch vom REMOTE %REMOTE% erfolgreich.

rem *** 4. PULL/MERGE vom externen Remote in den aktuellen Branch ***
echo Pulling changes from REMOTE %REMOTE% to local %BRANCH%...
git pull %REMOTE% %BRANCH%
if errorlevel 1 (
    echo Fehler beim Pull vom REMOTE %REMOTE%.
    timeout /t 222
    exit /b 1
)
echo Pull vom REMOTE %REMOTE% erfolgreich.

:ENDE
timeout /t 222
ENDLOCAL
exit /b 0


Das Skript **`bareFETCH-DAILY.bat`** synchronisiert Ihren Code zwischen Ihrem **lokalen Arbeitsbereich (`workspace`)**, Ihrem **lokalen Backup-Repository (`bare local`)** und Ihrem **externen Backup/Zusammenarbeits-Repository (`github web`)**.

Es holt (fetcht) die neuesten Änderungen von *beiden* Backup-Zielen und führt diese in Ihren lokalen Code zusammen (pull).

---

## 🗺️ Was das Skript genau macht

Das Skript führt vier Hauptschritte aus, die sicherstellen, dass Ihr lokaler Code alle Änderungen von beiden "Remotes" (Backup-Zielen) enthält:

| Aktion | Ziel | Git-Befehl(e) | Zweck |
| :--- | :--- | :--- | :--- |
| **Lokaler Fetch** | Lokales Bare-Repo (`%BARE_DIR%`) | `git fetch "%BARE_DIR%" %BRANCH%` | Aktualisiert die **lokalen Tracking-Branches** mit allen Änderungen, die im lokalen Bare-Repo vorhanden sind. |
| **Lokaler Pull** | Lokales Bare-Repo (`%BARE_DIR%`) | `git pull "%BARE_DIR%" %BRANCH%` | Holt die Änderungen aus dem lokalen Bare-Repo und **führt sie in Ihren aktuellen Arbeits-Branch** (`main`) zusammen. |
| **Remote Fetch** | GitHub Web Repo (`origin`) | `git fetch %REMOTE%` | Aktualisiert die **lokalen Tracking-Branches** mit allen Änderungen, die auf GitHub vorhanden sind. |
| **Remote Pull** | GitHub Web Repo (`origin`) | `git pull %REMOTE% %BRANCH%` | Holt die Änderungen von GitHub und **führt sie in Ihren aktuellen Arbeits-Branch** (`main`) zusammen. |

---

## ❓ Warum Bare UND Git Web beteiligt sind

Der Einsatz von **zwei separaten Backup-Repositories** (bare local und GitHub Web) bietet ein hohes Maß an Redundanz, Flexibilität und Kontrolle.

| Repository | Zweck und Vorteil |
| :--- | :--- |
| **1. Lokales Bare-Repo (`BARE_DIR`)** | **Lokales, schnelles Backup:** Dies dient als **sofortiges, lokales Backup** auf Ihrer Festplatte. Es ist ideal für schnelles Pushen/Fenchen, ohne auf eine Internetverbindung angewiesen zu sein. Es schützt Ihre Historie vor versehentlichem Löschen im Arbeitsbereich. |
| **2. GitHub Web Repo (`origin`)** | **Externes, kollaboratives Backup:** Dies ist der **externe, offsite-Speicherort**. Es bietet echte Datensicherheit gegen Festplattenausfälle (weil es in der Cloud liegt) und dient als zentraler Punkt für die **Zusammenarbeit** mit anderen Entwicklern. |

Ihr Skript holt nun von **beiden** Quellen ab, um sicherzustellen, dass Ihr lokaler Arbeitsbereich immer den aktuellsten Stand hat, egal ob die letzte Änderung von einem Kollegen auf GitHub oder aus einer Wiederherstellung/einem Test im lokalen Bare-Repo stammte.
