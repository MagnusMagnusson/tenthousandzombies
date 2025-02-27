
var sped = 1;


var c = noone;
with(o_first_person_camera) if following == other.id {
	c = id;
}


if(c){
	direction = point_direction(x,y, c.lookat._x, c.lookat._y);
} else {
	show_debug_message("c not found")
}

if(!o_camera.locked){
	var dx = 0;
	var dy = 0;
	if(keyboard_check(ord("W"))){
		dx += lengthdir_x(sped, direction);
		dy += lengthdir_y(sped, direction);

	}
	if(keyboard_check(ord("S"))){
		dx += lengthdir_x(-sped, direction);
		dy += lengthdir_y(-sped, direction);

	}
	if(keyboard_check(ord("A"))){
		dx += lengthdir_x(-sped, direction - 90);
		dy += lengthdir_y(-sped, direction - 90);

	}
	if(keyboard_check(ord("D"))){
		dx += lengthdir_x(-sped, direction + 90);
		dy += lengthdir_y(-sped, direction + 90);
	}

	x += dx;
	/*if(d3d_collision(o_world.collision_tree, id, o_wall)){
		x -= dx;
	}*/

	y += dy;

	/*if(d3d_collision(o_world.collision_tree, id, o_wall)){
		y -= dy;
	}*/
}
