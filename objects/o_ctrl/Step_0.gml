if(game_active()){
	time -= delta_time / 1000000;
	immune -= delta_time / 1000000;
	hurtFlash -= delta_time / 1000000;
	hp = min(maxHp, hp + (hpRegen * delta_time / 1000000));
}
	
if(hp <= 0 && !instance_exists(o_dead)){
	instance_create_layer(0,0, "layer_ux", o_dead);
}


if(!window_has_focus()){
	paused = true;
}

o_first_person_camera.locked = !game_active();