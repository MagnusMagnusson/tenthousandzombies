spin += (360 / 3) * (delta_time/1000000)

if(abs(o_player.x - x) + abs(o_player.y - y) < 100){
	direction = point_direction(x, y, o_player.x, o_player.y);
	speed += 0.05;
}