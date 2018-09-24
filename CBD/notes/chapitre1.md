# Conception de Bases de Données

- interro shema entite-association 25%   
- Nouveau syllabus et slides  
clé cours  : DB18   

## Chapitre 1: Qu'est ce qu'une base de donnée ? 
### 1.1. Historique 
Carte perforée -> bande magnétique -> fichier séquentiels  [accès séquentiel aux donées]  
-> fichier en accès direct   
1 fichier = 1 seule application   
plusieurs applications = différents ficiers = redondance d'information = possibilité d'incohérence car pas d'update globale   
fichier -> nécéssite une app pour faire une recherche et pas une querry  
OS multitache  = Partage du processeur   
partage d'un programme   
partage d'un fichier (gestionnaire de fichier pour éviter les télescopages )  

#### Syst transactionnels
différentes facon de gérer un fichier par un user   

* Bloquer un fichier  
* bloquer l'enregistrement sur lequel on écrit   
* adopter le principe de transactions   
    * suite logique d'instructions considérée comme formant un tout ( transfert d'argent (soit les 2 instructions (+1000 -1000) s'effectuent soit aucune))  

fichier : lire , modifier , fin de transaction ( 3 copies ) si copie 1 =! copie 3 alors erreur car collision

### 1.2 inconvénients des systèmes de fichier 
1 fichier par app -> rendondance -> incohérence 

### 1.3 Lien etntre les données

### 1.4 Caractérisation d'une Base de Données

### 1.5 Difficultées d'identifiant des concepts et liens 

### 1.6 Système de gestion de base de données

**DBMS** : Database management system

SGBD - programation interface - user

but d'un SGBD : 

* Accès  optimal à toute donnée
* Traitement simultané des données 
* Validité et cohérence des données
* Sécurité ( droit d'accès ) 
* Sauvegarde et Récupération

**image graphiquement lien entre 3 branches**






 
