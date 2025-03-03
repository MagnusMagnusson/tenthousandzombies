function game_active(){
	return  !(o_ctrl.paused || o_ctrl.storeOpen || o_ctrl.hp <= 0);
}