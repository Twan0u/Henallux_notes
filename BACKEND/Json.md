# Json

## Data

```json
"key" : value;
"nom" : "string";
"age" : 23;
```

## Object

```
{"key":"value", "key":value}
```

## Array

fonctionne avec des objets et des valeurs seules

```
"key" : [
{obj},
{obj}
] 

"films" : [
{"nom" : "Star Wars 1"},
{"nom" : "Star Wars 2"}
] 
```



## Conversion Javascript

On utilise la méthode JSON.parse();

```
let monObjet = JSON.parse(text);
```

