///update_position(allowEscapeX, allowEscapeY)

var
   allowEscapeX := argument0,
   allowEscapeY := argument1;

__sideeff_landed = false;

// apply X
if(hspeed != 0) {
   var computedX := x_move_check(x, allowEscapeX);
   if(is_undefined(computedX))
      x += hspeed;
   else {
      x = computedX;
      hspeed = 0;
   }
}

// apply Y
var standing := is_standing(y, 1, false);
if(vspeed == 0) {
   if(standing)
      __sideeff_landed = true;
} else {
   var computedY := y_move_check(y, allowEscapeY);
   if(is_undefined(computedY))
      y += vspeed;
   else {
      y = computedY;
      if(vspeed > 0)
         __sideeff_landed = true;
      vspeed = 0;
   }
}

