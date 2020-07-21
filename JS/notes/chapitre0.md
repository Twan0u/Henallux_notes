# Technologie Web

code cours : prototype.  

## Chapitre 0 : Introduction

Dans le cadre d'une communication entre un navigateur et un server, il est important de distinguer le premier du second. Pour communiquer ils utilisent le protocole http (*HyperText Transfer*) et est organisé par le W3C (*World Wide Web Consortium*)
    
* **Navigateur** : Utilisé par l'internaute qui envoie des demandes, réceptionne des réponses et gère l'affichage.

* **Server** : Machine physique et logiciel capable de répondre aux demandes de fichiers

### Html et DHTML

La différence entre elles deux est que le DHTML ajoute au CSS et a l'HTML du javascript qui modifiera le html et le rendra dynamique. d'où le D de DHTML.

### Le Javascript 

Le javascript est un langage créé pour écrire des scripts ( langage interprété ). Il est exécuté du côté client.  

> tip : CTRL+SHIFT+J lance la console de débug dans firefox
> tip : CTRL+SHIFT+K lance la console de développement dans firefox

Le code Javascript s'exécute de façon synchrone. Le code est exécuté de façon asynchrone dans le cas d'un appel à une fonction suite à un événement.

#### Les commentaires

``` javascript
/*commentaire*/
//commentaire
```

#### Javascript désactivé

On peut indiquer à l'utilisateur que javascript est désactivé par l'intermédiaire d'un message dans les balises **noscript**

#### Insertion du code 

On définit les fonctions dans la head puis on les exécute dans le body

On peut demander une exécution suite à une manipulation de l'utilisateur.

via la propriété onclick="CODE JS" d'un bouton  
ou via href="javascript:CODEJS" d'un lien "a"

```html
<button onclick="codeJS">Cliquez moi!</button>
<!-- ou encore -->
<a href="javascript:codeJS">texte</a>
```

on peut aussi avoir un script externe

``` html
<script src="nomFichier.js"></script>
```

IL en vas de même avec le css, mais pour des raisons de clean code, nous allons préférer le laisser dans un fichier séparé :
``` html
<linkhref="style.css" rel="stylesheet" type="text/css" />
```

### Créer une table en html

``` html
<table>
    <tr>
        <th>titre coll 1</th>
        <th>titre coll 2</th>
        <th>titre coll 3</th>
    </tr>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
    </tr>
    <tr>
        <td>4</td>
        <td>5</td>
        <td>6</td>
    </tr>
    <tr>
        <td>7</td>
        <td>8</td>
        <td>9</td>
    </tr>
</table>
```

css pour changer le tableau 

``` css
table:tr:nth-child(odd) // ligne impaires du tableau
table:tr:nth-child(3) // 3e ligne du tableau
```

### Clean Code

#### HTML

* Balises et attributs écrits en minuscules
* Valeurs des attributs entre guillemets (sauf booleens)
* Indentation correcte (on évite les multiples espaces)
* Respect de la syntaxe

#### CSS

* Tout écrit en Majuscule 
* Bien Différencier identificateur et classe
* Bien choisir noms de classe
* Respect de la syntaxe

### En Résumé : 

Le langage Javascript est un langage faiblement voire non typé interprété orienté objet impératif. Il est généralement exécuté du côté client. Il est synchrone mais peut être exécuté de manière asynchrone par le biais d'événements. Les fonctions sont, en javascript des objets du premier ordre. 

