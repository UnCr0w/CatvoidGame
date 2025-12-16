if (array_length(hand) == 0){
    draw_pile = discard_pile;
    show_debug_message(draw_pile);
    show_debug_message(hand);
    show_debug_message(discard_pile);
}
if(global.current_turn == TURN.WIN){
    combat_won();
    room_goto(thank_you);
}