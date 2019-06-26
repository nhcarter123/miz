if (image_angle > 10) {
	spin = -0.2;	
}
if (image_angle < -10) {
	spin = 0.2;
}

image_angle += spin;

gpu_set_tex_filter(false);
draw_self();
gpu_set_tex_filter(true);