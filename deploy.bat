@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ================================================
echo           Portfolio Site Deploy
echo ================================================
echo.

echo [1/4] Checking Git status...
git status --short
if errorlevel 1 (
    echo.
    echo [ERROR] Git repository status check failed.
    echo Please check whether this folder is a Git repository.
    goto :error
)

echo.
echo [2/4] Staging changes...
git add .
if errorlevel 1 (
    echo.
    echo [ERROR] Failed to stage changes.
    echo Please check the Git repository.
    goto :error
)

echo.
echo [3/4] Creating commit...
set "msg="
set /p "msg=Enter commit message (press Enter for auto date-based message): "

if "%msg%"=="" set "msg=Update %date% %time%"

echo.
echo Commit message: %msg%
echo.

git commit -m "%msg%"

if errorlevel 1 (
    echo.
    echo [ERROR] Commit failed or there are no changes to commit.
    echo.
    echo Current Git status:
    git status
    goto :error
)

echo.
echo [OK] Commit created successfully.
echo.

echo [4/4] Pushing to GitHub...
echo.

git push origin main

if errorlevel 1 (
    echo.
    echo [ERROR] Push failed.
    echo.
    echo Current Git status:
    git status
    echo.
    echo Remote repository:
    git remote -v
    goto :error
)

echo.
echo ================================================
echo            DEPLOY SUCCESSFUL!
echo ================================================
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

:error
echo.
echo ================================================
echo              DEPLOY FAILED
echo ================================================
echo.
echo Please check the error message above.
echo.

:end
echo.
pause