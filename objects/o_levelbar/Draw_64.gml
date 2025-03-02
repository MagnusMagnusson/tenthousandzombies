draw_set_font(fnt_UI);
var stepSize = 120;
var portion = (o_ctrl.zombiesKilled - o_ctrl.lastLevelKillTotal) / (o_ctrl.killsToNextLevel - o_ctrl.lastLevelKillTotal);

if(game_active()){
	if(abs(portion - myPortion) > 1/stepSize){
		myPortion += sign(portion - myPortion) / stepSize;
	}
}

draw_sprite_part_ext(sprite_index, 0, 0, 0, sprite_width, sprite_height, x, y, image_xscale, image_yscale, c_white, 1);
draw_sprite_part_ext(sprite_index, 1, 0, 0, sprite_width * myPortion, sprite_height, x, y, image_xscale, image_yscale, c_white, 1);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + image_xscale * (sprite_width / 2), y + image_yscale * ( sprite_height / 2), "Level " + string((o_ctrl.level + 1)))
draw_set_halign(fa_left);
draw_set_valign(fa_top);
