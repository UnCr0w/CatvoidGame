function create_dialogue(_message){
    if (instance_exists(obj_dialog)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _message;
    _inst.current_message = 0;
}