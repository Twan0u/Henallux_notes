# Technologie Web

L'examen se fait hors session.  
code cours : prototype.  
Attention clean code TRES IMPORTANT.  

## chapitre 0 : Introduction

Dans le cadre d'une communication entre un navigateur et un server, il est important de distinguer le permier du second. Pour communiquer ils utilisent le protocol http (*hypertext transfer*) et est organisé par le W3C (*World Wide Web Consortium*)
    
* **Navigateur** : Utilisé par l'internaute qui envoie des demandes, réceptionne des réponses et gère l'affichage.
* **Server** : Machine phyqique et logiciel capable de répondre aux demandes de fichiers

### Html et DHTML

La différence entre elles deux est que le dhtml ajout au css et au html du javascript qui modifira le html et le rendra dynamique.

### Le Javascript 

Le javascript est un langage créé pour écrire des scripts ( language interprété ). Il est exécuté du côté client.  

> tip : CTRL+SHIFT+J lance la console de débug dans firefox
> tip : CTRL+SHIFT+K lance la console de développement dans firefox


#### Les commentaires

``` javascript
/*commentaire*/
//commentaire
```

#### Création de variable et affchage 

``` javascript
let variable = 123; // affectation de la variable variable à 123
alert(variable); // affiche une boite de dialogue avec le message 
console.log(variable); // écrit le contenu de la variable variable dans la console$
prompt(variable); // affiche le contenu de variable et récupère une entrée de l'utilisateur via une boite de dialogue
```

#### Fonctions 

En javascript les fonctions peuvent être placées en arguments d'autres fonctions 

``` javascript
function myFunction(var1,var2){
    return var1 + var2;
}
```

#### Modification du code html

le code suivant est à insérer dans du html. Il peut être utilisé pour intégrer dynamiquement du html. Cependant il n'est pas très efficient et ne sera pas utilisé dans la suite du cours
``` javascript
document.write("...");
```


#### Date 

``` javascript
let maintenant = new Date();
let minutes = maintenant.getMinutes();
let heures = maintenant.getHours();  
```

P6 etape 4




























