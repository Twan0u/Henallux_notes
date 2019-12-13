# Partie 2

L'hypothese nulle : $H_{0}$ doit toujours (pour des raisons de simplicité) être définie avec **une égalité**

$\alpha$ est le risque de commettre une erreur. (par défaut : $\alpha = 0.05$)

## Méthodologie de resolution Test de Valeur pour une probabilité: 

Quand une différence est-elle suffisamment significative pour affirmer qu'un paramètre de la
population a changé ?

### 1. Les hypothèses
$H_{0}:p=0.21$ (pour des raisons de simplicité, on ne travaille qu'avec des équivalences)   
$H_{1}:p\neq0.21$ (test bilatéral)   
$H_{1}:p<0.21$ (test unilatéral gauche)   

### 2. Seuil de signification
$\alpha = 0.05$ (valeur utilisée en général)

### 3. Loi de probabilité utilisée (différente en fonction de l'échantillon, type de test, ...)  
$$n \geq 30 \Rightarrow  \frac{f-E(f)}{ \sqrt{Var(f)}}$$

> Rappel : E(f) = p et Var(f) = $\frac{p.(1-p}{n}$

### 4. Déterminer le seuil de rejet et la zone de non refus
    * Dans le cas d'un test bilatéral : $$Pr\{p-ME \leq f \leq p+ME \} = 1-\alpha$$

> Rappel : $ME = a.\sqrt{\frac{p.(1-p)}{n}}$
> a est la valeur dans la table de gauss pour $1-\frac{(1-\alpha)}{2}$

    * Dans le cas d'un test unilatéral gauche : On ne garde qu'une seule partie de l'inégalité d'un test bilatéral $Pr\{p-ME \leq f \} = 1-\alpha$

> Rappel : $ME = a.\sqrt{\frac{p.(1-p)}{n}}$ $\\$
> a est la valeur dans la table de gauss pour $1-\alpha$ $\\$
> $\{X^{*}_{G} \leq x_{0}\} = 0.05$ $\\$
> $\{X^{*}_{G} \geq x_{0}\} = 0.95$ $\\$
> $\{X^{*}_{G} \leq - x_{0}\} = 0.95$ $\\$
> ce qui donne après lecture directe de la table de gauss : $-x_{0} \approx 1.645$ , $x_{0} \approx -1.645$

### 5. Calculer la grandeur expérimentale

f = $\frac{occurence}{n}$

Puis on remplace dans l'équation suivante : $$Pr\{p- a.\sqrt{\frac{p.(1-p)}{n}} \leq f \leq p+a.\sqrt{\frac{p.(1-p)}{n}} \} = 1-\alpha$$


### 6. Tirer les conclusions
Soit : 

* $f \in$ zone de non refus. Nous ne pouvons donc pas rejeter $H_{0}$
* $f \notin$ zone de non refus. Nous rejetons $H_{0}$

Au seuil de signification $\alpha = 0.05$, la proportion de ... ne semble pas / semble avoir changé significativement.


## Méthodologie de resolution Test de Valeur pour une moyenne: 

quasiment idem que pour les probabilités à un détail près

### 3. Loi de probabilité utilisée (différente en fonction de l'échantillon, type de test, ...)  
$$n \geq 30 \Rightarrow \overline{x} \approx \frac{f-E(\overline{x})}{ \sqrt{Var(\overline{x})}}$$

> Rappel : 
> $E(\overline{x}) = m$   
> $Var(\overline{x}) = \frac{\sigma^{2}}{n} \approx \frac{1}{n} S_{n-1}^{2} = \frac{1}{n} . \frac{n}{n-1}.S^{2}_{n}$

### 4. Déterminer le seuil de rejet et la zone de non refus
    * Dans le cas d'un test bilatéral : $$Pr\{p-ME \leq f \leq p+ME \} = 1-\alpha$$

> Rappel : $ME = a.\sqrt{\frac{p.(1-p)}{n}}$
> a est la valeur dans la table de gauss pour $1-\frac{(1-\alpha)}{2}$

    * Dans le cas d'un test unilatéral gauche : On ne garde qu'une seule partie de l'inégalité d'un test bilatéral $Pr\{p-ME \leq f \} = 1-\alpha$

> Rappel : $ME = a.\sqrt{\frac{p.(1-p)}{n}}$ $\\$
> a est la valeur dans la table de gauss pour $1-\alpha$ $\\$
> $\{X^{*}_{G} \leq x_{0}\} = 0.05$ $\\$
> $\{X^{*}_{G} \geq x_{0}\} = 0.95$ $\\$
> $\{X^{*}_{G} \leq - x_{0}\} = 0.95$ $\\$
> ce qui donne après lecture directe de la table de gauss : $-x_{0} \approx 1.645$ , $x_{0} \approx -1.645$

### 5. Calculer la grandeur expérimentale

f = $\frac{occurence}{n}$

Puis on remplace dans l'équation suivante : $$Pr\{p- a.\sqrt{\frac{p.(1-p)}{n}} \leq f \leq p+a.\sqrt{\frac{p.(1-p)}{n}} \} = 1-\alpha$$


### 6. Tirer les conclusions
Soit : 

* $f \in$ zone de non refus. Nous ne pouvons donc pas rejeter $H_{0}$
* $f \notin$ zone de non refus. Nous rejetons $H_{0}$

Au seuil de signification $\alpha = 0.05$, la proportion de ... ne semble pas / semble avoir changé significativement.












