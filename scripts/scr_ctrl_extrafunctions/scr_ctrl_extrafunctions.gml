function ctrl_extrafunctions(){

hurt = function(amount){
	if(immune <= 0 && !instance_exists(o_store)){
		o_ctrl.hp -= amount;
		immune = 1;
		hurtFlash = 1;
	}
}

getScore = function(){
	show_debug_message(difficulty);
	return extraScore + ceil(difficultyScaling[difficulty] * (zombiesKilled * 10 + 2*producePicked + timeBonus + bonusSkips * 200 + 246 * level));
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
		hp = min(maxHp, hp + levelRegen * maxHp);
		instance_create_layer(0,0, "layer_Store", o_store);
	
		for(var i = 0; i < array_length(onRoundEndEffects); i++){
			var effect = onRoundEndEffects[i];
			effect.effect();
			effect.duration = effect.duration - 1;
		}
		onRoundEndEffects = array_filter(onRoundEndEffects, function(effect){
			return effect.duration > 0;
		});
		with(o_zombie){
			if(point_distance(x,y,o_player.x, o_player.y) < 50){
				instance_destroy();
			}
		}
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
	
	setDifficulty = function(_difficulty){
		difficulty = _difficulty;
		switch(_difficulty){
			case 0 : {
				hpRegen = 1;
				levelRegen = 1;
				startingWeapon = "Shotgun";
				difficulty = difficulty;
				maxHp = max(150, maxHp);
				hp = maxHp;
				healingItems = true;
				break;
			}
			case 1 : {
				hpRegen = 0.5;
				levelRegen = 0.5;
				difficulty = difficulty
				startingWeapon = "Pistol";
				maxHp = max(100, maxHp);
				hp = maxHp;
				healingItems = true;
				break;
			}
			case 2 : {
				hpRegen = 0.25;
				levelRegen = 0.2;
				difficulty = difficulty
				startingWeapon = "Pistol";
				maxHp = max(100, maxHp);
				hp = maxHp;
				healingItems = true;
				break;
			}
			case 3 : {
				hpRegen = 0;
				levelRegen = 0;
				difficulty = difficulty
				startingWeapon = "Pistol";
				maxHp = max(100, maxHp);
				hp = maxHp;
				healingItems = true;
				break;
			}
			case 4 : {
				hpRegen = 0;
				levelRegen = 0;
				difficulty = difficulty
				startingWeapon = "Shotgun";
				maxHp = max(200, maxHp);
				hp = maxHp;
				healingItems = false;
				break;
			}
		}
	}
}