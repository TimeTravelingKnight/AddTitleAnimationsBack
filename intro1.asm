
initCounter equ 0x1741
centerX equ 127;0x60
centerY equ 30;0x44
screenYRegister equ 0x50

.align 4
StartUpMatrix:
push r14
mov r7,r10
ldr r0,[r7,0x10]
ldr r1,=initCounter
strh r1,[r0]
mov r0,centerX ;center X
lsl r0,r0,8
str r0,[r5,0x18]
mov r0,centerY ; center y
lsl r0,r0,8
str r0,[r5,0x1c]
mov r0,centerX
add r0,0xF0
add r0,0xF0
strh r0,[r5,0x20]
mov r0, screenYRegister
strh r0,[r5,0x22]
mov r0,0x8
lsl r0,r0,0x4
strh r0,[r5,0x24]
strh r0,[r5,0x26]
mov  r0,0
lsl r0,r0,0x8
strh r0,[r5,0x28]
mov r0,0x3
mov r1,0x8
BXwithR11 updateScreenBrightNess|1 
mov r0,0x4
strb r0,[r5,0x1]
pop r15

.pool

