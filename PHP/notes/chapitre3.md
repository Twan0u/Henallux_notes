## Conditions

> Écriture alternative : remplace les accolades par des deux-points et endif/endswitch/endfor/endwhile/endforeach : 

```php
if($val): 
CODE 
endif;
```

### Opérateurs de comparaison

<  >  <=  >=  ==  !=ou<>  ===  !===

> === et !=== testent l'égalité sans conversion implicite

### if 

``` php
<?php
if ($a > $b) {
    echo "a est plus grand que b";
} elseif ($a == $b) {
    echo "a est égal à b";
} else {
    echo "a est plus petit que b";
}
?>
```

### switch

``` php
switch ($i) {
    case 0: 
        echo "i égal 0";
        break;
    case 1:
        echo "i égal 1";
        break;
    case 2:
        echo "i égal 2";
        break;
  default:
}
```

### ternaire

```php
$val = <condition>?true:false;
```

## Les boucles

>Les break et continue existent 

### While

```php
$i = 1;
while ($i <= 10) {
    echo $i = $i + 1;
}
```

> do while existe aussi

### for

```php
for ($i = 1; $i <= 10; $i++) {
    echo $i;
}
```

### foreach

```php
foreach ($tableau as $valeur){
    // du code
}
foreach ($tableau as $clef => $valeur){

    // du code ou pour chaque élément on peut récupérer la clé et la valeur 
}
```

