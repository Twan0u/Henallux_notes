# Appels systèmes pour la gestion des processus

## waitpid

Suspend l'exécution du processus appelant jusqu'à ce que le fils spécifié par son
pid ait changé d'état.

### librairies

* sys/wait.h
* sys/types.h

### prototype

```
pid_t waitpid (pid_t pid, int *status, int options);
```

## execv
 Cette fonction active l'exécutable application à la place du processus courant.
Les paramètres éventuels sont transmis sous forme d’un tableau de pointeurs sur
des chaines de caractères, le dernier étant NULL.

### prototype 

``` c 
int execv (const char *application, char *const argv[]);
```

### Ouverture de fichier
voir labo 4 pour des exemples 

