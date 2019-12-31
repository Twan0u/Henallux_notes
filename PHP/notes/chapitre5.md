## Accès Aux Données et fichiers php

[TOC]

### Sécurité contre les injections

```php
$origine = htmlentities($_SERVER["HTTP_REFERRER"]);
```

## Incorporer des fichiers php en annexe

En php, l'insertion d'un fichier s'effectue en état (tout ce qui est noté dans le fichier php est copié/collé à l'endroit de la requête de celui-ci). La différence entre un include et un require est dans la gestion du cas où le fichier php n'existerait pas. Le include va émettre une **alerte**. tandis que le require va émettre une **erreur fatale**. Il existe aussi les variantes _once qui n'ajouteront le fichier qu'une seule fois 

```php
include "fichier.php"; 
require "fichier.php";
include_once "fichier.php";
require_once "fichier.php";
```

si le code de la page de base ressemble à ceci : 

```php+HTML
...
<body>
    <?php 
    require "test.php";
    ?>
</body>
...
```

et test.php vaut : 

```php+HTML
<p>
    <?php
    echo "blabla";
    ?>
</p>
```

le resultat sera 

```
...
<body>
    <p>
        <?php
        echo "blabla";
        ?>
    </p>
</body>
...
```

> attention donc à mettre des balises dans vos fichiers php sinon erreurs