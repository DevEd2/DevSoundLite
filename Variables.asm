; ================================================================
; Variables
; ================================================================

SECTION "Variables",WRAM0

; ================================================================
; Global variables
; ================================================================

GBType:             ds  1   ; current GB type (0 = DMG, 1 = GBC, 2 = GBA)
sys_btnHold:        ds  1   ; held buttons
sys_btnPress:       ds  1   ; pressed buttons
STMusID:            ds  1
RasterTime:         ds  1

