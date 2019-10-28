
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

