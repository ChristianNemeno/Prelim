; Filename: EXER19.ASM
; Programmer Name: Christian A. Nemeno
; Date: 20/09/2024
; Description: This assembly language program Create a program that asks the user to input 3 characters.
;Then display each character on its own line.

.MODEL small
.STACK 200h
.DATA
 inputChar1 db ? ; variable to store the input character
 inputChar2 db ? ; variable to store the input character
 inputChar3 db ? ; variable to store the input character
 inputMsg1 db 'Enter first character: $'
 inputMsg2 db 13,10,'Enter second character: $'
 inputMsg3 db 13,10,'Enter third character: $'
 outputMsg1 db 13,10,'The first character is  $'
 outputMsg2 db 13,10,'The second character is $'
 outputMsg3 db 13,10,'The third character is  $'
.CODE
Main:
 ; initialize the data segment
 mov ax, @data
 mov ds, ax
 ; display the input prompt message
 mov dx,offset inputMsg1
 mov ah,09h
 int 21h

 ; read a character from the keyboard
 mov ah,01h ; function to read a character
 int 21h ; call DOS interrupt
 mov inputChar1,al ; store the character in inputChar

 ; display the input prompt message
 mov dx,offset inputMsg2
 mov ah,09h
 int 21h

 ; read a character from the keyboard
 mov ah,01h ; function to read a character
 int 21h ; call DOS interrupt
 mov inputChar2,al ; store the character in inputChar

 ; display the input prompt message
 mov dx,offset inputMsg3
 mov ah,09h
 int 21h

 ; read a character from the keyboard
 mov ah,01h ; function to read a character
 int 21h ; call DOS interrupt
 mov inputChar3,al ; store the character in inputChar



 ; display the output message
 mov dx,offset outputMsg1
 mov ah,09h
 int 21h

; display the character back
 mov dl, inputChar1 ; load the character to DL
 mov ah,02h ; function to display a character
 int 21h ; call DOS interrupt
 
mov dl, '.'    ; Load '.' into DL register
mov ah, 02h    ; DOS interrupt for printing a character
int 21h        ; Call DOS interrupt

 ; display the output message
 mov dx,offset outputMsg2
 mov ah,09h
 int 21h

; display the character back
 mov dl, inputChar2 ; load the character to DL
 mov ah,02h ; function to display a character
 int 21h ; call DOS interrupt

 mov dl, '.'    ; Load '.' into DL register
 mov ah, 02h    ; DOS interrupt for printing a character
 int 21h        ; Call DOS interrupt


 ; display the output message
 mov dx,offset outputMsg3
 mov ah,09h
 int 21h

; display the character back
 mov dl, inputChar3 ; load the character to DL
 mov ah,02h ; function to display a character
 int 21h ; call DOS interrupt

 mov dl, '.'    ; Load '.' into DL register
 mov ah, 02h    ; DOS interrupt for printing a character
 int 21h        ; Call DOS interrupt


 ; exit program
 mov ax,4C00h ; function to exit program
 int 21h
END Main