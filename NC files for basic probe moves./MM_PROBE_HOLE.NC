; Find hole center %@MACRO O8001
M10719			; turn probe on
WAIT[0,0]
G17 G40 G49 G69 G80 G90
@880 = 25		; diameter of the hole
@820 = 0	; MEASUR height IN CALLED OFFSET 
@860 = 1		; WCS 1-6 = G54-G59, 101-148 = G54P1-G54P48
G54				; starting position WCS
G43 H69 Z@820	; probe length offset
G04 X0.5
M10814 D@880 S@860 F3000.
M10720			; Turn probe off
G1 Z60
M30
