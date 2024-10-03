; Filename: EXAM3.ASM
; CS243 Lab Hands-on Exam No. 3
; First Semester SY 2024-2025
; Student Name: YOUR FULL NAME
; Date Finished: Date Today

.MODEL SMALL
.STACK 100H
.DATA
    tit DB 'VOTER''S REGISTRATION FORM', 0DH, 0AH, '$'
    created_by DB 'Created by: YOUR FULL NAME', 0DH, 0AH, '$'
    date_today DB 'Date: Date Today', 0DH, 0AH, '$'
    
    prompt_fname DB 'First Name: $'
    prompt_mname DB 'Middle Name: $'
    prompt_lname DB 'Family Name: $'
    prompt_gender DB 'Gender: $'
    prompt_bday DB 'Birthday', 0DH, 0AH, '$'
    prompt_month DB 'Month: $'
    prompt_day DB 'Day: $'
    prompt_year DB 'Year: $'
    prompt_address DB 'Address', 0DH, 0AH, '$'
    prompt_house DB 'House Number: $'
    prompt_street DB 'Street: $'
    prompt_brgy DB 'Barangay: $'
    prompt_city DB 'City: $'
    prompt_province DB 'Province: $'
    prompt_edu DB 'Educational Background', 0DH, 0AH, '$'
    prompt_elem DB 'Elementary', 0DH, 0AH, '$'
    prompt_jhs DB 'Junior High School', 0DH, 0AH, '$'
    prompt_shs DB 'Senior High School', 0DH, 0AH, '$'
    prompt_college DB 'College', 0DH, 0AH, '$'
    prompt_school DB 'Name of School: $'
    prompt_year_grad DB 'Year Graduated: $'
    prompt_course DB 'Course: $'
    
    summary DB 'SUMMARY OF INFORMATION', 0DH, 0AH, '$'
    verify DB 'Please verify if all entries are correct.', 0DH, 0AH, '$'
    
    vote_wisely DB 'Vote wisely!$'
    thank_you DB 'Thank you for registering.', 0DH, 0AH, '$'
    
    fname DB 30 DUP('$')
    mname DB 30 DUP('$')
    lname DB 30 DUP('$')
    gender DB 10 DUP('$')
    birth_month DB 20 DUP('$')
    birth_day DB 5 DUP('$')
    birth_year DB 5 DUP('$')
    house_num DB 10 DUP('$')
    street DB 30 DUP('$')
    brgy DB 30 DUP('$')
    city DB 30 DUP('$')
    province DB 30 DUP('$')
    elem_school DB 50 DUP('$')
    elem_year DB 5 DUP('$')
    jhs_school DB 50 DUP('$')
    jhs_year DB 5 DUP('$')
    shs_school DB 50 DUP('$')
    shs_year DB 5 DUP('$')
    college_school DB 50 DUP('$')
    college_course DB 30 DUP('$')
    college_year DB 10 DUP('$')

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Set video mode (80x25 color text)
    MOV AH, 0
    MOV AL, 03h
    INT 10h

    ; Set background color (light blue)
    MOV AH, 0Bh
    MOV BH, 0
    MOV BL, 1
    INT 10h

    ; Display title and header
    CALL DISPLAY_HEADER

    ; Get user input
    CALL GET_USER_INPUT

    ; Display summary
    CALL DISPLAY_SUMMARY

    ; Display blinking "Vote wisely!" message
    CALL BLINK_MESSAGE

    ; Exit program
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

DISPLAY_HEADER PROC
    LEA DX, tit
    CALL PRINT_STRING
    LEA DX, created_by
    CALL PRINT_STRING
    LEA DX, date_today
    CALL PRINT_STRING
    RET
DISPLAY_HEADER ENDP

GET_USER_INPUT PROC
    ; First Name
    LEA DX, prompt_fname
    CALL PRINT_STRING
    LEA DX, fname
    CALL GET_STRING

    ; Middle Name
    LEA DX, prompt_mname
    CALL PRINT_STRING
    LEA DX, mname
    CALL GET_STRING

    ; Family Name
    LEA DX, prompt_lname
    CALL PRINT_STRING
    LEA DX, lname
    CALL GET_STRING

    ; Gender
    LEA DX, prompt_gender
    CALL PRINT_STRING
    LEA DX, gender
    CALL GET_STRING

    ; Birthday
    LEA DX, prompt_bday
    CALL PRINT_STRING

    LEA DX, prompt_month
    CALL PRINT_STRING
    LEA DX, birth_month
    CALL GET_STRING

    LEA DX, prompt_day
    CALL PRINT_STRING
    LEA DX, birth_day
    CALL GET_STRING

    LEA DX, prompt_year
    CALL PRINT_STRING
    LEA DX, birth_year
    CALL GET_STRING

    ; Address
    LEA DX, prompt_address
    CALL PRINT_STRING

    LEA DX, prompt_house
    CALL PRINT_STRING
    LEA DX, house_num
    CALL GET_STRING

    LEA DX, prompt_street
    CALL PRINT_STRING
    LEA DX, street
    CALL GET_STRING

    LEA DX, prompt_brgy
    CALL PRINT_STRING
    LEA DX, brgy
    CALL GET_STRING

    LEA DX, prompt_city
    CALL PRINT_STRING
    LEA DX, city
    CALL GET_STRING

    LEA DX, prompt_province
    CALL PRINT_STRING
    LEA DX, province
    CALL GET_STRING

    ; Educational Background
    LEA DX, prompt_edu
    CALL PRINT_STRING

    ; Elementary
    LEA DX, prompt_elem
    CALL PRINT_STRING
    LEA DX, prompt_school
    CALL PRINT_STRING
    LEA DX, elem_school
    CALL GET_STRING
    LEA DX, prompt_year_grad
    CALL PRINT_STRING
    LEA DX, elem_year
    CALL GET_STRING

    ; Junior High School
    LEA DX, prompt_jhs
    CALL PRINT_STRING
    LEA DX, prompt_school
    CALL PRINT_STRING
    LEA DX, jhs_school
    CALL GET_STRING
    LEA DX, prompt_year_grad
    CALL PRINT_STRING
    LEA DX, jhs_year
    CALL GET_STRING

    ; Senior High School
    LEA DX, prompt_shs
    CALL PRINT_STRING
    LEA DX, prompt_school
    CALL PRINT_STRING
    LEA DX, shs_school
    CALL GET_STRING
    LEA DX, prompt_year_grad
    CALL PRINT_STRING
    LEA DX, shs_year
    CALL GET_STRING

    ; College
    LEA DX, prompt_college
    CALL PRINT_STRING
    LEA DX, prompt_school
    CALL PRINT_STRING
    LEA DX, college_school
    CALL GET_STRING
    LEA DX, prompt_course
    CALL PRINT_STRING
    LEA DX, college_course
    CALL GET_STRING
    LEA DX, prompt_year_grad
    CALL PRINT_STRING
    LEA DX, college_year
    CALL GET_STRING

    RET
GET_USER_INPUT ENDP

DISPLAY_SUMMARY PROC
    LEA DX, summary
    CALL PRINT_STRING
    LEA DX, verify
    CALL PRINT_STRING

    ; Display all entered information
    LEA DX, prompt_fname
    CALL PRINT_STRING
    LEA DX, fname
    CALL PRINT_STRING
    CALL NEW_LINE

    LEA DX, prompt_mname
    CALL PRINT_STRING
    LEA DX, mname
    CALL PRINT_STRING
    CALL NEW_LINE

    LEA DX, prompt_lname
    CALL PRINT_STRING
    LEA DX, lname
    CALL PRINT_STRING
    CALL NEW_LINE

    LEA DX, prompt_gender
    CALL PRINT_STRING
    LEA DX, gender
    CALL PRINT_STRING
    CALL NEW_LINE

    LEA DX, prompt_bday
    CALL PRINT_STRING
    LEA DX, prompt_month
    CALL PRINT_STRING
    LEA DX, birth_month
    CALL PRINT_STRING
    CALL NEW_LINE
    LEA DX, prompt_day
    CALL PRINT_STRING
    LEA DX, birth_day
    CALL PRINT_STRING
    CALL NEW_LINE
    LEA DX, prompt_year
    CALL PRINT_STRING
    LEA DX, birth_year
    CALL PRINT_STRING
    CALL NEW_LINE

    LEA DX, prompt_address
    CALL PRINT_STRING
    LEA DX, prompt_house
    CALL PRINT_STRING
    LEA DX, house_num
    CALL PRINT_STRING
    CALL NEW_LINE
    LEA DX, prompt_street
    CALL PRINT_STRING
    LEA DX, street
    CALL PRINT_STRING
    CALL NEW_LINE
    LEA DX, prompt_brgy
    CALL PRINT_STRING
    LEA DX, brgy
    CALL PRINT_STRING
    CALL NEW_LINE
    LEA DX, prompt_city
    CALL PRINT_STRING
    LEA DX, city
    CALL PRINT_STRING
    CALL NEW_LINE
    LEA DX, prompt_province
    CALL PRINT_STRING
    LEA DX, province
    CALL PRINT_STRING
    CALL NEW_LINE

    LEA DX, prompt_edu
    CALL PRINT_STRING
    LEA DX, prompt_elem
    CALL PRINT_STRING
    LEA DX, prompt_school
    CALL PRINT_STRING
    LEA DX, elem_school
    CALL PRINT_STRING
    CALL NEW_LINE
    LEA DX, prompt_year_grad
    CALL PRINT_STRING
    LEA DX, elem_year
    CALL PRINT_STRING
    CALL NEW_LINE

    LEA DX, prompt_jhs
    CALL PRINT_STRING
    LEA DX, prompt_school
    CALL PRINT_STRING
    LEA DX, jhs_school
    CALL PRINT_STRING
    CALL NEW_LINE
    LEA DX, prompt_year_grad
    CALL PRINT_STRING
    LEA DX, jhs_year
    CALL PRINT_STRING
    CALL NEW_LINE

    LEA DX, prompt_shs
    CALL PRINT_STRING
    LEA DX, prompt_school
    CALL PRINT_STRING
    LEA DX, shs_school
    CALL PRINT_STRING
    CALL NEW_LINE
    LEA DX, prompt_year_grad
    CALL PRINT_STRING
    LEA DX, shs_year
    CALL PRINT_STRING
    CALL NEW_LINE

    LEA DX, prompt_college
    CALL PRINT_STRING
    LEA DX, prompt_school
    CALL PRINT_STRING
    LEA DX, college_school
    CALL PRINT_STRING
    CALL NEW_LINE
    LEA DX, prompt_course
    CALL PRINT_STRING
    LEA DX, college_course
    CALL PRINT_STRING
    CALL NEW_LINE
    LEA DX, prompt_year_grad
    CALL PRINT_STRING
    LEA DX, college_year
    CALL PRINT_STRING
    CALL NEW_LINE

    RET
DISPLAY_SUMMARY ENDP

BLINK_MESSAGE PROC
    MOV CX, 10  ; Blink 10 times

BLINK_LOOP:
    ; Display message
    MOV AH, 09h
    LEA DX, vote_wisely
    INT 21h

    ; Delay
    MOV AH, 86h
    MOV CX, 0Fh
    MOV DX, 4240h  ; 1 second delay
    INT 15h

    ; Clear message
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 23  ; Assuming message is on line 23
    MOV DL, 0
    INT 10h
    MOV AH, 09h
    LEA DX, thank_you
    INT 21h

    ; Delay
    MOV AH, 86h
    MOV CX, 0Fh
    MOV DX, 4240h  ; 1 second delay
    INT 15h

    LOOP BLINK_LOOP

    RET
BLINK_MESSAGE ENDP

PRINT_STRING PROC
    MOV AH, 09h
    INT 21h
    RET
PRINT_STRING ENDP

GET_STRING PROC
    MOV AH, 0Ah
    INT 21h
    CALL NEW_LINE
    RET
GET_STRING ENDP

NEW_LINE PROC
    MOV AH, 02h
    MOV DL, 0Dh
    INT 21h
    MOV DL, 0Ah
    INT 21h
    RET
NEW_LINE ENDP

END MAIN