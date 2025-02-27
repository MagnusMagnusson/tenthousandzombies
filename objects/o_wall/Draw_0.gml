draw_self();
if(global.debug && !is_undefined(model)){
	var w = image_xscale * sprite_get_width(s_wall);
	var h = image_yscale * sprite_get_height(s_wall)
	model.draw_ext(
		x - w/2,y - h/2,z,
		0,0,0,
		w,h,height
	);
} else {
	model = ModelManager().get("cube", false);
}