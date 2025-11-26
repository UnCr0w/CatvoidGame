if(instance_place(x, y, obj_enemy))
{
    room_goto(combat_room);
}

if (alarm[0] == 0)
{
    instance_destroy(obj_attack);
}