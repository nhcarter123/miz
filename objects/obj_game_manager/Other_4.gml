if (room == rm_level_select) {
	
	with (obj_node) {
		if (level == other.current_level) {
			other.current_node = id;
		}
	}
	icon_x = current_node.x;
	icon_y = current_node.y;
	
	if (last_room != rm_menu) {
		audio_stop_sound(music);
		music = audio_play_sound(snd_menu_music,1,1);
		audio_sound_gain(music,obj_game_manager.msx,0);
	}
} else if (room == rm_menu) {
	if (!music) {
		music = audio_play_sound(snd_menu_music,1,1);
		audio_sound_gain(music,obj_game_manager.msx,0);
	}
} else {
	audio_stop_sound(music);
	music = noone;
}