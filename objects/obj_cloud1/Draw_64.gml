if (picture_alpha > 0) {
	picture_alpha -= 0.05;
	draw_set_alpha(picture_alpha);
	draw_rectangle(0,0,3000,2000,0);
	draw_set_alpha(1);
}