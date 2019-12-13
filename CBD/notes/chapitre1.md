\title{Conception de Base de Données}

\maketitle

interro shema entite-association : 25%      
clé cours  : DB18   

\tableofcontents

\newpage

# 1 Qu'est ce qu'une base de donnée ?
## 1.1 Historique

Le stockage de données n'est pas nouveau en informatique.
A l'origine, on utilisait des cartes perforées pour stocker de l'information. Ensuite, on utilisa des bandes magnétiques. Le problème avec ce type de fichiers est que les accès ne peuvent ce faire que séquentiellement. Même si les évolutions techniques ont permis de réduire les temps d'accès, les accès concurents aux fichiers pour différentes applications posent toujours un soucis majeur. Ce besoin d'accès concurrent à permis l'élaboration de nouveaux concepts et nottament les **systèmes transactionnels** (*suite d'instructions qui forment un tout*).

69' : Apparition de banques de données (faiblement structurées, classés par mots clés et dictionnaires)   
70' : IBM Lance le SGBD (Système de gestion de Bases de Données)

### Accès concurrents
différentes facon de gérer un fichier par un user   

* Bloquer un fichier  
* bloquer l'enregistrement sur lequel on écrit   
* adopter le principe de transactions   
    * suite logique d'instructions considérée comme formant un tout (soit toutes les instructions s'effectuent soit aucune).  

### Système transactionnels

Au début de la transaction on effectue une première copie des donées. Cette copie est ensuite elle même copiée et on effectue les modifications sur cette copie 2. Enfin, on effectue une copie 3 des données. Cette copie3 est comparée à la copie1 et si ces deux copies sont identiques, celà signifie que entre temps le fichier de données n'a pas été modifié. Si il y a eu modification, on préviendra l'utilisateur. Dans le cas contraire, on recopie la copie 2.


## 1.2 inconvénients des systèmes de fichier

* Dépendance des applications (Chaque application doit gérer ses fichiers)
* Redondance des données (si il y a deux programmes, il y aura deux fichiers avec les mêmes données)
* Risques d'incohérences des données
* Impossibilité d'interroger les données(il n'y a pas de lien entre les différents fichiers)
* Sécutité (auto-sauvegarde)
* Pas de modification de structure possible
* Pas de relation entre les fichiers (et les données dans ces fichiers)

## 1.3 Lien etntre les données

Une **Donnée** est un enregistrement dans un code en vue de transmettre ou stocker de l'information.  
Une **information** (Subjectif) : sens ou signification que l'on attache ou déduit d'un ensemble de données.
Un **Fichier** est un ensemble de données.

### Liens Objets

Dans une BDD, on lie deux objets entre eux par l'intermédiaire de liens.  

(Exemple : Un **objet** du *type livre* à un **lien** avec un **objet** du *type auteur*.)

## 1.4 Caractérisation d'une Base de Données

* **Relation** entre les données
* **Sauvegarde** des données sur un support (disque)
* **Partage** des données entre plusieurs utilisateurs (+gestion des droits d'accès)
* **Indépendance** des données par rapport aux applications
* **Sans redondance** inutile (sauf raisons de performances et de sécurité)
* Contrôle de **cohérence** (si il y a de la redondance, le système s'assure pour mettre à jour les données)
* Exploitation des donneés par **interrogations**
* **Longueur** d'enregistrement **variable** (NULL est différent de " " et 0)
* **Modification** possible de la structure des enregistrement

**Une Base de Données est un ensemble de données en relation, indépendantes des applications, sans redondance inutile, partageable entre plusieurs utilisateurs et dont on peut accéder à n’importe quel contenu en réponse à une question**

## 1.5 Difficultées d'identifiant des concepts et liens

Les types d'objets ont des caractéristiques et donnent des types d'enregistrements.

## 1.6 Système de gestion de base de données (S.G.B.D.)

Un SGBD ou DBMS(en anglais) est un outil permettant la gestion d'une base de donnée en permettant la création, la modification et la suppression d'un fichier. Cet outil permets ausi de rechercher des données et de les modifier dans les enregistrements faits dans les fichiers déjà existants.


![](https://i.ibb.co/mqNK4qj/Screenshot-2019-01-16-14-07-33.png)

### Les Différents Roles

#### Le programmeur
Un programmeur écrit son programme dans un language "classic". Il peut interragir avec la base de donnée, en utilisant le language SQL pour poser des questions (Querry):

    * DQL : Data Querry Language : requête d'acces sous la forme déclarative
    * DDL : Data Definition Language : ajoute et modifie des shémas de BDD
    * DCL : Data Control Language : Traite les permissions
    * DML : Data Manipulation Language : Ajoute et modifie des données

#### Les Utilisateurs Lambda
Un utilisateur lambda est amené à utiliser l'application et interagit avec la base de données par le biais de l'application programmée par le programmeur.

#### L'Administrateur de Base de Donnée

Une DataBase est gérée par un Administrateur. Il est responsable de l'ensemble du système :

* Création de la structure de originale de la BDD et organisation fichiers (DDL)
* Modifiaction de la structude de la BD
* Gestion des accès
* Backup et entretien de la BD


#### Le SGBD

Le rôle d'un SGBD :

* **Accès optimal** à toute donnée
* **Traitement simultané** des données
* **Validité et cohérence** des données
* **Sécurité** ( droit d'accès )
* **Sauvegarde et Récupération**
