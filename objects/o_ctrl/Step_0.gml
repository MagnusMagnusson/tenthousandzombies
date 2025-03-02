if(game_active()){
	time -= delta_time / 1000000;
	immune -= delta_time / 1000000;
	hurtFlash -= delta_time / 1000000;
	
	if(hp <= 0){
		room_restart();
	}
}


o_first_person_camera.locked = !game_active();