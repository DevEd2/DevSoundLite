; ================================================================
; DevSound defines
; ================================================================

if !def(incDSDefines)
incDSDefines	set	1

; ================================================================

; Note values

C_2		equ	$00
C#2		equ	$01
D_2		equ	$02
D#2		equ	$03
E_2		equ	$04
F_2		equ	$05
F#2		equ	$06
G_2		equ	$07
G#2		equ	$08
A_2		equ	$09
A#2		equ	$0a
B_2		equ	$0b
C_3		equ	$0c
C#3		equ	$0d
D_3		equ	$0e
D#3		equ	$0f
E_3		equ	$10
F_3		equ	$11
F#3		equ	$12
G_3		equ	$13
G#3		equ	$14
A_3		equ	$15
A#3		equ	$16
B_3		equ	$17
C_4		equ	$18
C#4		equ	$19
D_4		equ	$1a
D#4		equ	$1b
E_4		equ	$1c
F_4		equ	$1d
F#4		equ	$1e
G_4		equ	$1f
G#4		equ	$20
A_4		equ	$21
A#4		equ	$22
B_4		equ	$23
C_5		equ	$24
C#5		equ	$25
D_5		equ	$26
D#5		equ	$27
E_5		equ	$28
F_5		equ	$29
F#5		equ	$2a
G_5		equ	$2b
G#5		equ	$2c
A_5		equ	$2d
A#5		equ	$2e
B_5		equ	$2f
C_6		equ	$30
C#6		equ	$31
D_6		equ	$32
D#6		equ	$33
E_6		equ	$34
F_6		equ	$35
F#6		equ	$36
G_6		equ	$37
G#6		equ	$38
A_6		equ	$39
A#6		equ	$3a
B_6		equ	$3b
C_7		equ	$3c
C#7		equ	$3d
D_7		equ	$3e
D#7		equ	$3f
E_7		equ	$40
F_7		equ	$41
F#7		equ	$42
G_7		equ	$43
G#7		equ	$44
A_7		equ	$45
A#7		equ	$46
B_7		equ	$47
rest	equ	$48

fix		equ	C_2

; Command definitions

SetInstrument		equ	$80
CallSection			equ	$81
Goto				equ	$82
PitchBendUp			equ	$83
PitchBendDown		equ	$84
SetSweep			equ	$85
SetPan				equ	$86
SetSpeed			equ	$87
SetInsAlternate		equ	$88
EnablePWM			equ	$89
Arp					equ	$8a
DummyCommand		equ	$8b
EndChannel			equ	$FF

; ================================================================

Instrument:		macro
	db	\1
	dw	\2,\3,\4,\5
	endm

Drum:			macro
	db	SetInstrument,\1,fix,\2
	endm

dbw:			macro
	db	\1
	dw	\2
	endm

; ================================================================

SECTION	"DevSound varialbes",WRAM0

GlobalVolume::		db
GlobalSpeed1::		db
GlobalSpeed2::		db
GlobalTimer::		db
TickCount::			db
SoundEnabled::		db

CH1Enabled::		db
CH2Enabled::		db
CH3Enabled::		db
CH4Enabled::		db

CH1Ptr::			dw
CH1VolPtr::			dw
CH1PulsePtr::		dw
CH1ArpPtr::			dw
CH1VibPtr::			dw
CH1RetPtr::			dw
CH1VolPos::			db
CH1PulsePos::		db
CH1ArpPos::			db
CH1VibPos::			db
CH1VibDelay::		db
CH1Tick::			db
CH1Reset::			db
CH1Note::			db
CH1Transpose::		db
CH1FreqOffset::		db
CH1Pan::			db
CH1Sweep::			db
CH1NoteCount::		db
CH1InsMode::		db
CH1Ins1::			db
CH1Ins2::			db

CH2Ptr::			dw
CH2VolPtr::			dw
CH2PulsePtr::		dw
CH2ArpPtr::			dw
CH2VibPtr::			dw
CH2RetPtr::			dw
CH2VolPos::			db
CH2PulsePos::		db
CH2ArpPos::			db
CH2VibPos::			db
CH2VibDelay::		db
CH2Tick::			db
CH2Reset::			db
CH2Note::			db
CH2Transpose::		db
CH2FreqOffset::		db
CH2Pan::			db
CH2NoteCount::		db
CH2InsMode::		db
CH2Ins1::			db
CH2Ins2::			db

CH3Ptr::			dw
CH3VolPtr::			dw
CH3WavePtr::		dw
CH3ArpPtr::			dw
CH3VibPtr::			dw
CH3RetPtr::			dw
CH3VolPos::			db
CH3WavePos::		db
CH3ArpPos::			db
CH3VibPos::			db
CH3VibDelay::		db
CH3Tick::			db
CH3Reset::			db
CH3Note::			db
CH3Transpose::		db
CH3FreqOffset::		db
CH3Vol::			db
CH3Wave::			db
CH3Pan::			db
CH3NoteCount::		db
CH3InsMode::		db
CH3Ins1::			db
CH3Ins2::			db

CH4Ptr::			dw
CH4VolPtr::			dw
CH4NoisePtr::		dw
CH4RetPtr::			dw
CH4VolPos::			db
CH4NoisePos::		db
CH4Mode::			db
CH4Tick::			db
CH4Reset::			db
CH4Transpose::		db
CH4Pan::			db
CH4NoteCount::		db
CH4InsMode::		db
CH4Ins1::			db
CH4Ins2::			db
DSVarsEnd:

WaveBuffer::		ds	16
WavePos::			db
WaveBufUpdateFlag::	db
PWMEnabled::		db
PWMVol::			db
PWMSpeed::			db
PWMTimer::			db
PWMDir::			db

ArpBuffer::			ds	8

endc
