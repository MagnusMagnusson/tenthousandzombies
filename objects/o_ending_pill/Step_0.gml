rot+=1.5;
z += zspeed;
zspeed += dir * 0.05;
if(zspeed < -0.75){
	dir = 1;
}
if(zspeed > 0.75){
	dir = -1;
}

if(distance_to_object(o_player) <= 25 && !instance_exists(o_eyelids_close)){
	var i = instance_create_depth(0,0,depth, o_eyelids_close);
	i.f = f;
}