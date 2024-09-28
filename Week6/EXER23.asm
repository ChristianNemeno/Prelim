; Automated Teller Machine (ATM) Main Menu
; Filename: EXER23.ASM
; Author: CHRISTIAN A NEMENO
; Date: September 20, 2024
; Description: This program displays an ATM main menu, gets user input,
;              and prints back the chosen option with its corresponding transaction.

.MODEL SMALL
.STACK 100H
.DATA
    ; Headers
    header1 DB 'Cebu Institute of Technology - University', 13, 10, '$'
    header2 DB 'Automated Teller Machine', 13, 10, '$'
    header3 DB 'Main Menu', 13, 10, '$'
    
    ; Menu items
    menu1 DB '1 Balance Inquiry', 13, 10, '$'
    menu2 DB '2 Withdrawal', 13, 10, '$'
    menu3 DB '3 Deposit', 13, 10, '$'
    menu4 DB '4 Transfer', 13, 10, '$'
    menu5 DB '5 Bills Payment', 13, 10, '$'
    menu6 DB '6 Change Pin', 13, 10, '$'
    menu7 DB '7 Exit', 13, 10, '$'
    
    ; Prompts
    prompt DB 'Enter number of your choice: $'
    response1 DB 'You have chosen $'
    response2 DB ' $'
    
    ; Transactions
    trans1 DB 'Balance Inquiry', '$'
    trans2 DB 'Withdrawal', '$'
    trans3 DB 'Deposit', '$'
    trans4 DB 'Transfer', '$'
    trans5 DB 'Bills Payment', '$'
    trans6 DB 'Change Pin', '$'
    trans7 DB 'Exit', '$'
    
    ; Footer
    footer1 DB 13, 10, 'Thank you for banking with us!', 13, 10, '$'
    footer2 DB 'Copyright 2024', 13, 10, '$'
    footer3 DB 'Programmer: Christian A Nemeno', 13, 10, '$'
    
    ; User input
    choice DB ?
    
    ; Utility
    newline DB 13, 10, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display headers
    LEA DX, header1
    CALL print_string
    LEA DX, header2
    CALL print_string
    LEA DX, header3
    CALL print_string
    CALL print_newline
    
    ; Display menu items
    LEA DX, menu1
    CALL print_string
    LEA DX, menu2
    CALL print_string
    LEA DX, menu3
    CALL print_string
    LEA DX, menu4
    CALL print_string
    LEA DX, menu5
    CALL print_string
    LEA DX, menu6
    CALL print_string
    LEA DX, menu7
    CALL print_string
    CALL print_newline
    
    ; Get user input
    LEA DX, prompt
    CALL print_string
    
    MOV AH, 01H
    INT 21H
    SUB AL, '0'  ; Convert ASCII to number
    MOV choice, AL
    
    CALL print_newline
    
    ; Display response
    LEA DX, response1
    CALL print_string
    
    MOV DL, choice
    ADD DL, '0'  ; Convert number back to ASCII
    MOV AH, 02H
    INT 21H
    
    LEA DX, response2
    CALL print_string
    
    ; Display corresponding transaction
    CMP choice, 1
    JE trans_1
    CMP choice, 2
    JE trans_2
    CMP choice, 3
    JE trans_3
    CMP choice, 4
    JE trans_4
    CMP choice, 5
    JE trans_5
    CMP choice, 6
    JE trans_6
    CMP choice, 7
    JE trans_7
    JMP invalid_choice

trans_1:
    LEA DX, trans1
    JMP print_trans
trans_2:
    LEA DX, trans2
    JMP print_trans
trans_3:
    LEA DX, trans3
    JMP print_trans
trans_4:
    LEA DX, trans4
    JMP print_trans
trans_5:
    LEA DX, trans5
    JMP print_trans
trans_6:
    LEA DX, trans6
    JMP print_trans
trans_7:
    LEA DX, trans7
    JMP print_trans

invalid_choice:
    LEA DX, trans7  ; Default to Exit for invalid choices
    
print_trans:
    CALL print_string
    CALL print_newline
    
    ; Display footer
    LEA DX, footer1
    CALL print_string
    LEA DX, footer2
    CALL print_string
    LEA DX, footer3
    CALL print_string
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; Procedure to print a string
print_string PROC
    MOV AH, 09H
    INT 21H
    RET
print_string ENDP

; Procedure to print a newline
print_newline PROC
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    RET
print_newline ENDP

END MAIN