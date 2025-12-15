if (instance_exists(obj_player)){
    if (obj_player._vertical == 1)
        sprite_index = attack_down;
    else if (obj_player._vertical == -1 || obj_player.sprite_index == mc_up_left || obj_player.sprite_index == mc_up_right)
        sprite_index = attack_up
    else if (obj_player.sprite_index == mc_right || obj_player.sprite_index == walk_right){
        sprite_index = attack_right;
    } else if (obj_player.sprite_index == mc_left || obj_player.sprite_index == walk_left){
        sprite_index = attack_left;
    }
}

image_index = 0;