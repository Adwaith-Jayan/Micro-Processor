ASSUME CS:CODE, DS:DATA
DATA SEGMENT
	M1 DB 10,13, "ENTER FIRST NUMBER: $"
	M2 DB 10,13, "ENTER SECOND NUMBER: $"
	M3 DB 10,13, "SUM: $"
	SUM DB 03
DATA ENDS

PRTMSG MACRO MESSAGE
	LEA DX,MESSAGE
	MOV AH,09H
	INT 21H
ENDM

GETDCM MACRO
	MOV AH,01H
	INT 21H
	SUB AL,30H
ENDM

PRTDCM MACRO
	MOV AH,02H
	ADD DL,30H
	INT 21H
ENDM

CODE SEGMENT
	START:
	MOV AX,DATA
	MOV DS,AX
	PRTMSG M1
	GETDCM
	MOV BH,AL
	GETDCM
	MOV BL,AL
	PRTMSG M2
	GETDCM
	MOV CH,AL
	GETDCM
	MOV CL,AL
	ADD BL,CL
	MOV AL,BL
	MOV AH,00H
	AAA
	ADD BH,AH
	LEA SI,SUM
	MOV [SI],AL
	INC SI
	ADD BH,CH
	MOV AL,BH
	MOV AH,00H
	AAA
	MOV [SI],AL
	INC SI
	MOV [SI],AH
	PRTMSG M3
	MOV DL,[SI]
	PRTDCM
	DEC SI
	MOV DL,[SI]
	PRTDCM
	DEC SI
	MOV DL,[SI]
	PRTDCM
	MOV AH,4CH
	INT 21H
CODE ENDS
END START
	
	
	
	
	
	
	
	
	
	
			


















