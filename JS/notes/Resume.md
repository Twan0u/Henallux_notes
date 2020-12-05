# JavaScript (How To)

[TOC]

## Bases

### Initialisation de l'examen

Voici le code de  base d'une page HTML

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Page Simple</title>
    <linkhref="style.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
  	Cette page est une page toute simple
  	<script src="monCode.js"></script>
  </body>
</html>
```

### Clean Code

#### HTML

* Balises et attributs écrits en minuscules
* Valeurs des attributs entre guillemets (sauf booleens)
* Indentation correcte (on évite les multiples espaces)
* Respect de la syntaxe

#### CSS

* Tout écrit en Majuscule 
* Bien Différencier identificateur et classe
* Bien choisir noms de classe
* Respect de la syntaxe

#### JS

* le nom d'une variable est sensible à la case.

## Le JS 

Le langage Javascript est un langage faiblement voire non typé interprété (typé dynamiquement) orienté objet impératif. Il est généralement exécuté du côté client. Il est synchrone mais peut être exécuté de manière asynchrone par le biais d'événements. Les fonctions sont, en javascript des objets du premier ordre. 

### Types

 ***number***, ***String***, ***boolean***, ***undefined***. Il existe aussi ***function*** et ***object***. 

#### Nombres

```javascript
typeof(maVariable);
isFinite(x); // retrourne true si le nombre x est un numéro standard
isNan(x); // retourne true si x est un NaN
```

#### String

Un string peut s'écrire entouré de " ou de '. les ' sont evalués (ex : '${variable}')

Les caractères échappées en JS sont : *\n \t \\' \\" \\\\.*

Quand on veut : un texte sur plusieurs lignes ou contenant des expressions à évaluer on peut utiliser les apostrophes inverses. (ES6)

```javascript
let string = `je suis ${nom} et dans un an, j'aurais ${age+1}`
```

##### Opérations sur les Strings

* **Concaténation**: str + str
* **Longueur**: str.length
* **Extraction**: str[numLettre] ou str.charAt(numLettre)
* **Test**: str.startWith(str)
* **Test**: str.endsWith(str)
* **Test**: str.includes(str)
* **Extraction**: str.substring(début,longueur)
* **Extraction**: str.substring(debut,fin)
* **Recherche**: str.indexOf(str)
* **Recherche**: str.lastIndexOf(str)
* **Décomposition**: str.split(séparateur)

#### Boolean

##### Les valeurs Falsy

Les valeurs dites falsy sont des valeurs qui une fois converties en Booléen donneront false. 

* false

* undefined

* null

* 0

* NaN

* ""

> attention "False" n'est pas falsy car une chaine de caractère qui n'est pas null est considérée comme true lors d'une évaluation Booléenne 

#### Date 

```javascript
let maintenant = new Date();
let minutes = maintenant.getMinutes();
let heures = maintenant.getHours();
```

### Déclarations de variables

> Contrairement à d'autres langages de programmation, les variables déclarées dans la fonction parent sont aussi disponibles dans la fonction enfant imbriquée dans la première.

**UTILISER LET** car pas de hoisting(=hissage en fr) (remontée automatiquement de la déclaration)

```javascript
let NOM_VARIABLE = 1234;
let maFonction = function(x,y){ return x+y };
let monNom = "Antoine";
```

