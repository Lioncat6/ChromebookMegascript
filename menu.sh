#!/bin/bash
#Color codes:
# Reset#Download other scripts
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

#Vars
CBMS_LOGO="
      ******  ******         ****     ****  ********
     **////**/*////**       /**/**   **/** **////// 
    **    // /*   /**       /**//** ** /**/**       
   /**       /******   *****/** //***  /**/*********
   /**       /*//// **///// /**  //*   /**////////**
   //**    **/*    /**      /**   /    /**       /**
    //****** /*******       /**        /** ******** 
     //////  ///////        //         // ////////  
"
CBMS_LOGO_COLOR=${IGreen}
CBMS_MENU_COLOR=${Cyan}

CBMS_MENU_DIV=${CBMS_MENU_COLOR}"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&${Color_Off}"

# Function to quicly clear the terminal
function cls(){
      printf "\ec"
}


function disclaimer(){
      cls
      echo -e "${BIRed}Disclaimer:${Color_Off}"
      echo -e "${IWhite}I am not responsible for any damage or bricking of your device${Color_Off}"
      echo -e "${IWhite}Please type ${BIPurple}I ACCEPT${IWhite} to continue or ${BIPurple}Control+C${IWhite} to cancel${Color_Off}"
      read -re disclaimerResponse
      case "$disclaimerResponse" in
            "I ACCEPT")
                  true
                  ;;
            *)
                  cls
                  echo -e ${BIRed}"Try again or press ${BIPurple}Control+C${BIRed} to cancel${Color_Off}"
                  sleep 2
                  disclaimer
                  ;;
      esac

}

function requiresCustomFirmware(){
      cls
      echo -e "${BIGreen}Note:${Color_Off}"
      echo -e "${IWhite}This option requires you to be running an OS other than ChromeOS${Color_Off}"
      echo -e "${IWhite}If you are still inside ChromeOS, please run the Firmware script and install another operating system${Color_Off}"
      echo -e "${IWhite}Press${BIPurple} Enter${IWhite} to continue${Color_Off}"
      read -re
}

function downloadError(){
      echo -e "${BIRed}There was an problem downloading files${Color_Off}"
      echo -e "${IWhite}Press${BIPurple} Enter${IWhite} to continue${Color_Off}"
      read -re
}

function mrChromebox(){
      disclaimer
      cls
      echo -e "Loading Mr Chromebox's Firmware Utility Script..."
      sleep 1
      cd; curl -LOk mrchromebox.tech/firmware-util.sh || downloadError 
      sudo bash firmware-util.sh 
      mainMenu
}

function WeirdTreeThing(){
      requiresCustomFirmware
      disclaimer
      cls
      echo -e "Loading WeirdTreeThing's Audio Script..."
      sleep 1
      rm -rf chromebook-linux-audio
      git clone https://github.com/WeirdTreeThing/chromebook-linux-audio || downloadError
      cd chromebook-linux-audio 
      cls
      echo -e "${BIWhite}For support please see ${UWhite}https://github.com/WeirdTreeThing/chromebook-linux-audio${Color_Off}"
      ./setup-audio 
      mainMenu

}
function remapKeys(){
      requiresCustomFirmware
      disclaimer
      cls
      echo -e "Loading Chromeos Key Remapping Script..."
      sleep 1
      rm -rf remap-util
      git clone https://github.com/Lioncat6/remap-util || downloadError
      cd remap-util 
      cls
      #echo -e "${BIWhite}For support please see ${UWhite}https://github.com/Lioncat6/remap-util${Color_Off}"
      sudo bash remap-util.sh 
      mainMenu
}

function helpMenu(){
      cls
      echo -e "${BIGreen}Help Menu Coming soon..."
      sleep 2
      mainMenu
}

#Print Menu
function mainMenu() {
      cls
      echo -e "${CBMS_MENU_DIV}"
      echo -e ${CBMS_LOGO_COLOR}"${CBMS_LOGO}${Color_Off}"
      echo -e "   ${UWhite}Chomebook Megascript by Lioncat6${White} - [${CBMS_DATE}]${Color_Off}"
      echo -e "${CBMS_MENU_DIV}"
      echo -e ${CBMS_MENU_COLOR}"&${Color_Off}   ${BIPurple}1)${IYellow} Replace Firmware ${Yellow}using Mr Chomebox's Firmware Utility Script${Color_Off}"
      echo -e ${CBMS_MENU_COLOR}"&${Color_Off}   ${BIPurple}2)${IYellow} Fix sound ${Yellow}using WeirdTreeThing's Script${Color_Off}"
      echo -e ${CBMS_MENU_COLOR}"&${Color_Off}   ${BIPurple}3)${IYellow} Map top-row keys ${Color_Off}"
      echo -e ${CBMS_MENU_COLOR}"&${Color_Off}   -${Color_Off}"
      echo -e ${CBMS_MENU_COLOR}"&${Color_Off}   ${BICyan}H)${IWhite} Help${Color_Off}"
      echo -e ${CBMS_MENU_COLOR}"&${Color_Off}   -${Color_Off}"
      echo -e ${CBMS_MENU_COLOR}"&${Color_Off}   ${BIRed}R)${IWhite} Reboot${Color_Off}"
      echo -e ${CBMS_MENU_COLOR}"&${Color_Off}   ${BIRed}P)${IWhite} Power Off${Color_Off}"
      echo -e ${CBMS_MENU_COLOR}"&${Color_Off}   ${BIRed}Q)${IWhite} Quit${Color_Off}"
      echo -e "${CBMS_MENU_DIV}"
      echo -e "${Yellow}Select one of the above options:${Color_Off}"
      read -re response
      case $response in 
            1)
            mrChromebox
            ;;
            2)
            WeirdTreeThing
            ;;
            3)
            remapKeys
            ;;
            H)
            helpMenu
            ;;
            "Q")
            exit
            ;;
            "P")
            sudo shutdown -h now
            ;;
            "R")
            sudo reboot
            ;;
            *)
            mainMenu
            ;;
      esac


}
mainMenu
