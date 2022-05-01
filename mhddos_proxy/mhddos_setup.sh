#!/bin/bash
ENDUSER=$(id -u -n 1000)
GITPATH=/home/$ENDUSER/lazy-loadtest
runuser -l $ENDUSER -c 'sh '$GITPATH'/mhddos_proxy/run_mhddos.sh'
