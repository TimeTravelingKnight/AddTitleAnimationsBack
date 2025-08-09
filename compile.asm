.relativeinclude on

.gba

.openfile rom,"patched"+rom,0x8000000

; Inserting titlescreen's modified palette
.org 0x087FBED0
.incbin "jappal.bin"

; Inserting titlescreen's tilemap
.org 0x087FF6C4
.incbin "tilemapjap.bin"

; Add titlescreen animations back (parallax and zoomed logo)
.include "helpermacro.asm"

; Offset where all the new titlescreen data will be inserted.
; If you want to insert at the end of the ROM, you can use
; the `.orga filesize(rom)` statement, and the ROM will be automatically
; expanded to fit the new data.
; But if you want to insert at a specific location, you can use `.org {offset}`
; ex.: `.org 0x087FFBC4`
.orga filesize(rom)
.align 4

GameTitleTiles:
.lz77gba "tilestitle.bin"
.align 4
GameTitleMap:
.incbin "tilemaptitle.bin"
titlepal:
.incbin "titlepal.bin"
.align 4
NewGameTitle:
.lz77gba "tilesjap.bin"
.align 4
PalaxCompressedTiles:
.lz77gba "palaxtiles.bin"
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