# 5. application

Le protocole HTTP est un protocole conçu pour transférer des documents de type HTML.

Le but des protocoles de type "Remote Execution" est de faire exécuter une tâche, un script, une commande, etc. sur un ordinateur distant.

Les applications qui ont des contraintes de débits (bande passante) sont des applications dites à flux tendus.

Les applications opportunistes (appelées aussi élastiques) s'adaptent dynamiquement à la bande passante (débit) disponible.

Le protocole FTP permet de transférer un fichier entre deux équipements distants sur le réseau.

**FTP** : protocole qui permet un échange de fichier sur base de TCP   
**SSH** : le protocole qui permet une exécution à distance sécurisée  
**LDAP** : le protocole qui permet la gestion d'annuaires  
**HTTP** : le protocole qui permet le transfert de fichier HTML  
**NFS** : le protocole natif sous UNIX qui permet l'accès aux fichiers distants  
**CIFS** : le protocole natif sous Windows qui permet l'accès aux fichiers distants
**RTP** : le protocole qui permet de transmettre du contenu multimédia au travers du réseau en s'appuyant sur une couche transport non fiable (UDP)
**RTCP** : le protocole qui permet de rapporter sur la qualité des transmissions de contenus multimédia
**SNMP** : le protocole qui permet de gérer les équipements réseau
**TFTP** : le protocole qui permet un échange de fichier sur base d'UDP  
**TELNET** le protocole d'exécution à distance base sur le principe du Network Virtual Terminal
**NTP** : le protocole qui permet de synchroniser les horloges systèmes
**POP3** : Le protocole qui permet de relever ou de gérer sa boîte aux lettres


Les protocoles qui permettent de gérer les équipements actifs du réseau : **SNMP**, **RMON**

TELNET, REXEC, RSH, SSH  : Les protocoles vus au cours et traitant de la problématique de l'exécution à distance

Pour permettre la transmission de contenusmultimédia dans de bonnes conditions, il est nécessaire d'utiliser des algorithmes de compression.

Il existe deux catégoriesd'algorithmes de compression :

    les algorithmes avec perte : certaines données "inutiles" sont supprimées afin de gagner en taille
    les algorithmes sans perte : il n'y a ici aucune perte de données avant et après compression.

En ce qui concerne l'audio, on pourra aussi réduire le nombre d'échantillonsou leur taille, supprimer les silencesou tenir compte des caractéristiques de nos oreilles(son faible après son fort).

Pour ce qui est de la vidéo, on diminuera le nombre de bitspar image, la taille des images ou le nombre de couleursainsi que le nombre d'images par seconde. On pourra, de plus, aussi tenir compte de "l'imperfection" de l'œil humain : changement doux de couleurs ou les changementsvifs.

---

MIME (Multipurpose Internet Mail Extension) n'est pas un protocole mais une spécificationde formats de messages multimédia sur Internet.

MIME permet d’introduire dans les messages SMTPdes données multimédia car SMTP ne peut transmettre autre chose que des caractères ASCII 7 bits.

Pour remédier aux inconvénientsde SMTP, MIME permet donc de transmettre de façon transparente pour SMTP du texte enrichi (Gras, Italique, Souligné, Couleur, ...). Mais aussi des images, du son, des fichiers.
Bien que réservé au départ pour SMTP, il est aussi possible d'utiliser MIME avec HTTP.

---

Le fait que le protocole de transport UDP supporte le multicast est bien un atout pour la transmission de contenus multimédia

## Caractéristiques communes à POP et IMAP:

Les deux protocolessupportent des opérations hors ligne, le courrier étant est délivré, par ailleurs, à un serveur partagé et toujours actif via le protocole SMTP.

Les messages sont ainsi accessiblesdepuis une variété de plates-formes clientes et en tout point du réseau.

Ce sont deux protocoles, ouvertset définis par des RFCs spécifiques, qui servent à gérer l'accès aux boites aux lettres.

Les avantages du protocole POP sont :

    Sa simplicité. L'implémentation de POP en donc est facilitée.
    Un nombre élevé de logiciels clientssont actuellement disponibles.

Les avantages du protocole IMAP sont :

    de permettre la manipulation de drapeauxd'état des messages.
    de pouvoir stockerles messages et les récupérer.
    de pouvoir accéder à et gérer de multiplesboîtes aux lettres.
    de permettre l'accès et la mise à jourconcurrentielle de boîtes aux lettres partagées.

    Vertus et défauts de SMTP

Ce protocole a la vertu d'être particulièrement robustemais il est un peu ancien et il lui manque quelques fonctionnalitésqui seraient bien utiles aujourd'hui :

    La sécurisationde la transmission.
    Les possibilités de transmettre autre chose que du texte brut.

Ces deux limites peuvent être contournées:

    En chiffrantson message,

    En utilisant un artifice pour encoder tout type de document de telle manière que SMTP ne transmette que des caractères ASCII‑7bits.

Par ailleurs, les messages SMTP sont :

    Limitésà du texte ASCII 7bits

    Composés de lignesde 1000 caractères maximum

    Limités à une taille maximum totale

La spécification MIMEpermet de palier à ce type de limites




## __

Les protocoles de la couche application s'appuient soit sur une couche transport fiable-orienté connexion soit sur une couche transport sans-connexion-non fiable.

Le principe VoIP (Voice over IP) est de transmettre de la voix sur un réseau de données àcommutations de paquets.

Le protocole SMTP est le protocole qui permet d'envoyer un courrier à partir d'un MUA et de le transférer de MTA en MTA jusqu'au MDA.
