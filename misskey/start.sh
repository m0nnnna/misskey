#!/bin/bash
SHELL="/bin/bash"
MISSKEY='/opt/misskey'
FILE='/configured.txt'

cd $MISSKEY

redis-server --protected-mode no --daemonize yes

sleep 30

if [ ! -f "$FILE" ]
then
    bash /opt/setup.sh
    touch /configured.txt
fi

nginx&
NODE_ENV=production npm start
tail -f /dev/null
