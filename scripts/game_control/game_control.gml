global.function_map = {
    "card_effect_damage": card_effect_damage,
    "card_effect_apply_status": card_effect_apply_status
}

function CardData(_struct_from_json) constructor{
    name = _struct_from_json[$ "name"] ?? "Unknown";
    type = _struct_from_json[$ "type"] ?? "basic";
    base_damage = _struct_from_json[$ "base_damage"] ?? 0;
    scale = _struct_from_json[$ "scale"] ?? 0;
    owner = _struct_from_json[$ "owner"] ?? "none";
    target = _struct_from_json[$ "target"] ?? "enemy";
    revelation = _struct_from_json[$ "revelation"] ?? 0;
    desc = _struct_from_json[$ "desc"] ?? "";
    status_apply = _struct_from_json[$ "status"] ?? _struct_from_json[$ "status_apply"];
    input_sprite = _struct_from_json[$ "sprite"];
    if (is_string(input_sprite)) {
        sprite = asset_get_index(input_sprite);
    } else {
        sprite = input_sprite; // It's already an ID from cloning
    }
    
    var _input_effect = _struct_from_json[$ "effect"];

    if (is_string(_input_effect)) 
    {
        // CASE A: LOADING FROM JSON
        // The input is a string name like "card_effect_punch"
        // We must look it up in the function map
        effect = variable_struct_get(global.function_map, _input_effect);
        
        // Safety: If lookup fails, give it a dummy function so game doesn't crash
        if (effect == undefined) {
            show_debug_message("ERROR: Script not found for " + _input_effect);
            effect = function(){ show_debug_message("Effect missing!"); };
        }
    }
    else if (is_method(_input_effect) || is_numeric(_input_effect))
    {
        // CASE B: CLONING
        // The input is ALREADY a function (method) or script index (numeric)
        // Just copy it directly
        effect = _input_effect;
    }
    else 
    {
        // CASE C: MISSING
        effect = function(){};
    }
    revelation = _struct_from_json.revelation;
    desc = _struct_from_json.desc;
    
    static clone = function(){
        var _temp_data = {
            name: name,
            type: type,
            base_damage: base_damage,
            scale: scale,
            owner: owner,
            sprite: sprite,
            target: target,
            status_apply: status_apply,
            effect: effect,
            revelation: revelation,
            desc: desc
        }
        return new CardData(_temp_data);
    }
}

function load_card_database(){
    global.card_library = {};
    
    var _filename = "cards.json";
    
    if (file_exists(_filename)){
    var _buffer = buffer_load(_filename);
    var _string = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    
    var _json_array = json_parse(_string);
    
    for (var i = 0; i < array_length(_json_array); i++){
        var _raw_data = _json_array[i];
        
        var _new_card = new CardData(_raw_data);
        variable_struct_set(global.card_library, _new_card.name, _new_card);
    }
    
    show_debug_message("Cards loaded succesfuly!");
    } else{
        show_debug_message("ERROR: cards.json not found!");
    }
}

