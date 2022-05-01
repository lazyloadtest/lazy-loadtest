#!/bin/bash
ENDUSER=$(id -u -n 1000)
GITPATH=/home/$ENDUSER/lazy-loadtest
cp $GITPATH/mhddos_proxy/user-crontab /var/spool/cron/$ENDUSER
chown $ENDUSER.$ENDUSER /var/spool/cron/$ENDUSER
runuser -l $ENDUSER -c 'sh '$GITPATH'/mhddos_proxy/run_mhddos.sh'
