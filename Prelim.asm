 
.MODEL SMALL
.STACK 100
.DATA
 
 
TEXT    db '                                                                            ', 0dh, 0ah
        db '                     Cebu Institute of Technology - University              ', 0dh, 0ah
        db '                         VEHICLE STICKER APPLICATION LETTER                 ', 0dh, 0ah
        db '                           Please fill out form below.                      ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '    Personnel Type:                    V  Vehicle Sticker Type:           V ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '    Name of Applicant/Driver:             ID Number:                        ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '    Mobile Number:                        Address:                          ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '    Vehicle Make(s)/Brand:                Plate Number:                     ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '    Vehicle Color:                     V  Vehicle Type:                   V ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                                     SUBMIT                                 ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                     Copyright 2024 CHRISTIAN A NEMENO                      ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                                                                            ', 0dh, 0ah
        db '                                   Thank You!                               ', 0dh, 0ah, '$'
 
.CODE
START:
    ; Setup for coloring the backgrounds and texts
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
 
 
    ; Print the Texts
    mov ax, @data
    mov ds, ax
    mov ah, 09h
    lea dx, text
    int 21h    
 
int 27h
END START