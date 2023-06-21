; Probe X face %@MACRO O8005
M10719			; turn probe on
WAIT[0,0]
G17 G40 G49 G69 G80 G90; 
@880 = 6		; X seek
@820 = 18.5		; measurement height ------ check this
@860 = 1		; WCS 1-6 = G54-G59, 101-148 = G54P1-G54P48
G54				; starting position coordinate compensation
G43 H69 Z@820	; tool offset to use
G04 X0.5
M10811 X@880 S@860 F3000.
M10720			; turn probe off
M30
