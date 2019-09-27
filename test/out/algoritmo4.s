	.text
	.file	"algoritmo4.txt"
	.globl	main                    ; -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   ; @main
; %bb.0:                                ; %entry
	push	r8
	push	r9
	push	r10
	push	r11
	push	r12
	push	r13
	push	r14
	push	r15
	push	r16
	push	r17
	call	init
	ldi	r16, 0
	ldi	r17, 0
	ldi	r24, 232
	ldi	r25, 3
	movw	r12, r24
	ldi	r24, 255
	ldi	r25, 0
	movw	r8, r24
	rjmp	LBB0_2
LBB0_1:                                 ; %while_body
                                        ;   in Loop: Header=BB0_2 Depth=1
	ldi	r24, 8
	movw	r22, r16
	call	analogWrite
	ldi	r24, 9
	movw	r22, r16
	call	analogWrite
	ldi	r24, 7
	movw	r22, r16
	call	analogWrite
	movw	r14, r12
	movw	r22, r14
	movw	r24, r16
	call	delay
	ldi	r24, 8
	movw	r10, r8
	movw	r22, r10
	call	analogWrite
	ldi	r24, 9
	movw	r22, r10
	call	analogWrite
	ldi	r24, 7
	movw	r22, r10
	call	analogWrite
	movw	r22, r14
	movw	r24, r16
	call	delay
LBB0_2:                                 ; %while_cond
                                        ; =>This Inner Loop Header: Depth=1
	ldi	r24, 0
	cpi	r24, 0
	brne	LBB0_3
	rjmp	LBB0_1
LBB0_3:                                 ; %while_end
	ldi	r24, 0
	ldi	r25, 0
	pop	r17
	pop	r16
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        ; -- End function

	; Declaring this symbol tells the CRT that it should
	;copy all variables from program memory to RAM on startup
	.globl	__do_copy_data
	; Declaring this symbol tells the CRT that it should
	;clear the zeroed data section on startup
	.globl	__do_clear_bss
