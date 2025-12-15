if (global.current_turn == TURN.ENEMY){
    var _inst = instance_nearest(x, y, obj_battle_unit);
    if (_inst != noone) {
        var damage = atk - _inst.def;
        if (damage < 0)
            damage = 0;
        _inst.hp -= damage;
        x = lerp(x, x-10, 0.5);
        for (i =0; i < array_length(_inst.status); i++){
            if (_inst.status[i] == "Hide")
                array_delete(_inst.status, i, 1);
            _inst.def = 80
        }
}
    show_debug_message("Player hp: " + string(_inst.hp));
    global.current_turn = TURN.PLAYER;
}

if (hp <= 0){
    global.current_turn = TURN.WIN;
}