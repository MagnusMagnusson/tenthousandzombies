draw_sprite_ext(sprite_index, difficulty, x, y, image_xscale, image_yscale, 0, c_white, 1);



if(window_mouse_get_x() > x && window_mouse_get_x() < x + sprite_width 
&& window_mouse_get_y() > y && window_mouse_get_y() < y + sprite_height
){
	draw_set_color(c_white);
	var c = view_get_camera(0);
	var w = camera_get_view_width(c);
	var h = camera_get_view_height(c);
	draw_text(w / 2, h - string_height(desc[difficulty]) - 8, desc[difficulty]);
}