# Couche 2 : Data link layer

La **Couche 2** gère la mise en oeuvre matérielle et Logicielle.

Une **trame** est le nom donnée aux données qui transites par la couche 2.

Cette couche à pour but de gérer l'accès au support. elle fait le lien entre le hardware et le software de la couche 1. Un bon exemple de la couche 2 est la carte réseau.

**Gérer l'accès au média** Désigne la préparation de la communication pour la transmission sur un média spécifique. Une espèce de formatage de la trame pour l'adapter au média

**Gérer l'accès au réseau** désigne les stratégies mises en place pour la communication (en étoile , maitre-esclave, tour par tout, acces simultané (attention aux collisions))

Les transmissions émises via la technologie **Courant Porteur en Ligne** sont sujettent aux interférences car les câbles électriques ne sont pas torsadés

**Piconet** : Réseau bluetooth qui est composé d'*un maitre* et de *plusieurs esclaves*.

**protocols déterministes** : Token Bus, Token Ring, FDDI, Fiber channel.

**Accès aléatoire** : solution pour un accès multiple au canal de transmission.

**WaveLength Division Multiplexing** : partage

## Transmision STP

**Transmission STP** : port racine et ports désignés actifs.

Le STP désactive logiquement les liens physique dans un réseau cmposé de switch pour éviter des boucles.

## IEEE
### 802.1D : Spanning tree protocol
30 à 60 microSec pour la création d'un arbre

### 802.3 : Ethernet
Optimiste en CSMA/CD. Le temps de référence pour éviter les collisions est de 51.2 microSec.

### 802.4 : Token Bus
Deterministe

### 802.5 : Token Ring
Déterministe, capture de jeton, anneau logique et un anneau physique

### 802.11b : Wlan Wifi
Optimiste en CSMA/CA

On évite les collisions via le Virtual carrier pass : RTS/CTS

### 802.15 : Bluetooth
Sa spécification correspond à un usage particulier.

### 802.16 : WIMAX


## Traitements

A la réception, une **trame** est considérée **correcte** si elle est composée d'un **délimiteur de début**, est composée d'un **délimiteur de fin**, de **longueur correcte** (telle qu'annoncée dans la trame), a une **somme de contrôle correcte**

Il existe deux méthodes au niveau de la couche *liaison de données* afin de traiter les *retransmissions*.

Arbitrated loop : 3 architectures gérées par le Fiber channel.

## Arbre de recouvrement
Un réseau est un arbre de recouvrement si il ne contient pas de boucles et est suffisant que l'on puisse atteindre toutes les stations du réseau (délai de mise en oeuvre d'un arbre minimum est compris entre 30 et 60).

### Go Back N

L'idée derrière le principe de **Go-Back-N** est de *recommencer* la transmission à la trame *perdue* en « ignorant » que l’on a déjà transmis certaines trames et ce même si celles-ci ont bien été *reçues*.

On retransmet donc la trame perdue et toutes celles que l’on avait déjà transmises. Ceci a comme avantage de ne pas demander de *ressources* particulières du côté du receveur et est *facile* à implémenter. Comme désavantage on notera une baisse de rapide de *la performance* dés que *le taux d'erreurs* sur la ligne physique augmente.

### Selective Repeat

La 2ème méthode, **Selective Repeat**, est basé sur le fait que ne seront retransmises que *les trames* perdues et uniquement les trames *perdues*. On évite donc de retransmettre inutilement des trames déjà transmises et reçues correctement à la destination. *Selective Repeat* a donc de meilleures performances que *Go‑Back‑N* lorsque la couche physique est mauvais.

L'implémentation en est plus complexe : le récepteur devant *stocker* dans un buffer les trames reçues hors séquence et les réordonner avant de les *délivrer* à la couche supérieure.

## MAC adress

MAC : Medium access card : 6 bytes (type : XX:XX:XX:XX:XX:XX).


## L'exemple de L'ethernet

Dans le protocol ethernet, on identifie chaque device du réseau par sa **mac adresse**.

A l'origine, les réseaux ethernet étaient disposées en bus. Le transfert de données en bus est une communication autour d'un médium (ex :coaxial) partagé par plusieurs pc. Ils fonctionnenet en CSMA/CD que plusieurs pc se partagaient. c'est à dire que quand un pc voulaient communiquer avec les autres, il devait :

* vérifier que personne ne transmettait de données avant d'en émettre.
* Puis émettre publiquement en spécifiant le destinataire en ayant confiance dans le fait qu'il n'y ait que l'utilisateur à qui le message est destiné qui lise celui-ci.
* Si deux communications venaienet à entrer en collision, les 2 devices lancent un timer aléatoire et réesayeront quand celui-ci sera terminé.

> \> *10 base 2* et *10 base 5* représentent respectivement le thin et le thick internet qui sont de 200m de cable à 500m de cable pour le thick.

Le bus sous la forme d'un cable à ensuite été remplacé par un hub. qui fonctionnait sur le même principe mais qui offrait des coûts bien plus avantageux.

----------- image bus de communication

Le désavantage de ce système de communication logique en bus est l'impossibilité de communiquer à plusieurs à la fois et de ne pas savoir émettre et recevoir. cet ancien modèle (**half duplex**) à fait place au modèle 10 base T ( t pour twisted pair ) qui est un full duplex. qui utilise aussi le CSMA/CD.

## Sans fil Wifi

2 types architectures :
* infrastructure
* Wifi

## CSMA

### CSMA/CD
Collision detection. EX 802.11g
### CSMA/CA
collision avoidance

### Switch

Un Switch est un équipement réseau lié à la *couche 2* qui permets la mise en oeuvre de plusieurs domaines de collision.

Un switch fonctione comme un hub à la différence prêt qu'il est capable de fonctionner en full duplex grâce à une table de correspondance des macs adresse et de ses ports physiques permettant une transmission en simultané entre plusieurs devices sans envoyer à tout le monde les messages.

## transfert d'informations sur un médium

* Unicast : 1 à 1
* Multicast : 1 à plusieurs
* Broadcast : 1 à tous ( s'étend jusqu'à rencontrer un router)

## Remplissage de la Mac Table

1. La mac table est vide
2. Un ordinateur émet (la table ajoute la mac et son port physique) (**Learning**)
3. On broadcast sur le réseau(**Floading**) (si le message nous est destiné, on envoie une réponse(**Selective Forwarding**). On drop le message si ce n'est pas le cas.)

La forte tolérance aux pannes du protocole FDDI est dûe principalement à la double boucle contrarotative

## Méthode d'accès optimistes ou aléatoires

* CSMA/

## Types de protocols d'accès multiples au canal de transmission

Il existe trois types de protocole d'accès multiple au canal de transmission :

    Le [partage / partitionnement du canal de transmission
    L’accès aléatoire (CSMA/CD, [CSMA/CA, …)
    La [rotation (l’attente de son tour ou du jeton)

Il est aussi possible de différencier ces accès multiples au canal de transmission selon que la solution soit statistique ([optimiste) ou [déterministe  (pessimiste).

Pour ce qui des solutions [optimistes, on laisse les ordinateurs transmettre plus ou moins à [leur guise en espérant qu’un seul ne transmettra à la fois. Cet algorithme est distribué et est conçu pour résoudre le problème des [collisions  (qui seront inévitables).

D'un autre côté, pour les solutions [déterministes, on veut à tout prix éviter que deux ordinateurs ne transmettent en même temps. Une [autorisation à émettre est donnée, le jeton, pour qu'un seul appareil ne transmette à la fois. Cet algorithme est aussi [distribué et permet de gérer [l'anneau et le jeton.


###

La capacité à se mouvoir entre plusieurs points d’accès disposés de telle sorte que les clients puissent se déplacer sur toute la zone de couverture de manière invisible et sans perte de connexion s'appelle le **roaming**.

Le mécanisme de retransmission "Selective Repeat" a comme fonction de redemander la transmission de toutes les trames transmises depuis la dernière bien reçue en séquence. --> faux
Redemander uniquement les trames non ou mal reçue.

Avant de transmettre une trame, une station participant à un réseau 802.5 Token Ring doit d'abord écouter le canal de transmission et ensuite capturer le jeton.-- faux : Pas d'écoute du canal de transmission pour les protocoles déterministes

Au niveau des protocoles de la couche Liaison de Données, à quoi sert le timer associé à l'échange des trames ? A détecteur les erreurs de transmission

La méthode permettant de profiter d'une trame de données dans une communication bidirectionnelle pour acquitter (ACK) une trame de données du sens inverse est nommée Piggy-Back.


La méthode d'accès de type CSMA/CA fait partie des méthodes d'accès optimistes au canal de transmission.

Le champ [ACK présent dans une trame de données sert A acquitter une trame précédemment reçue

Une trame 802.3 Ethernet doit avoir une longueur minimale permettant ainsi de détecter les collisions pendant sa transmission sur le canal de transmission.

La technologie Courant Porteur en Ligne utilise comme canal de transmission ;  le câblage électrique

Dans la cadre du protocole 802.5 et son anneau physique, une station a un rôle particulier dans la gestion de l'anneau. Elle se nomme le moniteur

Non répondue
Noté sur 1,00
Marquer la question
Texte de la question

Avant de transmettre une trame, une trame participant à un réseau 802.4 Token Bus doit d'abord écouter le canal de transmission. -- > faux


Trunking : agréggation de plusieurs vlans sur une même ligne.

Le switch  utilise la mac source contenue dans la tramme pour compléter sa mac table. Il permets de créer différents vlans sur base de leurs ips




\newpage
