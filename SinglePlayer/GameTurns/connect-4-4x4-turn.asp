_other_player(xplayer,oplayer). _other_player(oplayer,xplayer).
_player_turn(xplayer,1).
_player_turn(O,T+1) :- _player_turn(P,T), _other_player(P,O), movetimedomain(T+1).
