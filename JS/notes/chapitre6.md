## Chapitre 6: Objets

En Javascript, les objets sont des tableaux associatifs (voir chapitre 5).

L'orienté objet en javascript ne fonctionne pas sous la forme de classe/instance mais sur un modèle basé sur des prototypes. 
On peut ajouter, supprimer, modifier les attributs et méthodes à la volée.

``` javascript
let personne = {};
personne["attr"] = 12 // equivalent a personne.attr = 12
```
> On peut utiliser comme attribut n'importe quel mot (même les mots réservés), même plusueurs mots ou encore des nombres. attention cependant à ne pas mettre de point.

### Les sucres syntaxiques
Un sucre syntaxique est une simplification du code pour la rendre plus facile à écrire et à comprendre par un Humain

code Original : 

``` javascript
let h = { 
    "nom" : "bob", 
    "age" : 42
    "toString" : function (){...}
};


```

peut s'écrire sous la forme : 

``` javascript
let h = {
    nom:"bob",
    age:42,
    toString(){...}
};
```