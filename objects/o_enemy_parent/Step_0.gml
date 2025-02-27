if(o_camera.locked) exit;

d3d_object_step(o_wall);
if(z < -20){
	instance_destroy();
}

if(vitality > 0){
	d = direction;
	var canSeePlayer = point_distance(x,y,o_player.x, o_player.y) < vision && !collision_line_3d(x,y,z+height,o_player.x, o_player.y, o_player.z + o_player.height, o_wall);
	var targetX = x;
	var targetY = y;

	if(canSeePlayer){
		targetX = o_player.x;
		targetY = o_player.y;
	}

	direction = point_direction(x, y, targetX, targetY);


	if(point_distance(x,y,targetX,targetY) > _speed + 10){
		speed = _speed;
		x += 1000;
		var closest = instance_nearest(x - 1000, y, object_index);
		x -= 1000;
		if(closest > 0 && point_distance(x,y, closest.x, closest.y) < 30){
			if(id < closest.id){
				targetX = x;
				targetY = y;
				speed *= 0.6;
			}
		}
	} else {
		speed = 0;
	}
} else{
	speed *= 0.94;
}


x += hspeed;
if(d3d_collision(o_world.collision_tree, id, o_wall)){
	x -= hspeed;
	hspeed = 0;
}	
x -= hspeed;

y += vspeed;
if(d3d_collision(o_world.collision_tree, id, o_wall)){
	y -= vspeed;
	vspeed = 0;
}
y -= vspeed;