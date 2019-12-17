# Technologie Web

code cours : prototype.  

## Chapitre 0 : Introduction

Dans le cadre d'une communication entre un navigateur et un server, il est important de distinguer le permier du second. Pour communiquer ils utilisent le protocol http (*hypertext transfer*) et est organisé par le W3C (*World Wide Web Consortium*)
    
* **Navigateur** : Utilisé par l'internaute qui envoie des demandes, réceptionne des réponses et gère l'affichage.

* **Server** : Machine phyqique et logiciel capable de répondre aux demandes de fichiers

### Html et DHTML

La différence entre elles deux est que le DHTML ajout au css et au html du javascript qui modifira le html et le rendra dynamique. d'où le D de DHTML

### Le Javascript 

Le javascript est un langage créé pour écrire des scripts ( language interprété ). Il est exécuté du côté client.  

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

on peut aussi avoir un script externe

``` html
<script src="nomFichier.js"></script>
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






















