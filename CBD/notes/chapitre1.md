\title{Conception de Base de Données}

\maketitle

interro shema entite-association : 25%      
clé cours  : DB18   

\tableofcontents

\newpage

# 1 Qu'est ce qu'une base de donnée ? 
## 1.1 Historique 

Le stockage de données n'est pas nouveau en informatique. On utilisa ensuite des cartes perforées puis des bandes magnétiques pour stocker l'information. Le problème avec ce type de fichiers est que les accès ne peuvent ce faire que séquentiellement. Les évolutions techniques ont permis de réduire les temps d'accès, mais pas les accès concurents aux fichiers pour différentes applications. Ce besoin d'accès concurrent s'est vu obligé de faire appel à un nouveau concept : les **systèmes transactionnels** (*suite d'instructions qui forment un tout*).

Le principe de transaction n'est pas la seule méthode pour accéder à une ressource partagée sans corrompre tout le fichier. On peut nottament bloquer le fichier ou bloquer un seul enregistrement à la fois. Même si ces méthodes sont plus faciles à implémenter, elles restent moins optimisées dans le cadre d'une gestion de base de données.

69' : Apparition de banques de données (faiblement structurées, classés par mots clés et dictionnaires)   
70' : IBM Lance le SGBD (Système de gestion de Bases de Données)

### Systèmes transactionnels
différentes facon de gérer un fichier par un user   

* Bloquer un fichier  
* bloquer l'enregistrement sur lequel on écrit   
* adopter le principe de transactions   
    * suite logique d'instructions considérée comme formant un tout ( transfert d'argent (soit les 2 instructions (+1000 -1000) s'effectuent soit aucune))  

fichier : lire , modifier , fin de transaction ( 3 copies ) si copie 1 =! copie 3 alors erreur car collision

## 1.2 inconvénients des systèmes de fichier 

* Dépendance des applications 
* Redondance des données
* Risques d'incohérences des données
* Impossibilité d'interroger les données 
* Sécutité (auto-sauvegarde)
* Pas de modification de structure possible
* Pas de relation entre les fichiers (et les données dans ces fichiers)

## 1.3 Lien etntre les données

Une **Donnée** est un enregistrement dans un code en vue de transmettre ou stocker de l'information.  
Une **information** (Subjectif) : sens ou signification que l'on attache ou déduit d'un ensemble de données.
Un **Fichier** est un ensemble de données.

Un **objet** du *type livre* à un **lien** avec un **objet** du *type auteur*.

## 1.4 Caractérisation d'une Base de Données

* **Relation** entre les données
* **Sauvegarde** des données sur un support (disque)
* **Partage** des données entre plusieurs utilisateurs
* **Indépendance** des données par rapport aux applications
* **Sans redondance** inutile
* Contrôle de **cohérence**
* Exploitation des donneés par **interrogations** 
* **Longueur** d'enregistrement **variable**
* **Modification** possible de la structure des enregistrement

## 1.5 Difficultées d'identifiant des concepts et liens 

Les types d'objets ont des caractéristiques et donnent des types d'enregistrements.

## 1.6 Système de gestion de base de données (S.G.B.D.)

**DBMS** : Database management system

SGBD - programation interface - user

On peut interragir avec la base de donnée, en utilisant le language SQL pour poser des questions (Querry). 
    
    * DQL : Data Querry Language : requête d'acces sous la forme déclarative
    * DDL : Data Definition Language : ajoute et modifie des shémas de BDD
    * DCL : Data Control Language : Traite les permissions 
    * DML : Data Manipulation Language : Ajoute et modifie des données

Une DataBase est gérée par un Administrateur. Il est responsable de l'ensemble du système : 

* Création de la structure de originale de la BDD et organisation fichiers (DDL)
* Modifiaction de la structude de la BD
* Gestion des accès
* Backup et entretien de la BD

Le but d'un SGBD : 

* **Accès optimal** à toute donnée
* **Traitement simultané** des données 
* **Validité et cohérence** des données
* **Sécurité** ( droit d'accès ) 
* **Sauvegarde et Récupération**




