index += 0.1;
pulse = sin(index);

image_xscale = 1 + pulse / 40;
image_yscale = 1 + pulse / 40;

if (once) {
	once--;
	if (once == 0) {
		once = 0;
		audio_emitter_gain(emitter,1 * obj_game_manager.sfx);
	}
}

audio_emitter_position(emitter,x,y,0);

if (dead == 2) {
	dead = 1;
	mov_y = -18;
	mov_x = random_range(-4, 4);
} else if (dead == 1) {
	phy_position_x += mov_x;
	phy_position_y += mov_y;
	mov_y += 0.6;

} else {
	
	phy_position_x -= 4;
	phy_position_y = start_y + sin(index / 5) * 200 + mod_y;

	
	if (obj_player.x > 11800) {
		mod_y -= 14;
	} else {
		if (x < 1400) {
			mod_y += 6;
		}
	}
	
	if (physics_test_overlap(x,y,image_angle,obj_player)) {
		with (obj_player) {
			if (!dead && !kill_cooldown) {
				var dir = point_direction(x,y,other.x,other.y);
				if (abs(angle_difference(dir, -phy_rotation-90)) < 60) {
					var snd = audio_play_sound(snd_die,1,0);
					audio_sound_gain(snd,obj_game_manager.sfx,0);
					other.dead = 2;
					other.phy_active = false;
					kill_cooldown = 10;
		
					double_jump = 0;
					
					slam_down = 0;
					phy_speed_y = 0;
					physics_apply_impulse(x,y,0,-105);
					double_jump = 1;
					dash = 0;
		
					jump_cooldown = 10;
					grounded = 8;
					instance_create_depth(other.x,other.y - 20,-20,obj_death);
				} else {
					dead = 10;
					red_alpha = 0.2;
					var snd = audio_play_sound(snd_hurt,1,0);
					audio_sound_gain(snd,obj_game_manager.sfx,0);
					phy_active = false;
					if (x < other.x) {
						mov_x = -3;
					} else {
						mov_x = 3;
					}
				}
			}
		}
	}
}

if (y > 2500 || y < -4000) {
	instance_destroy();	
}