# gdl2qbf
A converter from two-player zero-sum turn-taking GDL to QBF, [the paper](https://www.ifaamas.org/Proceedings/aamas2024/pdfs/p807.pdf) is attached. Only the best-performed dependency-based quantification method is supported.

The experiments in the paper can be found in archive/. The code in this directory is basically a cleaner version of the code in archive/.

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


**The experients in the paper can be found in archive/.**

## Dependencies

* Clingo https://github.com/potassco/guide/releases (clingo must be put into PATH)

* QBF solver Caqe https://github.com/ltentrup/caqe and DepQBF  https://github.com/lonsing/depqbf 

* Python 3+

* QBF preprocessor bloqqer  https://fmv.jku.at/bloqqer/ (bloqqer must be put into PATH)

* qasp2qbf and its dependencies (i.e., lp2normal2, lp2acyc, lp2sat) https://github.com/potassco/qasp2qbf https://research.ics.aalto.fi/software/asp/download/ (lp2normal2, lp2acyc, lp2sat must be put into PATH)

* KIF to Ext(G) converter: the example usage of this tool can be found in SinglePlayer/. You need to install ECLiPSe Prolog https://eclipseclp.org/ first.

## Usage

* First create the answer set program Ext(G) with SinglePlayer/EXTTranslator.ecl from a GDL in KIF format

* **Requirement: Ext(G) must be the temporal-extended ASP program of some two-player zero-sum turn-taking GDL game G, and the 2 players must be specified when you run the following python command**


* Then just run the following command

```
python extg2qbf.py [path to the temporal-extended ASP program]  [name of the current player] [name of the other player] [True|False]

```

The final argment indicates whether bloqqer preprocessing is activated or not.

Example:

```
python extg2qbf.py SinglePlayer/Translations/gttt-4x4-1-1-tippy.asp xplayer oplayer True

```

* The unpreprocessed instance is stored in game.qdimacs, the bloqqer preprocessed instance is stored in game_bloqqer.qdimacs

* To solve the instance, just run

```

[caqe|depqbf] game_bloqqer.qdimacs

```

## Contributors

* Yifan He, Abdallah Saffidine, Michael Thielscher
