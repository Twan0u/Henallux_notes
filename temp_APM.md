# Analyse des Processus Métiers

## Cours 1 : Analyse d'un bon de commande client  
    
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
* numéro de document (String ( ex : cc1234 peut voloir dire commande client ) ) 
* Notes d'envoi
    * "Note D'envoi"
    * Identifiant de la note ( int ex: 456839 ) 
    * date (type date  ex : 22/03/2015)
    * Tableau des produits vendus
        * produit Ligne Lx2 signifie que la ligne se répète 2 fois
            * code ( String ex : STR001 ) letres du fournisseur (string : str pour Strada) - Code article (int : numéro de l'article chez Strada (ex : 001))  

            * Nom produit (String :  ex : Cable RJ45 ) 
            * commentaire ( ce produit est garanti 2 ans ... ) 
            * prix unitaire (double :  dernier prix connu )
            * Quantité (double car on peut avoir besoin de demi unités (ex cable au mètre )) float ( 6 entiers et 2 décimales , >0 ? , >=0 ?)
            * BO (=back order = ce qu'il reste à livrer) 
            * tva (int : tva en application pour ce produit)
            * total hors tva ( calculé sur base des informations précédentes )
* Tableau d'application de la TVA
    * hors tva (total des montants avec le même taux de tva ) 
    * taux de tva relatif (int )
    * tva calculée (double)
    * montant de l'achat tva comprise (double)

## Le Processus itératif 

Lors du développemement d'un projet, il est important de bien analyser pour mieux développer. il existe pour celà des outils de gestion et des méthodes ( scrum, agile, ... ) qui peuvent être mise en place pour garantir une meilleure gestion du développement. 

## BPMN

En Bpmn, on peut créer une sous tâche si celle-ci est automatisable. 

> Keep It Simple And Stupid

Une lane regroupe plusieurs entités qui sont regroupées dans une structure plus grosse ( ex : section comptable et de R et D d'une boîte peuvent être deux lanes d'un même pool )
