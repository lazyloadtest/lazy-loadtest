#!/bin/bash
ENDUSER=$(id -u -n 1000)
GITPATH=/home/$ENDUSER/lazy-loadtest
cp $GITPATH/distress/user-crontab /var/spool/cron/$ENDUSER
chown $ENDUSER.$ENDUSER /var/spool/cron/$ENDUSER
runuser -l $ENDUSER -c 'sh '$GITPATH'/distress/run_distress.sh'
