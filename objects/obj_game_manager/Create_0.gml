display_set_gui_size(1920,1080);
icon_x = 0;
icon_y = 0;
current_node = noone;
depth = -10;
gpu_set_tex_filter(true);

index = 0;
count = 0
pos_y = 0;

music = noone;
intro = false;

sfx = 0.3;
msx = 0.3;
last_room = room;
window_set_cursor(cr_none);

file = "save1.sav";

if (file_exists(file)) {
	var wrapper = load_json(file);
} else {
	var wrapper = ds_map_create();	
}
	
unlocked_level = wrapper[? "unlocked_level"];
if (unlocked_level == undefined) {
	unlocked_level = 1;
	ds_map_replace(wrapper,"unlocked_level",unlocked_level);
}
	
current_level = wrapper[? "current_level"];
if (current_level == undefined) {
	current_level = 1;
	ds_map_replace(wrapper,"current_level",current_level);
}

deaths = wrapper[? "deaths"];
if (deaths == undefined) {
	deaths = 1;
	ds_map_replace(wrapper,"deaths",deaths);
}
	
var save_string = json_encode(wrapper);
save_string_to_file(file,save_string);
