AddTilesandMaps:
push r5,r14
ldr r0,[r7,0x10]
mov r1,0
strh r1,[r0,0xC]
strh r1,[r0,0xE]
strh r1,[r0,0x10]
strh r1,[r0,0x12]
strh r1,[r0,0x14]
strh r1,[r0,0x16]
strh r1,[r0,0x18]
strh r1,[r0,0x1A]

ldr r0,=PalaxCompressedTiles
ldr r1,=0x2010800
swi 0x11
;.dh 0xDF11
;BXwithR11 uncompressed|1
ldr r0,=0x2010800
ldr r1,=0x6000040
ldr r2,=PalaxCompressedTiles
ldr r2,[r2]
lsr r2,r2,0xA
mov r3,3
ldr r4,=0x84000000
BXwithR11 DMAWriteCHannel|1
mov r0,0x8
BXwithR11 WaitForDMAToFinish|1


ldr r0,=PalaxPal
ldr r1,=0x20099D0
mov r2,0x20
BXwithR11 cpuSet|1 



ldr r0,=GameTitleMap
mov r1,r10
ldr r1,[r1,0x5C]
mov r2,0x10
lsl r2,r2,0x8
add r1,r1,r2
mov r2,0xA0
BXwithR11 DMAWriteChannel0|1 

ldr r0,=PalixMap
mov r1,r10
ldr r1,[r1,0x5C]
mov r2,0x8
lsl r2,r2,0x8
add r1,r1,r2
ldr r2,=0x140
BXwithR11 DMAWriteChannel0|1 





pop r5,r15
.pool