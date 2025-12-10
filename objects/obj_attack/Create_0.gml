if (instance_exists(obj_player)){
    if (obj_player.sprite_index == mc_right){
        sprite_index = attack_right;
    } else if (obj_player.sprite_index == mc_left){
        sprite_index = attack_left;
    }
}

image_index = 0;