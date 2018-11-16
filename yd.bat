@echo off
::cmd /c c:\Users\leona\Documents\batch\youtube-download.bat %* < nul
cscript //E:JScript //nologo C:\Users\leona\Documents\jscript\youtube-download.js "%~nx0" %* 
exit /b %errorlevel% 
