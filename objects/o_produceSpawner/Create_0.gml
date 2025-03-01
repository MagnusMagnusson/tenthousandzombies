spawn = function(){
	if(!place_meeting(x, y, o_produce)){
		show_debug_message(string("spawned produce at {0} {1}", x, y));
		instance_create_layer(x, y, layer, o_produce);
	}
}