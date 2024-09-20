.MODEL small
.STACK 100h
.DATA
MAXIMUM_STRING_LENGTH EQU 1000
StringInput DB MAXIMUM_STRING_LENGTH DUP (?)
InputPrompt DB 'Enter text: $'
.CODE
ProgramStart:
 mov ax,@data
 mov ds,ax ; set DS to point to the data segment

 ; Set the cursor position
 ;mov ah,02h       ; BIOS function to set cursor position
 ;mov bh,0         ; Page number (0 for default)
 ;mov dh,20        ; Row (Y coordinate, starting from 0, so row 10 is actually the 11th row)
 ;mov dl,20        ; Column (X coordinate, starting from 0, so column 20 is actually the 21st column)
 ;int 10h          ; Call BIOS to set cursor position

 ; Display the input prompt at the new cursor position
 mov dx,OFFSET InputPrompt
 mov ah,9
 int 21h          ; Display the prompt

 ; Read string input from the user
 mov ah,3fh       ; DOS read from handle function
 mov bx,0         ; Standard input handle
 mov cx,MAXIMUM_STRING_LENGTH ; Read up to maximum number of characters
 mov dx,OFFSET StringInput ; Store the string here
 int 21h          ; Get the string

 ; Check if any characters were read
 and ax,ax        ; Were any characters read?
 jz Done          ; No, so you're done
 mov cx,ax        ; Put string length in CX
 push cx          ; Save the string length
 mov bx,OFFSET StringInput
 pop cx           ; Get back the string length
 mov ah,40h       ; DOS write to handle function
 mov bx,1         ; Standard output handle
 mov dx,OFFSET StringInput ; Prepare to print the string
 int 21h          ; Print the string

Done:
 mov ah,4ch       ; DOS terminate program function
 int 21h          ; Terminate the program
END ProgramStart
