ctrl_startd3d();
ctrl_gameplay();
difficultyScaling = [0.5, 0.75, 1, 1.5, 2];
modifiers = [];
onRoundStartEffects = [];
onRoundEndEffects = [];

hurt = function(amount){
	if(immune <= 0){
		o_ctrl.hp -= amount;
		immune = 1;
		hurtFlash = 1;
	}
}

getScore = function(){
	return ceil(difficultyScaling[difficulty] * (zombiesKilled * 10 + producePicked + 2*timeBonus + bonusSkips * 200 + 246 * level));
}

killZombie = function(){
	zombiesKilled++;
	if(zombiesKilled >= killsToNextLevel){
		level++;
		timeBonus += clamp(time, 0, 100);
		time = 0;
		spawnStore();
	}
}

spawnStore = function(){
	storeOpen = true;
	instance_create_layer(0,0, "layer_Store", o_store);
	
	for(var i = 0; i < array_length(onRoundEndEffects); i++){
		var effect = onRoundEndEffects[i];
		effect.effect();
		effect.duration = effect.duration - 1;
	}
	onRoundEndEffects = array_filter(onRoundEndEffects, function(effect){
		return effect.duration > 0;
	});
}

newRound = function(first = false){
	storeOpen = false;
	lastLevelKillTotal = zombiesKilled;
	var rawKillIncrease = round(10000 * ((10 + 5*level) / 6670));
	killsToNextLevel = 1;// zombiesKilled + clamp(rawKillIncrease, 10, 10000 - zombiesKilled);
	spawnProduce();
	time = 150;
	for(var i = 0; i < array_length(onRoundStartEffects); i++){
		var effect = onRoundStartEffects[i];
		effect.effect();
		effect.duration = effect.duration - 1;
	}
	onRoundStartEffects = array_filter(onRoundStartEffects, function(effect){
		return effect.duration > 0;
	});
}

lastProduce = -1;
spawnerGroups = [];
spawnProduce = function(){
	var produce = lastProduce;
	while(produce == lastProduce){
		produce = irandom(7);
	}
	
	with(o_produceSpawner){
		if(ind == produce){
			spawn();
		}
	}
	lastProduce = produce;
}

sortProduceSpawners = function(){
	//Broad
	var lowX, lowY, highX, highY;
	lowX = room_width;
	lowY = room_height;
	highX = 0;
	highY = 0;
	var allSpawners = [];
	with(o_produceSpawner){
		show_debug_message("Hello?");
		lowX = min(x, lowX);
		lowY = min(y, lowY);
		highX = max(x, highX);
		highY = max(y, highY);
		array_push(allSpawners, id);
		ind = 0;
	}
	
	show_debug_message(string("Spawner boundaries at {0} {1} {2} {3}", lowX, highX, lowY, highY));
	
	highX += 1;
	highY += 1;
	
	array_sort(allSpawners, function(a,b) {
		return a.y - b.y;
	});
	
	for(var i = 0; i < array_length(allSpawners) div 2; i++){
		allSpawners[i].ind = 4; 
	}
		
	array_sort(allSpawners, function(a,b) {
		return a.x - b.x;
	});	
	
	for(var i = 0; i < array_length(allSpawners); i++){
		allSpawners[i].ind += 4*i div (array_length(allSpawners)); 
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

alarm[0] = 2;