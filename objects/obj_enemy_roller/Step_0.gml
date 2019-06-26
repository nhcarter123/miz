if (dead == 2) {
	dead = 1;
	mov_y = -18;
	mov_x = random_range(-4, 4);
} else if (dead == 1) {
	phy_position_x += mov_x;
	phy_position_y += mov_y;
	mov_y += 0.6;
}

if (y > 2500) {
	instance_destroy();	
}