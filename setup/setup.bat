@echo off
setlocal enabledelayedexpansion

cd R:\Dev\MagicMirror\modules
set "configFile=..\setup\modules"

for /f "tokens=1,* delims==" %%a in (%configFile%) do (
    set "name=%%a"
    set "url=%%b"

    if defined name if defined url (
      CALL :Install !name! !url!
    )
)


cd ..
endlocal
EXIT /B 0

:Install
set name=%~1
set url=%~2
if not exist "!name!" (
    echo Installing !name!..
    git clone !url! --quiet
    cd !name!
    npm install --production --quiet --silent
    cd ..
    echo !name! installed.
) else (
    echo !name! already installed.
)
EXIT /B 0
