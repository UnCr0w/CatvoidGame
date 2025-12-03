if(instance_place(x, y, obj_enemy))
{
    room_goto(combat_room);
    global.current_turn = TURN.PLAYER;
}

if (alarm[0] == 0)
{
    instance_destroy(obj_attack);
}