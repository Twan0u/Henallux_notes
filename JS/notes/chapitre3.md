## Chapitre 3 : les Boucles et Conditions

### Boucles
#### for

```javascript
for (let i = 0 ; i < tab.length; i++){ 
  console.log(tab[i]); 
}
```

#### for in

Semblable à la boucle for simple mais **saute automatiquement les éléments vides**.

Ici, i représente les indices du tableau
```javascript
for (let i in tab) console.log(tab[i]);
```

#### for of
Comme pour for in, cette boucle est semblable à for mais **val prends ici les valeurs dans le tableau** (y compris les vides qui sont considérés comme ***undefined***)
```javascript
for (let val of tab) { console.log(val); }
```

### Condition
#### if

``` javascript
if(COND){}
else if{}
else{}
```

> Clean Code: Si l'on veut tester que la variable test est vraie on ne test pas (variable == true) mais (variable)
> Dans le cas de la négation, on ne test pas (cond != true) mais (!cond)

### Opérateur Ternaire 

```javascript
(CONDITION ? TRUE : FALSE)
```

``` javascript
nbElem+ " élément" + (nbElem> 1 ? "s" : "")
```
