@echo off

set "app_home=C:\Program Files\MPC-HC"
set "app=mpc-hc64.exe"

tasklist | findstr /i %app% > nul

if %errorlevel% EQU 0 goto focus

set script_name=%~nx0
set script_name=%script_name:~0,-4%

echo. & echo Starting %script_name%.

cd %app_home%
start "" "%app_home%\%app%"
exit /b 0

:focus

echo. & echo Focusing on existing instance.
for /f "tokens=*" %%i in ('tasklist /fo list /v /fi "imagename eq mpc-hc64.exe" ^| ^
    find /i "window title" ^| find /v /i "n/a"') do (

    set "window_title=%%i"
)

set window_title=%window_title:~14%
echo %window_title%

sendkeys "%window_title%" ""

:end
