# QBF Encoding for Two player Zero Sum Turn-Taking GDL-I game
A converter from 2-player zero-sum turn-taking GDL-I games to QBF

## Assumption

The game is a two-player zero-sum turn-taking game described in GDL-I. The player plays first is called xplayer, and
the player plays second is called oplayer. In our current implementation, we only support games that the players take
alternating moves (i.e. x moves - o moves - x moves...). Note that this restriction can be removed, and will be removed
in our future version.

## Usage

* To extract the move domain for version 2

```
clingo --output=smodels [game/game.lp] [game/turn.lp] move-domain.lp | python find_move_domain.py

```

* To extract the move domain for version 4

```
clingo --output=smodels [game.lp] [game/turn.lp] move-domain.lp | python find_move_domain_v2.py

```

* To find the maximum strategic depth of a game, keep increasing the depth in invalid_move.lp until there's no stable model

```
clingo [game.lp] [game-log-domain.lp] [game/turn.lp] 2-player-turn-common-v2.lp invalid_move.lp

```

* To solve a game

```
python run_test_2.py [game name] [-v2|-v4] extra-quantifier.lp [caqe|depqbf] [optional: game configuration]

```

## Results

We run the experiments on several families, with an iterative deepening approach. Each instance has a time limit of 30 minutes. The result is recorded as a tuple (time, max depth). If the solver can solve the instance with the maximum possible
depth, max depth is equal to max-depth. Otherwise, it is the largest depth the solver is capable of printing UNSAT.

**Tic-Tac-Toe**
Configuration | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | ---
3x3 (F) | 9 | (0.24,9) | (0.30,9) | (0.27,9) | (0.19,9)


**Connect-3**

Configuration | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | ---
4x4 (T) | 9 | (0.04,9) | (0.04,9) | (0.06,9) | (0.04,9)
5x5 (T) | 9 | **(0.14,9)** | (0.19,9) | (0.19,9) | (0.17,9)

**Connect-4**

Configuration | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | ---
4x4 (F) | 15 | **(0.24,15)** | (1.06,15) | (0.32,15) | (0.54,15)
5x4 (F) | 19 | (30.43,19) | - | - | -
5x5 (?) | 25 | - | - | - | -

**Break-Through-1-row**

Configuration | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | ---
3x3 (T) | 5 | - | - | - | -
3x4 (T) | 9 | - | - | - | -
4x4 (T) | 11 | - | - | - | -
5x4 (T) | 11 | - | - | - | -

**Break-Through-2-row**

Configuration | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | ---
2x5 (F) | 21 | - | - | - | -
2x6 (T) | 15 | - | - | - | -
3x4 (F) | 19 | - | - | - | -
3x5 (F) | 31 | - | - | - | -
4x4 (F) | 25 | - | - | - | -
4x5 (?) | 41 | - | - | - | -

**Traffic-Light**

Configuration | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | ---
3x3 (T) | 17 | - | - | - | -
3x4 (?) | ? | - | - | - | -

**GTTT-4x4-1-1**

Configuration | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | ---
domino (T) | 3 | - | - | - | -
ei (T) | 5 | - | - | - | -
elly (T) | 7 | - | - | - | -
fatty (F) | 15 | - | - | - | -
knobby (F) | 15 | - | - | - | -
skinny (F) | 15 | - | - | - | -
tic (T) | 5 | - | - | - | -
tippy (T) | 9 | - | - | - | -

## Reference

Note that this piece of work relies on https://github.com/potassco/qasp2qbf
