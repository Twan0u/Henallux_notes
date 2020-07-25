# Synchronisation des Processus

Pour Rappel, une flèche (ou interruption logicielle) est un mécanisme utilisé par le système exploitation pour aviser les processus utilisateurs de occurrence d'un événement important. (Ex : division par 0, accès à une adresse non valide). 

Les processus peuvent indiquer au système ce qui doit se passer à la réception d'une flèche. 

 Les mécanismes et réponses possibles par un programme sont : 

* ignorer la flèche
* appeler une routine de traitement fournie par le noyau
* appeler une procédure spécifique créée par le programmeur (pas possible pour toutes les flèches)



## Signal (réception et gestion des flèches)

Signal installe un nouveau gestionnaire pour la flèche signum. 

Le gestionnaire peut être : 

*  une fonction spécifique de l'utilisateur
* **SIG_IGN** : qui ignore la flèche
* **SIG_DFL** : qui reprends le comportement par défaut pour la flèche

Retour : 

Cette fonction retourne la valeur précédente du gestionnaire de signaux ou SIG_ERR en cas d'erreurs.

```c
// Libraires
#include <signal.h>

// Prototype
void (*signal(int signum, void (*handler)(int)))(int);

// Exemple
if (signal(SIGTERM, &traitement) == SIG_ERR) {
	printf("Ne peut pas manipuler le signal\n");
	exit(EXIT_FAILURE);
}

void traitement(int signum) {
    printf ("On a recu une fleche SIGTERM\n");
    fflush(stdout);
}
```



## KILL (envoyer des flèches)

Cette fonction permets d'envoyer au processus identifié par pid la flèche signal. 

La fonction retourne 0 si tout à bien été et -1 en cas d'erreur.

La valeur de pid : 

* \> 0 cible le processus au pid indiqué
* =0 les processus du même groupe de pid
* =-1 tous les processus (seulement root à l'autorisation d'effectuer celà)
* <0 le groupe gid = abs(pid) 

```c
// Librairies
#include <sys/types.h>
#include <signal.h>

// Prototype
int kill(pid_t pid, int signal);

// Exemples
kill(getpid(), SIGSTOP);
/* auto-endormissement */
signal(SIGTSTP, traitement);
/* repositionnement */
```

## Gérer des traitements (exemple)

```c
#include <stdlib.h>
#include <signal.h>
#include <errno.h>
#include <unistd.h>
#include <stdio.h>

void traitement (int signum) {
    printf("Signal %d, d'ou ", signum);
    switch (signum) {
        case SIGTSTP : printf("le processus s’endort...\n");
            kill(getpid(), SIGSTOP);
            /* auto-endormissement */
            signal(SIGTSTP, traitement);
            /* repositionnement */
            printf("le processus est reveillé !\n");
            break;
        case SIGINT : case SIGTERM :
            printf("Fin du programme.\n");
            exit(EXIT_SUCCESS);
            break;
	}
}
int main(void) {
    signal(SIGTSTP, traitement); /* si on reçoit contrôle-Z */
    signal(SIGINT, traitement); /* si contrôle-C */
    signal(SIGTERM, traitement); /* si kill processus */
    // MON CODE
}
```

## Alarm 

Cette fonction envoie la flèche SIGALARM a un processus dans un délai fixé en secondes.

Dans le cas d'une alarme déjà présente, celle-ci est remplacée.

Un délai nul supprime l’alarme existante et renvoie le nombre de secondes restantes.

```c
// Librairies
#include < unistd.h>

// Prototype
long alarm(long delai);
```

## Pause 

Bloque le processus courant jusqu'à recevoir un signal

```c
// Librairies
#include < unistd.h>

//Prototype
int pause (void);
```



## Exemple du cours sur la gestion de 2 fils

### Enoncé

Écrire un programme où un processus père lance 2 fils ayant la même image que lui. Chaque processus commence par afficher un message de début et se termine par un message de fin. Après que chaque processus ait affiché son message de début selon l'ordre père – fils1 – fils2, les fils affichent un message personnel dix fois chacun. Les messages envoyés par les fils doivent apparaître en alternance (fils1, fils2, fils1...). Le premier message doit être envoyé par le fils2. Aucun processus ne peut se terminer avant que les 2 fils n'aient envoyé leur dernier message. Les messages de fin respectent l'ordre fils2 – fils1 – père. Utilisez SIGUSR1 pour la gestion des flèches. Le résultat attendu est présenté à la Figure 2.

### code

```c
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>
#include <string.h>

// déclaration des fonctions

// 1) gestion des processus
void pere(void);
void fils1(void);
void fils2(void);
// 2) gestion des signaux
void killReceiver(int signum);
void extendedPause(void);
//-----------------------------------------------------------------------------------------
// déclaration : variables globales
// données utilisables dans tous les processus créés pour ne pas devoir les transporter en
// paramètre de fonction.
//-----------------------------------------------------------------------------------------
// variable utilisée par plusieurs fonctions de manière asynchrone il ne faudra cependant
// pas oublier d'initialiser celle-ci dans chaque processus
int killReceived;
pid_t pidP, pidF1, pidF2;
//-----------------------------------------------------------------------------------------
// 1) Gestion des processus
//-----------------------------------------------------------------------------------------
int main (int ac, char **av) {
    // par réflexe et sécurité pour la gestion des kill/pause
    killReceived = 0;
    signal(SIGUSR1, killReceiver);
    pidP = getpid();
    printf("PID %d - Debut du pere\n", pidP);
    fflush(stdout);
    pere();
}
void pere(void) {
    int i, status;
    pid_t finishedPid;
    //-------------------------------------------------------------------------------------
    // phase de création des processus
    //-----------------------------------------------------------------------------------
    // création du fils 1
    if ((pidF1 = fork()) < 0) {
        perror("erreur creation du fils 1 !");
        exit(EXIT_FAILURE);
	}
    if (pidF1 == 0) {
    	fils1();
    }
    // attendre que la création et l'envoi du message de début du fils 1
    extendedPause();
    // création du fils 2
    if ((pidF2 = fork()) < 0) {
        perror("erreur creation du fils 4!");
        exit(EXIT_FAILURE);
    }
    if (pidF2 == 0) {
        fils2();
    }
    // attendre que la création et l'envoi du message de début du fils 2
    extendedPause();
    //-------------------------------------------------------------------------------------
    // partie principale
    //-------------------------------------------------------------------------------------
    for(i = 1; i <= 10; i++) {
    	kill(pidF2, SIGUSR1);
    	extendedPause();
    }
    //-------------------------------------------------------------------------------------
    // partie terminaison des processus
    //-------------------------------------------------------------------------------------
    // on demande au fils 2 d'afficher son message de fin et de se terminer
    kill(pidF2, SIGUSR1);
    // on attend la fin du fils 2
    finishedPid = wait(&status);
    if (finishedPid != pidF2) {
    	printf("===== OUPS ===== %d est mort alors qu'on "
     	"attendait la mort de %d\n", finishedPid, pidF2);
    }
    if (status != 0) {
    	printf("===== OUPS ===== %d est mort par accident "
     	"(status=%04x)\n", finishedPid, status);
    }
    // on demande au fils 1 d'afficher son message de fin et de se terminer
    kill(pidF1, SIGUSR1);
    // on attend la fin du fils 1
    finishedPid = wait(&status);
    if (finishedPid != pidF1) {
        printf("===== OUPS ===== %d est mort alors qu'on "
         "attendait la mort de %d\n", finishedPid, pidF1);
    }
    if (status != 0) {
        printf("===== OUPS ===== %d est mort par accident "
         "(status=%04x)\n", finishedPid, status);
    }
    // et on termine
    printf("PID %d - Fin du pere\n", pidP);
    exit(EXIT_SUCCESS);
    }
void fils1(void) {
    int i;
    // par reflexe et sécurité pour la gestion des kill/pause
    killReceived = 0;
    signal(SIGUSR1, killReceiver);
    pidF1 = getpid();
    //-------------------------------------------------------------------------------------
    // phase de création des processus
    //-------------------------------------------------------------------------------------
    printf("PID %d - Debut du fils 1 [PPID - %d]\n", pidF1, pidP);
    fflush(stdout);
    // prévient le père que le message de début a été affiché
    kill(pidP, SIGUSR1);
    //-------------------------------------------------------------------------------------
    // partie principale
    //-------------------------------------------------------------------------------------
    for(i = 1; i <= 10; i++) {
        extendedPause();
        printf("PID %d - Message du fils 1\n", pidF1);
        fflush(stdout);
        kill(pidP, SIGUSR1);
    }
    //--------------------------------------------------------------------------------------
    // partie terminaison des processus
    //--------------------------------------------------------------------------------------
    // on attend que le père confirme la fin du fils 2
    extendedPause();
    printf("PID %d - Fin du fils 1\n", pidF1);
    exit(EXIT_SUCCESS);
}
void fils2(void) {
    int i;
    // par reflexe et sécurité pour la gestion des kill/pause
    killReceived = 0;
    signal(SIGUSR1, killReceiver);
    pidF2 = getpid();
    //-------------------------------------------------------------------------------------
    // phase de création des processus
    //-------------------------------------------------------------------------------------
    printf("PID %d - Debut du fils 2 [PPID - %d]\n", pidF2, pidP);
    fflush(stdout) ;
    // signale au père que le message de début a été affiché
    kill(pidP, SIGUSR1);
    //--------------------------------------------------------------------------------------
    // partie principale
    //--------------------------------------------------------------------------------------
    for(i = 1; i <= 10; i++) {
        extendedPause();
        printf("PID %d - Message du fils 2\n", pidF2);
        fflush(stdout);
        kill(pidF1, SIGUSR1);
    }
    //--------------------------------------------------------------------------------------
    // partie terminaison des processus
    //--------------------------------------------------------------------------------------
    printf("PID %d - Fin du fils 2\n", pidF2);
    exit(EXIT_SUCCESS);
    }

    //-----------------------------------------------------------------------------------------
    // 2) gestion des signaux
    //-----------------------------------------------------------------------------------------
void killReceiver(int signum) {
    killReceived++;
}
void extendedPause(void) {
    if (killReceived == 0) {
        pause();
    }
    killReceived--;
} 
```

