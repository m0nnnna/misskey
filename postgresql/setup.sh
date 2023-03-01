#!/bin/bash
export SHELL="/bin/bash"

#Database Setup
mkdir /run/postgresql
#mkdir -p /var/lib/postgresql/13/main
chown -R postgres:postgres /run/postgresql/
chown -R postgres:postgres /var/lib/postgresql
chown -R postgres:postgres /var/log/postgresql
#su postgres -s $SHELL -lc "mkdir /var/lib/postgresql/data;chmod 0700 /var/lib/postgresql/13/main"
su postgres -s $SHELL -lc "initdb --auth-host=trust -D /var/lib/postgresql/data"
cp -f /etc/postgresql.conf /var/lib/postgresql/data/
echo "host  all  all 0.0.0.0/0 md5" >> /var/lib//postgresql/data/pg_hba.conf
chown -R postgres:postgres /var/lib/postgresql
su postgres -s $SHELL -lc  "pg_ctl start -D /var/lib/postgresql/data"
sleep 5
echo "create user root with encrypted password 'sql';"| su postgres -s $SHELL -lc psql
echo "ALTER ROLE root SUPERUSER;" | su postgres -s $SHELL -lc psql
echo "CREATE DATABASE misskey  with template = template0 OWNER = root ENCODING = 'UTF8';" | su postgres -s $SHELL -lc psql
echo "grant all privileges on database misskey to root;" | su postgres -s $SHELL -lc psql
touch /configured.txt

