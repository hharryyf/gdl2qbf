# QBF Encoding for Two player Zero Sum Turn-Taking GDL-I game
A converter from 2-player zero-sum turn-taking GDL-I games to QBF


## Usage

* To extract the move domain for version 7, the game must be strictly turn-taking

```
python find_move_domain_v4.py [all game files] 

```

* To extract the move domain for version 8

```
python find_move_domain_v5.py [all game files] 

```

Example use of the games in the paper:

```
python find_move_domain_v4.py connect-3-4x4/connect-3-4x4.lp connect-3-4x4/turn.lp

```
```
python find_move_domain_v4.py gttt-4x4-1-1/gttt-4x4-1-1.lp gttt-4x4-1-1/turn.lp gttt-4x4-1-1/fatty.lp

```
```
python find_move_domain_v4.py break-through-3x4/break-through-3x4.lp break-through-3x4/turn.lp break-through-3x4/two.lp

```
```
python find_move_domain_v5.py dots-and-boxes-2x2/dots-and-boxes-2x2.lp dots-and-boxes-2x2/turn.lp

```


* To solve a game that is strictly turn-taking (note that from version 7, we can solve games like GTTT-2-2)

```
python run_test_3.py [game name] [-v7|-v8] extra-quantifier.lp [caqe|depqbf] [optional: game configuration]

```

Example use of the games in the paper:

```
python run_test_3.py connect-4-4x4 -v7 extra-quantifier.lp caqe 

```

```
python run_test_3.py gttt-4x4-1-1 -v7 extra-quantifier.lp caqe gttt-4x4-1-1/fatty.lp 

```

```
python run_test_3.py break-through-3x4 -v7 extra-quantifier.lp caqe break-through-3x4/two.lp 

```


* To proof a game that is turn-taking, just run the following command. It will print out the turn for every player

```
python find_turn.py game depth [optional configuration file]

```

Example use of the games in the paper:

```
python find_turn.py connect-4-4x4 15

```

```
python find_turn.py gttt-4x4-1-1 15 gttt-4x4-1-1/fatty.lp

```

```
python find_turn.py break-through-3x4 19 break-through-3x4/two.lp

```



## Reference

Note that this piece of work relies on https://github.com/potassco/qasp2qbf for converting QASP to QBF.

It relies on https://github.com/lonsing/depqbf and https://github.com/ltentrup/caqe for QBF solving, and 
https://github.com/lonsing/qratpreplus and https://fmv.jku.at/bloqqer/ for preprocessing.


