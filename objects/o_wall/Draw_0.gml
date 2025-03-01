draw_self();
if(!is_undefined(model)){
	model.draw_ext(
		x,y,0,
		0,0,0,
		10, 10, 5
	);
} else {
	model = ModelManager().get("cube", false);
}