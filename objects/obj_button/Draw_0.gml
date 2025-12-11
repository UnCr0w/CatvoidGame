// 1. Setup Font
draw_set_font(MainMenuFont); // Use your font here
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// 2. Calculate Text Size for Collision
var _w = string_width(text);
var _h = string_height(text);

// 3. Check Mouse Hover
// We check if mouse is inside the rectangle of the text
if (point_in_rectangle(mouse_x, mouse_y, x - _w/2, y - _h/2, x + _w/2, y + _h/2)) 
{
    hover = true;
    // Smoothly fade in the glow
    glow_alpha = lerp(glow_alpha, 1, 0.1);
    
    if (mouse_check_button_pressed(mb_left)) 
    {
        load_card_database();
    load_character_database();

    var _character_data = global.character_library[$ "mc"]; 
    array_push(global.party, _character_data);


    var _cards = variable_struct_get_names(global.card_library);
    for (i = 0; i < array_length(_cards); i++){
        var _card_name = _cards[i]
        var _card_data = global.card_library[$ _card_name];
    
        if (_card_data != undefined && variable_struct_exists(_card_data, "owner")){
            for (j = 0; j < array_length(global.party); j++){
            if(_card_data.owner == global.party[j].name){
            global.party[j].insert_card(_card_data);
            }
        }
    }
}
room_goto(bedroom);
    }
} 
else 
{
    hover = false;
    // Smoothly fade out
    glow_alpha = lerp(glow_alpha, 0, 0.1);
}

// 4. DRAW THE GLOW (Behind the text)
// We use gpu_set_blendmode to make it look "light-like"
gpu_set_blendmode(bm_add);

// Draw multiple layers slightly offset to create a fuzzy "bloom" look
draw_set_alpha(glow_alpha * 0.5);
draw_set_color(color_glow);

draw_text(x - 2, y, text);
draw_text(x + 2, y, text);
draw_text(x, y - 2, text);
draw_text(x, y + 2, text)

// Reset Blendmode
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);

// 5. DRAW THE MAIN TEXT (On top)
// Change color if hovered
if (hover) draw_set_color(color_glow);
else draw_set_color(color_normal);

draw_text(x, y, text);

// Always reset color/alpha to white after drawing to avoid bugs elsewhere
draw_set_color(c_white);