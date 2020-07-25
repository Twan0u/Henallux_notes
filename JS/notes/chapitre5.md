## chapitre 5: Les Tableaux

Les tableaux en JS sont Hétérogènes (différents types dans un même tableau) et dynamiques (taille évolutive). Ils peuvent aussi contenir des trous (undefined).

### Construction

#### Littéral
``` javascript
let tab = [1,2,3];
```

#### Constructeur

``` javascript
let tab = new Array(1,2,3); //[1,2,3]
let tab2 = new Array(3) = [,,,];
```

#### Tableau vide 

``` javascript
let tab = [];
let tab = new Array();
```

#### Tableau avec une taille x

``` javascript
let tab = new Array[x];
let tab = [,,,,,,]; // attention,il y aura autant d'éléments que de virgules dans ce tableau (tableau vide)
```

#### Ne pas confondre

```javascript
New Array("3"); // tableau contenant 3 : ["3"]
new Array(3); // tableau avec 3 trous
```



### Accéder à un élément

``` javascript
tab[indice];
```

Un accès en lecture hors borne donne ***undefined***. Tandis que un accès en écriture hors borne écris dans le tableau et modifie sa taille.

Il n'est cependant pas possible d'écrire dans un tableau sans l'avoir déclaré au préalable.

### Verifier existence élément

```
INDICE in tab //true ou false
```
> Un tableau contenant des *undefined* n'est pas un tableau vide

### taille d'un tableau

``` javascript
tab.length
tab["length"]
tab.length = 23 // change la taille du tableau
```

> diminuer la taille du tableau engendre la perte des valeurs stockées et l'augmenter génère des trous à la fin

Il est important de noter qu'un trou est différent de undefined

### Tableau associatifs

``` javascript
tab["clé"] = valeur
```

