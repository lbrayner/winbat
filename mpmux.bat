@echo off
::cmd /c c:\Users\leona\Documents\batch\do-mpmux.bat %*
cscript //E:JScript //nologo C:\Users\leona\Documents\jscript\mpmux.js "%~nx0" %* 
exit /b %errorlevel% 
