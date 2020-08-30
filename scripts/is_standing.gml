///is_standing(yy, height, solidOnly)

var
   yy := argument0,
   height := argument1,
   solidOnly := argument2,
   against := oPlatform;
if(solidOnly)
   against = oSolidPlatform;

return
   height != 0 &&
   frac(y) == 0 &&
   collision_rectangle(
      floor(bbox_left), yy,
      ceil(bbox_right), yy + height - 1,
      against, false, false
   ) != noone;
