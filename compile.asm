.relativeinclude on

.gba


.openfile rom,"patched"+rom,0x8000000

.include "helpermacro.asm"



.orga filesize("bn3.gba")
.align 4
GameTitleTiles:
.incbin "compresstilestitle.bin"
GameTitleMap:
.incbin "tilemaptitle.bin"
titlepal:
.incbin "titlepal.bin"
.align 4
PalaxCompressedTiles:
.incbin "compresspalaxtiles.bin"
.align 4
PalaxPal:
.incbin "palixpal.bin"
PalixMap:
.incbin "PalixMap.bin"

.align 4
.include "AddTilesandMaps.asm"



AddRotationMain:
.include "main.asm"


PoolToDifferentSequences:
.dw BeginTitle1|1
.dw TitleScreenFly|1
.dw BeginTitle2|1
.dw BeginTitle3|1


.include "hooks.asm"

.org TitlePoolPointer
.dw PoolToDifferentSequences

.org NewPhaseToContinue
mov r0,0xC

.orga GameTitlePointer
.dw GameTitleTiles

.orga GameTitlePalPointer 
.dw titlepal



.close