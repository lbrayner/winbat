@echo off

rem https://superuser.com/a/498798

rem Bypass "Terminate Batch Job" prompt.
if "%~1"=="-FIXED_CTRL_C" (
   REM Remove the -FIXED_CTRL_C parameter
   SHIFT
) ELSE (
   REM Run the batch with <NUL and -FIXED_CTRL_C
   CALL <NUL %0 -FIXED_CTRL_C %*
   GOTO :EOF
)

tasklist | findstr /i "accel.exe" > nul

if %errorlevel% EQU 0 goto end

rem https://www.thewindowsclub.com/run-batch-files-silently-on-windows

rem set "accel=c:/Users/leona/usr/interaccel_test2.7/99. source/interaccel_test2.5_source/accel.exe"

rem start /min cmd.exe /c accel.exe CoJGunslinger.exe
rem start /wait "" "%accel%" CoJGunslinger.exe
rem "%accel%" CoJGunslinger.exe

set "dir=/cygdrive/c/Users/leona/winbat/accel/cojuarez"
set "accel=/cygdrive/c/Users/leona/usr/interaccel_test2.7/99. source/interaccel_test2.5_source/accel.exe"
rem C:\cygwin64\bin\mintty.exe -h always /usr/bin/zsh -l -i -c "cd \"%dir%\" && \"%accel%\" CoJGunslinger.exe"
rem C:\cygwin64\bin\mintty.exe -h always /usr/bin/zsh -l -i -c "cd \"%dir%\" && ls "

set "accel=c:/Users/leona/winbin/accel.exe"

set "path=c:/cygwin64/bin;%path%"

cd c:/Users/leona/winbat/accel/cojuarez

C:\cygwin64\bin\run.exe %accel%

pause

:end
