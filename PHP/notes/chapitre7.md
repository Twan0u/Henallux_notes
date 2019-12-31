# Héritage

Comme en Java, il n'y a **pas d'héritage multiple** en php. 

```php
class chien extends Animal{
    function affiche(){
        parent::affiche(); //référence vers la classe mère (statique ou non)
    }
}
```

## final 

Une **fonction** déclarée dans le parent comme final ne pourra **pas être redéfinie** par les classes filles. Dans le même ordre d'idée une **classe** définie comme finale ne pourra **pas** avoir **de filles**.

### final static

(ou constantes propres )

```php
const MAX_AGE = 99;
```



## Accès à une propriété statique

```php
class Etudiant{
    static $nom;
    function hello(){
		echo "hello" . self::$nom;
    }
}
```

On utilisera à l'extérieur/intérieure de la classe :

```php
Etudiant::$nom;
```

mais on peut aussi utiliser à intérieur de la classe : 

```php
self::$nom;
```

> this->nom ne fonctionne pas et les méthodes statiques vont générer un warning 