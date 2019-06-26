true_x = x;
true_y = y;

draw_sprite_ext(sprite_index,0,true_x,true_y,image_xscale,image_yscale,image_angle,c_white,1);
draw_sprite_ext(spr_door,1,true_x+112,true_y+322,image_xscale,image_yscale,image_angle,c_white,1);


if (open) {
	open--;
	door_xscale -= 0.01;
	if (!open) {
		wait = 60;	
	}
}

if (wait) {
	wait--;
	if (!wait) {
		close = 50;	
	}
}

if (close) {
	close--;
	door_xscale += 0.01;
	//if (!close) {
		
	//}
}