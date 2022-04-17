#!/bin/bash
ENDUSER=$(id -u -n 1000)
GITPATH=/home/$ENDUSER/lazy-loadtest
cp $GITPATH/disbalancer/user-crontab /var/spool/cron/$ENDUSER
chown $ENDUSER.$ENDUSER /var/spool/cron/$ENDUSER
cat $GITPATH/common/common-compose.yml $GITPATH/disbalancer/disbalancer-compose.yml >> /home/$ENDUSER/docker-compose.yml
chown -R $ENDUSER.$ENDUSER /home/$ENDUSER
/usr/bin/docker exec openvpn-client apk add curl
