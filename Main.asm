; ================================================================
; Hokey Pokey (GB version)
; ================================================================

; ================================================================
; Project includes
; ================================================================

include		"Variables.asm"
include		"Constants.asm"
include		"Macros.asm"
include		"hardware.inc"
;include	"rgbgrafx.inc"

; ================================================================
; Reset vectors (actual ROM starts here)
; ================================================================

SECTION	"Reset $38",ROM0[$38]
Trap:	jr	Trap

; ================================================================
; Interrupt vectors
; ================================================================

SECTION	"VBlank interrupt",ROM0[$40]
IRQ_VBlank:	reti

SECTION	"LCD STAT interrupt",ROM0[$48]
IRQ_STAT:	reti

SECTION	"Timer interrupt",ROM0[$50]
IRQ_Timer:	reti

SECTION	"Serial interrupt",ROM0[$58]
IRQ_Serial:	reti

SECTION	"Joypad interrupt",ROM0[$60]
IRQ_Joypad:	reti
	
; ================================================================
; System routines
; ================================================================

include		"SystemRoutines.asm"

; ================================================================
; ROM header
; ================================================================

SECTION	"ROM header",ROM0[$100]

EntryPoint:
	nop
	jp		ProgramStart

NintendoLogo:	; DO NOT MODIFY!!!
	db	$ce,$ed,$66,$66,$cc,$0d,$00,$0b,$03,$73,$00,$83,$00,$0c,$00,$0d
	db	$00,$08,$11,$1f,$88,$89,$00,$0e,$dc,$cc,$6e,$e6,$dd,$dd,$d9,$99
	db	$bb,$bb,$67,$63,$6e,$0e,$ec,$cc,$dd,$dc,$99,$9f,$bb,$b9,$33,$3e

ROMTitle:		db	"DEVSOUND LITE  "			; ROM title (11 bytes)
GBCSupport:		db	$80							; GBC support (0 = DMG only, $80 = DMG/GBC, $C0 = GBC only)
NewLicenseCode:	dw	0							; new license code (2 bytes)
SGBSupport:		db	0							; SGB support
CartType:		db	$19							; Cart type (MBC5 + RAM + Battery)
ROMSize:		db	0							; ROM size (handled by post-linking tool)
RAMSize:		db	0							; RAM size
DestCode:		db	1							; Destination code (0 = Japan, 1 = All others)
OldLicenseCode:	db	$33							; Old license code (if $33, check new license code)
ROMVersion:		db	0							; ROM version
HeaderChecksum:	ds	1							; Header checksum (handled by post-linking tool)
ROMChecksum:	ds	2							; ROM checksum (2 bytes) (handled by post-linking tool)

; ================================================================
; Start of program code
; ================================================================

ProgramStart:
	di
	ld		d,a
	ld		e,b
	
	xor		a
	ld		[rLCDC],a	; disable LCD
	call	ClearWRAM
	xor		a
	ld		bc,$8080
.clearloop
	ld		[c],a
	inc		c
	dec		b
	jr		nz,.clearloop
	
	ld		a,d
	cp		$11
	ld		a,0
	jr		nz,.settype
.gbc
	ld		a,1
	add		e
.settype
	ld		[GBType],a
	jr		ShowSoundTest

; ================================================================

Pal_Grayscale:
	RGB	31,31,31
	RGB	20,20,24
	RGB	10,10,12
	RGB	 0, 0, 0
Pal_GrayscaleInverted:
	RGB	15,15,20
	RGB	20,20,24
	RGB	10,10,12
	RGB	 0, 0, 0
	
; ================================================================

ShowSoundTest:
	call	DS_Stop
	CopyTileset1BPP	DebugFont,0,97
	ld		a,[GBType]
	and		a
	jr		nz,.gbc
	ld		a,%11100100
	ldh		[rBGP],a
	jr		.continue
.gbc
	call	DoubleSpeed
	ld		hl,Pal_Grayscale
	xor		a
	call	LoadPal
.continue
	ld		hl,SoundTestMap
	call	LoadScreenText
	ld		a,%10010001
	ldh		[rLCDC],a
	ld		a,IEF_VBLANK
	ldh		[rIE],a
	ei
	
.loop
	call	CheckInput
	ld		a,[sys_btnPress]
	bit		btnLeft,a
	jr		nz,.prevItem
	bit		btnRight,a
	jr		nz,.nextItem
	bit		btnA,a
	jr		nz,.playSong
	bit		btnB,a
	call	nz,DS_Stop
	
.done
	halt
	ld		hl,ST_MusIDPos
	ld		a,[STMusID]
	call	DrawHex
	ld		hl,ST_MusIDPos+32
	ld		a,[RasterTime]
	call	DrawHex
	ld		a,[GBType]
	and		a
	jr		z,.notgbc1
	ld		hl,Pal_GrayscaleInverted
	xor		a
	call	LoadPal
	jr		.continue2
.notgbc1
	ld		a,%11100101
	ldh		[rBGP],a
.continue2
	ld		hl,rLY
	xor		a
.waitline0
	cp		[hl]
	jr		nz,.waitline0
	call	DS_Play
	ld		a,[rLY]
	ld		[RasterTime],a
	
	ld		a,[GBType]
	and		a
	jr		z,.notgbc2
	call	WaitStat
	ld		hl,Pal_Grayscale
	xor		a
	call	LoadPal
	jr		.loop
.notgbc2
	ld		a,%11100100
	ldh		[rBGP],a
	jr		.loop
.nextItem
	ld		a,[STMusID]
	inc		a
	ld		[STMusID],a
	jr		.done
.prevItem
	ld		a,[STMusID]
	dec		a
	ld		[STMusID],a
	jr		.done
.playSong
	ld		a,[STMusID]
	call	DS_Init
	jr		.done
	
SoundTestMap:
;		 --------------------
	db	" DevSound Lite v1.0 "
	db	"      by DevEd      "
	db	"                    "
	db	"  Music ID:    $??  "
	db	"  Raster:      $??  "
	db	"                    "
	db	"                    "
	db	"                    "
	db	"                    "
	db	"                    "
	db	"                    "
	db	"                    "
	db	"                    "
	db	"                    "
	db	"                    "
	db	"                    "
	db	"                    "
	db	"                    "
	
; ================================================================

CopyTiles1BPP:
	ld		a,[hl+]			; get byte
	ld		[de],a			; write byte
	inc		de				; increment destination address
	ld		[de],a			; write tile byte
	inc		de				; increment destination address again
	dec		bc
	dec		bc				; since we're copying two bytes, we need to dec bc twice
	ld		a,b
	or		c
	jr		nz,CopyTiles1BPP
	ret
		
LoadScreenText:
	ld		de,_SCRN0
	ld		bc,$1214
.loop
	ld		a,[hl+]
	sub 	32	
	ld		[de],a
	inc		de
	dec		c
	jr		nz,.loop
	ld		c,$14
	ld		a,e
	add		$C
	jr		nc,.continue
	inc		d
.continue
	ld		e,a
	dec		b
	jr		nz,.loop
	ret
	
; INPUT:     a = palette number to load into (bit 7 for object palette)
;           hl = palette pointer
; DESTROYS:  b, de, hl
LoadPal:
    push    af
    and     15
    bit     3,a
    jr      nz,.obj
    add     a   ; x2
    add     a   ; x4
    add     a   ; x8
    set     7,a ; auto-increment
    ldh     [rBCPS],a
    rept    8
        ld      a,[hl+]
        ldh     [rBCPD],a
    endr
    pop     af
    ret
.obj
    add     a   ; x2
    add     a   ; x4
    add     a   ; x8
    set     7,a ; auto-increment
    ldh [rOCPS],a
    rept    8
        ld      a,[hl+]
        ldh     [rOCPD],a
    endr
    pop     af
    ret

; ================================================================

DebugFont:	incbin	"GFX/Font.bin"
	
; ================================================================
; Sound driver
; ================================================================

section	"Sound driver bank 1",romx,bank[1]
include "DevSound.asm"
