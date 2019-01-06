# Introduction

Le cours est en 2 partie, chaque partie doit être réussite à 7/20 pour être valitdée  
Une interrogation est organisée, elle permets une dispense à 3/4 de l'examen mais elle doit être réussite à 12/20 ( une feuille A4 personnelle permise )

## 1. Comment définitir une probabilité ?

## Définition de Laplace

La définition de laplace est une version intuitive de ce que sont les probabilités. à savoir, la probabilité d'une occurence sur le total des occurences.

## Définition comme limite de fréquence

On peut aussi définir une probabilité comme la chance qu'un élément à de se voir produire si l'expérience est effectuée une infinité de fois.

## Lois de probabilités

$P(\phi) = 0$

$B  \subseteq  A \rightarrow P(A/B) = P(A)-P(B)$

$P(A \cup B) = P(A)+P(B)-P(A \cap B)$ : Relation de Boole

$0 \leq P(A) \leq 1$

## Probabilité conditionnelle

Probabilité de A sachant que B est réalisé : $$P(A|B) = \frac{P(A \cap B)} {P(B)}$$

P(A$\cap$B) = P(A|B).P(B)
P(A$\cap$B) = P(B|A).P(A)

## 5.3 Probabilités des causes (Théorème de Bayes)
*Une partition* : Quand la somme des probabilités vaut 1 et que les probabilités sont mutuelement exclusives.

Le cas d'une partition A,B et C avec une probabilité d'un événement D qui s'effectue dans les univers A,B,C  

P(D) = P(D$\cap$A) + P(D$\cap$B) + P(D$\cap$C) = P(A).P(D|A) + P(B).P(D|B) + P(C).P(D|C)

> Nota-bene : pour effectuer un tel calcul il peut parfois être plus simple de résoudre un exercice en réalisant un *arbre des probabilités*

> Nota-bene : Si dans un exercice, on utilise "Au moins un", c'est équivalent à dire que "tout sauf rien" $\rightarrow$ 1 - Probabilité de ne rien avoir

## 5.4 Evénements statistiquement indépendants

Deux événements sont statstiquements indépendants ssi : P(A|B) = P(A)

> Nota-bene : Une indépendance statistique n'est pas forcément vraie dans le monde réele. car la statistique est calculée sur un échantillon qui peut ne pas être représentatif

# Définitions

* **Une expérience aléatoire** ( =épreuve ) : expérience ou le hazard intervient, son issue n'est donc pas connue.  
* **L'espace d'échantillonnage** : L'ensemble de tous les issues possibles d'une expérience aléatoire. notée *$\Omega$*.   
* **$\Omega$** : ensemble des possibilités de résultats.  
* **événement** : sous ensemble de $\Omega$  
* **$\phi$** : événement impossible


* **Variable aléatoire** : quantité qui varie enfonction duè hasard. Une variable aléatoire est en général notée X. 
