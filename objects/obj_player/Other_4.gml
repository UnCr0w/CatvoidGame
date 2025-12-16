// Check 1: Does the variable exist?
if (variable_global_exists("global_target_spawn")) // Try removing "global_" from the string name
{
    show_debug_message("STEP 1: Global variable found.");
    
    // Check 2: Are there any spawn points?
    if (instance_exists(obj_warp_spawn))
    {
        show_debug_message("STEP 2: Spawn points exist in this room.");
        
        with (obj_warp_spawn) 
        {
            // Check 3: Print EVERY ID comparison
            show_debug_message("Checking: " + string(spawn_id) + " VS " + string(global.global_target_spawn));
            
            if (spawn_id == global.global_target_spawn){
                show_debug_message("MATCH FOUND! Moving player.");
                other.x = x;
                other.y = y;
            }
        }
    }
    else
    {
        show_debug_message("ERROR: No obj_warp_spawn found in this room!");
    }
}
else
{
    // If you see this, your variable name is wrong
    show_debug_message("ERROR: Global variable 'target_spawn' does not exist!");
    
    // Debug: Print all globals to check spelling (Optional)
    show_debug_message(variable_instance_get_names(global));
}
show_debug_message(variable_instance_get_names(global));
global.current_room = room;