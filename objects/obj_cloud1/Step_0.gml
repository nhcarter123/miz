index += 0.03;
x += (3.8 + (sin(index))) * 0.3;

if (x > view_xport[0] + view_wport[0] * 3) {
	x = view_xport[0] - view_wport[0];	
}

doc_height = lerp(doc_height,doc_height_goal,0.1);	

if (snapshot_count > 0) {
	if (snapshot_count == 30) {
		picture_alpha = 1;
		var snd = audio_play_sound(snd_picture,1,0);
		audio_sound_gain(snd,obj_game_manager.sfx,0);
	}
} else {
	doc_height_goal = 0;
}
snapshot_count--;

if (count > 420) {
	count = random(90);
	doc_height_goal = 90;
	snapshot_count = 60;
}

if (x > view_xport[0] && x < view_xport[0] + view_wport[0] * 1.5) {
	count++;
}