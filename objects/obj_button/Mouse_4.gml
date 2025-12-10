load_card_database();
load_character_database();

var _character_data = global.character_library[$ "mc"]; 
array_push(global.party, _character_data);


var _cards = variable_struct_get_names(global.card_library);
for (i = 0; i < array_length(_cards); i++){
    var _card_name = _cards[i]
    var _card_data = global.card_library[$ _card_name];
    
    if (_card_data != undefined && variable_struct_exists(_card_data, "owner")){
    for (j = 0; j < array_length(global.party); j++){
        if(_card_data.owner == global.party[j].name){
            global.party[j].insert_card(_card_data);
        }
    }
    }
}
room_goto(bedroom);

