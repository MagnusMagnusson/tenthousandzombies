var scr = o_ctrl.getScore();
if(game_active()){
	if(scr > myscore){
		myscore++;
	} else {
		myscore = scr;
	}
}