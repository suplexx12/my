#!/bin/bash
#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'
fi
echo "Syncing 5 node, please wait...";
northernd -datadir=/home/northern5/.northern -daemon
sleep 10 
until northern-cli -datadir=/home/northern5/.northern mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Last node is fully synced. You 5 masternode is running!"${NC}
sleep 10
echo "Syncing 6 node, please wait...";
northernd -datadir=/home/northern6/.northern -daemon
sleep 10 
until northern-cli -datadir=/home/northern6/.northern mnsync status | grep -m 1 '"IsBlockchainSynced": true,'; do sleep 1 ; done > /dev/null 2>&1
echo -e ${GREEN}"Last node is fully synced. You 6 masternode is running!"${NC}
echo ""
echo -e ${GREEN}"Congrats! Your NORT Masternodes are now installed and started. Please wait from 10-20 minutes in order to give the masternode enough time to sync, then start the node from your wallet, Debug console option"${NC}
echo "The END. You can close now the SSH terminal session";
