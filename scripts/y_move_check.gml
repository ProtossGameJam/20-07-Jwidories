///y_move_check(yy, allowEscape)

var
   yy := argument0,
   allowEscape := argument1;

var
   baseline, baselineDelta, yt, from, to, mid, inf,
   boundL := floor(bbox_left),
   boundR := ceil(bbox_right),
   fall := vspeed > 0;
if(fall) {
   baselineDelta := round((sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1)*image_yscale);
   yt := yy + baselineDelta;
   baseline := ceil(yt);
   inf := floor(yt + vspeed) + 1;
   from := baseline;
   to := inf;
} else {
   baselineDelta = round((sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index))*image_yscale);
   yt := yy + baselineDelta;
   baseline := floor(yt);
   inf := ceil(yt + vspeed) - 1;
   from := inf;
   to := baseline;
   if(!allowEscape)
      from = max(from, 0);
}
mid := floor((from + to)/2);

while(from != to) {
   var dir;
   if(fall)
      dir := collision_rectangle(
         boundL, baseline,
         boundR, mid,
         oPlatform, false, false
      );
   else
      dir := !collision_rectangle(
         boundL, mid,
         boundR, baseline,
         oSolidPlatform, false, false
      );
   if(dir)
      to = mid;
   else
      from = mid + 1;
   mid = floor((from + to)/2);
}

if(mid == inf)
   return undefined;
return mid - baselineDelta;
