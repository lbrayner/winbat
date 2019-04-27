@echo off

set "app_home=C:\Program Files (x86)\vim\vim81"
set app=gvim.exe

set "temp=%USERPROFILE%\AppData\Local\Temp"
set "tmp=%temp%"
set shell=
set term=msys
set cygpath=c:\cygwin64\bin\cygpath.exe
set arg=

FOR /F "tokens=* USEBACKQ" %%i in (`%cygpath% -w %1`) do set "arg=%arg%%%i"

echo %arg%

start /wait /max "" "%app_home%\%app%" "%arg%"

exit /b 0
