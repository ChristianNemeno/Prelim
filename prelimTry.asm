;Filename:
;Display numbers
;BEBEDOR, KAROL VINCENT, T.
;DATE: AUGUST 30, 2024
 
.model small
.stack 100h
.data
 
line db 80 dup (' ') , '$';
line20 db 19 dup (' '), '$'
line24 db 24 dup (' '), '$'
line27 db 27 dup (' '), '$'
line4 db 4 dup (' '), '$'
line13 db 13 dup (' '), '$'
line5 db 4 dup (' '), '$'
line9 db 12 dup (' '), '$'
line10 db 13 dup (' '), '$'
line1 db ' $'
line35 db 35 dup (' '), '$'
line100 db 10 dup(' '), '$'
line22 db 22 dup(' '), '$'
underline db 10 dup("_"), '$'
cit db " Cebu Institute of Technology - University", '$'
vehicle db "VEHICLE STICKER APPLICATION FORM", '$'
please db "Please fill out form below", '$'
pers db " Personnel Type:          $"
neme db " Name of Applicant/Driver:$"
mobi db " Mobile Number:           $"
Bran db " Vehicle Make(s)/Brand:   $"
Colo db " Vehicle Color:           $"
vbutton db "V", '$'
stic db "  Vehicle Sticker Type:    $"
IDnm db "  ID Number:               $"
adrs db "  Address:                 $"
Plat db "  Plate Nummber:           $"
VTyp db "  Vehicle Type:            $"
submit db "  SUBMIT  $"
thanks db "Thank you!$"
namers db "Copyright 2024 KAROL VINCENT BEBEDOR$"
.code
 
main proc
 
   
    mov ax, @data
    mov ds, ax
 
    ;
    mov ah, 00h
    mov al, 03h  
    int 10h
 
 
 
    mov ah, 09h
    mov bl, 47h ;color
    mov cx, 80
    int 10h
 
    ; Display the line of spaces
    mov ah, 09h   ;
    mov dx, offset line20
    int 21h
 
    mov ah, 09h   ;
    mov dx, offset cit
    int 21h
 
    mov ah, 09h   ;
    mov dx, offset line20
    int 21h
 
 
    mov ah, 09h
    mov bl, 47h ;color
    mov cx, 80
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line24
    int 21h
 
        mov ah, 09h   ;
    mov dx, offset vehicle
    int 21h
 
    mov ah, 09h   ;
    mov dx, offset line24
    int 21h
 
    mov ah, 09h
    mov bl, 4Eh ;color
    mov cx, 27
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line27
    int 21h
 
    mov ah,09h
    mov bl, 0CEh
    mov cx, 26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset please
    int 21h
 
    mov ah, 09h
    mov bl, 4Eh ;color
    mov cx, 27
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line27
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 80
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line ;newline
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset pers
    int 21h
 
    call boxv
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset stic
    int 21h
 
 
    call boxv
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  1
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line1
    int 21h
 
 
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 80
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset neme
    int 21h
   
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset IDnm
    int 21h
 
 
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  1
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line1
    int 21h
 
        mov ah, 09h
    mov bl, 70h ;color
    mov cx, 80
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset mobi
    int 21h
   
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset adrs
    int 21h
 
 
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  1
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line1
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 80
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset bran
    int 21h
   
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset plat
    int 21h
 
 
 
    call box
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  1
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line1
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 80
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset colo
    int 21h
   
    call boxv
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  26
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset VTyp
    int 21h
 
 
    call boxv
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx,  1
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line1
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 80
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 80
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line
    int 21h
 
 
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 35
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line35
    int 21h
 
 
    mov ah, 09h
    mov bl, 4Eh ;color
    mov cx, 10
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset submit
    int 21h
 
 
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 35
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line35
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 80
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 80
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 22
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line22
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 36
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset namers
    int 21h
 
    mov ah, 09h
    mov bl, 70h ;color
    mov cx, 22
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line22
    int 21h
 
    mov ah, 09h
    mov bl, 00h ;color
    mov cx, 35
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset line35
    int 21h
 
    mov ah, 09h
    mov bl, 08Eh ;color
    mov cx, 10
    int 10h
 
 
    mov ah, 09h   ;
    mov dx, offset thanks
    int 21h
 
    mov ah, 09h
    mov bl, 00h
    mov cx, 35
    int 10h
 
    mov ah, 09h
    mov dx, offset line35
    int 21h
 
 
    mov ah, 4Ch
    int 21h
 
 
 
main endp
 
 
box proc
    mov ah, 09h
    mov bl, 0Fh ;color
    mov cx, 10
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line10
    int 21h
    ret
box endp
 
boxv proc
    mov ah, 09h
    mov bl, 0Fh ;color
    mov cx, 9
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset line9
    int 21h
 
    mov ah, 09h
    mov bl, 4Eh ;color
    mov cx, 1
    int 10h
 
    mov ah, 09h   ;
    mov dx, offset vbutton
    int 21h
    ret
boxv endp
 
end main