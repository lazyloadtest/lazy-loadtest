#!/bin/bash
ENDUSER=$(id -u -n 1000)
GITPATH=/home/$ENDUSER/lazy-loadtest
sudo groupadd docker
sudo yum install docker -y
sudo usermod -aG docker $ENDUSER
sudo systemctl enable docker.service docker.socket
sudo systemctl restart docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
mkdir /home/$ENDUSER/secrets
mkdir -p /home/$ENDUSER/docker/openvpn
cp $GITPATH/vpn/provider_*.conf /home/$ENDUSER/docker/openvpn/
cp $GITPATH/vpn/provider_secret /home/$ENDUSER/secrets/
