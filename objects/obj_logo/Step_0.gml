if (state == 0)
{
    alpha += fade_speed;
    image_hold--;
    
    if (alpha >= 1 && image_hold <= 0)
    {
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