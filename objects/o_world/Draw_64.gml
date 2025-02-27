draw_set_halign(fa_right);
draw_set_color(c_white)
var off = string_height("A") + 4;
draw_text(window_get_width() - 32,16,string("FPS: {0}",fps));
draw_text(window_get_width() - 32,16 + off,string("FPS (real): {0}",fps_real));
draw_text(window_get_width() - 32,16 + 2*off,string("FPS (average): {0}",fps_average));
