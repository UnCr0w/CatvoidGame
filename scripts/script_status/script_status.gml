enum STATUS {
	HIDE,
    POISON
}

function status_hide(_target){
    if (array_contains(_target.status, "Hide")){
        _target.isTargetable = false;
        array_push(_target.status, "Hide");   
    }
}