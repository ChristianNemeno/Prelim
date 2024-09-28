; Filename: EXAM2.ASM
; CS243 Lab Hands-on Exam No. 2
; First Semester SY 2024-2025
; Student Name: Christian A Nemeno
; Date Finished: 28/09/2024

.MODEL SMALL
.STACK 100H
.DATA
    TIT DB 'THE CALCULATOR$'
    CREATOR DB 'Created by: CHRISTIAN A NEMENO $'
    DATE DB 'Date: 28/09/2024$'
    MENU DB 'Main Menu$'
    OPTION1 DB 'a - Addition$'
    OPTION2 DB 's - Subtraction$'
    OPTION3 DB 'm - Multiplication$'
    OPTION4 DB 'd - Division$'
    OPTION5 DB 'e - Exit$'
    PROMPT DB 'Enter your choice: $'
    ADD_MSG DB 'Addition$'
    SUB_MSG DB 'Subtraction$'
    MUL_MSG DB 'Multiplication$'
    DIV_MSG DB 'Division$'
    EXIT_MSG DB 'Exit Program$'
    INVALID_MSG DB 'INVALID CHOICE!$'
    THANK_YOU DB 'Thank you.$'
    ;the addition stuffs
    FIRST_NUM_PROMPT DB 'Enter first addend: $'
    SECOND_NUM_PROMPT DB 'Enter second addend: $'
    add_first_out DB 'First addend is: $'
    add_second_out DB 'Second addend is: $'
    ;end of addition

    ;sub stuff
    ENTER_MIN DB 'Enter minued: $'
    ENTER_SUBTRAHEND DB 'Enter subtrahend: $'
    THE_MINUEND DB 'Minuend is: $'
    THE_SUBTRAHEND DB 'Subtrahend is: $'
    ;end subtrahend

    ;multiply stuff
    ENTER_MULTIPLICAND DB 'Enter multiplicand: $'
    ENTER_MULTIPLIER DB 'Enter multiplier: $'
    MULTIPLICAND_IS DB 'Multiplicand is: $'
    MULTIPLIER_IS DB 'Multiplier is $'
    ;multiply end 

    ;divide
    ENTER_DIVIDEND DB 'Enter dividend: $'
    ENTER_DIVISOR DB 'Enter divisor: $'
    DIVIDEND_IS DB 'Dividend is: $'
    DIVISOR_IS DB 'Divisor is: $'
    ;end 


    FIRST_NUM_MSG DB 'First number is: $'
    SECOND_NUM_MSG DB 'Second number is: $'
    NEWLINE DB 0DH, 0AH, '$'
    CHOICE DB ?
    NUM1 DB ?
    NUM2 DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display title and information

MENU_LOOP:

    ;colors
    mov ax, 3   ;
    int 10h     ;
    mov ah, 06h ;
    xor al, al  ;
    xor cx, cx  ;
    
   
    mov ch, 5   ; Row start       x1
    mov cl, 0   ; Column start    y1
    mov dh, 5  ; Row end         x2
    mov dl, 11  ; Column end      y2
    mov bh, 60h ; Color
    int 10h;

    mov ch, 6   ; Row start       x1
    mov cl, 0   ; Column start    y1
    mov dh, 6  ; Row end         x2
    mov dl, 14  ; Column end      y2
    mov bh, 20h ; Color
    int 10h;

    mov ch, 7   ; Row start       x1
    mov cl, 0   ; Column start    y1
    mov dh, 7  ; Row end         x2
    mov dl, 17  ; Column end      y2
    mov bh, 30h ; Color
    int 10h;

    mov ch, 8   ; Row start       x1
    mov cl, 0   ; Column start    y1
    mov dh, 8  ; Row end         x2
    mov dl, 11  ; Column end      y2
    mov bh, 50h ; Color
    int 10h;

    mov ch, 9   ; Row start       x1
    mov cl, 0   ; Column start    y1
    mov dh, 9  ; Row end         x2
    mov dl, 9  ; Column end      y2
    mov bh, 70h ; Color
    int 10h;

    LEA DX, TIT
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE

    LEA DX, CREATOR
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE

    LEA DX, DATE
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE

    ;end of colors


    ; Display menu
    CALL NEW_LINE
    LEA DX, MENU
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE

    

    LEA DX, OPTION1
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE

    LEA DX, OPTION2
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE

    LEA DX, OPTION3
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE

    LEA DX, OPTION4
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE

    LEA DX, OPTION5
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE

    ; Get user choice
    LEA DX, PROMPT
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV CHOICE, AL
    CALL NEW_LINE

    ; Process user choice
     CMP CHOICE, 'a'
    JNE NOT_ADDITION
    JMP FAR PTR ADDITION
NOT_ADDITION:
    CMP CHOICE, 's'
    JNE NOT_SUBTRACTION
    JMP FAR PTR SUBTRACTION
NOT_SUBTRACTION:
    CMP CHOICE, 'm'
    JNE NOT_MULTIPLICATION
    JMP FAR PTR MULTIPLICATION
NOT_MULTIPLICATION:
    CMP CHOICE, 'd'
    JNE NOT_DIVISION
    JMP FAR PTR DIVISION
NOT_DIVISION:
    CMP CHOICE, 'e'
    JNE NOT_EXIT
    JMP FAR PTR EXIT_PROGRAM
NOT_EXIT:
    ; Set cursor position
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12       ; Row
    MOV DL, 0       ; Column
    INT 10h

    ; Set color attribute (Red background, Blinking Yellow text)
    MOV AH, 09h
    MOV BL, 0CEh    ; 0xCE: 1100 1110
                    ; 1100 -> Blinking (1) and Red background (4)
                    ; 1110 -> Yellow text (14)
    MOV CX, 15      ; Length of "INVALID CHOICE" string
    INT 10h

    ; Display invalid choice message
    LEA DX, INVALID_MSG
    MOV AH, 09H
    INT 21H

    CALL NEW_LINE
    JMP FAR PTR THANK_YOU_MSG

ADDITION:
    CALL NEW_LINE
    
    ; Set cursor position
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12       ; Row
    MOV DL, 0       ; Column
    INT 10h

    ; Set color attribute (Yellow background, Black text)
    MOV AH, 09h
    MOV BL, 60h     ; Yellow (6) background, Black (0) text
    MOV CX, 8       ; Length of "Addition" string
    INT 10h

    LEA DX, ADD_MSG
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE
    CALL GET_NUMBERS_ADD
    JMP THANK_YOU_MSG

SUBTRACTION:
    CALL NEW_LINE
    
    ; Set cursor position
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12       ; Row
    MOV DL, 0       ; Column
    INT 10h

    ; Set color attribute (Green background, Black text)
    MOV AH, 09h
    MOV BL, 20h     ; Green (2) background, Black (0) text
    MOV CX, 11      ; Length of "Subtraction" string
    INT 10h

    LEA DX, SUB_MSG
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE
    CALL GET_NUMBERS_SUB
    JMP THANK_YOU_MSG

MULTIPLICATION:
    CALL NEW_LINE
    
    ; Set cursor position
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12       ; Row
    MOV DL, 0       ; Column
    INT 10h

    ; Set color attribute (Light Blue background, Black text)
    MOV AH, 09h
    MOV BL, 30h     ; Light Blue (3) background, Black (0) text
    MOV CX, 14      ; Length of "Multiplication" string
    INT 10h

    LEA DX, MUL_MSG
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE
    CALL GET_NUMBERS_MUL
    JMP THANK_YOU_MSG

DIVISION:
    CALL NEW_LINE
    
    ; Set cursor position
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12       ; Row
    MOV DL, 0       ; Column
    INT 10h

    ; Set color attribute (Red background, Black text)
    MOV AH, 09h
    MOV BL, 50h     ; Red (4) background, Black (0) text
    MOV CX, 8       ; Length of "Division" string
    INT 10h

    LEA DX, DIV_MSG
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE
    CALL GET_NUMBERS_DIV
    JMP THANK_YOU_MSG
EXIT_PROGRAM:

    ; Set cursor position
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12       ; Row
    MOV DL, 0       ; Column
    INT 10h

    ; Set color attribute (Light Blue background, Black text)
    MOV AH, 09h
    MOV BL, 70h     ; Light  (7) background, Black (0) text
    MOV CX, 12      ; Length of "Multiplication" string
    INT 10h

    LEA DX, EXIT_MSG
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE

THANK_YOU_MSG:
    CALL NEW_LINE
    LEA DX, THANK_YOU
    MOV AH, 09H
    INT 21H
    CALL NEW_LINE
    
    
    ; Check if user chose to exit
    CMP CHOICE, 'e'
    JE END_PROGRAM

    MOV AH, 4CH
    INT 21H

    ; If not exiting, loop back to menu
    ;JMP MENU_LOOP

END_PROGRAM:
    MOV AH, 4CH
    INT 21H

MAIN ENDP

NEW_LINE PROC
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    RET
NEW_LINE ENDP

GET_NUMBERS_ADD PROC
    ; Get first number
    LEA DX, FIRST_NUM_PROMPT
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV NUM1, AL
    CALL NEW_LINE

    ; Get second number
    LEA DX, SECOND_NUM_PROMPT
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV NUM2, AL
    CALL NEW_LINE

    ; Display first number
    LEA DX, add_first_out
    MOV AH, 09H
    INT 21H

    MOV DL, NUM1
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    CALL NEW_LINE

    ; Display second number
    LEA DX, add_second_out
    MOV AH, 09H
    INT 21H

    MOV DL, NUM2
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    CALL NEW_LINE

    RET
GET_NUMBERS_ADD ENDP

GET_NUMBERS_SUB PROC
    ; Get first number
    LEA DX, ENTER_MIN
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV NUM1, AL
    CALL NEW_LINE

    ; Get second number
    LEA DX, ENTER_SUBTRAHEND
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV NUM2, AL
    CALL NEW_LINE

    ; Display first number
    LEA DX, THE_MINUEND
    MOV AH, 09H
    INT 21H

    MOV DL, NUM1
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    CALL NEW_LINE

    ; Display second number
    LEA DX, THE_SUBTRAHEND
    MOV AH, 09H
    INT 21H

    MOV DL, NUM2
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    CALL NEW_LINE

    RET
GET_NUMBERS_SUB ENDP

GET_NUMBERS_MUL PROC
    ; Get first number
    LEA DX, ENTER_MULTIPLICAND
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV NUM1, AL
    CALL NEW_LINE

    ; Get second number
    LEA DX, ENTER_MULTIPLIER
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV NUM2, AL
    CALL NEW_LINE

    ; Display first number
    LEA DX, MULTIPLICAND_IS
    MOV AH, 09H
    INT 21H

    MOV DL, NUM1
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    CALL NEW_LINE

    ; Display second number
    LEA DX, MULTIPLIER_IS
    MOV AH, 09H
    INT 21H

    MOV DL, NUM2
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    CALL NEW_LINE

    RET
GET_NUMBERS_MUL ENDP

GET_NUMBERS_DIV PROC
    ; Get first number
    LEA DX, ENTER_DIVIDEND
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV NUM1, AL
    CALL NEW_LINE

    ; Get second number
    LEA DX, ENTER_DIVISOR
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV NUM2, AL
    CALL NEW_LINE

    ; Display first number
    LEA DX, DIVIDEND_IS
    MOV AH, 09H
    INT 21H

    MOV DL, NUM1
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    CALL NEW_LINE

    ; Display second number
    LEA DX, DIVISOR_IS
    MOV AH, 09H
    INT 21H

    MOV DL, NUM2
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    CALL NEW_LINE

    RET
GET_NUMBERS_DIV ENDP




END MAIN