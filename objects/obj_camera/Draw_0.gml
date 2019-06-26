//gpu_set_blendmode_ext(bm_dest_color, bm_zero);
//draw_sprite_ext(spr_water_filter,0,vpos_x+vpos_w,vpos_y+vpos_h,1000,500,cam_angle,filter_color,filter_alpha);
//gpu_set_blendmode(bm_normal);


//physics_world_draw_debug(phy_debug_render_shapes);

/*if (room > 1) {
	if (keyboard_check_pressed(vk_f1)) {
		if (debug) {
			debug = 0;	
			show_debug_overlay(false);
			//audio_debug(false);
		} else {
			debug = 1;
			show_debug_overlay(true);
			//audio_debug(true);
		}
	} else if (keyboard_check_pressed(vk_f2)) {
		if (physics_debug) {
			physics_debug = 0;
		} else {
			physics_debug = 1;
		}
	} else if (keyboard_check_pressed(vk_f3)) {
		repeat(obj_player_fleet.damage_mod){player_take_damage()};
	} else if (keyboard_check_pressed(vk_f4)) {
		add_soul_heart();
	} else if (keyboard_check_pressed(vk_f5)) {
		obj_player_fleet.flagship.ship_health = -1;
	/*} else if (keyboard_check_pressed(vk_f6)) {*/
	/*	
	} else if (keyboard_check_pressed(vk_f7)) {
		obj_player_fleet.metal += 100;
	} else if (keyboard_check_pressed(vk_f8)) {
		with (obj_enemy) {
			ship_health = -1;	
		}
	} else if (keyboard_check_pressed(vk_f9)) {
		room_goto(rm_shop);
	} else if (keyboard_check_pressed(vk_f10)) {
		obj_player_fleet.refresh = 1;
	}
}

if (keyboard_check_pressed(vk_f11)) {
	room_goto(rm_create)
}

if (physics_debug) {
	physics_world_draw_debug(phy_debug_render_shapes);
}*/

/*if (debug) {
	with (all) {
		if (object_index != obj_camera && object_index != obj_player_fleet) {
			draw_text_transformed(x,y,depth,4,4,0);	
		}
	}	
}*/


//draw_rectangle(left2,top2,right2,bottom2,1);
//draw_text(save_shift_x*5,save_shift_y*5,"X");
/*if (room != rm_system1) {
if (h==1) {
if (surface_exists(light_surface2)) {
	
	if (count > 2) {
	surface_set_target(light_surface2);
	draw_clear_alpha(c_black,1);
	gpu_set_blendmode(bm_subtract);

	var xscale = 1920/res;
	var yscale = 1080/res;
	var sprite = spr_light3;
	for (var i=0;i<ds_list_size(obj_player_fleet.fleet_ships);i++) {
		var inst = ds_list_find_value(obj_player_fleet.fleet_ships,i);
		if (instance_exists(inst)) {
			var multi = 0.5;
			if (abs(new_h/1080-zoom_level) > 0.1) {
				multi = 0;
			}
			var xx = (((inst.x-vpos_x)/(vpos_w*2))-multi*((x-previous_x)/vpos_w))*xscale;
			var yy = (((inst.y-vpos_y)/(vpos_h*2))-multi*((y-previous_y)/vpos_h))*yscale;
			scale = (1/(vpos_h/1080))*inst.light/(res*0.3);
			
			//scale2 = (3+(obj_camera.vpos_h/540))/1.5;
			//draw_sprite(spr_light,0,xx,yy);
			draw_sprite_ext(sprite,0,xx,yy,scale,scale,0,0,1);
		}
	}
	var xx = (((obj_sun.x-vpos_x)/(vpos_w*2))-multi*((x-previous_x)/vpos_w))*xscale;
	var yy = (((obj_sun.y-vpos_y)/(vpos_h*2))-multi*((y-previous_y)/vpos_h))*yscale;
	draw_sprite_ext(sprite,0,xx,yy,scale*2,scale*2,0,0,1);
	for (var j=0;j<ds_list_size(obj_sun.planet_list);j++) {
		var inst = ds_list_find_value(obj_sun.planet_list,j);
		var xx = (((inst.x-vpos_x)/(vpos_w*2))-multi*((x-previous_x)/vpos_w))*xscale;
		var yy = (((inst.y-vpos_y)/(vpos_h*2))-multi*((y-previous_y)/vpos_h))*yscale;
		scale = (1/(vpos_h/1080))*inst.light;
		draw_sprite_ext(sprite,0,xx,yy,scale,scale,0,0,1);
	}
	count = 0;
	//}
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	}
} else {
	light_surface2 = surface_create(1920/res,1080/res);
	draw_clear_alpha(c_black,1);
}
}

count++;
}/**/