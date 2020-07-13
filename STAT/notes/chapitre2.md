# Chapitre 2: Variables Aléatoires

## Introduction

**Variable Aléatoire** (*généralement noté X*) : Une variable aléatoire est une quantité qui varie en fonction du hasard.

> Une Variable aléatoire peut (par exemple) désigner le nombre de points obtenus en lançant un dé.

Une *variable aléatoire* peut avoir un caractere **discret** ou **continu**

## Les Variables aléatoires discrètes 

Pour définir une variable aléatoire discrète, il faut donner l'ensemble des valeurs {$x_i$} qu'elle peut prendre et donner la probabilité que la variable a de prendre chacune de ces valeurs. 

> ex Pr{X=0} = ....= 1/8


$$X = \begin{pmatrix} x_i \\ p_i \end{pmatrix} = \begin{pmatrix} 0 & 1 & 2 & 3\\ \frac{1}{8} & \frac{3}{8} & \frac{3}{8} & \frac{1}{8}\end{pmatrix}$$


$P=(p_i)$ est la loi de probabilité associée à $X=(x_i)$

($p_i=Pr\{X=x_i\}$)

$\sum _i p_i = 1$

### Fonction de répartition d'une variable aléatoire discrète

Une focntion de répartition de la variable aléatoire X(ou $FR_X$) est la probabilité qu'une variable aléatoire prenne une valeur inférieure ou égale à x.

$$\sum _{i=1} ^k Pr\{X=x_i\}$$

### Espérence mathématique d'une variable aléatoire

L'espérence mathématique peut être vue comme la moyenne arithmétique. C'est une valeur vers laquelle on va tendre si on répète une infinité de fois l'expérience.

Soit $X = \begin{pmatrix} x_i \\ p_i \end{pmatrix}$

#### Propriétés

$$E(\alpha * X + \beta) = \alpha * E(X) + \beta$$

$$E(X\pm Y) = E(X) \pm E(Y)$$

$$E(X*Y) = E(X) * E(Y)$$

> Ici, X et Y doivent être deux variables aléatoires indépendantes

### Variance et écart-type d'une variable aléatoire discrète

La variance décrit la mesure de la dispersion autour de la moyenne. 

$$Var(X) = E [ (X-E(X))^2 ]$$

L'écart-type de X est noté $\sigma (X)$ et on a : 

$$\sigma (X) = \sqrt{Var(X)}$$

On peut cependant simplifier la formule de la variance : 

$$Var(X) = E(X^2)-[E(X)]^2$$

#### Propriétés

$$Var(\alpha * X + \beta) = \alpha ^2 * Var(X)$$

$$Var(X\pm Y) = E(X) + var(Y)$$

## Variables aléatoires continues

Le cas des variables continues est relativement similaire. 

$$Pr\{\alpha\leq X\leq \beta\}= \int^\beta_\alpha T(X) dx$$

$$T(X)\geq0\ \forall x$$

Dans l'exemple suivant a et b sont les bornes dans lesquelles évoluent la probabilité

$$Pr\{a\leq X \leq b\}= 1$$

$$Pr\{X=c\}=0$$



#### Variance et Esperance

Les fonctions discrètes pour la variance et l'expérience sont valables pour les variables aléatoires continues.



### Inégalité de Tchebycheff - Loi faible des grands nombres

#### inégalité de Tchebycheff

Soit X une Variable aléatoire suivant une loi de probabilité quelconque (inconnue). Soit E(X) son espérance mathématique et Var(X) sa variance supposée finie.

$$Pr\{E(X)-\theta \leq X\leq E(X)+ \theta \}\geq 1-\frac{Var(X)}{\theta^2}$$

#### Loi faible des grands nombres - Bernoulli

---

#### La variable aléatoire binomiale

Soit n épreuves aléatoires identiques et indépendantes

Chaque épreuve est soit réalisée, soit non réalisée

la probabilité de réalisation (la même pour toutes les épreuves) est de p 

$$C_n^k = \frac{n!}{k!(n-k)!}$$

$$Pr\{B_{n,p}=k\}=C^k_n.p^k.(1-p)^{n-k}$$

$E(B_{n,p})= n.p$

$Var(B_{n,p}) = n*p*(1-p)$

$B_{n_1,p}+B_{n_2,p}= B_{n_1+n_2,p}$

#### Loi des grands nombres pour les épreuves de bernouilli

???

### La variable Aléatoire de Poisson

La variable aléatoire étudie la réalisation d'un événement peu probable sur un échantillon élevé (n>50 et n.p<5).

$$ Pr\{X=k\}=\frac{\lambda^k.e^{- \lambda} }{k!} $$

$E(P_\lambda)= \lambda$

$$Var(P_\lambda)=\lambda$$

$$P_{\lambda _{1}}+P_{\lambda _{2}} = P_{\lambda _{1}+\lambda _{2}}$$

La loi de poisson est utilisée pour étudier la survenance d'événement rares. 

Exemples : la théorie des files d'attentes

### Loi Normale (Laplace-Gauss)

$$E(X_G)=E(N(m,\sigma ))=m$$ et $$Var(X_G) = Var(N(m,\sigma))=\sigma ^2$$

$$X^*_G=\frac{X_G -m}{\sigma}$$

$$E(X^*_G)= 0$$ et $$Var(X^*_G)=1$$

$$X^*_G\leq b=\frac{b-m}{\sigma}$$



### La variable aléatoire exponentielle négative

$$T(x)=\mu e^{-\mu x}$$ avec $\mu > 0$

$$E(X)= \frac{1}{\mu}$$

$$Var(X)= \frac{1}{\mu ^2}$$

### La variable aléatoire Khi-Carré 

???

