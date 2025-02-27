
function d3d_object_create(){
	z = 0;
	zspeed = 0;
	gravity_vector = new Vector(0,0,-0.5);
	gravity_enabled = false;
}


function d3d_object_step(solid_obj_id = undefined){
	if(gravity_enabled){
		var speedVector = new Vector(hspeed, vspeed, zspeed);
		speedVector = speedVector.Add(gravity_vector);
		hspeed = speedVector._x;
		vspeed = speedVector._y;
		zspeed = speedVector._z;
	}
	
	z += zspeed;
	
	if(!is_undefined(solid_obj_id)){
		var walls = d3d_collision_list(o_world.collision_tree, id, solid_obj_id)
		if(array_length(walls) > 0){
			var o = walls[0];
			if(o.z <= z){
				//warp up top
				z -= zspeed;
				zspeed = 0;
			} else {
				//Bump out bottom
				z = o.z;
				zspeed = 0;
			}
		}
	}

}

