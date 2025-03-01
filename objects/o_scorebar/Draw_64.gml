var digits =  myscore < 1000000 ? 6 : 1 + floor(log10(myscore));
for(var i = digits - 1; i >= 0; i--){
	var s = (myscore div power(10, i)) % 10;
	draw_sprite_ext(sprite_index, s, x + sprite_width *  (digits - i - 1), y, image_xscale, image_yscale, 0, c_white, 1);
}

draw_set_color(0);
draw_text(0,20,myscore);
