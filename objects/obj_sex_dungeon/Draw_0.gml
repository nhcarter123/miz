true_x = x;
true_y = y;


index += 0.1;
hover = sin(index) * 6;
audio_emitter_position(emitter, true_x, true_y, 0);

destiny.phy_position_x = lerp(destiny.phy_position_x,true_x,0.5);
destiny.phy_position_y = lerp(destiny.phy_position_y,true_y-196 + hover,0.5);
destiny.phy_speed_x = 0;
destiny.phy_speed_y = 0;

draw_sprite_ext(sprite_index,0,true_x,true_y + hover,image_xscale,image_yscale,image_angle,c_white,1);

fishing_x = true_x-280;
fishing_y = true_y-380 + hover;

draw_sprite_ext(spr_fishing_rod,0,fishing_x,fishing_y,1.5,1.5,image_angle,c_white,1);

draw_set_color(c_black);
draw_line_width(fishing_x,fishing_y,fishing_x+hook_x,fishing_y+hook_y,6);
draw_sprite_ext(spr_ice,0,fishing_x+hook_x,fishing_y+hook_y,0.6,0.6,image_angle,c_white,1);
draw_set_color(c_white);

blade_index += 0.5 * blade_dir;

if (blade_index > 4.4) {
	blade_dir = -1;
} else if (blade_index < 0.6) {
	blade_dir = 1;	
}
draw_sprite_ext(spr_helicopter_blades,blade_index,true_x,true_y + 329 + hover,1.5,-1.5,image_angle,c_white,1);

if (launch) {
	obj_camera.shake = 1.6;
	if (y > -1800) {
		y -= 8;
	} else {
		instance_destroy(destiny);
		instance_destroy(obj_maya);
		instance_destroy(id);
		hooked = noone;
	}
} else if (y < 240) {
	y += 8;
	obj_camera.shake = 5;
} else if (!hooked) {
	if (hook_y < 720) {
		hook_y += 5;
	}
	hook_x = sin(index * 0.6) * 24 * hook_y / 720;
}

if (hooked != noone) {
	hooked.phy_position_x = lerp(hooked.phy_position_x,fishing_x+hook_x,0.5);
	hooked.phy_position_y = lerp(hooked.phy_position_y,fishing_y+hook_y+50,0.5);
	hooked.phy_speed_x = 0;
	hooked.phy_speed_y = 0;
	if (hook_y > 300) {
		hook_y -= 2;	
	}
	hook_x = sin(index) * 24 * hook_y / 800;
}