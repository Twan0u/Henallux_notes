# Analyse des Processus Métiers

## Cours 1 : Analyse d'un bon de commande client  
    
* Qui écrit 
* "bon de commande"
* client 
    * titre/civilité, Nom, Prénom  ou Siège Sociale 
    * adresse 
        * rue
        * nunéro
        * code postal
        * localité
        * Pays
    * numéro TVA
    * (implicite : maximum de crédit ) 
    * forme juridique ( SA, SPRL, ... )
* date de création du document
* numéro de client
    * numéro d'identfication
    * Version du client ( optionnel mais utile si le client change d'adresse )
* numéro de document ( cc1234 peut voloir dire commande client ) 
* Tableau des produits vendus 
    * code 
    * produit 
        * commentaire ( ce produit est garanti 2 ans ... ) 
        * code
        * libellé
        * prix unitaire ( dernier prix )
        * tva
    * Quantité
* Tableau d'application de la TVA
* Condition de paiement: 30 jours fin de mois 
* Limite de crédit: 2500 eur ( montant maximum des montants impayés )

Pour chaque entrée, il faut trouver le type de données ( String, entier, ... )