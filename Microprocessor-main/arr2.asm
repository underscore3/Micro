.model small
.386
.data
ARR DB 100 DUP (?)
DATA1 DW 0000H
DATA2 DB 00H
DATA3 DB 00H
msg1 db, 10, 13, "Enter the size of the array: $"
msg2 db, 10, 13, "Enter the array: $"
msg3 db, 10, 13, "The entered array is: $"

.code
.startup
MOV AH, 09
MOV DX, OFFSET msg1
INT 21H

MOV BX, 00H
MOV CX, 2
AGAIN1: MOV AH, 01
INT 21H
CMP AL, 'A'
JGE L1
SUB AL, 30H
JMP L2
L1: SUB AL, 37H
L2: SHL BX, 4
ADD BL, AL
LOOP AGAIN1

;MOV CL, AL
MOV AL, BL
MOV AH, 00
MOV DATA1, AX
MOV CX, DATA1

MOV AH, 09
MOV DX, OFFSET msg2
INT 21H

LEA SI, ARR
AGAIN2: MOV DL, 0AH ; jump to next line
MOV AH, 02H
INT 21H

MOV DATA2, CL

NUM PROC
MOV CL, 2
AGAIN3: MOV AH, 01H
INT 21H
SUB AL, 30H
SHL BX, 4
ADD BL, AL
LOOP AGAIN3
ENDP NUM

MOV CL, DATA2
MOV [SI], BL
INC SI
LOOP AGAIN2

MOV AH, 09H
MOV DX, OFFSET msg3
INT 21H

MOV CX, DATA1
MOV SI, OFFSET ARR
AGAIN4: MOV AH, 02H
MOV DL, 0AH
INT 21H

MOV DATA3, CL

MOV CL, 2
MOV BL, [SI]
AGAIN5: ROL BL, 4
MOV AL, BL
AND AL, 0FH
MOV DL, AL
ADD DX, 30H
MOV AH, 02
INT 21H
LOOP AGAIN5

MOV CL, DATA3
INC SI
LOOP AGAIN4

.EXIT
END