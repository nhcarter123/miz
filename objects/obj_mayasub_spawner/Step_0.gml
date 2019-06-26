if (spawn) {
	spawn = 0;	
	if (!instance_exists(child)) {
		child = instance_create_depth(x,y,-10,obj_enemy_mayasub);
		child.platform = instance_nearest(x,y,obj_platform_parent);
	}
}