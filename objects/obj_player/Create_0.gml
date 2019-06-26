/// @description Insert description here
// You can write your code in this editor

true_x = x;
true_y = y;
is_ground = -1;
active = true;

scl = 0.6;

image_xscale = scl;
image_yscale = scl;

diff = 0;

grounded = 0;
jump_cooldown = 0;
jump = 0;
dead = 0;

slam_down = 0;
double_jump = 0;
dashed = false;
dash = 0;
dash_dir = 1;
a_count = 0;
d_count = 0;
dash_cooldown = 0;
phy_speed_y_previous = 0;
slam_cooldown = 0;
kill_cooldown = 0;
red_alpha = 0;

mov_y = 0;
//text variables
text_count = -20;
goal_text = "";
current_text = "";
current_letter = 0;
audio_skip = 0;
text_alpha = 0;
text_shake = false;

fix = physics_fixture_create();
physics_fixture_set_circle_shape(fix, 94 * scl);
physics_fixture_set_density(fix, 2.0);
physics_fixture_bind_ext(fix, id, 0, -36 * scl);
physics_fixture_delete(fix);

instance_create_depth(x,y,depth+1,obj_egg_top);