@echo off
setlocal

set "shortcut_home=C:\Users\leona\shortcuts"
set shortcut=gvim.lnk
set app=gvim.exe

tasklist | findstr /i %app% > nul

if %errorlevel% EQU 0 goto focus

set script_name=%~n0

echo. & echo Starting %script_name%.

set "path=%path%;c:\cygwin64\bin"
set shell=c:\cygwin64\bin\bash.exe
set TMP=c:\cygwin64\tmp
set TEMP=c:\cygwin64\tmp

cd %shortcut_home%
start "" %shortcut_home%\%shortcut% %*
exit /b 0

:focus

echo. & echo Focusing on existing instance.
for /f "tokens=*" %%i in ('tasklist /fo list /v /fi "imagename eq "%app% ^| ^
    find /i "window title" ^| find /v /i "n/a"') do (

    echo %%i
    set "line=%%i"
)

set window_title=

for /f "tokens=3,* delims= " %%i in ("%line%") do (
    set "window_title=%%i %%j"
)

rem set window_title=%window_title:~14%
echo %window_title%

sendkeys "%window_title%" ""

:end
