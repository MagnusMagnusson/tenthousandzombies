d3d_object_create();

if(instance_exists(o_camera)){
	o_camera.following = id;
	z = 0;
	o_camera.zOffset = 15;
}
model = ModelManager().get("humanoid", true);

scale = 1;
shotDelay = 0;
releasedTrigger = true;

lookingAt = function(xx, yy){
	var d = point_direction(x, y, xx, yy);
	var dd = point_distance(x, y, xx, yy);
	return dd < 960 && angle_difference(d, direction) < 90;
}