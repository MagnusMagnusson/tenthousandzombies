globalvar allitems;

allitems = [
	//Instants
	new Item("Band-aid", "Heals 10 health", undefined, 10, new Effect(function(){o_ctrl.heal(10)})),
	new Item("Patch", "Heals 25 health", undefined, 20, new Effect(function(){o_ctrl.heal(25)})),
	new Item("Self-adhesive Bandages", "Heals 50 health", undefined, 35, new Effect(function(){o_ctrl.heal(50)})),
	new Item("Pocket-doctor", "Heals 100 health", undefined, 50, new Effect(function(){o_ctrl.heal(100)})),
	
	//Passives
	
	new Item("Loan", "Grants you 100 gold now, at the cost of 150 gold at the end of the next level", undefined, -100, undefined, undefined, new Effect({effect: function(){o_ctrl.gold -= 150}})),
	
	//Weapons
	new Item("Shotgun", "Shoots a spread of high-damage projectiles, but reloads often", undefined, 200, new Effect(function(){o_ctrl.setWeapon("shotgun")})),
	new Item("Machine Gun", "Fully automatic gun that sprays a constant single stream of bullets", undefined, 300, new Effect(function(){o_ctrl.setWeapon("machine gun")})),
	new Item("Rocket Launcher", "Shoots large projectiles that explode upon impact", undefined, 400, new Effect(function(){o_ctrl.setWeapon("rocket launcher")}))
];