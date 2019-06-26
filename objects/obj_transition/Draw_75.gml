if (once) {
	once = 0;
	if (destination == noone) {
		transition_y = 0;
	} else {
		transition_y = -2*image_height-border_height*2;
	}
}

if (destination == noone) {
	
	draw_sprite_ext(spr_transition,0,0,transition_y,2,2,0,c_white,1);
	draw_sprite_ext(spr_transition,0,image_height*2,transition_y,2,2,0,c_white,1);
	draw_sprite_ext(spr_transition_border,0,0,transition_y-border_height,2,2,0,c_white,1);
	draw_sprite_ext(spr_transition_border,0,image_height*2,transition_y-border_height,2,2,0,c_white,1);
	
	if (transition_y < 2*image_height) {
		transition_y = lerp(transition_y,2*image_height+260,0.03);
		if (transition_y >= 2*image_height) {
			instance_destroy();
		}
	}
} else if (transition_y < 0) {
	
	draw_sprite_ext(spr_transition,0,0,transition_y,2,2,0,c_white,1);
	draw_sprite_ext(spr_transition,0,image_height*2,transition_y,2,2,0,c_white,1);
	draw_sprite_ext(spr_transition_border,0,0,transition_y+border_height+2*image_height,2,-2,0,c_white,1);
	draw_sprite_ext(spr_transition_border,0,image_height*2,transition_y+border_height+2*image_height,2,-2,0,c_white,1);
	
	transition_y = lerp(transition_y,260,0.03);
	if (transition_y >= 0) {
		transition_y = 0;
		room_goto(destination);
	}
}