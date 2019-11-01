
## 2.Création de processus

### Rappels sur les librairies 
La pluspart des librairies sont des bibliothèques de fonctions ( ex: stdlib, stdio, ... ) 

### mode noyau et mode utilisateur
Pour communiquer avec le noyau, il existe deux modes de fonctionnement ( le mode Noyau et le mode utilisateur )

> Un appel système consiste en une interruption logicielle (system trap) qui a pour rôle de changer de mode d'exécution pour passer du mode utilisateur au mode noyau, de récupérer les
paramètres et de vérifier la validité de l'appel, de lancer l'exécution de la fonction demandée, de récupérer la (les) valeur(s) de retour et de retourner au programme appelant en passant à nouveau au mode utilisateur.

Les appels systèmes ne peuvent êtres effectuées que par le biais de procédures spécifiques. Certains appels ne peuvent être faits que par des programmes lancés par *root*. 

### Table des Processus 

Une **table des Processus** est une liste de liens vers des **blocs de contrôles de processus**(bcp). On associe à chaque processus un bcp. 

Un bcp contient l'**espace d'adressage** de l'application (segment text = code de l'app, var. globales, variables locales, pile et stack), **le contexte** (ensemble des registres processeur ( ex : next instruction)) et **autres informations**.

### Création de processus

Les appels systèmes permettent notamment la création et l'arrêt des processus. Un processus père peut créer des processus fils. Pour créer un processus on utilise **fork**.

> nb Librairie : unistd.h

Crée un nouveau processus (fils) semblable au processus courant (père). Le contexte des deux processus est exactement le même mis à part leur identifiant (pid) et l'identifiant de leur père respectif (ppid). La valeur renvoyée n'est pas la même pour le fils et pour le père, ce qui permet de les différencier. Trois cas sont à envisager :

1. le processus père, celui qui fait le fork , renvoie le numéro du fils (pid).
2. le processus fils qui est créé commence son exécution dès la fin du fork et renvoie 0.
3. en cas d'erreur, le processus fils n'est pas créé et le père reçoit une valeur négative.

``` c
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

void fils1 (void) {
	printf("Debut du Fils 1\n");
	// Suite du Fils 1
	printf("Fin du Fils 1\n");
	exit(EXIT_SUCCESS);
}
int main (void) {
	int pid1;
	printf("Debut du Pere\n");
	pid1 = fork();
	if (pid1 <0) { //
		perror("Erreur lors de la creation (fork) du Fils 1");
		exit(EXIT_FAILURE);
	} // else inutile car exit
	if (pid1 == 0) {
		fils1();
	}
    //suite du pere
	printf("Fin du Pere\n");
	exit(EXIT_SUCCESS);
}
```

> toute modification des variable avant le fork affecte le père et le fils. Tandis que toute moification postérieur au fork sera répercuté uniquement sur l'espace d'adressage propre à chaque processus.

### Perror 

librairie : unistd.h

Affiche un message sur la sortie d'erreur standard ( stderr ), décrivant la dernière erreur rencontrée durant un appel système ou une fonction de bibliothèque. Si str n'est pas NULL et si *str n'est pas un octet nul, la chaine de caractères str est imprimée, suivie de ': 'ou d'un blanc, puis du message correspondant à l'erreur, et enfin d'un saut de ligne.

``` c 
perror ("fopen a genere l'erreur suivante");
```

### Exit 

livrairie : stdlib.h

Termine l'exécution du processus en renvoyant au père la valeur passée en paramètre(0 ok, autre = bad).
Cet appel système a les effets suivants :

* tous les file descriptors appartenant au processus en question sont fermées.
* les processus fils du processus terminé deviennent zombies et sont adoptés par le processus init.
* le processus père reçoit un signal SIGCHLD.


### getpid et getppid

librairie : stdlib.h

``` c
pid_t getpid (void);
```

Retourne l'identifiant du processus appelant. Cette Fonction réussit toujours. 

``` c
pid_t getppid (void); 
```

Retourne l'identifiant du processus père qui l'appelle (foncion réussit toujours)

### wait 

librairie : stdlib;

``` c 
pid_t wait (int * status); 
```

permets à un programme père d'attendre qu'un processus fils se termine. Status est utilisé pour réccupérer la valeur de fin du processus fils qui vient de se terminer. 

> attention, un fils qui se termine mais qui n'a pas été attendu devient un zombie. lors de sa zombification, le noyau conserve des informations minimales pour permettre au pêre de l'attendre plus tard et obtenir les informations sur le fils. Tant que le zombie n'est pas effacé du système par un wait, il prendra un emplacement dans la table des processus et si cette table est pleine, il sera impossible de créer de nouveaux processus.

### sleep

librairie : unistd.h 

``` c
void sleep(int time); 
```

force un processus à s'endormir pour time secondes. 

### Effectuer une commande shell 

librairie : stdlib.h

``` c 
int system (const char * cmd);
```

exemple : 

``` c 
reponse = system("ls -l");
```
Permet de lancer une ligne de commande ( sh ) depuis un programme.
En réalité, un processus fils est créé, exécutant sh avec comme entrée la commande cmd passée en argument.
Cette fonction fait donc un fork suivi d'un exec dans la partie fils. Le père fait quant à lui un wait et renvoie la valeur de l'exit status du fils.

> Stdout : utilise un buffer qui affiche quand : une ligne, flush, buffer de 1024 bytes plein. donc si deux processus se partagent la sortie std, il peut y avoir des collisions 

