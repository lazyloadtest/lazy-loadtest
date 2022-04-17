# add your own configs to a vpn directory under here
ENDUSER=$(id -u -n 1000)
rm -rf /home/$ENDUSER/lazy-loadtest/vpn
cp -r /home/$ENDUSER/lazy-loadtest-private/vpn /home/$ENDUSER/lazy-loadtest
