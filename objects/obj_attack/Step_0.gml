depth = -9999
if (instance_exists(obj_player)){
    x = obj_player.x;
    y = obj_player.y
}
if (image_index == 3){
    instance_destroy(obj_attack);
}

if(instance_place(x, y, obj_enemy))
{
    if (!instance_exists(obj_transition))
    {
    var transition_inst = instance_create_depth(0, 0, -9999, obj_transition);
    
    transition_inst.target_room = combat_room;
    transition_inst.target_spawn = "";
    }
    global.current_turn = TURN.PLAYER;
}

if (instance_place(x, y, obj_warp)){
    with(obj_warp){
        isLocked = false;
    }
}