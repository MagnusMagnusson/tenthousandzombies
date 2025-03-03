if(!layer_get_visible("layer_ux")) exit;

if (window_mouse_get_x() > x && window_mouse_get_x() < x + sprite_width 
&& window_mouse_get_y() > y && window_mouse_get_y() < y + sprite_height
){
	global.difficulty = difficulty;
	room_goto(rm_farm);
}