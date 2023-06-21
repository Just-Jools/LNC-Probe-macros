; Calibrate probe length %@MACRO 
M10719			; turn probe on 
WAIT[0,0]
G17 G40 G49 G69 G80 G90; 
@880 = 0		; value of measurement surface, usually zero
@820 = 10		; height above set zero to start probing
G54				; workoffset to use
G43 H69 Z@820	; tool offset to use (pre set tool using tool setter)
G04 X0.5
M10801 Z@880 T14; tool offset to set 
M10720			; turn probe off 
M30
