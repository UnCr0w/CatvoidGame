
if (instance_exists(obj_player) and distance_to_object(obj_player) <= distance_to_player and has_los)
{
    isChasing = true;
    isIdle = false;
    target_x = obj_player.x;
    target_y = obj_player.y;
    if(collision_line(x, y, target_x, target_y, obj_solid, true, true))
        has_los = false;
    else 
        has_los = true;
    
    show_debug_message("Is chasing!" + string(target_x) + ", " + string(target_y));
} else 
{
    isChasing = false;
    isIdle = true;
    target_x = random_range(xstart - 100, xstart + 100);
    target_y = random_range(ystart - 100, ystart + 100);
    has_los = true;
    show_debug_message("Is Idle!" + string(target_x) + ", " + string(target_y));
}




alarm[0] = 60;