.include "intro1.asm"
.include "intro1sub1.asm"
TitleScreenFly:
push r14
ldr r0,=@@PhaseTimes
ldrb r1,[r5,1]
ldr r0,[r0,r1]
mov r14,r15
bx r0
mov r7,r10
ldr r7,[r7,0x10]
ldrh r0,[r7,0x10]
sub r0,4
strh r0,[r7,0x10]
mov r0,r5
add r0,0x18
mov r1,r10
ldr r1,[r1,0x10]
add r1,0x1C
mov r2,0x1
.dh 0xDF0E
pop r15
.pool
@@PhaseTimes:
.dw StartUpMatrix|1
.dw subPhase1|1
.dw subPhase2Rotate|1
.dw NextPhaseToSetUpTitle|1
.dw PhaseToMakeTitleAppear|1
