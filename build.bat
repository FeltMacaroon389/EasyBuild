@echo off
setlocal enabledelayedexpansion

REM Define variables
set "icoFile="
set "filename="

REM Identify ICO file in the directory
for %%i in (*.ico) do (
    if not defined icoFile (
        set "icoFile=%%i"
    ) else (
        echo Error: Multiple ICO files found in the directory. Script might not work as expected.
    )
)

if not defined icoFile (
    echo.
    echo Error: No ICO file found in the directory. EXE will have default icon.
)

REM Process Python files
for %%f in (*.py) do (
    set "filename=%%~nf"
    
    REM Use ICO file with pyinstaller
    pyinstaller --onefile --icon=!icoFile! %%f
    
    rd /s /q build
    del %%~nf.spec
    
    REM Move the output directory to a new name
    ren dist Built_EXE_!filename!
)

endlocal
