d3d_object_step();
damage--;
if(z < 0 || damage < 0){
	instance_destroy();
}

if(irandom(5) == 2){
	var s = instance_create_layer(x,y,layer,o_smoke);
	s.z = z;
}