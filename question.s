		AREA main, CODE, READONLY
		ENTRY
		ADR r1, STRING1                     ;use r1 as a pointer to string1
		ADR r2, STRING2                     ;use r2 as a pointer to string 2
		ADR r4, the                         ;load the address of the word 'the ' into r4,
		LDM r4, {r4}                        ;	then load the 4 corresponding bytes of data 
		ADR r5, theNull                     ;load the address of the word 'the\0' into r5,
		LDM r5, {r5}                        ;	then load the 4 corresponding bytes of data
		ADR r6, EoS                         ;store the address of the EoS character directly after string1

check	LDM r1, {r3}                        ;load the next 4 bytes of string1 into r3
		CMP r3, r5                          ;compare them to the word 'the\0'
		BEQ loop                            ;	if equal, this means that the last word is the, so we branch to the 
                                            ;	end of the program as we don't want to add it to string2 and we are done
		CMP r3, r4                          ;next compare the same 4 bytes from string1 to the word 'the '
		ADDEQ r1, #3                        ;	if equal, increment the pointer to string1 by 3 bytes, as we don't want
                                            ;	to copy the word to string2
		
nextch	CMP r1, r6                          ;compare the pointer to string1 to the EoS character
		BEQ loop                            ;if equal, we have reached the end of the string and are done
		CMP r3, #spce                       ;next, compare the previous byte in string1 to the space character
		BEQ check                           ;	if equal, branch to check to check if the next word is 'the ' or 'the\0'
		LDRB r3, [r1], #1                   ;load the next character of the string into r3, then increment the pointer to
                                            ;	string1 by one byte
		STRB r3, [r2], #1                   ;store the character from string1 in string2, then increment the pointer to
                                            ;	string2 by one byte
		b nextch                            ;and repeat
		
loop	b loop
		
		AREA main, DATA, READWRITE
STRING1 DCB "and the man said they must go"	;String1
EoS 	DCB 0x00                            ;end of string1
the		DCD 0x74686520                      ;'the ' in ascii hexadecimal
theNull	DCD 0x74686500                      ;'the\0' in ascii hexadecimal
spce	EQU 0x20                            ;space character in ascii hexadeciaml
STRING2 space 0x7F                          ;just allocating 127 bytes
		END