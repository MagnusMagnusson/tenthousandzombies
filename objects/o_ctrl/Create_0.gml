ctrl_startd3d();
ctrl_gameplay();
difficultyScaling = [0.5, 0.75, 1, 1.5, 2];

setDifficulty = function(difficulty){
	
}

getScore = function(){
	return ceil(difficultyScaling[difficulty] * (zombiesKilled * 10 + producePicked * 0.1 + 2*timeBonus + bonusSkips * 150 + 220 * (zombiesKilled div 100)));
}

killZombie = function(){
	zombiesKilled++;
	if(zombiesKilled >= killsToNextLevel){
		show_message("NEW LEVEL");
		level++;
		lastLevelKillTotal = zombiesKilled;
		var rawKillIncrease = round(10000 * ((10 + 5*level) / 22945));
		killsToNextLevel = zombiesKilled + clamp(rawKillIncrease, 10, 10000 - zombiesKilled);
		timeBonus += clamp(time, 0, 100);
		time = 150;
	}
}

gun = {
	"bullets": 1,
	"spread": 0,
	"damage": 10,
	"rate" : 0,
	"accuracy": 0,
	"automatic": false
}

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