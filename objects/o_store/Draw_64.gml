draw_set_font(fnt_store_big);
draw_self();
draw_set_color(c_white);
draw_set_halign(fa_center);

draw_text(x + (sprite_width / 2), y + 64, "CLEARED LEVEL " + string(o_ctrl.level));
draw_text(x + (sprite_width / 2), y + 256, "Pretend there is a store here, and press space to go on");