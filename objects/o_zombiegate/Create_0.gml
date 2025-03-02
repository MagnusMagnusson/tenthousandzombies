timer = 1;

spawnZombie = function(){
	var level = o_ctrl.level + o_ctrl.difficulty * 5;
	var z = instance_create_layer(x, y, "zombie_layer", o_zombie);
	
	var total = 105 + 5 * level;
	var roll = random(total);
	if(roll < 100){
		//Normal
		z.hp = 10 + level/2;
		z.damage = 10 + level/2;
		z.sped = 0.5;
	} else if (roll < 105 + 3*level) {
		//Zoombie
		z.hp = 7 + level/3;
		z.damage = 5 + level/2.25;
		z.sped = 1.5;
	} else {
		//Tank
		z.hp = 15 + level/2;
		z.damage = 10 + level/1.5;
		z.sped = 0.2;
	}
}