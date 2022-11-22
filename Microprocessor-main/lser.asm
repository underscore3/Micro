.model small
.386
.data
ARRAY DW 20 DUP (?)
DATA1 DW 0000H
success db 10, 13, "Element is present in the array: $"
fail db 10, 13, "Element is not present in the array: $"
msg1 db 10, 13, "Enter the size of the array: $"
msg2 db 10, 13, "Enter the array: $"
msg3 db 10, 13, "Enter the element to be searched: $"
msg4 db 10, 13, "Index is: $"

.code
.startup
MOV AH, 09
MOV DX, OFFSET msg1
INT 21H

; INPUT SIZE OF THE ARRAY
MOV AH, 01
INT 21H
SUB AL, 30H
MOV AH, 00
MOV CX, AX
MOV DATA1, AX

MOV AH, 09
MOV DX, OFFSET msg2
INT 21H

; INPUT THE ARRAY
MOV CX, DATA1
MOV BX, OFFSET ARRAY
MOV SI, 00
L1: MOV AH, 02H
MOV DL, 0AH
INT 21H
MOV AH, 01H
INT 21H
SUB AL, 30H
MOV AH, 00
MOV [BX + SI], AX
INC SI
LOOP L1

MOV AH, 09
MOV DX, OFFSET msg3
INT 21H

; INPUT SEARCH ELEMENT
MOV AH, 01
INT 21H
SUB AL, 30H

; SEARCH THE ELEMENT
MOV CX, DATA1
MOV DX, OFFSET ARRAY
MOV SI, 00
L2: CMP[BX + SI], AL ; linear search loop
JZ L3 ; jump if element is found
INC SI
LOOP L2

MOV AH, 09H
MOV DX, OFFSET fail
INT 21H

MOV AH, 4CH ; to forcefully terminate the program
INT 21H

L3: MOV AH, 09
MOV DX, OFFSET success
INT 21H

MOV AH, 09
MOV DX, OFFSET msg4
INT 21H

MOV AH, 02
ADD SI, 30H
MOV DX, SI
INT 21H

MOV AH, 4CH
INT 21H
.EXIT
END