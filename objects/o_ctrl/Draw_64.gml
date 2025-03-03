if paused {
	draw_set_alpha(0.7);
	draw_set_color(0);
	draw_set_font(fnt_store_big);
	var c = view_get_camera(0);
	var w = camera_get_view_width(c);
	var h = camera_get_view_height(c);
	draw_rectangle(0,0,w, h, false);
	draw_set_halign(fa_center);
	draw_set_alpha(1);
	draw_set_color(c_white)
	draw_text(w / 2, h / 3, "PAUSED");
	draw_set_font(fnt_UI);
	draw_text(w / 2, h / 2, "Press P to unpause");
	draw_text(w / 2, 32 + (h / 2), "Press ESC to go back to the main menu");
	draw_set_alpha(1);
}