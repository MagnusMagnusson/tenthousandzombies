if(ind < len){	
	var m = ModelManager().get(models[ind]);
	ind += 1;
} else {
	if(alarm[0] < 0){
		alarm[0] = 15;
	}
}