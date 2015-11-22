@echo off

if "%~1"=="" goto :USAGE

:MAIN
    set COMMAND=%*
    for /f "usebackq tokens=*" %%o in (`findstr .*`) do (
            call %%COMMAND:?=%%o%%
    )
    goto :eof

:USAGE
    echo  each.bat [command]
    goto :eof