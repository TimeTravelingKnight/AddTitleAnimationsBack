updateScreenBrightNess equ 0x8005288
checkifScreenBrightNessChanged equ 0x80052C8
HookToAddTilesandMaps equ 0x8021FBE
cpuSet equ 0x8000B7C
uncompressed equ 0x8132638
DMAWriteCHannel  equ 0x80009C8
WaitForDMAToFinish equ 0x80009F4
DMAWriteChannel0 equ 0x8000A34
GameTitle equ 0x87FBC30
GameTitlePal equ 0x87FBA30
GameTileOgMap equ 0x87FF6C4
BeginTitle1 equ 0x8021fAC
BeginTitle2 equ 0x8022018
BeginTitle3 equ 0x8022048

TitlePoolPointer equ 0x8021F9C

GameTitlePointer equ 0x22614
GameTitlePalPointer equ 0x2263C
NewPhaseToContinue equ 0x802213C