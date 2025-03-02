if(!game_active() && y > 0){
	bounces++;
	y = 0;
	if(bounces >= 3){
		y = 0;
		gravity = 0;
		vspeed = 0;
	} else {
		vspeed = -vspeed * 0.33;
	}
} else {
	gravity = 1;
	if(y > room_height){
		instance_destroy();
	}
}