

# Exercices 

## Exercice du Cours du 11/02/20 

On désire faire une estimation ponctuelle, pour une population constituée de 1000 familles, du pourcentage de familles nombreuses, du nombre moyen d'enfants par famille et de et de la variance du nombre d'enfants. *Une famille est considérée comme nombreuse si il y a trois enfants ou plus.*

Pour cela on interroge 100 familles différentes. Les résultats obtenus sont repris dans le tableau ci-dessous.

### Résolution

* N = 1000
* n = 100
* p = Pourcentage de familles nombreuses = ?
* m = nombre moyen d'enfant par famille = ?
* $$\sigma$$ = variance du nombre d'enfant = ?

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

### Enoncé

Afin de connaitre la proportion d'adultes pratiquant une langue étrangère, nous avons effectué un sondage portant sur 1000 adultes choisis au hasard. Nous avons constaté que 385 d'entre eux parlent couramment au moins une langue étrangère. 

1. Présentez un intervalle de confiance pour la proportion évoquée ci-dessus au niveau de confiance 0.95.

2. Quelle devrait être la taille de l'échantillon pour que la marge d'erreur ne dépasse pas les 2% et que le résultat soit fiable à 99%

   

### Informations

* $n = 1000$

* $f = 385/1000 = 38,5\%$

  

### Sous-question 1

#### Que recherche-t-on ?

On recherche l'intervalle de confiance de la proportion. 

#### Informations supplémentaires

* $niveau\ de\ confiance = 0,95$

#### Formules utilisées

* Le niveau de confiance vaut :$1-\alpha$ 
* L'équation de l'intervalle de confiance d'une proportion :  $Pr\{f-a.\sqrt{\frac{p.(1-p)}{n}}\leq p\leq f+a.\sqrt{\frac{p.(1-p)}{n}}\}=1-\alpha$
* Formule de Laplace (recherche dans le tableau) : $G(a)= 1 - \frac{\alpha}{2}$

> Attention à ne pas se tromper entre $a$ et $\alpha$ 

#### Résolution

On recherche donc l'intervalle de confiance suivant : 
$$
Pr\{f-a.\sqrt{\frac{p.(1-p)}{n}}\leq p\leq f+a.\sqrt{\frac{p.(1-p)}{n}}\}=1-\alpha
$$
On va débuter par rechercher a. Il nous faut pour celà $\alpha$ que l'on  peut facilement calculer à l'aide du niveau de confiance
$$
 \alpha = 0.05
$$
On peut ensuite utilise $\alpha$ pour déduire a
$$
G(a)= 1 - \frac{\alpha}{2}\\
G(a)= 1 - \frac{0.05}{2}\\
G(a)= 0,975\\
a = 1.96
$$
L'équation de l'intervalle de confiance devient donc : 
$$
Pr(f-1.96.\sqrt{\frac{p.(1-p)}{n}}\leq p\leq f+1.96.\sqrt{\frac{p.(1-p)}{n}})=0.95
$$
On recherche la solution à : $1.96.\sqrt{\frac{p.(1-p)}{n}}$

On remplace p dans l'équation par son estimation ponctuelle et on trouve que : $1.96.\sqrt{\frac{0,385.(1-0,383)}{1000}}=0,0302$

> 0,0302 = 3,02% représente l'amplitude de l'intervalle de confiance (Marge d'erreur ME)

On mets le résultat dans l'équation de l'intervalle de confiance : 
$$
Pr(f-0,0302\leq p\leq f+0,0302)=0.95
$$

$$
Pr(0,385-0,0302\leq p\leq 0,385+0,0302)=0.95
$$

#### Réponse

On obtiens donc un intervalle de confiance à $5\%$ suivant : $[35,48\% ; 41,52\% ]$



### Sous-question 2

On recherche une ME = 0,02. 

si ME = 0,02--> $\alpha = \frac{ME}{2} \rightarrow \alpha = 0,01$

La fonction de la marge d'erreur d'un intervalle de confiance d'une proportion vaut : $a.\sqrt{\frac{p.(1-p)}{n}}$ on recherche n et on peut remplacer p par son estimation ponctuelle f.

Le $a$ est la valeur dans la table de gauss correspondant à ($1-\frac{\alpha}{2}$)=> ($1-0.05$) on recherche donc la valeur $0,995$ dans la table de gauss. 

> la valeur n'existe pas directement dans la table de gauss mais on peut en déduire qu'elle se situe entre 2.57 et 2.58 (nous allons donc utiliser la valeur 2.58 pour simplifier)


$$
ME = 0,02 = 2,58.\sqrt{\frac{0,385.0,615}{n}}\\
0,02^2= 2,58^2.\left( \sqrt{\frac{0,385.0,615}{n}}\right)^2\\
\frac{0,02^2}{2,58^2}=\frac{0,385.0,615}{n}\\
n.0,02^2 = 2,58^2.0,385.0,615\\
n = \frac{2,58^2.0,385.0,615}{0,02^2}\\
n \approx 3940,1727
$$
Il faut donc plus ou moins 3940 personnes interrogées pour obtenir une marge d'erreur de 2% et un $\alpha =1\%$.

##### Précision

Si l'on souhaite être plus précis dans notre calcul, nous pouvons tenter de prendre une valeur un peu plus précise pour $a$.

> Nous savons déjà que la valeur de a se situe entre 2.57 et 2.58. Les valeur dans la table pour ces 2 $a$ sont les suivantes : 0.99492 et 0.99506. 
>
> nous pouvons effectuer une interpolation linéaire pour trouver une valeur plus précise de a. 
>
> La formule est la suivante  :  $a \approx g^- + \frac{a-a^-}{a^+ - a^-}.(g^+ -g^-) = g$
>
> $a \approx 0.99492 + \frac{a-2.57}{2.58 - 2.57}.(0.99506 - 0.99492) = 0.995$
>
> $a \approx  \frac{a-2.57}{2.58 - 2.57} =\frac{0.995- 0.99492}{(0.99506 - 0.99492) } $
>
> $a \approx  \frac{a-2.57}{2.58 - 2.57} =\frac{0,00008}{0.00014} $
>
> $a \approx  \frac{a-2.57}{0.01} = 0.57142857142$
>
> $a \approx a-2.57 = (0.01).(0.57142857142) $
>
> $a \approx a = 0.00571428571 + 2.57 $
>
> $a \approx 2.57571428571 $
>
> $a \approx 2.5757 $

$$
ME = 0,02 = 2.5757.\sqrt{\frac{0,385.0,615}{n}}\\
0,02^2= 2.5757^2.\left( \sqrt{\frac{0,385.0,615}{n}}\right)^2\\
\frac{0,02^2}{2,5757^2}=\frac{0,385.0,615}{n}\\
n.0,02^2 = 2.5757^2.0,385.0,615\\
n = \frac{2.5757^2.0,385.0,615}{0,02^2}\\
n \approx 3927.0498 \approx 3927.05
$$

## Exercice 2

### Enoncé

Chaque bouteille d'un échantillon aléatoire de 65 bouteilles en plastique de 1,5 litre d'eau a été pesée et les résultats sont les suivants :
$$
\overline{x}=1,5\ kg \ \ et \ \sum_i (x_i-\overline{x})=0,44 \ kg^2
$$
Sur base de ces résultats, présentez un intervalle de confiance pour le poids moyen d'une bouteille d'eau avec un niveau d'incertitude de 5%.



### Informations

Nous avons les informations suivantes : 

* $\overline{x}=1,5\ kg$ 
* $\sum_i (x_i-\overline{x})=0,44 \ kg^2$
* $n=65$
* $\alpha = 0,05$



### Que recherche-t-on ?

On recherche l'intervalle de confiance du poids moyen d'une bouteille d'eau 



### Formules utilisées

* La formule de l'intervalle de confiance d'une moyenne non-exhaustif : $[\overline{x}-a.\frac{\sigma}{\sqrt{n}};\overline{x}+a.\frac{\sigma}{\sqrt{n}}]$

* la formule de l'écart type $(\sigma(x))$ : $\sqrt{Var(x)}$ 

* La formule de la variance  : $Var(x) =\frac{1}{n}.\sum(x_i-\overline{x})^2$

* Formule de Laplace (recherche dans le tableau) : $G(a)= 1 - \frac{\alpha}{2}$

> Attention à ne pas se tromper entre $a$ et $\alpha$ 



### Résolution

Tout d'abord on prends notre formule de l'intervalle de confiance pour une moyenne non-exhaustif et on remplace toutes les informations que l'on connaît dedans. 
$$
[\overline{x}-a.\frac{\sigma}{\sqrt{n}};\overline{x}+a.\frac{\sigma}{\sqrt{n}}]\\
[1,5-a.\frac{\sigma}{\sqrt{65}};1,5+a.\frac{\sigma}{\sqrt{65}}]\\
$$
Ensuite, on peut trouver $a$ dans la table de Gauss.

> $a$ est la valeur dans la table de gauss qui correspond à ($1-\frac{\alpha}{2}$)
>
> > On trouve ($1-\frac{\alpha}{2}$) au milieu du tableau et $a$ sur les côtés de celui-ci.  

avec un $\alpha = 0,05$ on obtiens un $a = 1.96$ que l'on peut remplacer au sein de la formule 
$$
[1,5-1.96.\frac{\sigma}{\sqrt{65}};1,5+1.96.\frac{\sigma}{\sqrt{65}}]\\
$$
On applique maintenant la formule de l'écart-type
$$
[1,5-1.96.\frac{\sqrt{var}}{\sqrt{65}};1,5+1.96.\frac{\sqrt{var}}{\sqrt{65}}]\\
$$
Et ensuite celle de la variance : 
$$
[1,5-1.96.\frac{\sqrt{\frac{1}{n}.\sum(x_i-\overline{x})^2}}{\sqrt{65}};1,5+1.96.\frac{\sqrt{\frac{1}{n}.\sum(x_i-\overline{x})^2}}{\sqrt{65}}]\\
$$
On retrouve la formule donnée dans les informations du début au sein de cette formule :  et on remplace donc $\sum(x_i-\overline{x})^2$  par $0.44 $ et n par 65

 
$$
[1,5-1.96.\frac{\sqrt{\frac{0,44}{65}}}{\sqrt{65}};1,5+1.96.\frac{\sqrt{\frac{0,44}{65}}}{\sqrt{65}}]\\
[1,5-1.96.\sqrt{\frac{0,00676923076}{65}};1,5+1.96.\sqrt{\frac{0,00676923076}{65}}]\\
$$
On obtiens donc l'intervalle suivant : 
$$
[1,5-1.96.\sqrt{\frac{0,00676923076}{65}};1,5+1.96.\sqrt{\frac{0,00676923076}{65}}]\\
[1,5-1.96.0,01020499935;1,5+1.96.0,01020499935]\\
[1,5-0,02000179873;1,5+0,02000179873]\\
$$

### Réponse

On obtiens donc l'intervalle de confiance du poids moyen d'une bouteille d'eau, qui est $1,5\ kg$ à $\pm$ $20\ grammes$
$$
[1,48;1,52]
$$


## Exercice 3

### Enoncé

Durant la saison d’hiver, les ventes journalières de pommes de terre chez un grossiste suivent une loi normale de moyenne inconnue et d’écart-type 2.2 tonnes.

* Un échantillon aléatoire de 50 jours de vente a fourni une moyenne de 14.5 tonnes. Sur base de cet échantillon et des résultats observés, donnez un intervalle de confiance pour le paramètre inconnu (𝛼 = 0.10) .
* Quelle devrait être la taille de l’échantillon pour que l’étendue de l’intervalle de confiance soit égale à 1 tonne (𝛼 = 0.05)?

### Informations

* Les données suivent une loi normale 
* $\sigma = 2.2$

### Sous-question 1 

Un échantillon aléatoire de 50 jours de vente a fourni une moyenne de 14.5 tonnes. Sur base de cet échantillon et des résultats observés, donnez un intervalle de confiance pour le paramètre inconnu (𝛼 = 0.10) .

#### Que recherche-t-on ?

On recherche un intervalle de confiance pour la moyenne de la vente de pommes de terre. 

#### Informations supplémentaires

* Données sur 50 jours : $n=50$

* $\overline{x} = 14,5$

* $\alpha= 0,1$

  

#### Formules utilisées

* formule de l'intervalle de confiance d'une moyenne (n>30) : $[\overline{x}-a.\frac{\sigma}{\sqrt{n}};\overline{x}+a.\frac{\sigma}{\sqrt{n}}]$
* Formule de Gauss-Laplace (recherche dans le tableau) : $G(a)= 1 - \frac{\alpha}{2}$

> Attention à ne pas se tromper entre $a$ et $\alpha$ 

#### Résolution

On démarre de l'équation de l'intervalle de confiance d'une moyenne
$$
[\overline{x}-a.\frac{\sigma}{\sqrt{n}};\overline{x}+a.\frac{\sigma}{\sqrt{n}}]
$$
On recherche a
$$
G(a)= 1-\frac{0,1}{2}\\
G(a)= 0,95\\
$$
un a qui correspond à 0,95 n'existe pas dans la table mais on peut trouver à l'aide d'une interpolation linéaire

> $g^- + \frac{a-a^-}{a^+ - a^-}.(g^+ -g^-) = g$
>
> $0,94950 + \frac{a-1,64}{1,65 - 1,64}.(0,95053 - 0,94950) = 0,95$
>
> $\frac{a-1,64}{1,65 - 1,64}.(0,95053 - 0,94950) = 0,95-0,94950$
>
> $\frac{a-1,64}{0,01}.(0,00103) = 0,0005$
>
> $(a-1,64).0,103 = 0,0005$
>
> $a = \frac{0,0005}{0,103}+1,64$
>
> $a = 1,64485436893$



On peut remplacer $\overline{x}$, $\sigma$, n et a par leur valeur dans l'équation de l'intervalle: 
$$
[14,5-1,65.\frac{2,2}{\sqrt{50}};14,5+1,645.\frac{2,2}{\sqrt{50}}]\\
[14,5-0,51180388822;14,5+0,51180388822]\\
[13,9882;15,0118]\\
$$

#### Solution

L'intervalle de confiance est $IC_{10\%}[13,9882;15,0118]$ tonnes de pommes de terres par jour vendues. 



### Sous-question 2

Quelle devrait être la taille de l’échantillon pour que l’étendue de l’intervalle de confiance soit égale à 1 tonne (𝛼 = 0.05)?

#### Que recherche-t-on ?

On recherche la taille de l'échantillon qui donne un intervalle de confiance qui possède 1 tonne entre 2 de ses bornes. Cela signifie que la marge d'erreur (ME) doit valoir 0,5

#### Informations supplémentaires

* $\alpha = 0,05$

#### Formules utilisées

* Marge d'erreur de l'intervalle de confiance d'une moyenne (n>30)  :  $ME = a.\frac{\sigma}{\sqrt{n}}$
* Formule de Gauss-Laplace (recherche dans le tableau) : $G(a)= 1 - \frac{\alpha}{2}$

> Attention à ne pas se tromper entre $a$ et $\alpha$

#### Résolution

On va donc partir de l'équation de la marge d'erreur d'une moyenne 
$$
ME = a.\frac{\sigma}{\sqrt{n}}
$$
Grace au tableau de Gauss, on peut trouver que a vaut 1.96 avec un $\alpha = 5\%$. 

La valeur de $\sigma$ est donnée dans l'énoncé: 
$$
ME = 0,5 = 1,96.\frac{2,2}{\sqrt{n}}
$$
On recherche donc le n dans cette équation 
$$
n =74,373376
$$

#### Solution

Il faut donc un échantillon de 75 jours pour obtenir un intervalle de confiance avec un écart de 1 tonne entre ses bornes. ( avec un $\alpha = 5\%$)



## Exercice 4

### Enoncé

Soit un échantillon aléatoire de 38 arbres, échantillon représentant 10% de la population de référence. Une mesure du volume de chacun de ces arbres a donné, après regroupement en classes et assimilation de chaque classe à son centre, les résultats suivants :

| Volume ($X_i$) | $r_i$ |
| -------------- | ----- |
| 20 $m^3$       | 8     |
| 40 $m^3$       | 16    |
| 60 $m^3$       | 12    |
| 80 $m^3$       | 2     |

* Calculez un intervalle de confiance pour le volume moyen de la population (échantillon non exhaustif, 𝛼 = 6%).
* Même question mais en travaillant avec un échantillon exhaustif.

### Informations

* n = 38
* n = 10% de N
* tableau ci-dessus

### Sous-Question 1

Calculez un intervalle de confiance pour le volume moyen de la population (échantillon non exhaustif, 𝛼 = 6%)

#### Que recherche-t-on ?

On recherche un intervalle de confiance d'une moyenne de volumes d'arbres

#### Informations supplémentaires

* Echantillon non-exhaustif
* $\alpha = 6\%$

#### Formules utilisées

* formule de l'intervalle de confiance d'une moyenne (n>30) [non-exhaustif] : $[\overline{x}-a.\frac{\sigma}{\sqrt{n}};\overline{x}+a.\frac{\sigma}{\sqrt{n}}]$
* Formule de Gauss-Laplace (recherche dans le tableau) : $G(a)= 1 - \frac{\alpha}{2}$

> Attention à ne pas se tromper entre $a$ et $\alpha$ 

* formule de la moyenne : $\overline{x}=\frac{1}{n}\sum r_i.x_i$
* formule de l'écart type : $\sqrt{var(x)}$
* formule de la variance : $var (x) = \overline{x^{2}}-\overline{x}^{2} = \frac{1}{n}.\sum r_{i}.(x_{i})^{2}-(\overline{x})^{2} = \frac{1}{n}\sum r_{i}.(x_{i} - \overline{x})^{2}$

#### Résolution

On débute par rechercher a
$$
G(a)=1-\frac{0,06}{2}= 1-0,03=0,97\\
0,96995<G(a)<0,97062\\
1,88<a<1,89
$$

> Pour obtenir un résultat plus précis, on peut effectuer une interpolation linéaire de a. Pour trouver la méthode a suivre cfr exercices supra. je vais prendre 1,88 pour simplifier le calcul ici

On peut remplacer a et n dans la formule de l'intervalle de confiance de la moyenne
$$
[\overline{x}-1,88.\frac{\sigma}{\sqrt{38}};\overline{x}+1,88.\frac{\sigma}{\sqrt{38}}]
$$
Il nous faut encore trouver $\overline{x}$ et $\sigma$

On peut trouver $\overline{x}$ en appliquant la formule de la moyenne aux données contenues dans le tableau ci-dessus : 

| Volume ($X_i$) | $r_i$ | $C_i.r_i$ |
| -------------- | ----- | --------- |
| 20 $m^3$       | 8     | 160       |
| 40 $m^3$       | 16    | 640       |
| 60 $m^3$       | 12    | 720       |
| 80 $m^3$       | 2     | 160       |

Si on effectue la somme de la 3e colonne on obtiens : 1680

Par la formule de la moyenne, on obtiens 1680/38 = 44,2105 = $\overline{x}$

Il ne nous reste plus qu'à calculer $\sigma$: on va utiliser la fonction suivante $\sqrt{\frac{1}{n}\sum r_{i}.(x_{i} - \overline{x})^{2}}$ qui est obtenue à partir de celle de la variance et de écart-type.

| Volume ($X_i$) | $r_i$ | $C_i.r_i$ | $x_i - \overline{x}$ | $(x_i-\overline{x})^2$ | $r_i.(x_i-\overline{x})^2$ |
| -------------- | ----- | --------- | -------------------- | ---------------------- | -------------------------- |
| 20 $m^3$       | 8     | 160       | -24,21               | 586,15                 | 4689,2                     |
| 40 $m^3$       | 16    | 640       | -4,21                | 17,73                  | 283,66                     |
| 60 $m^3$       | 12    | 720       | 15,79                | 249,3                  | 2991,69                    |
| 80 $m^3$       | 2     | 160       | 35,79                | 1280,89                | 2561,77                    |

On obtiens un $\sigma$ de 16,6435

on peut maintenant remplacer toutes ces valeurs dans l'équation de l'intervalle
$$
[44,2105-1,88.\frac{16,6435}{\sqrt{38}};44,2105+1,88.\frac{16,6435}{\sqrt{38}}]\\
[44,2105-5,0759;44,2105+5,0759]\\
[39,1346;49,2864]
$$


#### Réponse

L'intervalle de confiance de la moyenne du volume d'arbres est $[39,1346\ ;\ 49,2864] m^3$

### Sous-Question 2

Même question mais en travaillant avec un échantillon exhaustif

#### Que recherche-t-on ?

#### Informations supplémentaires

* Echantillon exhaustif
* $\alpha = 6\%$

#### Formules utilisées

* formule de l'intervalle de confiance d'une moyenne [exhaustif] (n>30) : $[\overline{x}-a.\sqrt{\frac{N-n}{N-1}}.\frac{\sigma}{\sqrt{n}};\overline{x}+a.\sqrt{\frac{N-n}{N-1}}.\frac{\sigma}{\sqrt{n}}]$

#### Résolution

La résolution est similaire à l'exercice 4 partie 1. il nous faut juste calculer $\sqrt{\frac{N-n}{N-1}}$

On sait que 38 représente 10 % de la population totale, ce qui rends celle-ci égale à 380 arbres.

N = 380

ce qui nous donne assez rapidement 
$$
[\overline{x}-a.0,9499.\frac{\sigma}{\sqrt{n}};\overline{x}+a.0,9499.\frac{\sigma}{\sqrt{n}}]
$$
on remplace ensuite avec les informations de obtenues au point 1 et on obtiens l'intervalle suivant : 
$$
[38,39;49,03]
$$


#### Réponse

L'intervalle de confiance de la moyenne, si l'on considère que l'échantillon est exhaustif devient  $[38,39;49,03]$



## Exercice 5

### Enoncé

Afin d’effectuer une analyse de l’apprentissage de l’anglais sur l’ensemble des enfants entrant en humanités, un examen est organisé après la première année d’étude. Soit X le score (sur 100) obtenu par l’élève. X suit une loi normale. 

Sur un échantillon de 25 enfants, la moyenne est de 42.12 et l’écart-type de 3.47. 

Déterminez un intervalle de confiance du score moyen que cette population pourrait réaliser au niveau de confiance de 99%.

### Informations 

* $n = 25$
* $\overline{x}= 42,12$
* $\sigma = 3,47$
* niveau de confiance = $99\%$

### Que recherche-t-on ?

Un intervalle pour le score moyen élèves

### Formules utilisées

* formule de l'intervalle de confiance d'une moyenne [non-exhaustif] : $[\overline{x}-a.\frac{\sigma}{\sqrt{n}};\overline{x}+a.\frac{\sigma}{\sqrt{n}}]$
* Student $t_v$ où $v=n-1$

### Résolution

>  Il est important de noter que n<30 ce qui signifie que la moyenne standardisée des échantillons suit une loi t de Student à (n-1) degrés de liberté

Nous avons donc une loi de Student avec un $v=25-1 = 24$

on obtiens un $a = 2,79695$
$$
[42,12-2,79695.\frac{3,47}{\sqrt{25}};42,12+2,79695.\frac{3,47}{\sqrt{25}}]\\
[42,12-1,9410833;42,12+1,9410833]\\
[40,1789;44,0611]
$$

### Solution

Le score moyen que cette population pourrait réaliser au niveau de confiance de 99% est compris entre $40,1789$ et $44,0611$



## Exercice 6

### Enoncé

Un professeur de l’ Henallux désire faire une enquête auprès des anciens étudiants de sa section. Il dispose d’un fichier avec les adresses électroniques de 400 anciens. L’enquête consiste en une série de questions auxquelles il faut répondre « oui » ou « non ».

 Combien de réponses doit-il recevoir pour pouvoir afficher un résultat avec une marge d’erreur maximale de 6% (𝛼 = 0.06) ?

### Informations

* $N=400$
* Marge erreur maximale de $6\%$

### Que recherche-t-on ?

### Formules utilisées

* La formule de la marge d'erreur d'une proportion (exhaustif): $a.\sqrt{\frac{p.(1-p)}{n}}.\sqrt{\frac{N-n}{N-1}}$
* la marge d'erreur est maximale lorsque $p = 0.5$
* Formule de Gauss-Laplace (recherche dans le tableau) : $G(a)= 1 - \frac{\alpha}{2}$

> Attention à ne pas se tromper entre $a$ et $\alpha$ 0660

### Résolution

La théorie nous dit que la marge d'erreur maximale est atteinte en $p=0,5$

a peut être trouvé au moyen de la table de gauss
$$
G(a)=1-\frac{0,06}{2}= 1-0,03=0,97\\
0,96995<G(a)<0,97062\\
1,88<a<1,89
$$

> pour l'exemple, on choisira de prendre 1,88 mais il faudrait pour le bien utiliser une interpolation linéaire pour déterminer la bonne valeur de a.

$$
Marge\ Erreur\ Max = 1,88.\sqrt{\frac{p.(1-p)}{n}}.\sqrt{\frac{400-n}{399}}\\
Marge\ Erreur\ Max = 1,88.\sqrt{\frac{0,5.(1-0,5)}{n}}.\sqrt{\frac{400-n}{399}}\\
Marge\ Erreur\ Max = 1,88.\frac{1}{2\sqrt{n}}.\sqrt{\frac{400-n}{399}}\\
$$

La marge d'erreur doit être au maximum égale à $6\%$
$$
0,06 \geq 1,88.\frac{1}{2\sqrt{n}}.\sqrt{\frac{400-n}{399}}\\
0,06 \geq \frac{1,88.\sqrt{400-n}}{2\sqrt{n}.\sqrt{399}}\\
0,06 \geq \frac{1,88.\sqrt{400-n}}{2\sqrt{n}.\sqrt{399}}\\
$$


### Solution



A CORRIGER



## Exercice 7

### Enoncé

Le staff médical d’une grande entreprise fait ses petites statistiques sur le taux de cholestérol de ses employés. Les observations sur 100 employés tirés au sort sont les suivantes :

| Taux de cholestérol en cg (centre  classe) | Effectif d'employés |
| ------------------------------------------ | ------------------- |
| 120                                        | 9                   |
| 160                                        | 22                  |
| 200                                        | 25                  |
| 240                                        | 21                  |
| 280                                        | 16                  |
| 320                                        | 7                   |

a. Calculez la moyenne et l’écart-type sur l’échantillon. 

b. Estimez ponctuellement la moyenne et l’écart-type pour le taux de cholestérol dans toute l’entreprise. 

c. Déterminez un intervalle de confiance pour la moyenne. 

d. Déterminez la taille minimum d’échantillon pour que l’amplitude de l’intervalle de confiance soit inférieure à 10.

### Informations 

### Sous question 1

#### Informations

#### Que recherche-t-on ?

#### Formules utilisées

#### Résolution

#### Solution

### Sous question 2

#### Informations

#### Que recherche-t-on ?

#### Formules utilisées

#### Résolution

#### Solution

### Sous question 3

#### Informations

#### Que recherche-t-on ?

#### Formules utilisées

#### Résolution

#### Solution

### Sous question 4

#### Informations

#### Que recherche-t-on ?

#### Formules utilisées

#### Résolution

#### Solution



## Exercice 8

### Enoncé

Dans le cadre d’une étude sur la santé au travail, on a interrogé au hasard 500 salariés différents de divers secteurs d’une multinationale qui emploie 5000 personnes. Parmi eux, 145 déclarent avoir déjà subi un harcèlement moral au travail. 

a. Donnez une estimation ponctuelle de la proportion de salariés de cette société ayant déjà subi un harcèlement moral au travail. 

b. Donnez une estimation de cette proportion par un intervalle de confiance à 90%. 

c. Si avec les mêmes données on calculait un intervalle de confiance à 98%, l’intervalle serait-il plus grand ou plus petit que celui trouvé à la question précédente ? (Justifiez sans calcul.) 

d. Si la société employait 2000 personnes, l’intervalle serait-il plus grand ou plus petit que celui trouvé au point c ? Calculez-le. 

e. Même question qu’au point d mais avec 500 000 personnes employées.

### Informations 

### Sous question 1

#### Informations

#### Que recherche-t-on ?

#### Formules utilisées

#### Résolution

#### Solution

### Sous question 2

#### Informations

#### Que recherche-t-on ?

#### Formules utilisées

#### Résolution

#### Solution

### Sous question 3

#### Informations

#### Que recherche-t-on ?

#### Formules utilisées

#### Résolution

#### Solution

### Sous question 4

#### Informations

#### Que recherche-t-on ?

#### Formules utilisées

#### Résolution

#### Solution

### Sous question 5

#### Informations

#### Que recherche-t-on ?

#### Formules utilisées

#### Résolution

#### Solution

