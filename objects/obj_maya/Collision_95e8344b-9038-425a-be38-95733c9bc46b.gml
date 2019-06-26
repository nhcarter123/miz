/// @description Insert description here
// You can write your code in this editor

if (other.is_ground) {
	
	if (phy_speed_y_previous > 10) {
		instance_create_depth(x,phy_collision_y + 5,depth,obj_splash);
		var snd = audio_play_sound(snd_slam,1,0);
		audio_sound_gain(snd,obj_game_manager.sfx,0);
		slam_down = -10;
		//phy_linear_damping = 10;
	}
}