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

CBMS_VERSION='0.0.1'
CBMS_DATE='11/29/23'
CBMS_URL='https://raw.githubusercontent.com/Lioncat6/ChromebookMegascript/master/'
#clear screen
printf "\ec"

#check for internet
echo -e "GET http://github.com HTTP/1.0\n\n" | nc github.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    true
else
    echo -e "Cannot establish a connection to GitHub!\nAborting..."
    exit 0
fi

#Download other scripts
cd /tmp
echo -e "Downloading menu..."
rm ./menu.sh
curl -O ${CBMS_URL}menu.sh
echo -e "Downloading other files..."
#Nothing else to download at the moment :p

source ./menu.sh