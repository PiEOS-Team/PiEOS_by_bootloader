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

ORG 0x7c00h
MOV ax, cs
MOV ds, ax
MOV es, ax
CALL sayHello
JMP $

sayHello:
    MOV ax, bootMessage
    MOV bp, ax
    MOV cx, 16
    MOV ax, 01301h
    MOV bx, 000ch
    MOV dl, 0
    INT 10h
    ret

bootMessage:
    db "Hello, PiEOS!"
    db 0x0a

times 510 - ($ - $$) db 0

dw 0xaa55
