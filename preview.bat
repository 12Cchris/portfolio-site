@echo off
cd /d "%~dp0"

where python >nul 2>nul
if %errorlevel%==0 (
    echo Starting local server with Python at http://localhost:8000/index.html
    echo Press Ctrl+C in this window to stop the server.
    start "" http://localhost:8000/index.html
    python -m http.server 8000
    goto :eof
)

where py >nul 2>nul
if %errorlevel%==0 (
    echo Starting local server with Python at http://localhost:8000/index.html
    echo Press Ctrl+C in this window to stop the server.
    start "" http://localhost:8000/index.html
    py -m http.server 8000
    goto :eof
)

where npx >nul 2>nul
if %errorlevel%==0 (
    echo Starting local server with Node.js at http://localhost:3000
    echo Press Ctrl+C in this window to stop the server.
    start "" http://localhost:3000
    npx --yes serve -l 3000 .
    goto :eof
)

echo Could not find Python or Node.js on this computer.
echo Install one of them, then run this file again:
echo   Python:  https://www.python.org/downloads/
echo   Node.js: https://nodejs.org/
echo.
pause
