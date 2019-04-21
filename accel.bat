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


start cmd.exe /c "set path=C:\cygwin64\bin;%path% "^
 "& C:\Users\leona\usr\interaccel_test2.7\99.^ source\interaccel_test2.5_source\accel.exe"
