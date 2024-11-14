ASSUME CS:CODE,DS:DATA

DATA SEGMENT
	M1 DB 10,13,"ENTER STRING: $"
	STRING DB 20,0
	M2 DB 10,13, "STRING IS PALINDROME $"
	M3 DB 10,13, "STRING IS NOT PALINDROME $"
DATA ENDS

PRTMSG MACRO MESSAGE
	LEA DX,MESSAGE
	MOV AH,09H
	INT 21H
ENDM

CODE SEGMENT
	START:
	MOV AX,DATA
	MOV DS,AX
	MOV ES,AX
	PRTMSG M1
	
	MOV AH,0AH
	LEA DX,STRING
	INT 21H
	
	MOV SI,OFFSET STRING+2
	MOV CL,[SI-1]
	DEC CL
	
	MOV DI,SI
	ADD SI,CX

PALINDROME:	MOV AL,[DI]
			MOV BL,[SI]
			CMP AL,BL
			JNE NOT_PALINDROME
			INC DI
			DEC SI
			CMP DI,SI
			JBE PALINDROME
			PRTMSG M2
			JMP DONE
NOT_PALINDROME:	PRTMSG M3
DONE:		MOV AH,4CH
			INT 21H
CODE ENDS
END START





















 