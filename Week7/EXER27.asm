.MODEL SMALL
.STACK 100H
.DATA
    prompt1 DB 'Enter first integer: $'
    prompt2 DB 0DH, 0AH, 'Enter second integer: $'
    result_msg DB 0DH, 0AH, 'The difference is: $'
    num1 DW ?
    num2 DW ?
    difference DW ?
.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX
    ; Display first prompt
    LEA DX, prompt1
    MOV AH, 09H
    INT 21H
    ; Input first number
    CALL INPUT_NUM
    MOV num1, AX
    ; Display second prompt
    LEA DX, prompt2
    MOV AH, 09H
    INT 21H
    ; Input second number
    CALL INPUT_NUM
    MOV num2, AX
    ; Calculate difference
    MOV AX, num1
    SUB AX, num2
    MOV difference, AX
    ; Display result message
    LEA DX, result_msg
    MOV AH, 09H
    INT 21H
    ; Display difference
    MOV AX, difference
    CALL DISPLAY_NUM
    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP

INPUT_NUM PROC
    XOR BX, BX  ; Initialize result to 0
INPUT_LOOP:
    ; Read a character
    MOV AH, 01H
    INT 21H
    ; Check if it's Enter (carriage return)
    CMP AL, 0DH
    JE END_INPUT
    ; Convert ASCII to number
    SUB AL, '0'
    
    ; Update result: result = result * 10 + new_digit
    MOV CL, AL
    MOV AX, 10
    MUL BX
    MOV BX, AX
    XOR CH, CH
    ADD BX, CX
    JMP INPUT_LOOP
END_INPUT:
    MOV AX, BX
    RET
INPUT_NUM ENDP

DISPLAY_NUM PROC
    ; Check if the number is negative
    TEST AX, AX
    JNS POSITIVE
    ; If negative, print minus sign and negate the number
    PUSH AX
    MOV DL, '-'
    MOV AH, 02H
    INT 21H
    POP AX
    NEG AX
POSITIVE:
    MOV BX, 10
    XOR CX, CX  ; Initialize digit counter
DIVIDE_LOOP:
    XOR DX, DX
    DIV BX
    PUSH DX     ; Push remainder (digit) onto stack
    INC CX
    TEST AX, AX
    JNZ DIVIDE_LOOP
DISPLAY_LOOP:
    POP DX
    ADD DL, '0' ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP DISPLAY_LOOP
    RET
DISPLAY_NUM ENDP

END MAIN