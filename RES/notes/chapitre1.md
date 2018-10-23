# Réseaux

prof : Philippe Van Goethem

## Chapitre 1 : Introduction

### Qu'est-ce qu'un réseau ? 
Un réseau est une interconnexion de devices. 

**un device** est utilisé pour comminuquer avec les autres devices via un **médium**. Ils échangent donc des **messages** en suivant des règles qui gouvernent comment les messages sur le réseau. ces règles sont appelées **protocols**.

### Quels sont les caractéristiques d'un bon réseau ? 

Un bon réseau est caractérisé par sa capacité à résister aux pannes (**fault tolerance**). Il doit pouvoir être étendu (**scalabilité**). Il doit fournir des services avec une certaine qualité (**quality of service**). il doit être **sécurisé**

Pour achever ces différentes choses, il est plus facile de procéder si le réseau est hierarchisé et fonctionne suivant des standards et protocols. 

### Modèle OSI VS TCP/IP

Le modèle OSI : 
* Application 
* Présentation 
* Session
* Transport 
* Network
* Data link 
* Physical

Le modèle TCP/IP : 
* Application 
* Transport 
* Internet
* network access

Cependant un modèle parfait est impossible à atteindre mais il au plus le réseau tend vers le modèle au plus il se raproche de ce qu'il peut effectuer de mieux.

### Les différents rôles du modèle en couche 

Le rôle du modèle en couche est de fournir une approche universelle au transport de données. chaque couche de données possède la possibilité d'encapsuler les données.  

Ainsi, les données envoyées d'un device vers un autre seront encapsulées à mesure de leur descente dans le modèle, pour arriver au niveau 1 (couche physique) ou il sera transporté avant d'être "désencapsulé par l'autre device. 

## Couche 1 : Couche physique

La couche physique regroupe le support (cable en cuivre, fibre optique, ...)  et la manière dont l'information est transportée ( ex : en amplitude, en fréquence , ...)

### L'horloge
Pour pouvoir communiquer, deux devices doivent partager la même horloge pour permettre le bon envoi et la bonne réception des mesages. 

Il est donc interressant d'être capable de synchroniser deux horloges. Une idée pourrait être de prendre un cable supplémentaire pour l'horloge mais cette méthode est innéficiente et coute plus cher ( ajout d'un cable ).

Actuellement, le hardware est capable de gérer sa fréquence directement. 

### Bande passante 

La bande passante est la capacité théorique d'un réseau en bits/sec

## Couche 2 : Data link layer 

Une **trame** est le nom donnée aux paquets de données qui transites par la couche 2.

Cette couche à pour but de gérer l'accès au support. elle fait le lien entre le hardware et le software de la couche 1. Un bon exemple de la couche 2 est la carte réseau.

Gérer l'accès au réseau désigne les stratégies mieses en place pour la communication ( en étoile , maitre-esclave, tour par tout, acces simultané ( attention aux collisions))

### L'exemple de L'ethernet 

Dans le protocol ethernet, on identifie chaque device du réseau par sa mac adresse. 

A l'origine, les réseaux ethernet étaient disposées en bus. Le transfert de données en bus est une communication autour d'un médium (ex :coaxial) partagé par plusieurs pc. Ils fonctionnenet en CSMA/CD que plusieurs pc se partagaient. c'est à dire que quand un pc voulaient communiquer avec les autres, il devait 1 vérifier que personne ne transmettait de données avant d'en émettre. Puis émettre publiquement en spécifiant le destinataire en ayant confiance dans le fait qu'il n'y ait que l'utilisateur à qui le message est destiné qui lise celui-ci. Si deux communications venaienet à entrer en collision, les 2 devices lancent un timer aléatoire et réesayeront quand celui-ci sera terminé.

10 base 2 et 10 base 5 représentent respectivement le thin et le thick internet qui sont de 200m de cable à 500m de cable pour le thick

Le bus sous la forme d'un cable à ensuite été remplacé par un hub. qui fonctionnait sur le même principe mais qui offrait des coûts bien plus avantageux. 

Le désavantage de ce système de communication logique en bus est l'impossibilité de communiquer à plusieurs à la fois et de ne pas savoir émettre et recevoir. cet ancien modèle (**half duplex**) à fait place au modèle 10 base T ( t pour twisted pair ) qui est un full duplex. qui utilise aussi le CSMA/CD.

#### Switch

Un switch fonctione comme un hub à la différence prêt qu'il est capable de fonctionner en full duplex grâce à une table de correspondance des macs adresse et de ses ports physiques permettant une transmission en simultané entre plusieurs devices sans envoyer à tout le monde les messages. 