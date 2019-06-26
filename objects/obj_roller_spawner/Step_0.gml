if (count > 240) {
	count = 0;
	if (instance_number(obj_enemy_roller) < 80) {
		instance_create_depth(x,y,-10,obj_enemy_roller);
	}
}

count++;