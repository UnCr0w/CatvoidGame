// 1. Initialize variables (Default state)
isLocked = true; // Default is locked
// (Ensure you set 'door_id' in the Room Editor per Step 2, or default it here)
if (!variable_instance_exists(id, "door_id")) door_id = "undefined_door";

// 2. Check the global save data
// If this door_id exists in our global struct and is TRUE (unlocked)
if (variable_struct_exists(global.world_state, door_id)) {
    if (global.world_state[$ door_id] == true) {
        isLocked = false;
    } else if (global.world_state[$ door_id] == false){
        isLocked = true;
    }
}