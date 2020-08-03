## Conditions

[TOC]

> Écriture alternative : remplace les accolades par des deux-points et endif/endswitch/endfor/endwhile/endforeach : 
>
> Il n'est pas conseillé d'utiliser cette forme

```php
if($val): 
CODE 
endif;
```

### Opérateurs de comparaison

<  >  <=  >=  ==  !=ou<>  \===  !===

> \=== et \!=== testent l'égalité sans conversion implicite

### if 

``` php
<?php
if () {} 
elseif () {} 
else {}
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

> Attention à ne pas oublier les break pour éviter que le programme ne continue à testes toutes les autres cas

### Opérateur ternaire

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

```php
do{
    // ...
}while($CONDITION);
```

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

