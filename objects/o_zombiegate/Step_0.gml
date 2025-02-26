if(game_active()){
	timer -= delta_time / 1000000;
	if(timer <= 0){
		timer = 1;
		instance_create_layer(x, y, "zombie_layer", o_zombie);
	}
		
}