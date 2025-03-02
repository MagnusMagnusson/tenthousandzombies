ctrl_startd3d();
ctrl_gameplay();
ctrl_makeguns();
ctrl_extrafunctions();




for(var i = 0; i <= room_width; i += 10){
	if(!place_meeting(i, 0, o_zombiegate)){
		instance_create_layer(i, 0, "o_world", o_wall);
	}	
	if(!place_meeting(i, room_height, o_zombiegate)){
		instance_create_layer(i, room_height, "o_world", o_wall);
	}
}

for(var j = 0; j <= room_height; j += 10){
	if(!place_meeting(0, j, o_zombiegate)){
		instance_create_layer(0, j, "o_world", o_wall);
	}	
	if(!place_meeting(room_width, j, o_zombiegate)){
		instance_create_layer(room_width, j, "o_world", o_wall);
	}
}

alarm[0] = 2;
setDifficulty(global.difficulty)