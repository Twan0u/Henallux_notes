# Probabilité et Statistiques
## Chapitre 0 : Introduction

Le cours est en 2 partie, chaque partie doit être réussite à 7/20 pour être valitdée  
Une interrogation est organisée, elle permets une dispense à 3/4 de l'examen mais elle doit être réussite à 12/20 ( une feuille A4 personnelle permise )

## Chapitre 1 : Les bases 

### Définitions

**Une expérience aléatoire** ( =épreuve ) : épreuve ou le hazard intervient, son issue n'est donc pas connue.  
**$\Omega$** : ensemble des possibilités de résultats.  
**événement** : sous ensemble de $\Omega$  
**$\phi$** : événement impossible 

### Définition de Laplace
Probabilité de l'occurence / probabilité du total des occurences

### Lois de probabilités interressantes

$A\cap B=\phi\rightarrow P(A\cup B) = P(A)+P(B)$  

$P(\phi) = 0$

$B incl A \rightarrow P(A/B) = P(A)-P(B)$

$P(A \cup B) = P(A)+P(B)-P(A \cap B)$ : Relation de Boole

$0<=P(A)<=1$ 

### Probabilité conditionnelle 

Probabilité de A sachant que B est réalisé : $$P(A|B) = \frac{P(A \cap B)} {P(B)}$$

P(A$\cap$B) = P(A|B).P(B)
P(A$\cap$B) = P(B|A).P(A)

### 5.3 Probabilités des causes (Théorème de Bayes)
*Une partition* : Quand la somme des probabilités vaut 1 et que les probabilités sont mutuelement exclusives.
  
Le cas d'une partition A,B et C avec une probabilité d'un événement D qui s'effectue dans les univers A,B,C  

P(D) = P(D$\cap$A) + P(D$\cap$B) + P(D$\cap$C) = P(A).P(D|A) + P(B).P(D|B) + P(C).P(D|C)

> Nota-bene : pour effectuer un tel calcul il peut parfois être plus simple de résoudre un exercice en réalisant un *arbre des probabilités* 

> Nota-bene : Si dans un exercice, on utilise "Au moins un", c'est équivalent à dire que "tout sauf rien" $\rightarrow$ 1 - Probabilité de ne rien avoir

### 5.4 Evénements statistiquement indépendants

Deux événements sont statstiquements indépendants ssi : P(A|B) = P(A)

> Nota-bene : Une indépendance statistique n'est pas forcément vraie dans le monde réele. car la statistique est calculée sur un échantillon qui peut ne pas être représentatif







