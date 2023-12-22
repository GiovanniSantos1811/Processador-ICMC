;Teste da instrução DJNZ 
loadn r6, #3
loadn r0, #'E'
loadn r5, #0

loop:
	outchar r0, r5 ;Printando na tela a letra E toda vez que passa nesse loop

	djnz r6, loop

halt