true_x = x;
true_y = y;

if (dead > 1) {
	dead--;
	mov_y = -18;
	obj_camera.shake = 12;
} else if (dead == 1) {
	phy_position_x += mov_x;
	phy_position_y += mov_y;
	mov_y += 0.6;
} else if (active) {
	if (jump_cooldown > 0) {
		jump_cooldown--;
		grounded = 0;
	}
	if (kill_cooldown > 0) {
		kill_cooldown--;
	}

	if (grounded > 0) {
		grounded--;
		if (!grounded) {
			double_jump = 1;
			dashed = false;
		}
	
		if (!jump_cooldown && keyboard_check_pressed(vk_space)) {
			jump = 4;
			jump_cooldown = 10;
			double_jump = 1;
			dashed = false;
			slam_down = 0;
			var snd = audio_play_sound(snd_jump,1,0);
			audio_sound_gain(snd,obj_game_manager.sfx,0);
			var inst = instance_create_depth(x-25,y+10,20,obj_dash);
			inst.image_xscale = 0.3;
			inst.image_yscale = 1.5;
			inst.image_angle = 90;
		}

		if (keyboard_check(ord("D"))) {
			physics_apply_force(x,y,65,0);
		}

		if (keyboard_check(ord("A"))) {
			physics_apply_force(x,y,-65,0);	
		} 

	} else {
		if (keyboard_check(ord("D"))) {
			physics_apply_force(x,y,35,0);
		}

		if (keyboard_check(ord("A"))) {
			physics_apply_force(x,y,-35,0);
		}
	
		if (jump_cooldown == 0 && double_jump == 1 && keyboard_check_pressed(vk_space)) {
			jump = 4;
			jump_cooldown = 10;
			double_jump = 2;
			instance_create_depth(x,y+30,20,obj_death);
			var snd = audio_play_sound(snd_jump,1,0);
			audio_sound_gain(snd,obj_game_manager.sfx,0);
		}
	}


	if (jump > 0) {
		jump--;
		//physics_apply_local_force(0,0,0,-1200 - phy_speed_y * 150);
	
		if (double_jump == 2) {
			double_jump = 0;
			if (phy_speed_x > 0) {
				physics_apply_angular_impulse(-30);
			} else {
				physics_apply_angular_impulse(30);
			}
			slam_down = 65;
			phy_speed_y = 0;
			physics_apply_force(x,y,0,-1000);
		} else {
			physics_apply_force(x,y,0,-900);
		}
	}

	a_count--;
	d_count--;

	if (dashed == false) {
		if (a_count > 0 && keyboard_check_pressed(ord("A"))) {
			dash = 20;
			dash_dir = -1;
			dashed = true;
			var inst = instance_create_depth(x - 60,y,depth,obj_dash);
			inst.image_xscale = -1;
			var snd = audio_play_sound(snd_jump,1,0);
			audio_sound_gain(snd,obj_game_manager.sfx,0);
		}
	
		if (d_count > 0 && keyboard_check_pressed(ord("D"))) {
			dash = 20;
			dash_dir = 1;
			dashed = true;
			instance_create_depth(x + 60,y,depth,obj_dash);
			var snd = audio_play_sound(snd_jump,1,0);
			audio_sound_gain(snd,obj_game_manager.sfx,0);
		}

		if (keyboard_check_pressed(ord("A"))) {
			a_count = 11;
			d_count = 10;
		}

		if (keyboard_check_pressed(ord("D"))) {
			d_count = 11;
			a_count = 0;
		}
	}
}

// speed limit
/*if (phy_speed_y > 30) {
	phy_speed_y = 30;	
}*/
slam_cooldown--;

var max_speed = 11;
if (phy_speed_x > max_speed) {
	phy_speed_x = max_speed;	
} else if (phy_speed_x < -max_speed) {
	phy_speed_x = -max_speed;	
}

if (dash > 0) {
	dash--;
	diff = angle_difference(phy_rotation + phy_angular_velocity / 5, 0);
	physics_apply_torque(-3 * diff);
	
	phy_speed_y = 0;
	
	if (dash == 0) {
		phy_linear_damping = 0.1;
	} else if (dash < 3) {
		phy_linear_damping = 10;
	} else {
		phy_speed_x = 20 * dash_dir;	
	}
} else if (slam_down > 0) {
	slam_down--;
	physics_apply_force(x,y,0,(52 - slam_down) * 20);
	if (slam_down < 50) {
		diff = angle_difference(phy_rotation + phy_angular_velocity / 5, 0);
		physics_apply_torque(-16 * diff);
	}
	//physics_apply_torque(-1.5 * diff);
} else if (slam_down < 0) {
	slam_down++;
	diff = angle_difference(phy_rotation + phy_angular_velocity / 5, 0);
	physics_apply_torque(-3 * diff);
} else {
	phy_linear_damping = 0.1;
	
	if (phy_active) {
		diff = angle_difference(phy_rotation + phy_angular_velocity / 5, 0);
		physics_apply_torque(-0.7 * diff);
	} else if (dead == 1) {
		phy_rotation += 3;
		phy_angular_velocity = 0;
	}
	/* else {
		diff = angle_difference(phy_rotation, 0);
		phy_rotation -= diff * 0.025;
	}*/
}

phy_speed_y_previous = phy_speed_y;