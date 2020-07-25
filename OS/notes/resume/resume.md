# Comment Réussir OS_LABO ?

## La compilation de votre programme

On utilise le compilateur GCC comme suit : 

```shell
gcc NOM_DE_MON_PROGRAMME.c -O NOM_DU_FICHIER_EXECUTABLE
```

On peut ensuite exécuter le programme à l'aide d'un ./ comme suit : 

```bash
./NOM_DU_FICHIER_EXECUTABLE
```

## Fork 

Dans le cas d'un fork, le processus père se recopie et crée un processus fils. ce dernier sera identique au père au pid près. voici un exemple de code : 

```c
//#include <unistd.h>
//#include <stdio.h>
//#include <stdlib.h>

void fils1 (void) {
	printf("Debut du Fils 1\n");
	// Suite du Fils 1
	printf("Fin du Fils 1\n");
	exit(EXIT_SUCCESS); // exit retourne sa valeur au processus père (ici success => 0)
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

## getpid et getppid

librairie : stdlib.h

``` c
pid_t getpid (void);
```

Retourne l'identifiant du processus appelant. Cette Fonction réussit toujours. 

``` c
pid_t getppid (void); 
```

Retourne l'identifiant du processus père qui l'appelle (fonctions réussit toujours)

### sleep

librairie : unistd.h 

``` c
void sleep(int time); 
```

force un processus à s'endormir pour time secondes. 

### wait 

librairie : stdlib;

``` c 
pid_t wait (int * status); 
```

permets à un programme père d'attendre qu'un processus fils se termine. Status est utilisé pour récupérer la valeur de fin du processus fils qui vient de se terminer. 

> attention, un fils qui se termine mais qui n'a pas été attendu devient un **zombie**. lors de sa zombification, le noyau conserve des informations minimales pour permettre au père de l'attendre plus tard et obtenir les informations sur le fils. Tant que le zombie n'est pas effacé du système par un wait(accusé de réception du père), il prendra un emplacement dans la table des processus et si cette table est pleine, il sera impossible de créer de nouveaux processus.

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