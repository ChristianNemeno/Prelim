; EXAM2.ASM
; CS243 Lab Hands-on Exam No. 2
; First Semester SY 2024-2025
; Student Name: YOUR FULL NAME
; Date Finished: DATE_TODAY

.model small
.stack 100h
.data
    menu db 'THE CALCULATOR', 0dh, 0ah
         db 'Created by: CHRISTIAN A. NEMENO', 0dh, 0ah
         db 'Date: DATE_TODAY', 0dh, 0ah
         db 'Main Menu', 0dh, 0ah
         db 'a - Addition', 0dh, 0ah
         db 's - Subtraction', 0dh, 0ah
         db 'm - Multiplication', 0dh, 0ah
         db 'd - Division', 0dh, 0ah
         db 'e - Exit', 0dh, 0ah
         db 'Enter your choice: $'
    invalid_choice db 'INVALID CHOICE!', 0dh, 0ah, '$'
    addition_title db 0dh, 0ah, 'Addition', 0dh, 0ah, '$'
    subtraction_title db 0dh, 0ah, 'Subtraction', 0dh, 0ah, '$'
    multiplication_title db 0dh, 0ah, 'Multiplication', 0dh, 0ah, '$'
    division_title db 0dh, 0ah, 'Division', 0dh, 0ah, '$'
    exit_msg db 0dh, 0ah, 'Exit Program', 0dh, 0ah, '$'
    first_addend db 'Enter first addend: $'
    second_addend db 'Enter second addend: $'
    minuend db 'Enter minuend: $'
    subtrahend db 'Enter subtrahend: $'
    multiplicand db 'Enter multiplicand: $'
    multiplier db 'Enter multiplier: $'
    dividend db 'Enter dividend: $'
    divisor db 'Enter divisor: $'
    first_output db 'First addend is: $'
    second_output db 'Second addend is: $'
    minuend_output db 'Minuend is: $'
    subtrahend_output db 'Subtrahend is: $'
    multiplicand_output db 'Multiplicand is: $'
    multiplier_output db 'Multiplier is: $'
    dividend_output db 'Dividend is: $'
    divisor_output db 'Divisor is: $'
    thank_you db 'Thank you.$'
    input_buffer db 6, 0, 6 dup('$')

.code
main proc
    mov ax, @data
    mov ds, ax

start:
    ; Display the menu
    mov ah, 09h
    lea dx, menu
    int 21h
    
    ; Get user input
    mov ah, 01h
    int 21h
    
    
    ; Check user input
    cmp al, 'a'
    je addition
    cmp al, 's'
    je subtraction
    cmp al, 'm'
    je multiplication
    cmp al, 'd'
    je division
    cmp al, 'e'
    je exit_program
    
    ; Invalid choice
    
    lea dx, invalid_choice
    mov ah, 09h
    int 21h
    jmp thank_you_exit

addition:
    lea dx, addition_title
    lea si, first_addend
    lea di, second_addend
    lea bp, first_output
    lea bx, second_output
    jmp short operation

subtraction:
    lea dx, subtraction_title
    lea si, minuend
    lea di, subtrahend
    lea bp, minuend_output
    lea bx, subtrahend_output
    jmp short operation

multiplication:
    lea dx, multiplication_title
    lea si, multiplicand
    lea di, multiplier
    lea bp, multiplicand_output
    lea bx, multiplier_output
    jmp short operation

division:
    lea dx, division_title
    lea si, dividend
    lea di, divisor
    lea bp, dividend_output
    lea bx, divisor_output
    ; Fall through to operation

operation:
    mov ah, 09h
    int 21h
    
    ; First input
    mov dx, si
    call get_input
    push dx
    
    ; Second input
    mov dx, di
    call get_input
    push dx
    
    ; Display inputs
    mov dx, bp
    call display_input
    pop dx
    push dx
    mov dx, bx
    call display_input
    pop dx
    
thank_you_exit:
    call new_line
    lea dx, thank_you
    mov ah, 09h
    int 21h
    call new_line
    call new_line
    mov ah,4ch ; DOS terminate program function
    int 21h ; terminate the program
    
    ;this will enter a loop
    ;jmp start

exit_program:
    lea dx, exit_msg
    mov ah, 09h
    int 21h
    jmp thank_you_exit

main endp

get_input proc
    mov ah, 09h
    int 21h
    
    ; Read input
    mov ah, 0ah
    lea dx, input_buffer
    int 21h
    
    ; Null-terminate the input
    mov si, offset input_buffer + 1
    mov cl, [si]
    xor ch, ch
    inc si
    add si, cx
    mov byte ptr [si], '$'
    
    ; Return the input string address in dx
    lea dx, input_buffer + 2
    
    call new_line
    ret
get_input endp

display_input proc
    push dx
    mov ah, 09h
    int 21h
    pop dx
    mov ah, 09h
    int 21h
    call new_line
    ret
display_input endp

new_line proc
    mov ah, 02h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    ret
new_line endp

end main