/// @Game Manager
cam = instance_create_depth(x,y,0,obj_camera);
depth = 50;

player = instance_create_depth(x,y-200,-5,obj_player);
spawn_x = x;

cam.tracking = player;

if (room == rm_level1_1) {
	intro = 0;	
} else {
	intro = -1;	
}

if (room == rm_level1_6) {
	outro = 0;
} else {
	outro = -1;	
}

background1 = layer_get_id("back1");
background2 = layer_get_id("back2");
/*background2 = layer_get_id("Ground2");
layer_background_visible(background2, false);
background_alpha = 1;
new_background_sprite = noone;
current_background_sprite = layer_background_get_sprite(background1);*/

with (obj_platform_parent) {
	event_user(0);	
}