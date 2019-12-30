# 2 Introduction

## 2.1 Les bases

La manipulation du chapitre précédent va créer par défaut la classe program.cs suivante :

``` cs
using System;

namespace Project{
    class Program{
        static void Main(string[] args){ // Main est la première methode du programme
        }    
    }
}
```
> les conventions de nomage des noms de méthodes et de classes respectent le Pascal Case (ex: ExempleDeClasse)

> Les attributs commencent par une minuscule(max_length 511char).

## 2.2 Java

Le c# est plus permisif sur certains aspects de la programation que le java. 
* Il est possible d'écrire plusieurs classes au sein d'un même fichier c#.
* Il n'y a pas non plus de règles qui définissent que les noms de fichiers et les noms de classes doivent être identiques. 
* On peut définir une classe sur deux fichiers différents. (déconseillé sauf pour l'utilisation de librairies ou de travail conjoint entre 2 équipes de développement. 

> Attention, il est quand même important de respecter les règles du java pour des raisons de clean code. 

## 2.3 Namespace
Un namespace est une **structure hiérarchique** regroupant des classes par utilité ou contexte d'utilisation. Contrairement au java, il s'agit d'une structure logique et non physique des fichiers. En pratique, on inclut souvent le nom de l'auteur dans le namespace ou l'éditeur. 

## 2.4 Using 

Using est utilisé pour préciser que la classe utilise une librairie existante. Contrairement à import en java, using porte sur un **namespace tout entier** et non sur une (ou plusieurs) classe(s). 

## 2.4 Encapsulation 
L’encapsulation est le fait de cacher aux yeux de l’extérieur une partie de l’objet **déclarée privée**,et de ne la rendre accessible,si c'est souhaité, uniquement via des **méthodes publiques** (getteurs et setteurs).



