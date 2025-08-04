.macro BXwithR11, jumpAddress

add sp,-0x8
str r0,[sp]
mov r0,r11
str r0,[sp,0x4]
ldr  r0,=jumpAddress
mov r11,r0
ldr r0,[sp]
mov r14,r15
bx r11
str r0,[sp]
ldr r0,[sp,0x4]
mov r11,r0
ldr r0,[sp]
add sp,0x8

.endmacro

.macro pointerrecur, file,offset,curr
Loop:
@@pointer equ readu32(file,offset+(curr<<2))
.if @@pointer>>24 == 0x8
    .dw @@pointer
    pointerrecur file,offset,(curr+1)
.endif

.endmacro 

.macro pointercopy, file,offset,curr,end
Loop:
@@pointer equ readu32(file,offset+(curr<<2))
.if curr<end
    .dw @@pointer
    pointercopy file,offset,(curr+1),end
.endif

.endmacro 



.macro pointerrecurSpritePalette, offset,curr,end,newpointer
;LoopSprite:
.if end>curr
	;.notice tohex(curr)
	.orga curr
	
	.dw newpointer
	pointerrecurSpritePalette offset,curr+offset,end,newpointer
.endif
.endmacro

.macro .vorga, offsetgregar,offsetfalzar
.if gamever == 0
.orga offsetgregar
.elseif gamever == 1
.orga offsetfalzar
.endif
.endmacro

.macro .vorg, addressgregar,addressfalzar
.if gamever == 0
.org addressgregar
.elseif gamever == 1
.org addressfalzar
.endif
.endmacro

.macro .vdef,label,addressgregar,addressfalzar
.if gamever==0
.definelabel label,addressgregar
.elseif gamever == 1
.definelabel label,addressfalzar
.endif 
.endmacro
