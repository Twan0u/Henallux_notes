
# Chapitre 1 : Eléments de Probabilité
## Définitions 

**Expérience aléatoire** : est une expérience où le hasard intervient.   

**Espace d'échantillonnage ($\Omega$)** : l'ensemble de toute les issues possibles d'une expérience aléatoire.  

**Evénement** : tout sous-ensemble de $\Omega$.  

**Evénement Impossible($\Phi$)** : événement qui ne se produira jamais.

## Lois de probabilités 

$P(\phi) = 0$

$P(\Omega) = 1$

$B  \subseteq  A \rightarrow P(A/B) = P(A)-P(B)$

$P(A \cup B) = P(A)+P(B)-P(A \cap B)$ : Relation de Boole

$0 \leq P(A) \leq 1$

$\overline{A\cap B} = \overline{A} \cup \overline{B}$

$A$  \ $B = A \cap \overline{B}$

$0 \leq Pr(A) \leq 1$

$Pr(\overline{A}) = 1-P(A)$

## Probabilité conditionnelle

Probabilité de A sachant que B est réalisé : $$P(A|B) = \frac{P(A \cap B)} {P(B)}$$

P(A$\cap$B) = P(A|B).P(B)   

P(A$\cap$B) = P(B|A).P(A)


> Nota-bene : Si dans un exercice, on utilise "Au moins un", c'est équivalent à dire que "tout sauf rien" $\rightarrow$ 1 - Probabilité de ne rien avoir

## 5.3 Probabilités des causes (Théorème de Bayes)

Formule de Bayes:
$$Pr(B|A) = \frac{Pr(A|B).Pr(B)}{Pr(A)}$$

**Une partition** : Quand la somme des probabilités vaut 1 et que les probabilités sont mutuelement exclusives.

$$Pr(A)=\sum_{i=1}^n Pr(A|B_i).Pr(B_i)$$

Formule de Bayes "améliorée":
$$Pr(B_k|A)=\frac{Pr(A|B_k).Pr(B_k)}{Pr(A)}=\frac{Pr(A|B_k).Pr(B_k)}{\sum_{i=1}^n Pr(A|B_i).Pr(B_i)}$$

### Le filtre Anti-Spam

Les filtres anti-spam des boites d'e-mail fonctionnent sur le principe que plus un mot contenu dans le mail à tendance à se retrouver dans spam au plus, si le mot se trouve dans ce mail, ce mot à tendance à être un spam.



$$Pr(S|M)= \frac{Pr(M|S)*Pr(S)}{Pr(M|S)*Pr(S)+Pr(M|H)*Pr(H)}$$






## Evénements statistiquement indépendants 

Les deux équations suivantes ne sont valables que si A et B sont *statistquement indépendants*

$Pr(A|B)=Pr(A)$  
$Pr(A\cap B)=Pr(A).Pr(B)$


## 5.4 Evénements statistiquement indépendants

Deux événements sont statstiquements indépendants ssi : P(A|B) = P(A)

> Nota-bene : Une indépendance statistique n'est pas forcément vraie dans le monde réele. car la statistique est calculée sur un échantillon qui peut ne pas être représentatif

## 

