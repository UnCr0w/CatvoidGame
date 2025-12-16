if (instance_exists(obj_dialog)) exit;

//Movement - true = 1, false = 0
var _horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
_vertical = keyboard_check(ord("S")) - keyboard_check((ord("W")));

if (canMove == true)
    move_speed = 1;
else
    move_speed = 0;

//Cuz me keyboard broken
if (keyboard_check(vk_alt))
{
    _horizontal = keyboard_check(vk_right) - keyboard_check(vk_left);
    _vertical = keyboard_check(vk_down) - keyboard_check(vk_up);
}

//no diagonal -> normal move
if (abs(_horizontal) - abs(_vertical) != 0)
    move_and_collide(_horizontal * move_speed, _vertical * move_speed, [tilemap, obj_solid], undefined, undefined, undefined, move_speed, move_speed);
else
{
    //diagonal movement
    if (abs(_horizontal) + abs(_vertical) != 0)
    {
        //get the diagonal vector direction
        move_dir = point_direction(0, 0, _horizontal, _vertical)
        //move by move speed with diagonal direction
        move_and_collide(lengthdir_x(move_speed, move_dir), lengthdir_y(move_speed, move_dir), [tilemap, obj_solid], undefined, undefined, undefined, lengthdir_x(move_speed, move_dir), lengthdir_y(move_speed, move_dir));   
    }
}

//for fancy transition
var inst = instance_place(x, y, obj_warp);

if (inst != noone and keyboard_check_pressed(ord("F")))
{
    if (inst.isLocked){
        create_dialogue([
        {
            name: "",
            msg: "This door is locked!"
        },
        {
            name: "",
            msg: "Perhaps there is a key somewhere..."
        },
        {
            name: "",
            msg: "Or you could just break it!"
        }
        ])
    } else if (inst.isLocked == false){
    if (!instance_exists(obj_transition))
    {
    var transition_inst = instance_create_depth(0, 0, -9999, obj_transition);
    
    transition_inst.target_room = inst.target_room;
    transition_inst.target_spawn = inst.target_spawn_id; 
        global.global_target_spawn = inst.target_spawn_id;
        show_debug_message(global.global_target_spawn);
    }
    }
}

//change sprite 
if (_horizontal != 0 or _vertical != 0)
{
    if (_horizontal > 0) 
    {
        sprite_index = walk_right;
        
    }
    else if (_horizontal < 0) 
    {
        sprite_index = walk_left;
    }
    
    if (_vertical > 0){
        if (sprite_index == walk_left || sprite_index == mc_left || sprite_index == mc_up_left)
            sprite_index = walk_down_left;
        else if (sprite_index == walk_right || sprite_index == mc_right || sprite_index == mc_up_right)
            sprite_index = walk_down_right;
    } else if (_vertical < 0){
        if (sprite_index == walk_left || sprite_index == mc_left)
            sprite_index = walk_up_left;
        else if (sprite_index == walk_right || sprite_index == mc_right)
            sprite_index = walk_up_right;
    }
} else {
	if (_horizontal == 0){
        if (sprite_index == walk_right){
            sprite_index = mc_right;
        } else if (sprite_index == walk_left){ 
            sprite_index = mc_left;
        }
    }
    
    if (_vertical == 0){
        if (sprite_index == walk_up_left) 
            sprite_index = mc_up_left;
        else if (sprite_index == walk_up_right)
            sprite_index = mc_up_right 
        else if (sprite_index == walk_down_left)
            sprite_index = mc_left;
        else if (sprite_index == walk_down_right)
            sprite_index = mc_right;
    }
}

//attackkk
if (keyboard_check_pressed(vk_space)) 
{
    canMove = false;
    show_debug_message("no move")
    instance_create_depth(x, y, -9999, obj_attack)
}

if (!instance_exists(obj_attack))
        canMove = true;