#!/bin/bash
# Generar un backup de la base de datos en el directorio
mysqldump -u 'usuario' \
	-p'secreto' redmine > /opt/redmine-4.0.X-$(date -I).sql

# TO-DO: Si existe el parametro "--full", generar un backup del sistema completo, con archivos subidos por usuarios
# cd /opt; tar -zcvf ~/bck_full_$(date -I).tgz ./redmine-4.0.X/ ./redmine-4.0.X-$(date -I).sql 
# TO-DO: Si existe el parametro "--sys", generar un backup del sistema sin los archivos subidos por usuarios
# cd /opt; tar -zcvf ~/bck_nofiles_$(date -I).tgz ./redmine-4.0.X/ ./redmine-4.0.X-$(date -I).sql --exclude=redmine-4.0.X/files/*

# Si no existe el parametro, sólo almacenar archivos de configuracion, archivos
# subidos y la base de datos
cd /opt; tar -zcvf ~/bck_files_$(date -I).tgz \
	./redmine-4.0.X/config/database.yml \
	./redmine-4.0.X/config/configuration.yml \
	./redmine-4.0.X/files/* \
       	./redmine-4.0.X-$(date -I).sql
