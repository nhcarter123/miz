var scl = 0.9;
image_xscale = scl;
image_yscale = scl;
offset_x = 83;
offset_y = 174;
depth = -100;
image_speed = 0;
is_ground = 1;
count = 0;

fix = physics_fixture_create();
physics_fixture_set_polygon_shape(fix);
physics_fixture_add_point(fix,(4-offset_x)*scl,(4-offset_y)*scl)
physics_fixture_add_point(fix,(140-offset_x)*scl,(162-offset_y)*scl)
physics_fixture_add_point(fix,(21-offset_x)*scl,(162-offset_y)*scl)
physics_fixture_set_density(fix,0);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);

fix = physics_fixture_create();
physics_fixture_set_polygon_shape(fix);
physics_fixture_add_point(fix,(157-offset_x)*scl,(4-offset_y)*scl)
physics_fixture_add_point(fix,(140-offset_x)*scl,(162-offset_y)*scl)
physics_fixture_add_point(fix,(21-offset_x)*scl,(162-offset_y)*scl)
physics_fixture_set_density(fix,0);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);