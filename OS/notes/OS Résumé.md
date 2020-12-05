# OS Résumé

## Etapes de réalisation

1. Base de tout le programme
2. Ajouter test des paramètres
3. Ajouter ce qui est nécessaire à la mémoire partagée
4. Ajouter nécessaire pour éviter les problèmes kill / pause
5. ajouter ce qui est nécessaire à l'utilisation des sémaphores
6. ajouter les informations stockées en mémoire partagée et la menière de l'écrire et de la lire
7. on ajoute les autres fils (2.3.4) et pas  5,6 et on fait la création du fils 1 dans le père
8. On mets les commentaires dans les fils des trucs à remplire
9. on ajoute le fils 5 et 6

### Base du programme

```c
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <errno.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/sem.h>
#include <sys/wait.h>

#include <debug.h>

//lettre pour la mémoire partagée (changer si erreurs dans la mémoire)
#define KEY_FOR_FTOK 'A'

// 8 "DEFINE" SUIVANTS A MODIFIER EN FONCTION DE L'ENONCE
#define PARAM_MIN 1
#define PARAM_MAX 5
#define NB_FILS_EN_RELAIS 3
#define NB_MAX_VALUE_PAR_FILS_RELAIS 3
#define NB_VALUE_HORS_RELAIS 3
// ETRE TRES ATTENTIF AU DEFINE SUIVANT - VOICI DEUX POSSIBILITES N'EN GARDER QU'UNE
#define NB_CASES_A_TRAITER (NB_MAX_VALUE_PAR_FILS_RELAIS * NB_FILS_EN_RELAIS + NB_VALUE_HORS_RELAIS)
#define NB_CASES_A_TRAITER (NB_MAX_VALUE_PAR_FILS_RELAIS * NB_FILS_EN_RELAIS)
#define DUREE_ATTENTE_FILS_5 1
#define DUREE_ATTENTE_FILS_6 2


//----------------------------------------------------------------------------------------
// prototype des fonctions
//----------------------------------------------------------------------------------------
// 1) "main" des processus et fonction des threads
void pere();
void fils_1();
void fils_2();
void fils_3();
void fils_4();
void fils_56(char Fils, int duree_attente);

// 2) gestion des valeurs : écriture et lecture
void suite_given_value(char Ecrivain, int Value);   // pour les valeurs de depart
void suite_computed_value(char Ecrivain);           // pour les valeurs suivantes
void print_value(char Lecteur);

// 3) gestion des signaux
void killReceiver(int signum);
int extended_pause();

// 4) gestion de la memoire partagee
void create_shared_memory();
void dettach_shared_memory();
void destroy_shared_memory();

// 5) gestion des semaphores
void create_semaphore(void);
void enter_critical_section(void);
void exit_critical_section(void);
void destroy_semaphore(void);


//----------------------------------------------------------------------------------------
// definition des structures de donnees
//----------------------------------------------------------------------------------------
// 1) memoire partagee: on definit toutes les donnees qui doivent etre accessibles
//    par les differents processus.
typedef struct common_data_s
{
    pid_t pid_pere;
    pid_t pid_fils_1;
    pid_t pid_fils_2;
    pid_t pid_fils_3;
    pid_t pid_fils_4;
    char tab_ecrivain[NB_CASES_A_TRAITER];
    int tab_valeurs[NB_CASES_A_TRAITER];
    int current_pos;
    int nb_occ_fils_5;
    int nb_occ_fils_6;
} common_data_t;


//----------------------------------------------------------------------------------------
// declaration: variables globales
// donnees utilisables dans tous les processus créé pour ne pas devoir les transporter
// par paramètre de fonction.
//----------------------------------------------------------------------------------------
// pour des informations generales
int NbMsgParFils;

// pour synchronisation signal, kill, pause
int killReceived;

// pour memore partagee
int shm_id;
common_data_t *p_common_data;

// pour semaphore
int sem_id;


//----------------------------------------------------------------------------------------
// 1a) "main" : debut du processus pere
//----------------------------------------------------------------------------------------
int main(int argc, char *argv[])
{
    //--------------------------------------------------------------------------
    // Pour eviter les problemes, il faut commencer par les operations urgentes
    //--------------------------------------------------------------------------
    // par reflexe et securite pour la gestion des kill / pause
    killReceived = 0;
    signal(SIGUSR1, killReceiver);

    // debut du pere
    printf("debut du pere\n");

    //--------------------------------------------------------------------------
    // validation du parametre
    //--------------------------------------------------------------------------

    // avant toutes choses, il faut verifier si on a bien le parametre
    if (argc != 2 || (NbMsgParFils = atoi(argv[1])) < PARAM_MIN || NbMsgParFils > PARAM_MAX)
    {
        fprintf(stderr, "Usage is \"%s [%d..%d]\"\n", argv[0], PARAM_MIN, PARAM_MAX);
        exit(EXIT_FAILURE);
    }

    // creation de la memoire partagee.  Comme celle-ci est cree et connectee avant les
    // forks, tous les fils en heriteront et on ne devra pas le refaire dans ceux-ci.
    create_shared_memory();

    // on continue dans la fonction pere
    pere();
}

//------------------------------------------------------------------------------
// 1b) suite du processus père
//------------------------------------------------------------------------------
void pere()
{
    int status;
    pid_t pid_fils;

    //--------------------------------------------------------------------------
    // phase de creation des processus
    //--------------------------------------------------------------------------
    // sauver le pid du processus pour que tous puisse l'utiliser
    p_common_data->pid_pere = getpid();

    //--------------------------------------------------------------------------
    // creation synchronisee de la structure des processus
    //--------------------------------------------------------------------------
    // creation du fils 1
    if ((pid_fils = fork()) < 0)
    {
        perror("erreur creation du fils 1!");
        exit(EXIT_FAILURE);
    }
    if (pid_fils == 0)
        fils_1();
    p_common_data->pid_fils_1 = pid_fils;

    //--------------------------------------------------------------------------
    // processus principal
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // synchronisation de la fin des processus
    //--------------------------------------------------------------------------
    // on attend la fin du fils 1
    pid_fils = wait(&status);
    if (pid_fils != p_common_data->pid_fils_1)
    {
         printf("===== OUPS ===== %d est mort alors que l on attendait la mort de %d\n", pid_fils, p_common_data->pid_fils_1);
    }
    if (status != 0)
    {
         printf("===== OUPS ===== %d est mort par accident (status=%04x)\n", pid_fils, status);
    }

    //--------------------------------------------------------------------------
    // partie terminaison
    //--------------------------------------------------------------------------
    // on se deconnecte de la memoire partagee et on la detruit
    dettach_shared_memory();
    destroy_shared_memory();

	// on termine par le message de fin
    printf("fin du pere\n");
    exit(EXIT_SUCCESS);
}

//----------------------------------------------------------------------------------------
// 1c) fils 1
//----------------------------------------------------------------------------------------
void fils_1()
{
    //--------------------------------------------------------------------------
    // Pour eviter les problemes, il faut commencer par les operations urgentes
    //--------------------------------------------------------------------------
    // par reflexe et securite pour la gestion des kill / pause
    killReceived = 0;
    signal(SIGUSR1, killReceiver);

    // sauver le pid du processus pour que tous puisse l'utiliser
    p_common_data->pid_fils_1 = getpid();

    // debut du fils 1
    printf("debut du fils 1\n");

    //--------------------------------------------------------------------------
    // creation synchronisee de la structure des processus
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // processus principal
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // synchronisation de la fin des processus
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // partie terminaison
    //--------------------------------------------------------------------------
    // on se deconnecte de la memoire partagee
    dettach_shared_memory();

	// on termine par le message de fin
    printf("fin du fils 1\n");
    exit(EXIT_SUCCESS);
}

//----------------------------------------------------------------------------------------
// 1d) fils 2
//----------------------------------------------------------------------------------------
void fils_2()
{
    //--------------------------------------------------------------------------
    // Pour eviter les problemes, il faut commencer par les operations urgentes
    //--------------------------------------------------------------------------
    // par reflexe et securite pour la gestion des kill / pause
    killReceived = 0;
    signal(SIGUSR1, killReceiver);

    // sauver le pid du processus pour que tous puisse l'utiliser
    p_common_data->pid_fils_2 = getpid();

    // debut du fils 2
    printf("debut du fils 2\n");

    //--------------------------------------------------------------------------
    // creation synchronisee de la structure des processus
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // processus principal
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // synchronisation de la fin des processus
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // partie terminaison
    //--------------------------------------------------------------------------
    // on se deconnecte de la memoire partagee
    dettach_shared_memory();

	// on termine par le message de fin
    printf("fin du fils 2\n");
    exit(EXIT_SUCCESS);
}

//----------------------------------------------------------------------------------------
// 1e) fils 3
//----------------------------------------------------------------------------------------
void fils_3()
{
    //--------------------------------------------------------------------------
    // Pour eviter les problemes, il faut commencer par les operations urgentes
    //--------------------------------------------------------------------------
    // par reflexe et securite pour la gestion des kill / pause
    killReceived = 0;
    signal(SIGUSR1, killReceiver);

    // sauver le pid du processus pour que tous puisse l'utiliser
    p_common_data->pid_fils_3 = getpid();

    // debut du fils 3
    printf("debut du fils 3\n");

    //--------------------------------------------------------------------------
    // creation synchronisee de la structure des processus
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // processus principal
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // synchronisation de la fin des processus
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // partie terminaison
    //--------------------------------------------------------------------------
    // on se deconnecte de la memoire partagee
    dettach_shared_memory();

	// on termine par le message de fin
    printf("fin du fils 3\n");
    exit(EXIT_SUCCESS);
}

//----------------------------------------------------------------------------------------
// 1f) fils 4
//----------------------------------------------------------------------------------------
void fils_4()
{
    //--------------------------------------------------------------------------
    // Pour eviter les problemes, il faut commencer par les operations urgentes
    //--------------------------------------------------------------------------
    // par reflexe et securite pour la gestion des kill / pause
    killReceived = 0;
    signal(SIGUSR1, killReceiver);

    // sauver le pid du processus pour que tous puisse l'utiliser
    p_common_data->pid_fils_4 = getpid();

    // debut du fils 4
    printf("debut du fils 4\n");

    //--------------------------------------------------------------------------
    // creation synchronisee de la structure des processus
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // processus principal
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // synchronisation de la fin des processus
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // partie terminaison
    //--------------------------------------------------------------------------
    // on se deconnecte de la memoire partagee
    dettach_shared_memory();

	// on termine par le message de fin
    printf("fin du fils 4\n");
    exit(EXIT_SUCCESS);
}

//----------------------------------------------------------------------------------------
// 1f) fils 5 et fils 6, fonction commune
//----------------------------------------------------------------------------------------
void fils_56(char Fils, int duree_attente)
{
    // debut du fils 5 ou 6
    printf("début du fils %d  (sans synchro!)\n", fils_nb);

    //--------------------------------------------------------------------------
    // processus principal
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    // partie terminaison
    //--------------------------------------------------------------------------
    // on se deconnecte de la memoire partagee
    dettach_shared_memory();

    // on termine par le message de fin
    printf("fin du fils %d  (sans synchro!)\n", fils_nb);
    exit(EXIT_SUCCESS);
}

//----------------------------------------------------------------------------------------
// 2a) fonction suite
//----------------------------------------------------------------------------------------
void suite_given_value(char Ecrivain, int Value)
{
    p_common_data->tab_ecrivain[p_common_data->current_pos] = Ecrivain;
    p_common_data->tab_valeurs[p_common_data->current_pos] = Value;

#ifdef DEBUG
    printf("tab_ecrivain[%d] = %c,  tab_valeurs[%d] = %d\n"
          ,p_common_data->current_pos
          ,p_common_data->tab_ecrivain[p_common_data->current_pos]
          ,p_common_data->current_pos
          ,p_common_data->tab_valeurs[p_common_data->current_pos]
          );
#endif

    p_common_data->current_pos++;
}

void suite_computed_value(char Ecrivain)
{
    p_common_data->tab_ecrivain[p_common_data->current_pos] = Ecrivain;
	// LA LIGNE SUIVANTE EST BIEN SUR A ADAPTER
    p_common_data->tab_valeurs[p_common_data->current_pos] =  0;

#ifdef DEBUG
    printf("tab_ecrivain[%d] = %c,  tab_valeurs[%d] = %d\n"
          ,p_common_data->current_pos
          ,p_common_data->tab_ecrivain[p_common_data->current_pos]
          ,p_common_data->current_pos
          ,p_common_data->tab_valeurs[p_common_data->current_pos]
          );
#endif

    p_common_data->current_pos++;
}

//----------------------------------------------------------------------------------------
// 2b) fonction impression
//----------------------------------------------------------------------------------------
void print_value(char Lecteur)
{
    printf("fils %c: le processus %c a cree l'occurrence %2d avec la valeur %d\n"
          ,Lecteur
          ,p_common_data->tab_ecrivain[p_common_data->current_pos]
          ,p_common_data->current_pos
          ,p_common_data->tab_valeurs[p_common_data->current_pos]
          );
    p_common_data->current_pos++;
}

//----------------------------------------------------------------------------------------
// 3) gestion des signaux
//----------------------------------------------------------------------------------------
void killReceiver(int signum)
{
    killReceived++;
}

int extended_pause()
{
    if (killReceived == 0)
        pause();
    killReceived--;
}

//----------------------------------------------------------------------------------------
// 4) gestion de la memoire partagee
//----------------------------------------------------------------------------------------
void create_shared_memory()
{
    key_t key;
    int i;

    // on va generer un id en utilisant le home directory
    key = ftok(getenv("HOME"), KEY_FOR_FTOK);
    if (key == -1)
    {
        // erreur: creation de la cle
        perror("erreur creation de la cle!");
        exit(EXIT_FAILURE);
    }

    // allocation memoire partagee
    shm_id = shmget(key, sizeof(common_data_t), IPC_CREAT | 0600);
    if (shm_id == -1)
    {
        // erreur: memoire partagee
        perror("erreur creation de la memoire partagee!");
        exit(EXIT_FAILURE);
    }

    // attacher la memoire partagee au processus
    p_common_data = (common_data_t *)shmat(shm_id, NULL, SHM_R | SHM_W);
    if (p_common_data == NULL)
    {
        perror("erreur pour attacher la memoire partagee!");
        shmctl(shm_id, IPC_RMID, NULL);
        exit(EXIT_FAILURE);
    }

    // initialisation memoire partagee
    for (i = 0; i < NB_CASES_A_TRAITER; i++)
    {
        p_common_data->tab_ecrivain[i] = ' ';
        p_common_data->tab_valeurs[i] = -1;
    }
    p_common_data->current_pos = 0;
    p_common_data->nb_occ_fils_5 = 0;
    p_common_data->nb_occ_fils_6 = 0;
    p_common_data->pid_pere = 0;
    p_common_data->pid_fils_1 = 0;
    p_common_data->pid_fils_2 = 0;
    p_common_data->pid_fils_3 = 0;
    p_common_data->pid_fils_4 = 0;
}

void dettach_shared_memory()
{
    if (shmdt((char *)p_common_data) == -1)
    {
        perror("erreur lors de la liberation de la memoire partagee\n");
        exit(EXIT_FAILURE);
    }
}

void destroy_shared_memory()
{
    if (shmctl(shm_id, IPC_RMID, NULL) == -1)
    {
        perror("erreur lors de la liberation de la memoire partagee\n");
        exit(EXIT_FAILURE);
    }
}

//----------------------------------------------------------------------------------------
// 5) gestion des semaphores (fonctionalite lock)
//----------------------------------------------------------------------------------------
void create_semaphore(void)
{
    int sem_value;

    key_t key = ftok(getenv("HOME"), KEY_FOR_FTOK);
    if (key == -1)
    {
        // erreur: creation de la cle
        perror("erreur creation de la cle !");
        exit(EXIT_FAILURE);
    }

    // creation du sémaphore
    sem_id = semget(key, 1, IPC_CREAT | 0600);
    if (sem_id == -1)
    {
        // erreur: creation du semaphore
        perror("erreur creation de la memoire partagee!");
        exit(EXIT_FAILURE);
    }

    // initialisation du sémaphore
    sem_value = 1;
    if (semctl(sem_id, 0, SETVAL, sem_value) < 0)
    {
        perror("erreur lors de l'initialisation du semaphore !\n");
        exit(EXIT_FAILURE);
    }
}

void enter_critical_section(void)
{
    struct sembuf sops;

    // Le seul semaphore cree
    sops.sem_num = 0;

    // entrer dans la section critique = on descend le semaphore d'un niveau
    sops.sem_op = -1;
    sops.sem_flg = 0;
    if (semop(sem_id, &sops, 1) < 0)
    {
        perror("erreur lors la descente du semaphore !\n");
        exit(EXIT_FAILURE);
    }
}

void exit_critical_section(void)
{
    struct sembuf sops;

    // Le seul semaphore cree
    sops.sem_num = 0;

    // sortir dela section critique = on remonte le semaphore d'un niveau
    sops.sem_op = +1;
    sops.sem_flg = 0;
    if (semop(sem_id, &sops, 1) < 0)
    {
        perror("erreur lors de la levee du semaphore !\n");
        exit(EXIT_FAILURE);
    }
}

void destroy_semaphore(void)
{
    if (semctl(sem_id, 0, IPC_RMID, 0) < 0)
    {
        perror("erreur lors de la destruction du semaphore !\n");
        exit(EXIT_FAILURE);
    }
}
```

