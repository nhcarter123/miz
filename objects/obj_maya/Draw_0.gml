draw_sprite_ext(sprite_index,0,true_x,true_y,image_xscale,image_yscale,image_angle,c_white,1);

natty_index += 0.05;
draw_sprite_ext(spr_natty,0,true_x - 65,true_y + 10 + sin(natty_index) * 3,0.4,0.4,image_angle,c_white,1);

if (goal_text != "") {
	if (text_alpha < 1) {
		text_alpha += 0.03;
	}
} else if (text_alpha > 0) {
	text_alpha -= 0.03;
}

draw_sprite_ext(spr_bubble,0,x,y-100,1,1,0,c_white,text_alpha);
draw_set_font(ft_speech);
draw_set_halign(fa_middle);

draw_set_alpha(text_alpha);
draw_text_readout(x+30,y-305,40,250,1);
draw_set_alpha(1);