## chapitre 4 : Les fonctions


En javascript les fonctions peuvent être placées en arguments d'autres fonctions. Si on redéfinit 2 fois la même fonction, seul la 2e sera conservée. 

> attention aussi à l'hoistage et à l'utilisation de var

### Fonction de base

``` javascript
    function myFunction(var1,var2){
        return var1 + var2;
    }
```

un code décrit sous la forme d'un objet fonction doit être évalué à chaque appel et est donc peu efficace (Clean Code : a éviter)

``` javascript
const maFonction = new function("var1","var2","return var1+var2;);
```

fonctions
``` javascript
let affiche = function osefNom (var,var){return var +var;}
```
Attention aux déclarations hoistées et donc non initialisées

### Arguments 

#### Surcharge et trop peu de paramètres

Si une fonction est appelée avec plus d'arguments que nécéssaire, ils seront ignorés ( surcharge )

à l'inverse, si il y en a trop peu, on les remplace par undefined.

#### Passage des arguments

Les types primitifs effectuent un passage par valeur. càd une copie de la valeur de la variable. tandis que les objets sont passées par référence et donc les originaux sont envoyés en paramètre.

### Return avec multiples arguments

``` javascipt
sommeProduit(x,y){
    let somme = x+y;
    let produit = x*y;
    return {somme,produit}
};//retourne un objet {somme:VAL,produit:VAL}
```