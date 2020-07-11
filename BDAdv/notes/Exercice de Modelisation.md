# Exercice de Modélisation

[TOC]

## Enoncé

Il vous est demandé de modéliser au niveau conceptuel (diagramme E-A) la base de données nécessaire au support des activités d’une infirmière à domicile. Cette dernière doit pouvoir générer des factures pour les soins qu’elle preste chez ses patients. Identifiez correctement les T.E. et T.A., listez toutes les contraintes additionnelles. 

A chaque soin est attribué un prix qui dépend de la catégorie du patient. Un patient peut recevoir plusieurs soins durant les différents passages que l’infirmière peut réaliser durant la journée (maximum 3 passages par jour). En plus du prix des soins, les infirmières perçoivent un montant forfaitaire pour chaque passage. Le premier passage rapporte plus que le deuxième et le deuxième rapporte plus que le troisième. 

Les prix des soins évoluent avec le temps (indexation). Les prix appliqués dans le futur sont injectés en avance dans la base de données. Votre système doit le prévoir mais à tout moment T, pour un produit P, il ne peut y avoir qu’un seul prix appliqué. Il serait également intéressant de pouvoir sortir des statistiques sur l’évolution des prix des soins. 

Les soins qu’un patient peut recevoir sont prescrits par un médecin, pour une certaine durée et avec une certaine fréquence. Votre système proposera pour chaque soin pouvant être prescrit une rubrique d’information (photos, vidéos d’un acte technique, descriptif, coordonnées de personnes de référence…). 

Au début de chaque mois, les infirmières sortent sur papier les factures des prestations réalisées durant le mois précédent. Les mêmes informations que celles apparaissant sur la facture sont transmises par voie électronique aux mutualités concernées. Il existe plusieurs mutualités et chacune paie l’infirmière pour les soins réalisés chez ses affiliés. Chaque facture est constituée d’un numéro (unique, incrémenté, remis à 0 chaque année), des coordonnées de l’infirmière (coordonnées postales et bancaires), des coordonnées postales de la mutualité, du listing des soins réalisés (passage, date, quantité), du prix de chaque soin et du total facturé. 

Suite au traitement des factures, les mutualités envoient par voie électronique un accusé de réception détaillé qui sera interprété par votre système. Il arrive parfois que les mutualités rejettent des factures de manière partielle (ex : sur les 10 soins facturés, 9 sont acceptés, le dernier est rejeté car il manque des pièces justificatives). Le système doit permettre de regénérer une facture qui ne contient que les soins qui n’ont pas été acceptés par la mutualité lors d’une facturation précédente. Il faut également pouvoir sortir des statistiques sur le nombre d’erreurs retournées par les mutualités avec une granularité d’une année. 

 souhaitez de plus améliorer le quotidien des infirmières en optimisant leurs tournées à l’aide d’un algorithme. Vous décidez donc de mémoriser pour chaque patient l’adresse où les soins sont prestés. De plus, il est nécessaire de retenir le circuit parcouru par l’infirmière durant chaque journée. En effet, le calcul du prix facturé prend en compte le déplacement de patient en patient. Exemple de tournée : 

| Heure | Départ                   | Arrivée   | Distance parcourue |
| ----- | ------------------------ | --------- | ------------------ |
| 6:15  | Domicile de l'infirmière | Patient A | 12Km               |
| 6:45  | Patient A                | Patient B | 6Km                |
| 7:10  | Patient B                | Patient C | 2Km                |

Le patient A aura en plus du prix des soins une distance de 12km*0.24€/km facturé. Le patient B aura en plus du prix des soins 6km*0.24€/km facturé. Le montant de 0.24€/km est fonction du type de voiture (diesel, électrique…) employé par l’infirmière. L’information sur le total parcouru est également intéressante statistiquement parlant pour l’infirmière. 

Votre public cible : les infirmières belges (les contraintes légales, règles de facturation… sont spécifiques à la Belgique). Le système sur lequel vous travaillez sera dans un premier temps lancé en Wallonie, mais pourra à terme être lancé en Flandre et également dans les régions germanophones. Il vous est demandé de « prévoir le coup ». Enfin, votre système doit prévoir la facturation pour plusieurs infirmières à domicile (ex : équipe, groupement…).



## Solution

Il y a 9 paragraphes contenant des informations dans ce document : 



### §1

> A chaque soin est attribué un prix qui dépend de la catégorie du patient. Un patient peut recevoir plusieurs soins durant les différents passages que l’infirmière peut réaliser durant la journée (maximum 3 passages par jour). En plus du prix des soins, les infirmières perçoivent un montant forfaitaire pour chaque passage. Le premier passage rapporte plus que le deuxième et le deuxième rapporte plus que le troisième. 

1. Repérer les Objets/Personnes (appelées entités)
2. Repérer les caractéristiques de ces différents objets/personnes 



### §2

>Les prix des soins évoluent avec le temps (indexation). Les prix appliqués dans le futur sont injectés en avance dans la base de données. Votre système doit le prévoir mais à tout moment T, pour un produit P, il ne peut y avoir qu’un seul prix appliqué. Il serait également intéressant de pouvoir sortir des statistiques sur l’évolution des prix des soins. 

Quand l'évolution d'une information comme un prix doit être sauvegardée au cours du temps, il est intéressant de la noter dans une entité différente. 

### §3

> Les soins qu’un patient peut recevoir sont prescrits par un médecin, pour une certaine durée et avec une certaine fréquence. Votre système proposera pour chaque soin pouvant être prescrit une rubrique d’information (photos, vidéos d’un acte technique, descriptif, coordonnées de personnes de référence…). 



### §4

>Au début de chaque mois, les infirmières sortent sur papier les factures des prestations réalisées durant le mois précédent. Les mêmes informations que celles apparaissant sur la facture sont transmises par voie électronique aux mutualités concernées. Il existe plusieurs mutualités et chacune paie l’infirmière pour les soins réalisés chez ses affiliés. Chaque facture est constituée d’un numéro (unique, incrémenté, remis à 0 chaque année), des coordonnées de l’infirmière (coordonnées postales et bancaires), des coordonnées postales de la mutualité, du listing des soins réalisés (passage, date, quantité), du prix de chaque soin et du total facturé. 



### §5

>Suite au traitement des factures, les mutualités envoient par voie électronique un accusé de réception détaillé qui sera interprété par votre système. Il arrive parfois que les mutualités rejettent des factures de manière partielle (ex : sur les 10 soins facturés, 9 sont acceptés, le dernier est rejeté car il manque des pièces justificatives). Le système doit permettre de regénérer une facture qui ne contient que les soins qui n’ont pas été acceptés par la mutualité lors d’une facturation précédente. Il faut également pouvoir sortir des statistiques sur le nombre d’erreurs retournées par les mutualités avec une granularité d’une année. 



### §6

> souhaitez de plus améliorer le quotidien des infirmières en optimisant leurs tournées à l’aide d’un algorithme. Vous décidez donc de mémoriser pour chaque patient l’adresse où les soins sont prestés. De plus, il est nécessaire de retenir le circuit parcouru par l’infirmière durant chaque journée. En effet, le calcul du prix facturé prend en compte le déplacement de patient en patient. Exemple de tournée : 



| Heure | Départ                   | Arrivée   | Distance parcourue |
| ----- | ------------------------ | --------- | ------------------ |
| 6:15  | Domicile de l'infirmière | Patient A | 12Km               |
| 6:45  | Patient A                | Patient B | 6Km                |
| 7:10  | Patient B                | Patient C | 2Km                |

### §7

>Le patient A aura en plus du prix des soins une distance de 12km*0.24€/km facturé. Le patient B aura en plus du prix des soins 6km*0.24€/km facturé. Le montant de 0.24€/km est fonction du type de voiture (diesel, électrique…) employé par l’infirmière. L’information sur le total parcouru est également intéressante statistiquement parlant pour l’infirmière. 



### §8

>Votre public cible : les infirmières belges (les contraintes légales, règles de facturation… sont spécifiques à la Belgique). Le système sur lequel vous travaillez sera dans un premier temps lancé en Wallonie, mais pourra à terme être lancé en Flandre et également dans les régions germanophones. Il vous est demandé de « prévoir le coup ». Enfin, votre système doit prévoir la facturation pour plusieurs infirmières à domicile (ex : équipe, groupement…).

