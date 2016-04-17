# Liquibase

Proyecto base de ejemplo de versionado de base de datos (MySQL) con Liquibase.

```
mvn liquibase:update
```

Ejecuta todos los changeSet definidos en masterchangelog.xml
De ser la primera ejecución creará las tablas:
- DATABASECHANGELOG. Guarda el historial de la Base de Datos.
- DATABASECHANGELOGLOCK. Guarda el "lock" que utiliza liquibase al ejecutarse (bloqueo tipo semáforo).


```
mvn liquibase:rollback -Dliquibase.rollbackTag=tag
```

Ejecuta el rollback de la base de datos hasta (inclusive) el changeset al cual pertenece el tag especificado en el comando.


```
mvn liquibase:updateSQL
```

Creará los scripts indicados en el masterchangelog. Lo anterior es incremental, es decir, solo creará scripts para los cambios no efectuados en la base de datos.


```
mvn liquibase:rollbackSQL -Dliquibase.rollbackTag=tag
```

Creará los scripts de rollback de la base de datos. Hasta (inclusive) el changeset al cual pertenece el tag especificado en el comando.


### NOTA

Para una base de datos ya existente, primero se debe realizar lo siguiente:
1. Generar los script que emulen el estado actual de la base de datos.
2. Ejecutar mvn liquibase:changelogSync. Esto creará las tablas DATABASECHANGELOG y DATABASECHANGELOGLOCK con el estado actual.