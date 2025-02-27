if(o_camera.locked) exit;
if(vitality > 0 && alarm[0] <= 0){
	other.life -= damage
	alarm[0] = 60;
	if(other.life <= 0){
		other.die();
	}
}