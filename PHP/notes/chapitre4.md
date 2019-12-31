## Les fonctions

[TOC]

Pas de vérification de type mais (contrairement à Javascript,) il faut passer **au moins** le nombre d'arguments de la définition!

> les noms de fonction ne sont pas sensibles à la case mais respectez le cleanCode

Le php lit les définition de fonctions situées au niveau globale avant de débuter l'exécution. ce qui permets donc d'utiliser des fonctions définies plus bas.

Lorsque php rencontre une nouvelle définition de fonction, celle-ci est définie au niveau global

```php
functionf () {
	functiong() { echo'fonction g'; }
	echo'fonction f';
}
g();		// produit une erreur : g pas définie
f();
g();		// fonctionne correctement
```

### appel de la fonction

``` php
nom_de_fonction($param1, $param2);
```

### Creer une fonction std

```php
function nom ($var[,$var]){
return expr ;
}
```

### Créer une fonction anonyme

```php
$double = function ($x) {return $x*2}
```

### Redéfinition et surcharge 

**ATTENTION** : **PAS DE REDEFINITION** sinon erreur fatale

### Cas particuliers

#### Valeurs par défaut

Les valeurs dont les arguments ont des valeurs par défaut doivent êtres placées en **bout de liste** des arguments. 

#### Passage par référence 

Les objets sont automatiquement passés par référence. Pour les autres types, il faut utiliser la notation &

#### Renvoyer plusieurs valeurs

On utilisera un tableau 

```php
function test(){
return array($somme,$produit); // mets les variables dans un tableau
}
list($somme,$produit) = test(); //décompose le tableau 
```

#### Fonctions a nombre d'arguments variables

au sein d'une fonction : 

* func_num_args() : nombre d'arguments transmis à la fonction
* func_get_arg(i) : le ieargument (en comptant à partir de 0)
* func_get_args: tous les arguments (tableau)

#### Le mot clé static

Si il est utilisé à l'intérieur d'une fonction, la variable déclarée ne sera initialisée que la première fois 

```php
static $nbModif = 0;
```



## Les Fonctions Magiques

Le php possède des fonctions dites 'magiques', ces fonctions sont des raccourcis  qui facilitent l'écriture. Il en existe dans le cadre de la création d'objet, leur destruction, et bien d'autres. en voici quelques une qui pourraient être utiles : 

* *__toString*() : Affiche un objet (appelé automatiquement lors d'une utilisation comme **string** (ex : concaténation ou echo)) 
* *__invoke($arg)* : L'objet comme fonction. Il est appelé automatiquement si on utilise l'objet comme une **fonction.** 
* *__set($nomProp,$valeur)* : Appel automatique si crée une propriété inexistante / inaccessible à un objet
* *__get($nom)* : Appel auto quand on essaye de lire une propriété inaccessible d'un objet 
* *__unset($propriete)* : Appel auto lors de la suppression d'une propriété d'un objet.

> les Fonctions magiques sont reconnaissables  avec leur _ _ devant le nom de fonctions



