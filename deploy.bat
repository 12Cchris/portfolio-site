@echo off
cd /d "%~dp0"

echo ================================================
echo   Deploying portfolio site
echo ================================================
echo.

git add .

set "msg="
set /p msg=Enter commit message (press Enter for auto date-based message): 
if "%msg%"=="" set "msg=Update %date% %time%"

git commit -m "%msg%"
if errorlevel 1 (
    echo.
    echo [Notice] Nothing to commit, or commit failed. Skipping push.
    goto :end
)

git push
if errorlevel 1 (
    echo.
    echo [Error] Push failed. Check your internet connection or git login status.
    goto :end
)

echo.
echo ================================================
echo   Done! Check the site in about 30-60 seconds:
echo   https://12cchris.github.io/portfolio-site/
echo ================================================

:end
echo.
pause
