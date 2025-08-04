.if fileexists(rom)


.if  gamever == 0
.include "bn3whitefunctions.asm"
.include "compile.asm"

.elseif gamever == 1
.include "bn3bluefunctions.asm"
.include "compile.asm"

.else
.notice "GameVersion Unknown. Add -equ gamever 0/1 to select white or blue"

.endif 

.else 
.notice "Rom Path doesn't exist. -strequ rom filepath to add"

.endif