#!/bin/bash
ENDUSER=$(id -u -n 1000)
GITPATH=/home/$ENDUSER/lazy-loadtest
cp $GITPATH/disbalancer/user-crontab /var/spool/cron/$ENDUSER
chown $ENDUSER.$ENDUSER /var/spool/cron/$ENDUSER
runuser -l $ENDUSER -c 'docker-compose -f '$GITPATH'/disbalancer/docker-compose.yml up -d'
/usr/bin/docker exec openvpn-client apk add curl
