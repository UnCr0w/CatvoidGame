if (self.isEnabled){
switch (story_trigger) {
	case 0:
        if (instance_exists(obj_player) && place_meeting(x, y, obj_player)){
            help_call();
            self.isEnabled = false;
        }
        break;
    case 1:
        if (instance_exists(obj_player) && place_meeting(x, y, obj_player)){
            toby_scream();
            self.isEnabled = false;
        }
        break;
    case 2:
        if (instance_exists(obj_player) && place_meeting(x, y, obj_player)){
            kale_encounter();
            self.isEnabled = false;
        }
        break
}
}

if (room == void){
    create_dialogue([
    {
        name: "???",
        msg: "O' dear deliverer..."
    },
    {
        name: "???",
        msg: "Open your eyes"
    },
    {
        name: "???",
        msg: "Unveil the guise"
    },
    {
        name: "???",
        msg: "Overwrite the settled"
    },
    {
        name: "???",
        msg: "For life's meaning hath died"
    },
    {
        name: "???",
        msg: "Thus I crave"
    },
    {
        name: "???",
        msg: "The warm embrace of Death"
    }
    ])
}

if (room == thank_you){
    create_dialogue([
    {
        name: "Developer",
        msg: "Thank you for trying out the demo..."
    },
    {
        name: "Developer",
        msg: "Now you are stuck here forever..."
    },
    {
        name: "Developer",
        msg: "and ever..."
    },
    {
        name: "Developer",
        msg: "...and ever..."
    }
    ])
}
