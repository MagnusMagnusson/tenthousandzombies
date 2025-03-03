draw_self()

if(!model){
	model = ModelManager().get(models[type], true);
}
if(!ld_model){
	ld_model = ModelManager().get(ld_models[type], true);
}
if(o_player.lookingAt(x,y)){
	var d = point_distance(x, y, o_player.x, o_player.y);
	var dir = point_direction(xprevious, yprevious, x, y)

	if(d < 100){
		model.draw_ext(x,y,z,0,0,dir, 1, 1, 1);
	} else {
		ld_model.draw_ext(x,y,z,0,0,dir, 1, 1, 1);
	}
}