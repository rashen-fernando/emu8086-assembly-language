
;========================================================
;Description: Program of Project 1 calculating the average score.
;	 It is one of the assignment of the offline examination of  
;    assembly and interfacing class in spring semester 2022.
;Author:
;Student ID:
;Date:27th May 2022
;========================================================
;program notes:
;1. Please write a program to calculate the average score of
;	the following 3 score groups;
;2. The scores is saved in an array that can be found in the Data segment. 
;3. The first item in the score group array is the counts of score members
;	in the array, and the last item in the array should be used to save 
;	the average score. 
;4. A template that includes data segment definition is provided. Build 
;	your program with that template or create your own. 
;=====================================================
		.MODEL SMALL	
		.STACK 64	
		.DATA	
SCORETABLE1	DB	5, 90, 92, 96, 82, 94, 00
SCORETABLE2	DB	8, 70, 66, 83, 90, 92, 96, 82, 88, 00  
SCORETABLE3	DB	6, 55, 90, 88, 73, 62, 92, 00
		.CODE	
MAIN	PROC FAR	;this is the program entry point
		MOV AX, @DATA	;load the data segment address
		MOV DS, AX	;assign value to data segment register
		;======================================================   
		MOV SI,OFFSET SCORETABLE1                             ;LOAD THE ADDRESS OF SCORETABLE TO BX
		MOV CL,[SI]               ;STORE THE FIRST ELEMANT OF THE SCORETABLE TO CX(THE COUNT)
		MOV DL,[SI]
		MOV AX,0
		CALL AGAIN
		 
		
		
		MOV SI,OFFSET SCORETABLE2                             ;LOAD THE ADDRESS OF SCORETABLE TO BX
		
		MOV CL,[SI]               ;STORE THE FIRST ELEMANT OF THE SCORETABLE TO CX(THE COUNT)
		MOV DL,[SI]
		MOV AX,0
		CALL AGAIN
		
		
		MOV SI,OFFSET SCORETABLE3                             ;LOAD THE ADDRESS OF SCORETABLE TO BX
		MOV CL,[SI]               ;STORE THE FIRST ELEMANT OF THE SCORETABLE TO CX(THE COUNT)
		MOV DL,[SI]
		MOV AX,0
		CALL AGAIN
		
		MOV AH, 4CH	;set up to 
		INT 21H	;return to DOS
MAIN		ENDP		
		
		                  
AGAIN   PROC
        INC SI                                     
        ADD AL,[SI] 
        ADC AH,00                
        DEC CL                    
        JNE AGAIN
        MOV DH,0 
        MOV BX,DX
        SUB DX,DX 
        MOV AX,AX  
        DIV BX
        INC SI 
        MOV [SI],AL 
        RET
AGAIN       ENDP        
        ;=========================================================
	
		END MAIN	;this is the program exit point