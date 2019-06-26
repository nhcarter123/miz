var x_pos = argument0;
var y_pos = argument1;
var sep = argument2;
var wid = argument3;
var text_scl = argument4

if (goal_text != "") {
	if (current_letter <= string_length(goal_text)) {
		done_count = 0;
		var char = string_char_at(goal_text,current_letter+1);
	
		if (char == "." && current_letter > 0 && string_char_at(goal_text,current_letter) != "P" && string_char_at(goal_text,current_letter) != "O") {
			text_count -= 0.75;
		}
		if (char == " " && current_letter > 0) {
			text_count -= 0.4;
		}
	
		if (text_count > 4) {
			text_count = 0;
			if (char != "." && char != " ") {
				//if (audio_skip > 1) {
				//	audio_skip = 0;
					var snd = audio_play_sound(snd_text_click,0,0);
					audio_sound_gain(snd,obj_game_manager.sfx,0);
				//}
			}
			audio_skip += 1;
	
			current_text = string_insert(char,current_text,current_letter+1);
			current_letter += 1;	
		}
		text_count += 1;
	} else {
		done_count++;
		if (done_count > 120) {
			current_text = "";
			goal_text = "";
			current_letter = 0;
		}
	}
}

if (text_shake) {
	var shake_x = random_range(-3,3);
	var shake_y = random_range(-3,3);
} else {
	var shake_x = 0;
	var shake_y = 0;
}

draw_set_color(c_black);
draw_text_ext_transformed(x_pos+shake_x,y_pos+shake_y,current_text,sep,wid,text_scl,text_scl,0);
draw_set_color(c_white)