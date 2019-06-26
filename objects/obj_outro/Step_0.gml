obj_player.active = false;
if (speech) {
	if (count == 180) {
		obj_player.goal_text = "Maya is trapped inside";
		obj_player.current_text = "";
		obj_player.current_letter = 0;
		obj_player.text_count = -20;
	} else if (count == 360) {
		obj_player.goal_text = "I have to save her";
		obj_player.current_text = "";
		obj_player.current_letter = 0;
		obj_player.text_count = -20;
		obj_player.text_shake = true;
	} else if (count == 500) {
		speech = false;
		door_dist += 760;
		tripped = false;
	}
} else {
	if (!tripped) {
		if (count > 30) {
			count = 0;
			with (obj_player) {
				physics_apply_impulse(x,y,10,-20);
			}
			var snd = audio_play_sound(snd_footstep_grass,1,0);
			audio_sound_gain(snd,obj_game_manager.sfx,0);
		}
		if (obj_player.phy_speed_x > 3) {
			obj_player.phy_speed_x = lerp(obj_player.phy_speed_x,3,0.7);
		}
	} else if (count == 120 && once) {
		obj_sex_dungeon_finish.open = 50;
		tripped = false;
		door_dist += 200;
		once = 0;
	} else if (count == 280) {
		obj_player.text_shake = false;
		audio_stop_sound(obj_game_manager.music);
		obj_game_manager.intro = false;
		obj_game_manager.music = noone;
		instance_destroy();
		
		var inst = instance_create_depth(0,0,0,obj_transition);
		inst.destination = rm_level_select;

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

if (obj_player.phy_position_x > x + door_dist) {
	obj_player.phy_position_x = x + door_dist;
	tripped = true;
}

count += 1;
