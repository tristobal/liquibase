#!/bin/bash

UNAPPLIED_FILES=`mvn liquibase:status -Pbeta | grep 'src\/main\/resources\/db'`
FIRST_UNAPPLIED_FILE=`echo $UNAPPLIED_FILES | awk -F:: '{print $1}'`
if [[ -z "$FIRST_UNAPPLIED_FILE" ]]
then
  echo "No se encontró TAG de Liquibase."
  rm -f propfile
else
  TAG=`cat "./$FIRST_UNAPPLIED_FILE" | grep 'tagDatabase' | awk -F= '{print $2}' | awk -F\" '{print $2}'`
  echo "Se encontró TAG de Liquibase -> $TAG"
  echo "LIQUIBASE_TAG=$TAG" > propfile
fi
