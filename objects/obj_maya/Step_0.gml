true_x = x;
true_y = y;

phy_linear_damping = 0.1;
	
if (phy_active) {
	diff = angle_difference(phy_rotation + phy_angular_velocity / 5, 0);
	physics_apply_torque(-0.7 * diff);
} else {
	diff = angle_difference(phy_rotation, 0);
	phy_rotation -= diff * 0.025;
}


phy_speed_y_previous = phy_speed_y;