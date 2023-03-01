#!/bin/bash
export SHELL="/bin/bash"
cd /opt/misskey
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=CO/L=Denver/O=$ENDPOINT/CN=$ENDPOINT" -keyout /etc/ssl/certs/privkey.key -out /etc/ssl/certs/fullchain.crt
sed -i "s/ENDPOINT/${ENDPOINT}/g" /opt/misskey/.config/default.yml
sed -i "s/changeDATABASE/${DATABASE_HOST}/g" /opt/misskey/.config/default.yml
sed -i "s/misskeyDATABASE/${DB_NAME}/g" /opt/misskey/.config/default.yml
sed -i "s/example-misskey-user/${DB_USERNAME}/g" /opt/misskey/.config/default.yml
sed -i "s/example-misskey-pass/${DB_PASSWORD}/g" /opt/misskey/.config/default.yml
sed -i "s/ENDPOINT/${ENDPOINT}/g" /etc/nginx/sites-enabled/misskey.conf
cp -f /usr/share/zoneinfo/US/Mountain /etc/localtime
yarn run init