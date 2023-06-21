; Boss center measurement %@MACRO O8004
M10719			; turn probe on
WAIT[0,0]
G17 G40 G49 G69 G80 G90;
@880 = 25		;width of the boss
@820 = 15		; G43 safe height / measurement height ------ check this 
@882 = -3		; drop distance when measuring ------ check this 
@860 = 3		; WCS 1-6 = G54-G59, 101-148 = G54P1-G54P48
G54				; starting position coordinate compensation
G43 H69 Z@820	; tool offset to use
G04 X0.5
M10812 X@880 Z@882 S@860 F3000.  ; ------ check this macro
M10720			; turn probe off
M30
