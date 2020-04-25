# Organisation et Exploitation des Données

Code cours : OEDB1

## 1. Introduction

Le principe de base d'une structure de données est de stocker en mémoire des données. On pourra effectuer des opérations sur cette structure (Mise à jour, Suppression, Insertion, ...).

Les opérations sont caractérisées par leur complexité : 

* Complexité Temporelle : Scalabilité de l'algorithme en fonction de la taille du problème
  * Best Case : meilleur cas pour l'algorithme
  * Worst Case : pire cas pour l'algorithme
* Complexité en espace : Utilisation de l'espace mémoire

Les variables sont caractérisées par leur *type*, il existe des types supportées nativement par la plus part des langages de programmation. ces types sont appelés *types primitifs*. On y trouves

* **Entiers** : Taille variable. Il stocke le résultat exact des opérations 
* **Réel** : La précision est variable en fonction  du nombre de décimales stockées (erreurs d'arrondi)
* **Booléen** : Vrai ou Faux
* **Caractère** : Stockage suivant le code ASCII ou EBCDIC
* **Pointeurs** : Adresse en mémoire désignant un objet

Une **structure de donnée** (ou collection) est une structure logique destinée à contenir des données organisées de manière à simplifier le traitement.

## 2. Tableaux

Un tableau est une structure de donnée les plus anciennes que l'on retrouve dans les premiers langages de programmation évolués.

L'espace mémoire des tableaux est gérée de manière statique et la longueur d'un tableau est fixe.

Chaque cellule d'un tableau peut contenir soit un type primitif, soit une autre structure (ex: un autre tableau).

Les tableaux sont : 

* *Homogène* : tous les éléments sont du même type
* *A accès direct*  (grâce à l'indice)

### 2.1 Types de tableaux

#### 2.1.1 Tableaux à une dimension

Ces tableaux sont ordonnées de manière consécutive.

##### Insertion ($O(n)$)

Pour ajouter de nouvelles données, il suffit d'ajouter celle-ci à la fin du tableau.

##### Trouver un élément ($O(n)$)

Pour trouver un élément dans le tableau il faut parcourir chaque élément qui le compose.

##### Suppression ($O(1)$/$O(n)$)

La suppression d'un élément peut être rapide si l'ordre n'a pas d'importance. Il suffit de déplacer le dernier élément contenu dans le tableau pour combler le trou laissé. 

Dans le cas où l'ordre aurait de l'importance (ex: arrivée de patients dans la salle d'attente), il faudra décaler tout le tableau.

#### 2.1.2 Tableaux à une dimension trié

Le tableau est ordonné suivant une relation d'ordre

##### Insertion ($O(?)$)

Pour ajouter de nouvelles données, il faudra décaler tout le tableau d'une unité pour y mettre le nouvel élément.

##### Trouver un élément ($O(?)$)

Trouver un élément dans le tableau est bien plus rapide car on peut utiliser cette relation pour rechercher plus rapidement. (ex : tri dichotomique)

##### Suppression ($O(n)$)

La suppression nécessite de déplacer tout le tableau à partir du point ou il à été supprimé

#### 2.1.3 Tableaux à 2 dimensions

Les tableaux multidimensionnels sont des tableaux contenant des tableaux. On peut donc accéder aux données par le biais d'un double index ( premier et second tableau).

### 2.2 Algorithmes de recherche

#### 2.2.1 Tableaux non-trié

Complexité temporelle : $O(n)$ 

```
 o───────────────────────────────────o ↓ valeurs, nb
 │ rechercher dans tableau non trié │
 o───────────────────────────────────o
┌─── *
│ obtenir cléLue
│ o───────────────o ↓ valeurs, nb, cléLue
│ │ indRecherché │
│ o───────────────o ↓ iValeur
│┌── if( iValeur == nb )
││ sortir "clé inexistante"
│├── else
││ sortir "clé trouvée dans la cellule d'indice ", iValeur
│└──
└──────────


o───────────────o ↓ valeurs, nb, cléLue
│ indRecherché │
o───────────────o ↓ iValeur
┌─── *
│ iValeur = 0
│╔══ do while (iValeur < nb and valeurs[iValeur].clé ≠ cléLue)
│║ iValeur ++
│╙──
└──────────
```



#### 2.2.2 Recherche séquentielle dans un tableau trié

Complexité temporelle ($O(n)$)

```
o───────────────────────────────o ↓ valeurs, nb
│ rechercher dans tableau trié │
o───────────────────────────────o
┌─── *
│ obtenir cléLue
│ o──────────────o ↓ valeurs, nb, cléLue
│ │ indRecherché │
│ o──────────────o ↓ iValeur
│┌── if( iValeur == nb or cléLue ≠ valeurs[iValeur].clé )
││ sortir "clé inexistante"
│├── else
││ sortir "clé trouvée dans la cellule d'indice ", iValeur
│└──
└──────────
o───────────────o ↓ valeurs, nb, cléLue
│ indRecherché │
o───────────────o ↓ iValeur
┌─── *
│ iValeur = 0
│╔══ do while (iValeur < nb and valeurs[iValeur].clé < cléLue)
│║ iValeur ++
│╙──
└──────────
```



#### 2.2.3 Recherche dichotomique dans un tableau trié

Complexité temporelle : $O(log(n))$

```
o────────────────────────o ↓ valeurs, nb
│ recherche dichotomique │
o────────────────────────o
┌─── *
│ obtenir cléLue
│ bInf = 0
│ bSup = nb - 1
│
│ iMilieu= [(bInf + bSup) /2]ENT
│
│╔══ do while (bInf ≤ bSup and valeurs[iMilieu].clé ≠ cléLue)
│║
│║┌── if ( cléLue < valeurs[iMilieu].clé ))
│║│ bSup = iMilieu - 1
│║├── else
│║│ bInf = iMilieu + 1
│║└──
│║ iMilieu= [(bInf + bSup) /2]ENT
│║
│╙──
│┌── if( bInf > bSup )
││ sortir "clé inexistante"
│├── else
││ sortir "clé trouvée dans la cellule d'indice ", iMilieu
│└──
└──────────

```



### 2.3 Bloc Logique 

Un bloc logique est un regroupement de cellules dans un tableau partageant les mêmes caractéristiques (ex: regroupement de lieux par ville, puis par quartiers). 

```
o───────────────────────────────o ↓ hôtels, nbHôtels
│ Afficher statistiques Hôtels │
o───────────────────────────────o
┌─── *
│ // Initialisation générale
│ nbMinHôtelsCatégorie = HV
│ iHôtel = 0
│
│╔══ do while ( iHôtel < nbHôtels )
│║
│║ // Initialisation catégorie
│║ catégorieEnCours = hôtels[iHôtel].catégorie
│║ sortir catégorieEnCours
│║ nbHôtelsCatégorie = 0
│║ nbMaxHotelsVille = 0
│║
│║╔══ do while ( iHôtel < nbHôtels and
│║║ catégorieEnCours == hôtels [iHôtel].catégorie )
│║║
│║║ // Initialisation ville
│║║ villeEnCours = hôtels [iHôtel].ville
│║║ sortir villeEnCours
│║║ nbHôtelsVille = 0
│║║
│║║╔══ do while ( iHôtel < nbHôtels and
│║║║ catégorieEnCours == hôtels [iHôtel].catégorie and
│║║║ villeEnCours == hôtels [iHôtel].ville )
│║║║
│║║║ // Traitement hôtel
│║║║ nbHôtelsVille ++
│║║║ iHôtel ++
│║║╙──
│║║ // Clôture ville
│║║ sortir nbHôtelsVille
│║║ nbHôtelsCatégorie += nbHôtelsVille
│║║┌── if (nbHôtelsVille > nbMaxHotelsVille )
│║║│ nbMaxHotelsVille = nbHôtelsVille
│║║│ nomMaxVille = villeEnCours
│║║└──
│║╙──
│║ // Clôture catégorie
│║┌── if (nbHôtelsCatégorie < nbMinHôtelsCatégorie )
│║│ nbMinHôtelsCatégorie = nbHôtelsCatégorie
│║│ categMin = catégorieEnCours
│║└──
│║ sortir nomMaxVille
│╙──
│ // clôture générale
│ sortir categMin
└──────────
```



## 3. Listes chainées

Une **liste** est une structure de donnée homogène constituée d'éléments ordonnées linéairement et chainées entre eux.

Un **chainon** contient **de l'information** et **un pointeur** vers élément suivant dans la liste ( ou NULL si il n'y en a pas).

La gestion de la mémoire de la liste chainée est gérée de manière dynamique et sans déplacement des chainons.

La *liste chainée* peut aussi être **circulaire** alors le dernier élément pointe vers le premier.

Il existe aussi des **listes doublement chainées** qui ont un pointeur vers l'élément suivant et l'élément précédent.

### 3.1 Algorithmes 

#### 3.1.1 Recherche dans une liste simple non triée

```
o─────────────────────────────────o ↓ pDébut
│ rechercher dans liste non triée │
o─────────────────────────────────o
┌─── *
│ obtenir donnéeLue
│
│ o────────────o ↓ pDébut, donnéeLue
│ │ pRecherché │
│ o────────────o ↓ p
│
│┌── if (p == NULL)
││ sortir " Donnée absente de la liste "
│├── else
││ sortir " Donnée trouvée : ", p → donnée
│└──
└──────────
o────────────o ↓ pDébut, donnéeRecherchée
│ pRecherché │
o────────────o ↓ p
┌─── *
│ p = pDébut
│╔══ do while (p ≠ NULL and p → donnée ≠ donnéeRecherchée)
│║ p = p → pSuiv
│╙──
└──────────
```



#### 3.1.2 Recherche dans une liste simple triée

```
o──────────────────────────────o ↓ pDébut
│ rechercher dans liste triée │
o──────────────────────────────o
┌─── *
│ obtenir donnéeLue
│
│ o────────────o ↓ pDébut, donnéeLue
│ │ pRecherché │
│ o────────────o ↓ p
│
│┌── if (p == NULL or donnéeLue < p → donnée)
││ sortir " Donnée absente de la liste "
│├── else
││ sortir " Donnée trouvée : ", p → donnée
│└──
└──────────

o────────────o ↓ pDébut, donnéeRecherchée
│ pRecherché │
o────────────o ↓ p
┌─── *
│ p = pDébut
│╔══ do while (p ≠ NULL and p → donnée < donnéeRecherchée)
│║ p = p → pSuiv
│╙──
└──────────
```



#### 3.1.3 Insertion d'un nouveau chainon dans une liste simple

##### insertion en début de liste

```
o──────────────────────────o ↓ pDébut, donnéeLue
│ insertion début de liste │
o──────────────────────────o ↓ pDébut, message
┌─── *
│ pNouv = adresse mémoire nouveau chainon
│┌── if ( pNouv == NULL )
││ message = " Mémoire insuffisante "
│├── else
││ pNouv → donnée = donnéeLue
││ pNouv→ pSuiv = pDébut
││ pDébut = pNouv
││ message = " Ajout effectué "
│└──
└──────────
```



##### Insertion en fin de liste

```
o──────────────────────────o ↓ pDébut, donnéeLue,
│ insertion fin de liste │
o──────────────────────────o ↓ pDébut, message
┌─── *
│ pNouv = adresse mémoire nouveau chainon
│┌── if ( pNouv == NULL )
││ message = " Mémoire insuffisante "
│├── else
││ p = pDébut
││╔══ do while (p ≠ NULL)
││║ pPrécédent = p
││║ p = p → pSuiv
││╙──
││ pNouv → donnée = donnéeLue
││
││┌── if (pDébut == NULL)
│││ pDébut = pNouv
││├── else
│││ pPrécédent → pSuiv = pNouv
││└──
││ pNouv→ pSuiv = NULL
│└──
│ message = " Ajout effectué "
└──────────
```



##### Insertion dans une liste triée 

```
o──────────────────────────────────o ↓ pDébut, donnéeLue
│ insertion dans une liste triée │
o──────────────────────────────────o ↓ pDébut, message
┌─── *
│ pNouv = adresse mémoire nouveau chainon
│┌── if (pNouv == NULL)
││ message = "mémoire insuffisante"
│├── else
││ p = pDébut
││╔══ do while (p ≠ NULL and donnéeLue > p → donnée)
││║ pPrécédent = p 
││║ p = p → pSuiv
││╙──
││ pNouv → donnée = donnéeLue
││
││┌── if (p == pDébut) // ajout début de liste ou liste vide
│││ pNouv→ pSuiv = pDébut
│││ pDébut = pNouv
│││
││├── else
│││┌── if (p == NULL) // ajout en fin de liste
││││ pPrécédent → pSuiv = pNouv
││││ pNouv → pSuiv = NULL
││││
│││├── else // ajout milieu de liste
││││ pPrécédent → pSuiv = pNouv
││││ pNouv → pSuiv = p
│││└──
││└──
││ message = « Ajout effectué »
│└──
└──────────
```

#### 3.1.4 Suppression d'un chainon dans une liste simple

```
o─────────────o ↓ donnéeRecherchée, pDébut
│ suppression │
o─────────────o ↓ pDébut, message
┌─── *
│
│ p = pDébut
│╔══ do while (p ≠ NULL and donnéeRecherchée> p → donnée)
│║ pPrécédent = p 
│║ p = p → pSuiv
│╙──
│
│
│┌── if (p == NULL or donnéeRecherchée < p → donnée)
││
││ message = " Erreur: donnée inexistante "
││
│├── else
││
││┌── if (p == pDébut) // suppression du premier chainon
│││ pDébut = pDébut → pSuiv
││├── else
│││ pPrécédent → pSuiv = p → pSuiv
││└──
││ message = " Suppression effectuée "
│└──
│ libérer la mémoire pointée par p
└──────────
```



### 3.2  Comparaison entre un tableau et une liste

|          |                          Avantages                           |                        Inconvénients                         |
| -------- | :----------------------------------------------------------: | :----------------------------------------------------------: |
| Listes   | **grand nombre d'opérations** (ajout, supp.) et **allocation dynamique** de mémoire | un accès nécessite de **parcourir tous les chainons** et **plus espace** utilisé (pointeurs) |
| Tableaux | **accès direct** avec l'indice et **allocation mémoire plus faible** | (ajout, supp.) **nécessite décalage** et **allocation statique** |



## 4. Les Piles et les Files

Les **piles** et les **files** sont des structures de données dont les éléments sont ordonnés linéairement