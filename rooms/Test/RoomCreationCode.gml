var base_width = 640;
var base_height = 360;
var aspect = base_width / base_height;

var target_width = display_get_gui_width();
var target_height = display_get_height();

if (target_width / target_height > aspect)
{
	target_width = target_height * aspect;
} else 
{
	target_height = target_width / aspect;	
}

var scale_factor = floor(min(target_width/base_width, target_height/base_height));
surface_resize(application_surface, base_width * scale_factor, base_height * scale_factor);