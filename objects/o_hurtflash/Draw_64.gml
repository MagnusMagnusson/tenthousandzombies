if(game_active() && o_ctrl.hurtFlash > 0){
	draw_set_alpha(o_ctrl.hurtFlash);
	draw_set_color(c_maroon);
	var c = view_get_camera(0)
	draw_rectangle(0,0, camera_get_view_width(c), camera_get_view_height(c), false);
	draw_set_alpha(1);
}