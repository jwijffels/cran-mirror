#!/bin/bash

USER=${USER:=rstudio}
PASSWORD=${PASSWORD:=rstudio}
EMAIL=${EMAIL:=bnosac-r-common@example.com}
USERID=${USERID:=1000}
ROOT=${ROOT:=TRUE}

userdel docker
useradd -m $USER -u $USERID 
echo "$USER:$PASSWORD" | chpasswd
mkdir /home/$USER 
chown $USER:$USER /home/$USER

## Make sure user has write access to /usr/local/lib/R/site.library
addgroup $USER staff

## Configure git 
echo -e "[user]\n\tname = $USER\n\temail = $EMAIL\n\n[credential]\n\thelper = cache\n\n[push]\n\tdefault = simple\n\n[core]\n\teditor = vim\n" > /home/$USER/.gitconfig

## Global config make page-up/down search history
## echo '"\e[5~": history-search-backward' >> /etc/inputrc && echo '"\e[6~": history-search-backward' >> /etc/inputrc

# Use Env flag to know if user should be added to sudoers
if [ "$ROOT" == "TRUE" ]; then
  adduser $USER sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
fi

