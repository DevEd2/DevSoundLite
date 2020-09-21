; ================================================================
; Constants
; ================================================================

if !def(incConsts)
incConsts	set	1

; ================================================================
; Global constants
; ================================================================

sys_DMG		equ	0
sys_GBP		equ	1
sys_SGB		equ	2
sys_SGB2	equ	3
sys_GBC		equ	4
sys_GBA		equ	5

btnA		equ	0
btnB		equ	1
btnSelect	equ	2
btnStart	equ	3
btnRight	equ	4
btnLeft		equ	5
btnUp		equ	6
btnDown		equ	7

_A			equ	1
_B			equ	2
_Select		equ	4
_Start		equ	8
_Right		equ	16
_Left		equ	32
_Up			equ	64
_Down		equ	128

MenuItem1Scanline	equ	55

XFlip		equ	%00100000
YFlip		equ	%01000000

MenuCursor1X	equ	17
MenuCursor2X	equ	150

; SFX
SFX_Collect		equ	0
SFX_GotKey		equ	1
SFX_Pause		equ	2
SFX_Type		equ	3
SFX_Trill		equ	4
SFX_Denied		equ	5
SFX_Cursor		equ	6
SFX_Jump		equ	7
SFX_MenuSelect	equ	8
SFX_MenuBack	equ	9

mus_Title		equ	0
mus_Menu		equ	1
mus_Beach		equ	2
mus_Desert		equ	3
mus_Snow		equ	4
mus_City		equ	5
mus_Blocks		equ	6
mus_Credits		equ	7
mus_Gadunk		equ	8

; ================================================================
; Project-specific constants
; ================================================================

ST_MusIDPos			equ	$9870
ST_SFXIDPos			equ	$9890

HokeyOAMPos			equ	$14
PokeyOAMPos			equ	$18

KeyOAMPos			equ	$1c

FruitOAMPos			equ	$20
EnemyOAMPos			equ	$40

GoalOAMPos			equ	$60

HUDOverlayOAMPos	equ	$80

HitboxHeight		equ 7
HitboxWidth			equ 7

endc