# NodeJs

 ## Installation

On peut trouver nodeJs à l'adresse suivante : https://nodejs.org/fr/

pour vérifier que nodeJs est installé sur une machine, on peut utiliser la commande : 

```bash
node --version
```

> il existe 2 versions, LTS et non LTS. LTS est obligatoire dans le cadre d'un environnement de production. Si vous développez, la version non LTS est aussi parfaitement valable.

### Création du projet

Dans le répertoire du projet, faire : 

```bash
npm init
```

### Ajout de librairies supplémentaires 

nous allons ajouter express pour nous simplifier la vie: 

```
npm install -s express
```

> npm install -s nom_du_package est utilisé pour installer des packages dans le projet. celles-ci seront chargées dans le dossier node-modules. 

### librairies locales pour développer

Il peut parfois être utile d'installer des librairies pour nous aider à développer. Ces librairies ne doivent cependant pas être installées sur le projet en lui même car celles-ci ne seront pas utilisées en production. On les installe comme suit : 

```bash
npm install --save-dev  nom_de_package
```

> J'utilise par exemple, la libraire Nodemon qui me permets de redémarrer mon serveur nodeJs en cas de crash ou en cas de modifications, ce qui me fait gagner beaucoup de temps en développement
>
> on peut l'installer avec : npm install --save-dev nodemon

On peut ensuite lancer le projet avec 

```bash
nodemon monApp.js
```

## Application de base avec Express

```javascript
const express = require('express');	//importe express
const app = express();				//
const port = 3000;					//

app.get('/', (req, res) => {		//gère la route / (root)
    res.send('Hello World!');
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});

```



## Api de base 

dans le dossier **produit** : on crée un fichier produit.js

```javascript
const Produits = [
	{id:1, nom:"xbox" ,prix : 400}
    {id:2, nom:"ps5" ,prix : 500}
]
module.exports.getProduit = (id) =>{
    const resultats = produits.filter(p=>p.id === id);
    if (resultets.length > 0){
        return resultats[0];
    }else{
        throw new Error('Aucun produit trouvé');
    }
}
```

 

on peut donc récupérer ces informations dans notre application : 

```javascript
const Produit = require("./produit");
const express = require("express");
const app = express();
const port = 3000; 

app.get('/',(req,res)=>{
    res.send('hello World');
});

app.get('/produit/:id',(req,res)=>{
    const idTexte = req.params.id
    const id = parseInt(idTexte);
    const produit = Produit.getProduit(id);
    res.json(produit);
});

app.listen(port,()=>{
    console.log(`Example app listening at http://localhost:${port}`);
});
```

on peut donc trouver le produit avec l'id 1 en se rendant à l'adresse : http://localhost:3000/produit/1



## Gestion des erreurs

On peut ensuite rédiger un code capable de capter les erreurs de l'utilisateur.

```javascript
const Produit = require("./produit");
const express = require("express");
const app = express();
const port = 3000; 

app.get('/',(req,res)=>{
    res.send('hello World');
});

app.get('/produit/:id',(req,res)=>{
    const idTexte = req.params.id
    const id = parseInt(idTexte);
    if (isNaN(id)){
        res.sendStatus(400); //bad request
    }else{
        try{
            const produit = Produit.getProduit(id);
    		res.json(produit);
        } catch(error){
            res.sendStatus(404);
        }
    }
});

app.listen(port,()=>{
    console.log(`Example app listening at http://localhost:${port}`);
});
```



## CRUD

CRUD signifie **Create Read Update** et **Delete**. Ces 4 méthodes sont communément utilisées en HTTP. 

Express possède même un middleware capable de gérer ces différentes méthodes. 

il suffit de placer ceci après les imports : 

```javascript
app.use(express.json());
```

On peut donc ajouter des méthodes suivantes dans app

```javascript
app.post('/produit',(req,res)=>{
    const body = req.body;
    const{id,nom,prix} = body;
    const reponse = ProduitModele.postProduit(id,nom,prix);
    if(reponse){
        res.sendStatus(201);
    }else{
        res.sendStatus(500);
    }
}
```

dans ./produit/index.js

```javascript
module.exports.postProduit = (id,nom,prix) =>{
	produits.push({
	id,
	nom,
	prix
	});
	return true;
}
```

on peut aussi mettre un jour les informations d'une ressource : 

```javascript
app.patch('/produit',(req,res)=>{
    const{id,prix} = req.body;
    const reponse = ProduitModele.updatePrix(id,prix);
    if (reponse){
        res.sendStatus(204);
    }else{
        res.sendStatus(404);
    }
});
```

dans ./produit/index.js

```javascript
module.exports.updatePrix = (id,prix)=>{
    for(let i=0;i<produits.length;i++){
        if(produits[i].id ===id){
            produits[i].prix = prix;
            return true;
        }
    }
    return false;
}
```

et enfin delete

```javascript
app.delete('/produit',(req,res)=>{
    const{id} = req.body;
    const reponse = ProduitModele.deleteProduit(id);
    if (reponse){
        res.sendStatus(204);
    }else{
        res.sendStatus(404);
    }
});
```

dans ./produit/index.js

```javascript
module.exports.deleteProduit = (id)=>{
    for(let i=0;i<produits.length;i++){
        if(produits[i].id ===id){
            produits[i].splice(i,1);
            return true;
        }
    }
    return false;
}
```



## Structurer une application

On sépare donc 

en **controlleur**, **modele** et **route**.

### Controlleur 

C'est dans ces fichiers que l'on va gérer ...

On crée un fichier pour la ressource que l'on souhaite gérer (ici produit.js)

```javascript
const ProduitModele = require("../modele/produit");

module.exports.getProduit = (req, res) => {
    const idTexte = req.params.id; //attention ! Il s'agit de texte !
    const id = parseInt(idTexte);
    if(isNaN(id)){
        res.sendStatus(400);
    } else {
        try{
            const produit = ProduitModele.getProduit(id);
            res.json(produit);
        } catch (error){
            res.sendStatus(404);
        }
    }
}

module.exports.postProduit = (req, res) => {
    const body = req.body;
    const {id, nom, prix} = body;
    const response = ProduitModele.postProduit(id, nom, prix);
    if(response){
        res.sendStatus(201);
    } else {
        res.sendStatus(500);
    }
}

module.exports.updateProduit = (req, res) => {
    const {id, prix} = req.body;
    const response = ProduitModele.updatePrix(id, prix);
    if(response){
        res.sendStatus(204);
    } else {
        res.sendStatus(404);
    }
}

module.exports.deleteProduit = (req, res) => {
    const {id} = req.body;
    const response = ProduitModele.deleteProduit(id);
    if(response){
        res.sendStatus(204);
    } else {
        res.sendStatus(500);
    }
} 

```

### modele

le deuxième est généralement utilisé pour gérer les connexions à la base de donnée

```javascript
//permets de simuler une base de données
const produits = [
    {id: 1, nom: "Playstation 4", prix:400},
    {id: 2, nom: "Xbox One", prix:399.9},
    {id: 3, nom: "Nintendo Switch", prix:349.99}
]

module.exports.getProduit = (id) => {
    const resultats = produits.filter(p => p.id === id);
    if(resultats.length > 0){
        return resultats[0];
    } else {
        throw new Error("Aucun produit trouvé");
    }
}

module.exports.postProduit = (id, nom, prix) => {
    produits.push({
        id,
        nom,
        prix
    });
    return true;
}

module.exports.updatePrix = (id, prix) => {
    for(let i = 0; i < produits.length; i++){
        if(produits[i].id === id){
            produits[i].prix = prix;
            return true;
        }
    }
    return false;
}

module.exports.deleteProduit = (id) => {
    for (let i = 0; i < produits.length; i++){
        if(produits[i].id === id){
            produits.splice(i, 1);
            return true;
        }
    }
    return true;
}
```



### route

le routeur gère les différentes routes pour chaque ressource

dans produit.js

```javascript
const ProduitControleur = require("../controleur/produit");
const router = require("express").Router();

router.get('/:id', ProduitControleur.getProduit);
router.post('/', ProduitControleur.postProduit);
router.patch('/', ProduitControleur.updateProduit);
router.delete('/', ProduitControleur.deleteProduit);

module.exports = router;
```

dans index.js

```javascript
const ProduitRouter = require('./produit');
const router = require("express").Router();

router.use("/produit", ProduitRouter);

module.exports = router;
```



### Dans l'application

```javascript
const Router = require('./route');
const express = require('express')
const app = express()
const port = 3000

app.use(express.json());
app.use(Router);

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
```

## Connecter une base de donnée

Dans le fichier./model/database.js

> Ce fichier permettra de gérer  un pool de connexions

```javascript
const pg = require("pg");
const Pool = pg.Pool;

const pool = new Pool({
    user: 'Antoine',
    host: 'igsmartclass.postgres.database.azure.com',
    database: 'igsmartclass',
    password: 'test1234',
    port: 3000,
});

module.exports = pool;
```

dans les fichiers model : 

```javascript
module.exports.getProduit = async (id, client) => {
    return await client.query("SELECT * FROM produit WHERE id = $1", [id]);
}
```

dans le controller

```javascript
module.exports.getProduit = async (req, res) => {
    const client = await pool.connect();
    const idTexte = req.params.id; //attention ! Il s'agit de texte !
    const id = parseInt(idTexte);
    try{
        if(isNaN(id)){
            res.sendStatus(400);
        } else {
            const {rows: produits} = await ProduitModele.getProduit(id, client);
            const produit = produits[0];
            if(produit !== undefined){
                res.json(produit);
            } else {
                res.sendStatus(404);
            }
        }
    } catch (error){
        res.sendStatus(500);
    } finally {
        client.release();
    }
}
```

on mettra ensuite les routeurs à jour: 

//const router = require("express").Router();

const Router = require("express-promise-router");

const router = new Router;

cfr Labo 2 pour la gestion des transactions



## ORM

ORM signifie "object-relational mapping" et sert à transformer des relations en objet. Celà évite d'écrire du sql directement. 

### Sequelize

#### installation

```bash
npm install -save sequelize pg pg-hstore
```

dans un dossier ORM, on crée un fichier sequelize.js

```javascript
const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('exercices', 'john', 'password', {
    host: 'localhost',
    port: '3000',
    dialect: 'postgres',
    omitNull: true
});
module.exports=sequelize;
```

nous créons ensuite des modèles des objets à créer : ./orm/model/Produit.js

```javascript
const {DataTypes} = require('sequelize');
const sequelize = require('../sequelize');

const Produit = sequelize.define('produit', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrementIdentity: true,
        primaryKey: true,
    },
    nom: {
        type: DataTypes.STRING
    },
    prix:{
        type: DataTypes.FLOAT
    }
}, {
    timestamps: false,
    freezeTableName: true
});

module.exports = Produit;
```

on crée ensuite les controlleurs et modeles associés

## Sécuriser les routes

Pour sécuriser des routes, il est utile d'utiliser des middlewares.

Dans cet exemple, on à deux types de personnes, les managers et les clients

voici leurs codes respectifs pour les modèles

```javascript
module.exports.getClient = async (client, nom, password) => {
    return await client.query(`
        SELECT * FROM client WHERE nom = $1 AND password = $2 LIMIT 1;
    `, [nom, password]);
}

module.exports.getManager = async (client, nom, password) => {
    return await client.query(`
        SELECT * FROM manager WHERE nom = $1 AND password = $2 LIMIT 1;
    `, [nom, password]);
}
```

et les controlleurs

```javascript
const pool = require('../modele/database');
const ClientDB = require('../modele/clientDB');

module.exports.updateClient = async (req, res) => {
    if(req.session !== undefined){
        const clientObj = req.session;
        const toUpdate = req.body;
        const newData = {};

        newData.adresse = toUpdate.adresse ? toUpdate.adresse : clientObj.adresse;
        newData.nom = toUpdate.nom ? toUpdate.nom : clientObj.nom;
        newData.prenom = toUpdate.prenom ? toUpdate.prenom : clientObj.prenom;
        newData.password = toUpdate.password ? toUpdate.password : clientObj.password;

        const client = await pool.connect();
        try{
            await ClientDB.updateClient(
                client,
                clientObj.id,
                newData.nom,
                newData.prenom,
                newData.adresse,
                newData.password
            );
            res.sendStatus(204);
        }
        catch (e) {
            console.log(e);
            res.sendStatus(500);
        } finally {
            client.release();
        }
    } else {
        res.sendStatus(401);
    }
}
```

### Middlewares

Comme son nom l'indique, un middleware se place entre 2 composants.

ces middlewares sont des couches supplémentaires utilisées pour effectuer diverses actions (transformation des données, sécurité....).

Les middlewares au sein de expressJS prennent 3 paramètres, (requete, réponse, next).

l'utilité de la fonction next permets de passer à la fonction suivante.

exemple : 

```javascript
app.use('/user/:id', function(req, res, next) {
  console.log('Request URL:', req.originalUrl);
  next();
}, function (req, res, next) {
  console.log('Request Type:', req.method);
  next();
});
```

ces fonctions peuvent modifier par exemple req et ainsi passer de l'information à la fonction suivante.

#### Les authorisations au sein du header

Une méthode simple d'authorisation serait d'inscrire les données sous la forme : 

```
Authorization Basic dXNlcm5hbWU6cGFzc3dvcmQ=
```

la chaine de charactère étant username:password en base 64.

### au sein du projet 

Il est conseillé de créer un dossier contenant les différents middlewares. 

```javascript
const ClientDB = require('../modele/clientDB');
const pool = require('../modele/database');

module.exports.identification = async (req, res, next) => {
        // A FAIRE
}
```

### Identification et autorisation

Il existe une différence entre autorisation et identification. un utilisateur identifié n'a pas forcément les autorisations nécessaires pour effectuer une action.

On peut donc créer 2 middlewares, le premier vérifiera l'identification et le suivant les autorisations.