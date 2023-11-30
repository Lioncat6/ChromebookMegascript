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
#######################spell
#Set some variables to get this ball rolling

CBMS_VERSION='0.0.1'
CBMS_DATE='11/29/23'

#check for internet
echo -e "GET http://github.com HTTP/1.0\n\n" | nc github.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    true
else
    echo "Cannot establish a connection to GitHub! Aborting..."
    exit 0
fi
