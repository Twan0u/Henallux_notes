# Structured Querry language (SQL)
## Basic Select Statements
``` SQL
SELECT ...
FROM ...
WHERE ...
```
### SELECT

* **ALL** : \*
* **Collumn** : departement_id, name_id
* **Operations** : 12*salary+100 (+-\*/)

> Une valeur Nulle dans un calcul mets le resultat à null
> On peut renomer une colonne  (ex : ..., salary*12 'Annual Salary')
> Concaténation avec || ( ex : name || ' is an '|| type as "PLAYERS")
> date et char doivent êtres entourés avec des simples ''

**DISTINCT** devant une colonne est utilisé pour éviter les doublons dans la réponse de la requête

### FROM

Nom de la table dans laquelle trouver les informations

### WHERE

WHERE est une instruction utilisée pour poser des conditions d'une requête SQL
