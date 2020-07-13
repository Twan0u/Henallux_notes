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

##### 5.2

##### 5.3

##### 5.4

##### 5.5



### Exercice 6

Lors de manœuvres un soldat doit aller d’un point A à un point B. Pour ce faire, il doit traverser 3 rivières successives. Deux ponts permettent de traverser la 1ère rivière, 3 ponts permettent de traverser la 2e et la 3e rivière. A l’occasion de ces manœuvres, 30% des ponts de la région ont été « minés ». Quelle est la probabilité que le soldat arrive au point B trempé (sachant qu’il ne pleut pas) ?

#### Résolution

##### 

### Exercice 7

La population scolaire d’une haute école est répartie de la façon suivante : Hénallux | 3 1 ère année : 55% 2 e année : 25% 3 e année : 20% On constate un taux d’absentéisme global de 15%. On sait que seulement 5% des étudiants de 3e sont des brosseurs et que 12% des élèves de 2e les imitent. Quelle est la probabilité qu’un étudiant de 1ère choisi au hasard soit assidu au cours ?

#### Résolution

##### 



### Exercice X

1. XXXXX

#### Résolution

##### X.1



