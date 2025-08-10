
subPhase1:
push r14
BXwithR11 checkifScreenBrightNessChanged|1
beq @@Escape
bl Helper
mov r1,0x20
ldsh r0,[r5,r1]
sub r0,8
strh r0,[r5,0x20]
mov r1,0xF0
neg r1,r1
cmp r0,r1
bgt @@Escape
mov r0,0
strh r0,[r5,0x24]
strh r0,[r5,0x26]
mov r0,0x80
strh r0,[r5,0x4]
mov r0,0
strh r0,[r5,0x10]
mov r0,0x8
strb r0,[r5,1]
@@Escape:
pop r15


.pool

subPhase2Rotate:
push r14
bl Helper
ldrh r0,[r5,0x4]
sub r0,0x4
strh r0,[r5,0x4]
blt @@NextPhase
mov r6,0x60
strh r6,[r5,0x20]
mov r7,0x44
strh r7,[r5,0x22]
ldrh r0,[r5,0x4]
lsl r0,r0,1
mov r1,0x10
lsl r1,r1,0x4
sub r0,r1,r0
strh r0,[r5,0x24]
strh r0,[r5,0x26]
ldrh r0,[r5,0x4]
lsl r0,r0,0x3
lsl r0,r0,0x8
strh r0,[r5,0x28]
b @@Escape

@@NextPhase:
mov r0,0x10
strh r0,[r5,0x4]
mov r0,0xC
strb r0,[r5,0x1]
@@Escape:
pop r15
.pool

NextPhaseToSetUpTitle:
push r14
bl Helper
ldrh r0,[r5,0x4]
sub r0,1
strh r0,[r5,0x4]
bgt @@Escape
mov r0,0x2
mov r1,0xFF
BXwithR11 updateScreenBrightNess|1
mov r0,0x10 
strb r0,[r5,0x1]
@@Escape:
pop r15
.pool 

PhaseToMakeTitleAppear:
push r14
BXwithR11 checkifScreenBrightNessChanged|1
beq @@Escape

ldr r0,=NewGameTitle
ldr r1,=0x2010800
swi 0x11
;.dh 0xDF11
;BXwithR11 uncompressed|1
ldr r0,=0x2010800
ldr r1,=0x6000E00
ldr r2,=NewGameTitle
ldr r2,[r2]
lsr r2,r2,0xA
mov r3,3
ldr r4,=0x84000000
BXwithR11 DMAWriteCHannel|1
mov r0,0x8
BXwithR11 WaitForDMAToFinish|1

ldr r0,=GameTitlePal
ldr r1,=0x2009810
mov r2,0x1C
lsl r2,r2,4

BXwithR11 cpuSet|1 

mov r0,0x8
strb r0,[r5]
mov r0,0
strb r0,[r5,0x1]

@@Escape:
pop r15
.pool

Helper:
push r5,r14
mov r7,r10
ldr r0,[r7,0x4]
ldrh r0,[r0,0x2]
mov r1,0xB
tst r0,r1
beq @@Escape
mov r0,0x2
mov r1,0xFF
BXwithR11 updateScreenBrightNess|1
mov r0,4
strb r0,[r5]
mov r0,0x10 
strb r0,[r5,0x1]
@@Escape:
pop r5,r15