var s = string_replace(keyboard_string, " ", "");
if(typing && s != ""){
	highscores_post(global.opt.uuid, s, o_ctrl.getScore(), o_ctrl.difficulty);
}

alarm[0] = 30;