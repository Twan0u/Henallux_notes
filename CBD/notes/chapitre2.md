# 2 Le modèle entités-associations 

## 2.1 Introduction

Il existe 3 étapes dans la création d'une base de donées. On débute avec un shéma conceptuel (**Entité association**). Puis, un shéma logique (**Shéma conforme ou SGBD**) et on termine avec un shéma physique ou **SQL**

## 2.2 Entités et types d'entités(T.E.)

Une **Entité** est une chose qui existe dans le monde réel, à propos de laquelle on veut enregistrer des informations.
Un **Type d'entité** est une abstraction générale de ce qui caractérise plusieurs entités communes. 

Ainsi, une entité deviendra une occurence d'un type d'entité. (ex : Bob est une ocurence de Humain)

> \> un Type d'entité ne prends pas de 's' ( ex : nom et ~~noms~~ ) 

On définira donc un Type d'entité par son **Nom** et sa **Liste d'attributs**

## 2.3 Associations-Type d'associations (T.A)

Une **association** est une correspondance, un lien entre 2 ou plusieurs entités.

> \> Une Occurence d'un T.A. est toujours reliée à une et une seule occurence de chaque T.E. associé.

* 1 à 1
* 1 à N
* N à N

Section-(0àN)--[inscription]--(1à1)-Etudiant

Une cardinalité est le nombre de liens entre 2 types d'entités. 

### Obligatoire et Facultatif

La cardinalité minimum d'un type d'entités donne son caractére obligatoire(**1**) ou facultatif(**0**).
 
## 2.4 Construction d'un Shéma conceptuel 

Pour former un shémas, on cherche 2 concepts et un Lien qui les unis

## 2.5 Interêt de prévoir un type d'association plutôt qu'un atribut

Lors de la création d'un shémas, on pourait penser qu'utiliser un attribut plustôt qu'un type d'association peut être une bonne idée. En pratique, ce n'est jamais le cas. En effet, si vous laissez à vos utilisateurs le soin de rentrer (par exemple leur code de cours) ils se peut que ceux-ci se trompent et indiquent **n'importe quelle chaine de caractère**. Il n'y a pas non plus de **vérification de cohérence** que peut offir un SGBD par l'intermédiaire de **contraintes**.

## 2.6 Attributs

Un **Attribut** est défini par un *nom*, un *type* et le *domaine de valeurs admises*. 

> \> Un Attribut Booleen possède 3 valeurs possibles : Vrai, Faux **ET NULL** quand on ne sait pas. 

### 2.6.1 Identifiant

Un **identifiant** est un type particulier d'*attribut* qui prends une valeur différente pour chaque entité dans la Base de Données.

### 2.6.2 Mono/Multi-Valués

Un *attribut* peut être :    

* **Mono-valué** (ex : nom)  
* **Multi-valué** (ex : prenoms[1..6])
    * *Obligatoire* prenoms[1..3]
    * *Facultatif* prenoms[0..3]

### 2.6.3 Atomique ou Décomposable

**Atomique** : Attribut non décomposable
**Décomposable** : Attribut que l'on peut décomposer (ex : une adresse)

## 2.7 Non Redondance dans le shémas entités-association

Pour des raisons de cohérence et d'économie sur les disques on évitera toute forme de redondance pour toutes les **données déjà présentes** ou les **données calculables**  


   




















