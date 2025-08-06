echo off
grit word.png  -gz lz77 -m -mLa -mu8 -ft bin
python add.py
armips version.asm -equ gamever %1 -strequ rom %2
del word.h
del word.img.bin
del word.map.bin
del word2.map.bin
del word.pal.bin
