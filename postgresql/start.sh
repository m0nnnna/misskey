#!/bin/bash
export SHELL="/bin/bash"
FILE='/configured.txt'

#Set Permissions
chmod -R 777 /saves

#Configure Local Time
cp -f /usr/share/zoneinfo/US/Mountain /etc/localtime

#Start Cron and Postgresql
crond
su postgres -s $SHELL -lc "pg_ctl start -D /var/lib/postgresql/data"

#Restore latest Database if container is new
if [ ! -f "$FILE" ]
then
#bash /restore.sh
bash /setup.sh
touch /configured.txt
fi

tail -f /dev/null