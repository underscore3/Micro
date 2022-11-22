.model small
.data
msg db "Hello$"

.code
.startup

MOV AH, 09
MOV DX, OFFSET msg
INT 21H

MOV AH, 4CH
INT 21H
.exit
end