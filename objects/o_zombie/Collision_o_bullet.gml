if(game_active()){
	hp -= other.damage;
	if(hp <= 0){
		instance_destroy();
		o_ctrl.killZombie();
	}
	with(other){
		instance_destroy()
	};
}