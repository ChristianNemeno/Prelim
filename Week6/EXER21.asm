; College Enrollment Form
; Filename: EXER21.ASM
; NAME: CHRISTIAN A NEMENO
; Date: September 21, 2024
.MODEL small
.STACK 200h

.DATA

    MAXIMUM_STRING_LENGTH EQU 50   ; 50 bytes for each name (adjustable)
    
    FirstNamePrompt DB 'Enter First Name: $'
    MiddleNamePrompt DB 'Enter Middle Name: $'
    LastNamePrompt DB 'Enter Family Name: $'

    FirstNameInput DB MAXIMUM_STRING_LENGTH,?, MAXIMUM_STRING_LENGTH DUP (?)  ; 1st byte is max length, 2nd is actual length
    MiddleNameInput DB MAXIMUM_STRING_LENGTH,?, MAXIMUM_STRING_LENGTH DUP (?) ; Same structure for middle name
    LastNameInput DB MAXIMUM_STRING_LENGTH,?, MAXIMUM_STRING_LENGTH DUP (?)   ; Same structure for last name

    RegistrationTitle DB 'REGISTRATION FORM', 0dh, 0ah, '$'
    Namee DB 'Hello, $'
    Spacee DB ' $'   ; Space between names
    Ex DB '!$'       ; Exclamation mark for the greeting
    Newline DB 0dh, 0ah, '$' ; Carriage return + line feed for a newline

.CODE

ProgramStart:

    mov ax, @data
    mov ds, ax

    ; Display the title
    mov dx, OFFSET RegistrationTitle
    mov ah, 9
    int 21h

    ; First Name Input
    mov dx, OFFSET FirstNamePrompt
    mov ah, 9
    int 21h
    
    mov dx, OFFSET FirstNameInput
    mov ah, 0Ah              ; DOS function to input a string
    int 21h                  ; Get the first name
    call printNewline             ; Print a newline after the prompt

    ; Middle Name Input
    mov dx, OFFSET MiddleNamePrompt
    mov ah, 9
    int 21h
    
    mov dx, OFFSET MiddleNameInput
    mov ah, 0Ah              ; DOS function to input a string
    int 21h                  ; Get the middle name
    call printNewline             ; Print a newline after the prompt

    ; Last Name Input
    mov dx, OFFSET LastNamePrompt
    mov ah, 9
    int 21h
    
    mov dx, OFFSET LastNameInput
    mov ah, 0Ah              ; DOS function to input a string
    int 21h                  ; Get the last name
    call printNewline             ; Print a newline after the prompt

    ; Print "Hello, "
    mov dx, OFFSET Namee
    mov ah, 9
    int 21h

    ; Print First Name
    lea si, FirstNameInput+2    ; Point to the first character of the first name
    call printStringFromBuffer

    ; Print space
    mov dx, OFFSET Spacee
    mov ah, 9
    int 21h

    ; Print Middle Name
    lea si, MiddleNameInput+2   ; Point to the first character of the middle name
    call printStringFromBuffer

    ; Print space
    mov dx, OFFSET Spacee
    mov ah, 9
    int 21h

    ; Print Last Name
    lea si, LastNameInput+2     ; Point to the first character of the last name
    call printStringFromBuffer

    ; Print "!"
    mov dx, OFFSET Ex
    mov ah, 9
    int 21h

    ; Terminate the program
    mov ah, 4Ch
    int 21h


printStringFromBuffer PROC
    mov cx, [si-1]              ; Get the actual length of the string (stored in the 2nd byte)
    cmp cx, 0                   ; Check if the string is empty
    je donePrinting              ; If empty, skip printing

printLoop:
    lodsb                       ; Load byte from SI into AL
    cmp al, 0Dh                 ; Check for carriage return (Enter key)
    je donePrinting              ; If found, end the loop
    mov dl, al                  ; Move character to DL for printing
    mov ah, 02h                 ; DOS function to print a character
    int 21h                     ; Call DOS interrupt to print character
    loop printLoop              ; Repeat for all characters

donePrinting:
    ret
printStringFromBuffer ENDP

; Procedure to print a newline (carriage return + line feed)
printNewline PROC
    mov dx, OFFSET Newline
    mov ah, 9
    int 21h
    ret
printNewline ENDP

END ProgramStart
