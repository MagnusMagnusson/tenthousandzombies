function d3d_camera_rotate_around_degrees(dx, dy){
	var myPosition = new Vector(x,y,z);
	var dir = myPosition.Invert().Add(lookat).normal();
	var right = dir.Cross(up).normal();
	window_mouse_set(window_get_width() / 2, window_get_height() / 2);
	
	var origin = lookat.Add(myPosition.Invert());
	lookat = origin.RotateAround(up, dx).Add(myPosition);
	lookat = origin.RotateAround(up, dx).Add(myPosition);
	
	origin = lookat.Add(myPosition.Invert());
	lookat = origin.RotateAround(right, dy).Add(myPosition);
	lookat = origin.RotateAround(right, dy).Add(myPosition);
}

function d3d_camera_move(forward, right, _up){
	//forward
	var myPosition = new Vector(x,y,z);
	var dir = myPosition.Invert().Add(lookat).normal();
	var crossDir = dir.Cross(up).normal();
	var updir = myPosition.Invert().Add(up).normal()
	var composite = dir.Scale(forward).Add(crossDir.Scale(right)).Add(updir.Scale(_up));
	
	lookat = lookat.Add(composite);
	var newPoint = myPosition.Add(composite);
	x = newPoint._x;
	y = newPoint._y;
	z = newPoint._z;
}