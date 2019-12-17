## Chapitre 6: Objets

En Javascript, les objets sont des tableaux associatifs (voir chapitre 5).

L'orienté objet en javascript ne fonctionne pas sous la forme de classe/instance mais sur un modèle basé sur des prototypes. 
On peut ajouter, supprimer, modifier les attributs et méthodes à la volée.

``` javascript
let personne = {};
personne["attr"] = 12 // equivalent a personne.attr = 12
```
> On peut utiliser comme attribut n'importe quel mot (même les mots réservés), même plusueurs mots ou encore des nombres. 
> attention cependant à ne pas mettre de point.

### Les sucres syntaxiques
Un sucre syntaxique est une simplification du code pour la rendre plus facile à écrire et à comprendre par un Humain

### Créer des objets
Il existe 2 façons de créer des objets en Javascript : 
#### Débuter d'un objet vide puis de lui ajouter des éléments
#### Créer un objet qui possède déjà des propriétés (avec un littéral)
code Original : 

``` javascript
let h = { 
    "nom" : "bob", 
    "age" : 42
    "toString" : function (){...}
};

```
Qui peut s'écrire sous la forme : 
``` javascript
let h = {
    nom:"bob",
    age:42,
    toString(){...}
};
```

### Important
#### Tests d'égalité entre 2 objets 
un test d'égalité entre 2 objets correspond à un test d'égalité entre 2 références. 

#### utiliser in
Pour savoir si unobjet possède une propriété, on peut utiliser l'opérateur **in**

#### For-in et For-of

Les boucles for-in et for-of fonctionnent aussi : 

```
let msg= "";
for (let propin h)
    msg+= prop+ " -> " + h[prop] + "\n";
alert(msg);
```

### plus complexe 
les noms de proprités calculées
```
function infoArticle (nom, prixHtvaEU, veutDollars) {
    const tva = 0.21;
    const tauxEuDo = 1.12;
    const devise = veutDollars? "DO" : "EU";
    const prixHtva = prixHtvaEU * (veutDollars? tauxEuDo: 1);
    const prix = prixHtva * (1 + tva);
    return { nom, ["prix" + devise] : prix };
}
```

### Comparaison entre valeurs primitives et Objets
||Valeur Primitive|Objets|
|----|----|----|
|Catégories|nb,bool,str|fct,tab,autres OBJETS|
|Mutabilité|immuables|mutables(à priori)|
|Comparaison|par valeur|par ref|
|passage(argument)|par valeur|par ref|

