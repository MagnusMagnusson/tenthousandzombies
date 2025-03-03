var s = string_replace(keyboard_string, " ", "");
if(s != ""){
	highscores_post(global.opt.uuid, s, o_ctrl.getScore(), o_ctrl.difficulty);
}

room_goto(rm_main_menu);