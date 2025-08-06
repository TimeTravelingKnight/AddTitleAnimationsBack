@echo off

if "%1"=="-w" goto white
if "%1"=="-b" goto blue

echo Usage: build.bat [-w ^| -b]
echo -w: Build for white version
echo -b: Build for blue version
goto exit

:white
del .\patchedbn3white.gba
.\armips-lzss-v1.exe Version.asm -equ gamever 0 -strequ rom "bn3white.gba"
goto exit

:blue
del .\patchedbn3blue.gba
.\armips-lzss-v1.exe Version.asm -equ gamever 1 -strequ rom "bn3blue.gba"
goto exit

:exit
exit