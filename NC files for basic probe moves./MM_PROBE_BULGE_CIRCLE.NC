; Boss circle measurement %@MACRO O8003
M10719			; turn probe on
WAIT[0,0]
G17 G40 G49 G69 G80 G90
@880 = 60.75		;diameter of the boss
@820 = 3		; G43 safe height / measurement height
@882 = -3		; drop distance when measuring
@860 = 3		; WCS 1-6 = G54-G59, 101-148 = G54P1-G54P48
G56				; starting position coordinate compensation
G43 H12 Z@820	; tool offset to use
G04 X0.5
M10814 D@880 Z@882 S@860 F3000.; ------ check this macro
M10720			; turn probe off
M30
