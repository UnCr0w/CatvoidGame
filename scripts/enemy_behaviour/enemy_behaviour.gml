enum STATES {
	IDLE, 
    CHASING,
    ATTACKING
}

enum ATTACK_STATES{
    CHARGE,
    DASH,
    RECOVERY
}

function enemy_state_idle(){
    move_speed = 1;
    isChasing = false;
    isIdle = true;
    
    if (idle_timer > 0)
        idle_timer--;
    else {
        target_x = random_range(xstart - 100, xstart + 100);
        target_y = random_range(ystart - 100, ystart + 100);
        has_los = true;
        idle_timer = 60;
    }
    
    
    if (instance_exists(obj_player) and distance_to_object(obj_player) <= distance_to_player and has_los)
{
    state = STATES.CHASING;
}
}

function enemy_state_chase(){
    move_speed = 2;
    isChasing = true;
    isIdle = false;
    target_x = obj_player.x;
    target_y = obj_player.y;
    if(collision_line(x, y, target_x, target_y, obj_solid, true, true))
        has_los = false;
    else 
        has_los = true;
    
    if (instance_exists(obj_player) and distance_to_object(obj_player) <= distance_to_attack and has_los)
    {
        state = STATES.ATTACKING
    }
}

function enemy_state_attack(){
    path_end();
    
    if (attack_phase = ATTACK_STATES.CHARGE)
    {
        move_speed = 0;
        attack_timer ++;
        
        if (attack_timer >= 30)
        {
            attack_timer = 0;
            attack_phase = ATTACK_STATES.DASH
        }
    } else if (attack_phase = ATTACK_STATES.DASH)
    {
        
        mp_linear_step(target_x, target_y, 5, false);
        
        var dist_to_target = point_distance(x, y, target_x, target_y);
        if (dist_to_target < 5)
            attack_phase = ATTACK_STATES.RECOVERY;
    } else if (attack_phase == ATTACK_STATES.RECOVERY)
    {
        attack_timer++;
        
        if (attack_timer >= 60)
        {
            attack_timer = 0;
            attack_phase = ATTACK_STATES.CHARGE;
            
            if (distance_to_object(obj_player) > distance_to_player){
                idle_timer = 0;
                state = STATES.IDLE;
            } else
                state = STATES.CHASING;
        }
    }
}