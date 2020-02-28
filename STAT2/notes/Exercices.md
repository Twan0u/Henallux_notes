

# Exercices 

## Exercice du Cours du 11/02/20 

On désire faire une estimation ponctuelle, pour une population constituée de 1000 familles, du pourcentage de familles nombreuses, du nombre moyen d'enfants par famille et de et de la variance du nombre d'enfants. *Une famille est considérée comme nombreuse si il y a trois enfants ou plus.*

Pour cela on interroge 100 familles différentes. Les résultats obtenus sont repris dans le tableau ci-dessous.

### Résolution

* N = 1000
* n = 100
* p = Pourcentage de familles nombreuses = ?
* m = nombre moyen d'enfant par famille = ?
* /sigma = variance du nombre d'enfant = ?

| Xi (nb d'enfants) | ri   | ri.xi | ri.xi^2^ |
| ----------------- | ---- | ----- | -------- |
| 0                 | 12   | 0     | 0        |
| 1                 | 15   | 14    | 15       |
| 2                 | 29   | 58    | 116      |
| 3                 | 22   | 66    | 198      |
| 4                 | 15   | 60    | 240      |
| 5                 | 7    | 35    | 175      |
| Total             | 100  | 234   | 744      |

$$
f=\frac{22+15+7}{100}=44%
$$

$$
\overline{x} = \frac{\sum r_i.x_i}{n}=\frac{234}{100}=2,34
$$

==2,34== enfant est une estimation ponctuelle de m

#### Non exhaustif 

$$
S_{n-1}^{2} = \frac{n}{n-1}.S^2_n
$$

$$
S^2_n = \overline{x^2}-\overline{x}^2 = 7,44-2,34^2= 1,9644(enfant^2)
$$

$$
S_n=1,4016 (enfant)
$$

$$
S_{n-1}^{2}=\frac{100}{99}.1,9644=1,9842
$$

==1,9842== est un estimateur ponctuel du paramètre $\sigma^2$

> La variance corrigée est intéressante dans le cas de petits échantillons 

#### Exhaustif

$$
(1-\frac{1}{N})*S_{n-1}^2
$$


$$
(1-1/100).1,9842 = 1,9822
$$

La réponse est donc de ==1,9822==.

## Exercice 1 

Afin de connaitre la proportion d'adultes pratiquant une langue étrangère, nous avons effectué un sondage portant sur 1000 adultes choisis au hasard. Nous avons constaté que 385 d'entre eux parlent couramment au moins une langue étrangère. 

1. Présentez un intervalle de confiance pour la proportion évoquée ci-dessus au niveau de confiance 0.95.
2. Quelle devrait être la taille de l'échantillon pour que la marge d'erreur ne dépasse pas les 2% et que le résultat soit fiable à 99%

### Résolution

Les données fournies par l'énoncé sont : 

* n = 1000
* f = 385/1000 = 38,5%

#### Sous-question 1

On recherche un intervalle de confiance avec un $\alpha=5\%$. 

L'équation de l'intervalle de confiance est donc : 
$$
Pr(f-1.96.\sqrt{\frac{p.(1-p)}{n}}\leq p\leq f+1.96.\sqrt{\frac{p.(1-p)}{n}})=0.95
$$
 On recherche la solution à : $1.96.\sqrt{\frac{p.(1-p)}{n}}$

On remplace dans l'équation et on trouve que : $1.96.\sqrt{\frac{0,385.(1-0,383)}{1000}}=0,0302$

> 0,0302 = 3,02% représente l'amplitude de l'intervalle de confiance (Marge d'erreur ME)

On mets le résultat dans l'équation de l'intervalle de confiance : 
$$
Pr(f-0,0302\leq p\leq f+0,0302)=0.95
$$

$$
Pr(0,385-0,0302\leq p\leq 0,385+0,0302)=0.95
$$

On obtiens donc un intervalle de confiance à $5\%$ de ==$[35,48\% ; 41,52\% ]$==.

#### Sous-question 2

On recherche une ME = 0,02. 
$$
ME = 2,58.\sqrt{\frac{0,385.0,615}{n}}= 0,02\\
0,02^2= 2,58^2.\left( \sqrt{\frac{0,385.0,615}{n}}\right)^2\\
\frac{0,02^2}{2,575^2}=\frac{0,385.0,615}{n}\\
n.0,02^2 = 2,575^2.0,385.0,615\\
n = \frac{2,575^2.0,385.0,615}{0,02^2}\\
n \approx 3924,92
$$
Il faut donc ==3925== personnes interrogées pour obtenir une marge d'erreur de 2% et un $\alpha =1\%$



## Exercice 2

Chaque bouteille d'un échantillon aléatoire de 65 bouteilles en plastique de 1,5 litre d'eau a été pesée et les résultats sont les suivants : 
$$
\overline{x}=1,5\ kg \ \ et \ \sum_i (x_i-\overline{x})=0,44 \ kg^2
$$
Sur base de ces résultats un intervalle de confiance pour le poids moyen d'une bouteille d'eau avec un niveau d'incertitude de 5%.

### Résolution

$$
S_n^2 = 1/n\sum(x_i-\overline{x})^2 = 0,44/65 = 0,00676923\\
S_{n-1}^2= \frac{n}{n-1}.\sqrt{\frac{\sigma^2}{n}}=\frac{0,44}{65}=0,006875\\
ME= 1,96.\sqrt{\frac{0,006875}{65}}= 0,02016
$$

On obtiens donc un intervalle de confiance de  : ==$\left[1,47984kg;1,52016kg\right]$==

On a donc une marge d'erreur de 20 grammes. 

## ==Exercice 3==

Durant la saison d'hiver, les ventes journalières de pommes de terre chez un grossiste suivent une loi ...



### Résolution 

#### Sous-question 1

 
$$
ME = 1,645.\frac{\sigma}{\sqrt{n}}\\
ME = 1,645.\frac{2,2}{\sqrt50} =0,51....
$$
L'intervalle de confiance est ==$IC_{10\%}\left[13,99\%;15,01\%\right]$== tonnes

#### Sous-question 2

On recherche un $IC_{5\%}$ sachant que $\alpha =5\%$.

Notre ME = 0,5 tonnes
$$
ME = O,5= 1,96.\frac{2,2}{\sqrt{n}}
$$






## ==Exercice 4==

??Estimation ponctuelle de sigma 243,746

## Exercice 5



## Exercice 6









[TOC]


