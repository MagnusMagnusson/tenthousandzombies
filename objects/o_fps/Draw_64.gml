if(active){
	draw_set_font(fnt_UI);
	draw_set_halign(fa_left);
	draw_set_alpha(1);
	draw_text(0,0, fps);
	draw_text(0,16, fps_real);
}