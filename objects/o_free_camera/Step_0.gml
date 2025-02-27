if(!active) exit;

if(mouse_check_button_pressed(mb_right)){
	display_mouse_set(display_get_width() / 2, display_get_height() / 2);
}
else if(mouse_check_button(mb_right)){
	var dx = display_mouse_get_x() - (display_get_width() / 2);
	var dy = -display_mouse_get_y() + (display_get_height() / 2);

	d3d_camera_rotate_around_degrees(dx * 0.9, dy* 0.9);
	display_mouse_set(display_get_width() / 2, display_get_height() / 2);
}
var du, dv, dw;
du = 0;
dv = 0;
dw = 0;

if(keyboard_check(vk_up)){
	du += 5;
}
if(keyboard_check(vk_down)){
	du -= 5;
}
if(keyboard_check(vk_right)){
	dv += 5;
}
if(keyboard_check(vk_left)){
	dv -= 5;
}

d3d_camera_move(du,dv,dw);