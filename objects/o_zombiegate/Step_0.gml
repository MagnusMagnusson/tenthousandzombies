if(game_active()){
	timer -= delta_time / 1000000;
	if(timer <= 0){
		timer = 1 + irandom(6 - (o_ctrl.level / 10));
		spawnZombie();
	}
}