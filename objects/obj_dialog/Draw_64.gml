var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

draw_sprite_stretched(bar, 0, _dx, _dy, _boxw, _boxh);

_dx += 16;
_dy += 32;

draw_set_halign(fa_left);
draw_set_colour(c_white);
draw_set_font(TextBox);

var _name = messages[current_message].name;
draw_text(_dx, _dy, _name);
_dy += 40;

draw_text_ext(_dx, _dy, draw_message, -1, _boxw - _dx * 2);