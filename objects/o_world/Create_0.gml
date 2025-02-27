d3d_start();
var camera = instance_exists(o_level_editor) ? o_free_camera : o_first_person_camera;
var c = d3d_camera_create(camera, room_width / 2, room_height / 2,50, "cameras", 70, 1378, 730, new Vector(0,0,0));

if(!instance_exists(o_level_editor)){
	c.following = instance_create_layer(o_start.x, o_start.y, "agents", o_player);
	c.following.z = 10;
	c.zOffset = 26
	depth = 0;


	stats = {
		lifetime : {
			dream : 0,
			level : 0,
			kills : 0
		},
		current : {
			dream : 0,
			level : 0,
			kills : 0
		}
	}
}

global.debug = true;
global.debugMode = d3d_getDebugFormat();
global.debugCube = ModelManager().getRaw("cube", d3d_debugCube(global.debugMode)); 

collision_tree = new Octree(0,0,0,10000,50,100);
fps_list = ds_list_create();
fps_average = 0;

layer_background_blend(layer_background_get_id("Background"), NIGHT_COLOR)