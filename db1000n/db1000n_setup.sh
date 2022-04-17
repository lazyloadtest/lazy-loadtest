#!/bin/bash
ENDUSER=$(id -u -n 1000)
GITPATH=/home/$ENDUSER/lazy-loadtest
sudo yum install docker -y
sudo usermod -aG docker $ENDUSER
sudo systemctl enable docker.service docker.socket
sudo systemctl restart docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
mkdir /home/$ENDUSER/secrets
mkdir -p /home/$ENDUSER/docker/openvpn
cp $GITPATH/db1000n/user-crontab /var/spool/cron/$ENDUSER
cp $GITPATH/vpn/provider_*.conf /home/$ENDUSER/docker/openvpn/
cp $GITPATH/vpn/provider_secret /home/$ENDUSER/secrets/
chown -R $ENDUSER.$ENDUSER /home/$ENDUSER
chown $ENDUSER.$ENDUSER /var/spool/cron/$ENDUSER
runuser -l $ENDUSER -c 'docker-compose -f '$GITPATH'/db1000n/docker-compose.yml up -d'
/usr/bin/docker exec openvpn-client apk add curl
