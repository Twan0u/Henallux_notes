## chapitre 1 : Les variables
le nom d'une variable est sensible à la case.

### typeof(var)
typeof(v) retourne le type de la variable placé en paramètre

* number
* undefined
* function
* string 
* object 

### Types primitifs 

Il existe 4 types primitifs en Javascript : *number*, *String*, *boolean*, *undefined*. Ces 4 types fonctionnent par référence

### Let

``` javascript
let NOM_VARIABLE = 1234;
let maFonction = function(x,y){ return x+y };
let monNom = "Antoine";
```

### Var
Les variables déclarées avec var sont valables dans le scope de la fonctoin et sont déclarées (mais pas initialisées) au début de la fonction.

> En Pratique, on va éviter de les utiliser car ses particularités

### const
constante locale au scope du bloc.


### Strings

Un string peut s'écrire entouré de "" ou de ''.

#### Apostrophe inverse
Quand on veut : un texte sur plusieurs lignes ou contenant des expressions à évaluer

``` javascript
let string = `je suis ${nom} et j'ai ${age}`
```

#### Opérations sur les Strings

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

### Date

``` javascript
    let maintenant = new Date();
    let minutes = maintenant.getMinutes();
    let heures = maintenant.getHours();
```

### Le hissage (= hoisting)

En javascript, les définitions des fonctions et des variables déclarées avec var sont hissées au début. Attention, car seul la déclaration est hissée et non l'initialisation

### Nombres

* o.... : octal
* ox... : hexa
* 0o... : octal [ES6]
* 0b... : binaire

### conversion
``` javascript
Number(x)
String(x)
Boolean(x)
parseFloat(x)
```

En fonction de x, il se pourrait que la conversion soit impossible.

* NaN : si ce n'est pas un nombre
* Infinity: 5/0
* -Infinity: -5/0



