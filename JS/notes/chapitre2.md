## Chaptre 2 : Fonctions utiles

### Affichage dans la console

``` javascript
console.log(message);
```

### Pop-up
#### Message

``` javascript
alert(message);
```

#### Confirmation

Retourne un booleen (true ou false)

``` javascript
let entreeUtilisateur = confirm(message);
```

#### Entrée de l'utilisateur

(Attention) Retourne un string qu'il faut caster.

``` javascript
let entreeUtilisateur = prompt("message",VALEUR_DéFAUT);
```

### DOM

On peut écrire directement du code HTML sous la forme d'un string que l'on ajoutera à la page. Cependant il n'est pas très efficient et ne sera pas utilisé dans la suite du cours

``` javascript
document.write ("code HTML");
```

### Exécution d'une fonction si elle existe

exécutera la fonction init si elle existe

``` html
init && init();
```



## Exécution de code placé sous la forme d'une chaîne de caractère

```
eval("code JS");
```

Ceci n'est pas clean code

L'exécution est lente et peu optimale