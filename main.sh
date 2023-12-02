#!/bin/bash
#######################
# ChomebookMegascript
#
# This script is a combination of other scripts
# that I've found in various parts of the web 
# and will be properly credited in their respective spots.
#  
# Disclaimer: 
# I am not responsible for any damage or bricking of your device
# By using this script, you acknowledge this.
#
# Created by Lioncat6:
# https://github.com/Lioncat6
#
# Inspired by MrChromebox's scripts
#
#######################
#Set some variables to get this ball rolling

CBMS_DATE='12/2/23'
CBMS_URL='https://raw.githubusercontent.com/Lioncat6/ChromebookMegascript/master/'
#clear screen
printf "\ec"

echo -e "Chromebook Megascript - last updated ${CBMS_DATE}"
sleep 2

#check superuser
if [ "$EUID" -ne 0 ]
    then echo -e "\033[0;91mThis script requires root to function. Please rerun as superuser or using sudo"
    sleep 2 
    exit
fi

echo -e "Checking connection to github..."
#check for internet
function noInternet(){
    echo -e "Cannot establish connection to github!\nAborting..."
    exit
}

curl -s https://github.com  > /dev/null || noInternet 

echo -e "Proceeding..."
#Move into a temp direcotry cause why not.
cd /tmp
#Download other scripts
echo -e "Downloading menu..."
rm ./menu.sh
curl -sLO ${CBMS_URL}menu.sh
echo -e "Downloading other files..."
#Nothing else to download at the moment :p

source ./menu.sh
