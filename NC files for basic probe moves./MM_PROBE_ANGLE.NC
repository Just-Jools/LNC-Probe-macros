; Find probed angle %@MACRO O8010
(The probe is positioned at the middle of 
the two measuring points and keep an appropriate 
distance from the measure surface)
M10719			; turn probe on
WAIT[0,0]
G17 G40 G49 G69 G80 G90; 
@880 =15		; Y-side measurement distance
@820=0			; G43 safe height.
@883=30			; distance between two measuring points
@884=0			; Reference nominal angle
G59				; starting position WCS
G43 H12 Z@820	; probe length offset
G04 X0.5
M10843 Y@880 D@883 A@884 F3000 ;If Y@880 changed to X@880, it will measure the X-side.
@500 = @139		; the measured angle is stored in @500
M10720			;Turn probe off 
M30


(y testing needs 0degree 
x neesd 90 degrees) 