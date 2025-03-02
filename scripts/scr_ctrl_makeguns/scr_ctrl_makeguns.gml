function ctrl_makeguns(){
	guns = [
		new Gun("Pistol", 1, 0, 10, 1, false, 6, 6)
	]
	gun = 0;
	
	gunActive = function(gunName){
		for(var i = 0; i < array_length(guns); i++){
			if(guns[i].name == gunName){
				return true;
			}
		}
		return false;
	}
	
	updateGun = function(gunName, attribute, increase){
		for(var i = 0; i < array_length(guns); i++){
			if(guns[i].name == gunName){
				gun[i][$ attribute] += increase;
				return true;
			}
		}
		return false;	
	}
}

function Gun(name, bullets, spread, damage, rate, automatic, ammo, maxAmmo) constructor {
	name = name;
	bullets = bullets;
	spread = spread;
	damage = damage;
	rate =  rate;
	automatic = automatic;
	active = active;
	ammo = ammo;
	maxAmmo = maxAmmo;
}