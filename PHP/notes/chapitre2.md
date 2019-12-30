## Les tableaux 

En php, tous les tableaux sont des tableaux associatifs (clefs/ valeurs).
Attention aux conversions automatique des types de clefs ( reels -> entier, booleen -> 0/1, null-> "",tableaux ou objets -> erreur)

> Contrairement au JS, les tableaux utilisent un fonctionnement par passage par valeur ( pas par référence)

``` php
$notes = [10,20];
$notes = array(10,20); //(vieille notation)
echo $notes[0]; // retourne 10
echo $notes{0}; // retourne 10

$notes[] = 7 //ajoute 7 à la fin du tableau 
```

### clés / valeurs

``` php
$eleve = [
	'nom'  => 'Doe',
 	'prenom' => 'Marc'];
echo $eleve['nom'];
```

> en cas d'ajout à la fin du tableau sans index car clés/valeurs : on  crée l'indice 0

### Tableaux multidimensionnels

```php
$matrice = array(
	array(1, 0, 0, 0),
	array(0, 1, 0, 0),
	array(0, 0, 1, 0),
	array(0, 0, 0, 1)
);

$matrice[2][2];
```

###List

```php
$tab = array(4,7,9,10);
list($a,$b) = $tab; // met 4 dans $a et 7 dans $b
```

