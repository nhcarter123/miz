
//draw_sprite_ext(spr_background1,0,x+player.x/24,y+player.y/24,2,2,0,c_white,1);

layer_x(background1,x+obj_camera.vpos_x/3.3);
layer_y(background1,y+obj_camera.vpos_y/3.3+400);

layer_x(background2,x+obj_camera.vpos_x/1.6);
layer_y(background2,y+obj_camera.vpos_y/1.6-160);

if (obj_player.x > 2650 && intro == 0) {
	intro = instance_create_depth(3140,y,0,obj_intro);
}
if (obj_player.x > 12450 && outro == 0) {
	outro = instance_create_depth(12450,y,0,obj_outro);
}

/*if (new_background_sprite) {
	layer_x(background2,x+player.x/ground_scaling);
	layer_y(background2,y+player.y/ground_scaling);
}*/


/*if (keyboard_check_pressed(vk_escape)) {
	obj_game.paused = !obj_game.paused;	
}
if (new_background_sprite) {
	if (new_background_sprite != 1) {
		layer_background_visible(background2, true);
		layer_background_sprite(background2, new_background_sprite);
		new_background_sprite = 1;	
	}

	if (background_alpha > 0) {
		background_alpha -= 0.02;
		layer_background_alpha(background1, background_alpha);
	} else {
		current_background_sprite = layer_background_get_sprite(background2);
		background_alpha = 1;
		layer_background_sprite(background1, current_background_sprite);
		layer_background_alpha(background1, background_alpha);
		layer_background_visible(background2, false);
		new_background_sprite = 0;
	}
}*/