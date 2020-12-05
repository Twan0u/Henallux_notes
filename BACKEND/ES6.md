# ES6 

## Déclaration de fonctions anonymes

```javascript
var maFonctionAnonyme = function(x,y){
	return x*y;
}

let maNouvelleFonctionAnonyme = (x,y)=>x*y;// pas de return si il n'y a qu'une expression mais c'est mieux de le mettre
```

## Classes

Introduction du concept de classes 

```javascript
class Animal{
	Constructor(nom,...){
		this.nom = nom;
	}
}
class Cat extends Animal ....
```



## Paramètre par default 

```javascript
function myFunction(x,y=10); //y sera égal à 10 si le paramètre y n'est pas passé ou vaut undefined
```



## Les Array

### Trouver dans un array 

```javascript
let monArray = [0,10,20,30];
let maFonction = (value,index,array)=>{return value>18;}

let monNombre = monArray.find(maFonction);//retourne le premier élément suppérieur à 18
let monIndex = monArray.findIndex(maFonction);//retourne l'index du premier élément suppérieur à 18

monArray.push(69); // ajoute un nouveau nombre à la fin de l'array
```



## Valeurs 

```javascript
Number.EPSILON
Number.MIN_SAFE_INTEGER
Number.MAX_SAFE_INTEGER

Number.isInteger(monNombre);
Number.isSafeInteger(monNombre);

isFinite(..);//null,infinity,nan
isNaN(..);

let x=5
x= x**2 // comme x^2
```



## Callback

Les callbacks sont des fonctions placés en argument d'une autre fonction, généralement utilisées pour être appelées à la fin de la première fonction. Les callbacks sont particulièrement utiles dans le cadre de fonctions asynchrones.

```javascript
setTimeout(function() { myFunction("I love You !!!"); }, 3000);
```



## Promesses

Les promesses sont utilisées pour éviter un nombre important de callbacks. 

```javascript
promise.all(); // attends la réalisation de plusieurs fonctions

const maPromesse = new Promise ((myResolve, myReject) {
// "Producing Code" (May take some time)

  myResolve(); // when successful 	//callback auto crée et auto appelé
  myReject();  // when error		//callback auto crée et auto appelé
});

maPromesse.state// undefined, result, error object pour respectivement pending, fulfilled et rejected

// "Consuming Code" (Must wait for a fulfilled Promise)
myPromesse.then(
  function(value) { /* code if successful */ },
  function(error) { /* code if some error */ }
);

const mypromises = [promise1,promise2];
Promise.all(mypromises).then(values=>{...})

maPromesse.then(()=>console.log("ok"));
maPromesse.catch(err=>console.log(err));
maPromesse.finally(()=>console.log("qq chose"));//toujours exécuté (utile pour fermer des bd ou des fichiers par exemple)
```

> https://www.w3schools.com/js/js_promise.asp



## Async / wait

fonction dont la valeur de retour est englobée (implicitement) dans une promesse.

```javascript
async function maFonction(){
    const promise = new Promise (...);
    const mavariable = await promise; 
    return mavariable;
}
maFonction(.then(value=>{console.log(value);})).catch(err=>{...});
                                                            
// EXEMPLE
                                                            
async function maFonction(){
    const promise = new Promise (resolve=>{setTimeout(()=>{resolve("finish");},5000);});
    const mavariable = await promise; 
    console.log(mavariable);
}

                                                           
```



## Chainage optionel

évite les ifs pour vérifier qu'une variable ne soit définie.  Retourne undefined à la place d'une erreur 

```javascript
monObjet?.saValeur; // retourne undefined à la place d'une erreur dans le cas ou l'objet n'existe pas
```



## Opérateur de coalescence des nuls

```
monObjet.age??42 // retourne 42 si undefined
```

