if (room == loading_screen || room == bedroom){
    if (!audio_is_playing(music_title)){
        audio_play_sound(music_title, 100, true);
    }
} else{
    audio_stop_sound(music_title);
}

if (room == hallway || room == combat_room){
    if (!audio_is_playing(music_creepy)){
        audio_play_sound(music_creepy, 100, true);
    }
}else{
    audio_stop_sound(music_creepy);
}