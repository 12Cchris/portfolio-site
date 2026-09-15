@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ================================================
echo      Portfolio Site Deploy  (deploy.bat v2.0)
echo ================================================
echo.
echo This syncs commits made from the website ADMIN page
echo and uploads your local changes. One file does both.
echo.

git config core.autocrlf true

echo [1/4] Fetching latest from GitHub...
git fetch origin
if errorlevel 1 (
    echo.
    echo [ERROR] Could not reach GitHub.
    echo Check your internet connection and the remote setting.
    git remote -v
    goto :error
)

set "behind=0"
for /f %%i in ('git rev-list --count HEAD..origin/main') do set "behind=%%i"

echo.
echo   New commits on GitHub (ADMIN page etc.) : %behind%
echo   Local uncommitted changes:
git status --short
echo.

echo [2/4] Saving local changes...
git add .
git diff --cached --quiet
if errorlevel 1 goto :docommit

echo No local changes to save. Skipping commit.
goto :pull

:docommit
set "msg="
set /p "msg=Enter commit message (press Enter for auto date-based message): "
if "%msg%"=="" set "msg=Update %date% %time%"
echo.
git commit -m "%msg%"
if errorlevel 1 (
    echo.
    echo [ERROR] Commit failed.
    git status
    goto :error
)
echo [OK] Local changes saved.

:pull
echo.
echo [3/4] Merging GitHub commits into this folder...
git pull --rebase origin main
if errorlevel 1 goto :conflict

echo [OK] This folder is now up to date with GitHub.

echo.
echo [4/4] Pushing to GitHub...
git push origin main
if errorlevel 1 (
    echo.
    echo [ERROR] Push failed.
    git status
    goto :error
)

echo.
echo ================================================
echo               ALL DONE!
echo ================================================
echo.
git log --oneline -5
echo.
echo GitHub:
echo https://github.com/12Cchris/portfolio-site
echo.
echo Website:
echo https://12cchris.github.io/portfolio-site/
echo.
echo Changes may take about 30-60 seconds to appear.
echo ================================================
goto :end

:conflict
echo.
echo ================================================
echo               CONFLICT FOUND
echo ================================================
echo.
echo You edited the same part both here and on the ADMIN page.
echo Git cannot decide which one wins, so please choose.
echo.
echo   [1] Keep the GitHub version, throw away my local edits
echo   [2] Stop here and fix it by hand
echo.
set "pick="
set /p "pick=Select (1/2): "

if not "%pick%"=="1" goto :manual

git rebase --abort
git reset --hard origin/main
if errorlevel 1 goto :error
echo.
echo [OK] This folder now matches GitHub exactly.
goto :end

:manual
echo.
echo Open the conflicted file, keep the lines you want,
echo remove the ^<^<^<^<^<^<^< / ======= / ^>^>^>^>^>^>^> markers, then run:
echo     git add .
echo     git rebase --continue
echo     git push origin main
echo.
echo To give up instead:
echo     git rebase --abort
echo.
goto :end

:error
echo.
echo ================================================
echo                 FAILED
echo ================================================
echo.
echo Please check the error message above.
echo.

:end
echo.
pause
