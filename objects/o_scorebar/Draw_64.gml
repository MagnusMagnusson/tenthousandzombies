
for(var i = 6; i >= 0; i--){
	var s = (myscore div power(10, i)) % 10;
	draw_sprite_ext(sprite_index, s, x + sprite_width *  (7 - i), y, image_xscale, image_yscale, 0, c_white, 1);
}

draw_set_color(0);
draw_text(0,20,myscore);
