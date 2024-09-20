.MODEL SMALL
.STACK 100H
.DATA
    TOP_BOTTOM DB '+---+---+---+---+---+$'
    VERTICAL DB '|$'
    SPACE DB ' $'
    NEWLINE DB 13, 10, '$'
    NUMBER DB '0$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Print top border
    LEA DX, TOP_BOTTOM
    MOV AH, 09H
    INT 21H
    CALL PRINT_NEWLINE

    MOV CX, 2  ; 2 rows of numbers
ROW_LOOP:
    PUSH CX
    MOV CX, 5  ; 5 numbers per row
    
    ; Print left border
    LEA DX, VERTICAL
    MOV AH, 09H
    INT 21H

NUMBER_LOOP:
    ; Print space
    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    ; Print number
    LEA DX, NUMBER
    MOV AH, 09H
    INT 21H
    INC NUMBER

    ; Print space
    LEA DX, SPACE
    MOV AH, 09H
    INT 21H

    ; Print vertical separator
    LEA DX, VERTICAL
    MOV AH, 09H
    INT 21H

    LOOP NUMBER_LOOP

    CALL PRINT_NEWLINE

    ; Print middle border
    LEA DX, TOP_BOTTOM
    MOV AH, 09H
    INT 21H
    CALL PRINT_NEWLINE

    POP CX
    LOOP ROW_LOOP

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP

PRINT_NEWLINE PROC
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    RET
PRINT_NEWLINE ENDP

END MAIN