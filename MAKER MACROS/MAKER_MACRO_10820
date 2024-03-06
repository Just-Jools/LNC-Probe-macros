// Manual macro for angle. Assumes you have probed two bores the first as G54P50, the second as G54P49

// Run this macro from Maker Macro using M10820 Q"xxx"    Q is the angle that the two points have as designed in fusion. You have to work this out manually.
// 0 degrees is the X axis in a positive direction. then move ANTICLOCKWISE the angle goes up to +360.
// So stright up would be 90 degrees, straight down would be 270 degrees.


//previously you have to have probed two points. These need to be G54P50 and G54P49
// The data in these below is thaking that stored data and adding it to variable containers. 

- #800 = R_G54EXP_COOR[0,50,1] //Set #800 as G54P50 X data, x1
- #801 = R_G54EXP_COOR[0,50,2] // Set #801 as G54P50 Y data, y1
- #802 = R_G54EXP_COOR[0,49,1] //Set #802 as G54P49 X data, x2
- #803 = R_G54EXP_COOR[0,49,2] //Set #803 as G54P49 Y data, y2


//Set G54 using G54P50 data. I'm also using the G54P50 data as my G54 so I move it across to that. This just saves probing again.
// though it could be deleted and just re probe in the operation
// Or it could be turned on and off by passing a variable through from the operation. But I need it like this so it will be up to you to decide.

- W_G53G59_COOR[0,54,1,#800] // pastes #800 into G54 X value
- W_G53G59_COOR[0,54,2,#801] // pastes #801 into G54 Y value


// Calculate difference between two points. This effectively makes hr first central point (0,0) and the next one (x,y)

#804 = #802 - #800  // Calculate (x2 - x1)
#805 = #803 - #801  // Calculate (y2 - y1)


// set the #807 
// This tells us what quadrant of a 360 degree circle the second point is in
// we need this later as Tan doesnt work in 360 degrees only 90 degrees max from the X axis. Goolgle it to understand.

If (#804>0 && #805 >0)
#807 == 0

If (#804 < 0 && #805>0)
#807 == 1

If (#804<0 && #805<0)
#807 == 2

If (#804>0 && #805<0)
#807 == 2 


// 90, 180, 270 and 360 degrees. No Tan calcs needed (as they are a straight line not a right angle triangle) so skip the tan and use logic to calculate right angles. 
//So if these are true we should skip past the Tan calcs 
// A Tan calc would return zero on any of the 2 axis both positive and negative. So this is probably over complicating it but just checks it's not a straightline first

//Should this be an if, else, else if???

If (#804==0&& #805>0) Goto 1

If (#805==0 && #804<0) Goto 2

If (#804==0 && #805<0) Goto 3

If (#804>0 && #805==0) Goto 4


// if none of the if statements above are true use Tan to Calculate angle in degrees. Store that angle in #806

#806 = ATAN2[#805 / #804]


//Tan calculates the angle compared to the X axis. So the angle is always max 90. top right quadrant of the circle 0-+90, top left0- -90, bottom left 0-+90' bottom right 0--90
// this corrects the angle and using the data from the coordinates above makes it into 0-360 degrees. O being X +ve axis. 90 degrees vertical, 180 X -ve, 270 Y -ve, 360
// #807 is set above
// Final value stored in #808 
//Jump to end of program


//should this be an if, else else if?

If #807 == 0
#808 == #806

If #807 == 1
#808 = (90+#806)+90

If #807 == 2 
#808 = 180 + #806

If #807 == 3
#808 == (360+#806)

// jump past the calcs below if we've used Tan to calculate the angle.
Goto Line 5




//return 90 degrees
// Skip rest and end program with variable stored
//Final value stored in #808
N1
#806 == 90
#808 == #806
Goto Line 5

//return 180 degrees
// Skip rest and end program with variable stored
N2
#806 == 180
#808 == #806
Goto Line 5

//Return 270 degrees
// Skip rest and end program with variable stored
N3
#806 == 270
808 == 806
Goto Line 5

//Return 360 degrees
// Skip rest and end program with variable stored
N4
#806 == 360
#808 == #806
Goto Line 5

N5


//use the as designed angle to make an angle offset for G68
//This #17 is the Q value manually inputted in the operation
// this is stored in @809 as that is a global variable and can be called via fusion. 
//So we can probe the two points,run this macro then start a program with G68 active and use coordinate offsetting :-) 

@809 = #808 -#17

M99







