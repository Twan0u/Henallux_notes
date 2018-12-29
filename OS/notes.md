---
title: "Operating Systems"
...
# Quelles sont les différences de philosophie entre les systèmes d'exploitations de type mainframe et UNIX ?
## Les Mainframes :

* Lourds
* L'OS Intègre toutes les fonctionnalités
* Monde Propriétaire (Hardware Propriétaire)

## UNIX :

* Essentiel
* Gestion des processus et de fichiers + qq focntionnalités de base
* reste dans des Librairies de fonctions ou programmes
* Ouvert (peut tourner sur un autre hardware que celui prévu inititalment)

# Qu'est-ce que l'on considère comme un fichier dans Unix?

Tout ce qui peut être organisé par une suite de bytes (mais sans voir la structure des données).

# Quels sont les deux types de représentation d'un fichier et leurs buts?

**Représentation Logique** : les noms liés au fichier (pouvoir donner un nom ou plusieurs noms au fichier).
**Représentation Physique** : Contient l'aspect de protection et petmet de retrouver les bytes.

# Qu'est-ce qu'un I-node et que contient-il ?

Un **I-node** est le conteneur de la *représentation phyqique d'un fichier*.

* Le Propriétaire
* Le Groupe
* Les Protections
* Le type de fichier (+ sous-type)
* La date de création
* La date de modification
* La dernière date d'utilisation
* La taille
* L'endroit où on peut trouver les bytes et le nombre de links (nombre de noms logiques)

# Quels sont les principaux types de fichiers dans Unix?

* Fichier Normal
* Répertoire
* Lien symbolique
* philosophie
* Hardware (Blocs par blocs ou bytes par bytes)

# Quelles sont les techniques de protection des fichiers dans UNIX

Il en existe 3 types: Le **Propriétaire**, le **groupe** et le **reste**.

| Permission | Fichier | Répertoire |
|---|---|---|
| X | exécuter | Permets l'utilisation du pathname |
| W | Ouvrir écriture | Modification(ajout,suppr et renommer un fichier) |
| R | Ouvrir Lecture | lister le directory |

# Puis-je mettre des protections différentes aux noms d'un même fichier logique ?

non, différents noms (représentation logique) se réfèrent à un même Inode Physique

# Quelles sont les relations entre la date de création, de modification et de dernière utilisation d'un fichier ?

**Date de dernière utilisation** : date la plus récente.
**Date de création** : de l'I-node.
**Date de modification** : modification du contenu du fichier.
