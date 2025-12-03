
function Card(_name, _damage, _owner, _sprite, _effect_func) constructor {
    name = _name;
    damage = _damage;
    owner = _owner
    sprite = _sprite;
    effect = _effect_func;
    
    static clone = function(){
        return new Card(name, damage, owner, sprite, effect);
    }
}


function card_effect_punch(_target){
        var dmg = owner.atk * 0.25;
        _target.hp -= dmg; 
        show_debug_message(owner.name + " slashed for " + string(dmg) + " Hp left: " + string(_target.hp));
}   

