if (other.is_ground == -1) {
	if (!other.dead) {
		other.dead = 10;
		other.red_alpha = 0.2;
		var snd = audio_play_sound(snd_hurt,1,0);
		audio_sound_gain(snd,obj_game_manager.sfx,0);
		other.phy_active = false;
		if (x < other.x) {
			other.mov_x = -3;
		} else {
			other.mov_x = 3;
		}
	}	
}