# Chapitre 4 : Couche transport

Pas d'appareils représentatifs.

Le but de la triple poignée de mains pour l'ouverture de connexion TCP est de synchroniser les numéros de séquence, les numéros d'acquit et d'échanger la taille des fenêtres TCP.

Le contrôle de flux associé au protocole TCP est aussi appelé le principe de Fenêtre glissante

La couche transport offre deux types de services : sans connexion non-fiable et orienté connexion fiable.

L'adressage utilisé au niveau de la couche transport, le port, peut avoir une valeur entre 1 à 65535. Un certain nombre de ces ports est réservé pour les ports "bien connus" (Well Known ports). Lequels ? Les 1024 premiers

A chaque envoi d'un segment un temporisateur est enclenché afin de s'assurer de la bonne réception du segment par la destination.

La retransmission des segments TCP (TPDUs) perdus peut se faire via le principe du GO-BACK-N ou Selective Repeat

Slow Start : mécanisme de résolution pour pallier au problème de congestion qui peut survenir entre la source et la destination lors de l'utilisation de TCP.

Le protocole UDP n'apporte aucune garantie de service.

Le protocole UDP, recommandé mais pas obligatoire, peut-être considéré comme un simple dispatcheur entre la couche réseau et la couche application.

Le valeur du temporisateur de retransmission dans le cadre de TCP est basé sur le RTT et sur l’estimation de sa variance, la valeur du timer est donc variable

La **problématique des 2 armées** se pose lors de la fermeture asymétrique d'une connexion.

La charge maximale d'un segment UDP (quantité de données transmises) est de 512 bytes.

Afin de garantir un bon compromis entre délais et attente d'envoi pour TCP, il est nécessaire de définir quand il est judicieux d'envoyer un segment de données ou un acquit.

En ce qui concerne les acquits, on pourrait soit le faire dés qu'un segment TCP est reçu, soit en profitant de la méthode Piggyback.

Le compromis mis en place pour l'envoi des acquits est le suivant : si le segment TCP est reçu est en séquence et si c'est le seul segment TCP à acquitter, on attend soit l'envoi d’un segment TCP de données (Piggyback) soit l'expiration d'un timer de non réception de nouveaux segments. Par ailleurs, s'il y a déjà un autre segment en attente d'acquittement, on envoie l'acquit immédiatement.

Si le segment TCP est reçu hors séquence, on envoie immédiatement  un acquit.

Pour ce qui est de l'envoi d'un segment de données, un compromis  est aussi trouvé entre délai et surcharge d'entête. Un nouveau segment TCP contenant l’ensemble des données non transmises est envoyé si ce segment TCP a la taille maximale (MSS bytes de données) et si il n’y a pas actuellement de données en attente d’acquittement.

Afin de numéroter les segments TCP de manière unique, les 2 participants à la transmission se basent sur une horloge monotone (compteur incrémenté de manière continue et monotone)

Le protocole TCP (Transmission Controll Protocol) s'appuie directement sur le service fourni par la couche réseau.

Le principe de la fenêtre glissante dans le cadre de la couche transport fiable et orienté connexion, permet d’assujettir l'émetteur à la capacité de traitement des segments (TPDUs) du récepteur.

Le but primaire de TCP  est de fournir un circuit logique fiable ou un service de connexion entre paires de process. Il ne contrôle pas la fiabilité des protocoles sous-jacents (comme IP), donc TCP doit fournir des garanties.

TCP se préoccupe du transfert d'un flux continu de bytes (données) à destination d'une application  au travers du réseau.

TCP regroupe donc les bytes dans les segments qui sont passés à la couche Internet (IP) qui les acheminera à la destination.

TCP décide lui-même comment segmenter les données qu'il transmet à son  propre rythme.
Dans certains cas, une application a besoin de s’assurer que toutes les données actuellement fournies à la couche transport (TCP) sont bel et bien arrivées à destination. Pour cette raison, une fonction push est définie : cela permet de « pousser » les segments TCP se trouvant encore dans les buffers vers la destination

La fonction de fermeture normale de connexion utilise cette fonction push.

Le protocole TCP est un protocole fiable orienté connexion.
Le protocole UDP est un protocole non fiable sans connexion

Pour construire un protocole transport fiable et orienté connexion, on peut se baser sur les mécanismes des protocoles de la couche de liaison de données.

Le réseau entre l’émetteur et le récepteur est à considérer comme une « mémoire distribuée »:

    les stations stockent des segments TCP avant de les transmettre;
    les lignes stockent des segments TCP en fonction de son délai;
    les routeurs intermédiaires contiennent des buffers
    etc.

Lorsque les bufferssont pleins, il est nécessaire de supprimer des paquets. La perte de paquets est un indication de congestion du réseau.

Il est don nécessaire de mettre en place des mécanismes de détection et de contrôle de congestion.

Pour TCP, les algorithmes de contrôle de congestion empêchent à un émetteur de surcharger le réseau, adaptent le débit de l’émetteur à la capacité du réseau et essayent  d’empêcher l’apparition de situations de congestion.

Les 4 améliorations suivantes implémentées de concert ou non permettent la mise en place du contrôle de congestion : Slow Start, Congestion Avoidance, Fast Retransmit et Fast Recovery.
