#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${NC}
  exit 1
fi

echo -e ${YELLOW}"Welcome to the Northern Automated Install, Durring this Process Please Hit Enter or Input What is Asked."${NC}
echo
echo -e ${YELLOW}"You Will See alot of code flashing across your screen, don't be alarmed it's supposed to do that. This process can take up to an hour and may appear to be stuck, but I can promise you it's not."${NC}
echo
echo -e ${GREEN}"Are you sure you want to install a Northern Masternode? type y/n followed by [ENTER]:"${NC}
read AGREE

echo -e ${GREEN}"Please Enter Your Masternodes Private Key for 6th node:"${NC}
read privkey6

echo -e "${GREEN}Configuring Wallet for 6th node${NC}"
sudo mkdir /home/northern6/.northern
sudo touch /home/northern6/.northern/northern.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /home/northern6/.northern/northern.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /home/northern6/.northern/northern.conf
echo "rpcallowip=127.0.0.1" >> /home/northern6/.northern/northern.conf
echo "server=1" >> /home/northern6/.northern/northern.conf
echo "daemon=1" >> /home/northern6/.northern/northern.conf
echo "maxconnections=250" >> /home/northern6/.northern/northern.conf
echo "masternode=1" >> /home/northern6/.northern/northern.conf
echo "rpcport=6946" >> /home/northern6/.northern/northern.conf
echo "listen=0" >> /home/northern6/.northern/northern.conf
echo "externalip=$(hostname  -I | cut -f1 -d' '):6942" >> /home/northern6/.northern/northern.conf
echo "masternodeprivkey=$privkey4" >> /home/northern6/.northern/northern.conf
echo "addnode=209.250.233.104" >> /home/northern6/.northern/northern.conf
echo "addnode=45.77.82.101" >> /home/northern6/.northern/northern.conf
echo "addnode=138.68.167.127" >> /home/northern6/.northern/northern.conf
echo "addnode=207.246.86.118" >> /home/northern6/.northern/northern.conf
echo "addnode=149.56.4.247" >> /home/northern6/.northern/northern.conf
echo "addnode=149.56.4.246" >> /home/northern6/.northern/northern.conf
echo "addnode=149.56.4.245" >> /home/northern6/.northern/northern.conf
echo "addnode=149.56.4.244" >> /home/northern6/.northern/northern.conf
echo "addnode=149.56.4.243" >> /home/northern6/.northern/northern.conf
echo "addnode=149.56.4.242" >> /home/northern6/.northern/northern.conf
echo "addnode=149.56.4.241" >> /home/northern6/.northern/northern.conf
sleep 5 
fi

sleep 10
echo "Syncing fourth node, please wait...";
northernd -datadir=/home/northern6/.northern -daemon
sleep 10 
until northern-cli -datadir=/home/northern6/.northern mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Last node is fully synced. You fourth masternode is running!"${NC}
echo ""
echo -e ${GREEN}"Congrats! Your NORT Masternodes are now installed and started. Please wait from 10-20 minutes in order to give the masternode enough time to sync, then start the node from your wallet, Debug console option"${NC}
echo "The END. You can close now the SSH terminal session";
