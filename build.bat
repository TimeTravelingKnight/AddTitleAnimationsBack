@echo off

set ALTITLE=0
if "%2"=="-a" set ALTITLE=1

if "%1"=="-w" goto white
if "%1"=="-b" goto blue

echo Usage: build.bat [-w ^| -b] [-a]
echo -w: Build for white version
echo -b: Build for blue version
echo -a: Use alternate titlescreen (optional)
goto exit

:white
del .\patchedbn3white.gba
.\armips-lzss-v1.exe Version.asm -equ gamever 0 -strequ rom "bn3white.gba" -equ alternatetitle %ALTITLE%
goto exit

:blue
del .\patchedbn3blue.gba
.\armips-lzss-v1.exe Version.asm -equ gamever 1 -strequ rom "bn3blue.gba" -equ alternatetitle %ALTITLE%
goto exit

:exit
exit