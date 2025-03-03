draw_set_color(c_red);
draw_set_alpha(image_alpha);

draw_rectangle(0,0, room_width, room_height, false);

draw_set_alpha(1);

if(image_alpha > 1){
	var c = view_get_camera(0);
	var w = camera_get_view_width(c);
	var h = camera_get_view_height(c);

	draw_set_font(fnt_title);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text(w / 2, 16, "GAME OVER!");
	
	draw_set_font(fnt_store_big);
	var tables = [
		["Zombies killed", o_ctrl.zombiesKilled, 10 * o_ctrl.difficultyScaling[o_ctrl.difficulty]],
		["Produce picked", o_ctrl.producePicked, 2 * o_ctrl.difficultyScaling[o_ctrl.difficulty]],
		["Time Bonus", o_ctrl.timeBonus, 1 * o_ctrl.difficultyScaling[o_ctrl.difficulty]],
		["Bonuses Skipped", o_ctrl.bonusSkips, 200 * o_ctrl.difficultyScaling[o_ctrl.difficulty]],
		["Levels Cleared", o_ctrl.level, 246 * o_ctrl.difficultyScaling[o_ctrl.difficulty]]
	]

	var yy = 0;
	draw_set_halign(fa_right);
	for(var i = 0; i < array_length(tables); i++){
		var row = tables[i];
		draw_text(w - 200, 100 + (4 + string_height("a") * i), string("{0}  :  {1}  x  {2}  =  {3}", row[0], row[1], row[2], ceil(row[1]*row[2])))
	}
		
	draw_text(w - 200, 100 + (4 + string_height("a") * array_length(tables)),"===============================")
	draw_text(w - 200, 100 + (4 + string_height("a") * (1+ array_length(tables))), o_ctrl.getScore())

	var yy = 100 + (4 + string_height("a") * (1+ array_length(tables)));
	
	draw_set_font(fnt_UI);
	draw_set_halign(fa_center);
	draw_text(w / 2, yy + 3 * string_height("A"), "Please type in your name, and then press 'Enter'")
	draw_text(w / 2, yy + 4 * string_height("A"), "(If this is better than your current record, this will overwrite it. Leave blank to not submit)");
	draw_text(w / 2,  yy + 5 * string_height("A"), keyboard_string);

}
