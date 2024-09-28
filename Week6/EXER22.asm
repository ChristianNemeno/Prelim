; College Enrollment Form
; Filename: EXER22.ASM
; NAME: CHRISTIAN A NEMENO
; Date: September 20, 2024
; Description: This program implements a college enrollment form for CIT-U.
;              It collects student information and displays a summary.

.MODEL SMALL
.STACK 100H
.DATA
    ; Constants
    MAX_INPUT EQU 50
    
    ; Headers
    header1 DB 'Cebu Institute of Technology - University', 13, 10, '$'
    header2 DB 'STUDENT ENROLLMENT FORM', 13, 10, '$'
    header3 DB 'Please enter the following information:', 13, 10, '$'
    
    ; Prompts
    prompt_id DB 'Student ID Number: $'
    prompt_fname DB 'First Name: $'
    prompt_mname DB 'Middle Name: $'
    prompt_lname DB 'Last Name: $'
    prompt_address DB 'Address: $'
    prompt_course DB 'Course: $'
    prompt_year DB 'Year: $'
    prompt_bmonth DB 'Birthday Month: $'
    prompt_bday DB 'Birthday Day: $'
    prompt_byear DB 'Birthday Year: $'
    prompt_email DB 'Email Address: $'
    
    ; Summary headers
    summary_header DB 13, 10, 'SUMMARY', 13, 10, 'Please check if all information are correct.', 13, 10, '$'
    summary_id DB 'ID Number: $'
    summary_name DB 'Full Name: $'
    summary_address DB 'Address: $'
    summary_course DB 'Course & Year: $'
    summary_bday DB 'Birthday: $'
    summary_email DB 'Email Address: $'
    
    ; Footer
    footer1 DB 13, 10, 'Thank you for enrolling at CIT-U.', 13, 10, '$'
    footer2 DB 'Copyright 2024', 13, 10, '$'
    footer3 DB 'Programmer: Christian A Nemeno', 13, 10, '$'
    
    ; Input buffers
    id_num DB MAX_INPUT + 2 DUP('$')
    fname DB MAX_INPUT + 2 DUP('$')
    mname DB MAX_INPUT + 2 DUP('$')
    lname DB MAX_INPUT + 2 DUP('$')
    address DB MAX_INPUT + 2 DUP('$')
    course DB MAX_INPUT + 2 DUP('$')
    year DB MAX_INPUT + 2 DUP('$')
    bmonth DB MAX_INPUT + 2 DUP('$')
    bday DB MAX_INPUT + 2 DUP('$')
    byear DB MAX_INPUT + 2 DUP('$')
    email DB MAX_INPUT + 2 DUP('$')
    
    ; Utility
    newline DB 13, 10, '$'
    space DB ' $'
    comma DB ', $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display headers
    LEA DX, header1
    CALL print_string
    LEA DX, header2
    CALL print_string
    LEA DX, header3
    CALL print_string
    CALL print_newline
    
    ; Get user inputs
    LEA DX, prompt_id
    LEA BX, id_num
    CALL get_input
    
    LEA DX, prompt_fname
    LEA BX, fname
    CALL get_input
    
    LEA DX, prompt_mname
    LEA BX, mname
    CALL get_input
    
    LEA DX, prompt_lname
    LEA BX, lname
    CALL get_input
    
    LEA DX, prompt_address
    LEA BX, address
    CALL get_input
    
    LEA DX, prompt_course
    LEA BX, course
    CALL get_input
    
    LEA DX, prompt_year
    LEA BX, year
    CALL get_input
    
    LEA DX, prompt_bmonth
    LEA BX, bmonth
    CALL get_input
    
    LEA DX, prompt_bday
    LEA BX, bday
    CALL get_input
    
    LEA DX, prompt_byear
    LEA BX, byear
    CALL get_input
    
    LEA DX, prompt_email
    LEA BX, email
    CALL get_input
    
    ; Display summary
    LEA DX, summary_header
    CALL print_string
    
    LEA DX, summary_id
    CALL print_string
    LEA DX, id_num + 2
    CALL print_string
    CALL print_newline
    
    LEA DX, summary_name
    CALL print_string
    LEA DX, lname + 2
    CALL print_string
    LEA DX, comma
    CALL print_string
    LEA DX, fname + 2
    CALL print_string
    LEA DX, space
    CALL print_string
    LEA DX, mname + 2
    CALL print_string
    CALL print_newline
    
    LEA DX, summary_address
    CALL print_string
    LEA DX, address + 2
    CALL print_string
    CALL print_newline
    
    LEA DX, summary_course
    CALL print_string
    LEA DX, course + 2
    CALL print_string
    LEA DX, space
    CALL print_string
    LEA DX, year + 2
    CALL print_string
    CALL print_newline
    
    LEA DX, summary_bday
    CALL print_string
    LEA DX, bmonth + 2
    CALL print_string
    LEA DX, space
    CALL print_string
    LEA DX, bday + 2
    CALL print_string
    LEA DX, comma
    CALL print_string
    LEA DX, space
    CALL print_string
    LEA DX, byear + 2
    CALL print_string
    CALL print_newline
    
    LEA DX, summary_email
    CALL print_string
    LEA DX, email + 2
    CALL print_string
    CALL print_newline
    
    ; Display footer
    LEA DX, footer1
    CALL print_string
    LEA DX, footer2
    CALL print_string
    LEA DX, footer3
    CALL print_string
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; Procedure to print a string
print_string PROC
    MOV AH, 09H
    INT 21H
    RET
print_string ENDP

; Procedure to print a newline
print_newline PROC
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    RET
print_newline ENDP

; Procedure to get user input
get_input PROC
    PUSH AX
    
    CALL print_string  ; Print prompt
    
    MOV [BX], MAX_INPUT  ; Set max input length
    MOV AH, 0AH
    MOV DX, BX
    INT 21H
    
    ; Add $ terminator
    MOV AL, [BX+1]  ; Get actual input length
    XOR AH, AH
    ADD BX, AX
    MOV BYTE PTR [BX+2], '$'  ; Terminate string
    
    CALL print_newline
    
    POP AX
    RET
get_input ENDP

END MAIN