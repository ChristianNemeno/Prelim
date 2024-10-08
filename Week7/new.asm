STACKSG SEGMENT STACK 'STACK'
DW 120 DUP(?)   ; RESERVE 240 BYTES FOR STACK
STACKSG ENDS

DATASG SEGMENT 'DATA'

CR EQU 0DH              ;CARRIAGE RETURN
LF EQU 0AH              ;LINE FEED

TEX DB 60 DUP('#')      ;THE USER INPUT STORE IN TEX. AT FIRST WE FILL IT WITH END SIGN ('#')
ASSCII_NUM DB 30 DUP(?) ;THIS IS WHERE THE RESULT WILL STORE AS ASSCII CODE
STDTEX  DW  20 DUP(0)   ;THIS IS WHERE THE STANDARD FORM OF USER INPUT WILL STORE
RESULT DW 10 DUP(0)     ;AND THIS IS WHERE THE RESULT OF INPUT WILL STORE

MENU DB 30 DUP(' ') , 0C9H , 14 DUP(0CDH)     , 0BBH , CR , LF          ;THIS IS THE MENU
     DB 30 DUP(' ') , 0BAH , 'C) CALCULATOR ' , 0BAH , CR , LF
     DB 30 DUP(' ') , 0BAH , 'G) GRAHPH     ' , 0BAH , CR , LF
     DB 30 DUP(' ') , 0BAH , 'A) ABOUT      ' , 0BAH , CR , LF
     DB 30 DUP(' ') , 0BAH , 'X) EXIT       ' , 0BAH , CR , LF
     DB 30 DUP(' ') , 0C8H , 14 DUP(0CDH)     , 0BCH , CR , LF , '$'

ABOUT DB 20 DUP(' ') , 0C9H , 42 DUP(0CDH)                                 , 0BBH , CR , LF     ;THIS IS THE ABOUT FORM
      DB 20 DUP(' ') , 0BAH , '        IN THE NAME OF GOD                ' , 0BAH , CR , LF
      DB 20 DUP(' ') , 0BAH , 'NAME    : SIMPLE CALCULATOR IN ASM        ' , 0BAH , CR , LF
      DB 20 DUP(' ') , 0BAH , 'AUTHOR  : ALIREZA DAVOUDI                 ' , 0BAH , CR , LF
      DB 20 DUP(' ') , 0BAH , 'DESC    :                                 ' , 0BAH , CR , LF
      DB 20 DUP(' ') , 0BAH , '         THIS IS A UNIVERSITY PROJECT OF  ' , 0BAH , CR , LF
      DB 20 DUP(' ') , 0BAH , '         ASSEMBLY PROGRAMMING LANGUAGE    ' , 0BAH , CR , LF
      DB 20 DUP(' ') , 0BAH , '                                          ' , 0BAH , CR , LF
      DB 20 DUP(' ') , 0BAH , 'ALL RIGHTS RESERVED TO ALIREZA DAVOUDI    ' , 0BAH , CR , LF
      DB 20 DUP(' ') , 0BAH , 'STUDENT OF PERSIAN GULF UNIVERSITY ,      ' , 0BAH , CR , LF
      DB 20 DUP(' ') , 0BAH , 'BUSHEHR ,                                 ' , 0BAH , CR , LF
      DB 20 DUP(' ') , 0BAH , 'IRAN                                      ' , 0BAH , CR , LF
      DB 20 DUP(' ') , 0C8H , 42 DUP(0CDH)                                 , 0BCH , CR , LF , '$'

CALCFORM DB 'INPUT  :                                        ' , CR , LF        ;THIS IS THE CALCULATOR FORM 
         DB 'RESULT :                                        ' , CR , LF        
         DB '                                                ' , CR , LF
         DB '   *  PRESS < ENTER > TO EXECUTE THAT STATEMENT ' , CR , LF
         DB '   *  PRESS < M > TO GO TO MENU                 ' , CR , LF , '$'

DATASG ENDS

CODESG SEGMENT 'CODE'
ASSUME SS: STACKSG , DS: DATASG , CS: CODESG

MAIN PROC FAR

    MOV AX , DATASG
    MOV DS , AX

    MENU_LOOP : CALL CLRSCR         ;CLEAR SCREEN

                MOV AH , 02H        ;MOVE CURSOR TO CENTER OF SCREEN
                MOV BH , 0
                MOV DH , 9          ;ROW
                MOV DL , 0          ;COL
                INT 10H

                MOV AH , 09H        ;SHOW MENU
                LEA DX , MENU       ;ON 
                INT 21H             ;SCREEN

                MOV AH , 7H         ;GET A CHAR 
                INT 21H             ;FROM USER AND PUT THAT IN AL

                CMP AL , 'c'        ;IF THE KEY IS 'C' GOTO CALCULATOR FORM
                JE CALC_LOOP_JMPR
                CMP AL , 'C'
                JE CALC_LOOP_JMPR

                CMP AL , 'g'        ;IF THE KEY IS 'G' GOTO GRAPH FORM
                JE GRAPH_LOOP_JMPR
                CMP AL , 'G'
                JE GRAPH_LOOP_JMPR

                CMP AL , 'a'        ;IF THE KEY IS 'A' GOTO ABOUT FORM
                JE ABOUT_LOOP_JMPR
                CMP AL , 'A'
                JE ABOUT_LOOP_JMPR

                CMP AL , 'x'        ;IF THE KEY IS 'X' THEN EXIT THE PROGRAM
                JE EXIT_JMPR
                CMP AL , 'X'
                JE EXIT_JMPR

                JMP MENU_LOOP       ;OTHERWISE STAY IN MENU

                CALC_LOOP_JMPR  : JMP CALC_LOOP
                GRAPH_LOOP_JMPR : JMP GRAPH_LOOP
                ABOUT_LOOP_JMPR : JMP ABOUT_LOOP
                EXIT_JMPR       : JMP EXIT

                CALC_LOOP : CALL CLRSCR         ;CLEAR SCREEN
                            CALL SETCUR         ;SET CURSOR TO ZERO

                            MOV AH , 09H        ;SHOW CALC FORM ON SCREEN 
                            LEA DX , CALCFORM   
                            INT 21H             

                            MOV AH , 02H        ;MOVE CURSOR TO ROW 0 AND COL 9 IN FRONT OF INPUT
                            MOV BH , 0
                            MOV DH , 0
                            MOV DL , 9
                            INT 10H

                            LEA SI , TEX        ;PUT THE ADDRESS OF TEX IN SI

                            GET_INPUT : MOV AH , 01H        ;GET A CHAR 
                                        INT 21H             ;FROM USER AND PUT THAT IN AL

                                        CMP AL , 0DH        ;COMPARE THAT WITH <ENTER>
                                        MOV BYTE PTR [SI] , '#' ;PUT END SIGN 
                                        JE RUN_STATEMENT    ;IF THE USER PRESSED ENTER EXECUTE STATEMENT

                                        CMP AL , 4DH        ;IF THE USER PRESS 'M' OR 'm'
                                        JE MENU_LOOP        ;IF NOT , THE USER PRESSED NUMBER OR SIGN
                                        CMP AL , 6DH        ;IF THATS EQUAL SO THE USER PRESSED 'M' OR 'm'
                                        JE MENU_LOOP

                                    NUMBER_SIGN :
                                        CMP AL , '0'        ;COMPARE THAT INPUT WITH '0' 
                                        JL CHECK_SIGN       ;IF THATS LOWER CHECK IF THATS A SIGN

                                        CMP AL , '9'        ;COMPARE THAT INPUT WITH '0' 
                                        JG CHECK_SIGN       ;IF THATS GREATER CHECK IF THATS A SIGN

                                        JMP PUT_CHAR        ;OTHERWISE THATS A NUMBER AND PUT THAT IN TEX

                                        CHECK_SIGN : CMP AL , '+'
                                                     JE PUT_CHAR

                                                     CMP AL , '-'
                                                     JE PUT_CHAR

                                                     CMP AL , '*'
                                                     JE PUT_CHAR

                                                     CMP AL , '/'
                                                     JE PUT_CHAR

                                                     CMP AL , '%'
                                                     JE PUT_CHAR

                                                     JMP CALC_LOOP  ;OTHERWISE THAT CHAR IS NOT VALID . SO CALL CALC_LOOP AGAIN

                                        PUT_CHAR : MOV [SI] , AL    ;PUT THE CHAR IN TEX
                                                   INC SI
                                                   JMP GET_INPUT    ;GET NEXT INPUT

                            RUN_STATEMENT : CALL MAKE_STD           ;MAKE USER INPUT STANDARD                      
                                            CALL CALCULATE          ;EXECUTE USER INPUT AND PUT THE RESULT IN 'RESULT' 
                                            CALL CONVERT_ASSCII     ;CONVERT RESULT TO ASSCII

                                            MOV AH , 02H        ;MOVE CURSOR TO ROW 1 AND COL 9 IN FRONT OF RESULT
                                            MOV BH , 0
                                            MOV DH , 1          ;ROW 1
                                            MOV DL , 9          ;COL 9
                                            INT 10H

                                            MOV AH , 09H        ;SHOW RESULT ON SCREEN 
                                            LEA DX , ASSCII_NUM 
                                            INT 21H

                                            MOV AH , 7H         ;WAIT FOR THE USER TO PRESS STH 
                                            INT 21H 

                                            JMP CALC_LOOP       ;JUMP TO CALCFORM


                GRAPH_LOOP : JMP MENU_LOOP

                ABOUT_LOOP : CALL CLRSCR            ;CLEAR SCREEN

                             MOV AH , 02H       ;MOVE CURSOR TO CENTER OF SCREEN
                             MOV BH , 0
                             MOV DH , 6         ;ROW
                             MOV DL , 0         ;COL
                             INT 10H

                             MOV AH , 09H           ;SHOW ABOUT FORM ON THE SCREEN 
                             LEA DX , ABOUT 
                             INT 21H

                             MOV AH , 7H            ;WAIT FOR THE USER TO PRESS STH 
                             INT 21H

                             JMP MENU_LOOP  

    EXIT :
    MOV AX , 4C00H
    INT 21H

MAIN ENDP

;THIS METHOD USE STDTEX TO CALCULATE THE RESULT
CALCULATE PROC NEAR


    LEA SI , STDTEX     ;INITILIZE SI WITH ADDRESS OF STDTEX
    LEA DI , RESULT     ;INITILIZE DI WITH ADDRESS OF RESULT

    MOV CX , '#'
    PUSH CX             ;PUT A '#' SIGN IN THE STACK THAT MEANS END OF STACK

    ;IN STDTEX THE FIRST WORD OF EVERY COUPLE OF WORDS IS NUMBER AND SECEOND WORD IS SIGN
NEXT_TWO_WORD : MOV AH , [SI]       ;MOV 
                INC SI              ;NUMBER
                MOV AL , [SI]       ;TO
                INC SI              ;AX

                MOV BH , [SI]       ;MOV 
                INC SI              ;SIGN
                MOV BL , [SI]       ;TO
                INC SI              ;BX

                MOV [DI] , AH       ;MOV THE NUMBER TO RESULT
                INC DI              ;ADD ONE TO DI
                MOV [DI] , AL       ;MOV THE NUMBER TO RESULT
                INC DI              ;ADD ONE TO DI

                POP CX              ;POP A SIGN FROM STACK
                PUSH CX             ;AT FIRST PUT THE END SIGN IN STACK

                CMP CL , '#'        ;COMPARE THE ONE POPED WITH '#' SIGN

                JNE NOT_EMPTY       ;IF THE STACK ISN'T EMPTY GOTO NOT_EMPTY
                ;OTHERWIZE THE STACK IS EMPTY

                CMP BL , '#'        ;COMPARE THE CURRENT SIGN WITH THE END SIGN ('#')
                JE FINISHED         ;IF THATS THE END SIGN GOTO FINISHED

                PUSH BX             ;PUSH THE CURRENT SIGN INTO STACK
                JMP NEXT_TWO_WORD   ;GOTO NEXT WORDS

            NOT_EMPTY : 
                    CMP BL , '#'    ;IF WE GOT END OF STATEMENT GOTO FINISHED 
                    JE FINISHED
                    NEXT_SIGN : POP CX          ;POP A SIGN FROM STACK
                                PUSH CX         ;PUSH THAT AGAIN INTO STACK
                                CMP CL , '#'    ;COMAPRE THAT SIGN WITH END SIGN
                                JE  END_SIGN    ;IF THEY WERE EQUAL GOTO END_SIGN

                                MOV AL , CL     ;PUT TOP OF STACK IN AL
                                MOV AH , BL     ;PUT CURRENT SIGN IN AH
                                CALL CMP_SIGN   ;CALL THIS METHOD TO INIT AL AND AH 

                                CMP AL , AH     ;COMPARE TWO SIGN
                                JGE RUN_STACK   ;IF STACK IS BIGGER , RUN AN STATEMENT FROM STACK AND STDTEX

                                JMP END_SIGN    ;OTHERWISE JUMP TO END_SIGN

                            RUN_STACK : DEC DI          ;MOVE 
                                        MOV AL , [DI]   ;SECOND 
                                        DEC DI          ;NUMBER 
                                        MOV AH , [DI]   ;TO AX

                                        DEC DI          ;MOVE 
                                        MOV DL , [DI]   ;FIRST 
                                        DEC DI          ;NUMBER 
                                        MOV DH , [DI]   ;TO DX

                                        POP CX

                                        CMP CL , '+'    ;IF CL IS PLUS 
                                        JE PLUS_SIGN    ;GOTO PLUS_SIGN

                                        CMP CL , '-'    ;IF CL IS MINE 
                                        JE MINE_SIGN    ;GOTO MINE_SIGN

                                        CMP CL , '*'    ;IF CL IS STAR
                                        JE MUL_SIGN     ;GOTO MUL_SIGN

                                        CMP CL , '/'    ;IF CL IS DIV
                                        JE DIV_SIGN     ;GOTO DIV_SIGN

                                        CMP CL , '%'    ;IF CL IS MOD
                                        JE MOD_SIGN     ;GOTO MOD_SIGN

                                        PLUS_SIGN : ADD DX , AX     ; DX = DX + AX
                                                    JMP PUT_RESULT  ;GOTO PUT_RESULT
                                        MINE_SIGN : SUB DX , AX     ; DX = DX - AX
                                                    JMP PUT_RESULT
                                        MUL_SIGN :  IMUL DX         ; DX:AX = AX * DX
                                                    MOV DX , AX     ;MOV THE RESULT TO DX
                                                    JMP PUT_RESULT
                                        DIV_SIGN :  XCHG AX , DX    ;EXCHANGE AX AND DX TO DIVIDE DX ON AX
                                                    MOV BP , DX     ;BECAUSE WE NEED DX IN DIVIDE WE MOVE IT TO BP
                                                    MOV DX , 0      ;SET DX ZERO
                                                    IDIV BP         ;AX = DX:AX / BP
                                                    MOV DX , AX     
                                                    JMP PUT_RESULT
                                        MOD_SIGN :  XCHG AX , DX    ;EXCHANGE AX AND DX TO DIVIDE DX ON AX
                                                    MOV BP , DX     ;BECAUSE WE NEED DX IN DIVIDE WE MOVE IT TO BP
                                                    MOV DX , 0      ;SET DX ZERO
                                                    IDIV BP         ;AX = DX:AX / BP    AND NOW DX IS REMINDER  
                                                    JMP PUT_RESULT

                                    PUT_RESULT : MOV [DI] , DH
                                                 INC DI
                                                 MOV [DI] , DL
                                                 INC DI
                                                 JMP NEXT_SIGN

                    END_SIGN : PUSH BX              ;PUSH THE SIGN INTO STACK
                               JMP NEXT_TWO_WORD    ;TAKE NEXT TWO WORDS


    FINISHED :  
           RUN_STACK2 : DEC DI          ;MOVE 
                        MOV AL , [DI]   ;SECOND 
                        DEC DI          ;NUMBER 
                        MOV AH , [DI]   ;TO AX

                        DEC DI          ;MOVE 
                        MOV DL , [DI]   ;FIRST 
                        DEC DI          ;NUMBER 
                        MOV DH , [DI]   ;TO DX

                        POP CX

                        CMP CL , '#'    ;IF THAT'S END OF STACK GOTO EXIT_CLACULATE 
                        JE EXIT_CLACULATE

                        CMP CL , '+'    ;IF CL IS PLUS 
                        JE PLUS_SIGN2   ;GOTO PLUS_SIGN

                        CMP CL , '-'    ;IF CL IS MINE 
                        JE MINE_SIGN2   ;GOTO MINE_SIGN

                        CMP CL , '*'    ;IF CL IS STAR
                        JE MUL_SIGN2    ;GOTO MUL_SIGN

                        CMP CL , '/'    ;IF CL IS DIV
                        JE DIV_SIGN2    ;GOTO DIV_SIGN

                        CMP CL , '%'    ;IF CL IS MOD
                        JE MOD_SIGN2    ;GOTO MOD_SIGN

                        PLUS_SIGN2 : ADD DX , AX        ; DX = DX + AX
                                     JMP PUT_RESULT2    ;GOTO PUT_RESULT
                        MINE_SIGN2 : SUB DX , AX        ; DX = DX - AX
                                     JMP PUT_RESULT2
                        MUL_SIGN2 :  MUL DX             ; DX:AX = AX * DX
                                     MOV DX , AX        ;MOV THE RESULT TO DX
                                     JMP PUT_RESULT2
                        DIV_SIGN2 :  XCHG AX , DX       ;EXCHANGE AX AND DX TO DIVIDE DX ON AX
                                     MOV BP , DX        ;BECAUSE WE NEED DX IN DIVIDE WE MOVE IT TO BP
                                     MOV DX , 0         ;SET DX ZERO
                                     DIV BP             ;AX = DX:AX / BP
                                     MOV DX , AX        
                                     JMP PUT_RESULT2
                        MOD_SIGN2 :  XCHG AX , DX       ;EXCHANGE AX AND DX TO DIVIDE DX ON AX
                                     MOV BP , DX        ;BECAUSE WE NEED DX IN DIVIDE WE MOVE IT TO BP
                                     MOV DX , 0         ;SET DX ZERO
                                     IDIV BP            ;AX = DX:AX / BP    AND NOW DX IS REMINDER  
                                     JMP PUT_RESULT2

                        PUT_RESULT2 :MOV [DI] , DH
                                     INC DI
                                     MOV [DI] , DL
                                     INC DI
                                     JMP RUN_STACK2
    EXIT_CLACULATE : 
    RET
CALCULATE ENDP

;COMPARE TWO SIGN WITH EACH OTHER 
;TO COMPARE TWO SIGN PUT FIRST SIGN IN AL AND
;SECOND SIGN IN AH . THEN RECIVE THE RESULT FROM
;AL AND AH
CMP_SIGN PROC NEAR

    CMP AL , '+'
    JE PLUS_SIGN_AL

    CMP AL , '-'
    JE MINE_SIGN_AL

    CMP AL , '*'
    JE MUL_SIGN_AL

    CMP AL , '/'
    JE DIV_SIGN_AL

    CMP AL , '%'
    JE MOD_SIGN_AL

    PLUS_SIGN_AL : MOV AL , 0
                   JMP NEXT_STEP
    MINE_SIGN_AL : MOV AL , 0
                   JMP NEXT_STEP
    MUL_SIGN_AL  : MOV AL , 1
                   JMP NEXT_STEP
    DIV_SIGN_AL  : MOV AL , 1
                   JMP NEXT_STEP
    MOD_SIGN_AL  : MOV AL , 1
                   JMP NEXT_STEP

    NEXT_STEP : 
        CMP AH , '+'
        JE PLUS_SIGN_AH

        CMP AH , '-'
        JE MINE_SIGN_AH

        CMP AH , '*'
        JE MUL_SIGN_AH

        CMP AH , '/'
        JE DIV_SIGN_AH

        CMP AH , '%'
        JE MOD_SIGN_AH

        PLUS_SIGN_AH : MOV AH , 0
                       JMP EXIT_PROC
        MINE_SIGN_AH : MOV AH , 0
                       JMP EXIT_PROC
        MUL_SIGN_AH  : MOV AH , 1
                       JMP EXIT_PROC
        DIV_SIGN_AH  : MOV AH , 1
                       JMP EXIT_PROC
        MOD_SIGN_AH  : MOV AH , 1
                       JMP EXIT_PROC        
    EXIT_PROC :     
    RET
CMP_SIGN ENDP

;MAKE STANDARD FORM FOR PROCCESSING , FROM THE USER INPUT
MAKE_STD PROC NEAR


    LEA SI , TEX            ;INITILIZE SI WITH ADDRESS OF TEX
    LEA DI , STDTEX         ;INITILIZE DI WITH ADDRESS OF STDTEX

NEXT_CHR :  MOV BL , [SI]   ;MOV NEXT CHAR TO BL

            CMP BL , '+'    ;IF THIS IS + 
            JE  PUTCHAR     ;PUT IT INTO STDTEX

            CMP BL , '-'    ;IF THIS IS - 
            JE  PUTCHAR     ;PUT IT INTO STDTEX

            CMP BL , '/'    ;IF THIS IS / 
            JE  PUTCHAR     ;PUT IT INTO STDTEX

            CMP BL , '*'    ;IF THIS IS * 
            JE  PUTCHAR     ;PUT IT INTO STDTEX

            CMP BL , '%'    ;IF THIS IS % 
            JE  PUTCHAR     ;PUT IT INTO STDTEX

            ;IF NON OF THOSE ABOVE HAPPENDED SO THIS IS A NUMBER
            ;IN THE BELOW LOOP WE WANT TO CONVERT THE ASSCII NUMBER
            ;TO THE REAL NUMBER

            MOV CX , 10     ;WE USE IT TO CONVERT A LONG ASSCII NUMBER TO REAL NUMBER
            MOV BX , 0
            MOV BP , 0      ;WE USE BP FOR SAVING THE CONVERTED NUMBER
        CONVERT_NEXT :  MOV BL , [SI]   ;MOV THE ASSCII CODE TO AL
                        SUB BL , 30H    ;CONVERT ASSCII CODE TO NUMBER
                        MOV BH , 0      ;MAKE SURE BX JUST HAS 8 BYTES

                        MOV AX , BP     ;MOV BP TO AX TO MULTIPLY IT BY 10
                        MUL CX          ;MULTIPLY AX BY CX  
                        MOV BP , AX     ;AFTERWARD MOV THE RESULT TO BP AGAIN

                        ADD BP , BX     ;ADD BP AND BL 

                        INC SI          ;INCREASE SI FOR GETTING NEXT CHAR
                        CMP BYTE PTR[SI] , '0'  ;COMPARE NEXT CHAR BY '0'
                        JL  PUTNUM      ;IF THE CHAR IS LOWER PUT BP IN STDTEX
                        CMP BYTE PTR[SI] , '9'  ;COMPARE NEXT CHAR BY '9'
                        JG  PUTNUM      ;IF THE CHAR IS GREATER PUT BP IN STDTEX

                        JMP CONVERT_NEXT;IF NON OF THOSE ABOVE JUMP HAPPENED GOTO NEXT CHAR

            PUTNUM :  MOV BX , BP
                      MOV [DI] , BH     ;PUT THE NUMBER THAT IS IN BP IN STDTEX
                      INC DI            ;INCREASE DI
                      MOV [DI] , BL
                      INC DI            ;INCREASE DI
                      JMP NEXT

            PUTCHAR : MOV BH , 0
                      MOV [DI] , BH     ;PUT THE SIGN THAT IS IN BX IN STDTEX
                      INC DI            ;INCREASE DI
                      MOV [DI] , BL
                      INC DI            ;INCREASE DI
                      INC SI            ;GOTO NEXT CHAR
                      JMP NEXT

            NEXT :    CMP BYTE PTR[SI] , '#'            ;CHECK IF GOT THE END OF STATEMENT
                      JNE NEXT_CHR              ;IF IT'S NOT END OF STATEMEENT GOTO NEXT_CHR 

    MOV BYTE PTR [DI] , 0       ;PUT '#' SIGN  
    INC DI                      ;AT THE END  
    MOV BYTE PTR [DI] , '#'     ;OF STDTEX

    ;END OF ALL LOOPS 
    ;NOW THE STANDARD FORM IS IN STDTEX


    RET             ;RETURN TO WHERE IT CALLS
MAKE_STD ENDP

CONVERT_ASSCII PROC NEAR

    MOV AH , BYTE PTR RESULT        ;MOVE FIRST TWO BYTE OF RESULT TO AX
    MOV AL , BYTE PTR RESULT + 1

    ;AT FIRST CHECK IF AX IS POSITIVE OR NEGETIVE
    TEST AX , 8000H                 ;CHECK THE LAST BIT . IF THATS 1 THEN AX IS NEG , OTHERWISE THATS POSITIVE
    MOV DI , 0                      ;AT FIRST SET OUR FLAG TO ZERO
    JZ AX_POSITIVE                  ;AX IS POSITIVE
    NEG AX                          ;CALCULATE NEGETIVE OF AX 
    MOV DI , 1                      ;DI INDICATES THAT AX IS NEG

AX_POSITIVE :
    MOV CX , 10
    LEA SI , ASSCII_NUM
    ADD SI , 29                     ;MOVE TO THE LAST SPACE

    MOV BP , 0                      ;THIS IS THE COUNTER OF CHARS

    ASSCII_LOOP : MOV DX , 0
                  DIV CX 
                  OR DL , 30H       ;MAKE REMINDER ASSCII
                  MOV [SI] , DL     ;PUT ASSCII IN ASSCII_NUM
                  DEC SI
                  INC BP            ;ADD ONE TO THE CHAR'S COUNTER
                  CMP AX , 0        ;IF AX > 0 GOTO 
                  JA ASSCII_LOOP    ;ASSCII_LOOP

    CMP DI , 0                      ;CHECK IF THAT WAS A NEGETIVE NUMBER
    JZ REST                         ;IF THATS NOT NEGETIVE GOTO REST
    MOV DL , '-'
    MOV [SI] , DL                   ;ADD A MINES SIGN TO THE STRING
    DEC SI
    INC BP

REST :
    LEA DI , ASSCII_NUM

    ;MOVE THE ASSCII CODE TO IT'S RIGHT PLCAE IN ASSCII_NUM
    ORDER_ASSCII : INC SI
                   MOV AL , BYTE PTR [SI] 
                   MOV BYTE PTR [DI] , AL
                   INC DI
                   DEC BP
                   CMP BP , 0
                   JA ORDER_ASSCII

    MOV CL , '$'           
    MOV BYTE PTR [DI] , CL          ;AT LAST PUT A DOLLOR SIGN AT THE END OF ASSCII_NUM

    RET
CONVERT_ASSCII ENDP

SETCUR PROC NEAR

    MOV AH , 02H        ;MOVE CURSOR TO ROW 0 AND COL 0
    MOV BH , 0
    MOV DH , 0          ;ROW
    MOV DL , 0          ;COL
    INT 10H

    RET
SETCUR ENDP

CLRSCR PROC NEAR
    MOV AX , 0600H
    MOV BH , 4H
    MOV CX , 0
    MOV DX , 184FH
    INT 10H
    RET
CLRSCR ENDP

CODESG ENDS
END MAIN
