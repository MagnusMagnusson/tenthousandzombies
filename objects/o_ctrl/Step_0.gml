if(game_active()){
	time -= delta_time / 1000000;
	
	if(hp <= 0){
		room_restart();
	}
}