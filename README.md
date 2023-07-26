# QBF Encoding for Two player Zero Sum Turn-Taking GDL-I game
A converter from 2-player zero-sum turn-taking GDL-I games to QBF


## Usage

* To extract the move domain for version 7

```
python find_move_domain_v4.py [all game files] 

```

* To extract the move domain for version 8

```
python find_move_domain_v5.py [all game files] 

```

* To solve a game that is strictly turn-taking (note that from version 7, we can solve games like GTTT-2-1)

```
python run_test_3.py [game name] [-v7|-v8] extra-quantifier.lp [caqe|depqbf] [optional: game configuration]

```

* To proof a game that is turn-taking, just run the following command. If it is UNSAT, the game is turn-taking.

```
python find_turn.py game depth [optional configuration file]

```


## Reference

Note that this piece of work relies on https://github.com/potassco/qasp2qbf for converting QASP to QBF.

It relies on https://github.com/lonsing/depqbf and https://github.com/ltentrup/caqe for QBF solving, and 
https://github.com/lonsing/qratpreplus and https://fmv.jku.at/bloqqer/ for preprocessing.


