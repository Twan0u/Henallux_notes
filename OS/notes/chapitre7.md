# cChapitre 7 : Les Sémaphores

## Qu'est-ce qu'un sémaphore ?

Un sémaphore est ...

Il est constitué de deux éléments : 

* **un compteur** : qui donne la quantité de ressources disponibles quand il est positif  et la quantité de ressources demandée quand il est négatif.
* **une file d'attente** : qui contient l'ensemble des processus en attente de la ressource

Ces deux éléments sont stockés dans une zone mémoire partagée. Le séamphore diffère des segments de mémoire partagée car il ne peut être interrompu durant l'exécution. 

## Quand l'utiliser ?

### Exclusion mutuelle

On peut utiliser un sémaphore pour protéger une ressource et éviter que plusieurs accèdent en même temps à celle-ci. On applique ici le principe de l'**exclusion mutuelle**.

L'**exclusion mutuelle** est une portion de code qui ne sera pas interrompue par un autre processus voulant accéder à la même ressource.

> voilà comment  faire : 
>
> 1. Création d'un sémaphore partagée par tous les processus voulant accéder à la ressource critique ; initialisation du compteur du sémaphore à 1 et de sa file d'attente à vide.
> 2. À chaque fois qu'un processus veut entrer en section critique (pour utiliser la ressource critique), il appelle la procédure wait ou P sur ce sémaphore. Cette procédure est atomique et effectue le traitement suivant :
>    1. si le compteur du sémaphore est inférieur ou égal à 0, alors le compteur est décrémenté de 1, le processus est ajoutée dans la file d'attente, et son exécution est suspendue (sauf si le processus a fait un appel non bloquant) ;
>    2. sinon (le compteur est égal à 1, ce qui signifie qu'aucun processus n'utilise la ressource critique), le compteur est mis à 0 et le processus continue son exécution (et donc utilise la ressource critique).
> 3. À chaque fois qu'un processus a fini d'utiliser la ressource critique (il sort de la section critique), il appelle la procédure signal ou V sur le sémaphore. Cette procédure est atomique et effectue le traitement suivant :
>    1. si le compteur du sémaphore est inférieur à 0, alors le compteur est incrémenté de 1, et un processus de la file d'attente est réactivé.
>    2. sinon (le compteur est égal à 0), le compteur est mis à 1 (plus personne ne demande la ressource critique).

### La synchronisation de processus 

On peut donc aussi utiliser les sémaphores dans la synchronisation des processus. 

> Comment faire : 
>
> 1. Création d'un sémaphore partagé par A et B ; initialisation du compteur à 0 et de la file d'attente à vide.
> 2. Le processus A, avant d'exécuter l'instruction I, appelle la procédure wait ou P sur le sémaphore. Cette procédure va bloquer A jusqu'à ce qu'un autre processus incrémente le compteur du sémaphore...
> 3. Le processus B appelle la procédure signal ou V sur le sémaphore au moment où il veut que le processus A exécute l'instruction I.

## Création et Récupération d'un sémaphore

Les opérations de création et de Récupération s'effectuent ) l'aide de l'instruction segmet : 

```c
// Librairie 
#include <sys/sem.h>
# include <sys/types.h>
# include <sys/ipc.h>

// Prototype 
int semget(key_t key, int nsems, int semflg);
```

Retourne l'identifiant de l'ensemble de sémaphores (semid) associé à la valeur de clé key, ou -1 si l'appel échoue. 

Un nouvel ensemble contenant nsems sémaphores est créé : 

* si key a la valeur IPC_PRIVATE ou si aucun ensemble n'est associé à key, et

* si l'option IPC_CREAT est présente dans semflg

Si semflg contient à la fois IPC_CREAT et IPC_EXCL et si un jeu de sémaphore associé à la clé key existe déjà, alors l'appel système échoue en renseignant errno avec EEXIST.

Les 9 bits de poids faibles de semflg définissent les permissions d'accès à l'ensemble de sémaphores. 

Les valeurs des sémaphores dans un ensemble nouvellement créé sont indéterminées, il est donc nécessaire d'initialiser les sémaphores aux valeurs souhaitées.

L'argument nsems peut valoir 0 (ignore) si l'appel système n'est pas une création d'ensemble de sémaphores. Autrement, nsems doit être supérieur à 0 et inférieur ou égal au nombre maximal de sémaphores par ensemble (SEMMSL). Si le jeu de sémaphores existe déjà, les permissions sont contrôlées.

### Contrôle d'un sémaphore

L'appel système semctl permet d'initialiser, de détruire ou d'accéder à un sémaphore.

```c
// Librairie 
#include <sys/sem.h>
# include <sys/types.h>
# include <sys/ipc.h>

//Prototype 
int semctl(int semid, int semno, int cmd, union semun arg );
```

Effectue l’opération de contrôle indiqué par cmd sur le sémaphore semno de l’ensemble de sémaphores identifié par semid. 

Cette fonction prend trois ou quatre arguments, selon la valeur de cmd. Lorsqu'il y en a quatre, le quatrième est de type : union semun.

> ```c
> union semun {
>  int val; /* Valeur pour SETVAL */
>  struct semid_ds *buf; /* Tampon pour IPC_STAT, IPC_SET */
>  unsigned short *array; /* Tableau pour GETALL, SETALL */
>  struct seminfo *__buf; /* Tampon pour IPC_INFO
>  (spécifique à Linux) */
> };
> ```

On utilise la commande 

* SETVAL suivie d'un entier positif pour affecter cet entier au compteur du sémaphore. 
* GETVAL pour récupérer cette valeur.
* IPC_RMID pour détruire le sémaphore

La structure de données semid_ds est définie dans  de la manière suivante : 

```c
struct semid_ds {
    struct ipc_perm sem_perm; /* Permissions pour les opérations */
    struct sem * sem_base; /* Pointeur sur le premier sémaphore de l'ensemble */
    ushort_t sem_nsems; /* Nombre de sémaphores */
    time_t sem_otime; /* Temps de la dernière semop */
    long sem_pad1; /* Place mémoire réservée à l'extension de time_t */
    time_t sem_ctime; /* Temps de la dernière modification */
    long sem_pad2; /* Place mémoire réservée à l'extension de time_t */
    long sem_pad3[4]; /* Place mémoire de réservée */
};
```

La structure ipc_perm est définie dans  de la façon suivante (les champs en gras, cidessous, peuvent être configurés avec IPC_SET) :

```c
struct ipc_perm {
 key_t key; /* Clé fournie à semget */
 uid_t uid; /* UID effectif du propriétaire */
 gid_t gid; /* GID effectif du propriétaire */
 uid_t cuid; /* UID effectif du créateur */
 gid_t cgid; /* GID effectif du créateur */
 unsigned short mode; /* Permissions */
 unsigned short seq; /* Nombre de séquences */
};
```

En cas d'échec, l'appel-système renvoie -1. Autrement, il renvoie une valeur non-négative (dépendant de l'argument cmd...)

## Opération sur les sémaphores

```c
// Librairie 
#include <sys/sem.h>
# include <sys/types.h>
# include <sys/ipc.h>

// Prototype 
int semop (int semid, struct sembuf *sops, unsigned nsops );
```

Effectue des opérations sur les membres sélectionnés de l’ensemble de sémaphores identifié par semid. Chacun des nsops éléments dans le tableau pointé par sops indique une opération à effectuer sur un sémaphore en utilisant une structure sembuf.

Les options possibles pour sem_flg sont notamment IPC_NOWAIT et SEM_UNDO. Si une opération indique SEM_UNDO, elle sera annulée lorsque le processus sera terminé. Si sem_flg est à 0, on attend qu'une ressource se libère…

La structure permettant de conserver les informations sur les opérations est la suivante :

```c
struct sembuf {
    short sem_num ; /* numero du semaphore */
    short sem_op ; /* opération à effectuer */
    short sem_flg ; /* options pour l’opération */
 };
```

## Exemple  cours

Repartons du problème du producteur/consommateur, mais cette fois-ci, le consommateur crée et initialise la mémoire partagée, il affiche les informations, c'est-à-dire le nombre d'éléments ajoutés ainsi que le total de ceux-ci, et détruit la mémoire partagée. 

Le(s) producteur(s) se rattache(nt) à cette mémoire et la modifie selon ce qui est introduit par l'utilisateur. Il est possible de lancer plusieurs producteurs qui se rattacheront tous au même segment de mémoire, celui créé par le consommateur… 

Le producteur demande à l'utilisateur d'obtenir une suite de nombres et effectue le cumul dans une variable en mémoire partagée. 

ATTENTION ! Le consommateur doit être lancé en premier puisque le(s) producteur(s) se connecte(nt) à la mémoire partagée que le consommateur a générée ! 

ATTENTION ! Le consommateur doit être tué en dernier puisque c'est lui qui détruit la mémoire partagée !

### Consommateur

```c
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <errno.h>
#include <signal.h>

#define KEY_FOR_FTOK 'P'
#define DELAI 2

typedef struct donnees Donnees;
struct donnees {
    int nb;
    int total;
    int nbProd; // utilise dans le producteur...
};

void creerMemoirePartagee();
void detacherMemoirePartagee();
void detruireMemoirePartagee();

// mémoire partagée
int shmId;
Donnees * pDonnees;
bool encore;

void arret(int signal) {
    encore = false;
}

int main(void) {
    int pid;
    signal(SIGINT, arret); /* si contrôle-C */
    pid = getpid();
    printf("PID %d - Debut du consomateur !\n", pid);
    creerMemoirePartagee();
    encore = true;
    while (encore) {
        sleep(DELAI);
        printf("Sous-total %d = %d\n", pDonnees->nb, pDonnees->total);
    }
    printf("PID %d - Fin du consomateur !\n", pid);
    detacherMemoirePartagee();
    detruireMemoirePartagee();
    exit(EXIT_SUCCESS);
}
void creerMemoirePartagee() {
    key_t cle = ftok(getenv("HOME"), KEY_FOR_FTOK);
    if (cle == -1) {
        perror("Erreur lors de la creation de la cle ");
        exit(EXIT_FAILURE);
    }
    // allocation mémoire partagée
    printf("cle : 0x%X\n", cle);
    shmId = shmget(cle, sizeof(Donnees), IPC_CREAT | 0600);
    if (shmId == -1) {
        switch (errno) {
            case ENOENT : fprintf(stderr, "Pas de segment !\n");
                break;
            case EEXIST : fprintf(stderr, "Le segment existe deja !\n");
                break;
            default : perror("shmgt");
        }
        exit(EXIT_FAILURE);
    }

    // attacher la mémoire partagée au processus
    pDonnees = (Donnees *) shmat(shmId, NULL, SHM_R | SHM_W);
    if (pDonnees == NULL || (int)pDonnees == -1) {
        perror("Erreur pour attacher la memoire partagee ");
        shmctl(shmId, IPC_RMID, NULL);
        exit(EXIT_FAILURE);
    }

    // initialisation mémoire partagée
    pDonnees->nb = 0;
    pDonnees->total = 0;
    pDonnees->nbProd = 0;
    //printf("Nombre de producteurs : %d\n", pDonnees->nbProd);
}

void detacherMemoirePartagee() {
    if (shmdt((char *)pDonnees) == -1) {
        perror("Erreur lors de la liberation de la memoire partagee ");
        exit(EXIT_FAILURE);
    }
}
void detruireMemoirePartagee() {
    if (shmctl(shmId, IPC_RMID, NULL) == -1) {
        perror("Erreur lors de la destruction de la memoire partagee ");
        exit(EXIT_FAILURE);
    }
}
```

Le consommateur affichera ce qui se trouve dans la mémoire partagée. Comme il n'y a rien pour l'instant, il affiche 0 à chaque fois, comme sur la Figure 1.

### Producteur 

```c
/* prod.c */
#include <sys/ipc.h>
#include <sys/types.h>
#include <sys/shm.h>
#include <sys/sem.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <errno.h>
#include <signal.h>

#define KEY_FOR_FTOK 'P'

typedef struct donnees Donnees;
struct donnees {
    int nb;
    int total;
    int nbProd; // permet de savoir combien de processus utilise le sémaphore
};

typedef union sem SemUnion;
union sem {
    int valeur;
    struct semid_ds * buffer;
    unsigned short int * table;
};

void creerMemoirePartagee();
void detacherMemoirePartagee();
void detruireMemoirePartagee();
void creerSemaphore();
void debutSectionCritique();
void finSectionCritique();
void detruireSemaphore();

// mémoire partagée
int shmId;
int semId;
SemUnion sem;
Donnees * pDonnees;

void vider(void) {
    char c = getchar();
    while(c != '\n' && c != EOF) {
    	c = getchar();
    }
}

int nombreLu(void) {
    int nombre;
    bool valide;
    do {
        printf("Entrer un nombre (0 pour terminer) : ");
        scanf("%d", &nombre);
        vider();
        valide = nombre >= 0 && nombre <= 99;
        if(!valide) printf("Nombre entre 1 et 99 !\n");
    } while (!valide);
    return nombre;
}

int main(void) {
    int nombre;
    int pid;
    pid = getpid();
    printf("PID %d - Debut du producteur !\n", pid);

    creerMemoirePartagee();
    pDonnees->nbProd++;
    printf("Nombre de producteurs : %d\n", pDonnees->nbProd);
    creerSemaphore();
    nombre = nombreLu();
    while (nombre != 0) {
        debutSectionCritique();
        pDonnees->nb++;
        pDonnees->total += nombre;
        finSectionCritique();
        nombre = nombreLu();
    }
    printf("PID %d - Fin du producteur !\n", pid);
    pDonnees->nbProd--;
    printf("Nombre de producteurs : %d\n", pDonnees->nbProd);
    if(pDonnees->nbProd == 0) {
    	detruireSemaphore();
    }
    detacherMemoirePartagee();
    exit(EXIT_SUCCESS);
}

void creerSemaphore(void) {
    key_t cle = ftok(getenv("HOME"), KEY_FOR_FTOK);
    if (cle == -1) {
        perror("Erreur lors de la creation de la cle pour sem");
        exit(EXIT_FAILURE);
    }
    // création du sémaphore
    semId = semget(cle, 1, IPC_CREAT | 0600);
    // On utilise le champs valeur de notre union et on l'initialise à 1 car on considère
    // qu'on a une ressource
    sem.valeur = 1;
    if (semctl(semId, 0, SETVAL, sem) < 0) {
        perror("Erreur lors de la creation du semaphore ");
        exit(EXIT_FAILURE);
    }
}
void debutSectionCritique(void) {
    struct sembuf sops;
    // un seul sémaphore créé => numéro 0
    sops.sem_num = 0;
    // entrer dans la section critique
    // P() ou down() --> utiliser la ressource
    sops.sem_op = -1;
    // on attend
    sops.sem_flg = 0;
    if (semop(semId, &sops, 1) < 0) {
        perror("Erreur lors la descente du semaphore ");
        exit(EXIT_FAILURE);
    }
}
void finSectionCritique(void) {
    struct sembuf sops;
    // un seul sémaphore créé => numéro 0
    sops.sem_num = 0;
    // sortir de la section critique
    // V() ou up() --> libérer la ressource
    sops.sem_op = +1;
    // on attend
    sops.sem_flg = 0;
    if (semop(semId, &sops, 1) < 0) {
        perror("Erreur lors de la levee du semaphore ");
        exit(EXIT_FAILURE);
    }
}

void detruireSemaphore(void) {
    if (semctl(semId, 0, IPC_RMID, 0) < 0) {
        perror("Erreur lors de la destruction du semaphore ");
        exit(EXIT_FAILURE);
    }
}

void creerMemoirePartagee() {
    key_t cle = ftok(getenv("HOME"), KEY_FOR_FTOK);
    if (cle == -1) {
        perror("Erreur lors de la creation de la cle pour shm ");
        exit(EXIT_FAILURE);
    }
    // rattachement à la memoire partagee
    printf("cle : 0x%X\n", cle);
    shmId = shmget(cle, sizeof(Donnees), 0);
    if (shmId == -1) {
        switch (errno) {
            case ENOENT : fprintf(stderr, "Pas de segment !\n");
                break;
            default : perror("shmget");
        }
        exit(EXIT_FAILURE);
    }
    // attacher la memoire partagee au processus
    pDonnees =(Donnees *) shmat(shmId, NULL, SHM_R | SHM_W);
    if (pDonnees == NULL ||(int)pDonnees == -1) {
        perror("Erreur pour attacher la memoire partagee ");
        shmctl(shmId, IPC_RMID, NULL);
        exit(EXIT_FAILURE);
    }
}

void detacherMemoirePartagee() {
    if (shmdt((char *)pDonnees) == -1) {
        perror("Erreur lors de la liberation de la memoire partagee ");
        exit(EXIT_FAILURE);
    }
}

void detruireMemoirePartagee() {
    if (shmctl(shmId, IPC_RMID, NULL) == -1) {
        perror("Erreur lors de la destruction de la memoire partagee ");
        exit(EXIT_FAILURE);
    }
}
```

ATTENTION (bis) ! Comme c'est le consommateur qui crée la mémoire partagée et que c'est lui qui la détruira, il est nécessaire de le lancer en premier et de le tuer en dernier ! Pour plus de facilité, vous pouvez lancer un terminal dans lequel s'exécute le consommateur et gérer les producteurs dans un second terminal…

Après avoir lancé le consommateur, on peut lancer un producteur. Celui-ci permet d'introduire des nombres. On peut alors observer le consommateur en afficher la somme au fur-et-à-mesure comme le montre la Figure 2.

> Si vous introduisez les nombres, du côté producteur, en moins de temps que le délai prévu entre les lectures du consommateur, le résultat affiché étant la somme de tous ce qui a été envoyé dans la mémoire partagée, peut "sauter" des étapes…

## Exercice 2 

Un processus reçoit en paramètre le nombre de messages que chacun des fils doit écrire dans la mémoire partagée. 

Ce processus, le père crée deux fils :

* le fils 1 écrit toutes les deux secondes dans un segment de mémoire partagée un message avec son pid et le temps d’exécution depuis le début (utilisez les fonctions systèmes time et difftime). 
* le fils 2 fait la même chose mais toutes les trois secondes. 

Protéger l’accès à la mémoire partagée avec un sémaphore.

Lorsque les fils ont terminé leur travail, le père lit la mémoire partagée et affiche chacun des messages écrits par les fils.