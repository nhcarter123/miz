obj_player.active = false;
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
} else if (count == 290 - time_offset) {
	obj_player.goal_text = "Hey Maya...";
	obj_player.current_text = "";
	obj_player.current_letter = 0;
	obj_player.text_count = -20;
} else if (count == 480 - time_offset) {
	obj_player.goal_text = "wanna..";
	obj_player.current_text = "";
	obj_player.current_letter = 0;
	obj_player.text_count = -20;
} else if (count == 650 - time_offset) {
	obj_player.goal_text = "*BURP*";
	obj_player.current_text = "";
	obj_player.current_letter = 0;
	obj_player.text_count = -20;
} else if (count == 790 - time_offset) {
	obj_player.goal_text = "come over to my house?";
	obj_player.current_text = "";
	obj_player.current_letter = 0;
	obj_player.text_count = -20;
} else if (count == 1040 - time_offset) {
	obj_player.goal_text = "";
	obj_player.current_text = "";
	
	obj_maya.goal_text = "Sure...";
	obj_maya.current_text = "";
	obj_maya.current_letter = 0;
	obj_maya.text_count = -20;
} else if (count == 1190 - time_offset) {
	obj_maya.goal_text = "..I guess";
	obj_maya.current_text = "";
	obj_maya.current_letter = 0;
	obj_maya.text_count = -20;
} else if (count > 1360 - time_offset && count < 1440 - time_offset) {
	obj_camera.shake = 7;
} else if (count == 1520 - time_offset) {
	obj_maya.goal_text = "Huh?!";
	obj_maya.current_text = "";
	obj_maya.current_letter = 0;
	obj_maya.text_count = -20;
	obj_maya.text_shake = true;
} else if (count == 1560 - time_offset) {
	obj_player.goal_text = "What?!?";
	obj_player.current_text = "";
	obj_player.current_letter = 0;
	obj_player.text_count = -20;
	obj_player.text_shake = true;
	audio_sound_gain(obj_game_manager.music,0,1500);
} else if (count == 1720 - time_offset) {
	obj_camera.rate = 0.04;
	obj_camera.tracking = instance_create_depth(x+1300,y-2700,0,obj_sex_dungeon);
	audio_stop_sound(obj_game_manager.music);
	obj_game_manager.music = audio_play_sound(snd_destiny_theme,0,1);
	audio_sound_gain(obj_game_manager.music,0,0);
	audio_sound_gain(obj_game_manager.music,1 * obj_game_manager.msx,1500);
} else if (count == 2300 - time_offset) {
	obj_maya.goal_text = "Oh look!";
	obj_maya.current_text = "";
	obj_maya.current_letter = 0;
	obj_maya.text_count = -20;
	obj_maya.text_shake = false;
	obj_camera.tracking = obj_maya;
} else if (count == 2380 - time_offset) {
	obj_player.goal_text = "Maya NOOO!!";
	obj_player.current_text = "";
	obj_player.current_letter = 0;
	obj_player.text_count = -20;
} else if (count > 2360 - time_offset && !hooked) {
	if (count > 2390) {
		count = 2360;
		with (obj_maya) {
			physics_apply_impulse(x,y,10,-20);
		}
		var snd = audio_play_sound(snd_footstep_grass,1,0);
		audio_sound_gain(snd,obj_game_manager.sfx,0);
	}
	if (obj_maya.phy_speed_x > 3) {
		obj_maya.phy_speed_x = lerp(obj_maya.phy_speed_x,3,0.7);
	}
	if (obj_maya.phy_position_x > x + 1000) {
		obj_sex_dungeon.hooked = obj_maya;
		hooked = true;
		obj_camera.tracking = obj_destiny;
	}
} else if (count == 2670 - time_offset) {
	obj_destiny.goal_text = "Another one for my collection";
	obj_destiny.current_text = "";
	obj_destiny.current_letter = 0;
	obj_destiny.text_count = -20;
} else if (count == 3000 - time_offset) {
	obj_camera.tracking = obj_player;
	obj_camera.rate = 0.2;
	audio_sound_gain(obj_game_manager.music,0,1000);
} else if (count == 3100 - time_offset) {
	obj_sex_dungeon.launch = true;
	obj_player.active = true;
	obj_player.text_shake = false;
	audio_stop_sound(obj_game_manager.music);
	obj_game_manager.intro = false;
	obj_game_manager.music = noone;
	instance_destroy();
}

if (!tripped && obj_player.x > x + 140) {
	tripped = true;
	instance_create_depth(x+700,y-800,0,obj_maya);
}

if (obj_player.phy_position_x > x + 205) {
	obj_player.phy_position_x = x + 205;
}

count += 1;
