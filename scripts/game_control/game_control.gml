global.hero = new Character("MC", 100, 100, 0, 100, 5, [], mc_right);
array_push(global.party, hero);
var new_card = new Card("Basic", 10, global.hero, card_temporary, card_effect_punch);
hero.card_list = [new_card, new_card, new_card, new_card];
