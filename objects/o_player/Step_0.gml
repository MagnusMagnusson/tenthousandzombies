
var sped = 1.5;

if(shotDelay > 0){
	shotDelay--;
}

var c = noone;
with(o_first_person_camera) if following == other.id {
	c = id;
}


if(c){
	direction = point_direction(x,y, c.lookat._x, c.lookat._y);
} else {
	show_debug_message("c not found")
}

if(o_ctrl.hp <= 0){
	o_camera.locked = true;
	o_camera.lookat._z *= 1.1;
	exit;
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
	if(place_meeting(x, y, o_wall)){
		x -= dx;
	}

	y += dy;

	if(place_meeting(x, y, o_wall)){
		y -= dy;
	}
}


if(alarm[0] <= -1 && (x < 0 || x > room_width || y < 0 || y > room_height)){
	alarm[0] = 60;
}