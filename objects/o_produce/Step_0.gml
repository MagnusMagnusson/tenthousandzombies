spin += (360 / 3) * (delta_time/1000000)

if(abs(o_player.x - x) + abs(o_player.y - y) < 100){
	chase = true;
}

if(chase){	
	var dir = point_direction(x, y, o_player.x, o_player.y);
	direction = dir;
	speed += 0.05;
}