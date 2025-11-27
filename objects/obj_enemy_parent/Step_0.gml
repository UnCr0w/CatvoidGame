switch (state) {
	case (STATES.IDLE):
        enemy_state_idle();
        break;
    case (STATES.CHASING):
        enemy_state_chase();
        break;
    case (STATES.ATTACKING):
        enemy_state_attack();
        break;
}

if (has_los and state != STATES.ATTACKING)
{
    if (mp_grid_path(global.grid, path, x, y, target_x, target_y, true))
    {
        path_start(path, move_speed, path_action_stop, false);
    }
}    

if (state = STATES.ATTACKING){
    if (instance_place(x, y, obj_player)){
        room_goto(combat_room);
    }
}

