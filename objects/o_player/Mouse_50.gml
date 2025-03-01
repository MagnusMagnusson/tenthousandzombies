var gun = o_ctrl.gun;

if(game_active() && releasedTrigger && shotDelay <= 0){
	releasedTrigger = gun.automatic;
	shotDelay = gun.rate;
	var spread = degtorad(gun.spread);
	var accuracy = degtorad(gun.accuracy);
	var bulletCount = gun.bullets;
	for(var i = 0; i < bulletCount; i++){
		var b = instance_create_layer(x, y, layer, o_bullet);
		var dir = o_camera.lookat.Add(new Vector(o_camera.x, o_camera.y, o_camera.z).Invert())
		dir = dir.normal(8);
		b.zspeed = dir._z;		
		b.hspeed = dir._x;		
		b.vspeed = dir._y;
		b.damage = gun.damage;
		
		var r = dir.magnitude();
		var theta = arccos(b.zspeed / r);
		var phi = arctan2(b.vspeed, b.hspeed);
		var delta_theta = random_range(-accuracy, accuracy);
		var delta_phi = random_range(-accuracy, accuracy);
		var theta_prime = theta + delta_theta;
		var phi_prime = phi + delta_phi;
		
		var newDir = new Vector(
			r * sin(theta_prime) * cos(phi_prime),
			r * sin(theta_prime) * sin(phi_prime),
			r * cos(theta_prime)
		);
		b.zspeed = newDir._z;
		b.vspeed = newDir._y;
		b.hspeed = newDir._x;
		b.z = z + 10;
	}

} 