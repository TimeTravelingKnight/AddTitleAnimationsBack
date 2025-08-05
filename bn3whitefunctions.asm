updateScreenBrightNess equ 0x8005288
checkifScreenBrightNessChanged equ 0x80052C8
HookToAddTilesandMaps equ 0x8021FD6
cpuSet equ 0x8000B7C
uncompressed equ 0x8132638
DMAWriteCHannel  equ 0x80009C8
WaitForDMAToFinish equ 0x80009F4
DMAWriteChannel0 equ 0x8000A34
GameTitle equ 0x87FC0D0
GameTitlePal equ 0x87FBED0
GameTileOgMap equ 0x87FF6C4
BeginTitle1 equ 0x8021FC4
BeginTitle2 equ 0x8022030
BeginTitle3 equ 0x8022060

TitlePoolPointer equ 0x8021FB4

GameTitlePointer equ 0x2262C
GameTitlePalPointer equ 0x22654
NewPhaseToContinue equ 0x8022154