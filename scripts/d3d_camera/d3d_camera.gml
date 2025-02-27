function d3d_camera_get_active(){
	with(o_camera) if active {
		return id;
	}
}

function d3d_camera_set_active(camera_index_or_id){
	var i = 0;
	var old_active = d3d_camera_get_active();
	with(o_camera){
		active = false;
	}
	var indexCandidate = undefined;
	with(o_camera){
		if(i == camera_index_or_id){
			indexCandidate = id;
		}
		if(id == camera_index_or_id){
			active = true;
			return id;
		}
		i++;
	}
	if(!is_undefined(indexCandidate)){
		indexCandidate.active = true;
		return true;
	}
	return false;
}

function d3d_camera_create(type, x, y, z, layer_name_or_id, fov, width, height, lookat){
	var c = instance_create_layer(x, y, layer_name_or_id, type);
	c.fov = fov;
	c.z = z;
	c.width = width;
	c.height = height;
	c.lookat = lookat;
	
	return c;
	
}
