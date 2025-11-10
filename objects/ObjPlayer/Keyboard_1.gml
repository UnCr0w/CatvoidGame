
if (keyboard_check(vk_shift))
{
	if (move_speed <= _max_speed)
	{
		move_speed += _acceleration;
	}
}

if (keyboard_check_released(vk_shift))
{
	isSprint = false;	
}

while (isSprint == false)
{
	move_speed -= _acceleration;
	if (move_speed == 2)
	{
		isSprint = true;
	}
}

if (keyboard_check(ord("A")) || keyboard_check(vk_left))
	{
		Normalize(x-move_speed, y);
		x = lerp(x, x-speedx, 0.1);
	} 
if (keyboard_check(ord("D")) || keyboard_check(vk_right))
	{
		Normalize(x+move_speed, y);
		x = lerp(x, x+speedx, 0.1);
	} 
if (keyboard_check(ord("W")) || keyboard_check(vk_up))
	{
		Normalize(x, y-move_speed);
		y = lerp(y, y-speedy, 0.1);
	} 
if (keyboard_check(ord("S")) || keyboard_check(vk_down))
	{
		Normalize(x, y+move_speed);
		y = lerp(y, y+speedy, 0.1);
	}

