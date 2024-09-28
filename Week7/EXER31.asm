.model small
.stack 100h

.data
    prompt db 'Enter an integer: $'
    newline db 13, 10, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt
    lea dx, prompt
    mov ah, 9
    int 21h

    ; Read integer (assume single digit for simplicity)
    mov ah, 1
    int 21h
    sub al, '0'  ; Convert ASCII to number
    mov cl, al   ; Store the count in CL

    ; Print newline
    lea dx, newline
    mov ah, 9
    int 21h

    ; Initialize counter
    mov ch, 1    ; CH will be our loop counter, starting from 1

print_loop:
    ; Print current number
    mov dl, ch
    add dl, '0'  ; Convert number to ASCII
    mov ah, 2
    int 21h

    ; Print newline
    lea dx, newline
    mov ah, 9
    int 21h

    ; Increment counter
    inc ch

    ; Compare counter with input
    cmp ch, cl
    jle print_loop  ; If CH <= CL, continue loop

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main