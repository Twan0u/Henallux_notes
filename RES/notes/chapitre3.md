# Couche 3 : Network

Une **paquet** est le nom donnée de données qui transites par la couche 3.

IP Header + Segment = paquet

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




\newpage
