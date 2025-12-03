var position_x = [160, 152, 96, 88];
var position_y = [144, 216, 128, 200];
var slot_x = [200, 248, 296, 344, 392];
var slot_y = 48;

active_slots = [];
draw_pile = [];
hand = [];
discard_pile = [];

array_push(active_slots, instance_create_layer(slot_x[0], slot_y, "Instances", obj_card_slot));
for (i = 0; i < array_length(global.party); i++)
{
    var _char_struct = global.party[i]
    var _inst = instance_create_layer(position_x[0], position_y[0], "Instances", obj_battle_unit)
    _inst.stats = _char_struct;
    _inst.sprite_index = _char_struct.sprite_battle;
    show_debug_message(_inst.stats);
    
    array_push(active_slots, instance_create_layer(slot_x[i+1], slot_y, "Instances", obj_card_slot));
    
    var my_cards = global.hero.card_list;
    for (j = 0; j < array_length(my_cards); j++){
        var store_card = my_cards[j].clone();
        
        array_push(draw_pile, store_card);
    }
}

instance_create_layer(512, 144, "Instances", obj_enemy_unit);
show_debug_message(string(global.current_turn));

draw_pile = array_shuffle(draw_pile);
draw_cards(5);  


