# chapitre 3 : Commandes de gestion de processus

## Processus

* **ps** : Afficher l'état des processus en cours
* **pstree** : Afficher l'arbre des processus. La racine est init


## Flèches 
Une flèche est une forme limitée de communication entre processus utilisée par les systèmes de type
Unix et ceux respectant les standards POSIX. Il s'agit d'une notification asynchrone envoyée à un
processus pour lui signaler l'apparition d'un événement. Quand une flèche est envoyée à un
processus, le système d'exploitation interrompt l'exécution normale de celui-ci. Si le processus
possède une routine de traitement pour la flèche reçue, il lance son exécution. Dans le cas contraire, il
exécute la routine de traitement des flèches par défaut.1

manuel sur les flèches : 
```
man 7 signal
```

* **kill** : Envoyer une flèche au(x) processus dont on précise le(s) pid ( SIGTERM si on ne précise pas quelle autre flèche utiliser )

> ctrl-c kill le programme, ctrl-z le stop. 
> pour kill un programme mis sur pause par ctrl-z, on peut faire un kill %1 ( 1 etant le numero dans les parenthèses retourné par ctrl-z

* **killall** : Envoyer une flèche à un processus dont on précise le nom
* **top** : liste dynamique des processus actifs en arrière plan

## Faire tourner un programme dans le background 

