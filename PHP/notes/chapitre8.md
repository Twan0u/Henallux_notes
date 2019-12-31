# Classes Abstraites et Interfaces

[TOC]

## Classe Abstraite

```php
abstract class Animal{
	abstract function crie();
}
```

```php
class Chien extends Animal{
	// doit obligatoirement redéfinir les fonctions abstraites ou être elle même abstraite
}
```

## Interface

```php
interface IAnimal{
	function crie();
}
```

```php
class Chien implements IAnimal{
    //doit implémenter toutes les méthodes de son interface
}
```

