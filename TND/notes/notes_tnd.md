# Analyse et Traitement Numérique des Données

[TOC]

# 0. Introduction

Pour trouver une solution à un problème, il est parfois nécessaire d'avoir recours à : une **optimisation**, une **interpolation** et une **extrapolation**, une **intégration numérique**, une **dérivation numérique** ou une **équation différentielle**.

Les méthodes numériques sont soumises à certaines contraintes de qualité :  la **convergence ** (au plus on laisse de temps de calcul à la méthode au plus elle se rapproche de la solution) et la **complexité**, l'**ordre de convergence**, la **sensibilité aux erreurs d'arrondis**, la **stabilité** (inputs similaires, réponses similaires).

# 1. Erreurs numériques, Complexité, Algorithme, Structure de données

Les erreurs introduites dans la solution d'un problème ont plusieurs origines. Les *erreurs d'arrondis*, les *erreurs inhérentes aux données* et les *erreurs de troncature*.

## 1.1 Erreurs d'arrondis

Les **erreurs d'arrondis** sont inhérentes au caractère réel et fini d'un nombre et la capacité d'un système de représenter un nombre infini de décimales d'un nombre réel. Les arrondis vont jusqu'à un rejet d'une demie unité du rang concerné. 

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



# 2. Méthodes Numériques

# 3. Algorithme de Machine Learning

--> Projet intégré d'analyse et d'implémentation