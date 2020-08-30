///x_move_check(xx, allowEscape)

var
   xx := argument0,
   allowEscape := argument1;

var
   baseline, baselineDelta, xt, from, to, mid, inf,
   boundU := floor(bbox_top),
   boundD := ceil(bbox_bottom),
   right := hspeed > 0;
if(right) {
   baselineDelta := round((sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index) + 1)*image_xscale);
   xt := xx + baselineDelta;
   baseline := ceil(xt);
   inf := floor(xt + hspeed) + 1;
   from := baseline;
   to := inf;
   if(!allowEscape)
      to = min(to, room_width);
} else {
   baselineDelta = round((sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index))*image_xscale);
   xt := xx + baselineDelta;
   baseline := floor(xt);
   inf := ceil(xt + hspeed) - 1;
   from := inf;
   to := baseline;
   if(!allowEscape)
      from = max(from, 0);
}
mid := floor((from + to)/2);

while(from != to) {
   var dir;
   if(right)
      dir := collision_rectangle(
         baseline, boundU,
         mid, boundD,
         oSolidPlatform, false, false
      );
   else
      dir := !collision_rectangle(
         mid, boundU,
         baseline, boundD,
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
