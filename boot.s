;
; =====================================================================================
;
;       Filename:  boot.s
;
;    Description:  启动程序
;
;        Version:  0.0.1 Alpha
;        Created:  2023年12月30日 13时57分33秒
;       Revision:  none
;       Compiler:  gcc
;
;         Author:  PiEOS-Team
;
; =====================================================================================
;

ORG  0x7c00h     ; 将程序装载到 0x7c00 的位置，h表示 16 进制
MOV  ax, cs
MOV  ds, ax
MOV  es, ax
CALL sayHello    ; 调用 sayHello
JMP  $           ；无限循环

sayHello:
    MOV ax, bootMessage    
    MOV bp, ax             ; ES : BP = 串地址
    MOV cx, 16             ; CX = 串长度
    MOV ax, 01301h         ; AH = 013，AL = 01h
    MOV bx, 000ch          ; BH = 0，BL = 0ch
    MOV dl, 0
    INT 10h
    ret                    ; 10h 号中断

bootMessage:
    db "Hello, PiEOS!"
    db 0x0a

times 510 - ($ - $$) db 0    ; 用 0 填充剩下的空间，直到 510 字节

dw 0xaa55    ; 结束标志
