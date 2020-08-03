# Namespaces

[TOC]

On peut utiliser les namespaces pour éviter les conflits de noms. 

Il existe 2 syntaxes : 

La première syntaxe porte sur tout le fichier

```php
namespace NOM_NAMESPACE;
	// code
```

La seconde porte sur le bloc (un fichier peut en contenir plusieurs)

```php
namespace NOM_NAMESAPACE{
	//code
}
```

## Structure de l'espace de noms

* espace global : 

  * ```php
    namespace{ // code }
    ```

* sous-espace

  * ```php
    namespace espaceA{ // code }		
    ```

  * ```php
    namespace espaceA\sousEspace1 { // code }
    ```

## Résolution de noms

### Nom non qualifié

1. On recherche dans l'espace de noms courant 
2. S'il ne s'y trouve pas, on va voir dans l'espace de noms global

### nom complètement qualifié

```php
$a = new \espace\MonObjet();
```

### Nom Qualifié

```php
$a = sousEspace1\MonObjet();
```

## Alias 

```php
use \espace1\MonObjet as MonObjet;
```
