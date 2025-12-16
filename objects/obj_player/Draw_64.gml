var _width = 100;
var _height = 50;
var _padding = 10; // Space between buttons

// Button 1 (Return) Coordinates
var _x1 = 20;
var _y1 = 20;
var _x2 = _x1 + _width;
var _y2 = _y1 + _height;

// Button 2 (Exit) Coordinates (Placed below Button 1)
var _bx1 = _x1;
var _by1 = _y2 + _padding; // Start 10 pixels below the first button
var _bx2 = _bx1 + _width;
var _by2 = _by1 + _height;

// Get Mouse Position relative to GUI
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Set Text Alignment for all buttons
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// --- BUTTON 1: RETURN ---
var _hover1 = (_mx >= _x1 && _mx <= _x2 && _my >= _y1 && _my <= _y2);
var _click1 = (_hover1 && mouse_check_button(mb_left));

draw_set_color(c_maroon);
draw_button(_x1, _y1, _x2, _y2, !_click1);

draw_set_color(c_white);
draw_text((_x1 + _x2) / 2, (_y1 + _y2) / 2, "Return");

if (_hover1 && mouse_check_button_released(mb_left)) {
    // Replace with your actual title screen room name
    room_goto(logo); 
}

// --- BUTTON 2: EXIT GAME ---
var _hover2 = (_mx >= _bx1 && _mx <= _bx2 && _my >= _by1 && _my <= _by2);
var _click2 = (_hover2 && mouse_check_button(mb_left));

// Optional: Use a different color for Exit (e.g., Dark Red)
draw_set_color(c_red); 
draw_button(_bx1, _by1, _bx2, _by2, !_click2);

draw_set_color(c_white);
draw_text((_bx1 + _bx2) / 2, (_by1 + _by2) / 2, "Exit");

if (_hover2 && mouse_check_button_released(mb_left)) {
    game_end();
}

// --- CLEANUP ---
// Reset alignment and color to avoid affecting other draw events
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);