blade_index = 0;
blade_dir = 1;
true_x = x;
true_y = y;
index = 0;

hook_x = 0;
hook_y = 0;
hooked = noone;
launch = false;

destiny = instance_create_depth(x,y,depth+1,obj_destiny);

emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_falloff(emitter,1200,1500,1);	
audio_play_sound_on(emitter,snd_helicopter,1,1);
audio_emitter_gain(emitter,0.6 * obj_game_manager.sfx);