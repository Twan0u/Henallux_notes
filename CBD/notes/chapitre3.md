# 3 Bases de données relationnelles
Beaucoup de bases de donées sont de type relationnelles. Le language le plus connu pour communiquer avec ces base est le SQL (Structured Querry Language). C'est un langage dit déclaratif (il est non procédural)

## 3.1 Structure de base : les tables
Les bases de données relationnelles tiennent leur nom de la structure de base
qu’est la **relation**. Une relation est une structure qui rassemble **des données
reliées** entre elles.

Une *table* représente un **concept**.   
Une *ligne* de cette table est une **occurence**.   
Une *Colonnne* est un **attribut** du concept T.E.. On en définit un *nom*, un *type*, une *longueur* et éventuellement un *domaine*. Tous les attributs sont atomiques et monovalués.
La *valeur* est donnée par l'intersection d'une ligne et d'une collonne.

La valeur **NULL** peut signifier :

* Valeur de l'attribut inconnue
* L'attribut ne s'applique pas
* Certaines occurences ne possèdent pas de valeurs pour cet attribut

## 3.2 Ordre des colonnes

Aucun ordre n'existe. Le résultat dépendra de la requête : (ex : *select Nom, Prenom, DateNaissance, Statut, Telephone from Personne*)

## 3.3 Identifiant ou clé primaire
une **primary key** en SQL est un identifiant. une clé primaire est composé d'**un ou plusieurs attributs**.

Par convention, la/les colonnes seront soulignés. Et aucune clé primaire ne peut prendre de valeur NULL. Si une table possède plusieurs identifiant, on en choisit un qui sera utilisé comme clé primaire. les autres sont appelées **clé candidates** ou **alternatives**

## 3.4 Traduction d’un schéma conceptuel en relationnel

* Un attribut décomposable doit être éclaté.
* Les attributs multis-valués doivent être représentées sous la forme d'une autre T.E.

![](https://imgur.com/eTyi1dCl.png)

* La **clé étrangère** permets de représenter une T.A.

![](https://imgur.com/pE7ecXFl.png)
![](https://imgur.com/IxR6msZl.png)

> \> Notons que si l’identifiant de la table reliée est composé de plus d’une
colonne, la clé étrangère sera composée d’autant de colonnes.

* Il faut éclater tous les types N à N
![](https://imgur.com/svpCz2cl.png)
![](https://imgur.com/409F1x1l.png)
![](https://imgur.com/0Yy7xoEl.png)

* Cas de caractéristique pour le T.A.

![](https://imgur.com/OiB4aigl.png)
![](https://imgur.com/njG0Cr4l.png)

* Une T.A. Cyclique

![](https://imgur.com/8Wklkc8l.png)

![](https://imgur.com/F21Yiisl.png)

* Représentation des types d’association de degré supérieur à 2
![](https://imgur.com/gCxzeXGl.png)
