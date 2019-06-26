image_angle += 0.6;

platform1.new_x = x + lengthdir_x(500,image_angle);
platform1.new_y = y + lengthdir_y(500,image_angle) + (platform1.y-y)/29 - 20;

platform2.new_x = x + lengthdir_x(500,image_angle+180);
platform2.new_y = y + lengthdir_y(500,image_angle+180) + (platform1.y-y)/29 - 20;