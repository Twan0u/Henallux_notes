# chapitre 3 : Commandes de gestion de processus

## Processus

* **ps** : Afficher l'état des processus en cours
* **pstree** : Afficher l'arbre des processus. La racine est le processus init


## Flèches 
Une flèche est une forme limitée de communication entre processus utilisée par les systèmes de type
Unix et ceux respectant les standards POSIX. Il s'agit d'une notification asynchrone envoyée à un
processus pour lui signaler l'apparition d'un événement. Quand une flèche est envoyée à un
processus, le système d'exploitation interrompt l'exécution normale de celui-ci. Si le processus
possède une routine de traitement pour la flèche reçue, il lance son exécution. Dans le cas contraire, il
exécute la routine de traitement des flèches par défaut.1

manuel sur les flèches : 
```sh
man 7 signal
```

* **kill** : Envoyer une flèche au(x) processus dont on précise le(s) pid ( SIGTERM si on ne précise pas quelle autre flèche utiliser )

> ctrl-c kill le programme, ctrl-z le stop. 
> pour kill un programme mis sur pause par ctrl-z, on peut faire un kill %1 ( 1 etant le numero dans les parenthèses retourné par ctrl-z

* **killall** : Envoyer une flèche à un processus dont on précise le nom
* **top** : liste dynamique des processus actifs en arrière plan

## Faire tourner un programme dans le background 

Lorsque un programme est lancé en terminal, il faut attendre que celui-ci soit terminé pour pouvoir accéder au terminal à nouveau. 

Il est possible de couper la commande en cours via (Ctrl + C).

Mais si l'on souhaite voir le programme tourner en arrière plan. 

1. Il faudra d'abord le suspendre dans son exécution avec (Ctrl+Z)

2. Ensuite le relancer en *background* avec la commande 

   ```shell
   bg
   ```

3. La commande est lancée en tâche de fond (elle possède le signe '&' à la fin)

   > Il est aussi possible de mettre le signe '&' directement à la fin d'une commande pour la lancer directement en tâche de fond

4. Si l'on souhaite voir les processus en arrière plan on peut utiliser la commande 

   ```shell
   jobs
   ```

> jobs -l permets d'obtenir les pid des processus en arrière plan

5. Si l'on souhaite refaire passer ce job(nom donné à un processus en arrière plan) en avant plant on peut faire 

```shell
fg [numéro du job]
```

> On peut omettre le numéro du job si il n'y a qu'un seul processus en arrière plan



Il est possible d'envoyer une flèche pour réveiller un processus qui se serait arrêté en bg : 

```shell
kill -CONT pid
```

