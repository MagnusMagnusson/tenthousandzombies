if(!active) exit;
var camera = camera_get_active();

camera_set_view_mat(camera, matrix_build_lookat(
	x,
	y,
	z,
	lookat._x,
	lookat._y,
	lookat._z,
	 up._x,
	 up._y,
	 up._z
));
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(fov,- width / height, 1, zplane));
camera_apply(camera);