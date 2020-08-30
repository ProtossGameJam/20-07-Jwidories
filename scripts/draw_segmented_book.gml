///draw_segmented_book(sprite, subimg, ox, oy, angle, blend, xmap, seg1, seg2, map1, map2, map3)

var
   sprite := argument0, subimg := argument1,
   ox := argument2, oy := argument3, angle := argument4, blend := argument5,
   xmap := argument6,
   seg, map;
seg[0] := 0;
seg[1] := argument7;
seg[2] := argument8;
seg[3] := 1;
map[0] := 0;
map[1] := argument9;
map[2] := argument10;
map[3] := argument11;

draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(sprite, subimg));
for(var i := 0; i < 4; i++) {
   draw_vertex_texture_color(
      ox - map[i]*dsin(angle), oy + map[i]*dcos(angle),
      0, seg[i],
      blend, 1
   );
   draw_vertex_texture_color(
      ox - map[i]*dsin(angle) + xmap*dcos(angle), oy + map[i]*dcos(angle) + xmap*dsin(angle),
      1, seg[i],
      blend, 1
   );
}
draw_primitive_end();
