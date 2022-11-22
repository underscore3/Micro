.model small
.stack 100H

.data
msg1 db 10, 13, "Enter the first digit: $"
msg2 db 10, 13, "Enter the second digit: $"
msg3 db 10, 13, "The difference is: $"

.code
.startup

MOV AH, 09
MOV DX, OFFSET msg1
INT 21H

MOV AH, 01
INT 21H
SUB AL, 30H
MOV BL, AL

MOV AH, 09
MOV DX, OFFSET msg2
INT 21H

MOV AH, 01
INT 21H
SUB AL, 30H
SUB BL, AL

MOV AH, 09
MOV DX, OFFSET msg3
INT 21H

MOV DL, BL
CMP DL, 09
JG L6
ADD DL, 30H
JMP L7
L6: ADD DL, 37H
L7: MOV AH, 02
INT 21H

MOV AH, 4CH
INT 21H
.exit
end