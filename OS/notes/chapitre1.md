# Base des Systèmes d'exploitations

Contact : 
* bernard.vankerm@henallux.be
* bernard.vankerm@belfius.be
* bernard.vankerm@skynet.be

# Operating Systems : Advanced Course

## 1.Introduction

Au démarage de la machine, le **BIOS** initialise, verifie, ... puis passe la main au **Noyau** qui prendra le relais pour gérer les accès au matériel.

On sépare la mémoire vive physique en deux régions disjointes (l'une pour le noyau et l'autre pour les applications) 

Pour répartir la charge équitablement pour tous les éléments du système, on fait appel à un **Scheduler**. 

Les appels systèmes sont le principal moyen pour une application linux de comuniquer avec le noyau. ( ex open, read et write pour la gestion de fichiers en unix )

### Manuel

Le manuel est un guide d'utilisation des commandes. 

``` 
man \<nom_de_commande\>
```

### Variables d'envoronnement
Une variable d'environnement est une variable qui peut être vue comme visible par tous les programmes et qui influe sur le comportement normal d'une applicaion. (ex: langue du système, path actuel de l'invite de commande)

> n.b. : Linux est Case Sensitive 

> n.b. : on peut utiliser le TAB pour auto compléter une ligne de commande.

#### Les jokers et Séparateurs

on utilise des '/' comme séparateurs pour désigner un chemin d'accès. 
 
Les '*' désigne plusieurs caractères. tandis que '?' n'en désigne qu'un seul. 

#### Compilation de programmes en C

On utilise GCC ( Gnu Compiler collection )

```
gcc hello.c -o hello
```

on peut ensuite exécuter le programme avec un './'

```
./hello
```
