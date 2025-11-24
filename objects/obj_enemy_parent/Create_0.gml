target_x = x;
target_y = y;

tilemap = layer_tilemap_get_id("Tiles_Collision")
alarm[0] = 60;

path = path_add();
path_vision = path_add();

global.grid = mp_grid_create(0, 0, room_width div 8, room_height div 8, 8, 8);
mp_grid_add_instances(global.grid, obj_solid, true);