function ctrl_startd3d(){
	d3d_start();
	var camera = o_first_person_camera;
	var c = d3d_camera_create(camera, room_width / 2, room_height / 2,50, "cameras", 70, 1378, 730, new Vector(0,0,0));

}