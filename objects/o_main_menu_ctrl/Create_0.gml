d3d_start();
var camera = o_free_camera;
menuCamera = d3d_camera_create(camera,735, 50, 30, "cameras", 70, 1378, 730, new Vector(0,0,0));

menuCamera.lookat = new Vector(316,622,212);
menuCamera.locked = 1;
menuCamera.vspeed = -0.1;

highscores_get(function(data){
	show_debug_message("Got some data!");
	try{
		var d = json_parse(data);
		global.highscores = d.results;
		array_sort(global.highscores, function(a,b){
			return b.score - a.score;
		})
	} catch(err){
		show_debug_message(err);
	}
})

step = 0;
alpha = 0;

if(!global.firstOpen){
	step = 5;
	alpha = 1;
	event_user(0);
	menuCamera.y = -600;
}

for(var i = 0; i <= room_width; i += 10){
	if(!place_meeting(i, 0, o_zombiegate)){
		instance_create_layer(i, 0, "Instances", o_wall);
	}	
	if(!place_meeting(i, room_height, o_zombiegate)){
		instance_create_layer(i, room_height, "Instances", o_wall);
	}
}

for(var j = 0; j <= room_height; j += 10){
	if(!place_meeting(0, j, o_zombiegate)){
		instance_create_layer(0, j, "Instances", o_wall);
	}	
	if(!place_meeting(room_width, j, o_zombiegate)){
		instance_create_layer(room_width, j, "Instances", o_wall);
	}
}

for(var i = 0; i < 30; i++){
	for(var j = 0; j < 100; j++){
		instance_create_layer(random(20) + 40 * i, random(20) -20 +  (-j * 40), "Instances", o_fakezombie );
	}
}
