if (!audio_is_playing(music) && !intro) {
	audio_stop_sound(music);
	var choice = choose(current_level);
	switch (choice) {
		case 1:
			music = audio_play_sound(snd_ambient2,1,0);
			break;
		case 2:
			music = audio_play_sound(snd_ambient1,1,0);
			break;
		case 3:
			music = audio_play_sound(snd_ambient3,1,0);
			break;
		case 4:
			music = audio_play_sound(snd_music5,1,0);
			break;
		case 5:
			music = audio_play_sound(snd_music6,1,0);
			break;
		case 6:
			music = audio_play_sound(snd_music4,1,0);
			break;
	}
	audio_sound_gain(music,0,0);
	audio_sound_gain(music,1 * msx,2000);
}

if (room == rm_level_select && current_node != noone) {	
	
	if (current_node.level >= 7) {
		obj_title4.sprite_index = spr_menu_text6;
		obj_title5.sprite_index = spr_menu_text7;
	} else {
		obj_title4.sprite_index = spr_menu_text4;
		obj_title5.sprite_index = spr_menu_text5;
		obj_title6.visible = false;
	}
	
	var good = true;
	if (current_node.level == 7) {
		good = false;
		if (pos_y < 15500) {
			with (all) {
				if (id != other) {
					y += 20;	
					other.pos_y += 20;
					other.icon_y += 0.7;
				}
			}
		} else {
			good = true;
		}
	} else if (current_node.level == 6) {
		good = false;
		if (pos_y > 0) {
			with (all) {
				if (id != other) {
					y -= 20;
					other.pos_y -= 20;
					other.icon_y -= 0.7;
				}
			}
		} else {
			good = true;	
		}
	}
	
	if (current_node.level >= 7 && good) {
		obj_title6.visible = true;	
	}
	
	index += 0.05;
	var scl = (sin(index) + 1) / 60;
	draw_sprite_ext(spr_egg,0,icon_x,icon_y - 30,0.3 + scl,0.3 + scl,0,c_white,1);
	
	if (good) {
		icon_x = lerp(icon_x,current_node.x,0.1);
		icon_y = lerp(icon_y,current_node.y,0.1);
		

		if (keyboard_check_pressed(ord("W"))) {
			min_angle = 90;
			closest = current_node;
			with (obj_node) {
				if (level <= other.unlocked_level) {
					if (child == other.current_node || other.current_node.child == id) {
						var diff = abs(angle_difference(point_direction(other.current_node.x,other.current_node.y,x,y),90));
						if (diff < other.min_angle) {
							other.min_angle = diff;
							other.closest = id;
						}
					}
				}
			}
			current_node = closest;
		} else if (keyboard_check_pressed(ord("A"))) {
			min_angle = 90;
			closest = current_node;
			with (obj_node) {
				if (level <= other.unlocked_level) {
					if (child == other.current_node || other.current_node.child == id) {
						var diff = abs(angle_difference(point_direction(other.current_node.x,other.current_node.y,x,y),180));
						if (diff < other.min_angle) {
							other.min_angle = diff;
							other.closest = id;
						}
					}
				}
			}
			current_node = closest;
		} else if (keyboard_check_pressed(ord("S"))) {
			min_angle = 90;
			closest = current_node;
			with (obj_node) {
				if (level <= other.unlocked_level) {
					if (child == other.current_node || other.current_node.child == id) {
						var diff = abs(angle_difference(point_direction(other.current_node.x,other.current_node.y,x,y),270));
						if (diff < other.min_angle) {
							other.min_angle = diff;
							other.closest = id;
						}
					}
				}
			}
			current_node = closest;
		} else if (keyboard_check_pressed(ord("D"))) {
			min_angle = 90;
			closest = current_node;
			with (obj_node) {
				if (level <= other.unlocked_level) {
					if (child == other.current_node || other.current_node.child == id) {
						var diff = abs(angle_difference(point_direction(other.current_node.x,other.current_node.y,x,y),0));
						if (diff < other.min_angle) {
							other.min_angle = diff;
							other.closest = id;
						}
					}
				}
			}
			current_node = closest;
		} else if (!instance_exists(obj_transition) && (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space)) && current_node.level < 7) {
		
			current_level = current_node.level;
			var inst = instance_create_depth(0,0,0,obj_transition);
		
			switch(current_node.level) {
				case 1:
					inst.destination = rm_level1_1;
					break;
				case 2:
					inst.destination = rm_level1_2;
					break;
				case 3:
					inst.destination = rm_level1_3;
					break;
				case 4:
					inst.destination = rm_level1_4;
					break;
				case 5:
					inst.destination = rm_level1_5;
					break;
				case 6:
					inst.destination = rm_level1_6;
					break;
			}
		}
	}
}

if (keyboard_check_pressed(ord("K"))) {
	var file = obj_game_manager.file;

	var wrapper = load_json(file);
	
	ds_map_replace(wrapper,"unlocked_level",1);
	ds_map_replace(wrapper,"current_level",1);
	ds_map_replace(wrapper,"deaths",1);
	
	var save_string = json_encode(wrapper);
	save_string_to_file(file,save_string);
}

if (keyboard_check_pressed(ord("R"))) {
	game_restart();	
}

if (keyboard_check_pressed(vk_escape) && !instance_exists(obj_transition)) {
	var inst = instance_create_depth(0,0,0,obj_transition);
	inst.destination = rm_level_select;
}