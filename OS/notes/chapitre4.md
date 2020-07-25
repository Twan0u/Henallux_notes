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

pid : 

* Si le pid est strictement positif : on attends le processus spécifié par le pid
* Si le pid est 0 : On attend la fin de n'importe quel processus fils appartenant au même groupe que le processus appelant.
* Si le pid est -1 : on attends n'importe quel fils comme wait
* Si le pid est strictement inférieur à -1: on attends la fin de n'importe quel processus appartenant au groupe de processus dont le numéro est -pid.

status : status du processus

Options : 

* **WNOHANG**:  ne pas bloquer si aucun fils ne s'est terminé. Si aucun fils spécifié par pid n'a encore changé d'état, 0 est renvoyé. En cas d'échec -1 est renvoyé 
* **WUNTRACED**:  recevoir l'information concernant également les fils bloqués si on ne l'a pas encore reçue

Exemple utilisation

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

// Dans certain cas, les variables globales sont utiles !
int sleepTime;
int status;
int myPid;

void fils (char * nomPgm) {
    myPid = getpid();
    printf("PID %d - Debut du fils (programme = %s) [PPID = %d]\n",
    myPid, nomPgm, getppid());
    sleep(sleepTime);
    printf("PID %d - Fin du fils\n", myPid);
    exit(EXIT_SUCCESS);
}

int main (int ac, char **av) {
    int pid;
    myPid = getpid();
    printf("PID %d - Debut du Pere\n", myPid);
    // N'oubliez pas de vérifier que l'utilisateur a bien passé un argument !
    if (ac < 2) {
        printf("Usage : ./ex sleepTime [sleepTime est un entier entre 1 et 9 inclus]\n");
        exit (EXIT_FAILURE);
	}
    // Tous les paramètres sont passés sous la forme de chaînes de caractères.
    // Lorsque le programme doit travailler avec des entiers, il faut d'abord les
    // transformer en variable de type int via la fonction atoi
    sleepTime = atoi(av[1]);
    if (sleepTime < 1 || sleepTime > 9) {
        printf("Temps d'attente non compris entre 1 et 9\n");
        exit (EXIT_FAILURE);
    }
    pid = fork();
    if (pid < 0) {
        perror("Erreur lors du fork du fils");
        exit(EXIT_FAILURE);
    }
    if (pid == 0) {
        fils(av[0]);
    }
    /* Suite le pere */
    while (waitpid(pid, &status, WNOHANG) == 0) {
        printf("PID %d - Le processus fils n’est pas encore termine...\n", myPid);
        sleep(1);
    }
    printf("PID %d - Le fils [PID %d] s'est termine avec le statut %04.4X\n",
    myPid, pid, status);
    printf("PID %d - Fin du Pere\n", myPid);
    exit(EXIT_SUCCESS);
}
```



## execv

 Cette fonction active l'exécutable application à la place du processus courant.
Les paramètres éventuels sont transmis sous forme d’un tableau de pointeurs sur
des chaines de caractères, le dernier étant NULL.

### prototype 

``` c 
int execv (const char *application, char *const argv[]);
```

Lorsque cette commande est appelée, le programme qui l'à lancé est remplacé par le programme décrit dans la commande execv. le programme appelant ne sera appelé que si execv ne parviens par à exécuter l'autre programme.

### Ouverture de fichier

#### Ouverture d'un fichier pour rediriger la sortie Standard  (STDOUT)  vers un fichier ouvert

##### Open

```c
// Librairies
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

// Prototypes
int open(const char *pathname, int flags);
int open(const char *pathname, int flags, mode_t mode);
```

**Flags** : peut être **O_RDONLY**, **O_WRONLY** ou **O_RDWR**. Qui indiquent comment on souhaite ouvrir le fichier (Read only, write only ou en lecture et écriture). Il existe aussi d'autres flags utilisables

**Mode** indique les permissions à utiliser si un nouveau fichier est crée. On à les options : 

**S_IRUSR**, **S_IWUSR**, **S_IXUSR**, **S_IRWXU**, **S_IRGRP**

###### L'utilisation

Le nombre entier retourné par la fonction open représente un descripteur de fichier qui est un entier qui fait référence à une instance donnée d'un fichier ouvert au sein d'un processus.

##### Close

```c
//librairie
#include  <unistd.h>

//prototype
int close(int fd);
```

**fd** : représente le file descripteur ouvert avec open. L'intérêt de la méthode close est de fermer ce fileDescriptor et de libérer les ressources qui lui étaient associées. La fonction retourne zero si elle réussi  et -1 si elle échoue (errno est alors à consulter pour obtenir le code de l'errreur).



##### dup 

```c
// Librairies
#include <unistd.h>

// Prototype
int dup(int oldfd);
int dup2(int oldfd, int newfd);
```

Le but de cette méthode est de créer une copie du descripteur de fichier. La copie permets utiliser les 2 files descripteurs de manière interchangeable. 