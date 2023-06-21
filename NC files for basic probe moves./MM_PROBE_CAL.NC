; Calibrate probe tip %@MACRO O8000
M10719			; turn probe on
WAIT[0,0]
G17 G40 G49 G69 G80 G90;
@880 = 24.998	; ring gauge diameter
@820 = 0		; probe Z plane height
G54				; choose WCS
G43 H69 Z@820	; choose prob tool offset number
G04 X0.5
@700 = 0
@701 = 0
@702 = 0
@703 = 0
M10802 D@880 F3000
M10803 D@880 F3000
M10720			; turn probe off
M30
