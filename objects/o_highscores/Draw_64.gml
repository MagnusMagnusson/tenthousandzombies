var l = array_length(global.highscores);
draw_set_color(0);
draw_set_alpha(0.8);
draw_rectangle(8, 0, 400, 500, false);


draw_set_font(fnt_UI);
draw_set_color(c_white);
draw_set_halign(fa_left);

if(l == 0){
	draw_text( 16, 0, "No highscores found");
} else {
	var diffNames = ["Gallery", "Easy", "Standard", "Hard", "Ironman"];
	for(var i = 0; i < min(25, l); i++){
		var s = global.highscores[i];
		try{
			draw_text(16, 0 + string_height("a") * i, string("{0}. {1} - {2}pts - {3}", string(i + 1), s.name, s.score, diffNames[s.difficulty]));
		} catch(ex){
			continue;
		}
	}
}
