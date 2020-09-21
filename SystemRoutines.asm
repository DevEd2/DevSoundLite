; ================================================================
; System routines
; ================================================================

; ================================================================
; Clear work RAM
; ================================================================

ClearWRAM:
	ld		hl,$c000
	ld		bc,$2000
	jr		ClearLoop	; routine continues in ClearLoop

; ================================================================
; Clear tilemap area
; ================================================================

ClearScreen:
	ld		hl,$9800
	ld		bc,$7ff
	jr		ClearLoop	; routine continues in ClearLoop
	
; ================================================================
; Clear video RAM
; ================================================================

ClearVRAM:
	ld		hl,$8000
	ld		bc,$1fff
	; fall through to ClearLoop

; ================================================================
; Clear a section of RAM
; ================================================================
	
ClearLoop:
	xor		a
	ld		[hl+],a
	dec		bc
	ld		a,b
	or		c
	jr		nz,ClearLoop
	ret

; ================================================================
; Wait for LCD status to change
; ================================================================

WaitStat:
.a	ld		a,[rSTAT]
	and		2
	jr		z,.a
.b	ld		a,[rSTAT]
	and		2
	jr		nz,.b
	ret
	
; ================================================================
; Check joypad input
; ================================================================

CheckInput:
	ld		a,P1F_5
	ld		[rP1],a
	ld		a,[rP1]
	ld		a,[rP1]
	cpl
	and		$f
	swap	a
	ld		b,a
	
	ld		a,P1F_4
	ld		[rP1],a
	ld		a,[rP1]
	ld		a,[rP1]
	ld		a,[rP1]
	ld		a,[rP1]
	ld		a,[rP1]
	ld		a,[rP1]
	cpl
	and		a,$f
	or		a,b
	ld		b,a
	
	ld		a,[sys_btnHold]
	xor		b
	and		b
	ld		[sys_btnPress],a
	ld		a,b
	ld		[sys_btnHold],a
	ld		a,P1F_5|P1F_4
	ld		[rP1],a
	ret

; ================================================================
; Draw hexadecimal number A at HL
; ================================================================

DrawHex:
	push	af
	swap	a
	call	.loop1
	pop		af
.loop1
	and		$f
	cp		$a
	jr		c,.loop2
	add		a,$7
.loop2
	add		a,$10
	ld		[hl+],a
	ret

; ================================================================	
; Switch between single and double speed mode
; ================================================================


DoubleSpeed:
    ldh     a,[rKEY1]
    bit     7,a         ; already in double speed?
    ret     nz          ; if yes, return
;   jr      DoSpeedSwitch

;NormalSpeed:
;   ldh     a,[rKEY1]
;   bit     7,a         ; already normal speed
;   ret     z           ; if yes, return
    ; fall through

DoSpeedSwitch:
    ld      a,%00110000
    ldh     [rP1],a
    xor     %00110001   ; a = %00000000
    ldh     [rKEY1],a   ; prepare speed switch
    stop
    ret