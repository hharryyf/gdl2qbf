# 2p0s-GDL-To-QBF-Converter
A converter from 2-player zero-sum perfect information GDL to QBF

To extract the move domain

```
$ clingo --output=smodels [game.lp] move-domain.lp | python find_move_domain.py

```

To solve a game

```
$ python run_test.py [game name] [-v2|-v3] extra-quantifier.lp caqe [optional: game configuration]

```

