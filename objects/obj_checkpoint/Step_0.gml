if (abs(obj_player.x - x) < 30 && abs(obj_player.y - y) < 200) {
	if (image_index == 0) {
		var snd = audio_play_sound(snd_checkpoint,1,0);
		audio_sound_gain(snd,obj_game_manager.sfx,0);
	}
	with (obj_checkpoint) {
		image_index = 0;
	}
	image_index = 1;
	obj_game.spawn_x = x;
}