close += 2;
if(close > 100){
	instance_destroy();
	instance_create_depth(0,0, depth, o_eyelids_open);
	f();
}