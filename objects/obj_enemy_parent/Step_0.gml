if (instance_exists(obj_dialog)) exit;
    
if (instance_exists(obj_transition)) exit;
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
        global.current_turn = TURN.ENEMY;
    }
}

_horizontal = xprevious-x;
_vertical = yprevious-y;

if (_horizontal >= 0){
    sprite_index = kale_right;
} else if (_horizontal < 0){
    sprite_index = kale_left
} else if (_vertical >= 0){
    sprite_index = kale_down;
} else if (_vertical < 0){
    sprite_index = kale_up;
}