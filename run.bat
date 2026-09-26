@echo off
cd /d "%~dp0"
title Windows Display Configuration
echo ========================================================
echo Starting Windows Display Configuration Service...
echo ========================================================
echo.

python main.py

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Service stopped unexpectedly.
    pause
)
