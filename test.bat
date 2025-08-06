@echo off

:: Reading variable definitions from .env file
FOR /F "eol=# tokens=*" %%i IN (%~dp0.env) DO SET %%i
SET CURRENTDIR=%cd%

set version=white
IF "%1" == "b" SET version=blue
IF "%2" == "vbalink" GOTO vbalink
IF "%2" == "nocash" GOTO nocash
GOTO mgba

:mgba
start "" "%MGBA_PATH%" "%CURRENTDIR%\patchedbn3%version%.gba"
GOTO end

:vbalink
start "" "%VBALINK_PATH%" "%CURRENTDIR%\patchedbn3%version%.gba"
start "" "%VBALINK_PATH%" "%CURRENTDIR%\patchedbn3%version%.gba"
GOTO end

:nocash
start "" "%NOCASHGBA_PATH%" "%CURRENTDIR%\patchedbn3%version%.gba"
GOTO end

:end

