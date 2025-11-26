var _horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _vertical = keyboard_check(ord("S")) - keyboard_check((ord("W")));

if (keyboard_check(vk_alt))
{
    var _horizontal = keyboard_check(vk_right) - keyboard_check(vk_left);
    var _vertical = keyboard_check(vk_down) - keyboard_check(vk_up);
}

if (abs(_horizontal) - abs(_vertical) != 0)
    move_and_collide(_horizontal * move_speed, _vertical * move_speed, [tilemap, obj_solid], undefined, undefined, undefined, move_speed, move_speed);
else
{
    if (abs(_horizontal) + abs(_vertical) != 0)
    {
        move_dir = point_direction(0, 0, _horizontal, _vertical)
        move_and_collide(lengthdir_x(move_speed, move_dir), lengthdir_y(move_speed, move_dir), [tilemap, obj_solid], undefined, undefined, undefined, lengthdir_x(move_speed, move_dir), lengthdir_y(move_speed, move_dir));   
    }
}
    
if (keyboard_check_pressed(vk_f2))
    room_goto_next();

var inst = instance_place(x, y, obj_warp);

if (inst != noone and keyboard_check_pressed(ord("F")))
{
    room_goto(inst.target_room);
}

if (keyboard_check_pressed(vk_space))
{
    instance_create_layer(x, y, "Instances", obj_attack);
}




if (_horizontal != 0 or _vertical != 0)
{
    if (_horizontal > 0) sprite_index = mc_right
        else if (_horizontal < 0) sprite_index = mc_left
}
