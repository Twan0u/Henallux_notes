# Cours SGBDA  : Les backups 

## Microsoft full Database Backup 

![](https://docs.microsoft.com/en-us/sql/relational-databases/backup-restore/media/bnr-rmsimple-1-fulldb-backups.gif?view=sql-server-ver15)

Au plus l'intervalle entre 2 backups est élevé, au plus le risque de perdre des données est grand

```sql
BACKUP DATABASE MaDatabase 
    TO DISK = 'Z:\SQLServerBackups\AdventureWorksSimpleRM.bak'   
    WITH FORMAT;  
GO  
```

> WITH FORMAT  :  réécrit le backup précédent si il en existe déjà un

## Database Backups Under the Full Recovery Model

![](https://docs.microsoft.com/en-us/sql/relational-databases/backup-restore/media/bnr-rmfull-1-fulldb-log-backups.gif?view=sql-server-ver15)

Pour les bases de données qui utilisent (full and bulk-logged recovery). Il faut aussi se souvenir des logs de transaction . 



```sql
USE master;  
ALTER DATABASE AdventureWorks2012 SET RECOVERY FULL;  
GO  
-- Back up the AdventureWorks2012 database to new media set (backup set 1).  
BACKUP DATABASE AdventureWorks2012  
  TO DISK = 'Z:\SQLServerBackups\AdventureWorks2012FullRM.bak'   
  WITH FORMAT;  
GO  
--Create a routine log backup (backup set 2).  
BACKUP LOG AdventureWorks2012 TO DISK = 'Z:\SQLServerBackups\AdventureWorks2012FullRM.bak';  
GO  
```

## Procédure de reprise

Si le serveur vient de crasher, que va-t-il se passer au redémarrage ? 

Quelles données reste-il encore sur le disque ? qu'est ce qui à pu être / pas être sauvegardé ? 

## Gestion de L'espace Disque 

à quoi faut-il faire attention ? Quels options sont possibles pour les backups ?