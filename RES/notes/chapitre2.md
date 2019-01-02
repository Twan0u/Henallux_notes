# Couche 2 : Data link layer

La **Couche 2** gère la mise en oeuvre matérielle et Logicielle.

Une **trame** est le nom donnée aux données qui transites par la couche 2.

Cette couche à pour but de gérer l'accès au support. elle fait le lien entre le hardware et le software de la couche 1. Un bon exemple de la couche 2 est la carte réseau.

**Gérer l'accès au média** Désigne la préparation de la communication pour la transmission sur un média spécifique. Une espèce de formatage de la trame pour l'adapter au média

**Gérer l'accès au réseau** désigne les stratégies mises en place pour la communication ( en étoile , maitre-esclave, tour par tout, acces simultané ( attention aux collisions))

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

### Switch

Un switch fonctione comme un hub à la différence prêt qu'il est capable de fonctionner en full duplex grâce à une table de correspondance des macs adresse et de ses ports physiques permettant une transmission en simultané entre plusieurs devices sans envoyer à tout le monde les messages.

## transfert d'informations sur un médium

* Unicast : 1 à 1
* Multicast : 1 à plusieurs
* Broadcast : 1 à tous ( s'étend jusqu'à rencontrer un router)

## Remplissage de la Mac Table

1. La mac table est vide
2. Un ordinateur émet (la table ajoute la mac et son port physique) (**Learning**)
3. On broadcast sur le réseau(**Floading**) (si le message nous est destiné, on envoie une réponse(**Selective Forwarding**). On drop le message si ce n'est pas le cas.)

\newpage
