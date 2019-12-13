## chapitre 5: Les Tableaux

Les tableaux en JS sont Hétérogènes (différents types dans un même tableau) et dynamiques (taille évolutive). Ils peuvent aussi conentir des trous (undefined).

La lecture hors borne d'un tableau donne undefined, 

### Construction

#### Littéral
``` javascript
let tab = [1,2,3];
```

#### Constructeur

``` javascript
let tab = new Array(1,2,3);
```

#### Tableau vide 

``` javascript
let tab = [];
let tab = new Array();
```

#### Tableau avec une taille x

``` javascript
let tab = new Array[x];
let tab = [,,,,,,];
```

### Accéder à un élément

``` javascript
tab[indice]
```

### taille d'un tableau

``` javascript
tab.length
tab["length"]
tab.length = 23 // change la taille du tableau
```

> diminuer la taille du tableau engendre la perte des valeurs stockées

### Tableau associatifs

``` javascript
    tab["clé"] = valeur
```

