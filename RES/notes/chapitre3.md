# Couche 3 : Network

Une **paquet** est le nom donnée de données qui transites par la couche 3.

Le routeur est l'appareil représentatif de cette couche

L'objectif principal de la couche réseau est d'acheminer les paquets de la source à la destination.

**ARP** : Le protocole qui permet d'obtenir une adresse MAC sur base d'une adresse IP  
**ICMP** : Le protocole qui permet de gérer les erreurs de la couche Internet  
**BGP-4** : protocole de type Exterior Gateway Protocol et permet le routage de paquets IP entre Autonomous System
**IP** : Le protocole qui permet le transfert de la source à la destination (de bout en bout) d'un paquet  
**OSFP** : Le protocole qui permet l'établissement dynamique de tables de routage sur base du principe du "Etat de liaisons".
**RIP** : Le protocole qui permet l'établissement dynamique de tables de routage sur base du principe du "vecteur de distance"

IP Header + Segment = paquet

Taille adresse IPV4 : 32 bits = 4 bytes
Taille adresse IPV6: 128 bits = 16 bytes

En IPv4, une adresse IP est constituée d'une partie "réseau" et d'une partie "hôte" le tout sur une longueur de 32 bits.

Dans un paquet IPv4, les champs "Drapeau" (flag) et "Position relative" (offset) servent à réordonner à destination les fragments d'un même paquet.

Le routage dynamique qui établit le plus court chemin entre deux hôtes sur base du nombre de saut (hop) est le routage par vecteur de distance.

Le protocole BGP-4 est un protocole de type Exterior Gateway Protocol et permet le routage de paquets IP entre Autonomous System.

L'échange de messages LSP est une des étapes nécessaires pour établir des tables de routage selon le principe du routage par Etat de liaisons

Lorsque le champ Time-To-Live (TTL) d'un paquet IPv4 est égal à 0 (zéro) : il est jeté par le routeur

**NAT** : Network address Translation. Un des procédés mis en place pour pallier au manque d'adresse IPv4 et dont le principe est de "traduire" une adresse IPv4 privée en une adresse IPv4 routable sur Internet.


## ConnexionLess (Sans connexion)
Aucune connexion n'est établie avant d'envoyer les paquets de données

L'expéditeur ne sait pas:

* si le récepteur est actif et Présent
* si le récepteur est arrivé
* si le récepteur sait lire le message

Le récepteur ne sait pas: quand le message arrive

## Best Effort (au mieux)
Rien n'est fait pour garantir la réception des paquets. Son but est de garantir le transport le plus rapide possible avec le moins de pertes possibles.

## Indépendance par rapport au média
Peu importe le média physique utilisé.
> \> fibre optique, cuivre, ethernet, ...

## L'importance des réseaux et sous-réseaux

La subdivision permets de **faciliter l'administration** réseau. Elle influence aussi les **performances** et la **sécurité**. En subdivisant, on réduit le domaine de broadcast et celà nous permets de mettre en place des mesures de protection (ex : firewalls)

## Adresses IPV4
XXX-XXX-XXX-XXX sur 32 bits
(reseau)-(reseau)-(sousréseau)-(hôte)

## Routage et commutation

Le routeur et le commutateur (ex : switch) se diffèrent par leur implication dans le transport de données   

| Fonction | Router | commutateur |
|----|----|----|
| Vitesses | Lent | Rapide |
| couches OSI | Couche 3 | Couche 2 |
| Adresses | IP | MAC |
| Broadcast | Bloqués | Transmis |
| Sécurité | Elevées | Faible |

## Rôle des périphériques intermédiaires : l'importance de la paserelle

La paserelle fait la liaison entre deux réseaux (internet et local).
Une **route** est un *réseau de destination*, un *masque* et *la gateway (paserelle)*.

## Flux de données

Lors de l'arivée dans un noeud du reseau :

1. supprime l'encapsulation de couche 2
2. Extraction de l'ip de destination
3. Recherche de correspondance dans la table de routage
4. Si le Reseau est trouvé
5. Réencapsulation
6. Envoi

### Recherche dans la table de routage:

* trouves : ok
* trouves pas: on vérifie la Porte par défaut :
  * Oui : Ok
  * non : On abandonne

## Adressage IP
### Classes

* classe A :
### Le Masque

### __

Deux organisations existent au sein de la couche réseau. La première est la vision des opérateurs de téléphonie classique qui se base sur le principe « orienté connexion et fiable ». Cette organisation nécessite une ouverture  de connexion à laquelle est associée une négociation de paramètres de connexion. Une communication bidirectionnelle complétée du respect de la séquence des paquets émis constitue le transfert de données. Le contrôle de flux et la fermeture de connexion sont d’autres éléments qui caractérisent cette organisation de la couche réseau. Il s’agit d’un réseau à commutation de circuits ou à circuits virtuels

La deuxième organisation,  sans connexion et non fiable, est le choix fait pour Internet. Cette approche permet de limiter la complexité de la couche réseau qui implique de facto des pertes de données, des données dupliquées ou réordonnées. Si besoin est d’une certaine fiabilité, celle-ci sera assumée au mieux soit par la couche transport ou par la couche application. Il s’agit ici d’un réseau à datagramme ou à commutation de paquets.


### __

La deuxième méthode d'établissement dynamique de table de routage est basée sur le principe "Etat de liaisons". L'objectif est obtenir une topologie  complète du réseau. Quatre étapes sont nécessaires pour obtenir les tables de routage permettant d'acheminer les paquets par le meilleur chemin.

Il est donc nécessaire, pour un routeur, de découvrir ses voisins: ceci est réalisé via l'envoi d'un message "Hello" sur tous ses liens. Il est aussi nécessaire de déterminer le délai pour atteindre ces voisins : le message "Hello" et sa réponse permettent de déterminer cet élément. Un point est à garder en mémoire : doit-on ou non tenir compte de la charge  de la ligne en faisant passer le message "Hello" en tête ou en fin du buffer d'envoi ?

Ces informations (reprenant une topologie partielle du réseau)  sont assemblées en un message spécifique (Link State Packet) envoyé à tous les autres routeurs du réseau par le principe de flooding.

Les routeurs récoltent ainsi les LSP et les assemblant chacun pour obtenir une topologie complète du réseau et établir via l'algorithme de Dijkstra (Théorie des graphes) les tables de routage.

### __

Que ce soit un réseau à circuits virtuels  ou commutation de paquets, il est nécessaire d’avoir un adressage unique  pour permettre une communication entre tous les équipements participants au réseau.

Dans un réseau basé sur le protocole IP, que ce soit en IPv4 ou en IPv6, il est difficile de retenir une adresse IP. C’est pourquoi un nom peut-être associé à une adresse IP afin d’en faciliter la mémorisation et donc l’utilisation. Des protocoles applicatifs  seront donc mis en place pour permettre de gérer la distribution d’adresses IP ainsi que la résolution du nom en une adresse IP.

Une adresse IPv4 est constituée de 32 bits  dont la notation est décimale  par octets séparés par un point ( . ). Il est donc théoriquement possible d’adresser plus de 4 milliards  d'hôtes.

Une adresse IPv6 est quant à elle constituée de 128 bits avec une notation hexadécimale par 16 bits séparé par un double point ( : ). Il est possible via ces 16 octets d’adresser plus de 3.4 x 10 exposant 38  hôtes.

### __

Il est nécessaire que l'établissement dynamique  des tables de routage puisse se faire avec un niveau de convergence très bas et en étant capable de s'adapter aux événements  du réseau : ajout de liens, de routeurs ou pannes.

Pour la méthode "vecteur de distance", les routeurs détectant une panne  d'une ligne enverront un vecteur de distance annonçant une distance infinie  pour les destinations utilisant cette ligne.

Néanmoins cette méthode a ses limites (si plusieurs pannes) : les routeurs concernés risquent de s'annoncer l'un l'autre la possibilité d'atteindre la destination en augmentant à chaque itération  la distance pour arriver à destination. Un comptage infini en est le résultat.

Pour pallier à cet effet non désiré, il est possible d'utiliser l'horizon partagé  avec ou sans empoisonnement. Le principe de base est identique : ne pas avoir un vecteur par routeur mais bien un vecteur par ligne  active. Ligne active sur laquelle on n'annonce pas les destinations que l'on peut atteindre via cette ligne (sans empoisonnement) ou avec une distance  infinie (avec empoisonnement).

### __

Le routage, au niveau de la couche réseau, est un élément important dont l'objectif est d'acheminer les paquets depuis la source jusqu'à la destination. Ceci ne peut être réaliser que s'il est possible d'établir le meilleur  chemin entre les source et destination.

Il est donc nécessaire de mettre en place au sein des routeurs, de manière statique  ou dynamique, des tables de routages au plus proche de la réalité du terrain.

Statiquement il est effectivement possible d'établir des tables de routage mais seulement dans un environnement réseau maitrisé.

En ce qui concerne le routage dynamique  deux méthodes existent : vecteur de distance  et état de liaisons.

Pour la méthode vecteur de distance, le routeur envoie à intervalle régulier  un vecteur contenant les informations "adresse de destination" et "distance jusqu'à cette adresse". Le vecteur reçu par un routeur est complété des meilleures informations à disposition du routeur et envoyé aux autres routeurs du réseau. L'assemblage des divers vecteurs de distance via l'algorithme de Ford-Bellman (théorie des graphes) permet de déterminer les meilleures routes et de facto les tables de routages.

\newpage
