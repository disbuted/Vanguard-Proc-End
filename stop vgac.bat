@echo off
echo Stopping Vanguard Anti-Cheat + vgtray.exe...

REM Stop the (vgk) service
sc stop vgk >nul 2>&1

REM Check if the service was stopped successfully
sc query vgk | findstr /i /c:"STOPPED" >nul 2>&1

if %errorlevel% equ 0 (
    echo Vanguard Anti-Cheat service stopped successfully.
) else (
    echo Failed to stop Vanguard Anti-Cheat service.
)

REM Kill the vgtray.exe process
taskkill /F /IM vgtray.exe >nul 2>&1

REM Check if vgtray.exe was successfully killed
tasklist | findstr /i "vgtray.exe" >nul 2>&1

if %errorlevel% neq 0 (
    echo vgtray.exe process terminated.
) else (
    echo Failed to terminate vgtray.exe. 
)

pause