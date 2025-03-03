if(paused){
	room_goto(rm_main_menu);
} else {
	if(!storeOpen){
		paused = true;
	}
}