# 2 Le modèle entités-associations

## 2.1 Introduction

Il existe 3 étapes dans la création d'une base de donées.

* *Shéma conceptuel* (**Entité-association**).
* *Shéma logique* (**Shéma conforme ou SGBD**).
* *Shéma physique* (script **SQL** si relationnel).

Le shéma conceptuel est indépendant de tout SGBD. Son but est de mettre en évidence les concepts évidents et les relations qu'ils ont les uns avec les autres. Pour la création d'un shémas conceptuel on peut utiliser comme outil le modèle entité-association. Il exprime sa séantique de données sur le principe des notions **d'entitées**, **d'associations**, **d'attributs** et le **mécanisme de contraintes d'intégrité**.

**Sémantique** : sens, signification attribuée aux données.  

## 2.2 Entités et types d'entités(T.E.)

Une **Entité** est une chose qui existe dans le monde réel, à propos de laquelle on veut enregistrer des informations.

Un **Type d'entité** est une abstraction générale de ce qui caractérise plusieurs entités communes.

Ainsi, une entité deviendra une occurence d'un type d'entité. (ex : Bob est une ocurence de Humain)

> \> un Type d'entité ne prends pas de 's' ( ex : nom et ~~noms~~ ) le s désigne l'ensemble de ses occurences.

On définira donc un Type d'entité par son **Nom** et sa **Liste d'attributs**

![](https://i.ibb.co/zmH3cqc/entite.png)

L'**identifiant** possède une valeur distincte pour chaque occurrence du T.E.

## 2.3 Associations-Type d'associations (T.A)

Une **association** est une correspondance, un lien entre 2 ou plusieurs entités.

![](https://i.ibb.co/pwfDtN6/assoc.png)

> \> Une Occurence d'un T.A. est toujours reliée à une et une seule occurence de chaque T.E. associé. ( ex : une seule consultation pour un medecin et un client )

* 1 à 1
* 1 à N
* N à N

> \> L'emplacement des cardinalités est l'inverse de celui utilisé pour le diagramme de classes


![](https://i.ibb.co/mqTsYc4/assoc2.png)

### cas d'un 1 à 1

![](https://i.ibb.co/82wz4cf/assoc3.png)

Une cardinalité est le nombre de liens entre 2 types d'entités.

### Obligatoire et Facultatif

La cardinalité minimum d'un type d'entités donne son caractére:

* obligatoire(**1**)
* facultatif(**0**).

## 2.4 Construction d'un Shéma conceptuel

Pour former un shémas, on cherche 2 concepts et un Lien qui les unis

## 2.5 Interêt de prévoir un type d'association plutôt qu'un atribut

Lors de la création d'un shémas, on pourait penser qu'utiliser un attribut plustôt qu'un type d'association peut être une bonne idée. En pratique, ce n'est jamais le cas. En effet, si vous laissez à vos utilisateurs le soin de rentrer (par exemple leur code de cours) ils se peut que ceux-ci se trompent et indiquent **n'importe quelle chaine de caractère**. Il n'y a pas non plus de **vérification de cohérence** que peut offir un SGBD par l'intermédiaire de **contraintes**.

## 2.6 Attributs

Un **Attribut** est défini par un *nom*, un *type* et le *domaine de valeurs admises*.

> \> Un Attribut Booleen possède 3 valeurs possibles : Vrai, Faux **ET NULL** quand on ne sait pas.

### 2.6.1 Identifiant

Un **identifiant** est un type particulier d'*attribut* qui prends une valeur différente pour chaque entité dans la Base de Données.

> \> Il est représenté sous-ligné dans le modèle entité-association


### 2.6.2 Mono/Multi-Valués

Un *attribut* peut être :    

* **Mono-valué (ou simple)** (ex : nom)  
* **Multi-valué (ou répétitif)** (ex : prenoms[1..6])

* **Obligatoire** prenoms[1..3]
* **Facultatif** prenoms[0..3]

### 2.6.3 Atomique ou Décomposable

**Atomique** : Attribut non décomposable     
**Décomposable** : Attribut que l'on peut décomposer (ex : une adresse)

![](https://imgur.com/OUY8LyQl.png)


## 2.7 Non Redondance dans le shémas entités-association

Pour des raisons de cohérence et d'économie sur les disques on évitera toute forme de redondance pour toutes les **données déjà présentes** ou les **données calculables**  


## 2.9 ...
...

Un mauvais ternaire :
![](https://imgur.com/nVM4KIJl.png)

### 2.9.2 T.A. Cyclique
=**T.A. Réflexifs** ou **T.A.Récursifs**

![](https://imgur.com/slhlQQVl.png)

### 2.9.3 T.A. Avec des Attributs
On peut ajouter à un T.A. N à N un attribut. Cette caractéristique décrira alors le lien qui unit les deux T.E. .

![](https://imgur.com/JzLknc9l.png)

Ici le prix varie en fonction de l'article et du magasin.

On peut ainsi retenir une évolution. En transformant le shéma en un N à N.
![](https://imgur.com/R6wvdj6l.png)
 On obtiens :
 ![](https://imgur.com/f6XCz9Yl.png)

Si on à un T.A. 1 à N, il est inutile d'associer une caractéristique au T.A. Il peut être associé au T.E. avec la cardinalité maximum de 1.

Si le T.A. est facultatif du côté de la cardinalité maximum = 1, l’attribut placé
dans le T.E. correspondant est alors facultatif.

![](https://imgur.com/zKkEzz3l.png)

## 2.10 Contraintes additionnelles
Le shéma est limité et ne suffit pas à lui seul, c'est pourquoi on complète le shéma avec de la documentation annexe.
Cette documentation comprend la **définition** des termes ( T.E., T.A., Attribut) et des **contraintes additionnelles**.

On peut exprimer des *contraintes additionnelles* en Français ou en pseudo-language.

### 2.10.1 Identifiant avec des attributs
La valeur d'un identifiant est **fixe** et ne peut pas changer au cours du temps.

* Identifiant avec un seul attribut (soulignés)
* Identifiant composé d'Attributs (soulignés et reliés par une ligne verticale)
* Plusieurs identifiants

On préfère utiliser un identifiant technique qu'un identifiant composé en entreprise (Ex : ID007)

### 2.10.2 Identifiant Hybride
Un **identifiant hybride** est un identifiant composé de  0, 1 ou plusieurs attribut(s) **ET** un ou plusieurs rôle(s) via un ou plusieurs T.A.(s).
 ![](https://imgur.com/GJBzVOwl.png)


 Le formalisme des schémas entité-association ne permet pas de représenter ce
type d’identifiant **hybride**. Il faut donc avoir recours à une **contrainte
additionnelle** exprimée en **pseudo-langage**.

L’identifiant du T.E. Local est spécifié via la contrainte additionnelle suivante :

**id (Local) : Batiment, Numero.**

Un identifiant hybride n’est possible que s’il y a des cardinalités 1-1.

S’il existe plusieurs T.A. entre Batiment et Local, il est indispensable de
préciser dans la contrainte via quel T.A. le T.E:

**id (Local) : Localisation.Batiment, Numero**

### 2.10.3 Identifiant de type d’association
#### 1 à N

Même idée que dans le cas d'un identifiant hybride. Un type d’association 1 à N est identifié par l’identifiant du type d’entité qui joue le rôle dont la cardinalité maximum est 1.
![](https://imgur.com/Ly4A3nrl.png)

#### N à N
Par défaut, un type d’association N à N est identifié par la combinaison
des identifiants des types d’entité reliés.

Cependant on précise dans le cas d'un T.A. avec des caractéristiques son origine :

![](https://imgur.com/CydvUsnl.png)
**Id(Vente) : Magasin, Article**

![](https://imgur.com/sR9QVlIl.png)
**id(Achat) : Client, Produit, Fournisseur**

Cas un peu particulier :
![](https://imgur.com/bMWumUWl.png)
**id(Achat) : Client, Produit, Fournisseur, Date**
> \> Il ne faut pas souligner l’attribut Date sur le schéma ; il n’est en effet pas à
lui seul identifiant du T.A.

#### Résumé
En résumé, l’identifiant à préciser pour un T.A. doit être l’identifiant **minimum**.
Par conséquent, tous les attributs d’un T.A. n’interviennent pas forcément dans
l’identifiant (cf quantité).  
Si cet identifiant est **implicite**, on ne le précise pas sur le schéma.  
Si ce n’est pas le cas (identifiant **explicite**), il s’agit d’une contrainte
additionnelle qu’il faut rajouter au schéma.

### 2.10.4 Autres contraintes additionnelles
Toutes les contraintes additionnelles liées au métier doivent bien évidemment
être identifiées lors de l’étape d’analyse conceptuelle.

Cependant, seules les contraintes additionnelles liées aux identifiants
seront exigées lors de l’évaluation du cours de Conception de bases de
données du bloc 2.

## 2.11 Dépendances fonctionnelles
l y a une dépendance fonctionnelle entre un groupe d’attributs dits
déterminés et un attribut déterminant.
Identifiant -> attributs

Les **dépendances fonctionnelles** entre l’identifiant du T.E. et d’autres
attributs du même T.E. sont des **dépendances fonctionnelles normales**s qui
n’engendrent **aucune redondance**.

![](https://imgur.com/Bt0u6Gil.png)

## 2.12 Transformation de schéma

On peut transformer un shéma sans pour autant en modifier la sémantique.

### 2.12.1 Transformation d’un type d’association en un type d’entité

![](https://imgur.com/F1IMHakl.png)

![](https://imgur.com/HlgSOd0l.png)

![](https://imgur.com/KtylBv4l.png)

### 2.12.2 Transformation d’attribut en type d’entité

![](https://imgur.com/rCbAhdRl.png)
