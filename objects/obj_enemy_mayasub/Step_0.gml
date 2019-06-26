index += 0.2;
pulse = sin(index);

image_xscale = 1 + pulse / 30;
image_yscale = 1 + pulse / 30;

if (dead == 2) {
	dead = 1;
	mov_y = -18;
	mov_x = random_range(-4, 4);
} else if (dead == 1) {
	phy_position_x += mov_x;
	phy_position_y += mov_y;
	mov_y += 0.6;

	if (y > 2500) {
		instance_destroy();	
	}
} else {
	
	phy_position_x += mov_dir * 3;
	
	if (platform != noone) {
		phy_position_y = lerp(phy_position_y, platform.y - 25, 0.1);
		
		if (phy_position_x < platform.left + 50) {
			mov_dir = 1;
		} else if (phy_position_x > platform.right - 50) {
			mov_dir = -1;
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
	
	/*change_dir--;

	if (!change_dir) {
		
		
		
		if (physics_test_overlap(x,y-5,image_angle,obj_solid)) {
			change_dir = 30;
			mov_dir *= -1;
		}		
	}*/
}