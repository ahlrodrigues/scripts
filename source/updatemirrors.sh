#!/bin/bash

# --------- Cores  --------- #
BLACK='\e[1;30m'
BBLACK='\e[5;30m'
RED='\e[1;31m'
BRED='\e[5;31m' # bink color
GREEN='\e[1;32m'
BGREEN='\e[1;32m'
BROWN='\e[1;33m'
BBROWN='\e[5;33m'
BLUE='\e[1;34m'
BBLUE='\e[5;34m'
PINK='\e[1;35m'
BPINK='\e[5;35m'
CYAN='\e[1;36m'
BCYAN='\e[5;36m'
WHITE='\e[1;37m'
BWHITE='\e[5;37m'
NC='\033[0m' # reset/no color

if [[ $(whoami) == "root" ]]; then
echo
echo
echo -e "$BROWN Verificando mirror CURRENT! $NC"
echo
echo
mirror-slackware64-current.sh
echo
echo
echo

echo
echo
echo -e "$BROWN Verificando mirror ARM! $NC"
echo
echo
mirror-slackwarearm-current.sh
echo
echo
echo

echo
echo
echo -e "$BROWN Verificando mirror KTOWN! $NC"
echo
echo
ktown.sh
echo
echo
echo
echo
echo
echo -e "$BGREEN MIRRORS ATUALIZADOS! $NC"
echo
echo

else

echo
echo
echo -e "$BRED Logue-se como ROOT! $NC"
echo
echo

fi
