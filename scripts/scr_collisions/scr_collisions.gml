function point_in_box(x,y,z,x0,y0,z0,x1,y1,z1){
	return x >= x0 && x <= x1 && y >= y0 && y <= y1 && z >= z0 && z <= z1;
}

function collision_line_3d(x0,y0,z0, x1,y1,z1, object){
	var from = new Vector(x0, y0, z0);
	var to = new Vector(x1, y1, z1);
	var diff = to.Add(from.Invert());
	
	with(object){
		//quick cull
		if(min(from._x, to._x) < x && max(from._x, to._x) > x && min(from._y, to._y) < y && max(from._y, to._y) > y){
			var w = image_xscale * sprite_get_width(sprite_index);
			var h = image_yscale * sprite_get_height(sprite_index);
			var d = height;
			var origin = new Vector(
				x,
				y,
				z
			);
			if(ray_intersects_cuboid(from, diff, origin, 
				w,h,d
			)){
				return true;
			};
		}
	}
	return false;
}

function ray_intersects_cuboid(Pv, V, Pc, w, h, d) {
    // Calculate bounds of the cuboid
    var x_min = Pc._x - (w / 2);
    var x_max = Pc._x + (w / 2);
    var y_min = Pc._y - (h / 2);
    var y_max = Pc._y + (h / 2) ;
    var z_min = Pc._z;
    var z_max = Pc._z + d;
    
    // Calculate t_min and t_max for each dimension
    var t_xmin = (x_min - Pv._x) / V._x;
    var t_xmax = (x_max - Pv._x) / V._x;
    if (t_xmin > t_xmax) { var temp = t_xmin; t_xmin = t_xmax; t_xmax = temp; }
    
    var t_ymin = (y_min - Pv._y) / V._y;
    var t_ymax = (y_max - Pv._y) / V._y;
    if (t_ymin > t_ymax) { var temp = t_ymin; t_ymin = t_ymax; t_ymax = temp; }
    
    var t_zmin = (z_min - Pv._z) / V._z;
    var t_zmax = (z_max - Pv._z) / V._z;
    if (t_zmin > t_zmax) { var temp = t_zmin; t_zmin = t_zmax; t_zmax = temp; }
    
    // Determine the intersection interval
    var t_entry = max(t_xmin, t_ymin, t_zmin);
    var t_exit = min(t_xmax, t_ymax, t_zmax);
    
    // Check if the ray intersects the cuboid
    if (t_entry <= t_exit && t_exit >= 0) {
        return true;
    } else {
        return false;
    }
}

function vector_intersects_horizontal(P, V){
	// Calculate the parameter t for which z = 0
	var t = -P._z / V._z;

	// Compute the intersection coordinates
	var I_x = P._x + t * V._x;
	var I_y = P._y + t * V._y;
	
	return new Vector(I_x, I_y, 0);
}