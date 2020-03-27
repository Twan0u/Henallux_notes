# Partie 2
## Introduction
Dans le cadre de l'évaluation d'un caractère mesurable. Un paramètre lié à ce caractère est inconnu (moyenne, proportion, variance) ou une loi de probabilité est ce caractère inconnu. Sur base d'une intuition ou d'une connaissance partielle de la réalité, on décide d'émettre une hypothèse concernant ce paramètre ou la loi de distribution. Il est ensuite judicieux d'être capable de porter un jugement sur cette hypothèse sur base d'échantillons obtenus. On opposera donc les résultats théoriques aux résultats issus de l'analyse des échantillons. Si Un écart trop important venait à être remarqué, l'hypothèse serait ainsi fausse et rejetée.

## Hypothèse nulle, hypothèse alternative, seuil de signification

**L'hypothèse nulle** est celle que nous allons tester, notée $H_{0}$. Il s'agit pour les paramètres, d'une égalité et *d'affirmations positives pour les tests du khi-deux*.  

**L'hypothèse alternative** est l'hypothèse que nous acceptons si on rejette $H_{0}$, notée $H_{1}$. Elle s'exprime sous la forme d'une différence($\neq$), d'une inégalité stricte et sous forme d'une affirmation négative

>Exemple :  
>Un  client  à  comme  critère  une  résistance  moyenne  d'au  moins  égale  à  13kg  et  un  fabricant,  lui  produit  un  fil  avec  une  résistance  moyenne  de  13kg.

Pour le client on a $H_{0}:m=13$ et $H_{1}:m<13$    
Tandis que le fabricant aura $H_{0}:m=13$ et $H_{1}:m\neq 13$



**Le seuil de signification** est la probabilité de rejeter $H_{0}$ au profit de $H_{1}$ alors que $H_{0}$ est **vraie**. C'est le risque de commettre une erreur. cette erreur est appelée **erreur de $1^{ère}$ espèce ou risque de la $1^{ère}$ espèce. et est noté $\alpha$

Pour les exemples, nous choisirons un *seuil de signification* $\alpha = 0.05$. Cela signifie que si l'on rejette l'*hypothèse nulle*, on a 5% de chances de commettre une erreur. 

> N.B. On pourrait envisager le risque ou erreur de 2$^{e}$ espèce noté $\beta$ qui serait le risque d'accepter L'*hypothèse nulle* alors que celle-ci est fausse. 

### Méthodologie (peu importe le type de tests)

* Fixer les Hypothèses $H_{0} et H_{1}$
* Préciser le seuil de signification de $\alpha$
* Préciser la loi de probabilité utilisée (différente en fonction de l'échantillon, type de test, ...)
* Déterminer le seuil de rejet, la zone de non refus
* Calculer la grandeur expérimentale
* Tirer les conclusions

## Tests de valeur

Dans un test de valeur, on test l'hypothèse selon laquelle le paramètre (moy, proportion) est égal à une valeur déterminée. $H_{1}$ exprimera ensuite que le paramètre étudié est ($\neq$,$>$ ou $<$) de la valeur déterminée.

Dans le cadre de l'évaluation d'une modification sur la population à partir de renseignements obtenus sur un échantillon, on est en droit de se poser la question suivante: **Cette différence est-elle sufisament significative pour affirmer que le paramètre de la population à changé?

### Test de valeur d'une proportion
Dans le cas de grands échantillons (n $\geq$ 30).
$$n\geq 30 \Rightarrow f \approx N(E(f),\sqrt{var(f)}$$


...

> L'appélation "test unilatéral gauche" vient du fait que le seuil de rejet se situe à gauche de l'axe de symétrie de la courbe de Gauss.

> Dans certains ouvrages,l'hypothèse est systématiquement le contraire de l'hypothèse alternative. (ex : $H_{0}:p=0.21$ est remplacé par $H_{0}:p \geq 0.21$) ceci ne change ni le déroulement du test, ni sa conclusion.

Pour des Raisons de facilité de compréhension, dans les tests de valeur et d'égalité, nous exprimerons toujours l'hypothèse nulle sous forme d'une égalité.


### Test de valeur d'une moyenne

#### a) Les échantillons de grande taille $(n\geq 30)$

rappel : cfr Intervalle de confiance d'une moyenne (part 1)


### Test d'indépendance
On peut sur base d'un échantillon de taille n sufisant déduire si deux variables X et Y sont indépendantes ou non. 
























