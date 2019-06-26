if (abs(obj_player.x - x) < 30 && abs(obj_player.y - y) < 200 && !obj_player.dead) {
	obj_player.active = false;
	image_index = 1;
	if (count == 0) {
		count = 1;
		
		var snd = audio_play_sound(snd_finish,1,0);
		audio_sound_gain(snd,obj_game_manager.sfx,0);
		
		if (obj_game_manager.current_level < 13) {
			obj_game_manager.current_level++;
		}
		if (obj_game_manager.current_level > obj_game_manager.unlocked_level) {
			obj_game_manager.unlocked_level++;
		}
		
		var file = obj_game_manager.file;

		var wrapper = load_json(file);
	
		ds_map_replace(wrapper,"unlocked_level",obj_game_manager.unlocked_level);
		ds_map_replace(wrapper,"current_level",obj_game_manager.current_level);
	
		var save_string = json_encode(wrapper);
		save_string_to_file(file,save_string);
	}
}

if (count > 0) {
	count++;
	if (count > 40) {
		count = -1;
		var inst = instance_create_depth(0,0,0,obj_transition);
		inst.destination = rm_level_select;
	}
}
