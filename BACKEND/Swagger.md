# Swagger

Swagger permets de décrire les requêtes qu'une API peut recevoir ainsi que ses réponses. 

https://editor.swagger.io/ 

## Installation

```bash
npm install --save-dev swagger-jsdoc
```

dans un dossier swagger, mettre le fichier swagger_jsdoc.js

```javascript
const fs = require('fs');
const swaggerJSDoc = require('swagger-jsdoc');

const options = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'API Smartclass', // Title (required)
            version: '1.0.0', // Version (required)
        },
    },
    // Path to the API docs
    apis: [
        './controleur/*',
        './middleware/*',
        './modele/*',
        './route/*',
    ],
};
// Initialize swagger-jsdoc -> returns validated swagger spec in json format
const swaggerSpec = swaggerJSDoc(options);
fs.writeFileSync('./swagger/spec.json', JSON.stringify(swaggerSpec));

```

Dans le package .json on peut ajouter le script suivant : 

```
"genDoc": "node ./swagger/swagger_jsdoc.js" 
```

exemple com

```
-----controller--------
/**
 * @swagger
 * components:
 *  responses:
 *      AchatAjoute:
 *          description: L'achat a été enregistré
 *      ClientNExistePas:
 *          description: Le client fourni n'existe pas
 *          content:
 *              application/json:
 *                  schema:
 *                      type: object
 *                      properties:
 *                          error:
 *                              type: string
 *
 *  requestBodies:
 *      AchatAAjoute:
 *          content:
 *              application/json:
 *                  schema:
 *                      type: object
 *                      properties:
 *                          idProduit:
 *                              type: integer
 *                          quantite:
 *                              type: integer
 *                          client:
 *                              type: object
 *                              properties:
 *                                  id:
 *                                      type: integer
 *                              required:
 *                                  - id
 *                      required:
 *                          - idProduit
 *                          - client
 *                          - quantite
 */
 ---------routes--------
 /**
 * @swagger
 * /achat:
 *  post:
 *      tags:
 *          - Achat
 *      requestBody:
 *          $ref: '#/components/requestBodies/AchatAAjoute'
 *      responses:
 *          201:
 *              $ref: '#/components/responses/AchatAjoute'
 *          404:
 *              $ref: '#/components/responses/ClientNExistePas'
 *          500:
 *              description: Erreur serveur
 *
 */

•	./middleware/identificationJWT.js
/**
 * @swagger
 * components:
 *  securitySchemes:
 *      bearerAuth:
 *          type: http
 *          scheme: bearer
 *          bearerFormat: JWT
 *  responses:
 *      ErrorJWT:
 *          description: le JWT n'est pas valide
 *      MissingJWT:
 *          description: le JWT n'est pas présent
 */
 
 •	./middleware/Authorization.js
/**
 *@swagger
 * components:
 *  responses:
 *      mustBeManager:
 *          description: L'action demandée ne peut être réalisée que par un manager
 */


```

