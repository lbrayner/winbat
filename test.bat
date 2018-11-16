@echo off

rem for /l %%x in (1,1,3) do (
rem     call set "arg%%x=%%~%%x"
rem     call echo %%arg%%x%%
rem )
rem if "%arg1%" == "-u" (
rem     if not "%arg2%" == "" (
rem         if not "%arg3%" == "" (
rem             if "%arg4%" == "" (
rem                 echo. & echo hello
rem                 exit /b 0
rem             )
rem         )
rem     )
rem )

if "%~1" == "-u" (
    if not "%~2" == "" (
        if not "%~3" == "" (
            if "%~4" == "" (
                echo. & echo hello
                exit /b 0
            )
        )
    )
)

echo. & echo hi
