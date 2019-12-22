# PHP
## Introduction

Le php est un language de scripts orienté serveur. Il est utilisé pour générer dynamiquement des pages  web. Ces pages sont donc dynamiques ( <> pages statiques en html et css ). Cette personalisation s'effectue du côté serveur et les pages html générées seront ensuite envoyées au client.

Php signifie : (Php : a Hypertext Processor)
### Installation 

Pour travailler avec php, il faut un navigateur, un éditeur de texte et les programmes (php,apache(,mysql)).  
Il est conseillé d'utiliser wamp (Windows) / mamp (macOS)/ xampp (linux) afin d'installer tous ces programmes en même temps sans grand effort. 

### Architecture Triparite
L'architecture en trois partie ajoute une nouvelle dimension au client serveur(bipartite). Nous avons une architecture en 3 couches (MVC = Modele Vue Controller). 
* **Modele** : Base de donnée
* **Vue** : Navigateur
* **Controller** : Couche fonctionnelle de Traitement (serveur web)

###Architecture N_Tier 
Ce genre d'architecture ajoute un layer ( souvent business ) au tripartite. Mais il peut en ajouter plus 

## Base

Le code php s'écrit au milieu du html et au moyen de balises spécifiques.

> Il est important de noter que contrairement au javascript, il est impératif de finir les instructions php par ;

exmple : 

``` php
<html>
    <head></head>
    <body>
    <h1>Bienvenue !</h1>
        <p>Il est actuellement
            <?php
                $heure = date('H:i');
                echo $heure;
            ?>
        et tout va bien.</p>
    </body>
</html>
```

> les fichiers ne sont cependant plus des fichiers .html mais des .php


### ou placer le php 
#### directement dans le html
directement dans le document-type HTML, à l'endroitoù le résultat doit être placé :
```
<?php ...codephp...?>
```

#### dans un fichier ne contenant que du php 

<?php ... ?>
> la balise fermante n'est pas obligatoire mais conseillée
> aussi appelé module 
> Si un document HTML comporte des scripts PHP, il doit porter l'extension .php (pour signaler au serveur http qu'il doit être traité avant d'être envoyé).

### Méta
**Méta** est souvent utilisé dans le vocabulaire scientifique pour indiquer l’auto-référence (aussi appelée réflexion dans certains domaines informatiques) ou pour désigner un niveau d’abstraction supérieur, un modèle. Par exemple:
* *Métalangage*: système ou langage permettant de décrire des langages
* *Métalivre*: livre à propos d’un livre
* *Métadocumentation*: documentation sur la documentation
* *Métadonnée*: donnée à propos des données

### Sorties vers le document 

Dans l'exemple ci-dessus, on utilise echo, echo est une fonction qui peut être utilisée pour afficher du texte dans du code html. Ce texte peut contenir un des balises html. 

Il existe aussi : 

|expression|infos|
| --- | --- |
|echo(expr,expr,...)|parenthèses optionnelles|
|print(expr)|parenthèses optionnelles|
|printf(format [,args ]*)|(mêmes formats qu'en C)|
|sprintf(format [,args ]*)|(idem mais fournit un string)|
|var_export(expr)|(affiche au format PHP)|
|print_r(expr)|(affichage du contenu)|
|var_dump(expr)|(affiche le type et la valeur)|

### Requête

Quand un client effectue une requête d'un document écrit en PHP au serveur, celui-ci : 

* reçoit la demande
* récupère le fichier PHP
* exécute le PHP (*processeur PHP*)
* Le code php est ainsi remplacé par son résultat 
* le serveur web renvoie le fichier html complété via le web

Lorsqu'un client envoie une requête http via internet, cette requête contient des informations (url de la page désirée, ...). Ces informations peuvent être envoyées sous la forme d'une méthode Get (dans l'url) ou Post (si il s'agit d'envoyer les données d'un formulaire HTML).


> code html utile pour se rendre sur une autre Url : *location.href=nouvelleURL*

> pour exécuter un script js après le chargement de la page on utilise *window.onload*

### Différences avec le Javascript

Contrairement à Javascript, PHP peut
* créer, ouvrir, lire, écrire et fermer des fichiers sur le serveur 
* interagir avec une base de données 
* contrôler ce à quoi les utilisateurs ont accès (version utilisateur et version admin d'un forum par exemple) 

> ATTENTION, le php ne possède pas de mémoire. Chaque demande doit donc être traitée de manière indépendante.

## Les variables
Les variables commencent presque systématiquement par un dollar. (sauf constantes).

> le nom des variable est sensible à la case, mais pas celui des fonctions, classes et mots-cléfs

```
$nom = 'antoine';  
```

opération numérique 

```
echo (2+3)/2;
```
> PHP possède une valeur nan ( checker via is_nan($var))

>echo TRUE retourne 1 ET echo FALSE ne **produit rien**

> tentative de transformation de text en nombre ( généralement 0)

Il existe aussi une valeur NULL 

> isset($var) vrai si la variable existe et ne vaut pas null.
> empty($var) vrai si $v n'**existe pas** ou **vaut falsy**

### variables falsy
* FALSE 
* 0 
* ""
* "0"
* NULL
* []

> Attention, en javascript "0" est converti en true

## Le typage

En php, comme en javascript, le typage est implicite et les conversions sont implicites. Les différents types sont : boolean, integer,double, string, array, object, resource (ressources génériques au format binaire, NULL, et NAN

On peut tester si une variables appartient à un type via les fonctions is_...($var) ( ex : is_boolean(x))

On peut obtenir le type d'une variable avec gettype()


### Typecast

On peut forcer la conversion comme en java ou en c via un typecast 

|type|/|/|/|/|
|---|---|---|---|---|
|integer|(int)expr|(integer)expr|intval(expr)||
|double|(float)expr|(double)expr|(real)expr|floatval(expr)|
|string|(string)expr|strval(expr)|||
|boolean|(bool)expr|(boolean)expr|||
|array|array(expr)||||
|object|(object)expr||||

Pour la conversion vers des nombres entiers, 
* Si une variable est un réel on ne prends que sa partie entière   
* Si une variable et un string alors on ne prends que le préfixe valide le plus long 

On peut aussi utiliser :

``` 
settype($var, 'int');
```

> php est différencie les entiers et les réels

### Conversions implicites
exemples

```
echo '13' + '17 vaches'; 	// affiche 30 !
$txt1 = '12';
$txt2 = '+12';
$txt3 = '12pommes';
echo ($txt1 == $txt2); 	// affiche 1 (= vrai) !
echo ($txt1 === $txt2); 	// affiche <rien> (= faux) !
echo ($txt1 == $txt3); 	// affiche <rien> (= faux) !
echo (12 == $txt3); 	//affiche 1 (= vrai) !
```

## Strings 

1. chaine litteral ( ' ... ' -> non interpreté )
	* \' et \\ 
2. chaine non litteral ( "... " -> interpreté )
	* \" \\ \n \t \$
	* ou la notation octale ou hexa ( ex : \123 ou \xA5)
3.  here document ( écriture sur plusieurs lignes )(remplace les chaines)
	* [lien documentation](https://www.php.net/manual/fr/language.types.string.php#language.types.string.syntax.heredoc)
```	
 $msg = <<<EXTRAIT
Voici le texte "contenu" dans cette $chaîne
de caractères sans qu'il soit
nécessaire d'échapper les " et les '
EXTRAIT;
```

4. nowdoc ( comme heredoc sauf non interpreté)
	* [lien documentation](https://www.php.net/manual/fr/language.types.string.php#language.types.string.syntax.nowdoc)

```	
 $msg = <<<'EXTRAIT'
Voici le texte "contenu" dans cette $chaîne
de caractères sans qu'il soit
nécessaire d'échapper les " et les '
EXTRAIT;
```


### concaténation de strings

> Attention, en JS, la concaténation s'écrit + 

```
$prenom = 'antoine';
$nom = 'Lambert';

echo $prenom. '  '.$nom;
$user = $prenom;
$user .= ' '; // le .= est le signe de la concaténation 
$user .= $nom; 
```

> **\n** pour saut de ligne : 
> attention, les guillemets simples n’interprètent pas les variables et caractères spéciaux contrairement aux guillemets doubles.

> en cas de calcul a afficher : entourer les calculs de ()

### Longueur d'une chaîne de caractères
```
strlen($s)
```

## Définition de Constantes

```
define('MACONSTANTE', 'contenu de la constante');

echo MACONSTANTE // Les constantes s'utilisent sans $
```

> clean code  : les constantes sont définies en MAJUSCULES

### Remarques
* Une fois définie, une constante est visible partout. 
* Si on utiliseMACONSTANTEsans la définir d'abord, PHP suppose qu'elle contient la chaîne"MACONSTANTE".

```
 __LINE__ \\ numéro de la ligne courante dans le fichier   
 __FILE__ \\ fichier courant (__DIR__pour son répertoire)
```

|/|Constantes|Variables|
|---|---|---|
|Utilisation| Sans $| Avec $|
|Déclaration| via define| Lors de la première affectation|
|Visibilité|Partout|Locale ou globale|
|Valeur| Doit être Scalaire| Quelconque|
|Modification| Impossible|possible, ainsi qu'unset|

## Récupérer le type d'une variable 
```
 gettype($var)
```
> var_export qui donne une écriture de la
valeur correspondant à un littéral PHP
> var_dump donne  non seulement la
valeur mais également le type de celle-ci


## Adresses relatives ou absolues

En HTML et en PHP, les adresses peuvent êtres relatives ( ../inc/file.php : fichier contenu dans le dossier frère)

Par contre, les adresses absolues sont différentes en html et en php :  pour les adresses en html, le "/" représente la racine du projet web, tandis que en php, ce même "/" représente la racine du Système.

## Envoi par GET et POST 

**GET** est utilisé pour envoyer des données par l'url, tandis que **POST** se chargera des données d'un formulaire. 

En php, on récupère les données issues d'un **GET** en utilisant **$_GET**

exemple d'url 
```
commande.php?article=montre
```

exemple de code avec la méthode GET
```
<?php
if (isset($_GET) && isset($_GET['article']))
echo $_GET['article'];
else
echo 'aucune commande';
?>
```

> Pour rappel, la commande Javascript pour se rendre vers une autre url est
>  location.href=nouvelleURL; 

## Les tableaux 

``` php
$notes = [10,20];
$notes = array(10,20); //(vieille notation)
echo $notes[0]; // retourne 10

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

## Conditions

> Écriture alternative : remplace les accolades par des deux-points et endif/endswitch/endfor/endwhile/endforeach : 

```
if($val): 
CODE 
endif;
```

### Opérateurs de comparaison
<  >  <=  >=  ==  !=ou<>  ===  !===

> === et !=== testent l'égalité sans conversion implicite

### if 

``` 
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

``` 
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

```
$val = <condition>?true:false;
```

## Les boucles
>Les break et continue existent 

### While
```
$i = 1;
while ($i <= 10) {
    echo $i = $i + 1;
}
```
> do while existe aussi

### for

```
for ($i = 1; $i <= 10; $i++) {
    echo $i;
}
```

### foreach

```
foreach ($tableau as $valeur){
    // du code
}
foreach ($tableau as $clef => $valeur){

    // du code ou pour chaque élément on peut récupérer la clé et la valeur 
}
```

## readline

```
$val = (int) readline('message');
$val = readline('message');  
```

## Les fonctions
### appel de la fonction

``` 
nom_de_fonction($param1, $param2);
```

### Creer une fonction 

## Les Erreurs 
Il existe 3 niveaux d'erreurs.

* **ERROR** : interrompt l'exécution (point-virgule manquant, absence d’un fichier nécessaire)
* **WARNING** : l'exécution se poursuit (argument manquant, essayer de modifier la valeur d’une constante...)
* **NOTICE** : l'exécution se poursuit (écrire une variable non définie)

On peut forcer une erreur avec *die('message') qui interrompt l'exécuter et affiche le message.
> souvent utilisé avec une fonction qui retourne true en cas de succes ( connexionBd(....) or die('erreur bd')