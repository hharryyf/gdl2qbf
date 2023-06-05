# QBF Encoding for Two player Zero Sum Turn-Taking GDL-I game
A converter from 2-player zero-sum turn-taking GDL-I games to QBF

## Assumption

The game is a two-player zero-sum turn-taking game described in GDL-I. The player plays first is called xplayer, and
the player plays second is called oplayer. In our current implementation, we only support games that the players take
alternating moves (i.e. x moves - o moves - x moves...). Note that this restriction can be eased to the case that there does
not exist a turn T such that T can be both an x-turn and an o-turn. For example, it is possible to relax the restriction 
to GTTT-4x4-2-1, but not games like https://en.m.wikipedia.org/wiki/Dots_and_boxes.

## Method

We use a technique similar to the corrective encoding. We would translated the GDL-I game to QASP, and use the available QASP2QBF tool to form the final QBF encoding. We firstly use the clingo grounder to extract all the ground atoms. We use log-encoding for the universal actions, and all the other ground atoms are quantified existentially. The quantifier block of the existential variables must be calculated nicely to ensure the correctness and efficiency of the solver. We would make use of the dependecy graph of predicates. We would extract
the non-static predicates by searching for all predicates reachable from true and does. Then, for all the non-static predicates that are not reachable (resp. reachable) from does, if they have timestamp T that is even, we put them in the quanfier block T-1 (resp. T+1). For predicates with timestamp T that is odd, we put them in the quantifier block T.

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

We run the experiments on several families, with an iterative deepening approach. Each instance has a time limit of 20 minutes. If the solver can solve the instance with the maximum possible winning depth d, max-depth is equal to d. Otherwise,
max-depth is equal to the maximum depth d' in ***italic*** such that there exists at least one solver configuration can solve the instance and print UNSAT. We record the time in the corresponding column, * means timeout.

**Break-Through-1-row**

Configuration | Result | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | --- | ---
3x3 | T | 5 | 0.00 | 0.00 | 0.00 | 0.00
3x4 | T | 9 | 0.13 | 0.51 | 0.11 | **0.07**
4x3 | T | 5 | **0.01** | 0.02 | 0.02 | 0.05
4x4 | T | 11 | **3.34** | * | 8.47 | 6.39
4x5 | T | 15 | * | * | **807.54** | 844.01
5x4 | T | 11 | **20.33** | * | 35.86 | 34.06

**Break-Through-2-row**

Configuration | Result | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | --- | ---
2x5 | F | 21 | 0.74 | * | **0.20** | 0.78
2x6 | T | 15 | **2.86** | * | 7.23 | 4.74
3x4 | F | 19 | 0.26 | * | **0.15** | 0.39
3x5 | ? | *17* | ***635.74*** | * | 781.66 | 904.67
4x4 | F | 25 | 22.73 | * | **3.28** | 95.05

**Connect-3**

Configuration | Result | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | --- | ---
4x4 | T | 9 | 0.04 | 0.04 | 0.06 | 0.04
5x5 | T | 9 | **0.14** | 0.19 | 0.19 | 0.17

**Connect-4**

Configuration | Result | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | --- | ---
4x4 | F | 15 | **0.24** | 1.06 | 0.32 | 0.54
5x4 | F | 19 | **30.43** | 171.33 | 43.54 | 122.42
5x5 | ? | *21* | 462.14 | * | ***242.24*** | *

**GTTT-4x4-1-1**

Configuration | Result | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | --- | ---
domino | T | 3 | 0.00 | 0.02 | 0.00 | 0.00
ei | T | 5 | 0.20 | 0.06 | 0.12 | **0.05**
elly | T | 7 | **0.35** | 1.02 | 1.20 | 0.58
fatty | F | 15 | 436.99 | * | 513.28 | **336.32**
knobby | F | 15 | * | * | **859.47** | *
skinny | F | 15 | **234.72** | * | * | 795.51
tic | T | 5 | **0.02** | 0.08 | 0.05 | 0.08
tippy | T | 9 | **2.55** | 3.15 | 5.39 | 3.64

**Tic-Tac-Toe**

Configuration | Result | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | --- | ---
3x3 (3) | F | 9 | **0.20** | 0.30 | 0.35 | 0.33

**Traffic-Light**

Configuration | Result | max-depth | Caqe-v2  | DepQBF-v2 | Caqe-v4 | DepQBF-v4
--- | --- | --- | --- | --- | --- | ---
3x3 | T | 17 | **155.55** | * | 338.07 | *
3x4 | ? | *15* | ***773.24*** | * | * | *


Version 2 with cheating variable has a similar performance as version 4. However, if we focus on the solver DepQBF, removing the
set of cheating variables can produce a significant difference.

## Reference

Note that this piece of work relies on https://github.com/potassco/qasp2qbf for converting QASP to QBF.

It relies on https://github.com/lonsing/depqbf and https://github.com/ltentrup/caqe for QBF solving, and 
https://github.com/lonsing/qratpreplus and https://fmv.jku.at/bloqqer/ for preprocessing.


