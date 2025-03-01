draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);
var t = max(0, ceil(o_ctrl.time));
var str = t > 100 ? string("[{0}]", t - 100) : string(t);
draw_text(x + sprite_width/2,y +sprite_height / 2, str);

draw_set_halign(fa_left);
draw_set_valign(fa_top);