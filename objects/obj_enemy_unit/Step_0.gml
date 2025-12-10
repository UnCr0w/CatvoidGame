if (global.current_turn == TURN.ENEMY){
    var _inst = instance_nearest(x, y, obj_battle_unit);
    _inst.hp -= 10;
    show_debug_message("Player hp: " + string(_inst.hp));
    global.current_turn = TURN.PLAYER;
}

if (hp <= 0){
    global.current_turn = TURN.WIN;
}