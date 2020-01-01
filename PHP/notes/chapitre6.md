# Les Objets en php

[TOC]

## Constructeurs

Les constructeurs sont des fonctions qui vont se charger de créer des objets. Il existe 2 syntaxes, une ancienne et une nouvelle (utilisant les fonctions magiques).

Il est important de noter que la syntaxe flèche vu ci-dessous s'effectue sans $ devant le nom de l'attribut

### Ancienne syntaxe

```php
class Etudiant{
    function Etudiant($nom,$age){
        this->nom = $nom;
        this->age = $age;
    }
}
```

### Nouvelle syntaxe (fonction magique __construct)

```php
class Etudiant{
	public $nom,$age;
    function __construct($nom,$age){
        this->nom = $nom;
        this->age = $age;
    }
}
```

> attention, il y a **2** Under score devant une fonction magique

## Instancier l'objet

```php
$antoine = new Etudiant("antoine",18);
```

## modifier / accéder à une propriété 

```php
$antoine->age = 22;
```

## Auto load de classes

Il peut être intéressant de séparer les classes dans des fichiers qui leurs sont propres.  (le fichier : maClasse.class.php  pour maClasse). Et pour éviter à chaque page de charger toutes les classes, on peut faire appel à un autoloader. Une fonction qui va automatiquement charger les classes inconnues qu'il rencontre. 

```php
function __autoload($classe){
	require_once "classes/$classe.class.php";
}
```

Cette fonction est extrêmement pratique pour garder le code clean mais **Attention** car les classes doivent **impérativement** se trouver dans un fichier classes et se nommer de la façon suivante *NOMDECLASSE.class.php*

## Propriétés

### Visibilité 

Les propriétés ont 3 modes de visibilité ( comme en Java ) : 

* Public (défaut)
* Protected : accès uniquement par la classe et ses sous classes
* Private : accès uniquement par la classe



## Destruction d'un objet

Un objet est détruit si on supprime toute référence vers lui.

> supprimer la référence d'un objet via unset($monObjet);

### Fonction magique __destruct

La fonction magique __destruct() est automatiquement appelée juste avant la destruction d'un objet.