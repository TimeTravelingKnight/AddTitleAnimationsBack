.relativeinclude on

.gba


.openfile rom,"output/patched"+rom,0x8000000

.include "helpermacro.asm"



.orga filesize(rom)
.align 4
GameTitleTiles:
.incbin "word.img.bin"
;.incbin "compresstilestitle.bin"
GameTitleMap:
.incbin "word2.map.bin"
;.incbin "tilemaptitle.bin"
titlepal:
.incbin "word.pal.bin"
;.incbin "titlepal.bin"
.align 4
PalaxCompressedTiles:
.incbin "Palaxfiles/compresspalaxtiles.bin"
.align 4
PalaxPal:
.incbin "Palaxfiles/palixpal.bin"
PalixMap:
.incbin "Palaxfiles/PalixMap.bin"

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