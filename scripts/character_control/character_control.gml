global.party = [];

function Character(_struct_from_json) constructor {
    name = _struct_from_json.name;
    hp = _struct_from_json.hp;
    atk = _struct_from_json.atk;
    def = _struct_from_json.def;
    acc = _struct_from_json.acc;
    revelation = _struct_from_json.revelation_point;
    card_list = [];
    sprite_battle = asset_get_index(_struct_from_json.sprite);
    
    insert_card = function(card){
        array_push(card_list, card);
    }
}

function load_character_database(){
    global.character_library = {};
    
    var _filename = "characters.json";
    
    if (file_exists(_filename)){
    var _buffer = buffer_load(_filename);
    var _string = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    
    var _json_array = json_parse(_string);
    
    for (var i = 0; i < array_length(_json_array); i++){
        var _raw_data = _json_array[i];
        
        var _new_character = new Character(_raw_data);
        variable_struct_set(global.character_library, _new_character.name, _new_character);
    }
    
    show_debug_message("Characters loaded succesfuly!");
    } else{
        show_debug_message("ERROR: cards.json not found!");
    }
}