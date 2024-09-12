.model small
.stack 100h
.data
    ln0 db 32,218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,13,10, '$'
    ln1 db 32,179,"                  Cebu Institute of Technology - University                 ",179,13,10,'$'
    ln2 db 32,179,"                     VEHICLE STICKER APPLICATION FORM                       ",179,13,10,'$'
    ln3 db 32,179,"                       Please fill out form below.                          ",179,13,10,'$'
    ln4 db 32,179," Personnel Type:                     V   Vehicle Sticker Type:          V   ",179,13,10,'$'
    ln5 db 32,179," Name of Applicant/Driver:               ID Number:                         ",179,13,10,'$'
    ln6 db 32,179," Mobile Number:                          Adress:                            ",179,13,10,'$'
    ln7 db 32,179," Vehicle Make(s)/Brand:                  Plate Number:                      ",179,13,10,'$'
    ln8 db 32,179," Vehicle Color:                      V   Vehicle Type:                  V   ",179,13,10,'$'
    ln9 db 32,179,"                                                                            ",179,13,10,'$'
    ln10 db 32,179,"                                  SUBMIT                                    ",179,13,10,'$'
    ln11 db 32,179,"                                                                            ",179,13,10,'$'
    ln12 db 32,179,"                      Copyright 2024 CHRISTIAN A NEMENO                     ",179,13,10,'$'
    ln13 db 32,179,"                                                                            ",179,13,10,'$'
    ln14 db 32,179,"                                 Thank you!                                 ",179,13,10,'$'
    ln15 db 32,192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217,13,10, '$'
.code
main proc
    mov ax, @data           ; Set up data segment
    mov ds, ax


   
    mov ah, 09h
    ; Print each row
    lea dx, ln0
    int 21h

    lea dx, ln1
    int 21h

    lea dx, ln2
    int 21h  

    lea dx, ln3
    int 21h

    lea dx, ln4
    int 21h

    lea dx, ln5
    int 21h

    lea dx, ln6
    int 21h  

    lea dx, ln7
    int 21h

    
    lea dx, ln8
    int 21h

    
    lea dx, ln9
    int 21h

    
    lea dx, ln10
    int 21h

    lea dx, ln11
    int 21h

    
    lea dx, ln12
    int 21h

    
    lea dx, ln13
    int 21h

    
    lea dx, ln14
    int 21h

    lea dx, ln15
    int 21h
  
    
    

    ; Terminate program
    mov ah, 4Ch
    int 21h
main endp
end main
