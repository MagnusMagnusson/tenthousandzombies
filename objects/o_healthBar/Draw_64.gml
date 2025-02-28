var maxHp = 1;
var hp = 0;
if(instance_exists(o_ctrl)){
	maxHp = o_ctrl.maxHp;
	hp = o_ctrl.hp;
}

var ratio = hp/maxHp;
var image = 0;
if(ratio < (2/3)){
	var trueRatio = 0.5 * (ratio / (2/3));
	image = floor(trueRatio * (image_number - 1));
	//second bar
} else {
	//first bar
	var r = ratio - (2/3);
	var trueRatio = 0.5 + 0.5 * (r / (1/3));
	image = floor(trueRatio * (image_number - 1));
}


draw_sprite(sprite_index, image, x, y)
