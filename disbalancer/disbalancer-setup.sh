#!/bin/bash
# need to modify runuser line if not on ec2 as variables does not parse
sudo yum install docker -y
sudo usermod -aG docker $ENDUSER
sudo systemctl enable docker.service docker.socket
sudo systemctl restart docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
chown $ENDUSER.$ENDUSER /var/spool/cron/$ENDUSER
runuser -l $ENDUSER -c 'docker-compose -f '$GITPATH'/disbalancer/docker-compose.yml up -d'
/usr/bin/docker exec openvpn-client apk add curl
