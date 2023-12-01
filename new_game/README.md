# Tool chain for converting Time-extended GDL Ext(G) to QBF with encoding method GD

## Dependencies

* Clingo https://github.com/potassco/guide/releases

* QBF solver Caqe https://github.com/ltentrup/caqe and DepQBF  https://github.com/lonsing/depqbf 

* Python 3+

* QBF preprocessor bloqqer  https://fmv.jku.at/bloqqer/ 

* Dependencies of qasp2qbf https://github.com/potassco/qasp2qbf 

## How to use the tool

* First create the answer set program Ext(G) according definition 2 in our paper

* Put Ext(G) inside game.lp

* Note that you must specify move_time_domain inside game.lp indicating the horizon of the game

* For example, to solve a game with horizon 9, just put 

```
move_time_domain(1..9).

```

* Then just run the following command, out_plain.txt will store the unpreprocessed QBF instance translated from Ext(G)

```
python extg2qbf.py   

```

* To obtain the preprocessed instance, just run

```

bloqqer out_plain.txt > out.txt

```

* To solve the instance, just run

```

[caqe|depqbf] out.txt

```