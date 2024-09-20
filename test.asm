.model small
.stack 100h
.data

    ; Table header (ASCII codes to create box-style table)
    tb db  218,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,194,196,196,196,196,191,13,10, '$'

    ; Row 1
    row1  db  179,' 1 ',179,' 1 ',179,' 2 ',179,' 3 ',179,' 4 ',179,' 5 ',179,' 6 ',179,' 7 ',179,' 8 ',179,' 9 ',179,' 10 ',179,13,10, '$'

    hi db 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,196,180,13,10, '$'
    ; Row 2
    row2  db 179,' 2 ',179,' 2 ',179,' 4 ',179,' 6 ',179,' 8 ',179,' 10',179,' 12',179,' 14',179,' 16',179,' 18',179,' 20 ',179,13,10,'$'

    hi1 db 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,196,180,13,10, '$'
    ; Row 3
    row3  db 179,' 3 ',179,' 3 ',179,' 6 ',179,' 9 ',179,' 12',179,' 15',179,' 18',179,' 21',179,' 24',179,' 27',179,' 30 ',179,13,10,'$'

    hi2 db 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,196,180,13,10, '$'
    ; Row 4
    row4  db 179,' 4 ',179,' 4 ',179,' 8 ',179,' 12',179,' 16',179,' 20',179,' 24',179,' 28',179,' 32',179,' 36',179,' 40 ',179,13,10,'$'

    hi3 db 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,196,180,13,10, '$'
    ; Row 5
    row5  db 179,' 5 ',179,' 5 ',179,' 10',179,' 15',179,' 20',179,' 25',179,' 30',179,' 35',179,' 40',179,' 45',179,' 50 ',179,13,10,'$'

    hi4 db 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,196,180,13,10, '$'
    ; Row 6
    row6  db 179,' 6 ',179,' 6 ',179,' 12',179,' 18',179,' 24',179,' 30',179,' 36',179,' 42',179,' 48',179,' 54',179,' 60 ',179,13,10,'$'

    hi5 db 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,196,180,13,10, '$'
    ; Row 7
    row7  db 179,' 7 ',179,' 7 ',179,' 14',179,' 21',179,' 28',179,' 35',179,' 42',179,' 49',179,' 56',179,' 63',179,' 70 ',179,13,10,'$'

    hi6 db 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,196,180,13,10, '$'
    ; Row 8
    row8  db 179,' 8 ',179,' 8 ',179,' 16',179,' 24',179,' 32',179,' 40',179,' 48',179,' 56',179,' 64',179,' 72',179,' 80 ',179,13,10,'$'

    hi7 db 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,196,180,13,10, '$'
    ; Row 9
    row9  db 179,' 9 ',179,' 9 ',179,' 18',179,' 27',179,' 36',179,' 45',179,' 54',179,' 63',179,' 72',179,' 81',179,' 90 ',179,13,10,'$'

    hi8 db 195,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,197,196,196,196,196,180,13,10, '$'
    ; Row 10
    row10 db 179,'10 ',179,' 10',179,' 20',179,' 30',179,' 40',179,' 50',179,' 60',179,' 70',179,' 80',179,' 90',179,'100 ',179,13,10,'$'

    ; Bottom border of the table
    row11 db 192,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,193,196,196,196,196,217,13,10,'$'
.code
main proc
    mov ax, @data           ; Set up data segment
    mov ds, ax

    ; Print header row
    mov ah, 09h
    lea dx, tb
    int 21h

    ; Print separator line
   

    ; Print each row
    lea dx, row1
    int 21h

    lea dx, hi
    int 21h

    lea dx, row2
    int 21h

    lea dx, hi1
    int 21h

    lea dx, row3
    int 21h

    lea dx, hi2
    int 21h

    lea dx, row4
    int 21h

    lea dx, hi3
    int 21h

    lea dx, row5
    int 21h

    lea dx, hi4
    int 21h

    lea dx, row6
    int 21h

    lea dx, hi5
    int 21h

    lea dx, row7
    int 21h

    lea dx, hi6
    int 21h

    lea dx, row8
    int 21h

    lea dx, hi7
    int 21h

    lea dx, row9
    int 21h

    lea dx, hi8
    int 21h

    lea dx, row10
    int 21h

    lea dx, row11
    int 21h

    ; Terminate program
    mov ah, 4Ch
    int 21h
main endp
end main
