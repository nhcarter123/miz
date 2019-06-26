is_ground = false;

scl = obj_player.scl;

offset_x = -97;
offset_y = -135 - 30;

fix = physics_fixture_create();
physics_fixture_set_polygon_shape(fix);
physics_fixture_add_point(fix, (offset_x + 152) * scl, (offset_y + 30) * scl);
physics_fixture_add_point(fix, (offset_x + 185) * scl, (offset_y + 104) * scl);
physics_fixture_add_point(fix, (offset_x + 192) * scl, (offset_y + 166) * scl);
physics_fixture_add_point(fix, (offset_x + 2) * scl, (offset_y + 166) * scl);
physics_fixture_add_point(fix, (offset_x + 9) * scl, (offset_y + 104) * scl);
physics_fixture_add_point(fix, (offset_x + 40) * scl, (offset_y + 30) * scl);
physics_fixture_add_point(fix, (offset_x + 97) * scl, (offset_y + -1) * scl);
physics_fixture_set_density(fix, 0.5);
physics_fixture_bind(fix, instance_nearest(x,y,obj_solid));
physics_fixture_delete(fix);