#!/bin/bash


# I have attempted many ways to get this to not prompt for a password and have not gotten it to work.
DBNAME="project_db"
DBADMIN="postgres"
DBPASS="pwd"

PGPASSINFO="localhost:*:project_db:postgres:pwd"
if [ ! -f .pgpass ]; then
	touch .pgpass
	chmod 0600 .pgpass
	echo $PGPASSINFO >> .pgpass
fi
# SQL="SET group_concat_max_len = 10240;"
# SQL="${SQL} SELECT GROUP_CONCAT(table_name separator ' -t ')"
# SQL="${SQL} FROM information_schema.tables WHERE table_schema='${DBNAME}'"
# SQL="${SQL} AND table_name IN ('Enjoyer', 'Achievement', 'EnjoyerAchievement', 'Exercise', 'ExerciseIntent', 'ExerciseActual');"

# TBLIST=``
TBLIST="-t Enjoyer -t Achievement -t EnjoyerAchievement -t Exercise -t ExerciseIntent -t ExerciseActual"

# Saves all tables
 pg_dump -U $DBADMIN  $TBLIST -h localhost -d $DBNAME  > all_tables.sql

# Restores tables
psql -U $DBADMIN -d $DBNAME -f all_tables.sql
