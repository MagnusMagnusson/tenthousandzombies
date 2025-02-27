var halfpoint = collision_box_size / 2
if(point_in_box(other.x, other.y, other.z, x - halfpoint, y - halfpoint, z, x + halfpoint, y + halfpoint, z + height) && vitality > 0){
	vitality -= other.damage;
	instance_destroy(other);
	if(vitality <= 0){
		zspeed = 5;
		d = other.direction;
		direction = other.direction
		speed = other.speed * (other.damage / 200)
		height = 3;
	}
}