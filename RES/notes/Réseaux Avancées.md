# Réseaux Avancées 

## Introduction à la virtualisation

### Hyperviseurs

Dans le cadre d'une virtualisation, on est amené à utiliser un hyperviseur. Il en existe 2 Types.

 ![](C:\Users\Antoine Lambert\Documents\Henallux_notes\RES\notes\img\Hyperviseurs.png)

L'hyperviseur de Type 1 (gauche sur le schéma)  est généralement utilisé en production.

L'hyperviseur de Type 2 (Droite sur le schéma) est généralement utilisé dans le cadre de tests. Il consiste à émuler un OS dans un autre OS. (Ex : VirtualBox D'Oracle).



### Que Signifient les Différents paramètres de Configuration de Cartes Réseaux dans VirtualBox ?



|                         | VM $\rightarrow$ Autres VM | Hôte $\rightarrow$ VM | VM$\rightarrow$    Réseau Local | VM$\rightarrow$ Internet |
| :---------------------- | :------------------------: | :-------------------: | :-----------------------------: | :----------------------: |
| Réseau Interne          |        $\checkmark$        |                       |                                 |                          |
| Réseau Privé Hôte       |        $\checkmark$        |     $\checkmark$      |                                 |                          |
| NAT                     |        $\checkmark$        |                       |          $\checkmark$           |       $\checkmark$       |
| Accès par Pont (Bridge) |        $\checkmark$        |     $\checkmark$      |          $\checkmark$           |       $\checkmark$       |



#### Réseau Interne

Le Réseau Interne Permets de connecter 2 Machines virtuelles entre elles par le biais d'un Switch virtuel.

![](C:\Users\Antoine Lambert\Documents\Henallux_notes\RES\notes\img\VB_R1.png)

> Il est possible d'ajouter ou de modifier les Virtual Switch dans VirtualBox. 



#### Réseau Privé Hôte

Permets de connecter des VM par le biais d'un switch virtuel et permets à l'hôte d'y accéder par le biais d'une carte réseau virtuelle.

![](C:\Users\Antoine Lambert\Documents\Henallux_notes\RES\notes\img\VB_R2.png)

#### NAT 

Le Nat ou Network Access Translation est la manière la plus sécurisée autoriser l'accès au réseau local à une VM. Le routeur évite par exemple les pollutions DHCP issues de la configuration des VM. Elle est aussi utile quand le réseau extérieur est considéré comme hostile et permets d'éviter que d'autres terminaux n'accèdent à votre VM sans y avoir explicitement autorisé l'accès dans le routeur. Ce dernier agit ici comme un pare-feu et protège votre VM.  

![](C:\Users\Antoine Lambert\Documents\Henallux_notes\RES\notes\img\VB_R3.png)

#### Connexion par Pont (Bridge)

Ce mode de connexion donne à une VM accès une carte réseau comme si celle-ci lui était directement attachée.

![](C:\Users\Antoine Lambert\Documents\Henallux_notes\RES\notes\img\VB_R4.png)

### Mode Promiscuité

Dans le cadre d'un échange d'informations sur le biais d'un réseau local, les paquets réseaux possèdent l'adresse de leur destinataire.  En règle générale, si un paquet n'est pas dédié à l'adresse MAC de la carte réseau, celle-ci va '*dropper*' le paquet et ne pas y prêter attention. 

Si, dans le cadre d'une résolution de problèmes sur le réseau interne ou dans le cadre d'un sniffing[^*], on souhaite intercepter des paquets qui ne nous sont pas dédiés. Il est possible de forcer la carte réseau à ne pas '*dropper*' le paquet. Pour ce faire, on utilise un mode sur la carte réseau appelé **Mode Promiscuité**.

[^*]:Méthode de piratage

### Paramètres Réseaux d'un Hôte

* **Adresse IP statique**: Une adresse logique IP (V4) qui est fixe. Peut être fournie par un FAI éventuellement. Répartie sur 4 octets 
* **Masque de sous réseau**: Masque binaire pour une adresse IP permettant de séparer la partie réseau de la partie hôte 
* **Adresse IP dynamique**: Adresse IP reçue dynamiquement via un serveur extérieur et renouvelée à intervalles réguliers
* **Adresses IP supplémentaires**: Adresse IP qu'une interface utilise en plus de celle de base
* **Serveur DNS**: Adresse IP Serveur qui permet de faire le lien entre adresse IP et FQDN, nom de domaines via le protocole DNS 
* **Host Name**: Nom d'hôte Local d'une machine et/ou nom d’hôte DNS 
* **Passerelle par défaut**: Passerelle / routeur vers laquelle seront dirigés les paquets dont le chemin vers la destination est inconnu. L'équivalent d'un panneau "toute directions" 
* **Passerelles supplémentaires**: Passerelles correspondant au chemin vers des réseaux connus. 
* **Firewall**: Dispositif qui autorise/interdit le trafic réseau sur base de certains critères 
* **Carte réseau** : 
  * **Mac Address**: Adresse matérielle d'une interface Ethernet. Sur 48bits. La première partie correspond au constructeur. Se note en hexadécimal 
  * **Duplex** : 
    * **Half** : donnée circulent sur une paire de fils en UP/DOWN -> 100Mb total 
    * **Full** : une paire de fils pour les données en UP, une autre pour en DOWN -> 100Mb / direction 
  * **Débit** : Nombre maximal de bits/secondes qui peuvent circuler par une interface 