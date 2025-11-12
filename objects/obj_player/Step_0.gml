var _horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _vertical = keyboard_check(ord("S")) - keyboard_check((ord("W")));

if (isSneak == false) 
{
    move_and_collide(_horizontal * move_speed, _vertical * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);
} else
{
    move_and_collide((_horizontal * move_speed)/2, (_vertical * move_speed)/2, tilemap, undefined, undefined, undefined, move_speed, move_speed);    
}
