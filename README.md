# gdl2qbf
A converter from two-player zero-sum turn-taking GDL to QBF

## Description

The converter will translate a two-player zero-sum turn-taking GDL to a QBF instance, the QBF instance is true if and only if the current player can achieve 100 points in the GDL game no matter what the other player performs.

## Contribution

In our paper, we designed the framework of converting a two-player zero-sum turn-taking GDL game G to a QBF instance.
The framework is as follows:
```

G -> Ext(G) -> QASP(G) -> QBF


```

In this framework, G -> Ext(G) was done by Michael Thielscher in the single-player game paper (check the referenced tool in SinglePlayer/, and run the eclipse prolog file EXTTranslator.ecl), QASP(G) -> QBF was done by Fandinno et al. in their qasp2qbf tool https://github.com/potassco/qasp2qbf

More specifically, EXTTranslator.ecl can convert a GDL decription in KIF format without **nested** "or" operator to Ext(G). For simplicity, the author didn't handle the nested "or" operator automatically, although it can be done automatically. Check the difference between GameDescriptions/tic-tac-toe.gdl and Translations/tic-tac-toe.asp to see how the tool works. Even if EXTranslator.ecl can handle 1-level "or" operator, for performance reasons, it is recommended that all the "or" operators in the KIF input are removed manually.

Our contributions are:

* We designed the correct algorithm of converting an arbitrary two-player zero-sum turn-taking GDL game to a QBF instance.

* We designed and implemented an efficient encoding and quantification method that converts Ext(G) to QASP(G).


## Dependencies

* Clingo https://github.com/potassco/guide/releases

* QBF solver Caqe https://github.com/ltentrup/caqe and DepQBF  https://github.com/lonsing/depqbf 

* Python 3+

* ECLiPSe Prolog https://eclipseclp.org/

* QBF preprocessor bloqqer  https://fmv.jku.at/bloqqer/ 

* qasp2qbf by Fandinno et al and its dependencies (i.e., lp2normal2, lp2acyc, lp2sat) https://github.com/potassco/qasp2qbf https://research.ics.aalto.fi/software/asp/download/

* KIF to Ext(G) converter by Thielscher: check the "run" function in SinglePlayer/EXTTranslator.ecl, you need to specify two parameters the [ name ] of the game (assume the game is put in GameDescriptions of format [ name ].gdl), and the horizon of the game.

Example usage is compile the SinglePlayer/EXTTranslator.ecl and feed the function run with parameters "tic-tac-toe" and 9, then you will get the Ext(G) of tic-tac-toe in Translations/tic-tac-toe.asp with depth 9.

## Usage

* First create the answer set program Ext(G) according definition 2 in our paper or with EXTTranslator.ecl form a GDL in KIF

* **Requirement: Ext(G) must be the temporal-extended ASP program of some two-player zero-sum turn-taking GDL game G, and the 2 players must be specified when you run the following python command**


* Then just run the following command, out_plain.txt will store the unpreprocessed QBF instance translated from Ext(G)

```
python extg2qbf.py [optional]  [name of the current player] [name of the other player]

```


Example:

```
python extg2qbf.py SinglePlayer/Translations/gttt-4x4-1-1-tippy.asp xplayer oplayer

```

* The unpreprocessed instance is stored in game.qdimacs, the bloqqer preprocessed instance is stored in game_bloqqer.qdimacs

* To solve the instance, just run

```

[caqe|depqbf] game_bloqqer.qdimacs

```
