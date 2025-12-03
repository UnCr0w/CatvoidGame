if (hand == [])
{
    draw_cards(5);
    create_card_visuals();
    show_debug_message("Re-creating cards");
}

if(global.current_turn == TURN.WIN){
    combat_won();
    room_goto(Test);
}