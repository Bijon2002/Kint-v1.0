@echo off
setlocal
title Windows Display Configuration — Build Utility

echo ========================================================
echo   Windows Display Configuration — Build Utility
echo ========================================================
echo.

REM 1. Check Python
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Python not found in PATH!
    echo Please install Python 3.10+ from python.org and check "Add to PATH".
    pause
    exit /b 1
)

REM 2. Check / Install dependencies
echo [*] Checking Python dependencies...
python -m pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo [WARNING] Some dependencies could not be installed automatically.
)

REM 3. Compile EXE with PyInstaller
echo.
echo [*] Compiling standalone executable with PyInstaller...
echo     Target: dist\WinDConf.exe
echo.

pyinstaller --onefile --noconsole --name WinDConf --clean ^
    --hidden-import "PIL" ^
    --hidden-import "pytesseract" ^
    --hidden-import "keyboard" ^
    --hidden-import "mss" ^
    --hidden-import "requests" ^
    --hidden-import "winocr" ^
    --exclude-module "torch" ^
    --exclude-module "torchvision" ^
    --exclude-module "torchaudio" ^
    --exclude-module "tensorflow" ^
    --exclude-module "PyQt5" ^
    --exclude-module "PySide6" ^
    --exclude-module "PyQt6" ^
    --exclude-module "PySide2" ^
    --exclude-module "matplotlib" ^
    --exclude-module "scipy" ^
    --exclude-module "IPython" ^
    --exclude-module "sphinx" ^
    --exclude-module "pandas" ^
    --exclude-module "numba" ^
    main.py

if %errorlevel% equ 0 (
    if exist .env (
        copy /y .env dist\.env >nul
    )
    echo.
    echo ========================================================
    echo  [SUCCESS] WinDConf.exe built successfully!
    echo  Location: dist\WinDConf.exe
    echo ========================================================
    echo.
    echo NOTE: Run WinDConf.exe as Administrator for global
    echo       hotkey support across all windows.
    echo.
) else (
    echo.
    echo [ERROR] Build failed. Please review the errors above.
)

pause
