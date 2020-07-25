# Chapitre 6 : Mémoire Partagée

Le but de ce chapitre est d'aborder l'échange d'informations entre processus.

La première méthode est de communiquer au moyen de fichiers.

Dans le cas de processus dits "classiques", l'espace mémoire n'est pas partagé. On utilise alors les segments de mémoire partagés. Dans le cas de processus légers (threads) c'est le cas.

## IPC (Inter Process Communication)

Il existe 3 méthodes pour faire communiquer des processus sans lien de parenté : 

* Les messages : permets aux processus d'envoyer des messages avec gestion de la file d'attente des messages. 
* Les segments de mémoire partagée : ces segments permettent à plusieurs processus de partager un segment de mémoire dans lequel ils peuvent lire ou écrire des données.
* Les sémaphores : permettent à plusieurs processus de se synchroniser (pour éviter les sections critiques) et de communiquer des informations sur l'utilisation des ressources.

### Ftok

Permet de générer une clé en utilisant le numéro identifiant (inode) du fichier (ou répertoire) indiqué par pathname (qui doit exister et être accessible), et les huit bits de poids faible de project (qui doit être un caractère non nul) pour créer la clé d'un IPC. 

Cette clé, de type key_t (type défini dans sys/types.h) est ensuite utilisable dans les appels système shmget, semget ou msgget, pour récupérer le numéro identifiant de l'IPC en question.

```c
// Librairies
#include <sys/ipc.h>
//Prototype 
ckey_t ftok(char *pathname, char project);
```

### Commande shell ipcs

```
ipcs
```

Cette commande liste l'ensemble des ipc présent sur un système

* **-s** pour afficher uniquement les ensembles de sémaphore 
* **-m** pour afficher uniquement les segments de mémoire partagée
* **-q** pour afficher uniquement les messages
* **-u UTILISATEUR** pour afficher les ICP lié à un utilisateur (créateur)

### Commande pour retirer un ipc

Détruire un ipc dont on précise le pid

```
ipcrm [ -M key | -m id | -Q key | -q id | -S key | -s id ] ...
```

* **-M key** Supprimer le segment de mémoire partagée créé avec key après son dernier détachement 
* **-m id** Supprimer le segment de mémoire partagée identifié par id après son dernier détachement 
* **-Q key** Supprimer la file de messages créée avec key 
* **-q id** Supprimer la file de messages identifiée par id 
* **-S key** Supprimer le jeu de sémaphores créé avec key 
* **-s id** Supprimer le jeu de sémaphores identifié par id

## Création et récupération d'un segment de mémoire partagée

La création d'un segment de mémoire partagée se fait par un seul processus en utilisant une clé. La création alloue l'emplacement mémoire nécessaire, et retourne un numéro identifiant de cet emplacement mémoire. Les autres processus récupéreront ensuite l'identificateur du segment créé grâce à la clé. 

**Dans les deux cas (création ou récupération), on utilise l'appel système shmget.** 

```c
// Librairie 
#include <sys/ipc.h>
#include <sys/shm.h>
// Prototype
int shmget(key_t key, size_t size, int shmflg); 
```

Donne le descripteur du segment ayant la clé key. 

key est la clé (de préférence générée par ftok) qui est attachée (lors de la création) au segment de mémoire partagé. On peut utiliser IPC_PRIVATE si on ne veut pas associer une clé particulière au segment. 

size est le nombre d'octets du segment (ce nombre peut-être connu à l'aide de la fonction sizeof). 

shmflg est une liste d'arguments séparés par des '|' : 

* Si shmflg est égal à 0, il s'agit d'une récupération d'un segment existant 
* Si shmflg est égal à IPC_CREAT|IPC_EXCL|mode, il s'agit de la création d'un nouveau segment (IPC_CREAT|IPC_EXCL permet de garantir l'échec de l'appel si le segment existe déjà, mode est un nombre octal indiquant les permissions)

 Un nouveau segment (de taille size) est créé si key est IPC_PRIVATE, ou bien si les indicateurs de shmflg contiennent IPC_CREAT. 

![](C:\Users\Antoine Lambert\Documents\Henallux_notes\OS\notes\img\Capture.PNG)

### Attachement d'un segment de mémoire partagée

Pour qu'un processus puisse utiliser un segment de mémoire partagée, ils doivent l'ajouter à leur tas

```c
// Librairie 
#include <sys/ipc.h>
#include <sys/shm.h>
//Prototype 
void * shmat(int shmid, const void *shmaddr, int shmflg);

```

Attache le segment de mémoire partagée identifié par shmid au segment de données du processus appelant. 

shmaddr permet de préciser l'adresse physique à laquelle on veut réaliser l'attachement... En pratique, on n'utilisera pas cette possibilité, et on mettra shmaddr à NULL pour indiquer au système qu'il doit se charger de trouver cette adresse lui-même.

shmflg précise ce que le processus va faire dans ce segment de mémoire 

* **SHM_RDONLY** si le processus ne fait que lire
* **SHM_W** si le processus ne fait qu'écrire,
* **SHM_R | SHM_W **si le processus lit et écrit.

Il retourne l'adresse du premier octet du segment partagé. Cette adresse doit être stockée dans une variable du même type que celui utilisé lors de la création du segment... Le processus pourra alors utiliser le segment partagé, en passant par ce pointeur, comme s'il avait créé dans sa propre mémoire un objet de ce type.

> Pour faire les choses proprement, il faudra convertir la valeur retournée par shmat (qui est un void*), en une variable de type pointeur sur T, où T est le type du segment de mémoire partagée.

## Détachement  d'un segment de mémoire partagée pour un processus

```c
// Librairie 
#include <sys/ipc.h>
#include <sys/shm.h>

// Prototype 
int shmdt(const void *shmaddr);
```

Détache le segment de mémoire partagée situé à l'adresse shmaddr.

 Le segment doit être effectivement attaché, et l'adresse shmaddr doit être celle renvoyée précédemment par shmat. 

Concrètement, cela revient à supprimer le pointeur vers la mémoire partagée de la zone mémoire du processus appelant (son tas).

> Si un processus "oublie" de détacher ses segments de mémoire partagée, le détachement sera automatiquement fait par le système à la mort du processus.

## Contrôle d'un segment de mémoire partagée

Pour obtenir des informations sur un segment de mémoire partagée, ou pour le détruire, on utilise l'appel système shmctl.

```c
// Librairie 
#include <sys/ipc.h>
#include <sys/shm.h>

// Prototype 
int shmctl(int shmid, int cmd, struct shmid_ds *buf);
```

Permet diverses opérations, dont la destruction d’une mémoire partagée.

cmd peut prendre une des 3 valeurs suivantes : IPC_STAT, IPC_SET ou IPC_RMID

* Si cmd = IPC STAT, alors on récupéré dans *buf les informations concernant le segment identifié par shmid, où *buf doit être une structure du type shmid_ds décrite ci-dessous. 
* Si cmd = IPC_SET, alors les changements que l'utilisateur a apportés dans les champs uid, gid, ou mode de la structure ipc_perms seront appliquées. 
* Si cmd = IPC_RMID, alors le segment partagé sera marqué comme étant "prêt pour la destruction". Il sera détruit effectivement après le dernier détachement (quand le membre shm_nattch de la structure shmid_ds associée vaudra zéro). L'appelant doit être le créateur du segment, son propriétaire, ou le super-utilisateur.

> ```c
> struct shmid_ds {
>     struct ipc_perm shm_perm; /* Permissions d'accés */
>     int shm_segsz; /* Taille segment en octets */
>     time_t shm_time; /* Heure dernier attachement */
>     time_t shm_dtime; /* Heure dernier détachement */
>     time_t shm_ctime; /* Heure dernier changement */
>     unsigned short shm_cpid; /* PID du créateur */
>     unsigned short shm_lpid; /* PID du dernier opérateur */
>     short shm_nattch; /* Nombre d'attachements */
> };
> ```
>
> ```c
> struct ipc_perm {
>     key_t key;
>     ushort uid; /* UID et GID effectifs du propriétaire */
>     ushort gid;
>     ushort cuid; /* UID et GID effectif du créateur */
>     ushort cgid;
>     ushort mode; /* Mode d'accès sur 9 bits de poids faible */
>     ushort seq; /* Numéro de séquence */
> };
> ```

exemples dans les pdfs du cours

