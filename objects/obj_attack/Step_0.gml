
if(instance_place(x, y, obj_enemy))
{
    room_goto(combat_room);
    global.current_turn = TURN.PLAYER;
}

if (image_index == 3)
{
    instance_destroy(obj_attack);
}