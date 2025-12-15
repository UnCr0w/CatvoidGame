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

var hit_door = instance_place(x, y, obj_warp);

if (hit_door != noone)
{
    // 2. Unlock THAT specific door instance
    hit_door.isLocked = false; 
    
    // 3. Save this change to the global memory
    // We use the door's unique 'door_id' as the key
    if (variable_instance_exists(hit_door, "door_id")) {
        global.world_state[$ hit_door.door_id] = true; 
    }
}