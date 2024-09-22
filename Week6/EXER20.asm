; Filename: EXER20.ASM
; Programmer Name: Christian A. Nemeno
; Date: 21/09/2024
; Description: This assembly language program Create a program checks if its A if it is it then prints its A.
;if not then prints the character that was not A

.MODEL small
.STACK 100h
.DATA
 
inputPrompt db 'Enter a character: $'

IsMsg db 13,10,'Yes, you have entered letter A. $'

IsNot db 13,10,'No, you have not entered letter A. You entered character $'

inputChar db ? ; variable to store the input character

newline db 13, 10, '$' ; newline characters
 
.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax               ; set DS to point to data segment

    mov dx, OFFSET inputPrompt
    mov ah, 9               ; DOS print string function
    int 21h                 ; display input prompt

    mov ah, 01h             ; DOS function to read a character
    int 21h                 ; call DOS interrupt
    mov inputChar, al       ; store input character in inputChar

    cmp al, 'A'             ; check if input character is 'A'
    jz IsA                  ; jump to IsA if character is 'A'

    cmp al, 'a'
    jz IsA  
    ; If not 'A', go to IsNotA
    jmp IsNotA              ; jump to IsNotA if character is not 'A'
 
IsA:
    mov dx, OFFSET IsMsg    ; point to the "Yes" message
    jmp DisplayMessage      ; jump to display the message

IsNotA:
    mov dx, OFFSET IsNot    ; point to the "No" message
    call printString        ; print the "No" message
    mov dl, inputChar       ; load the input character into DL
    mov ah, 02h             ; DOS function to print a single character
    int 21h                 ; display the input character

    ; Print newline
    mov dx, OFFSET newline
    call printString        ; print newline

DisplayMessage:
    mov ah, 9               ; DOS print string function
    int 21h                 ; display message
    mov ah, 4Ch             ; DOS terminate program function
    int 21h                 ; terminate program

printString PROC
    mov ah, 09h             ; DOS print string function
    int 21h
    RET
printString ENDP

END ProgramStart
