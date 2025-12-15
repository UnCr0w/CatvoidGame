enum STATUS {
	HIDE,
    POISON
}

function status_hide(_target){
    if (is_string(_target)) {
        show_debug_message("CRITICAL ERROR: Target is a string ('" + _target + "') instead of an Instance ID.");
        return;
    }

    if (!variable_instance_exists(_target, "status")) {
        _target.status = [];
    }
    
    if (!array_contains(_target.status, "Hide")){
        array_push(_target.status, "Hide");
        _target.def = 9999;   
        show_debug_message("Invis");
    }
}