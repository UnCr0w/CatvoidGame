move_speed = 2;
_acceleration = 1;
_max_speed = 4;
_interval = 0;
_execution = 8;
speedx = 0;
speedy = 0;

isSprint = true;
Normalize = function(_x, _y){
	x = _x;
	y = _y;
	
	_magnitude = sqrt((sqr(x)+sqr(y)))
	
	speedx = move_speed * (x/_magnitude);
	speedy = move_speed * (y/_magnitude);
}


