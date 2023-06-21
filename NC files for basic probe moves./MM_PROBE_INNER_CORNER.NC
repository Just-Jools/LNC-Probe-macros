; Probe inner corner %@MACRO O8008
M10719			; turn probe on
WAIT[0,0]
G17 G40 G49 G69 G80 G90
@880 = -25		; X direction measurement distance
@881 = 25		; Y direction measurement distance
@820 = 0		; measurement height ------ check this
@860 = 2		; WCS 1-6 = G54-G59, 101-148 = G54P1-G54P48
G59				; starting position coordinate compensation
G43 H12 Z@820	; tool offset to use
G04 X0.5
M10815 X@880 Y@881 S@860 F3000.
M10720			; turn probe off
M30
