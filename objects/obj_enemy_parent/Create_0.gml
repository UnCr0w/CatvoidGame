target_x = x;
target_y = y;

tilemap = layer_tilemap_get_id("Tiles_Collision")

path = path_add();
path_vision = path_add();

global.grid = mp_grid_create(0, 0, room_width div 8, room_height div 8, 8, 8);
mp_grid_add_instances(global.grid, obj_solid, true);

state = STATES.IDLE;
attack_phase = ATTACK_STATES.CHARGE;
attack_timer = 0;
idle_timer = 0;
