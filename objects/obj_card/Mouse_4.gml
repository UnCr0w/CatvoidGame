if (global.current_turn = TURN.PLAYER){
    with (obj_card_control){
    var _index = array_get_index(hand, other.card_data);
    
    if (_index != 1){
            play_card(_index, instance_nearest(x, y, obj_enemy_unit));
            global.current_turn = TURN.ENEMY;
            instance_destroy(other);
        }
    }
}
