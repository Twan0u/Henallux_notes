# Analyse et Traitement Numérique des Données

[TOC]

# 0. Introduction

Pour trouver une solution à un problème, il est parfois nécessaire d'avoir recours à : une **optimisation**, une **interpolation** et une **extrapolation**, une **intégration numérique**, une **dérivation numérique** ou une **équation différentielle**.

Les méthodes numériques sont soumises à certaines contraintes de qualité :  la **convergence ** (au plus on laisse de temps de calcul (itérations de l'algorithme) au plus on se rapproche de la solution) et la **complexité**, l'**ordre de convergence**, la **sensibilité aux erreurs d'arrondis**, la **stabilité** (inputs similaires, réponses similaires).

# 1. Erreurs numériques, Complexité, Algorithme, Structure de données

Les erreurs introduites dans la solution d'un problème ont plusieurs origines. Les *erreurs d'arrondis*, les *erreurs inhérentes aux données* et les *erreurs de troncature*.

## 1.1 Erreurs d'arrondis

Les **erreurs d'arrondis** sont inhérentes au caractère réel et fini d'un nombre et la capacité d'une machine de représenter ceux-ci. 

Les arrondis vont jusqu'à un rejet d'une demie unité du rang concerné. 

Il existe 3 cas, (exemple d'approximation à l'unité supérieure)

* 15,2 : (2<5) approximation à l'unité inférieure : 15

* 15.8 : (8>5) approximation à l'unité supérieure : 16

* Si la valeur vaut 5 : 

  on regardera le chiffre au rang supérieur tel que :

  * 13,5 : 3 est impair du coup on approxime à l'unité supérieure : 14
  * 14,5 : 4 est pair du coup on approxime à l'unité inférieure : 14

## 1.2 Erreurs inhérentes aux données

Les **erreurs inhérentes aux données** sont les erreurs qui sont commises dans les mesures physiques et les résultats antérieurs.

## 1.3 Erreurs de troncature

Les **erreurs de troncature** sont présentes car il est impossible d'effectuer un nombre infini de calculs (ex : algorithmes itératifs, nombre finis de calculs) 

## 1.4 Représentation des nombres réels ( Norme IEEE 754-2008)

La représentation IEEE 754 est une norme arithmétique à virgule flottante utilisée pour représenter des nombres réels en réels en informatique 

La représentation binaire ne permets de représenter les nombres que de manière discrète. Par exemple, (0.1) ne peut pas être représenté directement mais seulement approximé.

> Voici une des raisons pour lesquelles il est de mauvaise pratique de comparer directement 2 nombres entiers en informatique. Cette indication est aussi valable pour la comparaison dans le cadre d'un **switch** case

Les nombres sont représentés sous la forme suivante:

* 1 bit pour le signe 
* 8 bits pour l'exposant 
* 23 bits pour la mantisse 

### 1.4.1 Le signe 

Le signe indique si le nombre représenté est positif ou négatif. Si il vaut 1, le nombre est négatif . 

### 1.4.2 L'exposant

L'exposant est signé. ce qui signifie qu'il faudra retirer 127 au nombre obtenus à l'exposant pour obtenir la valeur réele de celui-ci. 

Par exemple, si dans le cas du nombre 10000000 (128), sa valeur réelle vaudra 128-127 ce qui vaut 1.

### 1.4.3 La mantisse

La mantisse est la partie décimale du nombre. Elle sera multipliée par l'exposant pour obtenir la valeur finale du nombre représenté en IEEE754. 

### 1.4.4 Calculer en IEEE754

$$(-1)^{signe}.mantisse^{(exposant\ signé-127)} $$

### 1.4.5 Nombres particuliers

#### 1.4.5.1 Zero

On peut représenter un +0 et un -0. Il suffit de mettre un exposant valant 0 et une mantisse valant aussi 0. 



## 1.5 Erreur Absolue et Erreur Relative

### 1.5.1 Erreur Absolue

Soit $X$ la valeur exacte et $x$ la valeur attribuée. 

$e_{a}(X)$ est l'erreur absolue exactement commise et vaut $|X-x|$

$E_a(X) = max\ e_a(X)$ est l'erreur absolue maximale commise ou **Erreur Absolue**. 

> Dans le cadre d'une mesure au cm près, l'erreur maximale est de 0,5cm. On obtiens donc une E.A. de $\pm0,5$
>
#### Majorant de l'erreur absolue

Si le nombre est donné sans indication sur l’erreur l’affectant, on considèrera que toutes les décimales données sont exactes c’est-à-dire que la dernière décimale a été arrondie par rapport à la valeur exacte. 

L’erreur absolue vaut **au plus** *la moitié de la différence entre les deux éléments consécutifs* de F qui entourent x

> Ainsi, 2,1 et 2,10 sont différents car ils désignent une erreur différente. le premier sous entend une erreur maximale de $\pm0,05$ et l'autre $\pm 0,005$.



# 2. Méthodes Numériques

# 3. Algorithme de Machine Learning

--> Projet intégré d'analyse et d'implémentation

# TND (17-02-20)

On travaille avec le langage C pour ces test

## La représentation des entiers

### Maximum 

Un entier est codé sur 4 bytes. on à donc 32 bits pour un entier. Il existe donc $2^{32}$possibilités. Il ne faut cependant pas oublier que dans ces possibilités sont reprises les possibilités de nombres négatifs.

Les entiers varient donc de -2147483648 à  2147483647. 

On peut les afficher en c via ce petit bout de code : 

```c
#include <stdio.h>
#include <limits.h>
int main() {
    printf("ENTIERS :\n");
    printf("%d",INT_MIN);
    printf("%d  -  ",INT_MAX);
    return 0;
}
```



```c
#include <stdio.h>
#include <limits.h>
#include <float.h>

int main() {
    printf("\n FLOAT: \n");

    printf("%.10Ef   -  ",FLT_MAX);
    printf("%.10Ef",FLT_MIN);
    return 0;
}
```

# TND Cours (21-02-20)

## La quatrième révolution industrielle 

* **1$^e$ Révolution  industrielle**: *La Machine à vapeur*
* **2$^e$ Révolution industrielle**: L'électricité
* **3$^e$ Révolution  industrielle**: électronique et automatisation
* **4$^e$ Révolution  industrielle**: interconnexion de la 3$^e$ révolution par la microélectronique et Internet (plus les data)

Ces révolutions posent leur difficultés techniques qui les rendent de plus en plus compliquées à prendre en main. Ces révolutions sont aussi de plus en plus rapides l'une vis à vis de l'autre, le droit et l'éthique à donc de plus en plus de mal à suivre le rythme. 







> ajouter déf slide 45 (bas)

>  chapitre entre les deux pas à voir

## Propagation de l'erreur 

L'erreur absolue d'une somme est la somme des erreurs. Il s'agit d'une vision pessimiste mais qui à le mérite d'être correcte. 

$$E_{r}(x) = \frac{E_a(x)}{X}$$

## Cours  du 9-03

$E_a$ signifie erreur absolue