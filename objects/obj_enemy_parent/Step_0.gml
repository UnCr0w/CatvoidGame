if (has_los)
{
    if (mp_grid_path(global.grid, path, x, y, target_x, target_y, false))
    {
        path_start(path, move_speed, path_action_continue, false);
    }
}    

