enum STATUS {
	HIDE,
    POISON
}

function status_hide(_target){
    if (!array_contains(_target.status, "Hide")){
        array_push(_target.status, "Hide");   
        show_debug_message("Invis");
    }
}