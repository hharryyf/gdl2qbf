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
the non-static predicates by searching for all predicates reachable from true and does. Then, for all the non-static predicates that are not reachable (resp. reachable) from does, if they have timestamp T that is even, we put them in the quanfier block T-1 (resp. T+1). For predicates with timestamp T that is odd, we put them in the quantifier block T. In version 5, we build the quantifier block based on the ground-atom dependency graph instead of the predicate dependency graph.

## Usage

* To extract the move domain for version 2

```
clingo --output=smodels [game/game.lp] move-domain.lp | python find_move_domain.py

```

* To extract the move domain for version 4

```
clingo --output=smodels [game.lp] move-domain.lp | python find_move_domain_v2.py

```


* To solve a game that is alternating

```
python run_test_2.py [game name] [-v2|-v4] extra-quantifier.lp [caqe|depqbf] [optional: game configuration]

```

* To solve a game that is turn-taking (note that from version 5, we can solve games like GTTT-2-1)

```
python run_test_3.py [game name] -v5 extra-quantifier.lp [caqe|depqbf] [optional: game configuration]

```

* To proof a game that is turn-taking, just run the following command. If it is UNSAT, the game is turn-taking.

```
clingo [game name] turn-taking.lp

```

## Results

We run the experiments on several families, with an iterative deepening approach. Each instance has a time limit of 1500s. If some solvers can solve the instance with the maximum possible winning depth d (we know the value of d for all of these games), max-depth is equal to d. Otherwise, max-depth is equal to the maximum depth d' in ***italic*** such that there exists at least one solver configuration can solve the instance and print UNSAT. We record the time in the corresponding column, * means timeout. The solvers we use include Caqe (C), and DepQBF (D), the preprocessor is either bloqqer (B) or a combination of bloqqer and qratpre++ (BQ).

**Break-Through-1-row**

Config | Result | max-depth | C-BQ-v2  | D-BQ-v2 | C-BQ-v4 | D-BQ-v4 | C-B-v5 | D-B-v5
--- | --- | --- | --- | --- | --- | --- | --- | ---
3x3 | T | 5 | 0.00 | 0.00 | 0.00 | 0.00 | 0.01 | 0.02
3x4 | T | 9 | 0.13 | 0.51 | 0.11 | **0.07** | 0.24 | 0.32
4x3 | T | 5 | **0.01** | 0.02 | 0.02 | 0.05 | 0.06 | 0.16
4x4 | T | 11 | **3.34** | * | 8.47 | 6.39 | 4.34 | 8.37
4x5 | T | 15 | * | * | 807.54 | 844.01 | 710.62 | **592.81**
5x4 | T | 11 | **20.33** | * | 35.86 | 34.06 | 92.67 | 50.31

**Break-Through-2-row**

Config | Result | max-depth | C-BQ-v2  | D-BQ-v2 | C-BQ-v4 | D-BQ-v4 | C-B-v5 | D-B-v5
--- | --- | --- | --- | --- | --- | --- | --- | ---
2x5 | F | 21 | 0.74 | * | **0.20** | 0.78 | 0.29 | 1.98
2x6 | T | 15 | **2.86** | * | 7.23 | 4.74 | 7.56 | 8.59
3x4 | F | 19 | 0.26 | * | **0.15** | 0.39 | 1.53 | 0.71
3x5 | ? | *17* | ***635.74*** | * | 781.66 | 904.67 | 1038.38 | 836.66
4x4 | F | 25 | 22.73 | * | **3.28** | 95.05 | 32.35 | 56.19

**Connect-3**

Config | Result | max-depth | C-BQ-v2  | D-BQ-v2 | C-BQ-v4 | D-BQ-v4 | C-B-v5 | D-B-v5
--- | --- | --- | --- | --- | --- | --- | --- | ---
4x4 | T | 9 | 0.04 | 0.04 | 0.06 | 0.04 | 0.04 | 0.04
5x5 | T | 9 | 0.14 | 0.19 | 0.19 | 0.17 | **0.12** | 0.17


**Connect-4**

Config | Result | max-depth | C-BQ-v2  | D-BQ-v2 | C-BQ-v4 | D-BQ-v4 | C-B-v5 | D-B-v5
--- | --- | --- | --- | --- | --- | --- | --- | ---
4x4 | F | 15 | **0.24** | 1.06 | 0.32 | 0.54 | 0.47 | 1.10
5x4 | F | 19 | **30.43** | 171.33 | 43.54 | 122.42 | 93.67 | 177.24
5x5 | ? | *21* | 462.14 | * | ***242.24*** | * | 420.99 | 1252.73 (full problem is ~6h)

**GTTT-4x4-1-1**

Config | Result | max-depth | C-BQ-v2  | D-BQ-v2 | C-BQ-v4 | D-BQ-v4 | C-B-v5 | D-B-v5
--- | --- | --- | --- | --- | --- | --- | --- | ---
domino | T | 3 | 0.00 | 0.02 | 0.00 | 0.00 | 0.00 | 0.00
ei | T | 5 | 0.20 | 0.06 | 0.12 | 0.05 | 0.16 | **0.04**
elly | T | 7 | **0.35** | 1.02 | 1.20 | 0.58 | 0.66 | 1.06
fatty | F | 15 | 436.99 | * | 513.28 | **336.32** | 619.84 | 536.47
knobby | F | 15 | * | * | 859.47 | * | **725.89** | 1100.86
skinny | F | 15 | **234.72** | * | * | 795.51 | * | 1172.27
tic | T | 5 | **0.02** | 0.08 | 0.05 | 0.08 | 0.06 | 0.06
tippy | T | 9 | **2.55** | 3.15 | 5.39 | 3.64 | 4.82 | 7.69

**Tic-Tac-Toe**

Config | Result | max-depth | C-BQ-v2  | D-BQ-v2 | C-BQ-v4 | D-BQ-v4 | C-B-v5 | D-B-v5
--- | --- | --- | --- | --- | --- | --- | --- | ---
3x3 (3) | F | 9 | **0.20** | 0.30 | 0.35 | 0.33 | 0.63 | 0.40

**Traffic-Light**

Config | Result | max-depth | C-BQ-v2  | D-BQ-v2 | C-BQ-v4 | D-BQ-v4 | C-B-v5 | D-B-v5
--- | --- | --- | --- | --- | --- | --- | --- | ---
3x3 | T | 17 | **155.55** | * | 338.07 | * | 397.01 | 1123.12
3x4 | ? | *15* | ***773.24*** | * | * | * | * | * 


Version 2 with cheating variable has a similar performance as version 4. However, if we focus on the solver DepQBF, removing the
set of cheating variables can produce a significant difference. Also for version 5, it is quite interesting that qratpre++ is no
longer having a strictly positive impact, on gttt-4x4, adding qratpre++ would weaken the solver's performance.

## Reference

Note that this piece of work relies on https://github.com/potassco/qasp2qbf for converting QASP to QBF.

It relies on https://github.com/lonsing/depqbf and https://github.com/ltentrup/caqe for QBF solving, and 
https://github.com/lonsing/qratpreplus and https://fmv.jku.at/bloqqer/ for preprocessing.


