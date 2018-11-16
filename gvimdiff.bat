@echo off
set local

set "app_home=C:\Program Files (x86)\vim\vim81"
set app=gvim.exe

set "path=%path%;c:\cygwin64\bin"
set shell=c:\cygwin64\bin\bash.exe

set "local=%1"
set "remote=%2"

start /wait /max "" "%app_home%\%app%" -d -R "%local%" "%remote%"

exit /b 0
