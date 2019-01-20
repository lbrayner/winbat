@echo off

set emacs_home=C:\Users\leona\usr\emacs-26.1-x86_64
set emacs=emacs.exe

if "%1"=="" goto nofile

start "" %emacs_home%\bin\emacsclientw.exe -n %*
goto end

:nofile
::start "" %emacs_home%\bin\runemacs.exe

tasklist | findstr /i "%emacs%" > nul

::echo. & echo %errorlevel%

if %errorlevel% EQU 0 goto focus

echo. & echo Starting Emacs.

set choice=
set /p choice=Do you want to continue? [y/N] 
if "%choice%"=="y" (
	goto start_emacs
) else (
	exit /b 0
)

:start_emacs
set "path=%path%;c:\cygwin64\bin"
start /d %userprofile% "" %userprofile%\shortcuts\Emacs.lnk
exit /b 0

:focus

set window_title=Emacs

echo. & echo Focusing on existing Emacs instance.
cmd /c sendkeys "%emacs%@DESKTOP" "" 1>&2 > nul

if %errorlevel% NEQ 0 cmd /c sendkeys "%window_title%" "" 1>&2 > nul

if %errorlevel% NEQ 0 echo. & echo Failed to find %window_title%

:end
