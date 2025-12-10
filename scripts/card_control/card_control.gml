function card_effect_damage(_target){
    var dmg = global.character_library[$ owner].atk * scale;
        _target.hp -= dmg; 
        show_debug_message(owner + " slashed for " + string(dmg) + " Hp left: " + string(_target.hp));
}   

function card_effect_apply_status(_target, status){
    switch (status) {
    	case STATUS.HIDE:
            status_hide(owner);
            break;
    }
}

