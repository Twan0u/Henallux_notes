# Faille XSS

Eviter que l'on puisse injecter du js et du html dans les champs remplis par l'utilisateur on rends les inputs de l'utilisateur incapacitants

```php
htmlspecialchars($_GET['nom']);
```
