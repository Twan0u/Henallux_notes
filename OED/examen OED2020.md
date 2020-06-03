# Question 1

Article ->

* ( nom du rayon ),
*  la référence de l’article , 
* le libellé
* prix pour chaque taille disponible [xxs,xs,s,m,l,xl,xxl]

plus vite possible prix d'un article sur base du rayon  puis de la référence et la taille de l'article

<arbre> vs <tableau> 

# Question 2

pDébutVendeurs. 

[nom d'un vendeur I Informations |chainon précédent|chainon suivant ]

```
module(SupprimerPremierNoeud;pDébutVendeurs;)

---* SupprimerPremierNoeud
pDébutVendeurs = pDébutVendeurs->pSuivant
liberer pDébutVendeurs->pPrécédent
pDébutVendeurs->précédent = NULL
------
```



# Question 3

```
module(SupprimerPremier;pRacine;)

---* SupprimerPremier
current = pRacine
if (current->pGauche == NULL)  
pRacine = current->pDroit
liberer current
else 

do while (current->pGauche->pGauche != NULL)
current = current->pGauche
enddo
noeudASupprimer = current->pGauche
current->pGauche = current->pGauche->pDroit
liberer noeudASupprimer

endif
```



# Question 4

# Question 5

```
module(listing;racine;)
---*
chAfTotalMax = 0 
module(parcoursRécursif;racine;)
------
module(parcoursRécursif;pNoeud;)
---*

chAfTotal =0
pSuccursale = pNoeud->Succursales
do while (pSuccursale -> pSuiv != null)
iMois = 0
do while (iMois < 12)
chAfTotal += chA[iMois]
iMois ++
enddo

enddo
if (chAfTotal > chAfTotalMax)
chAfTotalMax = chAfTotal
nomPaysMaxChAf = pNoeud->nom
endif
module(parcoursRécursif;pNoeud -> pGauche;)
module(parcoursRécursif;pNoeud -> pDroit;)
sortir nomPaysMaxChAf
------

```



# Question 6

```
module(AjoutArticleManquant;articleNonDisponible,nombreExemplaires;)
---*
pNouv = adresse mémoire nouveau chainon
pNouv->référence = articleNonDisponible
pNouv->nbExemplaires = nombreExemplaires
pNouv->pPrec = NULL
pNouv->pSuiv = NULL

if (pDébutArticlesManquant == NULL) // cas liste vide
pDébutArticlesManquant = pNouv
else

if (pDébutArticlesManquant->référence>pNouv->référence)// cas élément à placer en premier
pNouv->pSuiv = pDébutArticlesManquant
pDébutArticlesManquant = pNouv
else
 
// cas d'un élément à placer au milieu
current = pDébutArticlesManquant->pSuiv
do while (current->psuiv != NULL current->référence > pNouv->référence)
current = current->psuiv
enddo
if (current->référence > pNouv->référence ) // cas d ajout d'un élément au milieu
pNouv->pPrec = current->pPrec
pNouv->pSuiv = current
current->pPrec=pNouv
else // cas d'ajout d'un élément en fin
pNouv->pPrec = current
current->pSuiv=pNouv
endif
endif
endif
------
```



```
module(commandeArticle;référenceArticle,nombreExemplaires;prixArticle,nbExemplairesNonLivrables)
```

```

```

