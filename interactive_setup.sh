#!/bin/bash
# Check that script is being run as su
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
# Digital Ocean does not create a normal user by default
CreateUser()
{
	useradd loadtest_user
	mkdir /home/loadtest_user/.ssh
	chmod 0700 /home/loadtest_user/.ssh/
	cp -Rfv /root/.ssh /home/loadtest_user/
	chown -Rfv loadtest_user.loadtest_user /home/loadtest_user/.ssh
	chown -R loadtest_user:loadtest_user /home/loadtest_user/
	gpasswd -a loadtest_user sudo
	echo "loadtest_user ALL=(ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)
	service ssh restart
	usermod -s /bin/bash loadtest_user
}
if [ ! $(grep 1000 /etc/passwd)  ]
then
	CreateUser
fi
# Set environment variables
ENDUSER=$(id -u -n 1000)
GITPATH=/home/$ENDUSER/lazy-loadtest

# Pull in VPN password and config files here

sh $GITPATH/common/docker_setup.sh

# Interactive menu to pick loadtest type
menu(){
echo -ne "
Select a loadtest type 
'1)') mhddos_proxy
'2)') db1000n
'3)') disbalancer
'0)') Exit "
    read a
    case $a in
	    1) echo "setting up mhddos" ; sh $GITPATH/mhddos_proxy/mhddos_setup.sh ; exit 0 ;;
	    2) echo "setting up db1000n" ; sh $GITPATH/db1000n/db1000n_setup.sh ; exit 0 ;;
	    3) echo "setting up disbalancer" ; sh $GITPATH/disbalancer/disbalancer_setup.sh ; exit 0 ;;
		0) exit 0 ;;
		*) echo -e $red"invalid option."$clear; menu;;
    esac
}
menu