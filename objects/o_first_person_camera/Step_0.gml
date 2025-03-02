if(!locked){
	var xl, yl, zl;

	xl = x;
	yl  = y;
	zl = z;

	if(!is_undefined(following)){
		x = following.x + xOffset;
		y = following.y + yOffset;
		z = following.z + zOffset;
	
		lookat._x += x - xl;
		lookat._y += y - yl;
		lookat._z += z - zl;
	}

	var dx = display_mouse_get_x() - (display_get_width() / 2);
	var dy = -display_mouse_get_y() + (display_get_height() / 2);

	d3d_camera_rotate_around_degrees(dx * 0.9, dy* 0.9);
	display_mouse_set(display_get_width() / 2, display_get_height() / 2);
}