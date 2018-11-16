@echo off

if "%~1" == "-u" (
    if not "%~2" == "" (
        if not "%~3" == "" (
            if "%~4" == "" (
                7z u %2 %3
                exit /b 0
            )
        )
    )
)

7z %*
