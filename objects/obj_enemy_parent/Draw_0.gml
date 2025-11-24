draw_self();

draw_set_alpha(0.3);
mp_grid_draw(global.grid);
draw_set_alpha(1);
draw_path(path, x, y, 1);
draw_path(path_vision, x, y, false);   
draw_circle(x, y, distance_to_player, true)
draw_circle(x, y, distance_to_player/2, true);