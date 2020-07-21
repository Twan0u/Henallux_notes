# Exercices Résolus

## Module 1 : Probabilités

### Exercice 1

Pour bien gérer un grand magasin, il faut évidemment connaître les habitudes des consommateurs. C’est pourquoi un gérant a observé (discrètement) le contenu des caddies de ses clients. Il a ainsi pu remarquer que 55% des caddies contenaient des produits d’entretien, que 75% des caddies contenaient des produits alimentaires et que 40 % des caddies contenaient les deux.

1. Traduire les données en termes de probabilité.
2. Quelle est la probabilité, que dans un caddie choisi au hasard, on trouve des produits d’entretien mais aucun produit alimentaire ? 
3. Quelle est la probabilité que dans un caddie, on ne trouve ni produit alimentaire, ni produit d’entretien ?
4. Quelle est la probabilité, que dans un caddie on trouve soit des produits alimentaires, soit des produits d’entretien, mais pas les deux ?

#### Résolution

##### 1.1

$E$ = "Le caddie contient des produits d'entretien"

$A$ = "Le caddie contient des produits alimentaires"

$P(E)$ = "Probabilité que le caddie contienne des produits d'entretien" = $55\% $

$P(A)$= "Probabilité que le caddie contienne des produits alimentaires" = $75 \%$

$P(E \cap A)$ =  "Probabilité que le caddie contienne des produits alimentaires et d'entretien" = $40\%$

##### 1.2

On recherche $P(E \backslash A)$

On peut utiliser la formule suivante : $P(A\backslash B) = P(A\backslash (A\cap B))$

 Ce qui nous donne : $P(E\backslash (E\cap A)) = P(E)-P(E\cap A)=55\%-40\% = 15\%$

**La réponse est 15%** 

##### 1.3

On recherche $P(\overline{E\cup A})$
$$
P(\overline{E\cup A})= 1-P(E\cup A) = 1-(P(E)+P(A)-P(E\cap A))\\
1-(0.55+0.75-0.40)=1-(0.90)=0.10
$$
**La réponse est 10%** 

##### 1.4

On recherche $P(E\backslash A)+P(A\backslash E)$

$P(E\backslash A)$ à été calculé au point 1.2

On reproduit le même résonnement pour $P(A\backslash E)$ ce qui donne : 

$75\%-40\% = 35\%$

On obtiens donc : $15\% + 35\% = 50\%$

**La réponse est 50%**

### Exercice 2

Parmi 1500 francophones diplômés d’écoles de commerce, on constate que 700 maîtrisent parfaitement le néerlandais, que 1200 maîtrisent parfaitement l’anglais, et qu’ils sont 500 à maîtriser parfaitement les deux langues. On ne compte aucune personne parlant une autre langue étrangère que l’anglais ou le néerlandais.

1. Traduire les données en termes de probabilité.
2. Quelle est la probabilité qu’un diplômé choisi au hasard, soit capable de s’exprimer autrement que dans la langue de Voltaire ?
3. Quelle est la probabilité qu’un diplômé choisi au hasard soit uniquement bilingue ?
4. Quelle est la probabilité qu’un diplômé choisi au hasard soit uniquement bilingue Français – Néerlandais ?

#### Résolution

##### 2.1 

$P(N)$ = Probabilité de maîtriser le Néerlandais = 700/1500

$P(N)$ = Probabilité de maîtriser l'Anglais = 1200/1500

$P(A\cap N)$ = Probabilité de maîtriser l'anglais et le néerlandais à la fois = 500

##### 2.2

On le recherche la probabilité de parler le néerlandais ou l'anglais($P(N\cup A)$)
$$
P(N\cup A) = P(N)+P(A)-P(N\cap A)\\
\frac{700}{1500} + \frac{1200}{1500} - \frac{200}{1500} = \frac{1400}{1500} = \frac{14}{15}= 93,33\%
$$
**La réponse est 93.33%**

##### 2.3

$P(Maitrise\ langue\ etrangere - parler\ les\ 2\ langues)$

La probabilité de parler une langue étrangère est donnée à l'exercice 2.2 et la probabilité de parler les 2 langues peut s'exprimer sous la forme $P(A \cap N)$ qui est donnée dans l'énoncé. 
$$
\frac{1400}{1500}-\frac{500}{1500} = \frac{3}{5}
$$
**La réponse est 60%**

##### 2.4

On recherche : $P(N\backslash A)$
$$
\frac{700-1500}{1500} = \frac{200}{1500} = \frac{2}{15} = 13.33\%
$$
**La réponse est 13.33%**

### Exercice 3

Trois chasseurs sont en train de viser un pauvre canard. Ils ont chacun 4 chances sur 5 d’atteindre l’animal. Quelle est la probabilité que le canard soit toujours vivant après leurs tirs ?

#### Résolution

On sait qu'il y a 3 chasseurs. 

La probabilité de chaqu'un de toucher le canard est de 80%.

On cherche à savoir si après les 3 tirs quel est la probabilité que le canard soit toujours en vie.

$P("Canard\ en\ vie") = P("1^e\ manque")\ et\ P("2^e\ manque")\ et\ P("3^e\ manque")$

$0.2 * 0.2 * 0.2 = (0.2)^3 = 0.8\%$

### Exercice 4

Un négociant en vins propose à la vente du vin français (60%) et du vin produit en dehors de l’Hexagone. Il y a en permanence des vins en promotion et le négociant s’arrange pour que 10% des bouteilles de vins français soient concernées ; ce chiffre est de 20% pour les bouteilles ne venant pas de France.

1. Traduire les données en termes de probabilité.
2. Un client sort du magasin avec une bouteille de vin, quelle est la probabilité qu’il s’agisse d’un vin en promotion ?
3. Un client sort du magasin avec une bouteille de vin, quelle est la probabilité qu’il s’agisse d’un vin français en promotion ?
4. Un client sort du magasin avec une bouteille de vin, quelle est la probabilité qu’il s’agisse d’un vin français ou un vin en promotion ?
5. Un client sort du magasin avec une bouteille de vin en promotion, quelle est la probabilité qu’il s’agisse d’un vin français ?

#### Résolution

##### 4.1

$F$ = "Le vin est français"

$P$ = "Le vin est en promotion"

$P(F)$ = $60\%$

$P(P|F)$ = $10\%$

$P(P|\overline{F})$ = $20\%$

##### 4.2

$P(P) = P(P|F).P(F) + P(P|\overline{F}).P(\overline{F})$

$P(P) = (0.1*0.6) + (0.2*(1-0.6))$

$P(P) = 0.14$

**La réponse est 14%**

##### 4.3

On recherche $P(F\cap P)$

$P(F\cap P) = P(P|F).P(F) = 0.1*0.6 = 0.06 $

**La réponse est 6%**

##### 4.4

On recherche $P(F \cup P)$

$P(F\cup P) = P(F)+P(P)-P(F\cap P)$

$P(F \cup P) = 0.6 + 0.14 - 0.06 = 0.74-0.06 = 0.68$

**La réponse est 68%**

##### 4.5

On recherche $P(F|P) $

$P(F|P)  = \frac{P(F\cap P)}{P(P)} = \frac{0.06}{0.14} = 0.4285$

**La réponse est 42.85%**

### Exercice 5

Un restaurateur achète son vin chez 2 fournisseurs différents A (85%) et B (15%). Chez le fournisseur A, il constate que seulement 1% de bouteilles pose un problème ; ce chiffre est de 3% pour les bouteilles du fournisseur B.

1. Traduire les données en termes de probabilité.
2. Quelle est la probabilité qu’une bouteille choisie au hasard pose problème ?
3. Quelle est la probabilité qu’une bouteille choisie au hasard vienne du fournisseur B ou pose problème ?
4. Quelle est la probabilité qu’une bouteille choisie au hasard qui pose problème vienne du fournisseur B ?
5. Le restaurateur vient de déboucher une bouteille, et manifestement, il constate un problème. Encore une qui vient de chez B pense- t-il. Sa réflexion est-elle pertinente ?

#### Résolution

##### 5.1

$A$ = "Vin acheté chez le fournisseur A"

$B$ = "Vin acheté chez le fournisseur B"

$D$ = "défaut (problème) dans une bouteille"

$P(A)$ = $85\%$

$P(B)$ = $15\%$

$P(D|A)$ = "Probabilité d'un défaut parmi les bouteilles A" = $1\%$

$P(D|B)$ = "Probabilité d'un défaut parmi les bouteilles A" = $3\%$

##### 5.2

On recherche $P(D)$

$P(D)=P(D|A).P(A) + P(D|B).P(B)$

$P(D) = 0.85*0.01 + 0.15*0.03 = 0.0085 + 0.0045 = 0.013$  

$P(D) = 1.3\%$

**La réponse est 1.3%**

##### 5.3

On recherche $P(B\cup D)$

$P(B\cup D) = P(B)+P(D)-P(B\cap D)$

$P(B\cup D) = 0.15+0.013-P(B\cap D)$

On recherche ensuite : $P(B\cap D)$

$P(B\cap D) = P(D|B).P(B)$

$P(B\cap D) = 0.03*0.15$

On résous ensuite l'équation de départ : 

$0.15 + 0.013 - 0.03*0.15 = 0.1585$

**La réponse est 15,85%**

##### 5.4

On recherche $P(B|D)$

On va utiliser La formule de bayes

$P(B|D) = \frac{P(D|B).P(B))}{P(D)} = \frac{0.03*0.15}{0.013}=0.3461$

**La réponse est 34.61%**

##### 5.5

On recherche $P(A|D)$ que l'on va comparer à $P(B|D)$

$P(B|D)$ est calculé en 5.4

$P(A|D) = \frac{P(D|A).P(A))}{P(D)} = \frac{0.01*0.85}{0.013} = 0.6538$

Sachant qu'une bouteille est défectueuse, A à $\pm$65% d'être en cause tandis que B $\pm$35%. ce qui signifie que cela à presque 2x plus de chance d'être la bouteille A.

**La réflexion du serveur n'est donc pas pertinente**

### Exercice 6

Lors de manœuvres un soldat doit aller d’un point A à un point B. Pour ce faire, il doit traverser 3 rivières successives. Deux ponts permettent de traverser la 1ère rivière, 3 ponts permettent de traverser la 2e et la 3e rivière. A l’occasion de ces manœuvres, 30% des ponts de la région ont été « minés ». Quelle est la probabilité que le soldat arrive au point B trempé (sachant qu’il ne pleut pas) ?

#### Résolution

??



### Exercice 7

La population scolaire d’une haute école est répartie de la façon suivante : 

1 ère année : 55% 2 e année : 25% 3 e année : 20% On constate un taux d’absentéisme global de 15%. On sait que seulement 5% des étudiants de 3e sont des brosseurs et que 12% des élèves de 2e les imitent. Quelle est la probabilité qu’un étudiant de 1ère choisi au hasard soit assidu au cours ?

#### Résolution

??



### Exercice 8

Deux joueurs tirent chacun une carte dans un jeu de 52 cartes, montrer que le deuxième joueur a autant de chances de tirer un as que le premier.

#### Résolution

??



### Exercice 9

La garantie sur les appareils électroménagers a été portée à 2 ans. Pour la marque A, on constate que 10% des appareils doivent subir une réparation alors qu’ils sont encore sous garantie. Ce chiffre est de 15% pour la marque B et de 12% pour la marque C. 

Les parts de marché sont respectivement de 30% pour A, 50% pour B et 20% pour C.

1. Quelle est la probabilité qu’un lave-vaisselle choisi au hasard tombe en panne alors qu’il est toujours sous garantie ?
2. J’ai acheté un four que j’ai dû faire réparer alors qu’il était toujours sous garantie. Quelle est la probabilité qu’il soit de la marque A ?

#### Résolution

##### 9.1

On recherche $P(P)$ = "probabilité d'une panne sous  garantie"

$P(P|A) .P(A) + P(P|B).P(B)+P(P|C).P(C) = 0.1*0.3+0.15*0.5+0.12*0.2 = 0.03+0.075+0.024 = 0.129$

**La réponse est 12,9%**

##### 9.2

$$Pr(B|A) = \frac{Pr(A|B).Pr(B)}{Pr(A)}$$

On recherche $P(A|P)$ :

$\frac{0.1*0.3}{0.129} = 0.2326$

**La réponse est 23,26%**



### Exercice 10

On a effectué un sondage auprès des clients des trois principaux opérateurs de téléphonie d’une région. Parmi le public ciblé, 55 % des clients sont abonnés chez Proximum, 30% sont chez Basic et le reste est chez V2O. Le pourcentage de clients satisfaits de leur opérateur est respectivement de 40, 65 et 80 pour Proximum, Basic et V2O. 

1. On désire interviewer pour le JT un client mécontent. On choisit un client au hasard, quelle est la probabilité qu’il soit mécontent ?
2. On choisit un client au hasard parmi les mécontents, quelle est la probabilité que ce soit un client de chez Proximum ?

#### Résolution

##### 10.1

$P(\overline{C}) = 1-P(C) = 1- (P(C|P).P(P)+P(C|B).P(B)+P(C|V).P(V))$

$P(\overline{C})=1-0,515$

$P(\overline{C})=0,485$

**La réponse est 48,5%**

##### 10.2

$P(P|\overline{C})=\frac{P(P|\overline{C}).P(P)}{P(\overline{C})} = \frac{(1-0.6).(0.55)}{0,485} = 45,36\%$

**La réponse est 45,36%** 



### Exercice 11

La famille X souhaite installer une nouvelle cuisine équipée. Elle hésite entre les fabricants F1, F2, F3 et F4. A l’occasion de « Batibouw » F1, F2 et F3 se sont engagés à offrir les électroménagers. F4 n’a pas encore arrêté sa décision, mais on estime qu’il y a 6 chances sur 10 pour qu’il emboîte le pas aux autres. Si F4 n’offre pas d’électroménagers, la famille X l’écartera de son choix. Il y aura alors 25% de chances qu’elle choisisse F1 et 40% de chances qu’elle choisisse F2. Par contre, si F4 accepte d’offrir les électroménagers, il y aura alors 40% de chances que la famille X choisisse F4, 15% de chances qu’elle choisisse F1 et 25% de chances qu’elle choisisse F2. On a appris récemment que le choix de la famille X s’était porté sur F2, quelle est la probabilité que F4 ait finalement accepté d’offrir les électroménagers ?

#### Résolution

J'ai 29,03 ??

### Exercice 12

Chaque jour, on a relevé le nombre X de P.C. en panne dans une entreprise. Après étude des résultats, il s’avère que X est une variable aléatoire qui prend les valeurs suivantes :

| $X_i$         | 3    | 4    | 5    | 6    | 7    | 8    |
| ------------- | ---- | ---- | ---- | ---- | ---- | ---- |
| $Pr\{X=x_i\}$ | 0.05 | 0.15 | 0.60 | 0.10 | 0.06 | ???  |

1. Quelle est la valeur de la probabilité manquante ?
2. Calculer $E(X)$.
3. Calculer la probabilité qu’il y ait, aujourd’hui, un maximum de 5 pannes dans l’entreprise.

#### Résolution

##### 12.1

##### 12.2

##### 12.3

### Exercice 13

Une œuvre philanthropique a émis 90 000 billets de tombola numérotés de 10000 à 99999. 

Les prix sont les suivants : 

* Billet gagnant : 100 000 € 

* Lots de consolation : 
  * 4 derniers chiffres corrects : 5 000 € 
  * 3 derniers chiffres corrects : 500 € 
  * 2 derniers chiffres corrects : 5 €

1. Définir complètement la variable aléatoire « gain brut »
2. Définir complètement sa fonction de répartition.
3. Quel doit être au minimum le prix d’un billet si on veut que l’opération soit rentable ?

#### Résolution

##### X.1

### Exercice 14

L’entreprise GEGER fait appel à la firme IG pour la maintenance de son matériel informatique. Soit X la variable aléatoire « nombre de pannes par semaine ». Sur cette variable aléatoire, on dispose des renseignements suivants :

| $X_i$         | 2    | 3    | 4    | 5    | 6    | 7    |
| ------------- | ---- | ---- | ---- | ---- | ---- | ---- |
| $Pr\{X=x_i\}$ | 0.10 | 0.3  | p    | 0.15 | q    | 0.05 |

La réparation de chaque panne est facturée 175 €. L’entreprise GEGER a la possibilité d’engager un gradué en technologie de l’informatique au salaire mensuel de 2 835 € (charges patronales comprises). Si on considère qu’un mois correspond à 4 semaines, que doivent vérifier p et q pour que l’engagement du gradué soit rentable à long terme ?

#### Résolution

##### X.1

### Exercice 15

Un nouveau restaurant propose 3 menus aux prix respectifs de 20, 25 et 40 €. L’originalité de ce restaurant réside dans le fait que le menu est choisi aléatoirement. Le client n’a donc aucun pouvoir de décision ! Toutefois, pour des raisons d’intendance, 50% des menus servis sont des menus à 20 €. Ce pourcentage est de 30 pour les menus à 25 €. Un inspecteur d’un guide bien connu se rendra 3 jours de suite dans ce restaurant. Toutefois, s’il teste un menu à 40 €, il ne reviendra pas dans ce restaurant.

1. Définir la V.A. X « dépense totale effectuée par cet inspecteur dans ce restaurant ».
2. Combien cet inspecteur doit-il s’attendre à dépenser ?

#### Résolution

##### X.1

### Exercice 16

La durée d’un meeting politique est une V.A. dont la loi de distribution est inconnue. Tout au plus sait-on que l’espérance est évaluée à 2h30 et l’écart-type à 45 minutes.

1. Quelle est la probabilité que la durée d’un meeting politique se situe entre 1h30 et 3h30 ?
2. Dans au moins 75% des cas, dans quel intervalle centré en l’espérance, se situe la durée d’un meeting politique ?

#### Résolution

##### X.1





### Exercice 17

1. XXXXX

#### Résolution

##### X.1

### Exercice 18

1. XXXXX

#### Résolution

##### X.1

### Exercice 19

1. XXXXX

#### Résolution

##### X.1

### Exercice 20

1. XXXXX

#### Résolution

##### X.1

### Exercice 21

1. XXXXX

#### Résolution

##### X.1

### Exercice 22

1. XXXXX

#### Résolution

##### X.1

### Exercice 23

1. XXXXX

#### Résolution

##### X.1

### Exercice 24

1. XXXXX

#### Résolution

##### X.1

### Exercice 25

1. XXXXX

#### Résolution

##### X.1

### Exercice 26

1. XXXXX

#### Résolution

##### X.1

### Exercice 27

1. XXXXX

#### Résolution

##### X.1

### Exercice 28

1. XXXXX

#### Résolution

##### X.1

