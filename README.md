# Tool chain for converting two-player zero-sum turn-taking GDL to QBF

## Contribution

In our paper, we designed the framework of converting a two-player zero-sum turn-taking GDL game G to a QBF instance.
The framework is as follows:
```

G -> Ext(G) -> QASP(G) -> QBF


```

In this framework, G -> Ext(G) was done by Thielscher in the single-player game paper (check the referenced tool SinglePlayer, and run the eclipse prolog file EXTTranslator.ecl), QASP(G) -> QBF was done by Fandinno et al. in their qasp2qbf tool https://github.com/potassco/qasp2qbf

More specifically, EXTTranslator.ecl can convert a GDL decription in KIF format without the "or" operator to Ext(G). For simplicity, the author didn't handle the "or" operator automatically, although it can be done automatically. Check the difference between GameDescriptions/tic-tac-toe.gdl and Translations/tic-tac-toe.asp to see how the tool works.

Our contributions are:

* We designed the correct algorithm of converting an arbitrary two-player zero-sum turn-taking GDL game to a QBF instance.

* We designed and implemented an efficient encoding and quantification method that converts Ext(G) to QASP(G).


## Dependencies

* Clingo https://github.com/potassco/guide/releases

* QBF solver Caqe https://github.com/ltentrup/caqe and DepQBF  https://github.com/lonsing/depqbf 

* Python 3+

* ECLiPSe Prolog https://eclipseclp.org/

* QBF preprocessor bloqqer  https://fmv.jku.at/bloqqer/ 

* Dependencies of qasp2qbf https://github.com/potassco/qasp2qbf 

* KIF to Ext(G) converter by Thielscher (check SinglePlayer/)

## How to use the tool

* First create the answer set program Ext(G) according definition 2 in our paper or with EXTTranslator.ecl form a GDL in KIF

* **Requirement: Ext(G) must be the temporal-extended ASP program of some two-player zero-sum turn-taking GDL game G, and the 2 players must call xplayer and oplayer respectively**


* Then just run the following command, out_plain.txt will store the unpreprocessed QBF instance translated from Ext(G)

```
python extg2qbf.py [optional]  

```

optional is the path to the Temporal-extended ASP.
Note that if optional is not specified, the program will create the QBF instance based on the Temporal-extended ASP in game.lp.


Example usage:

```
python extg2qbf.py SinglePlayer/Translations/gttt-4x4-2-2-tippy.asp

```

* The unpreprocessed instance is stored in game.qdimacs, the bloqqer preprocessed instance is stored in game_bloqqer.qdimacs

* To solve the instance, just run

```

[caqe|depqbf] out.txt

```
