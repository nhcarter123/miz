if (red_alpha > 0) {
	draw_set_color(c_red);
	draw_set_alpha(red_alpha);
	draw_rectangle(0,0,1920,1080,0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	red_alpha -= 0.006;
}