; Filename: EXER24.ASM
; Programmer Name: Christian A. Nemeno (Modified by Assistant)
; Date: 20/09/2024

; Description: This program prompts for user input and then displays a vehicle sticker application form with the entered data.

.model small
.stack 100h
.data
    ; Input prompts and form structure
    inputPrompt db 'Cebu Institute of Technology - University', 13, 10
                db 'VEHICLE STICKER APPLICATION FORM', 13, 10
                db 'Please enter the needed information:', 13, 10, 10, '$'
    promptPersonnelType db 'Personnel Type: $'
    promptApplicantName db 'Name of Applicant/Driver: $'
    promptMobileNumber db 'Mobile Number: $'
    promptCarMake db 'Vehicle Make(s)/Brand: $'
    promptCarColor db 'Vehicle Color: $'
    promptStickerType db 'Vehicle Sticker Type: $'
    promptIdNum db 'ID Number: $'
    promptAddress db 'Address: $'
    promptPlateNumber db 'Plate Number: $'
    promptCarType db 'Vehicle Type: $'

    menu db '                                                                         ', 13, 10
         db '                   Cebu Institute of Technology - University               ', 13, 10
         db '                       VEHICLE STICKER APPLICATION FORM                   ', 13, 10
         db '                        Please fill out the form below.                    ', 13, 10, 10
         db '   Personnel Type:                                                         ', 13, 10
         db '   Name of Applicant/Driver:                ID Number:                      ', 13, 10
         db '   Mobile Number:                           Address:                        ', 13, 10
         db '   Vehicle Make(s)/Brand:                   Plate Number:                   ', 13, 10
         db '   Vehicle Color:                           Vehicle Type:                   ', 13, 10
         db '   Vehicle Sticker Type:                                                    ', 13, 10, 10
         db '                                    SUBMIT                      ', 13, 10, 10
         db '                       Copyright 2024 Christian A Nemeno      ', 13, 10, 10, 10
         db '                                  Thank You!            ', 13, 10, '$'

    ; Buffers for storing user input (31 bytes for each field)
    personnelType db 31, 0, 31 dup(0)
    applicantName db 31, 0, 31 dup(0)
    mobileNumber db 31, 0, 31 dup(0)
    carMake db 31, 0, 31 dup(0)
    carColor db 31, 0, 31 dup(0)
    stickerType db 31, 0, 31 dup(0)
    idNum db 31, 0, 31 dup(0)
    address db 31, 0, 31 dup(0)
    plateNumber db 31, 0, 31 dup(0)
    carType db 31, 0, 31 dup(0)

    newline db 13, 10, '$'

.code

printString proc
    mov ah, 09h
    int 21h
    ret
printString endp

getInput proc
    mov ah, 0Ah
    int 21h
    ret
getInput endp

printNewline proc
    lea dx, newline
    call printString
    ret
printNewline endp

getUserInput proc
    ; Display input prompt
    lea dx, inputPrompt
    call printString

    ; Get personnelType
    lea dx, promptPersonnelType
    call printString
    lea dx, personnelType
    call getInput
    call printNewline

    ; Get applicantName
    lea dx, promptApplicantName
    call printString
    lea dx, applicantName
    call getInput
    call printNewline

    ; Get mobileNumber
    lea dx, promptMobileNumber
    call printString
    lea dx, mobileNumber
    call getInput
    call printNewline

    ; Get carMake
    lea dx, promptCarMake
    call printString
    lea dx, carMake
    call getInput
    call printNewline

    ; Get carColor
    lea dx, promptCarColor
    call printString
    lea dx, carColor
    call getInput
    call printNewline

    ; Get stickerType
    lea dx, promptStickerType
    call printString
    lea dx, stickerType
    call getInput
    call printNewline

    ; Get idNum
    lea dx, promptIdNum
    call printString
    lea dx, idNum
    call getInput
    call printNewline

    ; Get address
    lea dx, promptAddress
    call printString
    lea dx, address
    call getInput
    call printNewline

    ; Get plateNumber
    lea dx, promptPlateNumber
    call printString
    lea dx, plateNumber
    call getInput
    call printNewline

    ; Get carType
    lea dx, promptCarType
    call printString
    lea dx, carType
    call getInput
    call printNewline

    ret
getUserInput endp

printForm proc
    mov ax, 3   ;
    int 10h     ;
    mov ah, 06h ;
    xor al, al  ;
    xor cx, cx  ;
 
 
 
    ; Forms Grey background
    mov ch, 1   ; Row start       x1
    mov cl, 2   ; Column start    y1
    mov dh, 20  ; Row end         x2
    mov dl, 77  ; Column end      y2
    mov bh, 70h ; Color
    int 10h;
    
    ;ang red
    mov ch, 1   ; Row start       x1
    mov cl, 4   ; Column start    y1
    mov dh, 3  ; Row end         x2
    mov dl, 75  ; Column end      y2
    mov bh, 40h ; Color
    int 10h;

    ; first line input
    mov ch,5 ; r start
    mov cl,30; col start
    mov dh,5;   r end
    mov dl,38;  col end
    mov bh, 00h;
    int 10h

    ;FIRST LINE 2ND PART
    mov ch,5 ; r start
    mov cl,64; col start
    mov dh,5;   r end
    mov dl,74;  col end
    mov bh, 00h;
    int 10h

    ; ang v sa first line

    mov ch,5 ; r start
    mov cl,39; col start
    mov dh,5;   r end
    mov dl,39;  col end
    mov bh, 43h;
    int 10h

    mov ch,5 ; r start
    mov cl,74; col start
    mov dh,5;   r end
    mov dl,74;  col end
    mov bh, 43h;
    int 10h

    ;second line input

    mov ch,7 ; r start
    mov cl,30; col start
    mov dh,7;   r end
    mov dl,39;  col end
    mov bh, 00h;
    int 10h

    
    mov ch,7 ; r start
    mov cl,64; col start
    mov dh,7;   r end
    mov dl,74;  col end
    mov bh, 00h;
    int 10h

    ;third line input
    
    mov ch,9 ; r start
    mov cl,30; col start
    mov dh,9;   r end
    mov dl,39;  col end
    mov bh, 00h;
    int 10h

    mov ch,9 ; r start
    mov cl,64; col start
    mov dh,9;   r end
    mov dl,74;  col end
    mov bh, 00h;
    int 10h

    ;fourth line input
    
    mov ch,11 ; r start
    mov cl,30; col start
    mov dh,11;   r end
    mov dl,39;  col end
    mov bh, 00h;
    int 10h

    mov ch,11 ; r start
    mov cl,64; col start
    mov dh,11;   r end
    mov dl,74;  col end
    mov bh, 00h;
    int 10h

    ; fifth line

    mov ch,13 ; r start
    mov cl,30; col start
    mov dh,13;   r end
    mov dl,38;  col end
    mov bh, 00h;
    int 10h

    mov ch,13 ; r start
    mov cl,64; col start
    mov dh,13;   r end
    mov dl,74;  col end
    mov bh, 00h;
    int 10h
    
    ; ang v sa last line 

    mov ch,13 ; r start
    mov cl,39; col start
    mov dh,13;   r end
    mov dl,39;  col end
    mov bh, 43h;
    int 10h

    mov ch,13 ; r start
    mov cl,74; col start
    mov dh,13;   r end
    mov dl,74;  col end
    mov bh, 43h;
    int 10h
    
    mov ch, 22  ; Row start
    mov cl, 2   ; Column start
    mov dh, 22  ; Row end
    mov dl, 77  ; Column end
    mov bh, 08EH; Blinking red background yellow text
    int 10h
 
    ; Yellow Blinking Text "Please Fill Up The Form"
    mov ch, 3   ; Row start
    mov cl, 25  ; Column start
    mov dh, 3   ; Row end
    mov dl, 66  ; Column end
    mov bh, 0CEh; Blinking black background yellow text
    int 10h

    

    ; Print the form template
    mov ah, 09h
    lea dx, menu
    int 21h

    ; Now print the user inputs in the correct positions
    ; Personnel Type
    mov ah, 02h
    mov bh, 00h
    mov dh, 05h
    mov dl, 20
    int 10h
    lea dx, personnelType + 2
    call printString

    ; Applicant Name
    mov ah, 02h
    mov bh, 00h
    mov dh, 06h
    mov dl, 29
    int 10h
    lea dx, applicantName + 2
    call printString

    ; Mobile Number
    mov ah, 02h
    mov bh, 00h
    mov dh, 07h
    mov dl, 20
    int 10h
    lea dx, mobileNumber + 2
    call printString

    ; Car Make
    mov ah, 02h
    mov bh, 00h
    mov dh, 08h
    mov dl, 29
    int 10h
    lea dx, carMake + 2
    call printString

    ; Car Color
    mov ah, 02h
    mov bh, 00h
    mov dh, 09h
    mov dl, 20
    int 10h
    lea dx, carColor + 2
    call printString

    ; Sticker Type
    mov ah, 02h
    mov bh, 00h
    mov dh, 10h
    mov dl, 29
    int 10h
    lea dx, stickerType + 2
    call printString

    ; ID Number
    mov ah, 02h
    mov bh, 00h
    mov dh, 06h
    mov dl, 66
    int 10h
    lea dx, idNum + 2
    call printString

    ; Address
    mov ah, 02h
    mov bh, 00h
    mov dh, 07h
    mov dl, 66
    int 10h
    lea dx, address + 2
    call printString

    ; Plate Number
    mov ah, 02h
    mov bh, 00h
    mov dh, 08h
    mov dl, 66
    int 10h
    lea dx, plateNumber + 2
    call printString

    ; Car Type
    mov ah, 02h
    mov bh, 00h
    mov dh, 09h
    mov dl, 66
    int 10h
    lea dx, carType + 2
    call printString

    ret
printForm endp

main proc
    mov ax, @data
    mov ds, ax
   
    ; Get user input first
    call getUserInput

    ; Clear the screen
    mov ah, 00h
    mov al, 03h
    int 10h
    
    ; Display the form with entered data
    call printForm

    ; Move cursor to bottom of screen
    mov ah, 02h
    mov bh, 00h
    mov dh, 24
    mov dl, 0
    int 10h

    mov ax, 4C00h ; return 0
    int 21h  
main endp
end main
