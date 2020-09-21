; ================================================================
; DevSound song data
; ================================================================
	
; =================================================================
; Song speed table
; =================================================================

SongSpeedTable:
	db	4,3			; triumph
	db	4,3			; insert title here (NOTE: Actual song name.)
	db	4,3			; beach
	db	4,5			; desert
	db	4,3			; snow
	
	
SongPointerTable:
	dw	PT_Triumph
	dw	PT_InsertTitleHere
	dw	PT_Beach
	dw	PT_Desert
	dw	PT_Snow

; =================================================================
; Volume sequences
; =================================================================

; Wave volume values
w0			=	%00000000
w1			=	%01100000
w2			=	%01000000
w3			=	%00100000

; For pulse instruments, volume control is software-based by default.
; However, hardware volume envelopes may still be used by adding the
; envelope length * $10.
; Example: $3F = initial volume $F, env. length $3
; Repeat that value for the desired length.
; Note that using initial volume $F + envelope length $F will be
; interpreted as a "table end" command, use initial volume $F +
; envelope length $0 instead.
; Same applies to initial volume $F + envelope length $8 which
; is interpreted as a "loop" command, use initial volume $F +
; envelope length $0 instead.

vol_Gadunk: 		db	15,5,10,5,2,6,10,15,12,6,10,7,8,9,10,15,4,3,2,1,$8f,0
vol_Arp:			db	8,8,8,7,7,7,6,6,6,5,5,5,4,4,4,4,3,3,3,3,3,2,2,2,2,2,2,1,1,1,1,1,1,1,1,0,$ff
vol_OctArp:			db	12,11,10,9,9,8,8,8,7,7,6,6,7,7,6,6,5,5,5,5,5,5,4,4,4,4,4,4,4,3,3,3,3,3,3,2,2,2,2,2,2,1,1,1,1,1,1,0,$ff
vol_HWEnvTest:		db	$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$77,$ff
vol_Bass1:			db	w3,$ff
vol_Bass2:			db	w3,w3,w3,w3,w1,$ff
vol_Bass3:			db	w3,w3,w3,w3,w3,w3,w3,w2,w2,w2,w2,w1,$ff
vol_PulseBass:		db	15,15,14,14,13,13,12,12,11,11,10,10,9,9,8,8,8,7,7,7,6,6,6,5,5,5,4,4,4,4,3,3,3,3,2,2,2,2,2,1,1,1,1,1,1,0,$ff

vol_Tom:			db	$1f,$ff
vol_WaveLeadShort:	db	w3,w3,w3,w3,w2,$ff
vol_WaveLeadMed:	db	w3,w3,w3,w3,w3,w3,w3,w2,$ff
vol_WaveLeadLong:	db	w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w2,$ff
vol_WaveLeadLong2:	db	w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w1,$ff
vol_Arp2:			db	$2f,$ff

vol_Kick:			db	$18,$ff
vol_Snare:			db	$1d,$ff
vol_OHH:			db	$48,$ff
vol_CymbQ:			db	$6a,$ff
vol_CymbL:			db	$3f,$ff

vol_Echo1:			db	8,$ff	
vol_Echo2:			db	3,$ff

vol_Triangle:		db	$16,$16,0,$ff
vol_SteelDrum:		db	w3,w3,w3,w3,w2,w2,w2,w2,w1,w1,w1,w1,w0,$ff
vol_WaveBass:		db	w3,w3,w3,w3,w3,w3,w3,w2,w2,w2,w2,w2,w2,w2,w1,w1,w1,w1,w1,w1,w1,w0,$ff
vol_BeachLead:		db	13,13,12,12,11,11,10,10,9,9,9,8,8,8,7,7,7,6,6,6,6,5,5,5,5,4,4,4,4,4,3,3,3,3,3,2,2,2,2,2,2,1,1,1,1,1,1,0,$ff
vol_BeachOct:		db	$3c,$ff

vol_DesertArp:		db	w3,w3,w3,w3,w3,w2,w2,w2,w2,w2,w1,$ff
vol_DesertLeadS:	db	w3,w3,w3,w3,w3
vol_DesertLeadF:	db	w2,w2,w2,w2,w2
					db	w1,$ff				
vol_DesertLeadL:	db	w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3
					db	w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3
					db	w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2
					db	w1,$ff
		
vol_TomEcho:		db	$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f
					db	$18,$18,$18,$18,$18,$18,$18,$18,$18
					db	$14,$14,$14,$14,$14,$14,$14,$14,$14
					db	$12,$12,$12,$12,$12,$12,$12,$12,$12
					db	$11,$11,$11,$11,$11,$11,$11,$11,$11
					db	$ff
					
vol_SnowBass:		db	$3f,$ff
vol_PWMLeadLong:	db	w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3
					db	w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3
					db	w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w3,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2
					db	w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2
					db	w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w2,w1,$ff

; =================================================================
; Arpeggio sequences
; =================================================================

arp_Gadunk: 	db	20,22,19,14,20,5,0,15,20,$ff
arp_Pluck059:	db	19,0,5,5,9,9,0,$80,1
arp_Pluck047:	db	19,0,4,4,7,7,0,$80,1
arp_Octave:		db	0,19,12,12,0,0,0,0,12,$80,2
arp_Pluck:		db	12,0,$ff
arp_Tom:		db	22,20,18,16,14,12,10,9,7,6,4,3,2,1,0,$ff
arp_TomEcho:	db	22,20,18,16,14,12,10,9,7,$80,0
arp_BeachOct:	db	12,12,0,0,$80,0

arp_940:		db	9,9,4,4,0,0,$80,0
arp_720:		db	7,7,2,2,0,0,$80,0
arp_520:		db	5,5,2,2,0,0,$80,0

; =================================================================
; Noise sequences
; =================================================================

; Noise values are the same as Deflemask, but with one exception:
; To convert 7-step noise values (noise mode 1 in deflemask) to a
; format usable by DevSound, take the corresponding value in the
; arpeggio macro and add s7.
; Example: db s7+32 = noise value 32 with step lengh 7
; Note that each noiseseq must be terminated with a loop command
; ($80) otherwise the noise value will reset!

s7 = $2d

noiseseq_Kick:	db	32,26,37,$80,2
noiseseq_Snare:	db	s7+29,s7+23,s7+20,35,$80,3
noiseseq_Hat:	db	41,43,$80,1

; =================================================================
; Pulse sequences
; =================================================================

pulse_Dummy:	db	0,$ff
pulse_Arp:		db	2,2,2,1,1,1,0,0,0,3,3,3,$80,0
pulse_OctArp:	db	2,2,2,1,1,2,$ff

pulse_Bass:		db	1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,0,0,0,0,0,0,$80,0
pulse_Square:	db	2,$ff
pulse_Arp2:		db	0,0,0,0,1,1,1,2,2,2,2,3,3,3,2,2,2,2,1,1,1,$80,0

pulse_BeachLead:	
	db	0,0,0,0,0,0,0,0,0,0
	db	1,1,1,1,1,1,1,1,1,1
	db	2,2,2,2,2,2,2,2,2,2
	db	3,3,3,3,3,3,3,3,3,3
	db	$80,0
	
pulse_BeachOct:
	db	2,2,1,1,0,0,$ff

pulse_DesertBass:	db	0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,$80,0

pulse_SnowBass:		db	1,$ff

; =================================================================
; Vibrato sequences
; Must be terminated with a loop command!
; =================================================================

vib_Dummy:		db	0,0,$80,1
vib_BeachLead:	db	8,1,1,2,2,1,1,0,0,-1,-1,-2,-2,-1,-1,0,0,$80,1
vib_PWMLead:	db	24,2,3,3,2,0,0,-2,-3,-3,-2,0,0,$80,1

; =================================================================
; Wave sequences
; =================================================================

WaveTable:
	dw	DefaultWave
	dw	wave_Bass
	dw	wave_PWMB
	dw	wave_SteelDrum
	dw	wave_DesertLead
	dw	wave_DesertSquare
	
wave_Bass:			db	$00,$01,$11,$11,$22,$11,$00,$02,$57,$76,$7a,$cc,$ee,$fc,$b1,$23
wave_SteelDrum:		db	$cf,$ee,$fe,$a7,$9d,$f9,$21,$15,$ae,$ed,$60,$16,$85,$10,$11,$03
wave_DesertLead:	db	$01,$23,$45,$67,$89,$ab,$cd,$ef,$ed,$b9,$75,$31,$02,$46,$8a,$ce
wave_DesertSquare:	db	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$00,$00,$00,$44,$44,$00,$00,$00
wave_PWMB:			db	$ff,$ff,$ff,$ff,$ff,$f0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

waveseq_Tri:		db	0,$ff
waveseq_Bass:		db	1,$ff
waveseq_PulseLead:	db	2,$ff
waveseq_SteelDrum:	db	3,$ff
waveseq_DesertLead:	db	4,$ff
waveseq_Square:		db	5,$ff
waveseq_WaveBuffer:	db	$fd,$ff

; =================================================================
; Instruments
; =================================================================

InstrumentTable:
	dw	ins_Gadunk
	dw	ins_Arp1
	dw	ins_Arp2
	dw	ins_OctArp
	dw	ins_Bass1
	dw	ins_Bass2
	dw	ins_Bass3
	dw	ins_GadunkWave
	
	dw	ins_Kick
	dw	ins_Snare
	dw	ins_CHH
	dw	ins_OHH
	dw	ins_CymbQ
	dw	ins_CymbL
	
	dw	ins_PulseBass
	dw	ins_Tom
	dw	ins_Arp
	dw	ins_WaveLeadShort
	dw	ins_WaveLeadMed
	dw	ins_WaveLeadLong
	dw	ins_WaveLeadLong2
	
	dw	ins_Echo1
	dw	ins_Echo2
	
	dw	ins_Tri
	dw	ins_SteelDrum
	dw	ins_BeachBass
	dw	ins_BeachLead
	dw	ins_BeachOctArp
	
	dw	ins_TomEcho
	dw	ins_DesertBass
	dw	ins_DesertLead
	dw	ins_DesertLeadF
	dw	ins_DesertLeadS
	dw	ins_DesertLeadL
	dw	ins_DesertOctArp
	dw	ins_DesertArp720
	dw	ins_DesertArp940
	dw	ins_DesertArp520
	
	dw	ins_PWMLead
	dw	ins_PWMLeadLong
	dw	ins_SnowBass

; Instrument format: [no reset flag],[wave mode (ch3 only)],[voltable id],[arptable id],[pulsetable/wavetable id],[vibtable id]
; note that wave mode must be 0 for non-wave instruments
; !!! REMEMBER TO ADD INSTRUMENTS TO THE INSTRUMENT POINTER TABLE !!!
ins_Gadunk:			Instrument	0,vol_Gadunk,arp_Gadunk,pulse_Dummy,vib_Dummy
ins_Arp1:			Instrument	0,vol_Arp,arp_Pluck059,pulse_Arp,vib_Dummy
ins_Arp2:			Instrument	0,vol_Arp,arp_Pluck047,pulse_Arp,vib_Dummy
ins_OctArp:			Instrument	0,vol_OctArp,arp_Octave,pulse_OctArp,vib_Dummy
ins_Bass1:			Instrument	0,vol_Bass1,arp_Pluck,waveseq_Bass,vib_Dummy
ins_Bass2:			Instrument	0,vol_Bass2,arp_Pluck,waveseq_Bass,vib_Dummy
ins_Bass3:			Instrument	0,vol_Bass3,arp_Pluck,waveseq_Bass,vib_Dummy
ins_GadunkWave:		Instrument	0,vol_Bass1,arp_Gadunk,waveseq_Tri,vib_Dummy
ins_Kick:			Instrument	0,vol_Kick,noiseseq_Kick,DummyTable,DummyTable	; pulse/waveseq and vibrato unused by noise instruments
ins_Snare:			Instrument	0,vol_Snare,noiseseq_Snare,DummyTable,DummyTable
ins_CHH:			Instrument	0,vol_Kick,noiseseq_Hat,DummyTable,DummyTable
ins_OHH:			Instrument	0,vol_OHH,noiseseq_Hat,DummyTable,DummyTable
ins_CymbQ:			Instrument	0,vol_CymbQ,noiseseq_Hat,DummyTable,DummyTable
ins_CymbL:			Instrument	0,vol_CymbL,noiseseq_Hat,DummyTable,DummyTable

ins_PulseBass:		Instrument	0,vol_PulseBass,arp_Pluck,pulse_Bass,vib_Dummy
ins_Tom:			Instrument	0,vol_Tom,arp_Tom,pulse_Square,vib_Dummy
ins_Arp:			Instrument	1,vol_Arp2,ArpBuffer,pulse_Arp2,vib_Dummy

ins_WaveLeadShort:	Instrument	0,vol_WaveLeadShort,arp_Pluck,waveseq_PulseLead,vib_Dummy
ins_WaveLeadMed:	Instrument	0,vol_WaveLeadMed,arp_Pluck,waveseq_PulseLead,vib_Dummy
ins_WaveLeadLong:	Instrument	0,vol_WaveLeadLong,arp_Pluck,waveseq_PulseLead,vib_Dummy
ins_WaveLeadLong2:	Instrument	0,vol_WaveLeadLong2,arp_Pluck,waveseq_PulseLead,vib_Dummy

ins_Echo1:			Instrument	0,vol_Echo1,DummyTable,pulse_Dummy,vib_Dummy
ins_Echo2:			Instrument	0,vol_Echo2,DummyTable,pulse_Dummy,vib_Dummy

ins_Tri:			Instrument	0,vol_Triangle,DummyTable,pulse_Square,vib_Dummy
ins_SteelDrum:		Instrument	0,vol_SteelDrum,arp_Pluck,waveseq_SteelDrum,vib_Dummy
ins_BeachBass:		Instrument	0,vol_WaveBass,arp_Pluck,waveseq_PulseLead,vib_Dummy
ins_BeachLead:		Instrument	1,vol_BeachLead,arp_Pluck,pulse_BeachLead,vib_BeachLead
ins_BeachOctArp:	Instrument	0,vol_BeachOct,arp_BeachOct,pulse_BeachOct,vib_Dummy

ins_TomEcho:		Instrument	0,vol_TomEcho,arp_TomEcho,pulse_Square,vib_Dummy
ins_DesertBass:		Instrument	0,vol_PulseBass,arp_Pluck,pulse_DesertBass,vib_Dummy

ins_DesertLead:		Instrument	0,vol_Bass1,arp_Pluck,waveseq_DesertLead,vib_BeachLead
ins_DesertLeadF:	Instrument	0,vol_DesertLeadF,DummyTable,waveseq_DesertLead,vib_Dummy
ins_DesertLeadS:	Instrument	0,vol_DesertLeadS,arp_Pluck,waveseq_DesertLead,vib_Dummy
ins_DesertLeadL:	Instrument	0,vol_DesertLeadL,arp_Pluck,waveseq_DesertLead,vib_BeachLead
ins_DesertOctArp:	Instrument	0,vol_DesertArp,arp_BeachOct,waveseq_Square,vib_BeachLead
ins_DesertArp720:	Instrument	0,vol_DesertArp,arp_720,waveseq_Square,vib_Dummy
ins_DesertArp940:	Instrument	0,vol_DesertArp,arp_940,waveseq_Square,vib_Dummy
ins_DesertArp520:	Instrument	0,vol_DesertArp,arp_520,waveseq_Square,vib_Dummy

ins_PWMLead:		Instrument	0,vol_WaveLeadLong2,arp_Pluck,waveseq_WaveBuffer,vib_PWMLead
ins_PWMLeadLong:	Instrument	0,vol_PWMLeadLong,arp_Pluck,waveseq_WaveBuffer,vib_PWMLead
ins_SnowBass:		Instrument	0,vol_SnowBass,arp_Pluck,pulse_SnowBass,vib_Dummy

_ins_Gadunk			equ	0
_ins_Arp1			equ	1
_ins_Arp2			equ	2
_ins_OctArp			equ	3
_ins_Bass1			equ	4
_ins_Bass2			equ	5
_ins_Bass3			equ	6
_ins_GadunkWave		equ	7
_ins_Kick			equ	8
_ins_Snare			equ	9
_ins_CHH			equ	10
_ins_OHH			equ	11
_ins_CymbQ			equ	12
_ins_CymbL			equ	13
_ins_PulseBass		equ	14
_ins_Tom			equ	15
_ins_Arp			equ	16
_ins_WaveLeadShort	equ	17
_ins_WaveLeadMed	equ	18
_ins_WaveLeadLong	equ	19
_ins_WaveLeadLong2	equ	20
_ins_Echo1			equ	21
_ins_Echo2			equ	22
_ins_Tri			equ	23
_ins_SteelDrum		equ	24
_ins_BeachBass		equ	25
_ins_BeachLead		equ	26
_ins_BeachOctArp	equ	27
_ins_TomEcho		equ	28
_ins_DesertBass		equ	29
_ins_DesertLead		equ	30
_ins_DesertLeadF	equ	31
_ins_DesertLeadS	equ	32
_ins_DesertLeadL	equ	33
_ins_DesertOctArp	equ	34
_ins_DesertArp720	equ	35
_ins_DesertArp940	equ	36
_ins_DesertArp520	equ	37
_ins_PWMLead		equ	38
_ins_PWMLeadLong	equ	39
_ins_SnowBass		equ	40

Kick				equ	_ins_Kick
Snare				equ	_ins_Snare
CHH					equ	_ins_CHH
OHH					equ	_ins_OHH
CymbQ				equ	_ins_CymbQ
CymbL				equ	_ins_CymbL
	
; =================================================================
	
PT_Triumph:
	dw	Triumph_CH1,Triumph_CH2,Triumph_CH3,Triumph_CH4
	
Triumph_CH1:
	db	SetInstrument,_ins_OctArp
	db	F_5,6,D#5,6,F_5,8,F_5,4,G#5,4,F_5,4,D#5,4,C#5,4,D#5,4,F_5,4,D#5,6,C#5,6,A#4,4
	db	C#5,20,A#4,4,C#5,4,D#5,4,F_5,6,F#5,6,F_5,4,C#5,8,D#5,8
	db	F_5,6,D#5,6,F_5,8,F_5,4,G#5,4,F_5,4,D#5,4,C#5,4,D#5,4,F_5,4,D#5,6,C#5,6,A#4,4
	db	C#5,20,C#5,4,D#5,4,C#5,4,A#5,6,B_5,6,A#5,4,F#5,8,G#5,8
	dbw	Goto,Triumph_CH1
	
Triumph_CH2:
	db	$80,1,G#4,6,G#4,6,G#4,12,G#4,4,G#4,4,$80,2,G#4,4,G#4,4,G#4,4,$80,1,G#4,4,$80,2,G#4,6,G#4,6,$80,1,G#4,4
	db	$80,2,B_4,6,B_4,6,B_4,12,$80,1,B_4,4,$80,2,B_4,4,F#4,4,F#4,4,F#4,4,$80,1,F#4,4,$80,2,F#4,6,$80,1,E_4,6,F#4,4
	db	$80,1,G#4,6,G#4,6,G#4,12,G#4,4,G#4,4,$80,2,G#4,4,G#4,4,G#4,4,$80,1,G#4,4,$80,2,G#4,6,G#4,6,$80,1,G#4,4
	db	$80,2,B_4,6,B_4,6,B_4,12,$80,1,B_4,4,$80,2,B_4,4,F#5,4,F#5,4,F#5,4,$80,1,F#5,4,$80,2,F#5,6,$80,1,E_5,6,F#5,4
	dbw	Goto,Triumph_CH2
	
Triumph_CH3:
	db	SetInstrument,_ins_Bass1
	db	C#3,4,C#4,2,$80,5,C#3,2,$80,4,G#3,4,C#4,4,C#3,4,$80,6,C#4,4,$80,4,G#3,4,C#4,4
	db	G#2,4,G#3,2,$80,5,G#2,2,$80,4,D#3,4,G#3,4,G#2,4,$80,6,G#3,4,$80,4,G#2,4,A#2,4
	db	B_2,4,B_3,2,$80,5,B_2,2,$80,4,F#3,4,B_3,4,B_2,4,$80,6,B_3,4,$80,4,C#4,4,B_3,4
	db	F#2,4,F#3,2,$80,5,F#2,2,$80,4,C#3,4,F#3,4,F#2,4,$80,6,F#3,4,$80,4,B_2,4,B_3,4
	dbw	Goto,Triumph_CH3
	
Triumph_CH4:
.block0
	Drum	CymbL,8
	Drum	Snare,4
	Drum	CHH,4
	Drum	Kick,4
	Drum	CHH,2
	db		fix,2
	Drum	Snare,4
	Drum	OHH,4
	Drum	Kick,4
	Drum	CHH,4
	Drum	Snare,4
	Drum	CHH,4
	Drum	Kick,4
	Drum	CHH,2
	db		fix,2
	Drum	Snare,4
	Drum	Kick,2
	Drum	CHH,2
	Drum	Kick,4
	Drum	CHH,4
	Drum	Snare,4
	Drum	CHH,4
	Drum	Kick,4
	Drum	CHH,2
	db		fix,2
	Drum	Snare,4
	Drum	OHH,4
	Drum	Kick,4
	Drum	CHH,4
	Drum	Snare,4
	Drum	CHH,4
	Drum	Kick,4
	Drum	CHH,2
	db		fix,2
	Drum	Snare,4
	Drum	Kick,2
	Drum	CHH,2
	dbw		Goto,.block1
	
.block1
	Drum	Kick,4
	Drum	CHH,4
	Drum	Snare,4
	Drum	CHH,4
	Drum	Kick,4
	Drum	CHH,2
	db		fix,2
	Drum	Snare,4
	Drum	OHH,4
	Drum	Kick,4
	Drum	CHH,4
	Drum	Snare,4
	Drum	CHH,4
	Drum	Kick,4
	Drum	CHH,2
	db		fix,2
	Drum	Snare,4
	Drum	Kick,2
	Drum	CHH,2
	Drum	Kick,4
	Drum	CHH,4
	Drum	Snare,4
	Drum	CHH,4
	Drum	Kick,4
	Drum	CHH,2
	db		fix,2
	Drum	Snare,4
	Drum	OHH,4
	Drum	Kick,4
	Drum	CHH,4
	Drum	Snare,4
	Drum	CHH,4
	Drum	Kick,4
	Drum	CHH,2
	db		fix,2
	Drum	Snare,4
	db		fix,2
	db		fix,2
	dbw		Goto,.block0
	
; =================================================================

PT_InsertTitleHere:	dw	InsertTitleHere_CH1,InsertTitleHere_CH2,InsertTitleHere_CH3,InsertTitleHere_CH4
	
InsertTitleHere_CH1:
	dbw	CallSection,.block0
	dbw	CallSection,.block0
.loop
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block1
	dbw	CallSection,.block1
	dbw	CallSection,.block1
	dbw	CallSection,.block1
	dbw	Goto,.loop

.block0
	db	$80,14,E_2,6,$80,15,fix,4,$80,14,E_2,6,E_3,2,$80,15,fix,4,$80,14,E_3,2
	db	$80,14,C_2,6,$80,15,fix,4,$80,14,C_2,6,C_3,2,$80,15,fix,4,$80,14,C_3,2
	db	$80,14,G_2,6,$80,15,fix,4,$80,14,G_2,6,G_3,2,$80,15,fix,4,$80,14,G_3,2
	db	$80,14,D#2,6,$80,15,fix,4,$80,14,D#2,6,D#3,2,$80,15,fix,4,$80,14,D#3,2
	ret
.block1
	db	$80,14,F#2,6,$80,15,fix,4,$80,14,F#2,6,F#3,2,$80,15,fix,4,$80,14,F#3,2
	db	$80,14,D_2,6,$80,15,fix,4,$80,14,D_2,6,D_3,2,$80,15,fix,4,$80,14,B_2,2
	db	$80,14,A_2,6,$80,15,fix,4,$80,14,A_2,6,A_3,2,$80,15,fix,4,$80,14,A_3,2
	db	$80,14,F_2,6,$80,15,fix,4,$80,14,F_2,6,F_3,2,$80,15,fix,4,$80,14,C#3,2
	ret
	
InsertTitleHere_CH2:
	db	SetInstrument,_ins_Arp
	dbw	CallSection,.block0
	dbw	CallSection,.block0
.loop
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block1
	dbw	CallSection,.block1
	dbw	CallSection,.block1
	dbw	CallSection,.block1
	dbw	Goto,.loop

.block0
	db	Arp,1,$37
	db	E_4,10,E_4,8,E_4,6
	db	Arp,1,$38
	db	E_4,10,E_4,8,E_4,6
	db	B_3,10,B_3,8,B_3,6
	db	D#4,10,D#4,8,D#4,6
	ret
.block1
	db	Arp,1,$37
	db	F#4,10,F#4,8,F#4,6
	db	Arp,1,$38
	db	F#4,10,F#4,8,F#4,6
	db	C#4,10,C#4,8,C#4,6
	db	F_4,10,F_4,8,F_4,6
	ret

InsertTitleHere_CH3:
	db	rest,192
.loop
	db	$80,19,B_5,6,A_5,6,$80,18,G_5,4,$80,17,A_5,2,$80,18,G_5,4,$80,17,E_5,2
	db	$80,18,D_5,4,$80,17,E_5,2,$80,18,G_5,4,$80,20,D_5,12,$80,17,B_4,2
	db	$80,19,D_5,6,B_4,6,$80,18,D_5,4,$80,17,B_4,2,$80,18,D_5,4,$80,17,B_4,2
	db	$80,19,D#5,6,B_4,6,$80,18,D#5,4,$80,17,B_4,2,$80,18,A_4,4,$80,17,B_4,2
	db	$80,20,E_4,18,rest,78
	db	$80,19,B_5,6,A_5,6,$80,18,G_5,4,$80,17,A_5,2,$80,18,G_5,4,$80,17,E_5,2
	db	$80,18,B_5,4,$80,17,A_5,2,$80,18,G_5,4,$80,20,D_5,12,$80,17,E_5,2
	db	$80,19,G_5,6,E_5,6,$80,18,G_5,4,$80,19,A_5,6,$80,17,A#5,2
	db	$80,19,B_5,6,A_5,6,$80,18,D#5,4,$80,19,G_5,6,$80,17,D_5,2
	db	$80,20,E_5,18,rest,78
	dbw	CallSection,.block1
	db	rest,10
	db	$80,17,C#5,2,$80,18,E_5,4,$80,17,C#5,2,$80,18,E_5,4,$80,17,C#5,2,$80,18,B_4,4,$80,17,C#5,2
	dbw	CallSection,.block1
	db	rest,30
	dbw	Goto,.loop

.block1
	db	$80,20,F#5,10,E_5,8,$80,19,C#5,6
	db	D_5,6,$80,18,E_5,4,$80,19,D_5,6,$80,17,A_4,2,$80,18,D_5,4,$80,17,E_5,2
	db	$80,20,A_5,10,F#5,8,$80,19,C#5,6
	db	$80,18,E_5,4,$80,17,F#5,2,$80,18,E_5,4,$80,17,F#5,2,$80,18,A_5,4,$80,17,F#5,2,$80,18,E_5,4,$80,17,C#5,2
	db	$80,20,F#5,10,E_5,8,$80,19,C#5,6
	db	A_5,6,$80,18,B_5,4,$80,19,A_5,6,$80,17,F#5,2,$80,18,E_5,4,$80,17,F#5,2
	db	$80,20,E_5,18
	ret
	
InsertTitleHere_CH4:
	Drum	Kick,4
	Drum	CHH,2
	Drum	Snare,4
	Drum	CHH,2
	Drum	Kick,4
	Drum	Kick,2
	Drum	Snare,4
	Drum	CHH,2
	dbw		Goto,InsertTitleHere_CH4

; =================================================================

PT_Beach:
	dw	Beach_CH1,Beach_CH2,Beach_CH3,Beach_CH4
	
Beach_CH1:
	db	rest,$e0
	db	SetInstrument,_ins_BeachLead
	db	E_4,2
	db	E_4,2
	db	E_4,2
	db	rest,4
	db	E_4,4
	db	E_4,2
	db	E_4,2
	db	rest,2
	db	G_5,4
	db	F_5,4
	db	E_5,4
	
	db	E_5,6
	db	C_5,2
	db	rest,4
	db	G_4,8
	db	F_5,4
	db	E_5,4
	db	D_5,4
	db	E_5,6
	db	C_5,2
	db	rest,4
	db	G_5,12
	db	A_5,8
	db	G_5,6
	db	A_5,2
	db	rest,4
	db	G_5,8
	db	F_5,4
	db	E_5,4
	db	D_5,4
	db	E_5,16
	db	SetInstrument,_ins_BeachOctArp
	db	G_5,8
	db	A_5,8
	db	G_5,12
	db	SetInstrument,_ins_BeachLead
	db	F_5,4
	db	E_5,8
	db	C_5,8
	db	C_5,6
	db	D_5,2
	db	rest,4
	db	C_5,8
	db	A_4,4
	db	G_4,4
	db	A_4,4
	db	G_4,8
	db	C_5,8
	db	B_4,6
	db	E_5,6
	db	B_4,4
	db	E_4,2
	db	E_4,2
	db	E_4,2
	db	rest,4
	db	E_4,4
	db	E_4,2
	db	E_4,2
	db	rest,14
	dbw	Goto,Beach_CH1
	
Beach_CH2:
	db	SetInstrument,_ins_Tri
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	db	SetInstrument,_ins_BeachLead
	db	G_4,2
	db	G_4,2
	db	G_4,2
	db	rest,4
	db	G_4,4
	db	G_4,2
	db	G_4,2
	db	rest,14
	dbw	Goto,Beach_CH2
.block0
	db	D_6,4
	db	D_6,2
	db	A_5,4
	db	A_5,4
	db	D_6,4
	db	D_6,4
	db	D_6,2
	db	A_5,4
	db	A_5,4
	ret
	
Beach_CH3:
	db	SetInstrument,_ins_SteelDrum
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block1
	db	C_6,2,C_6,2,C_6,6,C_6,4,C_6,2,C_6,12
	db	SetInstrument,_ins_BeachBass
	db	G_3,4
	dbw	CallSection,.block2
	dbw	CallSection,.block2
	dbw	CallSection,.block2
	dbw	CallSection,.block3
	db	SetInstrument,_ins_SteelDrum
	db	C_6,2,C_6,2,C_6,6,C_6,4,C_6,2,C_6,16	
	dbw	Goto,Beach_CH3
.block0
	db	C_5,4
	db	E_5,2
	db	G_5,4
	db	C_5,4
	db	D_5,4
	db	A_5,4
	db	D_5,2
	db	F_5,4
	db	A_5,4
	db	E_5,4
	db	G_5,2
	db	B_5,4
	db	G_5,2
	db	E_5,2
	db	D_5,4
	db	A_5,4
	db	D_5,2
	db	F_5,4
	db	A_5,4
	ret
.block1
	db	C_5,4
	db	E_5,2
	db	G_5,4
	db	C_5,4
	db	D_5,4
	db	A_5,4
	db	D_5,2
	db	F_5,4
	db	A_5,4
	ret
.block2
	db	C_3,6
	db	G_3,2
	db	rest,4
	db	C_3,2
	db	C#3,2
	db	D_3,6
	db	A_3,2
	db	rest,4
	db	D_3,4
	db	E_3,6
	db	B_3,2
	db	rest,4
	db	E_3,2
	db	D#3,2
	db	D_3,6
	db	A_3,2
	db	rest,4
	db	D_3,4
	ret
.block3
	db	C_3,6
	db	G_3,2
	db	rest,4
	db	C_3,2
	db	C#3,2
	db	D_3,6
	db	A_3,2
	db	rest,4
	db	D_3,4
	ret

Beach_CH4:
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block1
	Drum	Kick,2
	Drum	Kick,2
	dbw	CallSection,.block2
	dbw	CallSection,.block2
	dbw	CallSection,.block2
	dbw	CallSection,.block2
	dbw	CallSection,.block2
	dbw	CallSection,.block2
	dbw	CallSection,.block2
	dbw	CallSection,.block1
	db	rest,4
	dbw	Goto,Beach_CH4
	
.block0
	Drum	Kick,2
	Drum	CHH,2
	Drum	OHH,4
	Drum	Kick,2
	Drum	CHH,2
	Drum	OHH,4
	Drum	Kick,2
	Drum	CHH,2
	Drum	OHH,4
	Drum	Kick,2
	Drum	CHH,2
	Drum	OHH,4
	ret
.block1
	Drum	Snare,2
	Drum	CHH,2
	Drum	Kick,2
	Drum	Snare,2
	Drum	CHH,2
	Drum	Kick,2
	Drum	Snare,2
	Drum	Kick,2
	Drum	Snare,12
	ret
.block2
	Drum	Kick,2
	Drum	CHH,2
	Drum	Kick,2
	Drum	CHH,2
	Drum	Snare,4
	Drum	OHH,2
	Drum	CHH,2
	Drum	Kick,2
	Drum	CHH,2
	Drum	OHH,2
	Drum	CHH,2
	Drum	Snare,4
	Drum	OHH,2
	Drum	CHH,2
	ret
	
; =================================================================

PT_Desert:	dw	Desert_CH1,Desert_CH2,Desert_CH3,Desert_CH4

Desert_CH1:
	db	SetInstrument,_ins_DesertBass
	db	F_2,2
	db	F_2,4
	db	F_2,2
	Drum	_ins_TomEcho,4
	db	SetInstrument,_ins_DesertBass
	db	D#2,2
	db	F_2,4
	db	F_2,2
	db	D#2,2
	db	F_2,2
	Drum	_ins_TomEcho,6
	db	SetInstrument,_ins_DesertBass
	db	F_2,2
	db	F#2,2
	db	F#2,4
	db	F#2,2
	Drum	_ins_TomEcho,4
	db	SetInstrument,_ins_DesertBass
	db	F_2,2
	db	F#2,4
	db	F#2,2
	db	F_2,2
	db	F#2,2
	Drum	_ins_TomEcho,6
	db	SetInstrument,_ins_DesertBass
	db	A_2,2
	dbw	Goto,Desert_CH1
	
Desert_CH2:
	db	SetInsAlternate,_ins_Echo1,_ins_Echo2
.loop
	db	F_5,1,C#5,1
	db	C_5,1,F_5,1
	db	D#5,1,C_5,1
	db	C_5,1,D#5,1
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	db	F#5,1,C_5,1
	db	C#5,1,F#5,1
	db	E_5,1,C#5,1
	db	C#5,1,E_5,1
	dbw	CallSection,.block1
	dbw	CallSection,.block1
	dbw	CallSection,.block1
	dbw	Goto,.loop
.block0
	db	F_5,1,C_5,1
	db	C_5,1,F_5,1
	db	D#5,1,C_5,1
	db	C_5,1,D#5,1
	ret
.block1
	db	F#5,1,C#5,1
	db	C#5,1,F#5,1
	db	E_5,1,C#5,1
	db	C#5,1,E_5,1
	ret
	
Desert_CH3:
	db	SetInstrument,_ins_DesertLead
	dbw	CallSection,.block0
	dbw	CallSection,.block0

	dbw	CallSection,.block1
	db	C#5,18,C#5,2
	db	D#5,3,D#5,1
	db	SetInsAlternate,_ins_DesertLead,_ins_DesertLeadS
	db	C#5,2
	db	D#5,2
	db	C#5,2
	db	A#4,2
	dbw	CallSection,.block1
	db	SetInsAlternate,_ins_DesertLead,_ins_DesertLeadS
	db	F#5,2
	db	G#5,2
	db	F#5,2
	db	G#5,2
	db	SetInstrument,_ins_DesertLead
	db	F#5,4
	db	G#5,2
	db	SetInstrument,_ins_DesertLeadF
	db	G#5,2
	db	SetInstrument,_ins_DesertLead
	db	F#5,8
	db	A#5,6
	db	SetInstrument,_ins_DesertLeadF
	db	A#5,2
	
	db	SetInstrument,_ins_DesertLead
	db	C_6,10
	db	SetInstrument,_ins_DesertLeadF
	db	C_6,2
	db	SetInstrument,_ins_DesertLead
	db	G#5,4
	db	F_5,6
	db	SetInstrument,_ins_DesertLeadF
	db	F_5,2
	db	SetInsAlternate,_ins_DesertLeadS,_ins_DesertLead
	db	G#5,2
	db	F_5,2
	db	C_5,2
	db	F_5,2
	db	F#5,2
	db	F_5,2
	db	F#5,2
	db	G#5,2
	db	SetInstrument,_ins_DesertLead
	db	F#5,4
	db	G#5,2
	db	SetInstrument,_ins_DesertLeadF
	db	G#5,2
	db	SetInsAlternate,_ins_DesertLead,_ins_DesertLeadF
	db	F#5,6,F#5,2
	db	D#5,6,D#5,2
	db	SetInstrument,_ins_DesertLeadL
	db	F_5,32
	db	SetInstrument,_ins_DesertArp720
	db	F#5,4
	db	F#5,4
	db	F#5,2
	db	F#5,4
	db	F#5,4
	db	F#5,4
	db	F#5,2
	db	SetInstrument,_ins_DesertArp940
	db	F#5,2
	db	F#5,2
	db	SetInstrument,_ins_DesertArp720
	db	F#5,2
	db	SetInstrument,_ins_DesertArp520
	db	F#5,2
	db	SetInstrument,_ins_DesertLead
	db	CallSection
	dw	.block0
	db	CallSection
	dw	.block0
	db	SetInstrument,_ins_DesertOctArp
	db	CallSection
	dw	.block0
	db	CallSection
	dw	.block2
	dbw	Goto,Desert_CH3

.block0
	db	F_5,2
	db	D#5,2
	db	F_5,2
	db	F#5,2
	db	F_5,2
	db	D#5,2
	db	F_5,2
	db	C_5,2
	db	F_5,2
	db	C_5,2
	db	F_5,2
	db	A_5,4
	db	F_5,2
	db	D#5,2
	db	F_5,2
	db	F#5,2
	db	C#5,2
	db	A#5,2
	db	G#5,2
	db	F#5,2
	db	F_5,2
	db	F#5,2
	db	C#5,2
	db	F#5,2
	db	C#5,2
	db	F#5,2
	db	A#5,4
	db	G#5,2
	db	F#5,2
	db	D#5,2
	ret
.block1
	db	SetInsAlternate,_ins_DesertLead,_ins_DesertLeadF
	db	C_5,14,C_5,2
	db	F_5,6,F_5,2
	db	C_5,6,C_5,2
	ret
.block2
	db	F_6,2
	db	D#6,2
	db	F_6,2
	db	F#6,2
	db	F_6,2
	db	D#6,2
	db	F_6,2
	db	C_6,2
	db	F_6,2
	db	C_6,2
	db	F_6,2
	db	A_6,4
	db	F_6,2
	db	D#6,2
	db	F_6,2
	db	F#6,2
	db	C#6,2
	db	A#6,2
	db	G#6,2
	db	F#6,2
	db	F_6,2
	db	F#6,2
	db	C#6,2
	db	F#6,2
	db	C#6,2
	db	F#6,2
	db	A#6,4
	db	G#6,2
	db	F#6,2
	db	D#6,2
	ret
	
Desert_CH4:
	Drum	Kick,2
	Drum	CHH,2
	Drum	OHH,2
	Drum	CHH,2
	Drum	Snare,4
	Drum	OHH,2
	Drum	CHH,2
	dbw		Goto,Desert_CH4
	
; =================================================================

PT_Snow:	dw	Snow_CH1,Snow_CH2,Snow_CH3,Snow_CH4

Snow_CH1:
	db	SetInstrument,_ins_SnowBass
	dbw	CallSection,.block0
	db	E_2,2
	dbw	CallSection,.block0
	db	C#3,2
	dbw	CallSection,.block1
	db	F#2,4,F#3,2,F#2,4,F#2,2,E_3,4,F#3,2,F#2,4,C#2,2
	dbw	CallSection,.block2
	dbw	CallSection,.block0
	db	E_2,2
	dbw	CallSection,.block0
	db	C#3,2
	dbw	CallSection,.block1
	db	F#2,4,F#3,2,F#2,4,F#2,2,E_3,4,F#3,2,F#2,4,C#2,2
	dbw	CallSection,.block3
	db	B_2,4,C#3,2
	
	dbw	CallSection,.block1
	db	A_2,4,A_3,2,A_2,4,A_2,2,G_3,4,A_3,2,A_2,4,A_2,2
	dbw	CallSection,.block2
	dbw	CallSection,.block1
	db	F#2,4,F#3,2,F#2,4,F#2,2,E_3,4,F#3,2,F#2,4,C#2,2
	dbw	CallSection,.block3
	db	B_2,4,G_2,2
	dbw	Goto,Snow_CH1
.block0
	db	A_2,4,A_3,2,A_2,4,A_2,2,G_3,4,A_3,2,A_2,4,B_2,2
	db	G_2,4,G_3,2,G_2,4,G_2,2,F#3,4,G_3,2,G_2,4,E_2,2
	db	A_2,4,A_3,2,A_2,4,A_2,2,G_3,4,A_3,2,A_2,4,G_2,2
	db	A_2,4,A_3,2,A_2,4,A_2,2,G_3,4,A_3,2,A_2,4
	ret
.block1
	db	D_3,4,D_4,2,D_3,4,D_3,2,C#4,4,D_4,2,D_3,4,A_2,2
	db	B_2,4,B_3,2,B_2,4,B_2,2,A_3,4,B_3,2,B_2,4,G_2,2
	db	E_2,4,E_3,2,E_2,4,E_2,2,D_3,4,E_3,2,E_2,4,E_2,2
	ret
.block2
	db	D_2,4,D_3,2,D_2,4,D_2,2,C#3,4,D_3,2,D_2,4,C#2,2
	db	D_2,4,D_3,2,D_2,4,D_2,2,C#3,4,D_3,2,D_2,4,C#2,2
	db	E_2,4,E_3,2,E_2,4,E_2,2,D_3,4,E_3,2,E_2,4,E_2,2
	db	E_2,4,E_3,2,E_2,4,E_2,2,D_3,4,E_3,2,E_2,4,G#2,2
	ret
.block3
	db	D_2,4,D_3,2,D_2,4,D_2,2,C#3,4,D_3,2,D_2,4,D_2,2
	db	E_2,4,E_3,2,E_2,4,E_2,2,D_3,4,E_3,2,E_2,4,G#2,2
	db	A_2,4,A_3,2,A_2,4,A_2,2,G_3,4,A_3,2,A_2,4,G_2,2
	db	A_2,4,A_3,2,A_2,4,A_2,2,G_3,4,A_3,2
	ret
	
Snow_CH2:
	db	SetInstrument,_ins_Arp
	dbw	CallSection,.block0
	dbw	CallSection,.block1
	dbw	CallSection,.block0
	dbw	CallSection,.block2
	dbw	CallSection,.block3
	dbw	CallSection,.block4
	db	Arp,1,$47
	db	G_4,6
	db	G_4,6
	db	G_4,4
	db	G_4,2
	db	rest,4
	db	G_4,6
	db	G_4,2
	db	G_4,4
	db	G_4,2
	db	G_4,4
	db	G_4,2
	db	rest,4
	db	G_4,2
	db	Arp,1,$38
	db	G#4,6
	db	G#4,6
	db	G#4,4
	db	G#4,2
	db	rest,4
	db	G#4,6
	db	G#4,2
	db	G#4,4
	db	G#4,2
	db	G#4,4
	db	G#4,2
	db	rest,4
	db	G#4,2
	dbw	CallSection,.block0
	dbw	CallSection,.block1
	dbw	CallSection,.block0
	dbw	CallSection,.block2
	dbw	CallSection,.block3
	dbw	CallSection,.block4
	dbw	CallSection,.block5
	dbw	CallSection,.block2
	dbw	CallSection,.block3
	db	Arp,1,$5a
	db	E_4,6
	db	E_4,6
	db	E_4,4
	db	E_4,2
	db	rest,4
	db	Arp,1,$59
	db	E_4,6
	db	E_4,2
	db	E_4,4
	db	E_4,2
	db	E_4,4
	db	E_4,2
	db	rest,4
	db	E_4,2
	db	Arp,1,$38
	db	B_3,6
	db	B_3,6
	db	B_3,4
	db	B_3,2
	db	rest,4
	db	B_3,6
	db	B_3,2
	db	B_3,4
	db	B_3,2
	db	B_3,4
	db	B_3,2
	db	rest,4
	db	B_3,2
	db	Arp,1,$47
	db	E_4,6
	db	E_4,6
	db	E_4,4
	db	E_4,2
	db	rest,4
	db	E_4,6
	db	E_4,2
	db	E_4,4
	db	E_4,2
	db	E_4,4
	db	E_4,2
	db	rest,4
	db	E_4,2
	dbw	CallSection,.block3
	dbw	CallSection,.block4
	dbw	CallSection,.block5
	dbw	CallSection,.block2
	dbw	Goto,Snow_CH2
.block0
	db	Arp,1,$38
	db	C#4,6
	db	C#4,6
	db	C#4,4
	db	C#4,2
	db	rest,4
	db	Arp,1,$59
	db	D_4,6
	db	D_4,2
	db	D_4,4
	db	D_4,2
	db	D_4,4
	db	D_4,2
	db	rest,4
	db	D_4,2
	ret
.block1
	db	Arp,1,$38
	db	C#4,6
	db	C#4,6
	db	C#4,4
	db	C#4,2
	db	rest,4
	db	C#4,6
	db	C#4,2
	db	C#4,4
	db	C#4,2
	db	C#4,4
	db	C#4,2
	db	rest,4
	db	C#4,2
	ret
.block2
	db	Arp,1,$57
	db	A_4,6
	db	A_4,6
	db	A_4,4
	db	A_4,2
	db	rest,4
	db	Arp,1,$47
	db	A_4,6
	db	A_4,2
	db	A_4,4
	db	A_4,2
	db	A_4,4
	db	A_4,2
	db	rest,4
	db	A_4,2
	ret
.block3
	db	Arp,1,$37
	db	B_4,6
	db	B_4,6
	db	B_4,4
	db	B_4,2
	db	rest,4
	db	Arp,1,$59
	db	B_4,6
	db	B_4,2
	db	B_4,4
	db	B_4,2
	db	B_4,4
	db	B_4,2
	db	rest,4
	db	B_4,2
	ret
.block4
	db	Arp,1,$47
	db	A_4,6
	db	A_4,6
	db	A_4,4
	db	A_4,2
	db	rest,4
	db	Arp,1,$49
	db	C#4,6
	db	C#4,2
	db	C#4,4
	db	C#4,2
	db	C#4,4
	db	C#4,2
	db	rest,4
	db	C#4,2
	ret
.block5
	db	Arp,1,$47
	db	D_4,6
	db	D_4,6
	db	D_4,4
	db	D_4,2
	db	rest,4
	db	E_4,6
	db	E_4,2
	db	E_4,4
	db	E_4,2
	db	E_4,4
	db	E_4,2
	db	rest,4
	db	E_4,2
	ret


Snow_CH3:
	db	EnablePWM,$f,7
.loop
	dbw	CallSection,.block0
	db	A_5,4
	db	B_5,2
	db	C#6,4
	db	A_5,2
	db	rest,4
	db	SetInstrument,_ins_PWMLeadLong
	db	E_5,38
	dbw	CallSection,.block0
	db	E_6,1
	db	F#6,5
	db	SetInstrument,_ins_PWMLeadLong
	db	E_6,48
	dbw	CallSection,.block1
	db	SetInstrument,_ins_PWMLead
	db	D_6,6
	db	C#6,6
	db	B_5,4
	db	A_5,2
	db	rest,4
	db	D_6,8
	db	C#6,6
	db	B_5,6
	db	E_6,1
	db	F#6,5
	db	SetInstrument,_ins_PWMLeadLong
	db	E_6,48
	dbw	CallSection,.block0
	db	A_5,4
	db	B_5,2
	db	C#6,4
	db	A_5,2
	db	rest,4
	db	SetInstrument,_ins_PWMLeadLong
	db	E_5,38
	dbw	CallSection,.block0
	db	E_6,1
	db	F#6,5
	db	SetInstrument,_ins_PWMLeadLong
	db	E_6,48
	dbw	CallSection,.block1
	db	D_6,6
	db	C#6,6
	db	B_5,4
	db	A_5,2
	db	rest,4
	db	SetInstrument,_ins_PWMLeadLong
	db	G#5,14
	db	F#5,4
	db	G#5,2
	db	rest,4
	db	G#5,1
	db	A_5,37
	db	B_5,6
	db	C#6,6
	dbw	CallSection,.block2
	db	E_6,42
	db	SetInstrument,_ins_PWMLead
	db	C#6,6
	db	D_6,6
	db	C#6,2
	db	rest,2
	db	B_5,6
	db	C#6,2
	db	B_5,4
	db	SetInstrument,_ins_PWMLeadLong
	db	A_5,14
	db	G#5,4
	db	A_5,2
	db	rest,4
	db	B_5,24
	db	D_6,1
	db	E_6,25
	dbw	CallSection,.block2
	db	E_6,12
	db	C#6,4
	db	E_6,2
	db	rest,4
	db	A#5,14
	db	B_5,6
	db	C#6,6
	db	D_6,6
	db	C#6,6
	db	B_5,4
	db	A_5,2
	db	rest,4
	db	G#5,14
	db	F#5,4
	db	G#5,2
	db	rest,4
	db	G#5,1
	db	A_5,49
	dbw	Goto,.loop
.block0
	db	SetInstrument,_ins_PWMLead
	db	C#6,6
	db	rest,6
	db	B_5,4
	db	C#6,2
	db	rest,4
	db	D_6,6
	db	C#6,2
	db	rest,4
	db	B_5,8
	ret
.block1
	db	F#6,6
	db	rest,6
	db	F#6,4
	db	F#6,2
	db	rest,4
	db	G#6,14
	db	G_6,6
	db	F#6,6
	db	E_6,6
	db	E_6,6
	db	E_6,6
	db	B_5,4
	db	A#5,14
	db	B_5,6
	db	C#6,6
	ret
.block2
	db	SetInstrument,_ins_PWMLead
	db	F#6,6
	db	E_6,6
	db	D_6,4
	db	C#6,2
	db	rest,4
	db	B_5,8
	db	C#6,6
	db	D_6,6
	db	SetInstrument,_ins_PWMLeadLong
	db	F#6,6
	ret
	
Snow_CH4:
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block1
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block1
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block0
	dbw	CallSection,.block2
	dbw	Goto,Snow_CH4
	
.block0
	Drum	Kick,4
	Drum	CHH,2
	Drum	Snare,4
	Drum	CHH,2
	Drum	Kick,4
	Drum	Kick,2
	Drum	Snare,4
	Drum	CHH,2
	Drum	Kick,4
	Drum	CHH,2
	Drum	Snare,4
	Drum	CHH,2
	Drum	Kick,4
	Drum	Kick,2
	Drum	Snare,4
	Drum	CHH,2
	ret
.block1
	Drum	Kick,4
	Drum	CHH,2
	Drum	Snare,4
	Drum	CHH,2
	Drum	Kick,4
	Drum	Kick,2
	Drum	Snare,4
	Drum	CHH,2
	Drum	Kick,4
	Drum	CHH,2
	Drum	Snare,4
	Drum	CHH,2
	Drum	Kick,4
	Drum	Snare,2
	Drum	Snare,4
	Drum	Snare,2
	ret
.block2
	Drum	Kick,4
	Drum	CHH,2
	Drum	Snare,4
	Drum	CHH,2
	Drum	Kick,4
	Drum	Kick,2
	Drum	Snare,4
	Drum	CHH,2
	Drum	Kick,4
	Drum	CHH,2
	Drum	Snare,4
	Drum	CHH,2
	Drum	Snare,2
	Drum	Snare,2
	Drum	Snare,2
	Drum	Snare,2
	Drum	Snare,2
	Drum	Snare,2
	ret
	
