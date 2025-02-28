if(game_active()){
	
	var avoidanceDistance = 15;
	var mode;
	x -= 10000;
	var ally = instance_nearest(x + 10000, y, o_zombie);
	x += 10000;
	if(ally != 0 && ally != noone && ally != id){
		show_debug_message(ally)
		var d = abs(x - ally.x) + abs(y - ally.y);
		if(d < avoidanceDistance){
			mode = "avoid";
		} else {
			mode = "hunt";
		}
	} else {
		mode = "hunt";
	}
	
	switch(mode){
		case "avoid":{
			var d = point_direction(ally.x, ally.y, x, y);
			mp_linear_step_object(x + lengthdir_x(avoidanceDistance, d), y + lengthdir_y(avoidanceDistance, d), 0.5, o_wall);
			break;
		}
		case "hunt":{
			mp_linear_step_object(o_player.x, o_player.y, 0.5, o_wall);
		}
	}
} else {
	speed = 0;
}

