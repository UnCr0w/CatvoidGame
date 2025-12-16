enum TURN {
    PLAYER,
    ENEMY,
    WIN,
    LOSE
}
global.current_turn = TURN.PLAYER;

function end_player_turn() {
    global.current_turn = TURN.ENEMY;
    show_debug_message("Enemy Turn Start!");
}

function end_enemy_turn(){
    global.current_turn = TURN.PLAYER;
    show_debug_message("Your Turn Start!");
}

function combat_won(){
    room_goto(thank_you);
}

function combat_lost(){
    show_debug_message("You lost!");
}
function draw_cards(_amount) {
    repeat(_amount) {
        if (array_length(draw_pile) > 0) {
            var _card = array_pop(draw_pile);
            array_push(hand, _card);
        }
    }
}

function play_card(_card_index, _target_enemy) {
    var _card = active_cards[_card_index];
    _card.card_data.effect(_target_enemy);
}

function create_card_visuals(){
    with (obj_card) instance_destroy();
        
    first_card = 192;
    difference = 48;
    for (i = 0; i < array_length(hand); i++){
        x_location = first_card + i * difference;
        var _inst = instance_create_layer(x_location, 304, "Instances", obj_card);
        _inst.card_data = hand[i];
        _inst.sprite_index = hand[i].sprite;
    }
}