if (once) {
	once = 0;
	with (obj_node) {
		if (level == other.level - 1) {
			other.child = id;
		}
	}
	unlocked = obj_game_manager.unlocked_level >= level;
	
	if (!unlocked) {
		image_blend = c_gray;
	}
}

index += 0.04;

if (obj_game_manager.current_node == id) {
	//image_xscale = lerp(image_xscale,1.03 + (sin(index) + 1) / 16, 0.2);
	//image_yscale = lerp(image_yscale,1.03 + (sin(index) + 1) / 16, 0.2);
	image_xscale = lerp(image_xscale,1.15, 0.2);
	image_yscale = lerp(image_yscale,1.15, 0.2);
} else {
	image_xscale = lerp(image_xscale,1, 0.2);
	image_yscale = lerp(image_yscale,1, 0.2);
}