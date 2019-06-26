

if (!dead && other.is_ground == -1 && !other.dead) {
	var dir = point_direction(x,y,phy_collision_x,phy_collision_y);
	if (abs(angle_difference(dir, 90)) < 60) {
		with (other) {
			if (!kill_cooldown) {
				var snd = audio_play_sound(snd_die,1,0);
				audio_sound_gain(snd,obj_game_manager.sfx,0);
				other.dead = 2;
				other.phy_active = false;
				kill_cooldown = 10;
		
				double_jump = 0;
				dash = 0;
					
				slam_down = 0;
				phy_speed_y = 0;
				physics_apply_impulse(x,y,0,-105);
				double_jump = 1;
		
				jump_cooldown = 10;
				grounded = 8;
				instance_create_depth(other.x,other.y - 20,-20,obj_death);
			}
		}
	} else {
		other.dead = 10;
		other.red_alpha = 0.2;
		var snd = audio_play_sound(snd_hurt,1,0);
		audio_sound_gain(snd,obj_game_manager.sfx,0);
		var snd = audio_play_sound(snd_omega,1,0);
		audio_sound_gain(snd,obj_game_manager.sfx,0);
		other.phy_active = false;
		if (x < other.x) {
			other.mov_x = -3;
		} else {
			other.mov_x = 3;
		}
	}
}