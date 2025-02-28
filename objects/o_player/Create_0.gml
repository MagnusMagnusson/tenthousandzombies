d3d_object_create();

if(instance_exists(o_camera)){
	o_camera.following = id;
	z = 0;
	o_camera.zOffset = 10;
}
model = ModelManager().get("humanoid", true);

scale = 1;
shotDelay = 0;
releasedTrigger = true;