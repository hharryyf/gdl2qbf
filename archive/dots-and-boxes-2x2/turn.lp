_other_player(xplayer,oplayer). _other_player(oplayer,xplayer).

_player_turn(P, T) :- role(P), move_time_domain(T).
