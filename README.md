# QBF Encoding for Two player Zero Sum Turn-Taking GDL-I game
A converter from 2-player zero-sum turn-taking GDL-I games to QBF

## Usage

* To extract the move domain for version 2/3

```
clingo --output=smodels [game.lp] move-domain.lp | python find_move_domain.py

```

* To extract the move domain for version 4

```
clingo --output=smodels [game.lp] move-domain.lp | python find_move_domain.py

```

* To find the maximum strategic depth of a game, keep increasing the depth in invalid_move.lp until there's no stable model

```
clingo [game.lp] [game-log-domain.lp] 2-player-turn-common-v2.lp invalid_move.lp

```

* To solve a game

```
python run_test_2.py [game name] [-v2|-v3|-v4] extra-quantifier.lp [caqe|depqbf] [optional: game configuration]

```

## Results

TODO

## Reference

Note that this piece of work relies on https://github.com/potassco/qasp2qbf
