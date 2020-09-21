; ================================================================
; Macros
; ================================================================

; ================================================================
; Global macros
; ================================================================

; Copy a 1BPP tileset to a specified VRAM address.
; USAGE: CopyTileset1BPP [tileset],[VRAM address],[number of tiles to copy]
; "tiles" refers to any tileset.
CopyTileset1BPP:	macro
	ld	bc,$10*\3		; number of tiles to copy
	ld	hl,\1			; address of tiles to copy
	ld	de,$8000+\2		; address to copy to
	call	CopyTiles1BPP
	endm	
	
; Defines a Game Boy Color RGB palette.
; USAGE: RGB    <red>,<green>,<blue>
RGB:            	macro
    dw      \1+(\2<<5)+(\3<<10)
    endm

; Wait for VRAM accessibility.
WaitForVRAM:            macro
    ldh     a,[rSTAT]
    and     2
    jr      nz,@-4
    endm

; ================================================================
; Project-specific macros
; ================================================================

; Insert project-specific macros here.
