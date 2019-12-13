# Introduction

## Qu'est-ce qu'un réseau ?
Un réseau est une interconnexion de devices.

**un device** est utilisé pour comminuquer avec les autres devices via un **médium**. Ils échangent donc des **messages** en suivant des règles qui gouvernent comment les messages sur le réseau. ces règles sont appelées **protocols**.

En ce qui concerne les protocoles réseaux, toutes les activités de communication sont basées sur des normes et des standards.

Une communication oritntée connexion commence par une **ouverture de connexion**, puis une **transmission de données** et enfin une **fermeture de conexion**.

**Transmission Simplex** : transmission dont le sens de transmission va uniquement d'une source vers un récepteur.

**Communication Full Duplex** : permets aux deux participants dêtre à la fois émétteurs et récepteurs simultanément.

**Application opportuniste** : application qui s'adapte aux ressources réseaux disponnibles.

**Communication de circuit** : réservation du canal de transmission durant toute la Communication.

**WPAN** : Wireless Personnal area Network

## Quels sont les caractéristiques d'un bon réseau ?

Un bon réseau est caractérisé par sa capacité à résister aux pannes (**fault tolerance**). Il doit pouvoir être étendu (**scalabilité**). Il doit fournir des services avec une certaine qualité (**quality of service**). il doit être **sécurisé**

Pour achever ces différentes choses, il est plus facile de procéder si le réseau est hierarchisé et fonctionne suivant des standards et protocols.

## Quality of Service

La Quality Of service est une  méthode de priotité des paquets réseaux. On priviligie généralement les applications qui ont besoin de plus de bande passante. On effectue une prioritisation des paquets réseaux en augmentant la fréquence d'émission de ceux-ci. ( ex : des mails sont moins importants en terme de fluidité qu'une conversation skype).


## LAN vs WAN

**LAN** : Local Area Network (Maison, Bâiment, campus)  
**WAN** : Wide Area Network (LAN's séparées par une distance géographique)

Si leur limite peut sembler floue, il est assez facile de repérer et différencier un lan d'un wan. Malgré une forte ressemblance, ils se différencient par leurs différents **responsables de gestion**, leurs **débits** et leurs **appareils représentatifs** (switch vs router)

## Modèle OSI VS TCP/IP

Les avantages de la définition d'un modèle commun pour la création des réseaux réside dans le *design*, l'*upgradabilité* et l'*uniformité* des segments composant les réseaux.

### PDU (Protocol Data Unit) et l'encapsulation

Le pdu et l'encapsulation définissent comment une donnée doit être "entourée" d'information supplémentaire pour pouvoir voyager dans une couche suivant un standard bien précis.

### Le modèle OSI

Le modèle OSI (et leurs PDU):

* Application : "les données" :  "Contient les protocols applicatifs"
* Présentation : "les données" : "Syntaxe et sémantique, traduction"
* Session : "les données" : "Synchronisation source et destination, gestion des points de reprises"
* Transport : "Le segment" : "La transmission correcte de données (corriger, réordonner, acquitter)"
* Network : "Le paquet" : "Routage et transmission de bout en bout (source vers destination)"
* Data link : "La trame" : "Transfert fiable de données entre éléments actifs du réseau"
* Physical : "le bit" : "Transmission de bits"

### Le modèle TCP/IP

Le modèle TCP/IP :

* Application : représente les données jusqu'à l'utilisateur plus l'encodage et le contrôle de dialogue.
* Transport : Supporte la communication entre divers devices au travers de réseaux diverses.
* Internet : Détermine le meilleur chemin à travers le réseau (routage , communication de bout en bout, ...).
* network access : Contrôle le hardware et le media qui constitue le réseau (wifi, bluetooth, ...).

Cependant un modèle parfait est impossible à atteindre mais il au plus le réseau tend vers le modèle au plus il se rapproche de ce qu'il peut effectuer de mieux.

## Les différents rôles du modèle en couche

Le rôle du modèle en couche est de fournir une approche universelle au transport de données. chaque couche de données possède la possibilité d'encapsuler les données.  

Ainsi, les données envoyées d'un device vers un autre seront encapsulées à mesure de leur descente dans le modèle, pour arriver au niveau 1 (couche physique) ou il sera transporté avant d'être "désencapsulé"" par l'autre device.




\newpage

# Couche 1 : Couche physique

Cette couche gère la **Mise en Oeuvre Matérielle**

La couche physique regroupe le support (cable en cuivre, fibre optique, ...)  et la manière dont l'information est transportée (ex : en amplitude, en fréquence, ...)

**Modulation** : adapter un signal digital pour le convertir en un signal analogique.

**WDM** : *WaveLength division multiplexing* : transmettre plusieurs signaux simultanément sur des fibres multimodes.

**STP** : Shielded twisted pair
**UTP** : Unshielded twisted pair

## ISDN(RNIS)

Dans une connexion ISDN(RNIS). On a deux canaux B à 64Kb/s et un canal D à 16Kb/s et permets de gérer l'ouverture et la fermeture de connexion


## Representation d'un signal sur un support

Pour représenter un signal sur un support, il existe une série de méthodes dont les varation d'**amplitude**, de **fréquence** et de **phase**

## L'horloge

L'horloge est une fréquence d'un système utilisée pour permettre la synchronisation d'une communication entre l'émetteur et le récepteur. Ajouter un cable supplémentaire pour l'horloge pourraît être une bonne idée mais cette méthode ajouterait un cable (plus cher) et ne serait pas optimale. Actuellement, le hardware est capable de gérer sa fréquence directement.

## Le bit

Dans cette couche, les données sont représentées sous la forme de bits, certaines suites spécifiques de bits indiquent le début et la fin d'une transmission de données.

### Problèmes de transmission

**L’atténuation** : perte d’énergie du signal pendant sa propagation

La **distorsion** : suite à l’utilisation de différentes fréquences il est possible que l’une altère l’autre en se chevauchant même un cours instant

Le **bruit** : tout signal indésirable qui livre au récepteur une information incohérente.

Le signal parfait n’existe donc pas, il faut dés lors mettre en place des systèmes qui permettent de déceler les erreurs.

## Bande passante

La **bande passante** est la capacité théorique d'un réseau en bits/sec.  

Le **débit** de données correspond aux performances réeles d'un réseau.  

Le **débit applicatif** est une mesure du transfert de données utilisables après suppression du trafic de surcharge du protocole.  

## Matériaux et technologies

* Fibre optique : coeur de verre qui transporte le signal sous forme de lumière
    * Monomode : 1 seul rayon (transmission longue distances)
    * Multimode : plusieurs rayons différents
* Cuivre : transmission de données sous la forme d'un signal éléctrique
    * RJ45
    * COAXIAL
* Sans-Fil : transfert via ondes électromagnétiques  
    * Bluetooth
    * Wifi
    * GSM

## Cable Coaxial

Le câble coaxial est composé de :

* la gaine (ext.): protège le câble de l’environnement extérieur (caoutchouc, …);
* blindage: enveloppe métallique entourant le câble qui protège le données transmises sur le support des parasites;
* l’isolant: permet d’éviter tout contact entre le blindage et le conducteur (pas de court-circuit possible);
* fil de cuivre (âme): a la tâche du transport des données et est composé généralement d’un seul fil de cuivre ou de plusieurs brins torsadés.

## Le théorème de Nyquist
On peut transmettre le signal sans erreur aucune si on le mesure avec une fréquence qui est le double de la fréquence maximale du signal de départ


\newpage
