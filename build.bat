@echo off

setlocal enabledelayedexpansion

for %%f in (*.py) do (
    set "filename=%%~nf"
    pyinstaller --onefile %%f
    rd /s /q build
    del %%~nf.spec
    ren dist Built_EXE
    cd Built_EXE
    ren !filename!.exe PyinstallerFile.exe
    cd ..
)

endlocal
