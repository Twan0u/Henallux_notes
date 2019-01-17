# 4 L’héritage dans les bases de données

Il y a héritage des attributs du super-type (héritage de l’identifiant, pas d’identifiant spécifique aux sous-types)

représentation DB main :
![](https://imgur.com/3AUtRN9l.png)
![](https://imgur.com/yRW1EKXl.png)
![](https://imgur.com/F4QwTZql.png)

Copie des attributs du super-type dans les sous-types
![](https://imgur.com/pazkMhll.png)
![](https://imgur.com/BjQmXPKl.png)

## 4.1 utilisation d'un type générique

![](https://imgur.com/2FoexDwl.png)

Si Type = "SousTypeA"

* Tous les AttributBi = null


Si Type = "SousTypeB"

*  Tous les AttributAi = null

![](https://imgur.com/CCupibll.png)
![](https://imgur.com/MxWJBYzl.png)

## 4.2 Quel type de transformation choisir?
Du nombre d’attributs dans

* le super-type : Si pas nombreux, représentation des types spécifiques
* les sous-types : Si pas nombreux, représentation du type générique


Du nombre de T.A. reliés

* au super-type : Si nombreux, pas de représentation des types spécifiques
* aux sous-types : Si nombreux, pas de représentation du type générique

S’il faut enregistrer des occurrences du super-type qui
ne sont pas des spécialisations. La represetation d'un type spécifique ne va pas suffire.

Si contraintes de performance : bcp de tables, bcp de jointure, couteux. On évite donc les Is-a

![](https://imgur.com/OguCZhul.png)
