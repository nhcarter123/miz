
index += 0.09;
y = start_y + 3 * sin(index);

if (keyboard_check_pressed(vk_space)) {
	if (!transition) {
		transition = instance_create_depth(0,0,0,obj_transition);
		transition.destination = rm_level_select;
	}
}