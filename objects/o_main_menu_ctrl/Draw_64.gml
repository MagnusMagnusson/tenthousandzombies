var c = view_get_camera(0);
var w = camera_get_view_width(c);
var h = camera_get_view_height(c);

var speedScale = 1;


if(step < 5){
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fnt_UI);
	draw_set_halign(fa_left);
	draw_text(16, h - string_height("A"), "Press space to skip");
}

draw_set_halign(fa_center)
switch(step){
	case 0:{
		draw_set_color(c_white);
		draw_set_font(fnt_UI);
		draw_set_alpha(alpha);
		alpha += 0.004 * speedScale;
		draw_text(w / 2, 32, "Mr. Magnus presents");
		if(alpha >= 1){
			step = 1;
			alpha = 0;
		}
		break;
	}	
	case 1:{
		draw_set_color(c_white);
		draw_set_font(fnt_UI);
		draw_text(w / 2, 32, "Mr. Magnus presents");
		draw_set_alpha(alpha);
		alpha += 0.004 * speedScale;
		draw_set_halign(fa_center)
		draw_text(w / 2, 50, "A terrifyingly rushed experience");
		if(alpha >= 1){
			step = 2;
		}
		break;
	}
	case 2:{
		draw_set_color(c_white);
		draw_set_font(fnt_UI);
		draw_text(w / 2, 32, "Mr. Magnus presents");
		draw_set_alpha(alpha);
		alpha -= 0.004 * speedScale;
		draw_set_halign(fa_center)
		draw_text(w / 2, 50, "A terrifyingly rushed experience");
		if(alpha < 0){
			step = 3;
		}
		break;
	}
	case 3:{
		draw_set_color(c_white);
		draw_set_font(fnt_UI);
		draw_text(w / 2, 32, "Mr. Magnus presents");
		draw_set_alpha(alpha);
		alpha += 0.006 * speedScale;
		
		draw_set_font(fnt_title);
		draw_set_halign(fa_center)
		draw_text(w / 2, 50, "HELP!");
		if(alpha >= 1){
			step = 4;
			alpha = 0;
		}
		break;
	}
	case 4:{
		draw_set_color(c_white);
		draw_set_font(fnt_UI);
		draw_text(w / 2, 32, "Mr. Magnus presents");
		
		draw_set_font(fnt_title);
		draw_text(w / 2, 50, "HELP!");
		draw_set_alpha(alpha);
		alpha += 0.006 * speedScale;
		
		draw_set_font(fnt_title_small);
		draw_set_halign(fa_center)
		draw_text(w / 2, 100, "Ten thousand zombies are threatening my farm,\nbut I have to harvest the crops!");
		
		if(alpha >= 1){
			step = 5;
			event_user(0);
		}
		
		break;
	}	
	
	case 5:{
		draw_set_color(c_white);
		draw_set_font(fnt_UI);
		draw_text(w / 2, 32, "Mr. Magnus presents");
		draw_set_font(fnt_title);
		draw_text(w / 2, 50, "HELP!");
		draw_set_font(fnt_title_small);
		draw_text(w / 2, 100, "Ten thousand zombies are threatening my farm,\nbut I have to harvest the crops!");

		break;
	}
}

draw_set_alpha(1);