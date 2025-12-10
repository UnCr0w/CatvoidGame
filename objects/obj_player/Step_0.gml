//Movement - true = 1, false = 0
var _horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _vertical = keyboard_check(ord("S")) - keyboard_check((ord("W")));

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
//for testing only
if (keyboard_check_pressed(vk_f2))
    room_goto(combat_room);

//for fancy transition
var inst = instance_place(x, y, obj_warp);

if (inst != noone and keyboard_check_pressed(ord("F")))
{
    if (!instance_exists(obj_transition))
    {
    var transition_inst = instance_create_depth(0, 0, -9999, obj_transition);
    
    transition_inst.target_room = inst.target_room;
    transition_inst.target_spawn = inst.target_spawn_id;
    }
}

//change sprite 
if (_horizontal != 0 or _vertical != 0)
{
    if (_horizontal > 0) 
    {
        sprite_index = mc_right;
        
    }
    else if (_horizontal < 0) 
    {
        sprite_index = mc_left;
        
    }
}

//attackkk
if (keyboard_check_pressed(vk_space)) 
{
    if (sprite_index == mc_left)
        instance_create_layer(x, y, "Instances", obj_attack);
    else if (sprite_index == mc_right)
        instance_create_layer(x, y, "Instances", obj_attack);
}
