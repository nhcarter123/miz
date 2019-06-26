mov_dir = 1;
is_ground = 2;
dead = 0;
index = 0;
phy_active = false;
platform = noone;
start_y = y;
once = 1;
mod_y = 0

emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_falloff(emitter,500,800,1);
audio_play_sound_on(emitter,snd_mox,1,1);
audio_emitter_gain(emitter,0);