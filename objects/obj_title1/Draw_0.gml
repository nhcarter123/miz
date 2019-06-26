gpu_set_tex_filter(false);
draw_self();
gpu_set_tex_filter(true);

draw_set_halign(fa_middle);
//draw_set_color(c_black);
draw_set_alpha(((sin(index * 1) + 1) / 3) + 0.33);
draw_text(x,y+600,"Press SPACE to start");
draw_set_alpha(1);