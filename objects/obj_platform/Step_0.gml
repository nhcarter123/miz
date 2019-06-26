if (touch_count) {
	touch_count--;
	touching.phy_position_x += new_x - phy_position_x;
	touching.phy_position_y += new_y - phy_position_y;
	if (touch_count == 0) {
		//touching.phy_speed_x = new_x - phy_position_x;
		//touching.phy_speed_y = new_y - phy_position_y;
	}
}

phy_position_x = new_x;
phy_position_y = new_y;