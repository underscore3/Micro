.model small
.stack 100H

.data
data1 dW 0000H
msg1 db 10, 13, "Enter the first no: $"
msg2 db 10, 13, "Enter the second no: $"
msg3 db 10, 13, "The sum is: $"

.code
.startup

MOV AH, 09
MOV DX, OFFSET msg1
INT 21H

MOV BX, 0000
MOV CX, 4
AGAIN: MOV AH, 01
INT 21H
CMP AL, 'A'
JGE P1
SUB AL, 30H
JMP P2
P1: SUB AL, 37H
P2: SHL BX, 4
MOV AH, 00
ADD BX, AX
LOOP AGAIN

MOV data1, BX

MOV AH, 09
MOV DX, OFFSET msg2
INT 21H

MOV BX, 0000
MOV CX, 4
AGAIN2: MOV AH, 01
INT 21H
CMP AL, 'A'
JGE P3
SUB AL, 30H
JMP P4
P3: SUB AL, 37H
P4: SHL BX, 4
MOV AH, 00
ADD BX, AX
LOOP AGAIN2

ADD BX, data1

MOV AH, 09
MOV DX, OFFSET msg3
INT 21H

MOV DL, 00
MOV CX, 4
AGAIN3: ROL BX, 4
MOV DL, BL
AND DL, 0FH
CMP DL, 09
JG P5
ADD DL, 30H
JMP P6
P5: ADD DL, 37H
P6: MOV AH, 02
INT 21H
LOOP AGAIN3

MOV AH, 4CH
INT 21H
.exit
end