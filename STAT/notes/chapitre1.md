
# Chapitre 1 : Eléments de Probabilité
## Définitions 

**Expérience aléatoire** : est une expérience où le hasard intervient.   
**Espace d'échantillonnage ($\Omega$)** : l'ensemble de toute les issues possibles d'une expérience aléatoire.  
**Evénement** : tout sous ensemble de $\Omega$.  
**Evénement Impossible($\Phi$)** : évémenement qui ne se produira jamais.

## Lois de probabilités

$P(\phi) = 0$

$P(\Omega) = 1$

$B  \subseteq  A \rightarrow P(A/B) = P(A)-P(B)$

$P(A \cup B) = P(A)+P(B)-P(A \cap B)$ : Relation de Boole

$0 \leq P(A) \leq 1$

$\overline{A\cap B} = \overline{A} \cup \overline{B}$

$A \textbackslash B = A \cap \overline{B}$

$0 \leq Pr(A) \leq 1$

$Pr(\overline{A}) = 1-P(A)$

## Probabilité conditionnellere

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


# Chapitre 2: 