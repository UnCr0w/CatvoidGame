if (global.current_turn = TURN.PLAYER){
    with (obj_card_control){
    var _index = array_get_index(hand, other.card_data);
    
    if (_index != -1){ 
        if (active_index < array_length(active_slots)) {
                
            other.x = active_slots[active_index].x;
            other.y = active_slots[active_index].y;
            active_index++;
            other.depth = -999; 
            array_delete(hand, _index, 1);
            array_push(active_cards, other);
                
        } 
        
        if (active_index >= array_length(active_slots)) {
                
                show_debug_message("Slots full! Executing Combo...");

                // Loop through all active cards to play them
                for (var i = 0; i < array_length(active_cards); i++) {
                    
                    var _visual_card = active_cards[i];
                    
                    // 1. Play the Card Effect
                    // Note: Ensure play_card reads from the struct, not the object ID if possible
                    play_card(i, instance_nearest(x, y, obj_enemy_unit));
                    
                    // 2. Add DATA to Discard Pile (Not the object ID)
                    // We save the struct so we can reshuffle it later
                    array_push(discard_pile, _visual_card.card_data);
                    
                    // 3. Destroy the Visual Object
                    instance_destroy(_visual_card);
                }
                
                // 4. CLEAN UP
                // Do not delete inside the loop. Just wipe the array at the end.
                active_cards = []; 
                active_index = 0;
                global.current_turn = TURN.ENEMY;
                active_index = 0;
                
        
            show_debug_message(draw_pile);
            show_debug_message(hand);
            show_debug_message(discard_pile);
            show_debug_message(_index);
        }
    } 
    }
}