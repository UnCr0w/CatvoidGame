if (state == 0)
{
    alpha += fade_speed;
    
    if (alpha >= 1)
    {
        global.global_target_spawn = target_spawn_id;
        room_goto(target_room);
        state = 1;
    } 
        
} else if (state == 1)
{
    alpha -= fade_speed;
    if (alpha <= 0)
    {
        instance_destroy();
    }
}