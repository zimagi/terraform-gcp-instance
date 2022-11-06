#!/bin/bash

INIT_LOG="/root/init.log"
ZIMAGI_LOG="/home/${user}/zimagi-setup.log"


echo "Initializing system" | tee -a "$INIT_LOG"
apt-get update >>"$INIT_LOG" 2>&1
apt-get upgrade >>"$INIT_LOG" 2>&1
apt-get autoremove >>"$INIT_LOG" 2>&1


echo "Initializing user: ${user}" | tee -a "$INIT_LOG"
useradd -m ${user} >>"$INIT_LOG" 2>&1
groupadd -r docker >>"$INIT_LOG" 2>&1

usermod -a -G sudo ${user} >>"$INIT_LOG" 2>&1
usermod -a -G docker ${user} >>"$INIT_LOG" 2>&1


echo "Installing package dependencies" | tee -a "$INIT_LOG"
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common >>"$INIT_LOG" 2>&1


echo "Installing Git" | tee -a "$INIT_LOG"
apt-get install -y git >>"$INIT_LOG" 2>&1


echo "Installing Docker" | tee -a "$INIT_LOG"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg >>"$INIT_LOG" 2>&1
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update >>"$INIT_LOG" 2>&1
apt-get install -y docker-ce >>"$INIT_LOG" 2>&1


echo "Initializing Zimagi" | tee -a "$INIT_LOG"
su - ${user} -c "git clone https://github.com/zimagi/zimagi.git ~/zimagi >>"$ZIMAGI_LOG" 2>&1"
su - ${user} -c "~/zimagi/reactor init >>"$ZIMAGI_LOG" 2>&1"
su -P - ${user} -c "~/zimagi/zimagi env get >>"$ZIMAGI_LOG" 2>&1"

su - ${user} -c "echo 'source ~/zimagi/reactor' >> ~/.bashrc"
su - ${user} -c "echo 'Zimagi startup complete' >>"$ZIMAGI_LOG""
