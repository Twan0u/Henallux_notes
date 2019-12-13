* Qui écrit 
* "Facture Client"
* client 
    * titre/civilité, Nom, Prénom ou Siège Sociale et forme juridique ( SA, SPRL, ... ) (String (ex: Monsieur Tartempion Joseph) 
    * adresse 
        * rue (String : Boulevard du Nord)
        * nunéro (String : 22 et pas int car il peut y avoir des numéros bis (ex : 22bis))
        * code postal (Int sauf si on accepte les codes postaux de pays étrangers ex : UK) 
        * localité (String ex : Namur)
    * numéro TVA ( Vide ou Un string )
* date de création du document ( Type date )
* numéro de client ( ex : 0001/02 )
    * numéro d'identfication ( int ex : 0001 )  
    * Version du client ( optionnel mais utile si le client change d'adresse ) (int ex : 02 )
* numéro de document (ex : CC150417/123)
    * Code document (String : CC pour copie carbon
    * numéro d'identification (int (ex 150417)
    * version du doc (int ex : /123)
* Notes d'envoi
    * "Note D'envoi"
    * Identifiant de la note ( int ex: 456839 ) 
    * date (type date  ex : 22/03/2015)
    * Tableau des produits vendus
        * produit
            * code ( String ex : STR001 )
                * 3 letres du fournisseur (string : str pour Strada) 
                * code article (int : numéro de l'article chez Strada (ex : 001))
            * Nom produit (String :  ex : Cable RJ45 ) 
            * commentaire ( ce produit est garanti 2 ans ... ) 
            * prix unitaire (double :  dernier prix connu )
            * Quantité (double car on peut avoir besoin de demi unités (ex cable au mètre ))
            * BO (=back order = ce qu'il reste à livrer)  Quantité commandée - Quantitée livrée
            * tva (int : tva en application pour ce produit)
            * total hors tva ( calculé sur base des informations précédentes )
* Tableau d'application de la TVA (calculé sur base des notes)
    * hors tva (total des montants avec le même taux de tva ) 
    * taux de tva relatif (int )
    * tva calculée (double)
    * montant de l'achat tva comprise (double)
* Conditions de paiement 
     "ex : 30 jours fin du mois"
* Limite de crédit 
    * propre au client ? 
    * égale max 2500€

Commande avec une quantité demandée liée avec une note d'envoie et sa quantité