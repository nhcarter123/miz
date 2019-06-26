/// @description Insert description here
// You can write your code in this editor

if (other.is_ground == 1) {
	
	var dir = point_direction(x,y,phy_collision_x,phy_collision_y);
	if (abs(angle_difference(dir, -phy_rotation-90)) < 65) {
		
		if (!jump_cooldown) {
			double_jump = 0;
			dashed = true;
		}
		
		//jump_cooldown = 0;
		grounded = 5;
		
		if (phy_speed_y_previous > 12 && phy_collision_y > y + 40 && !slam_cooldown) {
			instance_create_depth(x,phy_collision_y + 5,depth,obj_splash);
			var snd = audio_play_sound(snd_slam,1,0);
			audio_sound_gain(snd,obj_game_manager.sfx,0);
			slam_down = -10;
			obj_camera.shake = 10;
			slam_cooldown = 15;
			active = true;
			phy_speed_y = 0;
			
			//phy_linear_damping = 10;
		}
	}
}