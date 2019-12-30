## Accès Bases de données 

### Sécurité contre les injections

```php
$origine = htmlentities($_SERVER["HTTP_REFERRER"]);
```

