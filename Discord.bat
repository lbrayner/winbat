@echo off

set app_home=C:\Users\leona\AppData\Local\Discord

tasklist | findstr /i "Discord.exe" > nul

if %errorlevel% EQU 0 goto focus

set script_name=%~nx0
set script_name=%script_name:~0,-4%

echo. & echo Starting %script_name%.

set choice=
set /p choice=Do you want to continue? [y/N] 
if "%choice%"=="y" (
	goto start_app
) else (
	exit /b 0
)

:start_app
cd %app_home%\app-0.0.297
start "" %app_home%\Update.exe --processStart Discord.exe
exit /b 0

:focus

echo. & echo Focusing on existing instance.
for /f "tokens=*" %%i in ('tasklist /fo list /v /fi "imagename eq discord.exe" ^| ^
    find /i "window title" ^| find /v /i "n/a"') do (

    set "window_title=%%i"
)

set window_title=%window_title:~14%
echo %window_title%

sendkeys "%window_title%" ""

:end
