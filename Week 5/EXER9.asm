.model small
.stack 100
.data


    MAIN_123 DB '+-----------------------------------------------------+',13,10
        DB '|                    AUGUST 2024                      |',13,10
        DB '+-------+-------+-------+-------+-------+-------+-----+',13,10
        DB '|  SUN  |  MON  |  TUE  |  WED  |  THU  |  FRI  | SAT |',13,10
        DB '+-------+-------+-------+-------+-------+-------+-----+',13,10
        DB '|       |       |       |       |   1   |   2   |  3  |',13,10
        DB '+-------+-------+-------+-------+-------+-------+-----+',13,10
        DB '|   4   |   5   |   6   |   7   |   8   |   9   | 10  |',13,10
        DB '+-------+-------+-------+-------+-------+-------+-----+',13,10
        DB '|  11   |  12   |  13   |  14   |  15   |  16   | 17  |',13,10
        DB '+-------+-------+-------+-------+-------+-------+-----+',13,10
        DB '|  18   |  19   |  20   |  21   |  22   |  23   | 24  |',13,10
        DB '+-------+-------+-------+-------+-------+-------+-----+',13,10
        DB '|  25   |  26   |  27   |  28   |  29   |  30   | 31  |',13,10
        DB '+-------+-------+-------+-------+-------+-------+-----+',13,10,'$'
.CODE
start:
	mov ax, @data
	mov ds, ax

    lea dx, MAIN_123
    mov ah, 9
    int 21h
int 27h   ; terminate
end start ; end program