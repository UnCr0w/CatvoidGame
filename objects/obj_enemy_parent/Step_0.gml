var _vertical = clamp(target_x - x, -1, 1);
var _horizontal = clamp(target_y - y, -1, 1);

move_and_collide(_vertical * move_speed, _horizontal * move_speed, [tilemap, obj_wall, obj_enemy_parent]);