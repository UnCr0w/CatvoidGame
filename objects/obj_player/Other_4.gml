
    if (variable_global_exists("global_target_spawn")) {
    
    // Find the spawn point object that matches the ID string
        with (obj_warp_spawn) {
            if (spawn_id == global.global_target_spawn) {
            // Move player to this spawn point
                other.x = x;
                other.y = y;
            }
        }
    }