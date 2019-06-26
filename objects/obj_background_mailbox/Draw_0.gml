draw_sprite_ext(sprite_index,image_index,x + obj_camera.vpos_x / scaling,y + obj_camera.vpos_y / scaling,image_xscale,image_yscale,image_angle,c_white,1);

if (abs(x + obj_camera.vpos_x / scaling - obj_player.x) < 220) {
	if (alpha < 1) {
		alpha += 0.05;	
	}
} else {
	if (alpha > 0) {
		alpha -= 0.05;	
	}	
}

key_angle = lerp(key_angle,0,0.2);
key_scale = lerp(key_scale,1,0.2);

if (alpha > 0) {
	
	index += 0.06;
	var scl = key_scale + sin(index) / 12;

	draw_set_alpha(alpha);
	draw_sprite_ext(spr_key_icon,image_index,x + obj_camera.vpos_x / scaling,y - 100 + obj_camera.vpos_y / scaling,0.35 * scl,0.35 * scl,key_angle,c_white,alpha);
	draw_set_color(c_black);
	draw_set_valign(fa_center);
	draw_set_halign(fa_middle);
	draw_set_font(ft_start);
	draw_text_transformed(x + obj_camera.vpos_x / scaling,y - 100 + obj_camera.vpos_y / scaling,"E",scl,scl,key_angle);
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	
	if (alpha > 0.3 && keyboard_check_pressed(ord("E")) && obj_player.goal_text == "") {
		key_angle = -30;
		key_scale = 0.75;
		var snd = audio_play_sound(snd_text_click,1,0);
		audio_sound_gain(snd,obj_game_manager.sfx,0);
		obj_player.goal_text = text[text_index];
		obj_player.current_text = "";
		obj_player.current_letter = 0;
		obj_player.text_count = -20;
		if (text_index < array_length_1d(text) -1) {
			text_index++;
		}
	}
}