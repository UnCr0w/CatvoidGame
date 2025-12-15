function card_effect_damage(_target){
    var dmg = owner.atk * scale;
        _target.hp -= dmg; 
        show_debug_message(string(owner) + " slashed for " + string(dmg) + " Hp left: " + string(_target.hp));
}   

function card_effect_apply_status(_target){
    switch (status_apply) {
    	case "Hide":
            _target = owner
            status_hide(_target);
            break;
    }
}

