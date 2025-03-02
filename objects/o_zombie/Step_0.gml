if(game_active()){
	
	var avoidanceDistance = 15;
	var mode;
	x -= 10000;
	var ally = instance_nearest(x + 10000, y, o_zombie);
	x += 10000;
	if(ally != 0 && ally != noone && ally != id){
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
			mp_potential_step_object(x + lengthdir_x(avoidanceDistance, d), y + lengthdir_y(avoidanceDistance, d), 0.5, o_wall);
			break;
		}
		case "hunt":{
			var d = abs(x - o_player.x) + abs(y - o_player.y);
			if(d > 20){
				mp_potential_step_object(o_player.x, o_player.y, 0.5, o_wall);
			} else {
				o_ctrl.hurt(damage);
			}
		}
	}
	
	if(place_meeting(x, y, o_player)){
		var dir = point_direction(o_player.x, o_player.y, x, y);
		var lastValidX = x;
		var lastValidY = y;
		while(place_meeting(x,y,o_player) && !place_meeting(x,y,o_wall)){
			lastValidX = x;
			lastValidY = y;
			x += lengthdir_x(1, dir);
			y += lengthdir_y(1, dir);
		}
		if(place_meeting(x, y, o_wall)){
			x = lastValidX;
			y = lastValidY;
		}
		show_debug_message(string("relocated zombie from {0}, {1} to {2},{3}", xprevious, yprevious, x, y))
	}
} else {
	speed = 0;
}

