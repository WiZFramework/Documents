JMP		entry
;	ここに将来boot関連の情報を記述
entry:
		MOV	AX, 0x07c0
		MOV	DS, AX
		mov	SS, AX
		mov	SI, msg
putloop:
		MOV	AL, [SI]
		ADD	SI, 1
		CMP	AL, 0
		JE	fin
		MOV	AH, 0x0e
		MOV	BX, 15
		INT	0x10
		JMP	putloop
fin:
		HLT
		JMP	fin
msg:
		DB	0x0a, 0x0a
		DB	"hello, projectOS"
		DB	0x0a
		DB	0    
times		510-($-$$) db 0
		db 0x55
		db 0xAA

