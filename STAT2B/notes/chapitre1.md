# Partie 1

## Moyenne
$\overline{x}= {1\over n} \sum r_{i}.x_{i}$

## Variance ($Unit^{2}$)
$Var x = \overline{x^{2}}-\overline{x}^{2} = \frac{1}{n}.\sum r_{i}.(x_{i})^{2}-(\overline{x})^{2} = \frac{1}{n}\sum r_{i}.(x_{i} - \overline{x})^{2}$

## Ecart-type

$\sigma (x) = \sqrt{Var(x)}$

## variance de l'échantillon
$S_{n}^{2} =  \frac{r_{i}.(C_{i})^{2}}{n}-\overline{x}^{2}$
$\\\\$
r sont le nombre d'occurence de l'échantillon et c la valeur dans l'échantillon

## Biais des estimateurs

Les paramètres n et $\overline{x}$ sont des estimateurs **sans biais** tandis que $S_{n}^{2}$ est **biaisé** de $\theta ^{2}$. $S_{n-1}^{2}$ (**variance corrigée**) est un estimateur **sans biais** (non exhaustif).

## Non-Exhaustif

* $E(\overline{x})=m$
* $Var(\overline{x}) = \frac{\sigma ^{2}}{n}$
* $E(f) = p$
* $Var(f) = \frac{p.(1-p)}{n}.\frac{N-n}{N-1}$
* 

## Exhaustif

### Qualités d'un estimateur

Un estimateur est **absolument correct** si il est **sans biais** et **consistant**

## Estimation par intervalle de confiance

Il faut déterminer $L_{i}$ et $L_{s}$ tels que Pr{$L_{i} \leq \theta \leq L_{s}$}=$1-\alpha$  

### Intervalle de confiance d'une proportion
Si : $n\geq 30$ et $n.p\geq 5$ et $n.(1-p)\geq 5$ pour une loi binomiale : 

il suffit de : 
résoudre la fonction suivante (non-exhaustive): 
$$\begin{bmatrix}
f-g.\sqrt{\frac{p.(1-p)}{n}}; f+g.\sqrt{\frac{p.(1-p)}{n}}
\end{bmatrix}$$

(exhaustive)
$$\begin{bmatrix}
f-g.\sqrt{\frac{N-n}{N-1}}.\sqrt{\frac{p.(1-p)}{n}}; f+g.\sqrt{\frac{N-n}{N-1}}.\sqrt{\frac{p.(1-p)}{n}}
\end{bmatrix}$$

* f : fréquence observée dans l'échantillon  = $\frac{occurence}{n}$
* N : Population Totale
* n : taille de l'échantillon
* p = f  ou  p = 0.5 (marge d'erreur maximale)

On lit ensuite la table de Gauss pour trouver la valeur dans le tableau qui vaut $1-\frac{(1-\alpha)}{2}$

> $\alpha$ est le niveau d'incertitude

* Si la valeur est dedans, on regarde combien elle vaut (eg : 0,95 -> 1,96 = g) 
* Si elle n'est pas dedans, on effectue une interpolation linéaire $$g^{-} + \frac{a-a^{-}}{a^{+}-a^{-}} . (g^{+}-g^{-})=g$$

### Intervalle de confiance d'une moyenne
## Les échantillons de grande taille

$$\begin{bmatrix}
\overline{x} - g.\sqrt{\frac{N-n}{N-1}}.\frac{sigma}{\sqrt{n}};\overline{x} + g.\frac{sigma}{\sqrt{n}}
\end{bmatrix}$$

#### Les échantillons de petite taille $(n<30)$

$\\\\$
Si la population est **distribuée normalement**, suit une **loi t
de Student à (n – 1) degrés de liberté**.
v = 20-1 que l'on remplace à la place de g dans les equations ci-dessus


### Marge d'erreur associée à un intervalle de confiance

De façon générale, la marge d'erreur vaut : 

* Pour l'intervalle de confiance d'une proportion : $a.\sqrt{\frac{p.(1-p)}{n}}$  
* Pour un intervalle de confiance de moyenne : $a.\frac{\sigma}{\sqrt{n}}$

Pour diminuer cette marge d'erreur, nous pouvons soit **augmenter la taille de l'échantillon**, soit **augmenter le niveau d'incertitude**. La marge d'erreur maximale est obtenue lorsque  $p=0.5$


\newpage



































