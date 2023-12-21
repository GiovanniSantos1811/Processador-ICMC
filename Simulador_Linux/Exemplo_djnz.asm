; Hello World - Escreve mensagem armazenada na memoria na tela


; ------- TABELA DE CORES -------
; adicione ao caracter para Selecionar a cor correspondente

; 0 branco							0000 0000
; 256 marrom						0001 0000
; 512 verde							0010 0000
; 768 oliva							0011 0000
; 1024 azul marinho					0100 0000
; 1280 roxo							0101 0000
; 1536 teal							0110 0000
; 1792 prata						0111 0000
; 2048 cinza						1000 0000
; 2304 vermelho						1001 0000
; 2560 lima							1010 0000
; 2816 amarelo						1011 0000
; 3072 azul							1100 0000
; 3328 rosa							1101 0000
; 3584 aqua							1110 0000
; 3840 branco						1111 0000



jmp main

mensagem2 : string "Xupa federal!"

;---- Inicio do Programa Principal -----

main:
	; Esse codigo deve escrever Xupa federal! 3 vezes na tela usando djnz
	loadn r0, #0		; Posicao na tela onde a mensagem sera' escrita inicialmente
	loadn r6, #13
	loadn r7, #3        ; Se quiser aumentar o loop mude este registrador
	loop:
		loadn r1, #mensagem2	; Carrega r1 com o endereco do vetor que contem a mensagem
		loadn r2, #2816		    ; Seleciona a COR da Mensagem
		
		call Imprimestr
		add r0, r6, r0          ; Nova posicao para escrever
		; Aqui ele funciona usando dec r7 e dps jnz
		; Substitua essas duas linhas por djnz r7, loop onde r7 eh o registrador a ser decrementado em uma unidade e loop eh para onde queremos dar o jump
		; dec r7
		; jnz loop
		djnz r7, loop

	halt
	
;---- Fim do Programa Principal -----
	
;---- Inicio das Subrotinas -----
	
Imprimestr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

ImprimestrLoop:	
	loadi r4, r1
	cmp r4, r3
	jeq ImprimestrSai
	add r4, r2, r4
	outchar r4, r0
	inc r0
	inc r1
	jmp ImprimestrLoop
	
ImprimestrSai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
	
	
