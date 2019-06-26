if (on_start == 1) {
	camera = camera_create_view(save_shift_x, save_shift_y , 1920, 1080, 0, -1, -1, -1, 96, 96);
	view_set_camera(0, camera);
	zoom_level = 1;
	rate = 0.2;
	zoom_rate = 0;
	zoom_speed = 0;
	on_start = 2;
} else if (on_start == 2) {
	on_start = 0;
	zoom_rate = 0.2;
}

with (obj_player)  {
	if (phy_position_y > 1900) {
		if (!phy_active) {
			phy_active = true;
			phy_speed_x = mov_x;
			phy_speed_y = mov_y;
		}	
		if (other.rate < 2) {
			other.rate += 0.035;
		}
		if (other.rate >= 2) {
			other.rate = 2;
			
			var file = obj_game_manager.file;

			var wrapper = load_json(file);
	
			obj_game_manager.deaths++;
			ds_map_replace(wrapper,"deaths",obj_game_manager.deaths);
	
			var save_string = json_encode(wrapper);
			save_string_to_file(file,save_string);
			
			phy_position_y = -3100;
			phy_position_x = obj_game.spawn_x;
			phy_speed_x = 0;
			true_x = phy_position_x;
			true_y = phy_position_y;
			other.reset = 120;
			dead = 0;
			active = false;
			with (obj_spawn_parent) {
				spawn = 1;	
			}
		}
	}
}

//blur = clamp(blur,0,600);
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

/*aspect_ratio = (obj_game.target_width/obj_game.target_height)/((16/9)/(obj_game.target_width/obj_game.target_height));
if (room > 5) {
	ar2 =  1920 / (aspect_ratio * 1080);
} else {
	ar2 = 1;
}
new_w = lerp(view_w, ar2 * zoom_level * 1080 * aspect_ratio, zoom_rate);
new_h = lerp(view_h, ar2 * zoom_level * 1080, zoom_rate);

camera_set_view_size(view_camera[0], new_w, new_h);*/

new_w = lerp(view_w, zoom_level * 1920, zoom_rate);
new_h = lerp(view_h, zoom_level * 1080, zoom_rate);

camera_set_view_size(view_camera[0], new_w, new_h);

vpos_x = camera_get_view_x(view_camera[0]);
vpos_y = camera_get_view_y(view_camera[0]);
vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
vpos_h = camera_get_view_height(view_camera[0]) * 0.5;

audio_listener_position(vpos_x+vpos_w,vpos_y+vpos_h,0);
audio_listener_orientation(0,0,1000,0,-1,0);

if (tracking != noone && instance_exists(tracking)) {
	camera_lock = 1;
	target_x = tracking.true_x;
	target_y = tracking.true_y;
} else {
	camera_lock = 0;
}

var m_x = 135*(((mouse_x-vpos_x)/vpos_w)-1);
var m_y = 135*(((mouse_y-vpos_y)/vpos_h)-1);

if (camera_lock == 1) {
	if (((target_x - vpos_w) > (vpos_x + 5)) || ((target_x - vpos_w) < (vpos_x - 5)) &&
	((target_y - vpos_h) > (vpos_y + 5)) || ((target_y - vpos_h) < (vpos_y - 5))) {
		panning = 1;
	} else { 
		panning = 0;
	}
	var new_x = lerp(vpos_x, (target_x - vpos_w), rate / 2);
	var new_y = lerp(vpos_y, (target_y - vpos_h), rate / 2);
	save_shift_x = (target_x);
	save_shift_y = (target_y);
} else {
	var new_x = lerp(vpos_x, (m_x+save_shift_x-vpos_w), rate);
	var new_y = lerp(vpos_y, (m_y+save_shift_y-vpos_h), rate);
}

camera_set_view_pos(view_camera[0], new_x+random_range(-shake,shake),new_y+random_range(-shake,shake));

if (shake > 0) {
	shake -= 1;	
	if (shake < 0) {
		shake = 0;	
	}
}

if ((keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter)) || (keyboard_check_pressed(vk_alt) && keyboard_check(vk_enter))) {
	if (fullscreen == 0) {
		window_set_fullscreen(true);
		fullscreen = 1;
	} else {
		window_set_fullscreen(false);
		fullscreen = 0;
	}
}


if (keyboard_check_pressed(ord("H"))) {
	h *= -1;
	if (h==1) {
		gpu_set_tex_filter(true);
	} else {
		gpu_set_tex_filter(false);
	}
}

if (reset) {
	reset--;
	if (reset < 110) {
		rate = lerp(rate, 0.2, 0.15);
	}
}