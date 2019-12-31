# Introduction au PHP

[TOC]

Le php est un langage de scripts orienté serveur. Il est utilisé pour générer dynamiquement des pages  web. Ces pages sont donc dynamiques ( <> pages statiques en html et css ). Cette personnalisation s'effectue du côté serveur et les pages html générées seront ensuite envoyées au client.

Php signifie : (Php : a Hypertext Processor)
### Installation 

Pour travailler avec php, il faut un navigateur, un éditeur de texte et les programmes (php,apache(,mysql)).  
Il est conseillé d'utiliser wamp (Windows) / mamp (macOS)/ xampp (linux) afin d'installer tous ces programmes en même temps sans grand effort. 

### Architecture tripartite
L'architecture en trois partie ajoute une nouvelle dimension au client serveur(bipartite). Nous avons une architecture en 3 couches (MVC = Model Vue Control). 
* **Model** : Base de donnée
* **Vue** : Navigateur
* **Control** : Couche fonctionnelle de Traitement (serveur web)

### Architecture N_tier 
Ce genre d'architecture ajoute un layer ( souvent business ) au tripartite. Mais il peut en ajouter plus 


### Types de clients 
* **Légers** : (peu de Traitement par le client) : (ex : site web statique)
* **Lourds** : (beaucoup de traitements par le client) :  (ex : jeu flash) 
* **Riches** : (traitement de l'affichage par le client et majorité des traitements par le serveur) : (widget météo, cours de la bourse, ...)

## Base

Le code php s'écrit au milieu du html et au moyen de balises spécifiques.

> Il est important de noter que contrairement au javascript, il est impératif de finir les instructions php par ;

exmple : 

```php+HTML
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
```php
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

#### readline

Lit les entrées de l'utilisateur 

```php
$val = (int) readline('message');
$val = readline('message');  
```

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



## Les Erreurs 

Il existe 3 niveaux d'erreurs.

* **ERROR** : interrompt l'exécution (point-virgule manquant, absence d’un fichier nécessaire)
* **WARNING** : l'exécution se poursuit (argument manquant, essayer de modifier la valeur d’une constante...)
* **NOTICE** : l'exécution se poursuit (écrire une variable non définie)

On peut forcer une erreur avec *die('message') qui interrompt l'exécuter et affiche le message.

> souvent utilisé avec une fonction qui retourne true en cas de succès ( connexionBd(....) or die('erreur bd')

