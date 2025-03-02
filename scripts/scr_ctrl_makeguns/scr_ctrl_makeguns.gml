function ctrl_makeguns(){
	guns = [
		new Gun("Pistol", 1, 0, 0, 10, 1, false, 6, 6)
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

function Gun(_name, _bullets, _spread, _accuracy, _damage, _rate, _automatic, _ammo, _maxAmmo) constructor {
	name = _name;
	bullets = _bullets;
	accuracy = _accuracy;
	spread = _spread;
	damage = _damage;
	rate =  _rate;
	automatic = _automatic;
	ammo = _ammo;
	maxAmmo =_maxAmmo;
}